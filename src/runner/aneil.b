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
        "": "A tall man rises to greet you. His face is weathered by countless years spent working outdoors. \"Hail traveler, what brings you to our town of $Aneil? Most 
            people travel here to speak with $Extandis the sage. Others come to seek adventure in the dusty passages of the dungeon $Delude.\" - he looks you over, not
            without kindness - \"You seem like someone on an important quest. If there is any way I can $help, let me know.\"",
        "help": "He nods and continues: \"My name is Mesnar the Ranger. I've spent most of my years traveling the length and breadth of Enalim. I am familiar with
            many strange wonders - as well as the horrors - this land holds. I would gladly $join your party, if you will have me by your side.\" For reasons mysterious
            even to yourself, you trust this outdoorsman completely.",
        "Delude": "He motions to the north: \"Aye, the dungeon Delude awaits within the walled city of $Aneil. No one truly knows what lies at its ancient, stone heart because
            most who enter don't come back to tell the tale.\" - he shrugs - \"Still, if that is where you must go, I would $help with that burden if you will have me.\"",
        "Aneil": "\"Aneil the walled city, has been my home since birth. Well, when I'm not outdoors myself, which is most of the time.\" - he smiles, then continues - \"We
            have a few notable people in Aneil. Foremost is $Extandis, the sage, of course. She lives in that windowless stone house at the center of town. Next,
            there is Captain Rhone who oversees the gate guard. Ednar and Rednar run the Sage's Brew\" - he points west - \"Then there is Netul the jeweler and Meb the miner.\" -
            he pauses, then adds - \"Oh yes, and the Aneil guard. Best stay away from those jokers.\"",
        "Extandis": "He points north: \"Extandis the Sage is a busy woman. She rarely leaves her house and does not take kindly to intrusion. Some say, in order to see her
            one must first complete a trio of ardeous missions and retrieve the relics of some ancient order. She is a local legend who really put $Aneil on the map!\" - he 
            smiles and adds: \"If you need $help seeing her, or really with anything else: don't hesitate to ask!\"",
        "join": () => {
            joinParty(findCreatureByName("Mesnar"));
            return "_end_convo_";
        }
    },
    waypoints: [ [ 6423, 7479, 1 ], [ 6439, 7479, 1], [ 6446, 7464, 1], [6471, 7464, 1], [6471, 7444, 1] ],
    inventory: [ "item.axe.military", "item.helm.hard", "item.legging.leather", "item.armor.leather", "item.shield.kite" ],
    schedule: [
        { name: "pub", from: 10, to: 20, movement: "anchor", waypointDir: 1 },
        { name: "home", from: 20, to: 10, movement: "anchor", waypointDir: -1 },
    ],    
});


addNpcDef({
    name: "Rednar",
    label: "Rednar",
    creature: "man-blue",
    convo: {
        "": "A jovial barkeep hails you: \"Welcome to the 'Sage Brew' at $Aneil, traveler. What will it be? Food or drink?\"",
    },
    waypoints: [ [ 6465, 7426, 1 ] ],
    schedule: [
        { name: "pos1", from: 0, to: 24, movement: "anchor", waypointDir: 1 },
    ],    
});

addNpcDef({
    name: "Ednar",
    label: "Ednar",
    creature: "man-yellow",
    convo: {
        "": "This large man looks like the cook. He is clearly annoyed at your presence: \"If you're looking to buy food, ask the $barkeep up front 
            but get out of my kitchen.\"",
    },
    waypoints: [ [ 6452, 7431, 1 ] ],
    schedule: [
        { name: "pos1", from: 0, to: 24, movement: "anchor", waypointDir: 1 },
    ],    
});

addNpcDef({
    name: "Extandis Sangrist",
    label: "Extandis",
    creature: "woman2",
    convo: {
        "": () => {
            relics := 0;
            if(player.inventory.findIndex("item.chalice.krynt") > -1) {
                relics :+ 1;
            }
            if(player.inventory.findIndex("item.sceptre.krynt") > -1) {
                relics :+ 1;
            }
            if(player.inventory.findIndex("item.seal.krynt") > -1) {
                relics :+ 1;
            }
            if(relics = 0) {
                return "You see a middle aged woman with strange, shimmering, purple eyes. She takes note of you, nods, and returns to her paperwork.
                    You don't know why but her nod of dismissal feels like a physical push out the door. You feel compelled to leave her alone and return
                    outside.";
            } else if(relics = 1) {
                return "You see a middle aged woman with strange, shimmering, purple eyes. She takes note of you, smiles and says: \"Do not loose hope
                    Lydell! Know that you are on the right path and even if things seem dark, there are those who would aid you in your quest. Return
                    to me when you have found the relics.\" - she adds cryptically. She says no more and an odd silence fills the room.";
            } else if(relics = 2) {
                return "You see a middle aged woman with strange, shimmering, purple eyes. She takes note of you, smiles and says: \"You are on the right
                path, Lydell. Return to me when you have found all three of the relics.\" She says no more and an odd silence fills the room.";
            } else {
                player.gameState["extandis_phase"] := "sanctum";
                restartActiveSections();
                return "You see a middle aged woman with strange, shimmering, purple eyes. She takes note of you, smiles and says: \"Welcome Lydell to your
                    belated $inheritence. By finding the three relics of the $Knights of Krynt, you have proven that you have what it takes to stop the 
                    advance of $Vesnu and perhaps save Enalim from the pending $calamity.\" - she smiles tranquilly. \"When you are rested, join me in my
                    inner sanctum where I will reveal what you must do next.\"";
            }
        },
    },
    waypoints: [ [ 6424, 7448, 1 ] ],
    schedule: [
        { name: "pos1", from: 0, to: 24, movement: "anchor", waypointDir: 1 },
    ],    
});

addNpcDef({
    name: "Netul",
    label: "Netul",
    creature: "woman",
    trade: [CAT_JEWELRY],
    convo: {
        "": "A woman with a glittering smile and rings on every finger greets you: \"Welcome to $Aneil traveler. If you're looking
            for fine jewelry, please let me know!\"",
    },
    waypoints: [ [ 6469, 7478, 1 ], [6454, 7478, 1] ],
    schedule: [
        { name: "work", from: 8, to: 18, movement: "anchor", waypointDir: -1 },
        { name: "home", from: 18, to: 8, movement: "anchor", waypointDir: 1 },
    ],    
});

addNpcDef({
    name: "Captain Rhone",
    label: "Rhone",
    creature: "guard",
    convo: {
        "": "A guard glances at you. \"State your $business in $Aneil, traveler.\" - he says briskly.",
    },
    waypoints: [ [ 6395, 7480, 8 ] ],
    schedule: [
        { name: "pos1", from: 0, to: 24, movement: "anchor", waypointDir: 1 },
    ],    
});

addNpcDef({
    name: "Miner Meb",
    label: "Meb",
    creature: "beard",
    convo: {
        "": "A man covered in grayish dust stands before you. \"Production has been good,\" - he mumbles - \"But
            the $ore has had a weaker color lately...\" He barely notices you as he's lost in thought.",
    },
    waypoints: [ [ 6411, 7407, 1 ] ],
    schedule: [
        { name: "pos1", from: 0, to: 24, movement: "anchor", waypointDir: 1 },
    ],    
});
