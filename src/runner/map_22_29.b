SECTIONS["22,29"] := {
    "init": this => {
        setCreature(5478, 7195, 1, creaturesTemplates.ogre);
        setCreature(5484, 7190, 1, creaturesTemplates.ogre);
        setCreature(5494, 7186, 1, creaturesTemplates.ogre);
        setCreature(5477, 7117, 1, creaturesTemplates.ogre);
        setCreature(5488, 7114, 1, creaturesTemplates.ogre);
        setCreature(5493, 7103, 1, creaturesTemplates.ogre);
    },
    "start": this => {
    },
    "teleport": (this, x, y, z) => {
        if(x = 5465 && y >= 7056 && y <= 7059 && z = 1) {
            return [5611, 7077, 1];
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
