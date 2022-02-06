def openInventory(pc) {
    raisePanel("inv." + pc.id, "inventory");
    updateInventoryUi(pc);
}

def updateInventoryUi(pc) {
    updatePanel("inv." + pc.id, pc.inventory.render());
}

def addToInventory(pc, shape, container, panelX, panelY) {
    index := pc.inventory.add(shape, panelX, panelY);
    updateInventoryUi(pc);
    if(container != null) {
        container.updateLocation(index, -1, -1, "inv." + pc.id);
    }
    debugInventory(pc);
}

def equipItem(pc, shape, panelX, panelY) {
    obj := OBJECTS_BY_SHAPE[shape];
    if(obj != null && obj.slot != null) {
        # remove equipped item if any
        if(pc.equipment.equipment[obj.slot] != null) {
            addToInventory(pc, pc.equipment.equipment[obj.slot], null, -1, -1);
        }

        # equip new item
        pc.equipment.equipment[obj.slot] := obj.shape;

        # repaint equipment window
        updateEquipmentPanel(pc);

        # change player shape
        setShapeFromEquipment(pc);
        pc.move.erase();
        pc.move.setShape(pc.shape);

        return true;
    }
    return false;
}

def unequipItem(pc, slot) {
    pc.equipment.equipment[slot] := null;
    updateEquipmentPanel(pc);
    setShapeFromEquipment(pc);
    pc.move.erase();
    pc.move.setShape(pc.shape);
    updatePlayerLight();
}

def setShapeFromEquipment(pc) {
    var_shape := array_find(pc.equipment.equipment, shape => {
        if(shape != null) {
            obj := OBJECTS_BY_SHAPE[shape];
            if(obj.variation != null) {
                return true;
            }
        }
        return false;
    });

    baseShape := PLAYER_SHAPE;
    if(pc.id != "player") {
        baseShape := toLower(pc.npc.name);
    }
    pc.shape := baseShape;
    if(var_shape != null) {
        obj := OBJECTS_BY_SHAPE[var_shape];
        pc.shape := baseShape + "-" + obj.variation;
        pc.move.shape := pc.shape;
    }
}

def openEquipmentPanel(pc) {
    raisePanel("equ." + pc.id, "player");
    updateEquipmentPanel(pc);
}

def updateEquipmentPanel(pc) {
    c := pc.equipment.render();
    name := "Lydell";
    if(pc.id = "player") {
        c[len(c)] := {
            type: "uiImage",
            img: "party." + (player.partyFormationIndex + 1),
            x: 120,
            y: 704,
            drag: false,
        };
    } else {
        name := pc.npc.name;
    }
    c[len(c)] := {
        type: "uiText",
        x: 15,
        y: 30,
        text: name,
        fontIndex: 0
    };
    updatePanel("equ." + pc.id, c);
}

def openContainer(x, y, z, location) {
    c := getContainer(x, y, z, location);
    if(c = null) {
        if(location != "map") {
            print("No item at " + x + " in " + location + ":");
            array_foreach(containers, (i, c) => {
                if(c.location = location) {
                    print("\t" + c.x + " " + c.uiImage);
                }
            });
        }
        return false;
    }
    print("openContainer: c=" + c + " type=" + c.type);
    if(c.type = CONTAINER_TYPE) {
        raisePanel(c.id, c.uiImage);
        updateContainerUi(c);
        return true;
    }
    if(c.type = BOOK_TYPE) {
        raisePanel(c.id, c.uiImage);
        centerPanel(c.id);
        lockPanel(c.id);
        openBook.currentPage := 0;
        updateBookUi(c);
        setCalendarPaused(true);
        player.mode := MODE_BOOK;
        return true;
    }
    return false;
}

def updateContainerUi(c) {
    updatePanel(c.id, c.inventory.render());
}

def startDrag(pos, action, index) {
    if(startsWith(action, "inv.")) {
        pc := getCreatureById(substr(action, 4));
        # drag from inventory ui
        item := pc.inventory.remove(index);
        player.dragShape := {
            "shape": item.shape,
            "pos": [item.x, item.y, -1],
            "fromUi": action,
            "draggedContainer": item.item,
        };
        debugInventory(pc);
        updateInventoryUi(pc);
    } else if(startsWith(action, "equ.")) {
        pc := getCreatureById(substr(action, 4));
        # drag from equipment panel (index is the non-null slot)
        usedSlots := [];
        array_foreach(pc.equipment.equipment, (i, e) => {
            if(e != null) {
                usedSlots[len(usedSlots)] := i;
            }
        });
        slot := usedSlots[index];
        player.dragShape := {
            "shape": pc.equipment.equipment[slot],
            "pos": [-1, -1, -1],                
            "fromUi": action,
            "draggedContainer": null,
        };
        unequipItem(pc, slot);
    } else if(startsWith(action, "i.")) {
        # drag from a container ui
        c := getContainerById(action);
        item := c.inventory.remove(index);
        player.dragShape := {
            "shape": item.shape,
            "pos": [item.x, item.y, -1],                
            "fromUi": action,
            "draggedContainer": item.item,
        };
        updateContainerUi(c);
    } else {
        info := getDraggableShape(pos[0], pos[1], pos[2]);
        if(info != null && onPickup(info[1], info[2], info[3], info[0]) != true) {
            # drag from map
            player.dragShape := {
                "shape": info[0],
                "pos": [info[1], info[2], info[3]],
                "fromUi": "map",
                "draggedContainer": getContainer(info[1], info[2], info[3], "map"),
            };
            eraseDraggableShape(info[1], info[2], info[3], info[4]);            
        }
    }
    setCursorShape(player.dragShape.shape);
}

def debugInventory(pc) {
    print("------------------------------");
    print("inventory:");
    array_foreach(pc.inventory.items, (i, c) => {
        print("\t" + i + ": " + c.shape + " pos=" + c.x + "," + c.y);
    });
    print("containers:");
    array_foreach(containers, (i, c) => {
        if(c.location = "inv." + pc.id) {
            print("\t" + c.x + " " + c.uiImage);
        }
    });
    print("------------------------------");
}

def endDrag(pos) {
    if(player.dragShape != null) {
        handled := false;
        if(pos[2] > 0) {
            info := getShape(pos[0], pos[1], pos[2] - 1);
            if(info != null) {
                if(info[0] = player.shape) {
                    # drop over character
                    index := player.inventory.add(player.dragShape.shape, -1, -1);
                    updateInventoryUi(player);
                    if(player.dragShape.draggedContainer != null) {
                        player.dragShape.draggedContainer.updateLocation(index, -1, -1, "inv.player");
                    }
                    debugInventory(player);
                    handled := true;
                } else {
                    # drop over pc
                    i := 0; 
                    while(handled = false && i < len(player.party)) {
                        pc := player.party[i];
                        if(info[0] = pc.shape) {
                            # drop over character
                            index := pc.inventory.add(player.dragShape.shape, -1, -1);
                            updateInventoryUi(pc);
                            if(player.dragShape.draggedContainer != null) {
                                player.dragShape.draggedContainer.updateLocation(index, -1, -1, "inv." + pc.id);
                            }
                            debugInventory(pc);
                            handled := true;
                        }
                        i :+ 1;
                    }
                    if(handled = false) {
                        # drop over container
                        c := getContainer(info[1], info[2], info[3], "map");
                        if(c != null) {
                            index := c.inventory.add(player.dragShape.shape, -1, -1);
                            updateContainerUi(c);
                            if(player.dragShape.draggedContainer != null) {
                                player.dragShape.draggedContainer.updateLocation(index, -1, -1, c.id);
                            }
                            handled := true;
                        }
                    }
                }
            }
        }

        if(handled = false) {
            panel := getOverPanel();
            if(panel != null && panel[0] != null) {
                if(startsWith(panel[0], "inv.")) {
                    pc := getCreatureById(substr(panel[0], 4));
                    # drop over inventory panel
                    addToInventory(pc, player.dragShape.shape, player.dragShape.draggedContainer, panel[1], panel[2]);
                    handled := true;
                } else if(startsWith(panel[0], "equ.")) {
                    pc := getCreatureById(substr(panel[0], 4));
                    handled := equipItem(pc, player.dragShape.shape, panel[1], panel[2]);
                } else {
                    # drop over a container panel
                    targetContainer := getContainerById(panel[0]);
                    if(player.dragShape.draggedContainer != null && targetContainer.id = player.dragShape.draggedContainer.id) {
                        # trying to drop container on itself?
                        cancelDrag();
                        handled := true;
                    }
                    if(handled = false) {
                        index := targetContainer.inventory.add(player.dragShape.shape, panel[1], panel[2]);
                        updateContainerUi(targetContainer);
                        if(player.dragShape.draggedContainer != null) {
                            player.dragShape.draggedContainer.updateLocation(index, -1, -1, targetContainer.id);
                        }
                    }
                    handled := true;
                }
            }
        }

        if(handled = false) {
            # drop on map
            x := pos[0];
            y := pos[1];
            z := findTop(x, y, player.dragShape.shape);
            if(z = 0) {
                cancelDrag();
            } else {
                # drop on map
                setDraggableShape(x, y, z, player.dragShape.shape);
                if(player.dragShape.draggedContainer != null) {
                    player.dragShape.draggedContainer.updateLocation(x, y, z, "map");
                }
                onDrop(x, y, z, player.dragShape.shape);
            }
        }

        # dragging is done
        restartActiveSections();
        player.dragShape := null;
        clearCursorShape();
        updatePlayerLight();
    }
}

def cancelDrag() {
    print("Can't drop item there.");
    if(startsWith(player.dragShape.fromUi, "inv.")) {
        pc := getCreatureById(substr(player.dragShape.fromUi, 4));
        # return to inventory
        pc.inventory.add(player.dragShape.shape, player.dragShape.pos[0], player.dragShape.pos[1]);
        debugInventory(pc);
        updateInventoryUi(pc);
    } else if(startsWith(player.dragShape.fromUi, "equ.")) {
        pc := getCreatureById(substr(player.dragShape.fromUi, 4));
        # return to equipment
        equipItem(pc, player.dragShape.shape, -1, -1);
    } else {
        if(player.dragShape.fromUi = "map") {
            # return to original map location
            x := player.dragShape.pos[0];
            y := player.dragShape.pos[1];
            z := player.dragShape.pos[2];
            # drop on map
            setDraggableShape(x, y, z, player.dragShape.shape);
            if(player.dragShape.draggedContainer != null) {
                player.dragShape.draggedContainer.updateLocation(x, y, z, "map");
            }
            onDrop(x, y, z, player.dragShape.shape);
        } else {
            # return to container
            c := getContainerById(player.dragShape.fromUi);
            c.inventory.add(player.dragShape.shape, player.dragShape.pos[0], player.dragShape.pos[1]);
            updateContainerUi(c);
        }
    }    
}
