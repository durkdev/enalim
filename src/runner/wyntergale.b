addNpcDef({
    name: "cyric",
    label: "Cyric",
    creature: "guard",
    convo: {
        "": "A gruff guard grunts at you: \"Unless ye have business $inside, best be moving along.\"",
        "inside": "He squints at you and says: \"Tell me your $business, traveler and then I'll decide if the gates of $Wyntergale will open.\" He squints at you 
            some more and adds: \"Though, by the look of ye, probably not.\"",
        "business": () => {
            if(player.gameState["quest.wyntergale"] = true) {
                player.gameState["wyntergale.gate"] := true;
                restartActiveSections();
                return "You tell the guard that you are in fact on an Important Quest, commanded by the heir of Wyntergale, the Grand Duchess Zanka. The guard shrugs
                    and says: \"Aye, it is your funeral, as they say. If the Duchess sent ye, feel free to explore $Wyntergale, but beware of the $beast inside.\" He then
                    pulls the hidden lever you failed to notice, and the gates open.";
            } else {
                return "Try as you might, you can't think of any reason to be let inside the fortress. You mumble something about being an adventurer but the guard
                    is not impressed: \"Just as I thought: another tourist. Best clear off traveler before I let you have a taste of ole Rob...\" he pats his halberd
                    affectionatly, clearly relishing you not doing as you're told.";
            }
        },
        "Wyntergale": "The guard points to the battlements above: \"The fortress of Wyntergale is the former home of the Grand Duchess Zanka. If ye want to get inside, 
            I suggest talking to her. If\" he adds \"you can find her. She has fled, ever since the arrival of the $beast.\"",
        "beast": "The guard eyes you suspiciously: \"Aye, some manner of beast has taken residence inside the fortress of $Wyntergale. That is why I'm stationed out
            here, to turn travelers away, lest they meet their doom inside.\"",

    },
    waypoints: [ [ 5730, 6990, 1 ] ], 
    schedule: [
        { name: "store", from: 0, to: 24, movement: "anchor", waypointDir: -1 },
    ],
});

addNpcDef({
    name: "Axurzxu",
    label: "Axurzxu",
    creature: "demon2",
    convo: {
        "": () => {
            if(player.gameState["demon.quest"] = 1) {
                return "The creature smiles a horrible toothy grim: \"Ah, welcome back good servant! Tell me, have you been able to locate the one who $summoned me?
                    Have you $delivered him my gift of thanks?\"";
            } else {
                return "A large, fearsome creature addresses you: \"Axurzxu, the $Beast of $Wyntergale, at your service.\" Its features distort into a
                    horrific visage of fangs as it tries to smile. \"You are quite brave to tread here.\" - it continues - \"Are you on some kind of a $quest?\"";
            }
        },
        "Wyntergale": "The creature motions at the castle walls: \"Aye, that is what most of the humans told me. The castle belonged to some kind of
            nobility, but\" - he tries to smile again and it fills you with dread - \"it belongs to the $Beast now.\"",
        "Beast": "\"Yes, the Beast of $Wyntergale\" - it seems rather proud of the title - \"is how I have come to be known. I would have preferred
            the 'Butcher of' or perhaps 'Infernal Majesty of' but alas. It is not often that I'm $summoned Enalim but I will try to make the most of it.\" - it
            turns to you and asks: \"Before your agonizing doom, why don't you tell me about your $quest?\"",
        "quest": "Under the creature's watchful stare, you haltingly tell of the Grand Duchess Zanka asking you to investigate the fate of her estate. Axurzxu nods
            and says: \"Alas, as the $Beast, I cannot let you return to her alive, it's just not in my nature. And lets face it, there is no way you can defeat me. 
            And yet,\" - it muses - \"perhaps I can spare your life temporarily, in return for your $services.\"",
        "services": () => {
            if(player.gameState["demon.quest"] = 1) {
                return "The creautre motions at the destroyed castle furniture around you: \"As I may have mentioned, I was a tad displeased to be $summoned so
                needlessly to Enalim. I've had time to reflect however, and I would like to 'thank' the magician with a small token of my gratefulness. 
                Have you $delivered my gift to him yet? I believe\" - it adds - \"he's somewhere in the castle dungeons.\"";
            } else {
                return "\"Yes well, I would like to ...uh 'thank' the mage who $summoned me. As soon as I appeared and the screaming started, he fled\" -it points
                downstairs - \"into the dungeons below the castle $Wyntergale. It's a nuisance and a waste of my time to go after him. It would be easier if instead
                my servant\" - he looks at you knowingly - \"delivered my thanks instead. Would you do this $task for me? I promise to delay your demise 
                for a\" - it clearly struggles with granting you this boon - \"...a time.\"";
            }
        },
        "task": () => {
            player.gameState["demon.quest"] := 1;
            player.inventory.add("object.demon.gift", -1, -1);
            return "\"Excellent!\" - it hands you a small but ornate box - \"Take this gift to the vic... I mean, to the honorable mage who is currently cowering in
            in the castle dungeons below. Return to me when you have done this and perhaps I'll...\" - it searches for words - \"reward you in some way.\" You take the
            box with shaking hands and add it to your travel bag.";
        },
        "summoned": "An expression of rage flashes across the creature's face: \"Aye, some clueless practitioner of magic kidnapped me from the Abyss to bid me to 
            stand at his beck and call here in Enalim. I saw him briefly when he realized his mistake and fled to the dungeons below the castle. This is why I
            require your $services to find him.\"",
    },
    waypoints: [ [ 5687, 6999, 8 ] ], 
    schedule: [
        { name: "store", from: 0, to: 24, movement: "anchor", waypointDir: -1 },
    ],
});

addNpcDef({
    name: "Mertund",
    label: "Mertund",
    creature: "monk-red",
    convo: {
        "": "A slight man with gray eyes waves to you. He looks around nervously, then says: \"I am Mertund, arch-mage of $Wyntergale, in service of the Grand Duchess Zanka. I don't know how you made it this
            far, but I require your $help!\"",
    },
    waypoints: [ [ 5670, 7089, 1 ] ], 
    schedule: [
        { name: "store", from: 0, to: 24, movement: "anchor", waypointDir: -1 },
    ],
});

addNpcDef({
    name: "Bartos",
    label: "Bartos",
    creature: "beard",
    convo: {
        "": "A grizzled prisoner greets you: \"Ahoy there stranger! I am Bartos the $mystic, at your service. Please excude my humble $temporary abode.\"",
    },
    waypoints: [ [ 5674, 7055, 1 ] ], 
    schedule: [
        { name: "store", from: 0, to: 24, movement: "anchor", waypointDir: -1 },
    ],
});

addNpcDef({
    name: "Grum-oh",
    label: "Grum-oh",
    creature: "ogre_npc",
    convo: {
        "": "What seems to be a captured ogre hails you: \"I Grum-oh! Grum-oh $friend... $likes human friend. Grum-oh no tear arms from their sockets!\" - he
            smiles reassuringly. You almost believe him, if it weren't for that fresh corpse in his cell. \"Grum-oh knows big $secret and will tell friend about it!\"",
    },
    waypoints: [ [ 5723, 7082, 1 ] ], 
    schedule: [
        { name: "store", from: 0, to: 24, movement: "anchor", waypointDir: -1 },
    ],
});

addNpcDef({
    name: "Denora",
    label: "Denora",
    creature: "woman",
    convo: {
        "": "A nervous woman eyes you wearily: \"My lot is woe and if you come to mock me like the $others, go right ahead. There is nothing I can do to stop you.\"",
    },
    waypoints: [ [ 5659, 7088, 1 ] ], 
    schedule: [
        { name: "store", from: 0, to: 24, movement: "anchor", waypointDir: -1 },
    ],
});
