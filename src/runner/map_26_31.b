SECTIONS["26,31"] := {
    "init": this => {
        setBook(6464, 7478, 5, "map", "The book of gems");
        setBook(6458, 7473, 4, "map", "The nature of magic");
        setBook(6454, 7490, 3, "map", "The book of Vesnu");
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
        if(x = 6430 && y = 7457 && z = 1) {
            timedMessage(x, y, z, "Sage of Aneil", false);
            return true;
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        if(x = 6456 && y = 7488 && z = 1) {
            return "key.aneil";
        }
        return null;
    },
};
