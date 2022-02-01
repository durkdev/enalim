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
    creature.inventory := newInventory("inv." + creature.id);
    creature.equipment := newEquipment();
    if(npc.inventory != null) {
        array_foreach(npc.inventory, (i, shape) => creature.inventory.add(shape));
    }
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
        "name": npc.name,
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

# order: w, sw, s, se, e, ne, n, nw
const PARTY_FORMATION = [
    {
        follow: "player",
        minDist: 4,
        formation: [
            [ [0, 2], [-2, 0], [-2, 0], [0, -2], [0, -2], [2, 0], [2, 0], [0, 2] ],
            [ [-2, 0], [0, -2], [0, -2], [2, 0], [2, 0], [0, 2], [0, 2], [-2, 0] ],
            [ [-2, 2], [-2, -2], [-2, -2], [2, -2], [2, -2], [2, 2], [2, 2], [-2, 2] ],
        ]
    },
    {
        follow: "previous",
        minDist: 2,
        formation: [
            [ [-2, 0], [-2, -2], [0, -2], [2, -2], [2, 0], [2, 2], [0, 2], [-2, 2] ],
            [ [-2, 0], [-2, -2], [0, -2], [2, -2], [2, 0], [2, 2], [0, 2], [-2, 2] ],
            [ [-2, 0], [-2, -2], [0, -2], [2, -2], [2, 0], [2, 2], [0, 2], [-2, 2] ],
        ]
    },
    {
        follow: "player",
        minDist: 4,
        formation: [
            [ [-2, -2], [0, -4], [2, -2], [4, 0], [2, 2], [0, 4], [-2, 2], [-4, 0] ],
            [ [-2, 0], [-2, -2], [0, -2], [2, -2], [2, 0], [2, 2], [0, 2], [-2, 2] ],
            [ [-2, 2], [-4, 0], [-2, -2], [0, -4], [2, -2], [4, 0], [2, 2], [0, 4] ]
        ]
    },
];

def moveNpcNearPlayer(c, delta) {
    #  don't move if we're scattering or fighting
    if(c.attackTimer > 0) {
        c.attackTimer :- delta;
        return ANIM_ATTACK;
    } else if(c.coolTimer > 0) {
        if(c.attackTarget != null) {
            attackDamage(c);
        }
        c.coolTimer :- delta;
        return ANIM_STAND;
    } else if(player.scatter = true) {
        return ANIM_STAND;
    }

    if(continueCombat(c)) {
        c.move.speed := PLAYER_MOVE_SPEED * 0.5;
        return pathMove(c, delta, {
            name: c.npc.name, 
            dest: c.attackTarget.move, 
            nearDistance: 2,
            farDistance: 0,
            largeBreak: self => random(),
            smallBreak: self => random() * 0.25,
            onSuccess: self => {
                return ANIM_STAND;
            },
        });
    } else {
        info := PARTY_FORMATION[player.partyFormationIndex];
        offsetPc := player;
        if(info.follow = "previous" && c.npc.partyIndex > 0) {
            offsetPc := player.party[c.npc.partyIndex - 1];
        }
        partyOffset := info.formation[c.npc.partyIndex][offsetPc.move.dir];
        destX := offsetPc.move.x + partyOffset[0];
        destY := offsetPc.move.y + partyOffset[1];
        destZ := offsetPc.move.z;
        dx := destX - c.move.x;
        dy := destY - c.move.y;
        dz := destZ - c.move.z;

        # don't react to small movements
        if(dz = 0 && abs(dx) <= info.minDist && abs(dy) <= info.minDist && player.moveTimer < 0.2) {
            return ANIM_STAND;
        }

        # if close and can fit, move there (most party movement uses this)
        if(dz < 2 && abs(dx) <= info.minDist && abs(dy) <= info.minDist) {
            c.move.speed := PLAYER_MOVE_SPEED;
            if(c.move.moveTo(destX, destY, offsetPc.move.scrollOffsetX, offsetPc.move.scrollOffsetY)) {
                c.move.dir := offsetPc.move.dir;
                c.lastDestX := null;
                cancelPathFind(c);
                return player.lastAnimation;
            }
        }

        # if the pc can't get to the destination, select another spot around the player
        if(dz = 0 && isReachable(destX, destY, destZ, c.move.shape) = false) {
            if(c.lastDestX != null && abs(c.lastDestX - destX) <= info.minDist && abs(c.lastDestY - destY) <= info.minDist && isReachable(c.lastDestX, c.lastDestY, destZ, c.move.shape)) {
                destX := c.lastDestX;
                destY := c.lastDestY;
                destZ := c.lastDestZ;
            } else {
                pos := getNpcPositionNear(c, destX, destY, destZ);
                if(pos != null) {
                    c.lastDestX := pos[0];
                    c.lastDestY := pos[1];
                    c.lastDestZ := pos[2];
                    destX := c.lastDestX;
                    destY := c.lastDestY;
                    destZ := c.lastDestZ;
                } else {
                    c.lastDestX := null;
                }
            }
        }

        # check for and rescue "lost" pc-s
        dd := c.move.distanceTo(destX, destY, destZ);
        if(dd > 20) {
            r := getRescuePosition(destX, destY, destZ, c.move.shape, 20);
            if(r != null) {
                c.move.forceTo(r[0], r[1], r[2]);
                cancelPathFind(c);
                return player.lastAnimation;
            } else {
                # bad news bears... hopefully as player keeps moving this is fixed
                print(c.npc.name + " no rescue position found");
            }
        }

        # limit steps based on distance to avoid crazy paths for small movements
        maxSteps := min(20, dd * 1.5);

        # fallback to pathfind as last resort. Note: use nearDistance=4 because at that point player will be moved. 
        # Pathfind  is hard with nearDistance=0.
        c.move.speed := PLAYER_MOVE_SPEED * 0.5;
        return pathMove(c, delta, {
            name: c.npc.name, 
            dest: { "x": destX, "y": destY, "z": destZ }, 
            nearDistance: info.minDist,
            farDistance: 0,
            maxSteps: maxSteps,
            largeBreak: self => random(),
            smallBreak: self => random() * 0.25,
            tempMove: (self, c, delta) => {
                return ANIM_STAND;
            },            
            onSuccess: self => {
                return ANIM_STAND;
            },
        });
    }
}

def getNpcPositionNear(c, destX, destY, destZ) {
    pos := [0, 0, 0];
    r := 2;
    # while(r <= 4) {
        range(-1 * r, r + 1, 2, x => {
            xx := destX + x;
            yy := destY - r;
            if(pos[0] = 0 && isReachable(xx, yy, destZ, c.move.shape)) {
                pos[0] := xx;
                pos[1] := yy;
                pos[2] := destZ;
            }
        });
        if(pos[0] > 0) {
            return pos;
        }
        range(-1 * r, r + 1, 2, x => {
            xx := destX + x;
            yy := destY + r;
            if(pos[0] = 0 && isReachable(xx, yy, destZ, c.move.shape)) {
                pos[0] := xx;
                pos[1] := yy;
                pos[2] := destZ;
            }
        });
        if(pos[0] > 0) {
            return pos;
        }
        range(-1 * r, r + 1, 2, y => {
            xx := destX - r;
            yy := destY + y;
            if(pos[0] = 0 && isReachable(xx, yy, destZ, c.move.shape)) {
                pos[0] := xx;
                pos[1] := yy;
                pos[2] := destZ;
            }
        });
        if(pos[0] > 0) {
            return pos;
        }
        range(-1 * r, r + 1, 2, y => {
            xx := destX + r;
            yy := destY + y;
            if(pos[0] = 0 && isReachable(xx, yy, destZ, c.move.shape)) {
                pos[0] := xx;
                pos[1] := yy;
                pos[2] := destZ;
            }
        });
        if(pos[0] > 0) {
            return pos;
        }
        # r :+ 2;
    # }
    return null;
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
    player.scatter := true;
    array_foreach(creatures, (i, c) => {
        if(c.npc != null && (c.npc.partyIndex != null || intersectsShapes(x, y, z, shape, c.move.x, c.move.y, c.move.z, c.move.shape))) {
            tryNpcScatter(c);
        }
    });
    player.scatter := false;
}

def tryNpcScatter(c) {
    moves := [ [0, 1], [0, -1], [1, 0], [-1, 0] ];
    done := false;
    while(done = false && len(moves) > 0) {
        idx := int(random() * len(moves));
        d := moves[idx];
        if(c.move.moveInDir(d[0], d[1], c.move.speed, null, null)) {
            done := true;
        }
        del moves[idx];
    }
}
