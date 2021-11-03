SECTIONS["25,23"] := {
    "init": this => {
        # setBook(7973, 5126, 3, "map", "On ghosts and spirits");
        setCreature(6067, 5660, 1, creaturesTemplates.cow);
        setCreature(6072, 5662, 1, creaturesTemplates.cow);
    },
    "teleport": (this, x, y, z) => {
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 6057 && y = 5613 && z = 1) {
            timedMessage(x, y, z, "Beware of ghosts!", false);
            return true;
        }
        return null;
    }
};
