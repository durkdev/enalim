SECTIONS["25,32"] := {
    "init": this => {
    },
    "start": this => {
        eraseShape(6216, 7791, 1);
        if(player.gameState["avined.catacombs.open"] = 1) {
            setShape(6216, 7791, 1, "door.bars.y");            
            fab := array_find(creatures, c => c.id = "c.6066.7763.1");
            if(fab != null) {
                removeCreatureById("c.6066.7763.1");
            }
            if(player.gameState["avenid.boss.fight"] != 1) {
                fab := array_find(creatures, c => c.id = "c.6216.7741.1");
                if(fab = null) {
                    setNpc(6216, 7741, 1, npcDefs["Fabriantes2"]);
                }
            }
        } else {
            setShape(6216, 7791, 1, "door.bars.x");
        }
    },
    "teleport": (this, x, y, z) => {
        if(x = 6036 && y >= 7832  && y <= 7835 && z = 1) {
            return [6211, 7848, 1];
        }
        if(x = 6209 && y >= 7848  && y <= 7851 && z = 1) {
            return [6038, 7832, 1];
        }
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 6115 && (y = 7730 || y = 7768 || y = 7803) && z = 1) {
            timedMessage(x, y, z, "Avined University", false);
            return true;
        }
        if(x = 6049 && y = 7837 && z = 1) {
            timedMessage(x, y, z, "University Catacombs", false);
            return true;
        }
        if(x = 6053 && y = 7749 && z = 1) {
            timedMessage(x, y, z, "Memory trail", false);
            return true;
        }
        if(x = 6228 && y = 7830 && z = 1) {
            player.gameState["avenid.sign.1"] := 1;
            timedMessage(x, y, z, "Secten Erd", false);
            return true;
        }
        if(x = 6206 && y = 7830 && z = 1) {
            player.gameState["avenid.sign.2"] := 1;
            timedMessage(x, y, z, "Firdn Mos", false);
            return true;
        }
        if(x = 6206 && y = 7806 && z = 1) {
            player.gameState["avenid.sign.3"] := 1;
            timedMessage(x, y, z, "Mossdu Ust", false);
            return true;
        }
        if(x = 6228 && y = 7806 && z = 1) {
            player.gameState["avenid.sign.4"] := 1;
            timedMessage(x, y, z, "Unnen Flr", false);
            return true;
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        if(x = 6216 && y = 7844 && z = 1) {
            return "key.avined";
        }
        return null;
    },
    "combatWin": (this, creatureId, x, y, z) => {
        # fabriantes killed
        if(creatureId = "c.6216.7741.1") {
            player.gameState["avined.quest"] := 1;
        }
    },
};
