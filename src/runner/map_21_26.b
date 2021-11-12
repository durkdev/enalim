SECTIONS["21,26"] := {
    "init": this => {
        setContainer("crate", 5278, 6314, 2, "map", [ "item.mineral.brigo", "item.mineral.brigo", "item.mineral.brigo" ]);
        setContainer("crate", 5278, 6314, 1, "map", [ "item.gem.ruby", "item.mineral.brigo", "item.mineral.brigo" ]);
        setContainer("crate", 5278, 6312, 1, "map", [ "item.mineral.brigo", "item.mineral.brigo" ]);
        setContainer("crate", 5278, 6312, 2, "map", [ "item.mineral.brigo" ]);
        setContainer("barrel", 5275, 6312, 1, "map", [ "item.mineral.brigo" ]);
        setContainer("barrel", 5275, 6314, 1, "map", [ "item.mineral.brigo", "item.mineral.brigo" ]);
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
        return null;
    },
};
