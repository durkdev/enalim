SECTIONS["26,29"] := {
    "init": this => {
        # setCreature(6364, 7316, 1, creaturesTemplates.spirit);
        
    },
    "hasMagicItem": (this, x, y, z) => {
        hasItem := false;
        xx := -2;
        while(hasItem = false && xx < 2) {
            yy := -2;
            while(hasItem = false && yy < 2) {
                hasItem := this.hasMagicItemPos(x + xx, y + yy, z);
                yy :+ 1;
            }
            xx :+ 1;
        }
        return hasItem;
    },
    "hasMagicItemPos": (this, x, y, z) => {
        info := getShapeExtra(x, y, z);
        return info != null && array_find(info, e => endsWith(e, ".magic")) != null;
    },
    "start": this => {
        eraseShape(6420, 7023, 1);
        if(this.hasMagicItem(6422, 7031, 4)) {
            setShape(6420, 7023, 1, "door.bars.y");
        } else {
            setShape(6420, 7023, 1, "door.bars.x");
        }
    },
    "teleport": (this, x, y, z) => {
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 6418 && y = 7038 && z = 1) {
            timedMessage(x, y, z, "Leave weapon here", false);
            return true;
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        return null;
    },
};
