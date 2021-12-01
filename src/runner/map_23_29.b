def wyntergale_winch() {
    setShape(5713, 6984, 8, "item.winch.off");
}

SECTIONS["23,29"] := {
    "init": this => {
    },
    "start": this => {
        eraseShape(5712, 6981, 1);
        eraseShape(5727, 6981, 1);
        if(player.gameState["wyntergale.gate"] = true) {
            setShape(5712, 6981, 1, "door.bars.x");
            setShape(5727, 6981, 1, "door.bars.x"); 
        } else {
            setShape(5712, 6981, 1, "door.bars.y");
            setShape(5727, 6981, 1, "door.bars.y");
        }
    },
    "teleport": (this, x, y, z) => {
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 5713 && y = 6984 && z = 8) {
            if(player.gameState["wyntergale.gate"] = true) {
                player.gameState["wyntergale.gate"] := false;
            } else {
                player.gameState["wyntergale.gate"] := true;
            }
            setShape(5713, 6984, 8, "item.winch.on.1");
            setTimer(0.5, "wyntergale_winch");
            restartActiveSections();
            return true;
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        return null;
    },
};
