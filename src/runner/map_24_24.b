SECTIONS["24,24"] := {
    "init": this => {
    },
    "teleport": (this, x, y, z) => {
        if(x = 5873 && y >= 5892  && y <= 5895 && z = 1) {
            return [5742, 5873, 1];
        }
        if(x = 5841 && y >= 5846  && y <= 5849 && z = 1) {
            return [5710, 5834, 1];
        }
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 5770 && y = 5908 && z = 1) {
            timedMessage(x, y, z, "Trinest", false);
            return true;
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        return null;
    },
};
