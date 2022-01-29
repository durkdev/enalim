SECTIONS["25,30"] := {
    "init": this => {
        setBook(6239, 7249, 3, "map", "On the shaping of metals");
    },
    "start": this => {
    },
    "teleport": (this, x, y, z) => {
        # if(x = 5955 && y >= 5686  && y <= 5689 && z = 1) {
        #     return [6051, 5660, 1];
        # }
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 6227 && y = 7311 && z = 1) {
            timedMessage(x, y, z, "Safety first!", false);
            return true;
        }
        if(x = 6227 && y = 7320 && z = 1) {
            timedMessage(x, y, z, "Warning: Meteorite!", false);
            return true;
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        # if(x = 6563 && y = 5391 && z = 1) {
        #     return "key.ourdlen2";
        # }
        return null;
    },
};
