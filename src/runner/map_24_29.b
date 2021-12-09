SECTIONS["24,29"] := {
    "init": this => {
    },
    "start": this => {
    },
    "teleport": (this, x, y, z) => {        
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 5764 && y = 6975 && z = 1) {
            timedMessage(x, y, z, "to Avined University", false);
            return true;
        }        
        return null;
    },
    "locked": (this, x, y, z) => {
        return null;
    },
};
