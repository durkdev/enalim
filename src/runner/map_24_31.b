SECTIONS["24,31"] := {
    "init": this => {
    },
    "start": this => {
    },
    "teleport": (this, x, y, z) => {
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 5942 && y = 7479 && z = 1) {
            timedMessage(x, y, z, "to Aneil", false);
            return true;
        }
        if(x = 5935 && y = 7473 && z = 1) {
            timedMessage(x, y, z, "to Valora", false);
            return true;
        }
        if(x = 5931 && y = 7489 && z = 1) {
            timedMessage(x, y, z, "to Avined University", false);
            return true;
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        return null;
    },
};
