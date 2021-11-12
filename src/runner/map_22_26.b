SECTIONS["22,26"] := {
    "init": this => {
    },
    "start": this => {
    },
    "teleport": (this, x, y, z) => {
        return null;
    },
    "action": (this, x, y, z) => {
        if(x = 5367 && y = 6392 && z = 1) {
            timedMessage(x, y, z, "Valora", false);
            return true;
        }
        if(x = 5320 && y = 6375 && z = 1) {
            timedMessage(x, y, z, "Valora Cemetery", false);
            return true;
        }
        if(x = 5281 && y = 6393 && z = 1) {
            timedMessage(x, y, z, "Hall of Justice", false);
            return true;
        }
        if(x = 5331 && y = 6361 && z = 1) {
            timedMessage(x, y, z, "Ye will be missed Smelly John", false);
            return true;
        }
        if(x = 5331 && y = 6369 && z = 1) {
            player.gameState["martyn_dead"] := true;
            timedMessage(x, y, z, "RIP Martyn of Valora", false);
            return true;
        }
        if(x = 5345 && y = 6371 && z = 1) {
            timedMessage(x, y, z, "Here lies Vern", false);
            return true;
        }
        if(x = 5347 && y = 6361 && z = 1) {
            timedMessage(x, y, z, "Just woe and dust is all we are", false);
            return true;
        }
        if(x = 5355 && y = 6373 && z = 1) {
            timedMessage(x, y, z, "G'bye Yorn, ye were a good man", false);
            return true;
        }
        if(x = 5363 && y = 6365 && z = 1) {
            timedMessage(x, y, z, "Beala is gone and lies here ever on", false);
            return true;
        }
        return null;
    },
    "locked": (this, x, y, z) => {
        return null;
    },
};
