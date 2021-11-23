SECTIONS["23,28"] := {
    "init": this => {
        setCreature(5676, 6774, 1, creaturesTemplates.skeleton);
        setCreature(5682, 6774, 1, creaturesTemplates.skeleton);
        setCreature(5620, 6758, 1, creaturesTemplates.ogre);
    },
    "start": this => {
        eraseShape(5620, 6734, 1);
        if(player.gameState["switch_5620_6703_1"] = true) {
            setShape(5620, 6734, 1, "door.bars.y");
        } else {
            setShape(5620, 6734, 1, "door.bars.x");
        }        
        eraseShape(5708, 6725, 1);
        # todo: needs different switch
        if(player.gameState["switch_5717_6699_1"] = true) {
            setShape(5708, 6725, 1, "door.bars.y");
        } else {
            setShape(5708, 6725, 1, "door.bars.x");
        }        
    },
    "teleport": (this, x, y, z) => {
        return null;
    },
    "action": (this, x, y, z) => {
        return null;
    },
    "locked": (this, x, y, z) => {
        return null;
    },
};
