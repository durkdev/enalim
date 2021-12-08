SECTIONS["22,29"] := {
    "init": this => {
    },
    "start": this => {
    },
    "teleport": (this, x, y, z) => {
        if(x = 5465 && y >= 7056 && y <= 7059 && z = 1) {
            return [5611, 7077, 1];
        }
        return null;
    },
    "action": (this, x, y, z) => {
        return null;
    },
    "locked": (this, x, y, z) => {
        return null;
    },
};
