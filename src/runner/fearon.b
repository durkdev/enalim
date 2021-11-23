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
        "": "A spectre hovers nearby, dressed in the remnants of a ceremonial armor: \"Welcome to the Hall of the Chalice\" - it rasps.",
    },
    waypoints: [ [ 5588, 6620, 1 ] ],
    schedule: [
        { name: "room", from: 0, to: 23, movement: "anchor", waypointDir: -1 },
    ],    
});
