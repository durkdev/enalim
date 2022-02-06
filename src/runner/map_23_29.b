def wyntergale_winch() {
    setShape(5713, 6984, 8, "item.winch.off");
}

SECTIONS["23,29"] := {
    "init": this => {
        setContainer("barrel", 5725, 6986, 15, [ "key.wyntergale" ]);
        setCreature(5524, 7023, 1, creaturesTemplates.ogre);
        setCreature(5531, 7023, 1, creaturesTemplates.ogre);
        setCreature(5539, 7023, 1, creaturesTemplates.ogre);
        setCreature(5610, 7125, 1, creaturesTemplates.ogre);
        setCreature(5612, 7139, 1, creaturesTemplates.ogre);
        setCreature(5618, 7141, 1, creaturesTemplates.ogre);
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
        if(x = 5609 && y >= 7076 && y <= 7079 && z = 1) {
            return [5467, 7057, 1];
        }
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
        if(x = 5755 && y = 6972 && z = 1) {
            timedMessage(x, y, z, "to Valora", false);
            return true;
        }
        if(x = 5753 && y = 6984 && z = 1) {
            timedMessage(x, y, z, "Castle Wyntergale", false);
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
        if(creatureId = "c.5723.7082.1" && player.gameState["grumoh.secret"] = 1) {
            startConvo(npcDefs["Grum-oh"], "death");
        }
    },
    "onDrop": (this, x, y, z, shape) => {
        if(x >= 5648 && x <= 5651 && y >= 7056 && y <= 7059 && z = 1 && isExtra(shape) = false) {
            setWyntergaleCave(true);
        }
    },
    "onPickup": (this, x, y, z, shape) => {
        if(x >= 5648 && x <= 5651 && y >= 7056 && y <= 7059 && z = 1 && isExtra(shape) = false) {
            setWyntergaleCave(false);
        }
        if(x >= 5521 && x <= 5534 && y >= 7137 && y <= 7150 && startsWith(shape, "item.corpse") && player.gameState["library.underworld"] = null) {
            player.gameState["library.underworld"] := 1;
            convertNpc(5540, 7138, 1, "skeleton_red");
            array_foreach(SK_POS, (i, e) => convertNpc(e[0], e[1], e[2], "skeleton_red"));
            startConvo(npcDefs["Eldric"], "_combat_");
            return true;
        }
        return false;
    },
};

def setWyntergaleCave(show) {
    print("wyntergale cave: " + show);
    range(5620, 5628, 2, x => {
        eraseShape(x, 7050, 1);
    });
    if(show) {
        setShape(5620, 7050, 1, "dungeon.nw.inv");
        setShape(5626, 7050, 1, "dungeon.ne.inv");
        range(7052, 7068, 4, y => {
            setShape(5620, y, 0, "ground.dirt");
            setShape(5624, y, 0, "ground.dirt");
        });        
        range(7052, 7068, 2, y => {
            setShape(5620, y, 1, "dungeon.e");
            setShape(5626, y, 1, "dungeon.w");
        });
    } else {
        range(5620, 5628, 2, x => {
            setShape(x, 7050, 1, "dungeon.s");
        });
        range(7052, 7068, 2, y => {
            eraseShape(5620, y, 1);
            eraseShape(5626, y, 1);
        });
        range(7052, 7068, 4, y => {
            eraseShape(5620, y, 0);
            eraseShape(5624, y, 0);
        });        
    }
    timedMessage(5650, 7058, 4, "Craaack!", true);
}
