SECTIONS["26,25"] := {
    "init": this => {
        setCreature(5307, 5012, 1, creaturesTemplates.goblin);
        setCreature(5312, 5033, 1, creaturesTemplates.goblin);
        setCreature(5323, 5051, 1, creaturesTemplates.goblin);
        setCreature(5353, 5036, 1, creaturesTemplates.goblin);
        setCreature(5365, 5024, 1, creaturesTemplates.goblin);
        setCreature(5365, 5024, 1, creaturesTemplates.goblin);

        setCreature(5395, 5111, 1, creaturesTemplates.skeleton);
        setCreature(5395, 5099, 1, creaturesTemplates.skeleton);
        setCreature(5375, 5099, 1, creaturesTemplates.skeleton);
        setCreature(5375, 5111, 1, creaturesTemplates.skeleton);
        setCreature(5387, 5104, 1, creaturesTemplates.skeleton_blue);
        setCreature(5360, 5075, 1, creaturesTemplates.skeleton_red);
        setCreature(5367, 5068, 1, creaturesTemplates.skeleton);
        setCreature(5354, 5068, 1, creaturesTemplates.skeleton);
        setCreature(5354, 5081, 1, creaturesTemplates.skeleton);
        setCreature(5367, 5081, 1, creaturesTemplates.skeleton);
        setCreature(5395, 5089, 1, creaturesTemplates.skeleton_blue);

        setBook(5214, 5034, 3, "map", "The book of Vreit");
    },
    "start": this => {
        eraseShape(5291, 5018, 1);
        if(player.gameState["switch_5442_5129_1"] = true) {
            setShape(5291, 5018, 1, "teleport.x");
        }
    },
    "teleport": (this, x, y, z) => {
        if(player.gameState["switch_5442_5129_1"] = true && x = 5291 && y >= 5018 && y < 5024 && z = 1) {
            return [ 5400, 5146, 1 ];
        } else if(x = 5396 && y >= 5146 && y < 5150 && z = 1) {
            return [ 5297, 5022, 1 ];
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        if(x = 5208 && y = 5017 && z = 1) {
            return "key.ourdlen2";
        }
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 5396 && y = 5010 && z = 1) {
            timedMessage(x, y, z, "Road to Trinest", false);
            return true;
        }
        return null;
    },
    "combatWin": (this, creatureId, x, y, z) => {
        if(creatureId = "c.5360.5075.1") {
            # drop "item.gem.theohadron"
            setShapeNearby(x, y, z, "item.gem.theohadron", true);
        }
    },
};
