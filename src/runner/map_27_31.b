def aneil_winch() {
    setShape(6502, 7441, 8, "item.winch.off");
}

SECTIONS["27,31"] := {
    "init": this => {
    },
    "start": this => {
        eraseShape(6511, 7461, 1);
        if(player.gameState["aneil.gate"] = true) {
            setShape(6511, 7461, 1, "door.bars.x");
        } else {
            setShape(6511, 7461, 1, "door.bars.y");
        }
    },
    "teleport": (this, x, y, z) => {
        # if(x = 5955 && y >= 5686  && y <= 5689 && z = 1) {
        #     return [6051, 5660, 1];
        # }
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 6516 && y = 7459 && z = 1) {
            timedMessage(x, y, z, "Aneil", false);
            return true;
        }
        if(x = 6502 && y = 7441 && z = 8) {
            if(player.gameState["aneil.gate"] = true) {
                player.gameState["aneil.gate"] := false;
            } else {
                player.gameState["aneil.gate"] := true;
            }
            setShape(6502, 7441, 8, "item.winch.on.1");
            setTimer(0.5, "aneil_winch");
            restartActiveSections();
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
