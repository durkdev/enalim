aneil_guard_convo := {
    "": "Nearby, a burly guard briefly interrupts his spirited nose picking to give you a quick glance, filled with contempt: \"Aye boys, thems fresh meat's come to $Aneil\" - he
        intones to no one in particular. You hear chuckling behind you as more guards take interest in you.",
    "Aneil": "You decide to risk asking about local events. The guard smiles with exaggerated friendliness: \"Why yes Bub, this here town be Aneil. We have $several attractions...\" - he
        trails off snickering. You hear \"Give 'em the tour!\" yelled behind you in unfriendly tones.",
    "several": "The guard answering you nods and continues the mocking guide routine: \"Bub, you are in the right place!\" - he exclaims - \"The Aneil jail as well as the tower dungeons
        have walking tours starting in...\" - he trails off guffawing. Eventually he produces a pair of very rusty shackles: \"Why Bub, if you just place your hands 'ere...\". You
        decide to just explore the town without the help of the local constabulary and scuttle off. The guards' laughter follows you echoing in the stone halls."
};

addNpcDef({
    name: "Guard Bob",
    label: "Guard Bob",
    creature: "guard",
    convo: aneil_guard_convo,
    waypoints: [ [ 6502, 7452, 8 ], [ 6502, 7473, 8 ] ],
    schedule: [
        { name: "pos1", from: 21, to: 1, movement: "anchor", waypointDir: -1 },
        { name: "pos2", from: 1, to: 5, movement: "anchor", waypointDir: 1 },
        { name: "pos3", from: 5, to: 9, movement: "anchor", waypointDir: -1 },
        { name: "pos4", from: 9, to: 13, movement: "anchor", waypointDir: 1 },
        { name: "pos5", from: 13, to: 17, movement: "anchor", waypointDir: -1 },
        { name: "pos6", from: 17, to: 21, movement: "anchor", waypointDir: 1 },
    ],    
});

addNpcDef({
    name: "Guard Rog",
    label: "Guard Rog",
    creature: "guard",
    convo: aneil_guard_convo,
    waypoints: [ [ 6505, 7452, 8 ], [ 6505, 7473, 8 ] ],
    schedule: [
        { name: "pos1", from: 21, to: 1, movement: "anchor", waypointDir: 1 },
        { name: "pos2", from: 1, to: 5, movement: "anchor", waypointDir: -1 },
        { name: "pos3", from: 5, to: 9, movement: "anchor", waypointDir: 1 },
        { name: "pos4", from: 9, to: 13, movement: "anchor", waypointDir: -1 },
        { name: "pos5", from: 13, to: 17, movement: "anchor", waypointDir: 1 },
        { name: "pos6", from: 17, to: 21, movement: "anchor", waypointDir: -1 },
    ],    
});

addNpcDef({
    name: "Guard Meg",
    label: "Guard Meg",
    creature: "guard",
    convo: aneil_guard_convo,
    waypoints: [ [ 6507, 7457, 15 ], [ 6507, 7474, 15 ] ],
    schedule: [
        { name: "pos1", from: 21, to: 1, movement: "anchor", waypointDir: 1 },
        { name: "pos2", from: 1, to: 5, movement: "anchor", waypointDir: -1 },
        { name: "pos3", from: 5, to: 9, movement: "anchor", waypointDir: 1 },
        { name: "pos4", from: 9, to: 13, movement: "anchor", waypointDir: -1 },
        { name: "pos5", from: 13, to: 17, movement: "anchor", waypointDir: 1 },
        { name: "pos6", from: 17, to: 21, movement: "anchor", waypointDir: -1 },
    ],    
});

addNpcDef({
    name: "Guard Mit",
    label: "Guard Mit",
    creature: "guard",
    convo: aneil_guard_convo,
    waypoints: [ [ 6500, 7445, 15 ], [ 6502, 7455, 15 ] ],
    schedule: [
        { name: "pos1", from: 21, to: 1, movement: "anchor", waypointDir: 1 },
        { name: "pos2", from: 1, to: 5, movement: "anchor", waypointDir: -1 },
        { name: "pos3", from: 5, to: 9, movement: "anchor", waypointDir: 1 },
        { name: "pos4", from: 9, to: 13, movement: "anchor", waypointDir: -1 },
        { name: "pos5", from: 13, to: 17, movement: "anchor", waypointDir: 1 },
        { name: "pos6", from: 17, to: 21, movement: "anchor", waypointDir: -1 },
    ],    
});


addNpcDef({
    name: "Guard Sri",
    label: "Guard Sri",
    creature: "guard",
    convo: aneil_guard_convo,
    waypoints: [ [ 6513, 7456, 8 ] ],
    schedule: [
        { name: "pos1", from: 0, to: 24, movement: "anchor", waypointDir: 1 },
    ],    
});


addNpcDef({
    name: "Guard Flint",
    label: "Guard Flint",
    creature: "guard",
    convo: aneil_guard_convo,
    waypoints: [ [ 6513, 7470, 8 ] ],
    schedule: [
        { name: "pos1", from: 0, to: 24, movement: "anchor", waypointDir: 1 },
    ],    
});


addNpcDef({
    name: "Mesnar",
    label: "Mesnar",
    creature: "mesnar",
    convo: {
        "": "sdfasdf $join",
        "join": () => {
            joinParty(findCreatureByName("Mesnar"));
            return "_end_convo_";
        }
    },
    waypoints: [ [ 6423, 7479, 1 ] ],
    schedule: [
        { name: "pos1", from: 0, to: 24, movement: "anchor", waypointDir: 1 },
    ],    
});
