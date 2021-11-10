addNpcDef({
    name: "ennid",
    label: "Ennid",
    creature: "woman",
    trade: CAT_WEAPON,
    convo: {
        "": "You see sharp-eyed woman before you. \"I am Ennid and run he weapons shop here in $Trinest.\"",
        "Trinest": "\"Trinest is the east-most town on the Enalim mainland. East of us is just the ocean and some $insignificant small islands.\"",
        "insignificant": "Hmm, seems like she doesn't know about the Necromancer's island. Maybe you should $tell her. Then again, that's the kind of detail that gets one killed in places like this. Maybe buy something instead.",
        "tell": "You pointificate about the island of the Necromancer. \"Fascinating.\" - she says, without a hint of interest - \"Well, let me know if you need any weapons!\" - she continues.",
    },
    waypoints: [ [ 5711, 5886, 1 ], [ 5694, 5870, 1 ] ], 
    schedule: [
        { name: "store", from: 8, to: 18, movement: "anchor", waypointDir: -1 },
        { name: "home", from: 18, to: 8, movement: "anchor", waypointDir: 1 }
    ],
});

addNpcDef({
    name: "hamid",
    label: "Hamid",
    creature: "man-blue",
    trade: CAT_ARMOR,
    convo: {
        "": "A man with a warm smile says: \"Be welcome in Trinest wanderer. I buy and sell armor at my shop. Our $town may be small but rest assured my shop is well equipped. Just ask if you need anything.\"",
        "town": "\"Trinest is the last town on the east side of the Enalim mainland. My name is Hamid and I trade in high quality armor.\"",
    },
    waypoints: [ [ 5715, 5837, 1 ], [ 5696, 5839, 1 ] ],
    schedule: [
        { name: "store", from: 8, to: 18, movement: "anchor", waypointDir: 1 },
        { name: "home", from: 18, to: 8, movement: "anchor", waypointDir: -1 },
    ],
});

addNpcDef({
    name: "ender",
    label: "Ender",
    creature: "man-yellow",
    convo: {
        "": () => {
            if(player.convo.npc.activeSchedule = 0) {
                if(player.gameState["ender_quest_after"] = true) {
                    return "The portly man seems very stressed, nervously looking over his shoulder. \"I already told you where you can find $Fearon. 
                        Keep the gem and leave me alone!\"";
                } else if(player.gameState["ender_quest"] = true) {
                    return "The portly man looks at you impatiently and says: \"Clearly, you have yet to set off and help me with my $favor. 
                        Off to $Ravenous with you and bring back what is rightfully mine!\"";
                } else {
                    return "You see a portly man who has obviously been sampling the local ale: \"Hello there stranger\"
                        - he slurs slightly - \"you have the look of an $adventurer. I also used to roam the lands freely, 
                        but lately I've been $stuck in Trinest.\"";
                }
            } else {
                return "The portly man seems irritated by the interruption: \"Yes, yes that's very interesting but 
                    you see I'm quiet tired. Talk to me tomorrow in the $pub.\"";
            }
        },
        "pub": "He points to the inn's downstairs pub: \"By that I mean the pub downstairs. I'll talk to you there tomorrow.\"",
        "adventurer": "He looks you up and down: \"I could be wrong, but you have the look of somone who is on a mission. 
            What is it that you $seek?\"",
        "seek": "You can't decide if he's trustworthy or not. Will you mention that you're looking for $Fearon? Or ask 
            why he's $stuck in Trinest?",
        "stuck": "He nods and says: \"Aye, I also was an $adventurer for a time and my quest led me here to Trinest.\". 
            He sighs and continues: \"I was on the trail of a jewel thief for a large reward, however the thief entered the
            dungeon $Ravenous and I dare not follow him there.\"",
        "Ravenous": "\"Ravenous is a large dungeon just north-east of here. Follow the road and it will guide you there. But beware, 
            its depths are fill with loathsome horrors. Unless you're very foolish or very brave, I would not advise you to enter there. 
            Many an $adventurer paid the ultimate price for their curiosity in Ravenous!\"",
        "Fearon": () => {
            if(player.gameState["ender_quest_after"] = true) {
                return "The man says: \"The last time I saw Fearon, he was hiking to someplace in the forest of Amnadel. Follow the Enalim road to the west and 
                after you reach the town of Valora turn south on the forest path. Good luck friend!\" - he backs away from you, clearly not wishing for more 
                conversation.";
            } else {
                return "You mention that you're looking for a man named Fearon. The portly man nods and says: \"I know Fearon well. I would 
                gladly direct you to him if you could just do me a small $favor.\"";
            }
        },
        "favor": () => {
            if(player.gameState["ender_quest"] = null) {
                player.gameState["ender_quest"] := true;
                return "He moves closes and whispers conspiratorially: \"You seem like a very brave and experienced $adventurer.\" - he
                    smiles creepily - \"Despite my personal misgivings about the dungeon $Ravenous, I believe you could brave its depths 
                    and bring me the $jewel the thief was carrying. Do that and I will show you the way to Fearon.\"";
            } else {
                idx := player.inventory.findIndex("item.gem.theohadron");
                if(idx > -1) {
                    if(player.gameState["ender_quest_after"] = null) {
                        player.gameState["ender_quest_after"] := true;
                        return "You pull the shiny gem from your bag with, what you perceive as, an air casual confidence.
                            His reaction however, is not what you expected. Instead of relief, he seems at a loss for words! \"How did you?...\"
                            he begins, but then: \"Well no matter, a deal is a deal! Tell you what? Keep the gem! I will show you the way 
                            to $Fearon for free!\".";
                    } else {
                        return "The man smiles while carefully keeping his distance from you: \"Yes friend, I'm so impressed with you that I will tell you 
                            how to find $Fearon and let you keep the gem you found!\"";
                    }
                } else {
                    return "The man seem impatient to see you off: \"Yes, like we discussed earlier: fetch me the $jewel from $Ravenous and 
                        I will\" - he winks creepily - \"send you off to $Fearon. It's a fair trade.\" - he adds, as if to satisfy his conscience.";
                }
            }
        },
        "jewel": "He winks at you and says: \"You could certainly keep the jewel, but then you'll never find $Fearon. Bring it to
            me instead and I will personally give you his location.\". Seems like a reasonable trade, you think."
    },
    waypoints: [ [ 5746, 5880, 1 ], [ 5755, 5870, 1 ], [ 5738, 5869, 8 ], [5749, 5873, 8], [ 5760, 5888, 8 ] ],
    schedule: [
        { name: "pub", from: 10, to: 22, movement: "anchor", waypointDir: -1 },
        { name: "room", from: 22, to: 10, movement: "anchor", waypointDir: 1 },
    ],
});

addNpcDef({
    name: "zanka",
    label: "Zanka",
    creature: "woman.brown",
    convo: {
        "": () => {
            if(player.convo.npc.activeSchedule = 0) {
                return "You see a well dressed woman with a regal air: \"What is it you want $commoner? Can't you see
                I'm enjoying my privacy? Bother me no longer!\" - she pauses to look at you and adds: \"Unless you
                have come to bring me news of my $estate.\"";
            } else {
                return "The well dressed woman seems alarmed to see you: \"What do you think you're doing bothering me 
                so late? Away with you!\" - she pauses, then adds: \"But if you have news about my $estate then I suppose
                I will forgive your intrusion.\"";
            }
        },
        "commoner": "You are not sure what this means but you decide to take offence nonetheless. You entertain the idea
            of stomping off in a huff but then you remember that she said something about here $estate. You sense there's
            money to be made and an adventure waiting here.",
        "estate": "She sighs heavily and continues: \"Despite my best efforts at traveling incognito, I'm sure you $recognize me
            as the Grand Duchess of and Heiress of $Wyntergale. You may refer to me as 'your $Eminance.'\" - she pauses for effect.",
        "Eminance": "You mock-bow to show you understand. This seems to please her: \"That's better. It's good to see a youth of
            culture and good upbringing. Perhaps you can help me get back to my $estate.\"",
        "Wyntergale": "She nods: \"Aye Wyntergale is my castle along the banks of the Efron river. However its warm hearth is cold now,
            for an evil presence has taken home there. I was forced to go abroad and now dwell in this\" - she motions around you
            \"rather squalid inn. If someone brave and heroic could $vanquish the $demon that dwells in my castle, I'd be 
            forever grateful.\"",
        "vanquish": "She clutches her pearl necklace and says desperately: \"Oh please, please give it a try! Tell me when I can 
            safely return home to $Wyntergale and I will be sure to reward you! You can always find me here at the inn.\"",
        "demon": "\"I don't actually know what manner of beast has taken home in my former $estate. But from the vile smells that
            emanate from the lower levels, I can only assume it must a fiend from the pits! Please do $vanquish it for me!\"",
    },
    waypoints: [ [ 5751, 5890, 1 ], [ 5755, 5870, 1 ], [ 5738, 5869, 8 ], [ 5742, 5887, 8 ] ],
    schedule: [
        { name: "pub", from: 11, to: 23, movement: "anchor", waypointDir: -1 },
        { name: "room", from: 23, to: 11, movement: "anchor", waypointDir: 1 },
    ],
});

addNpcDef({
    name: "Arenil",
    label: "Arenil",
    creature: "woman2",
    convo: {
        "": () => {
            if(player.convo.npc.activeSchedule = 0) {
                return "A woman greets you with a friendly smile: \"Welcome to the Last Chance $Inn at $Trinest, friend. 
                    Let me know if you're looking to buy or sell food or other traveling supplies.\"";
            } else {
                return "\"Please come back later when the $Inn is open!\"";
            }
        },
        "Inn": "\"The Last Chance Inn is the east-most Inn in all of Enalim. We're in the center of the town of $Trinest 
            serving both $regulars and travelers. I also sell supplies to traveling adventurers like yourself.\"",
        "Trinest": "\"Trinest is the east-most town in the land of Enalim, though\" - she nods conspiratorially - \"I've heard
            rumors that a chain of small islands lies in the ocean to the east of us. Home to people who don't want to be found, I guess.\"",
        "regulars": "She points to the upstairs rooms and says: \"I usually have a few longer-term guests staying upstairs. 
        You can ask them about their business, but please don't bother them in their rooms.\""
    },
    waypoints: [ [ 5740, 5881, 1 ], [ 5755, 5870, 1 ], [ 5738, 5869, 8 ], [ 5761, 5870, 8 ] ],
    schedule: [
        { name: "pub", from: 11, to: 23, movement: "anchor", waypointDir: -1 },
        { name: "room", from: 23, to: 11, movement: "anchor", waypointDir: 1 },
    ],    
});

addNpcDef({
    name: "Snemil",
    label: "Snemil",
    creature: "man-blue",
    convo: {
        "": "A nervous looking man motions you closer and says: \"Have you come to $rescue me? Are those 
            murderous $goblins still outside?\"",
        "rescue": "The man sighs and continues: \"Yes, you could be asking yourself why I'm in this mess. 
            If you want I can tell you my $story.\"",
        "story": "\"I'm a simple jewel merchant from Valora. One day I had the bad luck of purchasing a large
            cabochon $jewel of a kind of a gem I've never seen before. My life has been a living hell ever 
            since that fated day.\"",
        "jewel": "\"It is a large dark-red jewel with a shiny surface. The patterns in the stone are mesmerizing,
            as if it were alive! I've never seen anything like it before.\" - he trails off reminiscing but then 
            continues - \"Soon after the purchase, I've started getting offers for the jewel and then $threats!\"",
        "threats": "\"Several would be buyers insisted that I sell them the gem and when that didn't work, became
            aggressive. Eventually, I had to leave Valora and I've been on the $move ever since.\"",
        "move": "He motions at the caverns around: \"And that is how I ended up here in Trinest, or more specifically,
            how I became trapped in this accursed dungeon. You see, someone tracked me down and in a last ditch effort 
            to save my life, I hid in this dungeon. Now I'm trapped here by the $goblins outside and on top of that, 
            my prized jewel was $stolen.\"",
        "goblins": "The man points to the door of his cave: \"Beware of the goblins outside! They will stop at nothing
            to destroy you. And unfortunatelly there are even worse beasts here like the ones who have $stolen my
            most prized $jewel.\"",
        "stolen": "\"I didn't see the creature who stole my $jewel, because it was quite dark. All I remember is a 
            strange rattling noise. I was pushed to the ground and my pack, with the jewel inside, was gone!\"",
    },
    waypoints: [ [ 5450, 5913, 1 ] ],
    schedule: [
        { name: "pub", from: 11, to: 23, movement: "anchor", waypointDir: -1 },
        { name: "room", from: 23, to: 11, movement: "anchor", waypointDir: 1 },
    ],    
});

addNpcDef({
    name: "North Brother",
    label: "nobo",
    creature: "monk-blue",
    convo: {
        "": "An old man approaches with a thoughtful expression: \"Welcome traveler, I am $North Brother. My life's goal 
            is to study the dungeon $Ravenous.\" - he pauses and add: \"Do you have any $new information about the caves? Perhaps 
            something you learned from my $brother?\"",
        "North": "\"I am called North Brother simply because I have chosen the correct location from where to study $Ravenous, 
            unlike my brother.\" - he rolls his eyes and then continues - \"Clearly, being on the north side of this vast cave
            system will make my $work much easier than anyplace else.\"",
        "Ravenous": "\"Aye, it is my life's goal to study the cave system known by the locals as 'Ravenous'. I have built my hut 
            in this location specifically for the purpose of this $work. I have learned much in these past decades but I feel 
            there is much more to study.\"",
        "work": "His eyes light up at the chance to talk about his work: \"Yes, yes the  caves are fascinating! Did you know for 
            example why it came to be known by such a fearsome $name? Or, would you like to know about its past and current $inhabitants?\"",
        "name": "North Brother raises an index finger: \"The caves were named 'Ravenous' in the Erioan era when a family took shelter here
            during a storm. Legends say that after spending one night in the caves, they were overcome by an intense hunger. Finally giving in
            to their infernal desires they butchered and devoured each other. I discovered this gruesome tale during my $work.\"",
        "inhabitants": "\"During my $work, I read of various local people sheltering in the caves. No one lives here now, but for a $stranger I
            saw entering here maybe a week ago.\" - he pauses then add: \"Uninhabited does not mean empty, however. Dark places tend to 
            attract those who prefer the shadows.\"",
        "stranger": "North Brother squints as if to better recall what he witnessed: \"Yes, about a week ago it was now... I saw a harried man
            running as if chased by strange fears. He quickly entered the caves and never surfaced since. Perhaps he made it out the other side
            where my $brother lives?\"",
        "brother": "North Brother sighs and says: \"Yes it is true: I am not the only one whose life and $work is to observe the caves of $Ravenous. 
            For to the $south lives my identical twin brother, South Brother. In the name of scientific transparency, I must mention him as another
            valuable data point in the corpus of work concerning this area.\"",
        "south": "He points to the cave entrance nearby: \"To reach my $brother, you must travel through the fearsome darknessness of $Ravenous.\" 
            He smiles wanly and adds: \"And should you learn anything $new, please come back and tell me!\"",
        "new": () => {
            if(player.gameState["ravenous_info"] = true) {
                return "He listens intently then nodding, he says: \"There is an unexplored, new area of the caves, you say?\" - he thinks on it some more
                    and then: \"I wonder why there is so much more magic in Enalim than ever before? Should you come across any items of magic in the caves, be 
                    sure to show it $Extandis the Sage. If anyone can explain this resurgance of magic it would be her.\"";                    
            } else {
                return "\"Nothing new to report, eh? Be sure to talk to my $brother near the $south entrance - he may know something!\"";
            }
        },
        "Extandis": "He nods knowingly and says: \"Extandis is a wise sage who lives in the distant mountains of Aneil. I would recommend you bring any 
            magic items you find before her, for her knowledge is vast in such matters. It's all connected somehow,\" - he murmurs - \"magic seems
            commonplace these days like never before.\""
    },
    waypoints: [ [ 5666, 6027, 1 ], [ 5665, 6045, 1 ] ],
    schedule: [
        { name: "home", from: 21, to: 8, movement: "anchor", waypointDir: -1 },
        { name: "outdoors", from: 8, to: 21, movement: "anchor", waypointDir: 1 },
    ],    
});

addNpcDef({
    name: "South Brother",
    label: "sobo",
    creature: "monk-blue",
    convo: {
        "": "This old man seems very familiar. \"Welcome traveler, I am $South Brother. I aim to learn all there is
            to know about the dungeon $Ravenous.\"",
    },
    waypoints: [ [ 5516, 6136, 1 ], [ 5519, 6151, 1 ] ],
    schedule: [
        { name: "home", from: 21, to: 8, movement: "anchor", waypointDir: -1 },
        { name: "outdoors", from: 8, to: 21, movement: "anchor", waypointDir: 1 },
    ],    
});
