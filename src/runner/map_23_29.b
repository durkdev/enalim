SECTIONS["23,29"] := {
    "init": this => {
    },
    "start": this => {
        # eraseShape(5620, 6734, 1);
        # if(player.gameState["switch_5620_6703_1"] = true) {
        #     setShape(5620, 6734, 1, "door.bars.y");
        # } else {
        #     setShape(5620, 6734, 1, "door.bars.x");
        # }        
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
