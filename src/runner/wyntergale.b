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
        "": "ggg",
    },
    waypoints: [ [ 5690, 6970, 1 ] ], 
    schedule: [
        { name: "store", from: 0, to: 24, movement: "anchor", waypointDir: -1 },
    ],
});

