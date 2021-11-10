SECTIONS["24,24"] := {
    "init": this => {
    },
    "teleport": (this, x, y, z) => {
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 5769 && y = 5908 && z = 1) {
            timedMessage(x, y, z, "Trinest", false);
            return true;
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        return null;
    },
};
