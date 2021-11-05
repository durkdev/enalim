SECTIONS["26,22"] := {
    "init": this => {
        setContainer("barrel", 6391, 5318, 1, "map", [ "key.ourdlen2", "item.gem.ruby", { "shape": "item.book.1", "book": "The book of Vreit" } ]);
        setCreature(6396, 5322, 1, creaturesTemplates.ogre);
        setCreature(6396, 5331, 1, creaturesTemplates.ogre);
        setCreature(6427, 5354, 1, creaturesTemplates.goblin);
        setCreature(6436, 5356, 1, creaturesTemplates.goblin);
        setCreature(6448, 5346, 1, creaturesTemplates.goblin);
        setCreature(6470, 5367, 1, creaturesTemplates.goblin);
    },
    "teleport": (this, x, y, z) => {
        if(x = 6374 && y >= 5424  && y <= 5427 && z = 1) {
            return [6051, 5695, 1];
        }
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 6431 && y = 5344 && z = 1) {
            timedMessage(x, y, z, "Danger! Stay out!", false);
            return true;
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        if(x = 6427 && y = 5343 && z = 1) {
            return "key.ourdlen";
        }
        return null;
    },
};
