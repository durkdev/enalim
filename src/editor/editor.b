const TREES = [ "plant.oak", "plant.red", "plant.pine", "plant.willow", "plant.dead", "plant.pine2" ];
const ROCK_ROOF = [ "roof.mountain.1", "roof.mountain.2", "roof.mountain.3" ];
const RUG_SIZE = 2;

const MODE_SECTION = "section";
const MODE_INSERT = "insert";

editor := {
    roofMode: false,
    mode: "",
    lastX: 0,
    lastY: 0,
    dirX: 0,
    dirY: 0,
};

def editorSectionCommand() {
    if(isPressed(Key1)) {
        drawWater(getPosition(), true);
    }
    if(isPressed(Key2)) {
        drawWater(getPosition(), false);
    }
    if(isPressed(Key3)) {
        drawGrass(getPosition(), false);
    }
    if(isPressed(Key4)) {
        drawGrass(getPosition(), true);
    }
    if(isPressed(Key5)) {
        drawMountainSection(getPosition());
    }
    if(isPressed(Key6)) {
        drawTemplate(getPosition(), "grass");
    }
    if(isPressed(Key7)) {
        drawTemplate(getPosition(), "forest1");
    }
    if(isPressed(Key8)) {
        drawTemplate(getPosition(), "forest2");
    }
    if(isPressed(Key9)) {
        drawTemplate(getPosition(), "forest3");
    }
    if(isPressed(Key0)) {
        drawTemplate(getPosition(), "swamp");
    }
}

def editorInsertCommand() {
    step := 0;
    if(isPressed(Key1)) {
        pos := getPosition();
        drawTree(pos[0], pos[1], pos[2]);
        step := 4;
    }
    if(isPressed(Key2)) {
        pos := getPosition();
        x := int(pos[0] / 2) * 2;
        y := int(pos[1] / 2) * 2;        
        drawDungeonCave(x, y, 0);
        step := 2;
    }
    if(isPressed(Key3)) {
        pos := getPosition();
        x := int(pos[0] / 2) * 2;
        y := int(pos[1] / 2) * 2;        
        drawDungeonCave(x, y, 1);
        step := 2;
    }
    if(isPressed(Key4)) {
        pos := getPosition();
        x := int(pos[0] / 4) * 4;
        y := int(pos[1] / 4) * 4;        
        drawDungeon(x, y, 0);
        step := 4;
    }
    if(isPressed(Key5)) {
        drawMountain(getPosition(), 0);
        step := 4;
    }
    if(isPressed(Key6)) {
        drawMountain(getPosition(), 1);
        step := 4;
    }
    if(isPressed(Key7)) {
        drawMountain(getPosition(), -1);
        step := 4;
    }
    if(isPressed(Key8)) {
        drawRiver(getPosition());
        step := 4;
    }
    if(isPressed(Key9)) {
        drawPath(getPosition(), "ground.dirt");
        step := 4;
    }
    if(isPressed(Key0)) {
        drawPath(getPosition(), "ground.grass");
        step := 4;
    }    
    
    if(step != 0 && (editor.dirX != 0 || editor.dirY != 0)) {
        moveViewTo(editor.lastX + editor.dirX * step, editor.lastY + editor.dirY * step);
    }
}

def editorDefaultCommand() {
    if(isPressed(Key0)) {
        setMaxZ(24, null, null);
    }
    if(isPressed(Key1)) {
        setMaxZ(1, null, null);
    }
    if(isPressed(Key2)) {
        setMaxZ(7, null, null);
    }
    if(isPressed(Key3)) {
        setMaxZ(14, null, null);
    }
    if(isPressed(Key4)) {
        setMaxZ(21, null, null);
    }    
    if(isPressed(Key6)) {
        startRug("rug.red");
    }
    if(isPressed(Key7)) {
        startRug("rug.blue");
    }
    if(isPressed(Key8)) {
        startRug("rug.green");
    }
    if(isPressed(Key9)) {
        startRug("rug.black");
    }
}

def editorCommand() {
    pos := getPosition();
    if(editor.lastX != pos[0] || editor.lastY != pos[1]) {
        editor.dirX := normalize(pos[0] - editor.lastX);
        editor.dirY := normalize(pos[1] - editor.lastY);
        editor.lastX := pos[0];
        editor.lastY := pos[1];
    }

    if(isPressed(KeyTab)) {
        if(editor.roofMode) {
            print("to NO roof");
            setMaxZ(24, null, null);
            editor.roofMode := false;
        } else {
            print("to roof");
            setMaxZ(7, "roof.mountain.1", null);
            editor.roofMode := true;
        }
    }

    # switch mode
    if(isPressed(KeyS)) {
        editor.mode := MODE_SECTION;
        setEditorLabel(editor.mode);
    } else if(isPressed(KeyI)) {
        editor.mode := MODE_INSERT;
        setEditorLabel(editor.mode);
    } else if(isPressed(KeyEscape)) {
        editor.mode := "";
        setEditorLabel(editor.mode);
    }

    # mode details
    if(editor.mode = MODE_SECTION) {
        editorSectionCommand();
    } else if(editor.mode = MODE_INSERT) {
        editorInsertCommand();
    } else {
        editorDefaultCommand();
    }
}

def startRug(rug) {
    pos := getPosition();
    #x := int(pos[0] / RUG_SIZE) * RUG_SIZE;
    #y := int(pos[1] / RUG_SIZE) * RUG_SIZE;
    x := pos[0];
    y := pos[1];
    z := int(pos[2]/7)*7 + 1;
    eraseAllExtras(x, y, z);
    setShapeExtra(x, y, z, rug);
    range(-1, 2, 1, xx => {
        range(-1, 2, 1, yy => {
            drawRugEdge(x + xx * RUG_SIZE, y + yy * RUG_SIZE, z, rug);
        });
    });
}

def drawRugEdge(x, y, z, rug) {
    this := len(array_filter(getShapeExtra(x, y, z), s => startsWith(s, "rug."))) > 0;
    if(this = false) {
        return 1;
    }

    eraseAllExtras(x, y, z);
    setShapeExtra(x, y, z, rug);

    n := len(array_filter(getShapeExtra(x, y - RUG_SIZE, z), s => startsWith(s, "rug."))) > 0;
    s := len(array_filter(getShapeExtra(x, y + RUG_SIZE, z), s => startsWith(s, "rug."))) > 0;
    w := len(array_filter(getShapeExtra(x + RUG_SIZE, y, z), s => startsWith(s, "rug."))) > 0;
    e := len(array_filter(getShapeExtra(x - RUG_SIZE, y, z), s => startsWith(s, "rug."))) > 0;
    if(n && s && e && w) {
        return 1;
    }
    if(n && s && w = false) {
        setShapeExtra(x, y, z, "rug.w");
        return 1;
    }
    if(n && s && e = false) {
        setShapeExtra(x, y, z, "rug.e");
        return 1;
    }    
    if(e && w && n = false) {
        setShapeExtra(x, y, z, "rug.n");
        return 1;
    }    
    if(e && w && s = false) {
        setShapeExtra(x, y, z, "rug.s");
        return 1;
    }    
    if(n && e) {
        setShapeExtra(x, y, z, "rug.sw");
        return 1;
    }
    if(n && w) {
        setShapeExtra(x, y, z, "rug.se");
        return 1;
    }    
    if(s && w) {
        setShapeExtra(x, y, z, "rug.ne");
        return 1;
    }        
    if(s && e) {
        setShapeExtra(x, y, z, "rug.nw");
        return 1;
    }
}

def isDungeonFloor(x, y) {
    xx := int(x/4) * 4;
    yy := int(y/4) * 4;
    info := getShape(xx, yy, 0);
    if(info != null && (startsWith(info[0], "ground.cave") || info[0] = "ground.dirt")) {
        return true;
    }
    return false;
}

def isUnderMountain(x, y) {
    info := getShape(x, y, 7);
    if(info != null) {
        return array_find(ROCK_ROOF, e => e = info[0]) != null;
    }
    return false;
}

const dungeonBlock = [
    {
        "floor": "ground.dungeon.1",
        "n": "dungeon.n",
        "s": "dungeon.s",
        "e": "dungeon.e",
        "w": "dungeon.w",
        "nw": "dungeon.nw",
        "ne": "dungeon.ne",
        "se": "dungeon.se",
        "sw": "dungeon.sw",
        "inv_nw": "dungeon.nw.inv",
        "inv_ne": "dungeon.ne.inv",
        "inv_se": "dungeon.se.inv",
        "inv_sw": "dungeon.sw.inv",        
        "black": "dungeon.black",        
    }
];

const dungeonCave = [
    {
        "floor": "ground.cave.3",
        "block": "cave.earth.2x2.2",
        "block_black": "cave.earth.2x2.black",
        "corner_se": "cave.earth.1x1.se",
        "corner_sw": "cave.earth.1x1.sw",
        "corner_ne": ["cave.earth.1x1.ne", "cave.earth.1x1.ne.2"],
        "corner_nw": "cave.earth.1x1.nw",
    },
    {
        "floor": "ground.cave.4",
        "block": "cave.rock.2x2.2",
        "block_black": "cave.earth.2x2.black",
        "corner_se": "cave.rock.1x1.se",
        "corner_sw": "cave.rock.1x1.sw",
        "corner_ne": ["cave.rock.1x1.ne", "cave.rock.1x1.ne.2"],
        "corner_nw": "cave.rock.1x1.nw",
    }
];

def isDungeonGround(x, y) {
    info := getShape(x, y, 0);
    if(info != null && (startsWith(info[0], "ground.dungeon") || info[0] = "ground.dirt")) {
        return true;
    }
    return false;
}

def drawDungeon(x, y, dungeonType) {
    d := dungeonBlock[dungeonType];
    if(isUnderMountain(x, y) && isDungeonGround(x, y)) {
        clearArea(x, y, 4, 4, false);
        setShape(x, y, 7, choose(ROCK_ROOF));
        n := isDungeonGround(x, y - 4);
        s := isDungeonGround(x, y + 4);
        w := isDungeonGround(x + 4, y);
        e := isDungeonGround(x - 4, y);
        ne := isDungeonGround(x - 4, y - 4);
        nw := isDungeonGround(x + 4, y - 4);
        se := isDungeonGround(x - 4, y + 4);
        sw := isDungeonGround(x + 4, y + 4);
        
        # nw corner
        if(n && w && nw) {
        } else if(n && w && nw = false) {
            setShape(x + 2, y, 1, d.inv_se);
        } else if(n = false && w) {
            setShape(x + 2, y, 1, d.n);
        } else if(n && w = false) {
            setShape(x + 2, y, 1, d.w);
        } else if(n = false && w = false && nw = false) {
            setShape(x + 2, y, 1, d.se);
        }

        # ne corner
        if(n && e && ne) {
        } else if(n && e && ne = false) {
            setShape(x, y, 1, d.inv_sw);
        } else if(n = false && e) {
            setShape(x, y, 1, d.n);
        } else if(n && e = false) {
            setShape(x, y, 1, d.e);
        } else if(n = false && e = false && ne = false) {
            setShape(x, y, 1, d.sw);
        }

        # sw corner
        if(s && w && sw) {
        } else if(s && w && sw = false) {
            setShape(x + 2, y + 2, 1, d.inv_ne);
        } else if(s = false && w) {
            setShape(x + 2, y + 2, 1, d.s);
        } else if(s && w = false) {
            setShape(x + 2, y + 2, 1, d.w);
        } else if(s = false && w = false && sw = false) {
            setShape(x + 2, y + 2, 1, d.ne);
        }

        # se corner
        if(s && e && se) {
        } else if(s && e && se = false) {
            setShape(x, y + 2, 1, d.inv_nw);
        } else if(s = false && e) {
            setShape(x, y + 2, 1, d.s);
        } else if(s && e = false) {
            setShape(x, y + 2, 1, d.e);
        } else if(s = false && e = false && se = false) {
            setShape(x, y + 2, 1, d.nw);
        }
    }
}

def isDungeon(x, y) {
    info := getShape(x, y, 1);
    if(info != null && (startsWith(info[0], "cave.earth.2x2") || startsWith(info[0], "cave.rock.2x2"))) {
        return true;
    }
    return false;
}

def drawDungeonCave(x, y, dungeonType) {
    if(isUnderMountain(x, y) && isDungeon(x, y) = false) {
        drawDungeonCaveBlock(x, y, dungeonCave[dungeonType]);
        return true;
    }
    return false;
}

def drawDungeonShape(x, y, z, shapes) {
    if(isDungeonFloor(x, y)) {
        if(typeof(shapes) = "array") {
            setShape(x, y, z, choose(shapes));
        } else {
            setShape(x, y, z, shapes);
        }
    }
}

def drawDungeonCaveBlock(x, y, d) {
    range(0, 2, 1, xx => {
        range(0, 2, 1, yy => {
            eraseShape(x + xx, y + yy, 1);
        });
    });
    if(isDungeonFloor(x + 2, y) = false || isDungeonFloor(x, y + 2) = false) {
        drawDungeonShape(x, y, 1, d.block_black);
    } else {
        drawDungeonShape(x, y, 1, d.block);
    }

    # left
    if(isDungeonFloor(x - 1, y)) {
        if(isDungeon(x - 1, y) = false) {
            eraseShape(x - 1, y, 1);
            if(isDungeon(x - 1, y - 1)) {
                drawDungeonShape(x - 1, y, 1, d.corner_nw);
            } else if(isDungeon(x - 1, y + 1)) {
                drawDungeonShape(x - 1, y, 1, d.corner_sw);
            }
        }
        if(isDungeon(x - 1, y + 1) = false) {
            eraseShape(x - 1, y + 1, 1);
            if(isDungeon(x - 1, y)) {
                drawDungeonShape(x - 1, y + 1, 1, d.corner_nw);
            } else if(isDungeon(x - 1, y + 2)) {
                drawDungeonShape(x - 1, y + 1, 1, d.corner_sw);
            }
        }
    }

    # right
    if(isDungeonFloor(x + 2, y)) {
        if(isDungeon(x + 2, y) = false) {
            eraseShape(x + 2, y, 1);
            if(isDungeon(x + 2, y - 1)) {
                drawDungeonShape(x + 2, y, 1, d.corner_ne);
            } else if(isDungeon(x + 2, y + 1)) {
                drawDungeonShape(x + 2, y, 1, d.corner_se);
            }
        }
        if(isDungeon(x + 2, y + 1) = false) {
            eraseShape(x + 2, y + 1, 1);
            if(isDungeon(x + 2, y)) {
                drawDungeonShape(x + 2, y + 1, 1, d.corner_ne);
            } else if(isDungeon(x + 2, y + 2)) {
                drawDungeonShape(x + 2, y + 1, 1, d.corner_se);
            }
        }
    }


    # above
    if(isDungeonFloor(x, y - 1)) {
        if(isDungeon(x, y - 1) = false) {
            eraseShape(x, y - 1, 1);
            if(isDungeon(x - 1, y - 1)) {
                drawDungeonShape(x, y - 1, 1, d.corner_se);
            } else if(isDungeon(x + 1, y - 1)) {
                drawDungeonShape(x, y - 1, 1, d.corner_sw);
            }
        }
        if(isDungeon(x + 1, y - 1) = false) {
            eraseShape(x + 1, y - 1, 1);
            if(isDungeon(x, y - 1)) {
                drawDungeonShape(x + 1, y - 1, 1, d.corner_se);
            } else if(isDungeon(x + 2, y - 1)) {
                drawDungeonShape(x + 1, y - 1, 1, d.corner_sw);
            }
        }
    }

    # below
    if(isDungeonFloor(x, y + 2)) {
        if(isDungeon(x, y + 2) = false) {
            eraseShape(x, y + 2, 1);
            if(isDungeon(x - 1, y + 2)) {
                drawDungeonShape(x, y + 2, 1, d.corner_ne);
            } else if(isDungeon(x + 1, y + 2)) {
                drawDungeonShape(x, y + 2, 1, d.corner_nw);
            }
        }
        if(isDungeon(x + 1, y + 2) = false) {
            eraseShape(x + 1, y + 2, 1);
            if(isDungeon(x, y + 2)) {
                drawDungeonShape(x + 1, y + 2, 1, d.corner_ne);
            } else if(isDungeon(x + 2, y + 2)) {
                drawDungeonShape(x + 1, y + 2, 1, d.corner_nw);
            }
        }
    }
}

const LAND_UNIT = 16;

def isGround(x, y) {
    info := getShape(x, y, 0);
    if(info = null) {
        return false;
    }
    return info[0] != "ground.water";
}

def highest_frequency(m) {
    mm := null;
    ii := 0;
    a := keys(m);
    while(ii < len(a)) {
        k := a[ii];
        if(mm = null) {
            mm := k;
        } else {
            if(m[k] > m[mm]) {
                mm := k;
            }
        }
        ii := ii + 1;
    }
    return [mm, m[mm]];
}

def fillFloor(x, y, w, h, shape, shape2) {
    range(x, x + w, 4, xx => {
        range(y, y + h, 4, yy => {
            if(xx > x && yy > y && xx < x + w - 4 && yy < y + h - 4 && random() < 0.5 && shape2 != null) {
                setShapeEditor(xx, yy, 0, choose(shape2));
            } else {
                setShapeEditor(xx, yy, 0, shape);
            }
        });
    });    
}

def drawTree(x, y, z) {
    setShape(x, y, z, "plant.trunk");
    setShape(x - 1, y - 1, z + 4, choose(TREES));
}

def getSectorPos(pos) {
    x := int(pos[0] / LAND_UNIT) * LAND_UNIT;
    y := int(pos[1] / LAND_UNIT) * LAND_UNIT;
    return [x, y];
}

def drawTemplate(pos, templateName) {
    sp := getSectorPos(pos);
    x := sp[0];
    y := sp[1];
    clearArea(x, y, LAND_UNIT, LAND_UNIT);
    fillFloor(x, y, LAND_UNIT, LAND_UNIT, "ground.grass", null);
    setTemplate(x, y, templateName);
}

def drawMountainSection(pos) {
    sp := getSectorPos(pos);
    x := sp[0];
    y := sp[1];
    clearArea(x, y, LAND_UNIT, LAND_UNIT);
    range(0, LAND_UNIT, 4, xx => {
        range(0, LAND_UNIT, 4, yy => {
            drawMountain([x + xx, y + yy], -1);
        });
    });

}

def drawGrass(pos, clearFloor=false) {
    sp := getSectorPos(pos);
    x := sp[0];
    y := sp[1];
    clearArea(x, y, LAND_UNIT, LAND_UNIT, clearFloor);
    if(clearFloor) {
        fillFloor(x, y, LAND_UNIT, LAND_UNIT, "ground.grass", null);
    }
}

def drawEdge(fx) {
    range(0, 1 + int(random() * 3), 1, fx);
}

def drawPath(pos, ground) {
    x := int(pos[0] / 4) * 4;
    y := int(pos[1] / 4) * 4;
    clearArea(x, y, 4, 4);
    setShapeEditor(x, y, 0, ground);
}

def drawRiver(pos) {
    x := int(pos[0] / 4) * 4;
    y := int(pos[1] / 4) * 4;
    clearArea(x, y, 4, 4);
    setShapeEditor(x, y, 0, "ground.water");

    range(-1, 2, 1, dx => {
        range(-1, 2, 1, dy => {
            if(dx != 0 || dy != 0) {
                xx := x + dx * 4;
                yy := y + dy * 4;
                
                shape := null;
                info := getShape(xx, yy, 0);
                if(info = null) {
                    shape := "ground.dirt";
                } else {
                    if(info[0] != "ground.water" && info[0] != "ground.dirt") {
                        shape := "ground.dirt";
                    }
                }
                if(shape != null) {
                    clearArea(xx, yy, 4, 4);
                    setShapeEditor(xx, yy, 0, shape);
                }
            }
        });
    });
}

def drawMountain(pos, dungeonType) {
    x := int(pos[0] / 4) * 4;
    y := int(pos[1] / 4) * 4;
    if(isCave(x, y) = false) {
        clearArea(x, y, 4, 4);
        if(dungeonType > -1) {
            setShape(x, y, 0, dungeonCave[dungeonType].floor);
        }
        setShape(x, y, 7, choose(ROCK_ROOF));
        drawMountainEdge(x, y);

        range(-1, 2, 1, dx => {
            range(-1, 2, 1, dy => {
                if(dx != 0 || dy != 0) {
                    drawMountainEdge(x + dx * 4, y + dy * 4);
                }
            });
        });
    }
}

def drawMountainEdge(x, y) {
    if(isCave(x, y)) {
        return 0;
    }

    n := isCave(x, y - 4);
    s := isCave(x, y + 4);
    w := isCave(x + 4, y);
    e := isCave(x - 4, y);
    ne := isCave(x - 4, y - 4);
    nw := isCave(x + 4, y - 4);
    se := isCave(x - 4, y + 4);
    sw := isCave(x + 4, y + 4);
    shape := getMountainShape(n, s, w, e, nw, ne, sw, se);

    #debug := [
    #    ["n", n], ["s", s], ["e", e], ["w", w],
    #    ["ne", ne], ["se", se], ["nw", nw], ["sw", sw],
    #];
    #debug := array_filter(debug, e => e[1]);
    #debug_str := array_reduce(debug, "", (s, e) => {
    #    if(len(s) > 0) {
    #        s := s + ", ";
    #    }
    #    s := s + e[0];
    #    return s;
    #});
    #print("pos=" + x + "," + y + " " + debug_str + " shape=" + shape);

    if(shape != null) {
        floor := getShape(x, y, 0);
        clearArea(x, y, 4, 4);
        if(floor != null) {
            if(floor[0] != "ground.dirt" && floor[0] != "ground.grass" && floor[0] != "ground.water") {
                floor[0] := "ground.grass";
            }
            setShape(x, y, 0, floor[0]);
        }
        setShape(x, y, 1, shape);
    }
}

def getMountainShape(n, s, w, e, nw, ne, sw, se) {
    if(n && ne && e) {
        return "mountain.sw.2";
    }
    if(e && se && s) {
        return "mountain.nw.2";
    }
    if(s && sw && w) {
        return "mountain.ne.2";
    }
    if(w && nw && n) {
        return "mountain.se.2";
    }
    if(n) {
        return "mountain.s";
    }
    if(s) {
        return "mountain.n";
    }
    if(e) {
        return "mountain.w";
    }
    if(w) {
        return "mountain.e";
    }
    if(se) {
        return "mountain.nw";
    }
    if(sw) {
        return "mountain.ne";
    }
    if(ne) {
        return "mountain.sw";
    }
    if(nw) {
        return "mountain.se";
    }
}

def isCave(x, y) {
    #info := getShape(x, y, 0);
    #if(info = null) {
    #    return false;
    #}
    #return startsWith(info[0], "ground.cave");
    return isUnderMountain(x, y);
}

def isMountain(x, y) {
    info := getShape(x, y, 1);
    if(info = null) {
        return false;
    }
    return startsWith(info[0], "mountain.");
}

def getMountain(x, y) {
    info := getShape(x, y, 1);
    if(info = null) {
        return null;
    }
    return info[0];
}

def drawWater(pos, drawBeach) {
    sp := getSectorPos(pos);
    x := sp[0];
    y := sp[1];

    n := isGround(x + LAND_UNIT/2, y - 1);
    s := isGround(x + LAND_UNIT/2, y + LAND_UNIT);
    w := isGround(x - 1, y + LAND_UNIT/2);
    e := isGround(x + LAND_UNIT, y + LAND_UNIT/2);

    clearArea(x, y, LAND_UNIT, LAND_UNIT);
    fillFloor(x, y, LAND_UNIT, LAND_UNIT, "ground.water", null);
    
    if(drawBeach) {
        # edges
        if(n) {
            print("north edge");
            range(x, x + LAND_UNIT, 4, xx => {
                drawEdge(i => setShapeEditor(xx, y + i * 4, 0, "ground.dirt"));
            });
        }
        if(s) {
            print("south edge");
            range(x, x + LAND_UNIT, 4, xx => {
                drawEdge(i => setShapeEditor(xx, y + LAND_UNIT - 4 - i * 4, 0, "ground.dirt"));
            });
        }
        if(e) {
            print("east edge");
            range(y, y + LAND_UNIT, 4, yy => {
                drawEdge(i => setShapeEditor(x + LAND_UNIT - 4 - i * 4, yy, 0, "ground.dirt"));
            });
        }
        if(w) {
            print("west edge");
            range(y, y + LAND_UNIT, 4, yy => {
                drawEdge(i => setShapeEditor(x + i * 4, yy, 0, "ground.dirt"));
            });
        }
    }
}

# put this last so parse errors make the app panic()
def main() {
}
