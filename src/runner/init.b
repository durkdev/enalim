# this file is compiled first (before calling main())
const LINE_HEIGHT = 40;
const LINE_HEIGHT_SMALL = 36;

const ANIM_STAND = "stand";
const ANIM_MOVE = "move";
const ANIM_ATTACK = "attack";

# how long 1 frame of animation takes
const ANIMATION_SPEED = 0.05;

const MESSAGE_R = 255;
const MESSAGE_G = 220;
const MESSAGE_B = 30;

const DAM_R = 255;
const DAM_G = 30;
const DAM_B = 30;

const SECTIONS = {};

const npcReg = [];

def addNpcDef(npc) {
    npcReg[len(npcReg)] := npc;
}

const npcDefs = {};

const DIR_W = 0;
const DIR_SW = 1;
const DIR_S = 2;
const DIR_SE = 3;
const DIR_E = 4;
const DIR_NE = 5;
const DIR_N = 6;
const DIR_NW = 7;
const DIR_NONE = 8;

const COMBAT_MESSAGES = [
    "To battle!",
    "Let the blood flow free!",
    "I bring death upon you!",
    "Aaaaaaeeeergghhh!",
    "To the death!",
    "I have become your doom!",
    "No rest until your demise!",
    "Battle ever on!",
    "Glorious combat awaits!",
    "You will not see the morning!",
    "Give no quarter!",
    "No remorse!",
    "Take no prisoners!",
    "Hell awaits you fiend!",
    "See you in the pits of Hell!",
    "Finally, a good fight!",
    "I will annihiliate you!",
    "Your destiny is death!",
    "I will feast on your grave!",
    "Unleash hell!",
    "Die, foul aberration!",
    "May you be food for worms!",
    "Perish, noble foe!",
];

# item categories
const CAT_SWORD = "sword";
const CAT_DAGGER = "dagger";
const CAT_AXE = "axe";
const CAT_STAFF = "staff";
const CAT_LANCE = "lance";
const CAT_BOW = "bow";
const CAT_ARMOR = "armor";
const CAT_CLOTHES = "clothes";
const CAT_MISC = "misc";
