def startAttack(creature, pc) {
    if(pc.coolTimer <= 0) {
        distAndDir := distanceAndDirToCreature(creature, pc);
        pc.move.dir := distAndDir[1];
        if(int(distAndDir[0]) <= creature.template.baseWidth/2 + 1) {
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
            pc.attackTarget := creature;
            pc.combatMode := true;
        } else {
            # move nearer to the enemy
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
    if(pc.lastAttackTarget != null) {
        if(pc.lastAttackTarget.hp > 0) {
            startAttack(player.lastAttackTarget, pc);
            return 1;
        }
    }
    c := findNearestMonster(pc);
    if(c != null) {
        startAttack(c, pc);
    }
}

def findNearestMonster(pc) {
    targets := array_filter(creatures, c => {
        d := pc.move.distanceToMove(c.move);
        return d <= 10 && c.template.movement = "hunt";
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
        pc.combatMode := findNearestMonster(pc) != null;
    });
    pc.lastAttackTarget := pc.attackTarget;
    pc.attackTarget := null;
}

def pcTakeDamage(enemy, pc) {
    # todo:...
    pc.combatMode := true;
}
