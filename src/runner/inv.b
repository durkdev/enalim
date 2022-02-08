
const CONTAINER_TYPE = "container";
const BOOK_TYPE = "book";

containers := [];

def initContainer(id=null, uiImage=null, x=null, y=null, z=null, location=null, type=null) {
    return {
        id: id,
        type: type,
        uiImage: uiImage,
        x: x,
        y: y,
        z: z,
        location: location,
        updateLocation: (self, x, y, z, location) => {
            self.x := x;
            self.y := y;
            self.z := z;
            self.location := location;
        },
        setBook: (self, book) => {
            self.book := book;
        },
        setContainer: (self, invItems) => {
            self.inventory := newInventory(self.id);
            array_foreach(invItems, (i, item) => {
                if(typeof(item) = "map") {
                    self.inventory.add(item.shape, -1, -1);
                    if(item["book"] != null) {
                        setBook(len(self.inventory.items) - 1, 0, 0, self.id, item.book);
                    }
                } else {
                    self.inventory.add(item, -1, -1);
                }
            });
        },
        encode: self => {
            saved := {
                id: self.id,
                uiImage: self.uiImage,
                type: self.type,
                x: self.x,
                y: self.y,
                z: self.z,
                location: self.location,
                containers: [],
            };
            if(self["inventory"] != null) {
                saved["inventory"] := self.inventory.encode();
            }
            if(self["book"] != null) {
                saved["book"] := self.book;
            }
            return saved;
        },
        decode: (self, savedItem) => {
            self.id := savedItem.id;
            self.uiImage := savedItem.uiImage;
            self.x := savedItem.x;
            self.y := savedItem.y;
            self.z := savedItem.z;
            self.location := savedItem.location;
            self.type := savedItem.type;
            if(savedItem["inventory"] != null) {
                self.inventory := newInventory(self.id);
                self.inventory.decode(savedItem.inventory);
            }
            if(savedItem["book"] != null) {
                self.book := savedItem.book;
            }
            return self;
        },
    };
}

def newContainerId(location, x, y, z) {
    id := "";
    if(location = "map") {
        id := CONTAINER_ID_PREFIX + x + "." + y + "." + z;
    } else {
        id := location + "." + x;
    }
    return id;
}

def newContainer(uiImage, x, y, z, location, type) {
    id := newContainerId(location, x, y, z);
    if(array_find(containers, cc => cc.id = id)) {
        # this means the items has been moved (ie. it's in the savegame file)
        return null;
    }

    c := initContainer(id, uiImage, x, y, z, location, type);
    containers[len(containers)] := c;
    return c;
}

def setBook(x, y, z, location, book) {
    c := newContainer("book", x, y, z, location, BOOK_TYPE);
    if(c != null) {
        c.setBook(book);
    }
    return c;
}

def setContainer(uiImage, x, y, z, location, invItems) {
    c := newContainer(uiImage, x, y, z, location, CONTAINER_TYPE);
    if(c != null) {
        c.setContainer(invItems);
    }
    return c;
}

const EMPTY_CONTAINERS = {
    "barrel": "barrel",
    "chest.y": "chest",
    "chest.x": "chest",
    "crate": "crate",
};

def getContainer(x, y, z, location) {
    # todo: linear search
    if(location = "map") {
        c := array_find(containers, c => c.x = x && c.y = y && c.z = z);
        if(c = null) {
            # try to create an empty container
            shape := getShape(x, y, z);
            if(shape != null) {
                uiImage := EMPTY_CONTAINERS[shape[0]];
                if(uiImage != null) {
                    # print("Creating empty container: " + shape[0]);
                    return setContainer(uiImage, x, y, z, "map", []);
                }
            }
        }
        return c;
    }
    return array_find(containers, c => c.x = x && c.location = location);
}

def getContainerById(id) {
    return array_find(containers, c => c.id = id);
}

def pruneItems(location, sectionX, sectionY, doRemove) {
    saves := array_reduce(containers, [], (a, c) => {
        b := c.location = location;
        if(location = "map") {
            sectionPos := getSectionPos(c.x, c.y);
            b := sectionPos[0] = sectionX && sectionPos[1] = sectionY;
        }
        if(b) {
            a[len(a)] := c.encode();
        }
        return a;
    });
    if(doRemove && len(saves) > 0) {
        array_remove(containers, c => array_find(saves, s => s.id = c.id) != null);
    }
    prune_contained(saves, doRemove);
    return saves;
}

def prune_contained(tests, doRemove) {
    if(len(tests) = 0) {
        return 1;
    }
    saves := array_reduce(tests, [], (a, r) => {
        array_foreach(containers, (t, c) => {
            if(c.location = r.id) {
                result := c.encode();
                r.containers[len(r.containers)] := result;
                a[len(a)] := result;
            }
        });
        return a;
    });
    if(doRemove && len(saves) > 0) {
        array_remove(containers, c => array_find(saves, s => s.id = c.id) != null);
    }
    prune_contained(saves, doRemove);
}

def restoreItem(savedItem) {
    print("* Restoring item " + savedItem.uiImage + " " + savedItem.id + " saved=" + savedItem);
    containers[len(containers)] := initContainer().decode(savedItem);
    restore_contained(savedItem.containers);
    print("* Done restoring item");
}

def restore_contained(saved) {
    array_foreach(saved, (i, s) => {
        containers[len(containers)] := initContainer().decode(s);
        restore_contained(s.containers);
    });
}




def isItemInInventoryAll(shapes, remove=False) {
    # all items in inventory?
    found := array_reduce(shapes, true, (b, shape) => b && isItemInInventory(shape));

    # if all are found, actually remove them
    if(found && remove) {
        array_foreach(shapes, (i, shape) => isItemInInventory(shape, remove));
    }
    return found;
}

def isItemInInventory(shape, remove=False) {
    return player.inventory.isContained(shape, remove) || array_find(player.party, pc => pc.inventory.isContained(shape, remove)) != null;
}

def newInventory(location) {
    return {
        location: location,
        items: [],
        isContained: (self, shape, remove=False) => {
            idx := self.findIndex(shape);
            found := idx > -1;
            if(found && remove) {
                self.remove(idx);
            }
            return found;
        },
        add: (self, shape, xpos=-1, ypos=-1) => {
            if(xpos < 0) {
                xpos := int(40 + random() * 400);
                ypos := int(20 + random() * 440);
            }
            self.items[len(self.items)] := {
                shape: shape,
                x: xpos,
                y: ypos,
            };
            return len(self.items) - 1;
        },
        findIndex: (self, name) => array_find_index(self.items, item => item.shape = name),
        remove: (self, index) => {
            # adjust the location of items in this inventory
            item := getContainer(index, -1, -1, self.location);
            i := index + 1;
            while(i < len(self.items)) {
                c := getContainer(i, -1, -1, self.location);
                if(c != null) {
                    c.updateLocation(i - 1, -1, -1, self.location);
                }
                i := i + 1;
            }
            # remove the item
            invItem := self.items[index];
            out := { 
                shape: invItem.shape, 
                x: invItem.x, 
                y: invItem.y, 
                item: item,
            };
            del self.items[index];
            return out;
        },
        render: self => {
            return array_map(self.items, item => {
                return {
                    type: "uiImage",
                    name: item.shape,
                    x: item.x,
                    y: item.y,
                };
            });
        },
        encode: self => {
            return array_map(self.items, i => {
                return {
                    shape: i.shape,
                    x: i.x,
                    y: i.y,
                };
            });
        },
        decode: (self, saved) => {
            array_foreach(saved, (i, item) => self.add(item.shape, item.x, item.y));
        },
        forItem: (self, fx) => {
            # todo: make recursive for containers
            i := 0;
            while(i < len(self.items)) {
                r := fx(self.items[i]);
                if(r != null) {
                    return r;
                }
                i := i + 1;
            }
            return null;
        }
    };
}

def newEquipment() {
    return {
        equipment: DEFAULT_EQUIPMENT,
        render: self => {
            uis := [];
            array_foreach(self.equipment, (slot, shape) => {
                if(shape != null) {
                    pos := SLOT_POS[slot];
                    uis[len(uis)] := {
                        type: "uiImage",
                        name: shape,
                        x: pos[0],
                        y: pos[1],
                    };
                }
            });            
            return uis;
        },
        getDescription: (self, index) => {
            # index is the index into the rendered list of items
            a := array_filter(self.equipment, e => e != null);
            return getObjectDescription(a[index]);
        },
        encode: self => self.equipment,
        decode: (self, saved) => {
            if(saved = null) {
                self.equipment := DEFAULT_EQUIPMENT;
            } else {
                self.equipment := saved;
            }
        },
    };
}
