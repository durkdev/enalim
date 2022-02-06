SECTIONS["23,25"] := {
    "init": this => {        
        setContainer("crate", 5593, 6036, 1, [ "item.bottle", "item.trash.fish.2", "item.pants.blue", "item.dagger" ]);
        setCreature(5560, 6023, 1, creaturesTemplates.goblin);
        setCreature(5555, 6024, 1, creaturesTemplates.goblin);
        setCreature(5551, 6029, 1, creaturesTemplates.goblin);
        setCreature(5557, 6030, 1, creaturesTemplates.goblin);
        setCreature(5532, 6028, 1, creaturesTemplates.goblin);
        setCreature(5534, 6041, 1, creaturesTemplates.goblin);

        setCreature(5618, 6096, 1, creaturesTemplates.skeleton);
        setCreature(5623, 6096, 1, creaturesTemplates.skeleton);
        setCreature(5624, 6101, 1, creaturesTemplates.skeleton);
        setCreature(5656, 6170, 1, creaturesTemplates.skeleton);
        setCreature(5656, 6176, 1, creaturesTemplates.skeleton);
        setCreature(5668, 6176, 1, creaturesTemplates.skeleton);
        setCreature(5668, 6170, 1, creaturesTemplates.skeleton);
        setCreature(5668, 6164, 1, creaturesTemplates.skeleton);
        setCreature(5674, 6169, 1, creaturesTemplates.skeleton_blue);
        setCreature(5674, 6175, 1, creaturesTemplates.skeleton_blue);
        setCreature(5681, 6120, 1, creaturesTemplates.skeleton);
        setCreature(5682, 6127, 1, creaturesTemplates.skeleton);
        setCreature(5686, 6133, 1, creaturesTemplates.skeleton);
        setCreature(5719, 6102, 1, creaturesTemplates.skeleton);
        setCreature(5720, 6106, 1, creaturesTemplates.skeleton);
        setCreature(5741, 6104, 1, creaturesTemplates.skeleton);
        setCreature(5746, 6104, 1, creaturesTemplates.skeleton);
        setCreature(5746, 6098, 1, creaturesTemplates.skeleton);
        setCreature(5732, 6096, 1, creaturesTemplates.skeleton_blue);
        setCreature(5720, 6088, 1, creaturesTemplates.skeleton_red);

        setBook(5667, 6021, 3, "On ghosts and spirits");
    },
    "combatWin": (this, creatureId, x, y, z) => {
        if(creatureId = "c.5720.6088.1") {
            # drop "item.gem.theohadron"
            setShapeNearby(x, y, z, "item.gem.theohadron", true);
        }
    },
    "teleport": (this, x, y, z) => {
        if(x = 5619 && y >= 6128 && y <= 6131 && z = 1) {
            return [ 5503, 5996, 1 ];
        }
        if(x = 5651 && y >= 6122 && y <= 6125 && z = 1) {
            return [ 5505, 6070, 1 ];
        }
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 5638 && y = 6067 && z = 1) {
            timedMessage(x, y, z, "Dungeon Ravenous", false);
            return true;
        }
        return null;
    },
    "locked": (this, x, y, z) => {        
        return null;
    },
};
