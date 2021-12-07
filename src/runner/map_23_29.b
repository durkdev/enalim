def wyntergale_winch() {
    setShape(5713, 6984, 8, "item.winch.off");
}

SECTIONS["23,29"] := {
    "init": this => {
        setContainer("barrel", 5725, 6986, 15, "map", [ "key.wyntergale" ]);
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

        eraseShape(5676, 7050, 1);
        if(player.gameState["switch_5690_7042_1"] = true) {
            setShape(5676, 7050, 1, "door.bars.y");
        } else {
            setShape(5676, 7050, 1, "door.bars.x");
        }
        eraseShape(5644, 7050, 1);
        if(player.gameState["switch_5646_7042_1"] = true) {
            setShape(5644, 7050, 1, "door.bars.y");
        } else {
            setShape(5644, 7050, 1, "door.bars.x");
        }
        eraseShape(5716, 7050, 1);
        if(player.gameState["switch_5720_7042_1"] = true) {
            setShape(5716, 7050, 1, "door.bars.y");
        } else {
            setShape(5716, 7050, 1, "door.bars.x");
        }        
        eraseShape(5733, 7081, 1);
        if(player.gameState["switch_5732_7074_1"] = true) {
            convertNpc(5723, 7082, 1, "ogre");
            setShape(5733, 7081, 1, "door.bars.x");
        } else {
            convertNpc(5723, 7082, 1, "Grum-oh");
            setShape(5733, 7081, 1, "door.bars.y");
        }        
        eraseShape(5679, 7086, 1);
        if(player.gameState["switch_5679_7094_1"] = true) {
            setShape(5679, 7086, 1, "door.bars.x");
        } else {
            setShape(5679, 7086, 1, "door.bars.y");
        }        
        eraseShape(5664, 7086, 1);
        if(player.gameState["switch_5663_7094_1"] = true) {
            setShape(5664, 7086, 1, "door.bars.x");
        } else {
            setShape(5664, 7086, 1, "door.bars.y");
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
        if(x = 5695 && y = 6997 && z = 1) {
            return "key.wyntergale";
        }
        if(x = 5665 && y = 6992 && z = 8) {
            return "key.wyntergale";
        }
        return null;
    },
    "combatWin": (this, creatureId, x, y, z) => {
        if(creatureId = "c.5723.7082.1") {
            startConvo(npcDefs["Grum-oh"], "death");
        }
    },
};
