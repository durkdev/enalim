SECTIONS["27,25"] := {
    "init": this => {
        setCreature(5494, 5075, 1, creaturesTemplates.skeleton);
        setCreature(5487, 5095, 1, creaturesTemplates.skeleton);
        setCreature(5487, 5103, 1, creaturesTemplates.skeleton);
        setCreature(5487, 5110, 1, creaturesTemplates.skeleton);
        setCreature(5471, 5130, 1, creaturesTemplates.skeleton);
        setCreature(5446, 5130, 1, creaturesTemplates.skeleton);
        
        setCreature(5448, 5146, 1, creaturesTemplates.skeleton_blue);
        setCreature(5440, 5143, 1, creaturesTemplates.skeleton);
        setCreature(5440, 5149, 1, creaturesTemplates.skeleton);
        setCreature(5403, 5089, 1, creaturesTemplates.skeleton_blue);
        setCreature(5413, 5109, 1, creaturesTemplates.skeleton_red);
        setCreature(5421, 5109, 1, creaturesTemplates.skeleton_red);
        setCreature(5430, 5109, 1, creaturesTemplates.skeleton_red);
        setCreature(5440, 5109, 1, creaturesTemplates.skeleton);
    },
    "teleport": (this, x, y, z) => {
        if(y = 5015 && x <= 5483 && x >= 5480 && z = 1) {
            return [5405, 4969, 1];
        } else if(x = 5506 && y >= 5067 && y < 5071 && z = 1) {
            return [ 5297, 4986, 1 ];
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        return null;
    },
    "action": (this, x, y, z) => {
        return null;
    }
};
