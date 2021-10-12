SECTIONS["30,25"] := {
    "init": this => {
    },
    "teleport": (this, x, y, z) => {
        return null;
    },
    "locked": (this, x, y, z) => {
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 6083 && y = 5106 && z = 1) {
            timedMessage(x, y, z, "Valora", false);
            return true;            
        }
        return null;
    }
};