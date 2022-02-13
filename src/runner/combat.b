def runAttack(pc) {
    if(pc.coolTimer <= 0) {
        distAndDir := distanceAndDirToCreature(pc.attackTarget, pc);
        pc.move.dir := distAndDir[1];
        if(int(distAndDir[0]) <= pc.attackTarget.template.baseWidth/2 + 1) {
            # attack
            if(random() >= 0.75) {
                timedMessage(
                    pc.move.x + (random() * 4),
                    pc.move.y + (random() * 2) - 6,
                    pc.move.z,
                    choose(COMBAT_MESSAGES), 
                    false
                );
            }
            pc.attackTimer := ANIMATION_SPEED * 2;
            pc.coolTimer := 0.5;
        }
    }
}

def distanceAndDirToCreature(creature, pc) {
    cx := creature.move.x + creature.template.baseWidth/2;
    cy := creature.move.y + creature.template.baseHeight/2;
    px := pc.move.x + 1;
    py := pc.move.y + 1;
    dx := (cx - px);
    if(dx != 0) {
        dx := dx / abs(dx);
    }
    dy := (cy - py);
    if(dy != 0) {
        dy := dy / abs(dy);
    }
    dir := getDir(dx, dy);
    d := distance(
        cx, cy, creature.move.z, 
        px, py, pc.move.z);
    return [d, dir];
}

def continueCombat(pc) {
    c := pc.lastAttackTarget;
    if(c = null || c.hp <= 0) {
        c := findNearestMonster(pc);
    }
    if(c = null) {
        pc.attackTarget := null;
        pc.combatMode := false;
    } else {
        pc.attackTarget := c;
        pc.combatMode := true;
        runAttack(pc);
    }
    return pc.combatMode;
}

def startCombat(creature, pc) {
    pc.attackTarget := c;
    pc.combatMode := true;
    runAttack(pc);
}

def findNearestMonster(pc) {
    targets := array_filter(creatures, c => {
        d := pc.move.distanceToMove(c.move);
        r := isCreatureReachable(c.move.x, c.move.y, c.move.z, pc.move.shape);
        # r := true;
        return d <= 10 && c.template.movement = "hunt" && r;
    });
    if(len(targets) > 0) {
        return choose(targets);
    } else {
        return null;
    }
}

def attackDamage(pc) {
    dam := int(random() * 5);
    takeDamage(pc.attackTarget, dam, c => {
        combatWin(c.anchor[0], c.anchor[1], c.id, c.move.x, c.move.y, c.move.z);
        c.move.erase();
        array_remove(creatures, cc => {
            return cc.id = c.id;
        });
        # pc.combatMode := findNearestMonster(pc) != null;
    });
    pc.lastAttackTarget := pc.attackTarget;
    pc.attackTarget := null;
}

def pcTakeDamage(enemy, pc) {
    # Very similar to the normal takeDamage function. Perhaps consolidate the two and add an if statement to check if the
    # character that has reached 0 HP is the player, and then call the unique player death sequence from there?
    pc.combatMode := true;
    # TODO: Create a proper damage system based on character statistics and equipment
    dam := int(random() * 5);

    if(dam > 0) {
        showMessageAt(
            pc.move.x, 
            pc.move.y, 
            pc.move.z, 
            "-" + dam, 
            2, 
            DAM_R, DAM_G, DAM_B, 
            true
        );
        pc.hp := pc.hp - dam;
        if(pc.hp <= 0) {
            pc.hp := 0;
            enemy.combatMode := false;
            pcOnDeath(pc);
        }
    }
}

def pcOnDeath(pc) {    
    pc.status := STATUS_DEAD;
    pc.mode := MODE_DEATH;
    # Placeholder panel. A tombstone panel wouldn't be a bad addition here.
    raisePanel("death", "marble");
    updatePanel("death", [{
        "type": "uiText",
        "text": "Oh dear, you have died!",
        "x": 75,
        "y": 100,
        "fontIndex": 0,
    },{
        "type": "uiText",
        "text": "Press SPACE to live again",
        "x": 75,
        "y": 200,
        "fontIndex": 0,
    }]);
    centerPanel("death");
}
