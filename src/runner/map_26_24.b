SECTIONS["26,24"] := {
    "init": this => {
        setContainer("chest", 5354, 4986, 1, "map", [ "key.ravenous", "item.dagger", "item.gem.ruby" ]);
        setCreature(5391, 4884, 1, creaturesTemplates.goblin);
        setCreature(5376, 4936, 1, creaturesTemplates.goblin);
        setCreature(5376, 4945, 1, creaturesTemplates.goblin);
        setCreature(5378, 4959, 1, creaturesTemplates.ogre);
        setCreature(5367, 4961, 1, creaturesTemplates.goblin);
        setCreature(5375, 4981, 1, creaturesTemplates.spirit);
        setCreature(5367, 4981, 1, creaturesTemplates.spirit);
        setCreature(5359, 4981, 1, creaturesTemplates.spirit);
        setCreature(5333, 4959, 1, creaturesTemplates.goblin);
        setCreature(5327, 4959, 1, creaturesTemplates.goblin);
        setCreature(5311, 4991, 1, creaturesTemplates.goblin);
    },
    "start": this => {
        eraseShape(5291, 4986, 1);
        if(player.gameState["switch_5371_5047_2"] = true) {
            setShape(5291, 4986, 1, "teleport.x");
        }
    },
    "teleport": (this, x, y, z) => {
        if(x >= 5396 && x < 5400 && y >= 4908 && y < 4912 && z = 1) {
            return [ 5368, 4909, 1 ];    
        } else if(x >= 5364 && x <= 5365 && y >= 4908 && y < 4912 && z = 1) {
            return [ 5397, 4914, 1 ];
        } else if(player.gameState["switch_5371_5047_2"] = true && x = 5291 && y >= 4986 && y < 4990 && z = 1) {
            return [ 5510, 5067, 1 ];
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        return null;
    },
};
