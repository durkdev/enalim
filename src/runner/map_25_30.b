SECTIONS["25,30"] := {
    "init": this => {
        setBook(6239, 7249, 3, "On the shaping of metals");
    },
    "start": this => {
    },
    "teleport": (this, x, y, z) => {
        if(x = 6226 && y >= 7246  && y <= 7249 && z = 1) {
            return [6352, 7311, 1];
        }
        if(x = 6226 && y >= 7314  && y <= 7317 && z = 1) {
            return [6352, 7311, 1];
        }
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 6227 && y = 7311 && z = 1) {
            timedMessage(x, y, z, "Safety first!", false);
            return true;
        }
        if(x = 6227 && y = 7320 && z = 1) {
            timedMessage(x, y, z, "Warning: Meteorite!", false);
            return true;
        }
        if(x = 6226 && y = 7241 && z = 1) {
            timedMessage(x, y, z, "Delude smithy", false);
            return true;
        }
        if(x = 6237 && y = 7246 && z = 1 && player.gameState["forge_6237_7246_1"] = null) {
            if(isItemInInventory("item.ore.meteorite", true)) {
                player.gameState["forge_6237_7246_1"] := 1;
                player.inventory.add("item.sword.magic");
                timedMessage(x, y, z, "You forge a magic weapon!", true);
                return true;
            }
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
