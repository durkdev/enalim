SECTIONS["24,27"] := {
    "init": this => {
        setCreature(5811, 6695, 1, creaturesTemplates.spirit);        
        setCreature(5811, 6700, 1, creaturesTemplates.spirit);        
        setCreature(5811, 6705, 1, creaturesTemplates.spirit);        
        setCreature(5799, 6659, 1, creaturesTemplates.ogre);        
    },
    "start": this => {
        eraseShape(5773, 6701, 1);
        if(player.gameState["switch_5648_6699_1"] = true) {
            setShape(5773, 6701, 1, "door.bars.x");
        } else {
            setShape(5773, 6701, 1, "door.bars.y");
        }
        eraseShape(5793, 6701, 1);
        if(player.gameState["switch_5816_6695_1"] = true) {
            setShape(5793, 6701, 1, "door.bars.x");
        } else {
            setShape(5793, 6701, 1, "door.bars.y");
        }
    },
    "teleport": (this, x, y, z) => {
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 5774 && y = 6705 && z = 1) {
            timedMessage(x, y, z, "Valoran caves ahead", false);
            return true;
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        return null;
    },
};
