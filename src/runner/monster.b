def moveMonster(c, delta) {
    if(c["monster"] = null) {
        c["monster"] := initMonster(c);
    }

    if(c.monster.attackTime > 0) {
        c.monster.attackTime := c.monster.attackTime - delta;        
        return ANIM_ATTACK;
    }

    if(c.monster.coolTime > 0) {
        if(c.monster.attacking) {
            pcTakeDamage(c, c.monster.target);
            c.monster.attacking := false;
        }
        c.monster.coolTime := c.monster.coolTime - delta;
        return ANIM_STAND;
    }

    if(c.monster.target = null) {
        c.monster.target := player;
        array_foreach(player.party, (i, pc) => {
            if(c.move.distanceToMove(c.monster.target.move) > c.move.distanceToMove(pc.move)) {
                c.monster.target := pc;
            }
        });
        print(c.template.shape + " targets " + c.monster.target.id);
    }

    return pathMove(c, delta, {
        name: "MONSTER " + c.template.shape, 
        dest: c.monster.target.move, 
        nearDistance: 2,
        farDistance: 20,
        onSuccess: self => {
            # todo: combat!
            c.monster.attackTime := ANIMATION_SPEED * c.template.attackSteps; 
            c.monster.coolTime := 0.5;
            c.monster.attacking := true;
            return ANIM_ATTACK;
        },
    });
}

def initMonster(c) {
    return {
        attackTime: 0,
        coolTime: 0,
        attacking: false,
        target: null,
    };
}
