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
    { name: "Broadsword", slot: SLOT_RIGHT_HAND, variation: "sword", shape: "item.sword", cat: CAT_SWORD, price: 150 },
    { name: "Dagger", slot: SLOT_RIGHT_HAND, variation: "dagger", shape: "item.dagger", cat: CAT_DAGGER, price: 50 },
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

    { name: "Sabre", slot: SLOT_RIGHT_HAND, variation: "sword", shape: "item.sword.sabre", cat: CAT_SWORD, price: 110 },
    { name: "Longsword", slot: SLOT_RIGHT_HAND, variation: "sword", shape: "item.sword.longsword", cat: CAT_SWORD, price: 160 },
    { name: "Shortsword", slot: SLOT_RIGHT_HAND, variation: "sword", shape: "item.sword.shortsword", cat: CAT_SWORD, price: 100 },
    { name: "Ninjato", slot: SLOT_RIGHT_HAND, variation: "sword", shape: "item.sword.ninjato", cat: CAT_SWORD, price: 180 },
    { name: "Rapier", slot: SLOT_RIGHT_HAND, variation: "sword", shape: "item.sword.rapier", cat: CAT_SWORD, price: 160 },
    { name: "Cutlass", slot: SLOT_RIGHT_HAND, variation: "sword", shape: "item.sword.cutlass", cat: CAT_SWORD, price: 120 },

    { name: "Short axe", slot: SLOT_RIGHT_HAND, variation: "axe", shape: "item.axe.shortaxe", cat: CAT_AXE, price: 80 },
    { name: "Battle axe", slot: SLOT_RIGHT_HAND, variation: "axe", shape: "item.axe.battleaxe", cat: CAT_AXE, price: 150 },
    { name: "Military axe", slot: SLOT_RIGHT_HAND, variation: "axe", shape: "item.axe.military", cat: CAT_AXE, price: 160 },
    { name: "War axe", slot: SLOT_RIGHT_HAND, variation: "axe", shape: "item.axe.waraxe", cat: CAT_AXE, price: 170 },
    { name: "Dwarven axe", slot: SLOT_RIGHT_HAND, variation: "axe", shape: "item.axe.dwarven", cat: CAT_AXE, price: 180 },

    { name: "Shortbow", slot: SLOT_RIGHT_HAND, variation: "bow", shape: "item.bow.shortbow", cat: CAT_BOW, price: 75 },
    { name: "Longbow", slot: SLOT_RIGHT_HAND, variation: "bow", shape: "item.bow.longbow", cat: CAT_BOW, price: 100 },
    { name: "Recurve bow", slot: SLOT_RIGHT_HAND, variation: "bow", shape: "item.bow.recurve", cat: CAT_BOW, price: 120 },
    { name: "Angled bow", slot: SLOT_RIGHT_HAND, variation: "bow", shape: "item.bow.angled", cat: CAT_BOW, price: 130 },
    { name: "Compound bow", slot: SLOT_RIGHT_HAND, variation: "bow", shape: "item.bow.compound", cat: CAT_BOW, price: 140 },

    { name: "Yew staff", slot: SLOT_RIGHT_HAND, variation: "staff", shape: "item.staff.yew", cat: CAT_STAFF, price: 50 },
    { name: "Oak staff", slot: SLOT_RIGHT_HAND, variation: "staff", shape: "item.staff.oak", cat: CAT_STAFF, price: 60 },
    { name: "Gem staff", slot: SLOT_RIGHT_HAND, variation: "staff", shape: "item.staff.gem", cat: CAT_STAFF, price: 110 },

    { name: "Lance", slot: SLOT_RIGHT_HAND, variation: "lance", shape: "item.spear.lance", cat: CAT_LANCE, price: 80 },
    { name: "Spiked Lance", slot: SLOT_RIGHT_HAND, variation: "lance", shape: "item.spear.spiked", cat: CAT_LANCE, price: 90 },
    { name: "Military Lance", slot: SLOT_RIGHT_HAND, variation: "lance", shape: "item.spear.military", cat: CAT_LANCE, price: 110 },
    { name: "War Lance", slot: SLOT_RIGHT_HAND, variation: "lance", shape: "item.spear.war", cat: CAT_LANCE, price: 120 },

    { name: "Short dagger", slot: SLOT_RIGHT_HAND, variation: "dagger", shape: "item.dagger.short", cat: CAT_DAGGER, price: 60 },
    { name: "Jewelled dagger", slot: SLOT_RIGHT_HAND, variation: "dagger", shape: "item.dagger.jeweled", cat: CAT_DAGGER, price: 150 },
    { name: "Jambiya", slot: SLOT_RIGHT_HAND, variation: "dagger", shape: "item.dagger.jambiya", cat: CAT_DAGGER, price: 70 },
    { name: "Assassin dagger", slot: SLOT_RIGHT_HAND, variation: "dagger", shape: "item.dagger.assassins", cat: CAT_DAGGER, price: 80 },
    { name: "Military dagger", slot: SLOT_RIGHT_HAND, variation: "dagger", shape: "item.dagger.military", cat: CAT_DAGGER, price: 90 },
];

const OBJECTS_BY_SHAPE = {};

def initObjects() {
    array_foreach(OBJECTS, (i, e) => {
        OBJECTS_BY_SHAPE[e.shape] := e;
    });
}
