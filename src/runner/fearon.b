addNpcDef({
    name: "Fearon",
    label: "fearon",
    creature: "beard",
    convo: {
        "": "An old man hails you excitedly: \"Hail $Lydell! I am Fearon. I've been waiting for you to finally 
            arrive. Hurry, the $chalice is just beyond these doors!\"",
        "Lydell": "The old man seems confused: \"Yes of course I know who you are. Afterall, \" - he adds - \"I was the one who
            took you to the Necromancer's $island, back in the day!\"",
        "island": "\"Yes, you see, because of the manner of your $birth, the $Order knew immediately that to keep you safe, you could 
            not stay in Enalim. We searched for a truly out of the way place and decided that the island of the Necromancer will be best.\" -
            he seems very pleased to tell you this - \"What an exciting journey that was! Sailing across the bay of Trinest in the middle of a 
            stormy night to then abandon a baby on the doorstep of the Necromancer. It was all we could do!\" - he appears truly apologetic now - \"But I'm glad
            you made it. I always knew you were the $one, and here you are!\"",
        "Order": "He smiles and says: \"There are other ways to help the cause than being a member of the $Knights of Krynt. While the 
            knights used their might and spells, we formed the Order of Krynt to help with research, science and other things. Our 
            leader $Extandis will tell you more when you meet her.\"",
        "birth": "The old man scratches his beard: \"Yes, I guess I should start at the beginning and tell you the whole story.\" - he then pauses
            with a wild look in his eyes - \"No, there is no time for this now! In time you will come to learn how it came to pass that you
            are the $one to (maybe) save us. For now, just know that Enalim is in grave danger from $Vesnu. Time is 
            short,\" - he points to the north door - \"That way to the hall of the $chalice!\"",
        "Vesnu": "Fearon speaks in a low voice: \"As I'm sure the Necromancer warned you, the evil entity Vesnu is poised to enter Enalim. He is an ancient being 
            of malice and contempt for humanity.\n\nThe $Order keeps an eye on his movements in Astral realm and recently noticed a thinning in the isolating
            layers of energy between our worlds. We do not yet understand why, but much of the natural defenses that keep us safe are getting weaker by the day!\n\n 
            This in turn causes the havoc we've all witnessed: stray magics, monsters and the growing advance of the being Vesnu.\n\nYou must hurry and 
            get to $Extandis before all is lost.\"",
        "one": "His eyes glow in zealous admiration: \"Yes, yes, you may just be the one to fix everything! Thwart the advance of $Vesnu and his
            agents of evil. But there is no time for this now,\" - he points to the north - \"onward for the $chalice!\"",
        "chalice": () => {
            idx := player.inventory.findIndex("item.chalice.krynt");
            if(idx > -1) {
                return "The old man claps you on the back: \"I knew you could do it! Now complete the other $challenges and then journey to $Extandis!\"";
            } else {
                return "\"The Azure Chalice of Krynt is said to lie in the sacred chamber to the north. It is one of three magical artifacts which
                    contain the arcane powers of the $Knights of Krynt.\" - he motions around you - \"These 
                    underground halls were in fact built by the knights, eons ago. It is said that only their true descendent is
                    capabale of unraveling their mysteries to finally weild the $relics. I believe, \" - he now points to you - \"that you may just
                    be the $one to do it!\"";
            }
        },
        "Knights": "Fearon looks thoughtful as if remembering something: \"The Knights of Krynt were an order of magic-wielding knights in the
            service of something greater...\" - he pauses, then - \"We don't have time now to give you the full story, but rest assured, 
            your $birth and the knights are related. All will soon be revealed...\" - he adds cryptically - \"Your task now, with the pending
            doom from the advance of $Vesnu, is to reach $Extandis with haste!\"",
        "challenges": "\"Yes, the $Knights left two other underground lairs which hold the $Sceptre and the $Seal, somewhere in Enalim. You must
            find these and recover the artifacts before $Extandis will see you.\"",
        "relics": "Fearon holds up three fingers: \"The $Knights left behind three artifacts: as you already know, the $chalice may be here, 
            just to the north. The other relics are the $Sceptre and the $Seal which are parts of other $challenges, elsewhere in Enalim. When you
            have acquired all three, you must present yourself to $Extandis the Sage.\"",
        "Sceptre": "\"The Sceptre of the $Knights is one of the three $relics you must find before visiting $Extandis.\"",
        "Seal": "\"The Great Seal of the $Knights is one of the three $relics you must find before visiting $Extandis.\"",
        "Extandis": "Fearon relaxes a bit and smiles: \"If anyone knows how to stop $Vesnu, it would be the head of my $Order, Extandis Sangrist 
            the Sage of Aneil. You must journey south to the mountains of Aneil and present yourself to her, as the $one, descendent of the
            $Knights of Krynt, savior of Enalim.\" - he raises a hand to emphasize a point - \"But know that the grand Sage is a recluse who
            prefers the silent company of the grimoires to idle chatter of men. She will not consider you worthy of her time unless you can
            demonstrate the power of the old ways - by weilding the $relics of the Knights.\"",
    },
    waypoints: [ [ 5593, 6698, 1 ] ],
    schedule: [
        { name: "room", from: 0, to: 23, movement: "anchor", waypointDir: -1 },
    ],    
});


addNpcDef({
    name: "Anton Felnemond",
    label: "anton",
    creature: "ghost",
    convo: {
        "": "A spectre hovers nearby, dressed in the remnants of a ceremonial armor: \"Welcome to the Hall of the $Chalice\" - it rasps - \"You
            have proven yourself worthy to receive the $relics of the $Knights of Krynt.\"",
        "Chalice": "It nods and says: \"The Chalice of Krynt is one of the sacred $relics from the era of the $Knights of Krynt. Since you have
            defeated the dungeon's traps and opened the door of this room, it is now yours. Wielding these artifacts marks the bearer as one to
            carry on the teachings and lore of the Knights into the current age. I must say,\" - it adds after a pause - \"it has been a rather long
            while since anyone sought them out.\"",
        "relics": "\"Aye the $Knights of Krynt left behind more than just the $Chalice. To fully attain the sacred powers of their order, you will
            have to find them all. There are other locations, elsewhere in Enalim, that house other artifacts from the age of Krynt.\"",
        "Knights": "The spectre intones: \"Members of the sacred order of the Knights of Krynt were devoted to the common good. They were one of the
            pillars of the Republic of Krynt, ensuring a just and peaceful existance for all. With the disappearance of the Knights, many eons ago, the
            republic also ceased to be. Today, in our era of greed, wars and barbarity, only remnants of the Krynt republic remain. However it was
            always the intention of the Knights, that should the need arise, the mantle of their $purpose be taken up by new heros. For this reason
            they left behind places such as this and the $relics that store their power.\"",
        "purpose": "The spectre points to you: \"Step up and claim the $Chalice, hero of Krynt! It is said these $relics contain the power of the $Knights of 
            Krynt and when a time of need is at hand, one\" - he nods to you - \"such as yourself will arise to carry their purpose on. Enalim is in $danger, that
            I know, but what you should do next, I cannot say. Maybe,\" - he adds, after a pause - \"go forth and find the other
            artifacts. Perhaps then your purpose will be revealed.\"",
        "danger": "The apparition sighs and continues: \"The being $Vesnu is intent on destroying the world of Enalim. His malice and vengence is bent on
            conquering this realm. And this,\" - he says forcefully - \"must not happen. There is a corruption in the fabric of this world that I have not
            felt since guarding the $Chalice for more than an age. Use the $relics to gain the power of the $Knights and banish Vesnu before it's too late.\"",
        "Vesnu": "\"Vesnu is an outsider entity, composed entirely of malign energies. His hatred of humanity and all life in Enalim is eternal and 
            inexhaustible. For many eons Vesnu was bound to another plane of existance but recently - I know not why - he is ever closer to breaching the
            boundaries of the world of Enalim. If that were to pass it would be the ruin of all.\" - the spectre pauses and quickly add: \"Take the 
            $Chalice, hero of Krynt and fulfill the $purpose set forth by the $Knights, so long ago.\""
    },
    waypoints: [ [ 5588, 6620, 1 ] ],
    schedule: [
        { name: "room", from: 0, to: 23, movement: "anchor", waypointDir: -1 },
    ],    
});


addNpcDef({
    name: "Celine Feanen",
    label: "celine",
    creature: "ghost",
    convo: {
        "": "A spectre approches and bellows: \"Halt mortal! If you value your $life you will turn $back before it's too late! Lest should you spend eternity
            in these $cursed ruins, like the one who stands before you now!\"",
        "life": "The apparition shrieks melodramatically: \"Aye, value that which ye still have! Alas, 'tis too late for me. For it was folly and the hubris of
            youth that bade me to explore the depths of this $place.\" - after some hand wringing, it continues - \"No way back, alas, no return anymore. The 
            unending dawn of discorporation pervades all! Be not like me and turn $back now!\"",
        "place": "It rotates dramatically, motioning for you to behold the strange building you are in: \"You think the builders of this $cursed place were sane or 
            beneficial? Nay!\" - it intones, and glares at you to drive the point home - \"Nay indeed! Vile, putrid things dwell here, rotten since their debased
            creation in malice and agony. Venture no further and turn $back while you still can! Let the $life I lost persuade you to leave now!\"",
        "cursed": "\"Aye, and since you won't listen to reason, hear my last warning: many have entered this $place only to meet their doom in the caverns below. 
            If you wish to survive, you would turn $back now. If you won't, at least remember $two things.\"",
        "two": "He holds up a bony finger: \"The first is that the switches open the grates. Their arcane and inscrutable logic has been lost in the mysts of time. The 
            second,\" - he holds up another finger - \"is the weight of the ore. Collect the $brigo ore, you may yet need it.\"",
        "brigo": "\"Brigo is a bright green ore, sometimes found underground. This $place is near a brigo mine so you may see it scattered about.\"",
        "back": "The spectre wails again: \"Leave this $place, lest you become another one of its $cursed residents! I warn you, it took my $life and I loathe to
            see this happen to another.\" After a pause it bellows: \"Leeeaaave this place, for the caverns below are the creation of a mind twisted and fevered!\""
    },
    waypoints: [ [ 5698, 6663, 8 ] ],
    schedule: [
        { name: "room", from: 0, to: 23, movement: "anchor", waypointDir: -1 },
    ],    
});
