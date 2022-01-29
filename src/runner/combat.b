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
    # todo:...
    pc.combatMode := true;
}
