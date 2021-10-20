SECTIONS["27,24"] := {
    "init": this => {
        setCreature(5409, 4917, 1, creaturesTemplates.goblin);
        setCreature(5414, 4931, 1, creaturesTemplates.goblin);
        setCreature(5406, 4937, 1, creaturesTemplates.goblin);

        # in caves
        setCreature(5443, 4909, 1, creaturesTemplates.goblin);
        setCreature(5437, 4904, 1, creaturesTemplates.goblin);
        setCreature(5420, 4910, 1, creaturesTemplates.goblin);
        setCreature(5415, 4897, 1, creaturesTemplates.goblin);
    },
    "teleport": (this, x, y, z) => {
        if(x >= 5400 && x <= 5401 && y >= 4968 && y <= 4971) {
            return [5481, 5017, 1];
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        return null;
    }
};
