SECTIONS["22,27"] := {
    "init": this => {
    },
    "start": this => {
    },
    "teleport": (this, x, y, z) => {
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 5323 && y = 6629 && z = 1) {
            timedMessage(x, y, z, "to Valora", false);
            return true;
        }
        if(x = 5323 && y = 6645 && z = 1) {
            timedMessage(x, y, z, "to Avined University", false);
            return true;
        }
        if(x = 5331 && y = 6635 && z = 1) {
            timedMessage(x, y, z, "to Valora Forest", false);
            return true;
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        return null;
    },
};
