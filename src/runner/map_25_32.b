SECTIONS["25,32"] := {
    "init": this => {
    },
    "start": this => {
    },
    "teleport": (this, x, y, z) => {
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 6115 && (y = 7730 || y = 7768 || y = 7803) && z = 1) {
            timedMessage(x, y, z, "Avined University", false);
            return true;
        }
        return null;
    }
};
