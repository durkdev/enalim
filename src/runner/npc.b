def convertNpc(x, y, z, name) {
    # remove the creature
    id := "c." + x + "." + y + "." + z;
    c := array_find(creatures, c => c.id = id);
    if(c = null) {
        return;
    }

    ox := c.move.x;
    oy := c.move.y;
    oz := c.move.z;
    c.move.erase();
    array_remove(creatures, cc => {
        return cc.id = c.id;
    });

    # is it an npc?
    npc := npcDefs[name];
    if(npc = null) {
        # convert  to monster
        c := setCreature(x, y, z, creaturesTemplates[name]);
    } else {
        # convert to npc
        c := setNpc(x, y, z, npc);
    }
    c.move.erase();
    c.move.set(ox, oy, oz);
    c.move.setShape(c.move.shape);
}

def registerNpc(npc) {
    npc.creature := creaturesTemplates[npc.creature];
    
    # assign a pos if one is not given
    if(npc.schedule[0].pos = null) {
        w := npc.waypoints;
        if(npc.schedule[0].waypointDir = 1) {
            npc.schedule[0].pos := w[len(w) - 1];
        } else {
            npc.schedule[0].pos := w[0];
        }
    }
    npcDefs[npc.name] := npc;
}

def setNpc(x, y, z, npc) {
    creature := setCreature(x, y, z, npc.creature);
    creature.npc := npc;
    return creature;
}

def getNpc(x, y, z) {
    c := getCreature(x, y, z);
    if(c != null) {
        return c.npc;
    }
    return null;
}

# prepare npc to be saved
def encodeNpc(npc) {
    if(npc = null) {
        return {};
    }
    print("* Saving npc " + npc.name);
    o := {
        "name": npc.name
    };
    if(npc.tradeInv != null) {
        o.tradeInv := array_map(npc.tradeInv, item => item.name);
    }
    return o;
}

# restore npc from saved copy
def decodeNpc(savedNpc) {
    if(savedNpc["name"] = null) {
        return null;
    }
    print("* Restoring npc " + savedNpc.name);
    n := npcDefs[array_find(keys(npcDefs), k => npcDefs[k].name = savedNpc.name)];
    if(savedNpc.tradeInv != null) {
        n.tradeInv := array_map(savedNpc.tradeInv, itemName => array_find(OBJECTS, o => o.name = itemName));
    }
    return n;
}

def evalNpcSchedules(hour) {
    array_foreach(creatures, (i, c) => {
        if(c.npc != null && c.npc.partyIndex = null) {
            if(c.npc["schedule"] != null) {
                index := array_find_index(c.npc.schedule, sched => {
                    if(sched.from < sched.to) {
                        return hour >= sched.from && hour < sched.to;
                    } else {
                        return hour >= sched.from || hour < sched.to;
                    }
                });
                if(index != c.npc["activeSchedule"]) {
                    c.npc["activeSchedule"] := index;
                    c.npc["activeScheduleChange"] := true;
                    c.npc["waypointIndex"] := getClosestWaypointIndex(c);
                    #print(c.npc.name + " active schedule is now:" + c.npc.activeSchedule);
                }
            }
        }
    });
}

def getClosestWaypointIndex(c) {
    if(c.npc.waypoints = null) {
        return 0;
    }
    closest := [];
    array_foreach(c.npc.waypoints, (i, w) => {
        d := distance(w[0], w[1], w[2], c.move.x, c.move.y, c.move.z);
        if(len(closest) = 0 || closest[1] > d) {
            closest[0] := i;
            closest[1] := d;
        }
    });
    return closest[0];
}

def moveNpc(c, delta) {
    if(c.npc.partyIndex != null) {
        return moveNpcNearPlayer(c, delta);
    } else {
        animation := moveNpcSchedule(c, delta);
        if(animation != null) {
            return animation;
        }
        return moveCreatureRandom(c, delta);
    }
}

def getNpcPartyOffset(c) {
    partyDx := 0;
    partyDy := 0;
    if(player.move.dir = DIR_W) {
        partyDx := -2;
    } else if(player.move.dir = DIR_E) {
        partyDx := 3;
    } else if(player.move.dir = DIR_N) {
        partyDy := 3;
    } else if(player.move.dir = DIR_S) {
        partyDy := -2;
    } else if(player.move.dir = DIR_NW) {
        partyDx := -2;
        partyDy := 3;
    } else if(player.move.dir = DIR_NE) {
        partyDx := 3;
        partyDy := 3;
    } else if(player.move.dir = DIR_SW) {
        partyDx := -2;
        partyDy := -2;
    } else if(player.move.dir = DIR_SE) {
        partyDx := 3;
        partyDy := -2;
    }
    return [ partyDx, partyDy ];
}

def moveNpcNearPlayer(c, delta) {
    partyOffset := getNpcPartyOffset(c);
    destX := player.move.x + partyOffset[0];
    destY := player.move.y + partyOffset[1];
    destZ := player.move.z;

    if(c.onPath = true) {
        return pathMove(c, delta, {
            name: c.npc.name, 
            dest: { "x": destX, "y": destY, "z": destZ }, 
            nearDistance: 2,
            farDistance: 0,
            largeBreak: self => random(),
            smallBreak: self => random() * 0.25,
            tempMove: (self, c, delta) => {
                c.onPath := false;
                return ANIM_STAND;
            },
            onDistance: (self, d) => {
                if(d >= 8) {
                    c.move.speed := PLAYER_MOVE_SPEED * 0.5;
                } else {
                    c.move.speed := PLAYER_MOVE_SPEED;
                }
            },
            onSuccess: self => {
                c.onPath := false;
                return ANIM_STAND;
            },
        });
    }
    
    dx := destX - c.move.x;
    dy := destY - c.move.y;

    if(c.move.z = destZ && abs(dx) <= 3 && abs(dy) <= 3) {
        return ANIM_STAND;
    }

    # if(isEmpty(destX, destY, destZ, c.move.shape) = false) {
    #     # print("wont fit");
    #     return ANIM_STAND;
    # }

    # if close enough, just move there
    if(c.move.z = destZ && abs(dx) < 8 && abs(dy) < 8) {
        c.move.speed := PLAYER_MOVE_SPEED;
        if(c.move.moveInDir(normalize(dx), normalize(dy), delta, null, null)) {
            # print("move");

            # cancel astar if any
            if(c.pathMove != null) {
                c.pathMove.path := null;
                c.pathMove.step := 0;
            }
            return ANIM_MOVE;
        }
    }
    
    # print("astar");
    c.onPath := true;
    return ANIM_MOVE;
}

def moveNpcSchedule(c, delta) {
    if(c.npc["activeScheduleChange"] = null) {
        return null;
    }

    if(c.npc.waypoints != null) {
        p := c.npc.waypoints[c.npc.waypointIndex];
    } else {
        p := c.npc.schedule[c.npc.activeSchedule].pos;
    }
    return pathMove(c, delta, {
        "name": c.npc.name, 
        "dest": { "x": p[0], "y": p[1], "z": p[2] }, 
        "nearDistance": 0,
        "farDistance": 0,
        "onSuccess": self => npcPathMoveSuccess(c, p, delta),
    });
}

def npcPathMoveSuccess(c, pos, delta) {
    w := c.npc.waypoints;
    if(c.npc.activeSchedule < 0 || c.npc.activeSchedule >= len(c.npc.schedule)) {
        c.npc.activeSchedule := 0;
    }
    wDir := c.npc.schedule[c.npc.activeSchedule].waypointDir;
    if(w != null && ((wDir = 1 && c.npc.waypointIndex < len(w) - 1) || (wDir = -1 && c.npc.waypointIndex > 0))) {
        # move to next waypoint        
        c.npc.waypointIndex :+ wDir;
        #print(c.npc.name + " moving to waypoint " + c.npc.waypointIndex);
    } else {
        #print(c.npc.name + " arrived at destination.");
        del c.npc["activeScheduleChange"];
        c["anchor"][0] := pos[0];
        c["anchor"][1] := pos[1];
        c["anchor"][2] := pos[2];
        c.movement := c.npc.schedule[c.npc.activeSchedule].movement;    
    }
    return null;
}

def getTraderInventory(npc, cat) {
    if(npc.tradeInv = null || len(npc.tradeInv) > 0) {
        npc.tradeInv := [];        
        availableItems := array_filter(OBJECTS, o => endsWith(o.shape, ".magic") = false && array_find(cat, c => o.cat = c) != null);
        while(len(npc.tradeInv) < 5 && len(availableItems) > 0) {
            idx := random() * len(availableItems);
            npc.tradeInv[len(npc.tradeInv)] := availableItems[idx];
            del availableItems[idx];
        }
    }
    return npc.tradeInv;
}

def npcScatter(x, y, z, shape) {
    array_foreach(creatures, (i, c) => {
        if(c.npc != null && intersectsShapes(x, y, z, shape, c.move.x, c.move.y, c.move.z, c.move.shape)) {
            tryNpcScatter(c);
        }
    });
}

def tryNpcScatter(c) {
    moves := [ [0, 1], [0, -1], [1, 0], [-1, 0] ];
    success := false;
    while(success || len(moves) > 0) {
        idx := int(random() * len(moves));
        d := moves[idx];
        if(c.move.moveInDir(d[0], d[1], c.move.speed, null, null)) {
            success := true;
        }
        del moves[idx];
    }
}
