const TITLE_X = 4204;
const TITLE_Y = 4175;

const MODE_INIT = "init";
const MODE_GAME = "game";
const MODE_TELEPORT = "teleport";
const MODE_CONVO = "convo";
const MODE_TITLE = "title";
const MODE_TITLE2 = "title2";
const MODE_TITLE3 = "title3";
const MODE_TITLE4 = "title4";
const MODE_BOOK = "book";
const MODE_EXIT = "exit";

const PLAYER_SHAPE = "lydell";

#const PLAYER_SHAPES = [
#"",
#"-sword",
#"-axe",
#"-bow",
#"-staff",
#"-lance",
#"-dagger",
#];

# the global player state
player := {
    id: "player",
    shape: PLAYER_SHAPE,
    shapeIndex: 0,
    mode: MODE_INIT,
    move: null,
    underRoof: false,
    roof: null,
    teleportPos: null,
    convo: null,
    elapsedTime: 0,
    dragShape: null,
    inventoryUi: null,
    inventory: null,
    attackTimer: 0,
    coolTimer: 0,
    attackTarget: null,
    lastAttackTarget: null,
    combatMode: false,
    gameState: {
        unlocked: [],
    },
    cursor: "cursor.nw",
    mouseDrive: false,
    mouseOnInteractive: 0,
    hp: 20,
    equipment: null,
    coins: 100,
    movie: null,
    movieState: 0,
    party: [],
    partyFormationIndex: 0,
    moveTimer: 0,
    moving: false,
};    

# the player's shape size
const PLAYER_X = 2;
const PLAYER_Y = 2;
const PLAYER_Z = 4;

const PLAYER_MOVE_SPEED = 0.085;

const EVENTS_MAP = {};

const REPLACE_SHAPES = {
    "door.wood.y": "door.wood.x",
    "door.wood.x": "door.wood.y",
    "door.black.y": "door.black.x",
    "door.black.x": "door.black.y"    
};

# called when the hour changes
def onHour(hour) {
    # print("* HOUR tick: " + hour);
    evalNpcSchedules(hour);
    # print("* HOUR tick done");
}

# called on every frame
def events(delta, fadeDir, mouseX, mouseY, mouseWorldX, mouseWorldY, mouseWorldZ, mouseButtonDown, mouseOnInteractive) {
    player.mouseX := mouseX;
    player.mouseY := mouseY;
    player.mouseWorldX := mouseWorldX;
    player.mouseWorldY := mouseWorldY;
    player.mouseWorldZ := mouseWorldZ;
    player.mouseButtonDown := mouseButtonDown;
    player.mouseOnInteractive := mouseOnInteractive;
    player.elapsedTime := player.elapsedTime + delta;

    EVENTS_MAP[player.mode](delta, fadeDir);
}

def eventsConvo(delta, fadeDir) {
    if(isPressed(KeyEscape)) {
        endConvo();
    } else {
        if(isPressed(KeyW) || isPressed(KeyUp)) {
            decrConvoAnswerIndex();
        }
        if(isPressed(KeyS) || isPressed(KeyDown)) {
            incrConvoAnswerIndex();
        }
        if(isPressed(KeySpace)) {
            fireConvoAnswerIndex();
        }

        setConvoAnswerIndexAt(player.mouseX, player.mouseY);

        if(didClick()) {
            getClick();
            fireConvoAnswerIndex();
        }

        setCursor("cursor.hand");
        player.move.setAnimation(ANIM_STAND);
        stopCreatures();
        renderConvo();    
    }
}

def eventsInit(delta, fadeDir) {
    if(fadeDir > -1) {
        player.mode := MODE_TITLE;        
        addImage(260, 380, "logo");
        addMessage(610, 450, "2021 (c) Gabor Torok", 1, 200, 200, 200);
        addMessage(610, 485, "Press SPACE to start", 1, 128, 128, 128);
    }
}

def eventsTitle(delta, fadeDir) {
    if(isPressed(KeySpace) || didClick()) {
        getClick();        
        player.mode := MODE_TITLE2;
        # all black
        fadeViewTo(500, 500); 
    } else {
        # moveCreatures(delta);
    }
}

def eventsTitle2(delta, fadeDir) {
    if(fadeDir > -1) {
        delAllMessages();
        delAllImages();
        saved := loadMap("savegame.json");
        if(saved = null) {
            player.mode := MODE_TITLE3;
            addMessage(10, 25, "The story so far...", 0, 200, 200, 200);
            o := parseTopic("The story so far: ...");
            array_foreach(o.lines, (index, line) => addMessage(10, 75 + (index * LINE_HEIGHT), line, 0, 128, 128, 128));
            o := parseTopic("And also: ...");
            array_foreach(o.lines, (index, line) => addMessage(10, 200 + (index * LINE_HEIGHT), line, 0, 128, 128, 128));
            addMessage(110, 275, "Press SPACE to continue", 1, 128, 128, 128);
        } else {
            player.move := newMovement(6070, 5651, 1, PLAYER_X, PLAYER_Y, PLAYER_Z, player.shape, PLAYER_MOVE_SPEED, true, false);        
            stopCreatures();        
            load_game(saved);
            moveViewTo(player.move.x, player.move.y);
            player.mode := MODE_TITLE4;
        }
    }
}

def eventsTitle3(delta, fadeDir) {
    if(isPressed(KeySpace) || didClick()) {
        getClick();        
        player.mode := MODE_TITLE4;
        player.move := newMovement(6070, 5651, 1, PLAYER_X, PLAYER_Y, PLAYER_Z, player.shape, PLAYER_MOVE_SPEED, true, false);        
        stopCreatures();        
        fadeViewTo(player.move.x, player.move.y);
    }
}

def eventsTitle4(delta, fadeDir) {
    if(fadeDir > -1) {
        delAllMessages();
        delAllImages();
        player.move.setShape(player.shape);
        player.move.setAnimation(ANIM_STAND);
        array_foreach(player.party, (i, pc) => {
            pc.move.setShape(pc.shape);
            pc.move.setAnimation(ANIM_STAND);
        });
        player.mode := MODE_GAME;
    }
}

def eventsTeleport(delta, fadeDir) {
    if(fadeDir > -1) {
        player.move.erase();
        player.move.set(player.teleportPos[0], player.teleportPos[1], player.teleportPos[2]);
        player.move.setShape(player.shape);
        player.teleportPos := null;
        setRoofVisiblity();
        array_foreach(player.party, (i, pc) => {
            pc.move.erase();
            pc.move.setNear(player.move.x, player.move.y, player.move.z);
            pc.move.setShape(pc.shape);
            pc.move.setAnimation(ANIM_STAND);
        });
        player.mode := MODE_GAME;
    }
    player.move.setAnimation(ANIM_STAND);
    stopCreatures();
}

def eventsGameplay(delta, fadeDir) {
    player.moving := false;
    if(player.movie != null) {
        if(player.movie = "wyntergale") {
            wyntergale_cutscene(delta, fadeDir);
        }
        return;
    }
    if(fadeDir > -1) {
        setRoofVisiblity();
    }

    cursorDir := setCursorAndGetDir();
    animationType := ANIM_STAND;
    if(player.attackTimer > 0) {
        player.attackTimer := player.attackTimer - delta;
        animationType := ANIM_ATTACK;
    } else if(player.coolTimer > 0) {
        if(player.attackTarget != null) {
            attackDamage(player);
        }
        player.coolTimer := player.coolTimer - delta;
    } else if(player.mouseDrive) {
        if(player.mouseButtonDown = 1) {
            dx := cursorDir[0];
            dy := cursorDir[1];
            if(dx != 0 || dy != 0) {
                animationType := ANIM_MOVE;
                player.moving := playerMove(dx, dy, delta);                
            }
        } else {
            player.mouseDrive := false;
            # eat this click
            if(didClick()) {
                getClick();
            }
        }
    } else if(didClick()) {
        handleGameClick();
    } else {
        if(player.mouseButtonDown = 1 && player.mouseOnInteractive = 0 && player.dragShape = null) {
            player.mouseDrive := true;
        }

        d := playerKeyMoveDir();
        dx := d[0];
        dy := d[1];

        if(dx != 0 || dy != 0) {
            animationType := ANIM_MOVE;
            player.moving := playerMove(dx, dy, delta);
        }

        if(isPressed(KeySpace)) {
            if(player.move.operateDoorNearby() = null) {
                if(operateWindow() = false) {
                    if(player.move.findShapeNearby("clock.y", (x, y, z) => timedMessage(x, y, z, getTime())) = false) {
                        player.move.findNearby(1, scriptedAction, null);
                    }
                }
            }
        }

        if(isPressed(KeyT)) {
            player.move.findNpcNearby(startConvo);
        }

        if(isPressed(KeyI)) {
            openInventory(player);
        }

        if(isPressed(KeyE)) {
            openEquipmentPanel(player);
        }

        if(isPressed(KeyEscape)) {
            if(closeTopPanel() != true) {
                startExitMode();
            }
        }

        if(player.combatMode) {
            continueCombat(player);
        }
    }

    if(player.moving) {
        player.moveTimer :+ delta;
    } else {
        player.moveTimer := 0;
    }
    player.lastAnimation := animationType;
    player.move.setAnimation(animationType);
    moveCreatures(delta);
}

const LEFT_DIR_INDEX = 1;
const RIGHT_DIR_INDEX = 2;
const UP_DIR_INDEX = 4;
const DOWN_DIR_INDEX = 8;
const DIR_INDEX_MAP = [
    [0,0], [0,0], [0,0], [0,0], 
    [0,0], [0,0], [0,0], [0,0], 
    [0,0], [0,0], [0,0], [0,0], 
    [0,0], [0,0], [0,0], [0,0], 
];

DIR_INDEX_MAP[LEFT_DIR_INDEX] := [1, -1];
DIR_INDEX_MAP[RIGHT_DIR_INDEX] := [-1, 1];
DIR_INDEX_MAP[UP_DIR_INDEX] := [-1, -1];
DIR_INDEX_MAP[DOWN_DIR_INDEX] := [1, 1];
DIR_INDEX_MAP[LEFT_DIR_INDEX + UP_DIR_INDEX] := [0, -1];
DIR_INDEX_MAP[RIGHT_DIR_INDEX + DOWN_DIR_INDEX] := [0, 1];
DIR_INDEX_MAP[LEFT_DIR_INDEX + DOWN_DIR_INDEX] := [1, 0];
DIR_INDEX_MAP[RIGHT_DIR_INDEX + UP_DIR_INDEX] := [-1, 0];

def playerKeyMoveDir() {
    dirIndex := 0;
    if(isDown(KeyA) || isDown(KeyLeft)) {
        dirIndex :+ LEFT_DIR_INDEX;
    }
    if(isDown(KeyD) || isDown(KeyRight)) {
        dirIndex :+ RIGHT_DIR_INDEX;
    }
    if(isDown(KeyW) || isDown(KeyUp)) {
        dirIndex :+ UP_DIR_INDEX;
    }
    if(isDown(KeyS) || isDown(KeyDown)) {
        dirIndex :+ DOWN_DIR_INDEX;
    }
    return DIR_INDEX_MAP[dirIndex];
}

def handleGameClick() {
    pos := getClick();
    dragging := pos[3];
    isDragStart := pos[4];
    dragAction := pos[5];
    dragIndex := pos[6];
    print("click: pos=" + pos[0] + "," + pos[1] + "," + pos[2] + " dragging=" + dragging + " dragAction=" + dragAction + " dragIndex=" + dragIndex + " isDragStart=" + isDragStart);
    if(dragging) {
        if(isDragStart) {
            startDrag(pos, dragAction, dragIndex);
        } else {
            endDrag(pos);
        }
    } else if(dragAction = "") {
        panel := getOverPanel();
        if(panel[0] != null) {
            # raise clicked panel
            if(startsWith(panel[0], "inv.")) {
                openInventory(getCreatureById(substr(panel[0], 4)));
            } else if(startsWith(panel[0], "equ.")) {
                raisePanel(panel[0], "player");
                if(panel[0] = "equ.player") {
                    px := panel[1];
                    py := panel[2];
                    if(px >= 120 && px < 164 && py >= 704 && py < 747) {
                        player.partyFormationIndex :+ 1;
                        if(player.partyFormationIndex >= 3) {
                            player.partyFormationIndex := 0;
                        }
                    }
                }
                c := getCreatureById(substr(panel[0], 4));
                updateEquipmentPanel(c);
                if(panel[1] >= 104 * SLOT_POS_MUL && panel[1] < 150 * SLOT_POS_MUL && panel[2] >= 208 * SLOT_POS_MUL && panel[2] < 251 * SLOT_POS_MUL) {
                    openInventory(c);
                }                
            } else {
                c := getItemById(panel[0]);
                raisePanel(c.id, c.uiImage);
            }
        } else {
            shape := getDraggableShape(pos[0], pos[1], pos[2]);
            print("click on no shape");
            if(shape = null) {
                return 1;
            }
            print("shape:" + shape + " at " + pos[0] + "," + pos[1] + "," + pos[2]);

            creature := getCreature(pos[0], pos[1], pos[2]);
            if(creature != null && creature.template.movement = "hunt") {
                startCombat(creature, player);
                return 1;
            }

            d := player.move.distanceTo(pos[0], pos[1], pos[2]);
            # print("SHAPE CLICK: " + d);
            if(d > 8) {
                # too far
                setCursorTmp("cursor.no");
                return 1;
            }

            if(player.move.operateDoorAt(pos[0], pos[1], pos[2])) {
                return 1;
            }

            if(player.move.operateSwitch(pos[0], pos[1], pos[2])) {
                restartActiveSections();
                return 1;
            }

            if(operateWindowAt(shape[0], pos[0], pos[1], pos[2])) {
                return 1;
            }

            if(shape[0] = "clock.y") {
                timedMessage(pos[0], pos[1], pos[2], getTime(), false);
                return 1;
            }

            if(scriptedAction(pos[0], pos[1], pos[2])) {
                return 1;
            }

            if(openContainer(shape[1], shape[2], shape[3], "map")) {
                return 1;
            }

            if(shape[0] = player.shape) {
                openEquipmentPanel(player);
                return 1;
            }

            if(creature != null && creature.npc != null) {
                if(creature.npc.partyIndex != null) {
                    openEquipmentPanel(creature);
                    return 1;
                } else {
                    print("convo with creature: " + creature.id);
                    startConvo(creature.npc);
                    return 1;
                }
            }

            print("MAP click: mouseOnInteractive=" + player.mouseOnInteractive);
            if(player.mouseOnInteractive = 1) {
                timedMessage(shape[1], shape[2], shape[3], getObjectDescription(shape[0]), false);
            }
        }
    } else {
        if(openContainer(dragIndex, -1, -1, dragAction)) {
            return 1;
        }
        
        desc := getObjectDescription(getContainedShape(dragAction, dragIndex));
        timedMessageXY(player.mouseX, player.mouseY, desc, false);
    }
}

def getContainedShape(location, index) {
    if(startsWith(location, "inv.")) {
        pc := getCreatureById(substr(location, 4));
        return pc.inventory.items[index].shape;
    } else if(startsWith(location, "equ.")) {
        pc := getCreatureById(substr(location, 4));
        return pc.equipment.getDescription(index);
    } else {
        c := getItemById(location);
        return c.items.items[index].shape;
    }
}

def startExitMode() {
    raisePanel("exit", "marble");
    updatePanel("exit", [{
        "type": "uiText",
        "text": "Exit game?",
        "x": 75,
        "y": 35,
        "fontIndex": 0,
    },{
        "type": "uiText",
        "text": "Press SPACE to quit.",
        "x": 70,
        "y": 100,
        "fontIndex": 1,
    }]);
    centerPanel("exit");
    player.mode := MODE_EXIT;
}

def setCursorAndGetDir() {
    if(player.dragShape != null) {
        setCursor("cursor.hand");
        return [0,0];
    }
    if(player.mouseDrive = false && player.mouseOnInteractive = 1) {
        setCursor("cursor.hand");
        return [0,0];
    }
    dir := getDirScreen(player.mouseX, player.mouseY);
    dx := 0;
    dy := 0;
    cursor := "";
    if(dir = DIR_W) {
        dx := 1; dy := -1;
        cursor := "cursor.w";
    }
    if(dir = DIR_E) {
        dx := -1; dy := 1;
        cursor := "cursor.e";
    }
    if(dir = DIR_N) {
        dx := -1; dy := -1;
        cursor := "cursor.n";
    }
    if(dir = DIR_S) {
        dx := 1; dy := 1;
        cursor := "cursor.s";
    }
    if(dir = DIR_NE) {
        dx := -1;
        cursor := "cursor.ne";
    }
    if(dir = DIR_SE) {
        dy := 1;
        cursor := "cursor.se";
    }
    if(dir = DIR_NW) {
        dy := -1;
        cursor := "cursor.nw";
    }
    if(dir = DIR_SW) {
        dx := 1;
        cursor := "cursor.sw";
    }
    setCursor(cursor);
    return [dx, dy];
}

def eventsExit(delta, fadeDir) {
    if(isPressed(KeyEscape)) {
        closeTopPanel();
        setCalendarPaused(false);
        player.mode := MODE_GAME;
    }

    if(isPressed(KeySpace)) {
        exitEvent();
        exit();
    }
}

# called by golang on exit
def exitEvent() {
    saveGame();
}

def eventsBook(delta, fadeDir) {
    if(isPressed(KeyEscape)) {
        closeTopPanel();
        setCalendarPaused(false);
        player.mode := MODE_GAME;
    }

    if(isPressed(KeyA) || isPressed(KeyLeft)) {
        turnBookPage(-1);
    }
    if(isPressed(KeyD) || isPressed(KeyRight)) {
        turnBookPage(1);
    }

    if(didClick()) {
        getClick();
        if(player.mouseX < getConfigNumber("top.args.width")/2) {
            turnBookPage(-1);
        } else {
            turnBookPage(1);
        }
    }
    setCursor("cursor.hand");
}


def playerMove(dx, dy, delta) {
    moved := player.move.moveInDir(dx, dy, delta, checkTeleportLocations, null);
    if(moved = false && dx != 0 && dy != 0) {
        moved := player.move.moveInDir(0, dy, delta, checkTeleportLocations, null);
    }
    if(moved = false && dx != 0 && dy != 0) {
        moved := player.move.moveInDir(dx, 0, delta, checkTeleportLocations, null);
    }
    if(moved) {
        setRoofVisiblity();
    }
    return moved;
}

def setRoofVisiblity() {
    # if under a roof, hide the roof
    inspectRoof();
    if(player.underRoof) {
        if(startsWith(player.roof, "roof.mountain")) {
            setMaxZ(getRoofZ(player.move.z), player.roof, null);
            overrideLight(true, 50, 50, 135);
        } else {
            setMaxZ(getRoofZ(player.move.z), null, "roof.mountain.1");
            overrideLight(false, 0, 0, 0);
        }
    } else {
        setMaxZ(24, null, "roof.mountain.1");
        overrideLight(false, 0, 0, 0);
    }
    updatePlayerLight();
}

def updatePlayerLight() {
    # player carries light?
    found := false;
    e := player.equipment.equipment[SLOT_LEFT_HAND];
    if(e != null && isLightShape(e)) {
        found := true;
    } else {
        i := 0;
        while(found = false && i < len(player.party)) {
            e := player.party[i].equipment.equipment[SLOT_LEFT_HAND];
            if(e != null && isLightShape(e)) {
                found := true;
            }
            i :+ 1;
        }
    }

    if(found) {
        setPlayerLight(1);
    } else {
        setPlayerLight(0);
    }
}

def checkTeleportLocations(newX, newY, newZ) {
    # check teleport locations
    player.teleportPos := teleport(newX, newY, player.move.z);
    if(player.teleportPos != null) {
        # erase player or else it stays on map sometimes...
        player.move.erase();
        array_foreach(player.party, (i, pc) => {
            pc.move.erase();
        });
        player.mode := MODE_TELEPORT;
        fadeViewTo(player.teleportPos[0], player.teleportPos[1]);
        return true;
    }
    return false;
}

const WIN_X_POS = [
    [ 2, 0, 0, 0, 1, 0 ],
    [ -2, 0, 1, 0, 0, 0 ],
    [ 0, 3, 0, 0, 0, -1 ],
    [ 0, -3, -1, 0, 0, 0 ],
];
const WIN_Y_POS = [
    [ 0, 2, 0, 0, 0, 1 ],
    [ 0, -2, 1, 0, 0, 0 ],
    [ 3, 0, 0, 0, -1, 0 ],
    [ -3, 0, -1, 0, 0, 0 ],
];

def operateWindowAt(shape, x, y, z) {
    winX := [0, 0, 0];
    winY := [0, 0, 0];
    if(shape = "window.x") {
        winX[0] := x;
        winX[1] := y;
        winX[2] := z;
    }
    if(shape = "window.y") {
        winY[0] := x;
        winY[1] := y;
        winY[2] := z;
    }

    # no windows near
    if(winX[0] = 0 && winY[0] = 0) {
        return false;
    }

    a := [0, 0, 0];
    if(winX[0] > 0) {
        a := winX;
        pos := array_find(WIN_X_POS, e => isShapeAt("window.x", a[0] + e[0], a[1] + e[1], a[2]));
        if(pos != null) {
            changeWindowState(a, pos, "window.x", "window.y");
        }
    } else {
        a := winY;
        pos := array_find(WIN_Y_POS, e => isShapeAt("window.y", a[0] + e[0], a[1] + e[1], a[2]));
        if(pos != null) {            
            changeWindowState(a, pos, "window.y", "window.x");
        }
    }
    
    return true;
}

def operateWindow() {
    return player.move.findNearby(1, (x,y,z) => {
        info := getShape(x, y, z);
        if(info != null && (info[0] = "window.x" || info[0] = "window.y")) {
            return info;
        }
        return null;
    }, info => operateWindowAt(info[0], info[1], info[2], info[3]));
}

def changeWindowState(a, pos, oShape, nShape) {
    b := [a[0] + pos[0], a[1] + pos[1], a[2]];
    eraseShape(a[0], a[1], a[2]);
    eraseShape(b[0], b[1], b[2]);
    if(isEmpty(a[0] + pos[2], a[1] + pos[3], a[2], nShape) && isEmpty(b[0] + pos[4], b[1] + pos[5], b[2], nShape)) {
        setShape(a[0] + pos[2], a[1] + pos[3], a[2], nShape);
        setShape(b[0] + pos[4], b[1] + pos[5], b[2], nShape);
    } else {
        print("player blocks!");
        setShape(a[0], a[1], a[2], oShape);
        setShape(b[0], b[1], b[2], oShape);
    }
}

def isShapeAt(shape, x, y, z) {
    info := getShape(x, y, z);
    if(info != null) {
        return info[0] = shape;
    }
    return false;
}

def getRoofZ(z) {
    # roofs are only at certain heights
    return (int(z / 7) + 1) * 7;
}

def inspectRoof() {
    # roofs are only at certain heights
    testZ := player.move.z;
    while(testZ < 24) {
        z := getRoofZ(testZ);
        player.underRoof := true;
        player.roof := null;
        player.move.forBase((x, y) => {
            info := getShape(x, y, z);
            if(info = null) {
                player.underRoof := false;
                player.roof := null;
            } else if(substr(info[0], 0, 5) != "roof." && substr(info[0], 0, 6) != "floor.") {
                player.underRoof := false;
                player.roof := null;
            } else {
                player.roof := info[0];
            }            
        });
        if(player.underRoof) {
            return true;
        }
        testZ := testZ + 7;
    }
    return false;
}

def unlock_door(x, y, z, isPlayer) {
    # check if this door is unlocked
    locked := array_find(player.gameState.unlocked, u => u.x = x && u.y = y && u.z = z) = null;
    if(locked) {
        key := null;

        # is there a key for this door?
        sectionPos := getSectionPos(x, y);
        section := getSection(sectionPos[0], sectionPos[1]);
        if(section != null) {
            if(section["locked"] != null) {
                key := section.locked(x, y, z);                        
            }
        }

        if(key = null) {
            # if there is no key, the door is open
            locked := false;
        } else if(locked && isPlayer && array_find(player.inventory.items, item => item.shape = key) != null) {
            # does the player have the key?
            locked := false;
            player.gameState.unlocked[len(player.gameState.unlocked)] := { "x": x, "y": y, "z": z };
            #print("Player unlocks the door with " + key);
            timedMessage(x, y, z, "Door is unlocked!", false);
        }        
    }
    return locked;
}

def timedMessage(x, y, z, message, rise=false) {
    showMessageAt(x, y, z, message, 2, MESSAGE_R, MESSAGE_G, MESSAGE_B, rise);
}

def timedMessageXY(x, y, message, rise=false) {
    showMessageAtXY(x, y, message, 2, MESSAGE_R, MESSAGE_G, MESSAGE_B, rise);
}

def save_game() {
    if(player.move != null) {
        # Collect the items in the global items array that are also in the inventories of the pc-s.
        # Collect them but don't remove them.
        # The items in the inventory have extended definitions (book contents, container contents, etc. in global items.)
        inv_items := pruneItems("inv.player", 0, 0, false);
        array_foreach(player.party, (i, pc) => array_concat(inv_items, pruneItems("inv." + pc.id, 0, 0, false)));
        saveMap("savegame.json", {
            "calendar": getCalendarRaw(),
            "gameState": player.gameState,
            "items": inv_items,
            "inventory": player.inventory.encode(),
            "equipment": player.equipment.encode(),
            "move": player.move.encode(),
            "hp": player.hp,
            "coins": player.coins,
            "party": array_map(player.party, pc => encodeCreature(pc)),
        });
    }
}

def load_game(saved) {
    setCalendarRaw(saved.calendar);
    player.hp := saved.hp;
    player.coins := saved.coins;
    player.gameState := saved.gameState;
    array_foreach(saved.items, (i, c) => restoreItem(c));
    player.inventory.decode(saved.inventory);
    player.move.decode(saved.move);
    player.equipment.decode(saved.equipment);
    player.party := array_map(saved.party, pc => {
        c := restoreCreature(pc);
        return c;
    });
    array_foreach(player.party, (i, pc) => {
        pc.npc.partyIndex := i;
        pc.move.speed := PLAYER_MOVE_SPEED;
    });
    setShapeFromEquipment(player);
    array_foreach(player.party, (i, pc) => setShapeFromEquipment(pc));
}

def setShapeNearby(targetX, targetY, targetZ, shape, isExtra) {
    pos := [-1, -1, -1];

    path := findPath(
        player.move.x, player.move.y, player.move.z, 
        targetX, targetY, targetZ, 
        false, 2, 20, 20);
    if(path != null) {
        pos[0] := targetX;
        pos[1] := targetY;
        pos[2] := targetZ;
    } else {
        range(1, 4, 1, r => {
            range(-1 * r, r + 1, 1, x => {
                range(-1 * r, r + 1, 1, y => {
                    if(pos[0] = -1) {
                        sx := targetX + x;
                        sy := targetY + y;
                        # can the player reach this position?
                        path := findPath(
                            player.move.x, player.move.y, player.move.z, 
                            sx, sy, targetZ, 
                            false, 2, 20, 20);
                        if(path != null) {
                            pos[0] := sx;
                            pos[1] := sy;
                            pos[2] := targetZ;
                        }
                    }
                });
            });    
        });
    }   
    # can't find position: put it under the player 
    if(pos[0] = -1) {
        pos[0] := player.move.x;
        pos[1] := player.move.y;
        pos[2] := player.move.z;
    }
    if(isExtra) {
        setShapeExtra(pos[0], pos[1], pos[2], shape);
    } else {
        setShape(pos[0], pos[1], pos[2], shape);
    }
}

def joinParty(pc) {
    pc.npc.partyIndex := len(player.party);    
    player.party[len(player.party)] := pc;
    timedMessage(player.move.x, player.move.y, player.move.z, pc.npc.name + " joins the party!", true);
}

def main() {
    # register npc-s
    array_foreach(npcReg, (i, npc) => registerNpc(npc));

    initObjects();
    initCreatures();

    EVENTS_MAP[MODE_INIT] := (s, d,f) => eventsInit(d, f);
    EVENTS_MAP[MODE_TELEPORT] := (s, d,f) => eventsTeleport(d, f);
    EVENTS_MAP[MODE_CONVO] := (s, d,f) => eventsConvo(d, f);
    EVENTS_MAP[MODE_TITLE] := (s, d,f) => eventsTitle(d, f);
    EVENTS_MAP[MODE_TITLE2] := (s, d,f) => eventsTitle2(d, f);
    EVENTS_MAP[MODE_TITLE3] := (s, d,f) => eventsTitle3(d, f);
    EVENTS_MAP[MODE_TITLE4] := (s, d,f) => eventsTitle4(d, f);
    EVENTS_MAP[MODE_GAME] := (s, d,f) => eventsGameplay(d, f);
    EVENTS_MAP[MODE_BOOK] := (s, d,f) => eventsBook(d, f);
    EVENTS_MAP[MODE_EXIT] := (s, d,f) => eventsExit(d, f);

    # init player
    player.inventory := newInventory();    
    player.equipment := newEquipment();

    setPathThroughShapes(keys(REPLACE_SHAPES));

    fadeViewTo(500, 500);    
}
