SECTIONS["27,22"] := {
    "init": this => {
        setBook(6557, 5382, 3, "map", "The book of Vreit");
        setBook(6537, 5463, 3, "map", "The book of Vreit");
        setBook(6525, 5444, 3, "map", "The book of Vreit");
        setBook(6521, 5426, 3, "map", "The book of Vreit");
        setBook(6495, 5441, 5, "map", "The book of Vreit");
        setBook(6527, 5421, 3, "map", "Spell reagents");
        setContainer("chest", 6521, 5422, 1, "map", [ "item.dagger", "item.candle", "item.belt.1" ]);
        setCreature(6488, 5414, 1, creaturesTemplates.goblin);
        setCreature(6493, 5416, 1, creaturesTemplates.goblin);
        setCreature(6493, 5434, 2, creaturesTemplates.goblin);
        setCreature(6497, 5438, 3, creaturesTemplates.goblin);
    },
    "teleport": (this, x, y, z) => {
        # if(x = 5955 && y >= 5686  && y <= 5689 && z = 1) {
        #     return [6051, 5660, 1];
        # }
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 6488 && y = 5396 && z = 1) {
            timedMessage(x, y, z, "Sacred Caverns", false);
            return true;
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        if(x = 6563 && y = 5391 && z = 1) {
            return "key.ourdlen2";
        }
        return null;
    },
};
