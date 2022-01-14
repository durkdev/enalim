creatures := [];

def getCreature(x, y, z) {
    # todo: if this is too slow, keep track of creaturePos in a global table
    return array_find(creatures, c => c.move.x = x && c.move.y = y && c.move.z = z);
}

def findCreatureByName(name) {
    return array_find(creatures, c => c.npc != null && c.npc.name = name);
}

def encodeCreature(c) {
    return {
        "id": c.id,
        "name": c.template.name,
        "move": c.move.encode(),
        "npc": encodeNpc(c.npc),
        "movement": c.movement,
        "hp": c.hp,
    };
}

def pruneCreatures(sectionX, sectionY) {
    removes := [];
    array_remove(creatures, c => {
        sectionPos := getSectionPos(c.move.x, c.move.y);
        b := sectionPos[0] = sectionX && sectionPos[1] = sectionY;
        if(b) {
            # not needed: shapes with animations are marked IsSave=false
            # c.move.erase();
            if(c.npc = null || c.npc.partyIndex = null) {
                # remove the creature but don't save it if it's a party member (they're saved in savegame.json)
                removes[len(removes)] := encodeCreature(c);
            }
        }
        return b;
    });
    return removes;
}

def restoreCreature(savedCreature) {
    tmpl := creaturesTemplates[savedCreature.name];
    # print("* Restoring creature " + tmpl.shape + " " + savedCreature.id);
    move := decodeMovement(savedCreature.move, tmpl.baseWidth, tmpl.baseHeight, tmpl.sizeZ, tmpl.shape, tmpl.speed, false, tmpl.isFlying);
    move.setShape(tmpl.shape);
    c := {
        id: savedCreature.id,
        template: tmpl,
        move: move,
        anchor: [ move.x, move.y, move.z ],
        anchorTimer: 0,
        anchorMode: ANIM_MOVE,
        npc: decodeNpc(savedCreature.npc),
        movement: savedCreature.movement,
        hp: savedCreature.hp,
        coolTimer: 0,
        attackTimer: 0,
        attackTarget: null,
        lastAttackTarget: null,
        combatMode: false,
        moveTimer: 0,
    };
    creatures[len(creatures)] := c;
    return c;
}

def setCreature(x, y, z, creature) {
    id := "c." + x + "." + y + "." + z;
    c := array_find(creatures, c => c.id = id);
    if(c = null) {
        # print("* Adding creature: " + creature.shape + " " + id);
        c := {
            id: id,
            template: creature,
            move: newMovement(x, y, z, creature.baseWidth, creature.baseHeight, creature.sizeZ, creature.shape, creature.speed, false, creature.isFlying),
            anchor: [ x, y, z ],
            anchorTimer: 0,
            anchorMode: ANIM_MOVE,
            npc: null,
            movement: creature.movement,
            hp: creature.hp,
            coolTimer: 0,
            attackTimer: 0,
            attackTarget: null,
            lastAttackTarget: null,
            combatMode: false,
        };
        c.move.setShape(creature.shape);
        creatures[len(creatures)] := c;
        #debugCreatures();
    }
    return c;
}

def debugCreatures() {
    print("+++ Creatures: " + array_join(array_map(creatures, c => c.template.shape + " " + c.id), "|"));
}

def stopCreatures() {   
    array_foreach(creatures, (i, c) => {
        c.move.setAnimation(ANIM_STAND);
    });
}

def moveCreatures(delta) {
    array_foreach(creatures, (i, c) => {
        if(isInView(c.move.x, c.move.y) = false) {
            return true;
        }

        if(c.npc != null) {
            animation := moveNpc(c, delta);
        } else if(c.template.movement = "hunt") {
            animation := moveMonster(c, delta);
        } else {
            animation := moveCreatureRandom(c, delta);
        }        
        c.move.setAnimation(animation);
    });
}

def anchorAndMoveCreatureRandom(c, delta) {
    # re-anchor at current location
    c.anchor := [ c.move.x, c.move.y, c.move.z ];
    return moveCreatureRandom(c, delta);
}

# directional random walk with pausing
def moveCreatureRandom(c, delta) {
    if(c.movement = "stand") {
        return ANIM_STAND;
    } else {
        if(c.anchorTimer > 0) {
            c.anchorTimer :- delta;
            if(c.anchorMode = ANIM_MOVE) {
                moveCreatureRandomMove(c, delta);
            }
        } else {
            c.anchorTimer := 0.5 + random() * 2.5;
            c.anchorMode := choose([ ANIM_MOVE, ANIM_STAND, ANIM_STAND, ANIM_STAND, ANIM_STAND, ANIM_STAND, ANIM_STAND ]);
            c.move.dir := int(random() * 8);
        }
        return c.anchorMode;
    }
}

def moveCreatureRandomMove(c, delta) {
    d := getDelta(c.move.dir);
    distXy := distance(
        c.anchor[0], c.anchor[1], c.anchor[2], 
        c.move.x + d[0], c.move.y + d[1], c.anchor[2]
    );
    dirChange := false;
    if(distXy > 8) {
        dirChange := true;
    } else if(c.move.moveInDir(d[0], d[1], delta, null, null) = false) {
        dirChange := true;
    }
    if(dirChange) {
        c.move.dir := int(random() * 8);
    }
}

const BLOOD_TILES = [ "item.blood.1", "item.blood.2", "item.blood.3" ];

def takeDamage(c, dam, onDeath) {
    if(dam > 0) {
        showMessageAt(
            c.move.x, 
            c.move.y, 
            c.move.z, 
            "-" + dam, 
            2, 
            DAM_R, DAM_G, DAM_B, 
            true
        );
        c.hp := c.hp - dam;
        if(c.hp <= 0) {
            c.hp := 0;
            setShapeExtra(
                c.move.x + int(random() * (c.move.width + 2)) - 1,
                c.move.y + int(random() * (c.move.height + 2)) - 1,
                c.move.z,
                choose(BLOOD_TILES)
            );
            onDeath(c);
        } else if(random() >= 0.75) {
            setShapeExtra(
                c.move.x + int(random() * (c.move.width + 2) - 1),
                c.move.y + int(random() * (c.move.height + 2) - 1),
                c.move.z,
                choose(BLOOD_TILES)
            );
        }
    }
}

def removeCreatureById(id) {
    idx := array_find_index(creatures, c => c.id = id);
    if(idx < 0) {
        return;
    }
    m := creatures[idx].move;
    creatures[idx].move.erase();
    del creatures[idx];
}
