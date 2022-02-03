SECTIONS["26,30"] := {
    "init": this => {
        setCreature(6244, 7352, 1, creaturesTemplates.ogre);
        setCreature(6248, 7338, 1, creaturesTemplates.ogre);
        setCreature(6243, 7268, 1, creaturesTemplates.ogre);
        setCreature(6243, 7288, 1, creaturesTemplates.ogre);
        setCreature(6243, 7222, 1, creaturesTemplates.ogre);
        setCreature(6252, 7219, 1, creaturesTemplates.ogre);

        setCreature(6315, 7230, 1, creaturesTemplates.skeleton);
        setCreature(6315, 7237, 1, creaturesTemplates.skeleton);
        setCreature(6315, 7244, 1, creaturesTemplates.skeleton);
        setCreature(6321, 7230, 1, creaturesTemplates.skeleton);
        setCreature(6321, 7237, 1, creaturesTemplates.skeleton_red);
        setCreature(6321, 7244, 1, creaturesTemplates.skeleton);
        setCreature(6327, 7230, 1, creaturesTemplates.skeleton);
        setCreature(6327, 7237, 1, creaturesTemplates.skeleton);
        setCreature(6327, 7244, 1, creaturesTemplates.skeleton);

        setCreature(6358, 7294, 1, creaturesTemplates.spirit);
        setCreature(6358, 7299, 1, creaturesTemplates.spirit);
        setCreature(6358, 7304, 1, creaturesTemplates.spirit);
        setCreature(6358, 7316, 1, creaturesTemplates.spirit);
        setCreature(6364, 7294, 1, creaturesTemplates.spirit);
        setCreature(6364, 7299, 1, creaturesTemplates.spirit);
        setCreature(6364, 7304, 1, creaturesTemplates.spirit);
        setCreature(6364, 7316, 1, creaturesTemplates.spirit);

        setBook(6456, 7368, 3, "map", "The book of Vesnu");
        setBook(6415, 7402, 1, "map", "Brigo processing");
    },
    "start": this => {
        eraseShape(6350, 7310, 1);
        eraseShape(6361, 7292, 1);
        eraseShape(6361, 7320, 1);
        eraseShape(6368, 7305, 1);
        if(player.gameState["switch_6227_7300_1"] = true && player.gameState["switch_6227_7330_1"] = true) {
            setShape(6350, 7310, 1, "teleport.x");
            setShape(6361, 7292, 1, "door.bars.y");
            setShape(6361, 7320, 1, "door.bars.y");
            setShape(6368, 7305, 1, "door.bars.x");
        } else {
            setShape(6361, 7292, 1, "door.bars.x");
            setShape(6361, 7320, 1, "door.bars.x");
            setShape(6368, 7305, 1, "door.bars.y");
        }
        eraseShape(6433, 7369, 1);
        if(player.gameState["switch_6453_7477_8"] = true) {
            setShape(6433, 7369, 1, "door.bars.x");
        } else {
            setShape(6433, 7369, 1, "door.bars.y");
        }
    },
    "teleport": (this, x, y, z) => {
        if(x = 6350 && y >= 7310  && y <= 7313 && z = 1) {
            if(player.gameState["switch_6349_7365_1"] = true) {
                return [6228, 7315, 1];
            } else {
                return [6228, 7247, 1];
            }
        }
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 6390 && y = 7439 && z = 1) {
            timedMessage(x, y, z, "Dungeon Delude", false);
            return true;
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        # if(x = 6563 && y = 5391 && z = 1) {
        #     return "key.ourdlen2";
        # }
        return null;
    },
};
