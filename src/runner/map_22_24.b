SECTIONS["22,24"] := {
    "init": this => {
        setCreature(5462, 5989, 1, creaturesTemplates.goblin);
        setCreature(5462, 5927, 1, creaturesTemplates.goblin);
        setCreature(5467, 5927, 1, creaturesTemplates.goblin);
        setCreature(5476, 5925, 1, creaturesTemplates.goblin);
        setCreature(5447, 5932, 1, creaturesTemplates.goblin);
        setCreature(5447, 5941, 1, creaturesTemplates.goblin);
        setCreature(5499, 5982, 1, creaturesTemplates.goblin);
        setCreature(5499, 5976, 1, creaturesTemplates.goblin);
        setCreature(5516, 5991, 1, creaturesTemplates.goblin);
        setCreature(5512, 5999, 1, creaturesTemplates.goblin);
        setCreature(5505, 5999, 1, creaturesTemplates.goblin);
    },
    "start": this => {
        eraseShape(5501, 5996, 1);
        if(player.gameState["switch_5462_5908_1"] = true) {
            setShape(5501, 5996, 1, "teleport.x");
        }
    },
    "teleport": (this, x, y, z) => {
        if(player.gameState["switch_5462_5908_1"] = true && x = 5501 && y >= 5996 && y <= 5999 && z = 1) {
            return [ 5621, 6129, 1 ];
        }
        return null;
    },
    "action": (this, x, y, z) => {
        return null;
    },
    "locked": (this, x, y, z) => {        
        return null;
    },
};
