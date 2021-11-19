SECTIONS["23,27"] := {
    "init": this => {
    },
    "start": this => {
    },
    "teleport": (this, x, y, z) => {
        return null;
    },
    "action": (this, x, y, z) => {
        return null;
    },
    "locked": (this, x, y, z) => {
        if(x = 5596 && y = 6643 && z = 1) {
            return "item.key.krynt";
        }
        return null;
    },
};
