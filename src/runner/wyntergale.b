addNpcDef({
    name: "cyric",
    label: "Cyric",
    creature: "guard",
    convo: {
        "": () => {
            if(player.gameState["quest.wyntergale.done"] = true) {
                return "The stout guard addresses you with a modicum of respect: \"I heard what you did in there.\" - he gestures toward the castle - \"Not a bad
                    job for a civilian. If it weren't for guard duty, I prob'ly could have helped ye out. Now,\" - he adds with his usual warmth - \"ye best be moving along.\"";
            } else {
                return "A gruff guard grunts at you: \"Unless ye have business $inside, best be moving along.\"";
            }
        },
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
    name: "Eldric",
    label: "Eldric the Librarian",
    creature: "skeleton_npc",
    convo: {
        "": "A skeleton regards you peacefully. The macabre creature furthers the feeling of loss you feel in this place. It speaks: \"Be welcome mortal to the
            $Library of the Underworld. Feel free to read and learn but beware,\" - it exclaims, raising a bony arm - \"touch nothing but the books. Disturbing the
            honorable $dead will seal your doom.\"",
        "_combat_": "The librarian turns to address you: \"Have I not warned ye to not disturb the honorable dead? Aye, but mortal ears hear not. You
            will now witness the cancerous fruit your entitlements bore as you become one of those who lie eternally in this place.\". The enraged skeletons
            seems to grow in size...",
    },
    waypoints: [ [ 5540, 7138, 1 ] ], 
    schedule: [
        { name: "store", from: 0, to: 24, movement: "anchor", waypointDir: -1 },
    ],
});

const GENERIC_SKELETON = "The skeleton ignores you and goes about its tasks.";
const SK_POS = [
    [ 5542, 7160, 1 ],
    [ 5550, 7160, 1 ],
    [ 5543, 7167, 1 ], 
    [ 5543, 7175, 1 ], 
    [ 5536, 7191, 1 ], 
    [ 5524, 7192, 1 ], 
];

def add_underworld_library_npcs() {
    i := 0;
    while(i < len(SK_POS)) {
        addNpcDef({
            name: "sk" + i,
            label: "sk" + i,
            creature: "skeleton_npc",
            convo: { "": GENERIC_SKELETON },
            waypoints: [ SK_POS[i] ], 
            schedule: [
                { name: "store", from: 0, to: 24, movement: "anchor", waypointDir: -1 },
            ],
        });
        i :+ 1;
    }
}
add_underworld_library_npcs();


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
        "": () => {
            if(player.gameState["mertund.quest"] = 1) {
                return "Mertund greets you: \"Welcome back brave adventurer! Have you brought me the $ingredients I need for the spell to send the $Beast home? Or,
                    would you like to hear why I need your $help again?\"";
            } else {
                return "A slight man with gray eyes waves to you. He looks around nervously, then says: \"I am Mertund, arch-mage of $Wyntergale, in service of the 
                    Grand Duchess $Zanka. I don't know how you made it this far with the $Beast prowling upstairs, but I could use your $help!\"";
            }
        },
        "Wyntergale": "The old man points above, sighs and says: \"Aye, above us is the pride of $Zanka, her once majestic winter retreat: the fortress of Wyntergale. Back
            in the day it was a place of quiet contemplation and the occasional winter ball. Now however,\" - he sighs again - \"it is a place of ruin. That is why I need 
            your $help!\"",
        "Zanka": "The old man explains: \"The Grand Duchess Zanka is the ruler of $Wyntergale. During most of the year she is usually at court in $Arndt, but she spends her
            winters here. That is until the arrival of Beast and the carnage that followed. That is why I need your $help to set things right.\"",
        "help": "The old man becomes more animated: \"I suppose I should explain first, how we ended up in this situation. As you know, I serve the Grand Duchess $Zanka as
            the arch-mage of $Wyntergale. During a routine communion with the spirits where I merely attempted to scry when this unseasonably warm winter might end, a 
            terrible event occured. A stray bit of wild magic disrupted my simple spell, turning it into a fearsome $sigil of summoning!\" - he is clearly still alarmed at this
            turn of events.",
        "sigil": "\"Aye, the foul symbol appeared in front of me, unbidden, as if an unseen hand took control of its creation. It flared up as living flame, growing larger at 
            an astonishing rate. When fully expanded the symbol revealed another world: the barren hellscape of the Abyss! I tried to end the spell and close the portal
            but it was too late. The call of the portal was answered and an infernal $nightmare entered Enalim.\"",
        "nightmare": "The old man seems clearly distraught: \"We call him the Beast of $Wyntergale, but after some research, I believe he's actually a Leveler, a type of demon,
            common to the Abyss. After appearing in the fortress, he immediately slaughtered the guards and the guests. I have been hiding down here for days now searching 
            for a way to set things right, and I believe we still have a $chance! I can handle the magical part, but I need a fresh pair of legs to bring me the 
            ingredients.\"",
        "Beast": () => {
            if(player.gameState["demon.quest"] = 1) {
                return "You show Mertund the gift the demon asked you to deliver. Mertund looks at the object with disgust and says: \"That is a soul trap. If I were to open
                it, I would consign my soul to eternal torment by my voluntary action. But,\" - he says, smiling, - \"I can actually use this object in my research. With
                your $help, I believe we can still set things right!\"";
            } else {
                return "Mertund points to the ceiling above: \"Aye, he is a $nightmare become reality! After he appeared, he raged for days destroying much of the upper level
                    of $Wyntergale and killing all. I have a plan to be rid of him and I could use your $help to accomplish it!\"";
            }
        },
        "chance": "The old man looks a little hopeful now: \"What I have learned from my research is that Leveler demons are bound by hellish oaths to always obey their Liege lords
            who, I can only summize, must be an even greater horror. The call to battle is the sound made on a revolting wind instrument, called the Horn of Hekate, created from
            the remains of souls tortured endlessly in the pits. I believe with the right $ingredients, I can conjure up a portal back to the Abyss and create the illusion of the 
            sound of the Horn of Hekate. If my research is correct, this should compell the demon to return home with haste.\"",
        "ingredients": () => {
            if(player.gameState["mertund.quest"] = 1) {
                if(isItemInInventoryAll(["item.mineral.brigo", "item.reeds.dried", "item.corpse.aldain"], true)) {
                    player.movie := "wyntergale";
                    player.movieState := 0;
                    return "_end_convo_";
                } else {
                    return "\"Thank you again brave adventurer! Return to me when you have acquired a lump of Brigo ore, some dried cave reeds and the remains of Sir $Aldain. Meanwhile I'm 
                        researching the strengthening of my magic so it's not corrupted like last time.\"";
                }
            } else {
                player.gameState["mertund.quest"] := 1;
                return "Mertund looks at you gratefully: \"You are indeed a brave adventurer for accepting this task. In order to open the portal and simulate the sound of the
                    vile horn, I will need a lump of Brigo ore, some dried cave reeds and the bones of Sir $Aldain. Return to me when you have these items. Meanwhile I will 
                    do more research to make sure my magic won't be corrupted again!\"";
            }
        },
        "Aldain": "Mertund nods: \"Aye, Sir Aldain was a great patron of $Wyntergale and a stout member of the Knights of Krynt, an honorable society of old. His bones are
            said to lie nearby on the shores of a lake. Sir Aldain was such a valorous soul that even his bones will add strength to my spell. That is why his remains are one of
            the $ingredients I need.\" - he explains.",
    },
    waypoints: [ [ 5670, 7089, 1 ] ], 
    schedule: [
        { name: "store", from: 0, to: 24, movement: "anchor", waypointDir: -1 },
    ],
});

addNpcDef({
    name: "Mertund2",
    label: "Mertund",
    creature: "monk-red",
    convo: {
        "": "Mertund greets you like an old friend: \"Welcome back, brave adventuter! As usual, stay as long as you want and help yourself to anything the castle
            has to offer. I must be off. There is a lot to do to clean up the destruction the demon left behind.\" - with that he shuffles off.",
        "_complete_": "As the dust settles Mertund turns and addresses you: \"Thanks to you brave adventurer my spell was a success. I was able to conjure up a 
            portal to the Abyss and send the demon home.\" - he beams with excitement - \"I will remain here to undo the destruction but if you could get word
            to the Grand Duchess Zanka that it's safe to return to Wyntergale, it would be much appreciated. Of course,\" - he quickly adds -\"feel free to rest
            here as long as you want. And take anything you find in the fortress as your reward!\"",
    },
    addByScript: true,
    waypoints: [ [ 5683, 7000, 8 ] ], 
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
        "temporary": "Bartos looks around his cell, nods and says: \"Aye, I have been reassigned to this office, but I'm sure it's just temporary. As the Grand
            Duchess's $mystic I can't be gone too long. I wouldn't be surprised\" - he adds waiving a finger at the ceiling - \"if it's been complete $chaos
            up there since I was moved here.\"",
        "chaos": "You briefly relate recent events, namely the arrival of the Beast and the ensuing murder of the fortress staff. Bartos seems to take this in
            stride: \"Well, I have always suspected my work held the place together. This is just what you get once you take the $mystic out of the castle's
            daily routine.\"",
        "mystic": "He proudly pounds his chest: \"And not just a mystic, but the best in the business, at your service. My area of expertese is quite vast although
            recently I was focusing on dungeons below Wyntergale. Did you know,\" - he continues - \"that these dungeons were built atop a $cave containing a vast
            underground lake?\"",
        "cave": "\"Aye, there is a cave below us with a large lake. Why if it weren't for my $temporary lodgings, I would show you the way. Although,\" - he pauses
            thinking - \"If I recall correctly the castle guards hauled large rocks in to block the stairs leading down into the cave for some odd reason.\" - he shrugs, 
            grinning."
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
        "": "What seems to be a captured ogre hails you: \"I Grum-oh! Grum-oh $friend... $like human friend. Grum-oh no tear arms from their sockets!\" - he
            smiles reassuringly. You almost believe him, if it weren't for that fresh corpse in his cell. \"Grum-oh knows big $secret and will tell friend about it!\"",
        "friend": "Grum-oh tries to smile reassuringly. The effect is rather chilling. \"Yes, Grum-oh $like friend. Friend of all living things. No longer hurt humans - Grum-oh sorry
            for all wickedness in the past. ...You\" - he points his massive club at you - \"open cage door and Grum-Oh tell you of $secret information.\" - he nods like
            this is a done deal.",
        "like": "Grum-oh becomes thoughtful: \"Yes, Grum-oh think long time. Grum-oh decide to like all living beings. Eat only plants now. Love plant. Looove 
            plant!\" - it shouts, then after some thinking, it adds: \"Love plant, but also eat, yes. You open cage now and Grum-oh tell you big $secret only few
            others know.\"",
        "secret": () => {
            player.gameState["grumoh.secret"] := 1;
            return "Grum-oh waggles a finger: \"You $friend try trick Grum-oh, but\" - he taps his head with his club. It sounds like a boulder falling - \"Grum-oh 
               smart and not trick. You open cage first, let Grum-oh go free. Then Grum-oh explain big $secret.\" What could possibly go wrong?, you think to yourself.";
        },
        "death": "You finally defeat Grum-oh and with the realization of the moment's finality, a peaceful expression crosses his face: \"Grum-oh sorry, really Grum-oh 
            tried to be friend, but\" - he searches for words - \"maybe Ogre friend not yet coded.\" He must mean the great creator in the sky, in charge of the world's 
            source code. Before you can think too deeply about this intriguing philosophical quandary, Grum-oh says: \"But Grum-oh promise tell secret about $machine.\"",
        "machine": "Grum-oh coughs and breathes laborously: \"Grum-oh overhear guard speak to another human about machine. Machine made work in empty cell. When machine work, 
            steps appear in rock. Machine need heavy\" - he appears to want to say something more but expires suddenly."
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

def wyntergale_cutscene(delta, fadeDir) {
    if(player.movieState = 0) {
        # remove Mertund
        removeCreatureById("c.5670.7089.1");
        player.move.erase();

        # transition to beast
        fadeViewTo(5683, 6997);
        player.movieState := 1;
    } else if(player.movieState = 1) {
        if(fadeDir = 1) {
            # add Mertund
            setNpc(5683, 7000, 8, npcDefs["Mertund2"]);
            beast := array_find(creatures, c => c.id = "c.5687.6999.8");
            mertund := array_find(creatures, c => c.id = "c.5683.7000.8");

            # move the Beast
            beast.move.erase();
            beast.move.set(5689, 6998, 8);

            # move the player
            player.move.set(5683, 6997, 8);

            # face everyone correctly
            player.move.dir := DIR_W;
            mertund.move.dir := DIR_W;
            beast.move.dir := DIR_E;
            
            # draw everyone
            beast.move.setShape(beast.move.shape);
            mertund.move.setShape(mertund.move.shape);
            player.move.setShape(player.move.shape);

            # stop animation for all
            player.move.setAnimation(ANIM_STAND);
            stopCreatures();

            # hide roof        
            setRoofVisiblity();

            player.movieState := 2;
        }
    } else if(player.movieState < 3) {
        player.movieState :+ delta;
    } else if(player.movieState < 4) {
        timedMessage(5683, 7000, 8, "Arak Set Finiel!");
        player.movieState := 5;
    } else if(player.movieState < 6) {
        player.movieState :+ delta;
    } else if(player.movieState < 7) {
        # todo: spell effect on demon
        removeCreatureById("c.5687.6999.8");
        player.movieState := 8;
    } else {
        # end movie
        player.gameState["quest.wyntergale.done"] := true;
        player.movie := null;
        startConvo(npcDefs["Mertund2"], "_complete_");
    }
}
