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
            learn about the $history of Enalim, you have come to the right place!\"",
    },
    waypoints: [ [ 5351, 6407, 1 ], [ 5335, 6407, 1 ] ],
    schedule: [
        { name: "room", from: 21, to: 8, movement: "anchor", waypointDir: -1 },
        { name: "office", from: 8, to: 21, movement: "anchor", waypointDir: 1 },
    ],    
});
