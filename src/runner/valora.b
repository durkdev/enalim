addNpcDef({
    name: "Mayor Soled",
    label: "soled",
    creature: "man-yellow",
    convo: {
        "": "You see a short man wearing a bright sash: \"Greetings stranger in $Valora. My name is Soled and I am the $mayor of this fine town.\"",
        "Valora": "He smiles proudly: \"As the $mayor of Valora, I welcome you to the north-most town mining $Brigo in Enalim. I would even go as 
            far as to say that our Brigo ore is the finest and most potent there is. The $chancellor Onym and I make sure the mining never stops 
            so we have a large supply of refined Brigo for interested $buyers.\"",
        "mayor": "He taps the colored sash on his chest: \"I was elected mayor of $Valora about a decade ago. Since the discovery of $Brigo, I have 
            transformed this once sleepy town into the envy of the North! I, of course, had help from $chancellor Onym, $miner Mord and our resident
            scholar of Enalim's natural history, $Martyn.\"",
        "chancellor": "He points to the south: \"The chancellor Onym and I manage the affairs of $Valora. I'm in charge of making sure our fine ore of
            $Brigo is refined and sold, while the chancellor is in charge of managing the town's budget. Chancellor Onym lives and works in this same 
            building.\"",
        "miner": "\"If you have any questions regarding the nature of $Brigo extraction, head over to Mord's hut to the north and ask him.\"",
        "Martyn": "\"Martyn is a quircky fellow but if you have questions about the history or parts of Enalim, he's the man to ask. He lives in the 
            stone house to the west of here.\"",
        "Brigo": "He smiles again and says: \"Ah yes, the ore Brigo is our town's treasure. In $Valora, $miner Mord extracts the ore day and night to
            ensure a good supply so our $buyers never have to wait.\"",
        "buyers": "\"The ore $Brigo is a very valuable substance, sought after by many from all over Enalim. We get healers who use it to make potions, 
            artificers who create machinery that uses Brigo as a fuel, and more! Its uses are without end!\" - he pauses, then adds: \"Frankly, 
            I could not imagine our lives without Brigo mining.\"",
    },
    waypoints: [ [ 5271, 6374, 1 ], [ 5271, 6390, 1 ], [ 5258, 6388, 2 ] ],
    schedule: [
        { name: "room", from: 21, to: 8, movement: "anchor", waypointDir: -1 },
        { name: "office", from: 8, to: 21, movement: "anchor", waypointDir: 1 },
    ],    
});

addNpcDef({
    name: "Chancellor Onym",
    label: "onym",
    creature: "woman.brown",
    convo: {
        "": "You see a woman with a stern expression: \"State your business stranger. I have no $time for idle chatter.\"",
        "time": "She sighs and says: \"As the chancellor of $Valora, I simply have no time to waste. The $mayor sells the 
            ore $Brigo and it is my job to tally the $profit.\"",
        "profit": "She smiles and says: \"Let's just say we make a tidy sum from selling refined $Brigo. The ore is very
            valuable. You can ask the $mayor about its uses.\"",
        "mayor": "She points to the north: \"Mayor Soled lives in the north wing of this building. All decisions around the mining of
            $Brigo come from him.\"",
        "Valora": "She spreads her arms: \"Valora is the mining town you are in stranger. Everyone here works to extract the ore $Brigo and
            sell it for a handsome $profit.\"",
        "Brigo": "\"I'm not the one to ask really. From what I understand Brigo is a bright green ore useful for many things from potion-making to
            burning as an energy source. I really don't care where it comes from and where it goes as long as we make a $profit.\""
    },
    waypoints: [ [ 5271, 6407, 1 ], [ 5271, 6393, 1 ], [ 5258, 6393, 2 ] ],
    schedule: [
        { name: "room", from: 21, to: 8, movement: "anchor", waypointDir: -1 },
        { name: "office", from: 8, to: 21, movement: "anchor", waypointDir: 1 },
    ],    
});

addNpcDef({
    name: "Miner Mord",
    label: "mord",
    creature: "man-blue",
    convo: {
        "": "This man is covered with a fine brown dust: \"Hello there, my name is Mord and I make my living as a $miner of $Brigo. How can I $help you?\"",
        "help": "He nods and says: \"Just let me know if I can help in any way. I may be a simple $miner but maybe there is something I can assist you with.\"",
        "miner": "He points to the contraption behind his hut: \"I keep that machine running day and night. It pulls up the rock $Brigo from the depths. 
            I then smelt the ore into slabs and ingots which I sell to the $mayor or sometimes other buyers from all over north Enalim.\"",
        "Brigo": "He shrugs and says: \"Don't really know much about this green ore, beyond that folks want to buy it. I'm just the $miner but if you want to
            know what it's used for, best ask the $mayor.\"",
        "mayor": "He points to the south: \"Aye the mayor and chancellor live in the fancy stone house just off the Valora main square.\"",
    },
    waypoints: [ [ 5302, 6326, 1 ], [ 5290, 6337, 1 ], [ 5282, 6314, 1] ],
    schedule: [
        { name: "room", from: 21, to: 8, movement: "anchor", waypointDir: -1 },
        { name: "office", from: 8, to: 21, movement: "anchor", waypointDir: 1 },
    ],    
});

addNpcDef({
    name: "Martyn",
    label: "martyn",
    creature: "monk-red",
    convo: {
        "": "An old man greets you: \"Welcome to $Valora, traveler. If you are looking for $potions or want to 
            learn about the $history of Enalim, you have come to the right place! It is interesting\" - he adds - 
            \"how many $strangers pass through here recently. Maybe the news of $Brigo is what draws them here.\"",
        "Valora": "He motions about him: \"You are standing in our town of Valora. Although it is mainly known
            today for the mining of the ore $Brigo, it was once just a quiet farming village. I have lived here
            for a $long time so let me know if you are interested in the town's $history.\"",
        "long": () => {
            if(player.gameState["martyn_dead"] = true) {
                return "He winks at you and says: \"I can see you have visited the cemetery and seen my grave stone.
                    I can assure you it's just a bit of planning for the future and I'm not actually deceased. At any
                    rate it makes for good conversation and helps my $potion sales. Do let me know if you care to hear
                    the town's $history, since as you can tell, I've been knocking about here for a while now.\"";
            } else {
                return "\"I grew up here... my parents lived in this same house so I know all about its $history. In 
                    fact if you walk about town, you may find other signs from my past.\"";
            }
        },
        "history": "The old man assumes an academic air: \"The history of $Valora, does not in fact begin with the
            discovery of $Brigo. Many centuries of harmonious coexistance with nature happened before our current
            era of ore-induced greed. The original founders of Valora were farmers, scholars and adventurers. Now
            the town is home to miners, the $mayor, the $chancellor and sometimes a few $strangers.\"",
        "Brigo": "He sighs deeply: \"I can't say I approve of Brigo mining. If you talk to the $mayor or the $chancellor, 
            they will tell you how wonderful Brigo is for the local economy. However, the tomes say $otherwise. Obliquely,
            but they do warn of the dangers of mining this ore. Even during my $long lifetime, the mining has created 
            changes that I can't say I like.\"",
        "mayor": "\"Mayor Soled if a firm proponent of $Brigo mining. He lives in the stone house near the $Valora town 
            square.\"",
        "chancellor": "\"Chancellor Onym supports the $mayor in selling $Brigo. She also lives in the stone house near the $Valora town 
            square.\"",
        "otherwise": "He points to the books on his shelf: \"You should read it for yourself. I'm not one gifted with magic,
            but it feels to me like we're altering something in Enalim's core and not for the better. It is almost as if
            Brigo were more than just another natural mineral... something more fundamentally connected to the natural
            cycles of the planet.\" - he trails off thinking - \"I wish someone would talk to $Extandis about this.\"",
        "Extandis": "He looks at you expectently: \"No she is not found here in $Valora. Extandis is a reclusive sage who
            dwells in the mountains of Aneil, far to the south-west of here. The journey there is perilous, but if anyone
            can explain the dangers of $Brigo mining, it would be her.\"",
        "strangers": "\"Well there is you and before that another by the name of $Fearon passed through here. And in a 
            great hurry too, I might add. We haven't had this many visitors to $Valora in ages!\"",
        "Fearon": "\"Yes that was his name, I think. He bought a few $potions and then headed south, into the 
            forest of Amnadel. You may be able to catch him if you follow the trail out of $Valora to the south.\"",
    },
    waypoints: [ [ 5351, 6407, 1 ], [ 5335, 6407, 1 ] ],
    schedule: [
        { name: "room", from: 21, to: 8, movement: "anchor", waypointDir: -1 },
        { name: "office", from: 8, to: 21, movement: "anchor", waypointDir: 1 },
    ],    
});

addNpcDef({
    name: "ramida",
    label: "Ramida",
    creature: "woman",
    trade: [CAT_BOW],
    convo: {
        "": "You see a woman with dark hair in an imposing bun. \"My name is Ramida, welcome to my archery shop at $Valora.\"",
        "Valora": "\"We're a small mining town at the edge of the continent. The town is jointly managed by our mayor and the chancellor. 
            You can find them in the hall of Justice, just next door.\"",
    },
    waypoints: [ [ 5271, 6438, 1 ], [ 5273, 6453, 1 ] ], 
    schedule: [
        { name: "store", from: 8, to: 18, movement: "anchor", waypointDir: -1 },
        { name: "home", from: 18, to: 8, movement: "anchor", waypointDir: 1 }
    ],
});
