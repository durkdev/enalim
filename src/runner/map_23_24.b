SECTIONS["23,24"] := {
    "init": this => {
        # setContainer("chest", 6024, 5686, 1, "map", [ "item.thermex", { "shape": "item.book.2", "book": "Raising the dead" } ]);
        # setContainer("chest", 6016, 5686, 1, "map", [ "item.dagger", "item.candle", "item.candle" ]);
        # setContainer("barrel", 5994, 5718, 1, "map", [ "item.bottle", { "shape": "item.book.1", "book": "On ghosts and spirits" } ]);
        # setContainer("barrel", 5958, 5714, 1, "map", [ "item.dagger", { "shape": "item.book.1", "book": "Spell reagents" } ]);
        # setContainer("crate", 5995, 5717, 1, "map", [ "item.bottle", "item.bottle", "item.bottle" ]);
        setCreature(5696, 5886, 1, creaturesTemplates.cow);
    },
    "teleport": (this, x, y, z) => {
        # if(x = 5955 && y >= 5686  && y <= 5689 && z = 1) {
        #     return [6051, 5660, 1];
        # }
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 5673 && y = 5850 && z = 1) {
            timedMessage(x, y, z, "Trinest", false);
            return true;
        }
        return null;
    },
    "locked": (this, x, y, z) => {        
        return null;
    },
};
