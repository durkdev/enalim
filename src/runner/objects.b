const SLOT_HEAD = 0;
const SLOT_CLOAK = 1;
const SLOT_AMULET = 2;
const SLOT_ARMOR = 3;
const SLOT_RIGHT_HAND = 4;
const SLOT_LEFT_HAND = 5;
const SLOT_LEGS = 6;
const SLOT_FEET = 7;
const SLOT_BELT = 8;
const SLOT_RING = 9;
const SLOT_GLOVES = 10;

const SLOT_POS_MUL = 3;
const SLOT_POS = [
    [54 * SLOT_POS_MUL, 21 * SLOT_POS_MUL],
    [0 * SLOT_POS_MUL, 44 * SLOT_POS_MUL],
    [108 * SLOT_POS_MUL, 44 * SLOT_POS_MUL],
    [54 * SLOT_POS_MUL, 80 * SLOT_POS_MUL],
    [0 * SLOT_POS_MUL, 104 * SLOT_POS_MUL],
    [108 * SLOT_POS_MUL, 104 * SLOT_POS_MUL],
    [54 * SLOT_POS_MUL, 134 * SLOT_POS_MUL],
    [54 * SLOT_POS_MUL, 194 * SLOT_POS_MUL],
    [0 * SLOT_POS_MUL, 160 * SLOT_POS_MUL],
    [108 * SLOT_POS_MUL, 160 * SLOT_POS_MUL],
    [0 * SLOT_POS_MUL, 210 * SLOT_POS_MUL],
];

const DEFAULT_EQUIPMENT = [ null, null, null, null, null, null, null, null, null, null, null ];

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

    { name: "Steel Helm", slot: SLOT_HEAD, shape: "item.helm.steel", cat: CAT_HELMET, price: 140 },
    { name: "Hard Leather Helm", slot: SLOT_HEAD, shape: "item.helm.hard", cat: CAT_HELMET, price: 90 },
    { name: "Battle Helm", slot: SLOT_HEAD, shape: "item.helm.horned", cat: CAT_HELMET, price: 150 },
    { name: "Champion Helm", slot: SLOT_HEAD, shape: "item.helm.winged", cat: CAT_HELMET, price: 180 },
    { name: "Tempered Helm", slot: SLOT_HEAD, shape: "item.helm.tempered", cat: CAT_HELMET, price: 200 },
    { name: "Magic Helm", slot: SLOT_HEAD, shape: "item.helm.magic", cat: CAT_HELMET, price: 350 },

    { name: "Leather Armor", slot: SLOT_ARMOR, shape: "item.armor.leather", cat: CAT_ARMOR, price: 300 },
    { name: "Banded Leather Armor", slot: SLOT_ARMOR, shape: "item.armor.banded", cat: CAT_ARMOR, price: 320 },
    { name: "Plate Mail Armor", slot: SLOT_ARMOR, shape: "item.armor.platemail", cat: CAT_ARMOR, price: 500 },
    { name: "Chain Mail Armor", slot: SLOT_ARMOR, shape: "item.armor.chainmail", cat: CAT_ARMOR, price: 450 },
    { name: "Magic Armor", slot: SLOT_ARMOR, shape: "item.armor.magic", cat: CAT_ARMOR, price: 680 },

    { name: "Leather Leggings", slot: SLOT_LEGS, shape: "item.legging.leather", cat: CAT_LEGGING, price: 200 },
    { name: "Chain Mail Leggings", slot: SLOT_LEGS, shape: "item.legging.chainmail", cat: CAT_LEGGING, price: 320 },
    { name: "Plate Mail Leggings", slot: SLOT_LEGS, shape: "item.legging.platemail", cat: CAT_LEGGING, price: 450 },
    { name: "Magic Armor Leggings", slot: SLOT_LEGS, shape: "item.legging.magic", cat: CAT_LEGGING, price: 580 },

    { name: "Leather boots", slot: SLOT_FEET, shape: "item.boots.leather", cat: CAT_BOOTS, price: 250 },
    { name: "Steel boots", slot: SLOT_FEET, shape: "item.boots.steel", cat: CAT_BOOTS, price: 360 },
    { name: "Magic boots", slot: SLOT_FEET, shape: "item.boots.magic", cat: CAT_BOOTS, price: 520 },

    { name: "Leather gloves", slot: SLOT_GLOVES, shape: "item.gloves.leather", cat: CAT_GLOVE, price: 60 },
    { name: "Steel gauntlet", slot: SLOT_GLOVES, shape: "item.gloves.steel", cat: CAT_GLOVE, price: 110 },
    { name: "Magic gauntlet", slot: SLOT_GLOVES, shape: "item.gloves.magic", cat: CAT_GLOVE, price: 320 },

    { name: "Wooden Shield", slot: SLOT_LEFT_HAND, shape: "item.shield.wood", cat: CAT_SHIELD, price: 25 },
    { name: "Kite Shield", slot: SLOT_LEFT_HAND, shape: "item.shield.kite", cat: CAT_SHIELD, price: 60 },
    { name: "Steel Shield", slot: SLOT_LEFT_HAND, shape: "item.shield.steel", cat: CAT_SHIELD, price: 110 },
    { name: "Dueling Shield", slot: SLOT_LEFT_HAND, shape: "item.shield.duel", cat: CAT_SHIELD, price: 200 },
    { name: "Magic Shield", slot: SLOT_LEFT_HAND, shape: "item.shield.magic", cat: CAT_SHIELD, price: 400 },
];

const OBJECTS_BY_SHAPE = {};

def initObjects() {
    array_foreach(OBJECTS, (i, e) => {
        OBJECTS_BY_SHAPE[e.shape] := e;
    });
}
