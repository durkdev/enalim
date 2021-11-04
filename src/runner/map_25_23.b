SECTIONS["25,23"] := {
    "init": this => {
        setBook(6050, 5654, 3, "map", "On ghosts and spirits");
        setBook(6048, 5650, 10, "map", "Raising the dead");
        setContainer("barrel", 6045, 5644, 1, "map", [ "item.dagger", "item.candle", "item.candle" ]);
        setCreature(6067, 5660, 1, creaturesTemplates.cow);
        setCreature(6072, 5662, 1, creaturesTemplates.cow);
    },
    "start": this => {
        eraseShape(6051, 5691, 1);
        if(player.gameState["gate_to_ruins"] != null) {
            setShape(6051, 5691, 1, "teleport.y");
        }
    },
    "teleport": (this, x, y, z) => {
        if(x = 6049 && y >= 5660  && y <= 5663 && z = 1) {
            return [5958, 5687, 1];
        }
        if(x >= 6051 && x <= 6054 && y = 5691) {
            if(player.gameState["start_journey"] != null) {
                return [5503, 5745, 1];
            }
            if(player.gameState["gate_to_ruins"] != null) {
                return [6320, 5394, 1];
            }
        }
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 6057 && y = 5613 && z = 1) {
            timedMessage(x, y, z, "Beware of ghosts!", false);
            return true;
        }
        return null;
    }
};
