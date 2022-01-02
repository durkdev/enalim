SECTIONS["25,32"] := {
    "init": this => {
    },
    "start": this => {
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
        return null;
    }
};
