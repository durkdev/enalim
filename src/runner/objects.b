const SLOT_HEAD = 0;
const SLOT_CLOAK = 1;
const SLOT_AMULET = 2;
const SLOT_ARMOR = 3;
const SLOT_RIGHT_HAND = 4;
const SLOT_LEFT_HAND = 5;
const SLOT_BELT = 6;
const SLOT_FEET = 7;
const SLOT_RING_1 = 8;
const SLOT_RING_2 = 9;

const SLOT_POS_MUL = 3;
const SLOT_POS = [
    [80 * SLOT_POS_MUL, 32 * SLOT_POS_MUL],
    [24 * SLOT_POS_MUL, 56 * SLOT_POS_MUL],
    [136 * SLOT_POS_MUL, 56 * SLOT_POS_MUL],
    [80 * SLOT_POS_MUL, 80 * SLOT_POS_MUL],
    [24 * SLOT_POS_MUL, 112 * SLOT_POS_MUL],
    [136 * SLOT_POS_MUL, 112 * SLOT_POS_MUL],
    [80 * SLOT_POS_MUL, 144 * SLOT_POS_MUL],
    [80 * SLOT_POS_MUL, 208 * SLOT_POS_MUL],
    [24 * SLOT_POS_MUL, 176 * SLOT_POS_MUL],
    [136 * SLOT_POS_MUL, 176 * SLOT_POS_MUL],
];

const DEFAULT_EQUIPMENT = [ null, null, null, null, null, null, null, null, null, null ];

const OBJECTS = [
    { name: "Broadsword", slot: SLOT_RIGHT_HAND, variation: "sword", shape: "item.sword", cat: CAT_WEAPON, price: 150 },
    { name: "Dagger", slot: SLOT_RIGHT_HAND, variation: "dagger", shape: "item.dagger", cat: CAT_WEAPON, price: 50 },
    { name: "Leather Helm", slot: SLOT_HEAD, shape: "item.helm.leather", cat: CAT_ARMOR, price: 80 },
    { name: "Candle", slot: SLOT_LEFT_HAND, shape: "item.candle", cat: CAT_MISC, price: 20 },
    { name: "Shirt", slot: SLOT_ARMOR, shape: "item.shirt.red", cat: CAT_CLOTHES, price: 5 },
    { name: "Shirt", slot: SLOT_ARMOR, shape: "item.shirt.green", cat: CAT_CLOTHES, price: 5 },
    { name: "Coat", slot: SLOT_ARMOR, shape: "item.coat.yellow", cat: CAT_CLOTHES, price: 7 },
    { name: "Cape", slot: SLOT_CLOAK, shape: "item.cape.blue", cat: CAT_CLOTHES, price: 10 },
    { name: "Cape", slot: SLOT_CLOAK, shape: "item.cape.red", cat: CAT_CLOTHES, price: 10 },
    { name: "Belt", slot: SLOT_BELT, shape: "item.belt.1", cat: CAT_ARMOR, price: 5 },
    { name: "Belt", slot: SLOT_BELT, shape: "item.belt.2", cat: CAT_ARMOR, price: 5 },
    { name: "Leather apron", slot: SLOT_ARMOR, shape: "item.apron.lether", cat: CAT_ARMOR, price: 25 },
];

const OBJECTS_BY_SHAPE = {};

def initObjects() {
    array_foreach(OBJECTS, (i, e) => {
        OBJECTS_BY_SHAPE[e.shape] := e;
    });
}
