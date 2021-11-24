SECTIONS["23,27"] := {
    "init": this => {
        setBook(5646, 6707, 3, "map", "The age of Krynt");
        setCreature(5620, 6707, 1, creaturesTemplates.spirit);
        setCreature(5622, 6712, 1, creaturesTemplates.spirit);
        setCreature(5619, 6716, 1, creaturesTemplates.spirit);        
        setCreature(5716, 6701, 1, creaturesTemplates.spirit);        
        setCreature(5712, 6701, 1, creaturesTemplates.spirit);        
        setCreature(5706, 6701, 1, creaturesTemplates.spirit);        
        setCreature(5665, 6594, 1, creaturesTemplates.ogre);        
    },
    "start": this => {
        eraseShape(5596, 6643, 1);
        if(player.gameState["switch_5687_6476_1"] = true) {
            setShape(5596, 6643, 1, "door.bars.y");
        } else {
            setShape(5596, 6643, 1, "door.bars.x");
        }
        eraseShape(5648, 6717, 1);
        if(player.gameState["switch_5620_6703_1"] = true && player.gameState["switch_5717_6699_1"] = true && player.gameState["switch_5816_6695_1"] = true) {
            setShape(5648, 6717, 1, "door.bars.y");
        } else {
            setShape(5648, 6717, 1, "door.bars.x");
        }
    },
    "teleport": (this, x, y, z) => {
        if(x >= 5655 && x <= 5658 && y = 6718 && z = 1) {
            a := player.gameState["switch_5643_6722_1"] = true;
            b := player.gameState["switch_5643_6725_1"] = true;
            c := player.gameState["switch_5643_6728_1"] = true;
            print("switches: a=" + a + " b=" + b + " c=" + c);
            if(a = true && b = false && c = true) {
                return [5620, 6728, 1];
            } else if(a = false && b = true && c = false) {
                return [5708, 6719, 1];
            } else if(a = false && b = false && c = true) {
                return [5796, 6699, 1];
            } else {
                return choose([ [5781, 6699, 1], [5735, 6728, 1], [5681, 6774, 1], [5620, 6743, 1] ]);
            }
        }
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 5642 && y = 6719 && z = 1) {
            timedMessage(x, y, z, choose([ "5: switch 1", "2: switch 2", "1: switch 3"]), false);
            return true;
        }
        if(x = 5646 && y = 6700 && z = 1) {
            timedMessage(x, y, z, "Cave access", false);
            return true;
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        return null;
    },
};
