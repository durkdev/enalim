SECTIONS["23,30"] := {
    "init": this => {
        setCreature(5698, 7327, 1, creaturesTemplates.ogre);
        setCreature(5683, 7332, 1, creaturesTemplates.ogre);
        setCreature(5683, 7349, 1, creaturesTemplates.ogre);
        setCreature(5670, 7365, 1, creaturesTemplates.ogre);
        setCreature(5654, 7348, 1, creaturesTemplates.ogre);
        setCreature(5657, 7335, 1, creaturesTemplates.ogre);
        setCreature(5542, 7301, 1, creaturesTemplates.ogre);
        setCreature(5604, 7224, 1, creaturesTemplates.ogre);
        setCreature(5608, 7224, 1, creaturesTemplates.ogre);
        setCreature(5605, 7233, 1, creaturesTemplates.ogre);
        setCreature(5608, 7239, 1, creaturesTemplates.ogre);
        setContainer("barrel", 5600, 7222, 1, "map", [ "item.mineral.brigo", "item.mineral.brigo", "item.mineral.brigo", "item.mineral.brigo", "item.mineral.brigo" ]);
    },
    "start": this => {
    },
    "teleport": (this, x, y, z) => {        
        return null;
    },
    "action": (this, x, y, z) => {
        return null;
    },
    "locked": (this, x, y, z) => {
        return null;
    },
};
