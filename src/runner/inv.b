
const CONTAINER_TYPE = "container";
const BOOK_TYPE = "book";

globalItemId := 0;

def getItemById(id) {
    # todo: this is slow (but avoids keeping a global item lookup map up to date)
    i := player.globalInventory.getItemById(id);
    if(i = null) {
        i := player.inventory.getItemById(id);
        if(i = null) {
            idx := 0;
            while(i = null && idx < len(player.party)) {
                i := player.party[idx].getItemById(id);
                idx :+ 1;
            }
        }
    }
    return i;
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
    return player.inventory.isContained(shape, remove) || 
        array_find(player.party, pc => pc.inventory.isContained(shape, remove)) != null;
}

def setBook(x, y, z, book, inventory=null) {
    item := newItem("book", BOOK_TYPE);
    item.book := book;    
    addItemAt(x, y, z, item, inventory);
    return item;
}

def setContainer(uiImage, x, y, z, invItems, inventory=null) {
    c := newItem(uiImage, CONTAINER_TYPE);
    array_foreach(invItems, (i, invItem) => {
        if(typeof(invItem) = "map") {
            # decode the given map
            item := null;
            if(invItem["book"] != null) {
                item := newItem("book", BOOK_TYPE);
                item.book := invItem.book;
            }
            c.inventory.add(invItem.shape, item);
        } else {
            # if just a string, assume it's a shape
            c.inventory.add(invItem);
        }
    });
    # add the container to the inventory
    addItemAt(x, y, z, c, inventory);
    return c;
}

# extra item information for books, containers
def newItem(uiImage, type) {
    id := "i." + globalItemId;
    globalItemId :+ 1;
    return {
        id: id,
        type: type,
        uiImage: uiImage,
        book: null,
        inventory: newInventory("item inventory " + id),
        encode: self => {
            return {
                uiImage: self.uiImage,
                type: self.type,
                inventory: self.inventory.encode(),
                book: self.book,
            };
        },
        decode: (self, saved) => {
            self.type := saved.type;
            self.uiImage := saved.uiImage;
            self.inventory.decode(saved.inventory);
            self.book := saved.book;
        }
    };
}

def addItemAt(x, y, z, item, inventory=null) {
    # add to inventory
    inv := inventory;
    if(inv = null) {
        inv := player.globalInventory;
    }
    inv.addItemAt(item, x, y, z);
    
    # return item
    return item;
}

const EMPTY_CONTAINERS = {
    "barrel": "barrel",
    "chest.y": "chest",
    "chest.x": "chest",
    "crate": "crate",
};

def newInventory(name) {
    return {
        name: name,
        items: [],
        isContained: (self, shape, doRemove=False) => {
            idx := self.findIndex(shape);
            found := idx > -1;
            if(found && doRemove) {
                self.remove(idx);
            }
            return found;
        },
        debug: self => {
            print("--------------------------------");
            print(self.name);
            array_foreach(self.items, (i, c) => {
                print("\t" + i + ": " + c.shape + " pos=" + c.pos + " xy=" + c.x + "," + c.y);
                if(c.item != null) {
                    print("\t" + c.item);
                }
            });
            print("--------------------------------");
        },
        getItemById: (self, id) => {
            item := array_find(self.items, i => i.item != null && i.item.id = id);
            if(item != null) {
                return item.item;
            }
            return null;
        },
        getItemAt: (self, x, y, z) => {
            # todo: linear search
            mapItem := array_find(self.items, c => c.pos[0] = x && c.pos[1] = y && c.pos[2] = z);
            if(mapItem = null) {
                # try to create an empty container
                shape := getShape(x, y, z);
                if(shape != null) {
                    c := EMPTY_CONTAINERS[shape[0]];
                    if(c != null) {
                        # print("Creating empty container.");
                        return setContainer(c, x, y, z, [], self);
                    }
                }
            }
            return mapItem;
        },
        addItemAt: (self, item, x, y, z) => {

            # find the shape on the map
            shape := null;
            print("getShape: " + x + "," + y + "," + z);
            info := getShape(x, y, z);
            print("info=" + info);
            if(info = null) {
                print("getShapeExtra: " + x + "," + y + "," + z);
                shapes := getShapeExtra(x, y, z);
                print("shapes=" + shapes);
                if(len(shapes) > 0) {
                    shape := shapes[0];
                }
            } else {
                shape := info[0];
            }

            # add it to inventory
            if(shape = null) {
                print("Error: can't find shape at: " + x + "," + y + "," + z);
            } else {
                print("* adding to inventory: " + self.name + " shape=" + shape + " item=" + item);
                self.add(shape, item, [x, y, z]);
            }
        },
        add: (self, shape, item=null, pos=null, xpos=-1, ypos=-1) => {
            if(xpos < 0) {
                xpos := int(40 + random() * 400);
                ypos := int(20 + random() * 440);
            }
            self.items[len(self.items)] := {
                shape: shape,
                item: item,
                pos: pos,
                x: xpos,
                y: ypos,
            };
            return len(self.items) - 1;
        },
        findIndex: (self, name) => array_find_index(self.items, item => item.shape = name),
        remove: (self, index) => {
            # remove the item
            invItem := self.items[index];
            # out is a clone of invItem
            out := { 
                shape: invItem.shape, 
                x: invItem.x, 
                y: invItem.y, 
                item: invItem.item,
            };
            del self.items[index];
            return out;
        },
        prune: (self, sectionX, sectionY) => {
            saved := [];
            array_remove(self.items, item => {
                if(item.pos != null) {
                    sectionPos := getSectionPos(item.pos[0], item.pos[1]);
                    if(sectionPos[0] = sectionX && sectionPos[1] = sectionY) {
                        saved[len(saved)] := self.encodeItem(item);
                        return true;
                    }
                }
                return false;
            });
            return saved;
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
        encodeItem: (self, item) => {
            out := {
                shape: item.shape,
                pos: item.pos,
                x: item.x,
                y: item.y,
                item: null,
            };
            if(item.item != null) {
                out.item := item.item.encode();
            }
            return out;
        },
        encode: self => {
            return array_map(self.items, i => self.encodeItem(i));
        },
        decodeItem: (self, savedItem) => {
            item := null;
            if(savedItem.item != null) {
                item := newItem(null, null);
                item.decode(savedItem.item);
            }
            self.add(savedItem.shape, item, savedItem.pos, savedItem.x, savedItem.y);
        },
        decode: (self, saved) => {
            array_foreach(saved, (i, savedItem) => self.decodeItem(savedItem));
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
