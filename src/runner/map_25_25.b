const MAP_25_25 = {
    "init": this => {
        setCreature(5023, 5001, 1, creaturesTemplates.cow);
        setContainer("chest", 5015, 5017, 1, "map", [ "item.bottle", "item.book.1" ]);
        setContainer("chest", 5010, 5021, 1, "map", [ "item.candle", "item.candle", "item.book.2" ]);
        setBook(5027, 5017, 3, "map", "Raising the dead");
        setBook(5031, 5013, 6, "map", "Necromantic reagents");
    },
    "teleport": (this, x, y, z) => {
        if(x = 5000 && y <= 5034 && y >= 5030 && z = 1) {
            return [4998, 4989, 1];
        }
        return null;
    }    
};
