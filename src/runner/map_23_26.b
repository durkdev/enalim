SECTIONS["23,26"] := {
    "init": this => {
        setCreature(5688,  6479, 1, creaturesTemplates.spirit);
        setCreature(5688,  6472, 1, creaturesTemplates.spirit);
        setCreature(5691,  6476, 1, creaturesTemplates.spirit);
        setCreature(5529,  6438, 1, creaturesTemplates.ogre);
        setCreature(5530,  6443, 1, creaturesTemplates.ogre);
        setCreature(5557,  6475, 1, creaturesTemplates.spirit);
        setCreature(5549,  6477, 1, creaturesTemplates.spirit);
    },
    "hasBrigo": (this, x, y, z) => {
        return this.hasBrigoPos(x, y, z) || this.hasBrigoPos(x + 1, y, z) || this.hasBrigoPos(x, y + 1, z) || this.hasBrigoPos(x + 1, y + 1, z);
    },
    "hasBrigoPos": (this, x, y, z) => {
        info := getShapeExtra(x, y, z);
        return info != null && array_find(info, e => e = "item.mineral.brigo") != null;
    },
    "start": this => {
        eraseShape(5617, 6441, 1);
        a := this.hasBrigo(5617, 6436, 3);
        b := this.hasBrigo(5612, 6441, 3);
        c := this.hasBrigo(5617, 6446, 3);
        d := this.hasBrigo(5622, 6441, 3);
        print("a=" + a + " b=" + b + " c=" + c + " d=" + d);
        if(a && b && c && d) {
            if(player.gameState["switch_5617_6441_1"] = true) {
                setShape(5617, 6441, 1, "switch.closed");
            } else {
                setShape(5617, 6441, 1, "switch.open");
            }
        }
        eraseShape(5715, 6477, 1);
        if(player.gameState["switch_5617_6441_1"] = true) {
            setShape(5715, 6477, 1, "door.bars.x");
        } else {
            setShape(5715, 6477, 1, "door.bars.y");
        }
    },
    "teleport": (this, x, y, z) => {
        if(x = 5522 && y >= 6440  && y <= 6443 && z = 1) {
            return [5608, 6440, 1];
        }
        if(x = 5606 && y >= 6440  && y <= 6443 && z = 1) {
            return [5524, 6440, 1];
        }        
        if(y = 6470 && x >= 5695  && x <= 5698 && z = 1) {
            return [5596, 6650, 1];
        }        
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 5608 && y = 6434 && z = 1) {
            timedMessage(x, y, z, "Mining the possibilities", false);
        }
        return null;
    },
    "locked": (this, x, y, z) => {        
        return null;
    },
};
