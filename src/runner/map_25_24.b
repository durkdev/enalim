SECTIONS["25,24"] := {
    "init": this => {
        setCreature(5019, 4993, 1, creaturesTemplates.cow);
        setCreature(5189, 4992, 1, creaturesTemplates.goblin);
        setCreature(5162, 4981, 1, creaturesTemplates.goblin);
        setCreature(5167, 4981, 1, creaturesTemplates.goblin);
        setCreature(5182, 4932, 1, creaturesTemplates.ogre);
        setCreature(5182, 4932, 1, creaturesTemplates.ogre);
        setCreature(5170, 4932, 1, creaturesTemplates.ogre);
        setContainer("chest", 4998, 4970, 1, "map", [ "item.thermex", { "shape": "item.book.2", "book": "Raising the dead" } ]);
        setContainer("chest", 5002, 4960, 1, "map", [ "item.dagger", "item.candle", "item.candle" ]);
        setContainer("chest", 5184, 4926, 3, "map", [ "key.ourdlen2", "item.candle" ]);
        setBook(5125, 4995, 3, "map", "In the shadow of Vreit");
    },
    "start": this => {
        eraseShape(5003, 4966, 1);
        if(player.gameState["gate_to_ruins"] != null) {
            setShape(5003, 4966, 1, "teleport.x");
        }
    },
    "teleport": (this, x, y, z) => {
        if(x = 5003 && y <= 4970 && y >= 4966 && z = 1) {
            if(player.gameState["start_journey"] != null) {
                return [5324, 5005, 1];
            }
            if(player.gameState["gate_to_ruins"] != null) {
                return [5178, 5084, 2];
            }
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        if(x = 5021 && y = 4968 && z = 1) {
            return "key.storage_room";
        }
        if(x = 5174 && y = 4957 && z = 1) {
            return "key.ourdlen";
        }
        return null;
    },
};
