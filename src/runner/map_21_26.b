SECTIONS["21,26"] := {
    "init": this => {
        setContainer("crate", 5278, 6314, 2, "map", [ "item.mineral.brigo", "item.mineral.brigo.ingot", "item.mineral.brigo" ]);
        setContainer("crate", 5278, 6314, 1, "map", [ "item.gem.ruby", "item.mineral.brigo", "item.mineral.brigo.ingot" ]);
        setContainer("crate", 5278, 6312, 1, "map", [ "item.mineral.brigo.ingot", "item.mineral.brigo.ingot" ]);
        setContainer("crate", 5278, 6312, 2, "map", [ "item.mineral.brigo" ]);
        setContainer("barrel", 5275, 6312, 1, "map", [ "item.mineral.brigo.ingot" ]);
        setContainer("barrel", 5275, 6314, 1, "map", [ "item.mineral.brigo", "item.mineral.brigo" ]);

        setBook(5255, 6392, 5, "map", "Brigo processing");
        setBook(5249, 6393, 5, "map", "The nature of magic");
        setBook(5249, 6391, 5, "map", "On ghosts and spirits");
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
