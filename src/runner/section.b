
const SECTION_SIZE = 240;

activeSections := [];

def getSectionPos(x, y) {
    return [ int(x / SECTION_SIZE), int(y / SECTION_SIZE) ];
}

def getSection(sectionX, sectionY) {
    return SECTIONS["" + sectionX + "," + sectionY];
}

def onSectionLoad(sectionX, sectionY, data) {
    if(len(keys(data)) = 0) {
        # initialize a section
        print("+++ Initial load " + sectionX + "," + sectionY);
        section := getSection(sectionX, sectionY);
        if(section != null) {
            section.init();

            # add npc-s
            array_foreach(keys(npcDefs), (i, name) => {
                # only add npc if not in party
                npc := npcDefs[name];
                pos := npc.schedule[0].pos;
                sectionPos := getSectionPos(pos[0], pos[1]);
                if(sectionPos[0] = sectionX && sectionPos[1] = sectionY) {
                    if(npc["addByScript"] != true) {
                        setNpc(pos[0], pos[1], pos[2], npc);
                    }
                }
            });
        }
        print("+++ Init done " + sectionX + "," + sectionY);
    } else {
        # restore a section from saved data
        print("+++ Restore load " + sectionX + "," + sectionY);
        array_foreach(data.creatures, (i, c) => restoreCreature(c));
        array_foreach(data.items, (i, c) => restoreItem(c));
        print("+++ Done restoring " + sectionX + "," + sectionY);
    }

    # start section
    section := getSection(sectionX, sectionY);
    if(section != null) {
        if(section["start"] != null) {
            section.start();
        }
    }

    setRoofVisiblity();
    activeSections[len(activeSections)] := [sectionX, sectionY];
}

def beforeSectionSave(sectionX, sectionY) {
    array_remove(activeSections, s => s[0] = sectionX && s[1] = sectionY);
    save_game();
    return { 
        "creatures": pruneCreatures(sectionX, sectionY), 
        "items": pruneItems("map", sectionX, sectionY, true),
    };
}

def restartActiveSections() {
    array_foreach(activeSections, (i, p) => {
        print("Restarting active section: " + p[0] + "," + p[1]);
        section := getSection(p[0], p[1]);
        if(section != null) {
            if(section["start"] != null) {
                section.start();
            }
        }    
    });
}

def teleport(x, y, z) {
    sectionPos := getSectionPos(x, y);
    section := getSection(sectionPos[0], sectionPos[1]);
    if(section != null) {
        return section.teleport(x, y, z);
    }
    return null;
}

def scriptedAction(x, y, z) {
    sectionPos := getSectionPos(x, y);
    section := getSection(sectionPos[0], sectionPos[1]);
    if(section != null) {
        if(section["action"] != null) {
            return section.action(x, y, z);
        }
    }
    return null;
}

def combatWin(x, y, creatureId, creatureX, creatureY, creatureZ) {
    sectionPos := getSectionPos(x, y);
    section := getSection(sectionPos[0], sectionPos[1]);
    if(section != null) {
        if(section["combatWin"] != null) {
            section.combatWin(creatureId, creatureX, creatureY, creatureZ);
        }
    }    
}

def onDrop(x, y, z, shape) {
    sectionPos := getSectionPos(x, y);
    section := getSection(sectionPos[0], sectionPos[1]);
    if(section != null) {
        if(section["onDrop"] != null) {
            section.onDrop(x, y, z, shape);
        }
    }    
}

def onPickup(x, y, z, shape) {
    sectionPos := getSectionPos(x, y);
    section := getSection(sectionPos[0], sectionPos[1]);
    if(section != null) {
        if(section["onPickup"] != null) {
            return section.onPickup(x, y, z, shape);
        }
    }
    return false;
}
