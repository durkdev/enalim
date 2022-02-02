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
        "Aneil": "\"Aneil is a small town, but we do have our share of $personalities and $rumors. For one thing, we're the only town in Enalim with a $sage of our own!\"",
        "sage": "He polishes a beer mug while talking: \"Aye, Extandis the sage lives right here in $Aneil. Of course I have not seen her as she keeps mostly to herself and
            her studies. And she is just one of the town's $personalities!\"",
        "personalities": "He lights up, this clearly must be his favorite topic: \"For such a small town as $Aneil, we have a $sage, Netul the jeweler, a Brigo $miner, a retired 
            ranger named Mesnar, some city guards and my brother Ednar\" - he points to the kitchen - \"who is my cook.\"",
        "miner": "\"The original $Aneil wall was built to protect the Brigo mine, a century ago. Today, the last descendent of the original mining family is still here: Meb
            the miner. He is in the north-east corner of town.\"",
        "rumors": "He pauses polishing the bar and stares into space then says: \"Well, I did hear Captain Rhone offerring a reward to get information about a dangerous cult
            that may have members here in $Aneil. Can you believe that?\" - he laughs - \"We have some strange $personalities here but I would not think any of them are the
            cultist type...\"",
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
        "": () => {
            if(player.gameState["aneil_ednar"] = 1) {
                return "The large man eyes you suspiciously. \"What do you want?\" - he barks - \"You can ask the $barkeep for food up front. But if
                    you're $interested in something more... we can discuss it.\" He seems uncharacteristically chatty today.";
            } else {
                return "This large man looks like the cook. He is clearly annoyed at your presence: \"If you're looking to buy food, ask the $barkeep up front 
                    but get out of my kitchen.\"";
            }            
        },
        "barkeep": "He points to the bar area: \"You can find my brother Rednar, slinging ale there day and night.\" With that he goes back to his cooking.",
        "interested": "He squints at you for a while, then says: \"Aye, Netul the Jeweler told me ye might drop by. I guess she thought you were all right, so I'll
            tell you: it all started when $Korag first came to town. He brought with him news of $something coming. Something good.\" - he adds mysteriously.",
        "Korag": () => {
            player.gameState["aneil_korag"] := 1;
            return "\"Korag is a prophet of a new philosphy. His teachings changed my life and I'm pleased to tell you about it also. Unfortunately,\" - he scratches
                his stubbly chin - \"the local $law doesn't believe in an open exchange of ideas and branded him a wanted man. If you want to learn more about Korag's
                teachings you will have to find him in the dungeon $Delude.\"";
        },
        "something": "He smiles a gaptoothed smile: \"Aye very good news indeed. If you, like me, have spent your life toiling and working for the man, only to be 
            told how wonderful paradise is after you die... Well this new thinking by $Korag might appeal to you too. But keep this on the down-low... I don't want
            the $law coming after me for spreading heresy.\"",
        "law": "He nods towards the city walls: \"That would be Captain Rhone and his dogs on the wall. Let's just say they're not very open-minded when it comes to 
            discussing the ideas taught by $Korag.\"",
        "Delude": "He points to the east: \"The dungeon Delude is to the east  of here. If you venture in there looking for $Korag, be careful as the place is also home
            to various monsters.\"",

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
        "Aneil": "\"I just moved here recently, but it does seem like a friendly town. I'm a deeply spiritual person and having a $sage here
            shows me that the town is open to all all $types of devotion.\" - she glares at you suggestively - \"...all types.\"",
        "types": () => {
            player.gameState["aneil_ednar"] := 1;
            return "You decide to bite and ask about her religious beliefs. She mutters something under her breath and says: \"There are of
                course many fine religions. I happen to believe in one with a ...uh quicker path to happiness. If you are interested, ask $Ednar the
                cook about it.\"";
        },
        "Ednar": "She points north: \"He works at the Sage Brew, just across the road. It's the only inn in $Aneil.\"",
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
        "": "A middle aged man is busy with paperwork here. Although he wears an old guard uniform, you get the sense he may be a ranking officer: \"Ah a 
            visitor to our fine town of $Aneil. I am Captain Rhone, head of the city guard. Welcome traveler, may your stay be $safe here.\"",
        "Aneil": "Captain Rhone points at the city walls: \"Aneil is a small town. Most people only know of us either because the sage Extandis lives here, or
            because they're interested in $brigo mining. Life used to be $safe and uneventful.\"",
        "brigo": "He nods to the north east of town: \"Aye, ask Miner Meb about it. I understand mining the mineral brigo was the original reason for the founding
            of $Aneil, many years ago.\"",
        "safe": "Captain Rhone sighs and says: \"There is always something, even in a small place like $Aneil. These days it's rumored that some kind of demon-
            worshipping cult is $recruiting members here. Demons\" - he sighs again - \"will be the death of me.\"",
        "recruiting":  () => {
            if(player.gameState["aneil_korag"] = 1) {
                return "You explain to the captain what you've learned from Ednar the cook. Rhone listens attentively and says: \"If you should meet this Korag,
                    I would appreciate a heads up. You won't feel like an informant, I promise. We just want to talk to the man to clear things up.\" - you get the
                    sense 'talking' would involve chains, somehow.";
            } else {
                return "The captain looks tired, as if this talk of cults has kept him up all night. \"Listen, I know you have just arrived here in $Aneil, and
                    I don't want you to get the wrong impression: the city is a great tourist spot. But I don't have any extra men to put on this, so if you hear
                    anything... if, for example, someone tries to recruit you into a cult... do let us know.\"";
            }
        }
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

const CULTIST_CONVO = {
    "": "A man in dark robes rushes past. It seems they're busy inspecting the prison cells on both sides of this large room.",
};

addNpcDef({
    name: "cultist1",
    label: "cultist1",
    creature: "monk",
    convo: CULTIST_CONVO,
    waypoints: [ [ 6446, 7362, 1 ] ],
    schedule: [
        { name: "pos1", from: 0, to: 24, movement: "anchor", waypointDir: 1 },
    ],    
});

addNpcDef({
    name: "cultist2",
    label: "cultist2",
    creature: "monk",
    convo: CULTIST_CONVO,
    waypoints: [ [ 6446, 7384, 1 ] ],
    schedule: [
        { name: "pos1", from: 0, to: 24, movement: "anchor", waypointDir: 1 },
    ],    
});

addNpcDef({
    name: "Korag",
    label: "Korag",
    creature: "monk-red",
    convo: {
                "": "You see a tall man with piercing flinty eyes. He seems alarmed at your presence: \"I... how... You should not be here.\" - he stammers
             - \"What is your $business here?\"",
        "business": () => {
            if(player.gameState["aneil_korag"] = 1) {
                return "You tell Korag - for this must be him - that you are interested in his teachings and have talked to Netul and Ednar in town already. He seems
                    much relieved by this news: \"Ah excellent! I was afraid you were sent by Rhone or his minions\" - he spits the name out with venomous hatred - \"In 
                    fact, you came just at the right time to uh... $assist me in a small task. That is unless you have $question first.\"";
            } else {
                return "You mumble something about just passing through and quickly shuffle off. You feel the man's burning gaze on your back as you exit the room.";
            }
        }
    },
    waypoints: [ [ 6464, 7380, 1 ] ],
    schedule: [
        { name: "pos1", from: 0, to: 24, movement: "anchor", waypointDir: 1 },
    ],    
});
