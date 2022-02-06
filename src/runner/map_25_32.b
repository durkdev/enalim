SECTIONS["25,32"] := {
    "init": this => {
        setBook(6102, 7809, 3, "The nature of magic");
        setBook(6074, 7825, 4, "Fenlen grammar primer");
        setBook(6039, 7777, 4, "Guide to arms and armor");
        setBook(6040, 7777, 4, "Guide to arms and armor");
        setBook(6043, 7777, 4, "Raising the dead");
        setBook(6038, 7761, 4, "On ghosts and spirits");
        setBook(6073, 7767, 3, "Spell reagents");
        setBook(6066, 7771, 3, "Spell reagents");
        setBook(6068, 7790, 4, "The nature of magic");
        setBook(6069, 7790, 4, "Spell reagents");
        setBook(6066, 7793, 4, "Fenlen grammar primer");
        setBook(6066, 7730, 3, "The age of Krynt");
        setBook(6091, 7736, 3, "The age of Krynt");
        setBook(6104, 7740, 3, "The age of Krynt");

        setContainer("chest", 6065, 7737, 1, [ "item.ring.silver" ]);
        setContainer("barrel", 6065, 7783, 1, [ "item.boots.leather" ]);
        setContainer("barrel", 6082, 7825, 1, [ "item.staff.yew" ]);
        setContainer("barrel", 6043, 7825, 8, [ "item.bow.shortbow" ]);
    },
    "start": this => {
        eraseShape(6216, 7791, 1);
        if(player.gameState["avined.catacombs.open"] = 1) {
            setShape(6216, 7791, 1, "door.bars.y");            
            removeCreatureById("c.6066.7763.1");
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
        if(x = 6214 && y = 7748 && z = 2 && player.gameState["avined.quest"] = 1) {
            eraseShape(6214, 7748, 2);
            setShape(6214, 7748, 2, "item.orb.confusion.2");
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
