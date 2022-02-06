SECTIONS["22,25"] := {
    "init": this => {
        setCreature(5506, 6091, 1, creaturesTemplates.goblin);
        setCreature(5505, 6097, 1, creaturesTemplates.goblin);
        setCreature(5509, 6102, 1, creaturesTemplates.goblin);
        setCreature(5497, 6103, 1, creaturesTemplates.goblin);
        setCreature(5491, 6097, 1, creaturesTemplates.goblin);
        setCreature(5495, 6077, 1, creaturesTemplates.ogre);
        setCreature(5492, 6069, 1, creaturesTemplates.ogre);
        setCreature(5504, 6072, 1, creaturesTemplates.goblin);
        setCreature(5478, 6022, 1, creaturesTemplates.goblin);

        setBook(5520, 6129, 5, "Spell reagents");
    },
    "start": this => {
        eraseShape(5504, 6068, 1);
        if(player.gameState["switch_5667_6162_1"] = true) {
            setShape(5504, 6068, 1, "teleport.y");
        }
    },
    "teleport": (this, x, y, z) => {
        if(player.gameState["switch_5667_6162_1"] = true && x >= 5504 && x <= 5507 && y = 6068 && z = 1) {
            return [ 5653, 6123, 1 ];
        }
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 5496 && y = 6116 && z = 1) {
            timedMessage(x, y, z, "Dungeon Ravenous", false);
            return true;
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        return null;
    },
};
