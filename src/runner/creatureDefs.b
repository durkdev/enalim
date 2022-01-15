# make sure the template's name (key) is the same as their shape.
creaturesTemplates := {
    "cow": {
        shape: "cow", speed: 0.5, baseWidth: 4, baseHeight: 4, sizeZ: 2, isFlying: false, movement: "anchor", hp: 10,
    },
    "monk-blue": {
        shape: "monk-blue", speed: 0.25, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: false, movement: "anchor", hp: 10,
    },
    "monk-red": {
        shape: "monk-red", speed: 0.25, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: false, movement: "anchor", hp: 10,
    },
    "ghost": {
        shape: "ghost", speed: 0.2, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: true, movement: "anchor", hp: 10,
    },
    "monk": {
        shape: "monk", speed: 0.25, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: false, movement: "anchor", hp: 10,
    },
    "goblin": {
        shape: "goblin", speed: 0.25, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: false, movement: "hunt", attackSteps: 2, attack: [1,3], hp: 20,
    },
    "goblin_npc": {
        shape: "goblin", speed: 0.25, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: false, movement: "anchor", hp: 20,
    },
    "ogre": {
        shape: "ogre", speed: 0.5, baseWidth: 4, baseHeight: 4, sizeZ: 4, isFlying: false, movement: "hunt", attackSteps: 2, attack: [2,5], hp: 40,
    },
    "ogre_npc": {
        shape: "ogre", speed: 0.5, baseWidth: 4, baseHeight: 4, sizeZ: 4, isFlying: false, movement: "anchor", hp: 40,
    },
    "spirit": {
        shape: "ghost", speed: 0.1, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: true, movement: "hunt", attackSteps: 2, attack: [1,4], hp: 15,
    },
    "man-blue": {
        shape: "man-blue", speed: 0.25, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: false, movement: "anchor", hp: 10,
    },
    "man-yellow": {
        shape: "man-yellow", speed: 0.25, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: false, movement: "anchor", hp: 10,
    },
    "woman": {
        shape: "woman", speed: 0.25, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: false, movement: "anchor", hp: 10,
    },
    "woman.brown": {
        shape: "woman.brown", speed: 0.25, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: false, movement: "anchor", hp: 10,
    },
    "woman2": {
        shape: "woman2", speed: 0.25, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: false, movement: "anchor", hp: 10,
    },
    "skeleton_npc": {
        shape: "skeleton", speed: 0.3, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: false, movement: "anchor", hp: 25,
    },
    "skeleton": {
        shape: "skeleton", speed: 0.3, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: false, movement: "hunt", attackSteps: 2, attack: [3,6], hp: 25,
    },
    "skeleton_blue": {
        shape: "skeleton_blue", speed: 0.3, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: false, movement: "hunt", attackSteps: 2, attack: [4,8], hp: 30,
    },
    "skeleton_red": {
        shape: "skeleton_red", speed: 0.3, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: false, movement: "hunt", attackSteps: 2, attack: [5,10], hp: 37,
    },
    "beard": {
        shape: "beard", speed: 0.25, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: false, movement: "anchor", hp: 10,
    },
    "beard2": {
        shape: "beard2", speed: 0.25, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: false, movement: "anchor", hp: 10,
    },
    "guard": {
        shape: "guard", speed: 0.25, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: false, movement: "anchor", hp: 10,
    },
    "demon2": {
        shape: "demon2", speed: 0.25, baseWidth: 3, baseHeight: 3, sizeZ: 6, isFlying: false, movement: "anchor", hp: 10,
    },
    "FabriantesBoss": {
        shape: "monk", speed: 0.25, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: false, movement: "hunt", attackSteps: 2, attack: [6,11], hp: 45,
    },
    "enandil": {
        shape: "enandil", speed: 0.25, baseWidth: 2, baseHeight: 2, sizeZ: 4, isFlying: false, movement: "anchor", hp: 10,
    },
};

def initCreatures() {
    # assign a name to every creature
    array_foreach(keys(creaturesTemplates), (i, k) => { creaturesTemplates[k].name := k; });
}
