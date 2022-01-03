addNpcDef({
    name: "Akhim",
    label: "Akhim",
    creature: "beard",
    trade: [ CAT_AXE, CAT_ARMOR, CAT_HELMET, CAT_LEGGING, CAT_GLOVE, CAT_SHIELD, CAT_BOOTS],
    convo: {
        "": "The large man in front of you is obviously a blacksmith. \"Greetings traveler, I am Akhim the smith of $Avined University. Thanks to 
            the research conducted here, I produce the finest weapons and armor in all of Enalim!\"",
        "Avined": "Akhim points to the stone building to the east: \"If ye are interested in enrolling or learning about the university, 
            talk to Dean Fabriantes over at the central building.\"",
    },
    waypoints: [ [ 6104, 7753, 1 ], [ 6102, 7766, 1 ] ], 
    schedule: [
        { name: "store", from: 8, to: 18, movement: "anchor", waypointDir: 1 },
        { name: "home", from: 18, to: 8, movement: "anchor", waypointDir: -1 }
    ],
});

addNpcDef({
    name: "Fabriantes",
    label: "Fabriantes",
    creature: "monk",
    convo: {
        "": "You see a tall man with a severe expression. \"I wish I could properly welcome you traveler, but alas the $university is currently in $crisis. My name is
            Fabriantes and as the dean\" - he points to himself - \"I have been working hard to find someone who can figure out what happened!\"",
        "university": "\"You have reached the fabled Avined University of Enalim.\" - he says, sighing - \"Once home to science, research and learning, but
            not anymore, sadly. We're dealing with a $crisis, and\" - he adds with a serious tone - \"there is a chance this could undo all the good work we have
            done over the years. I need someone to $investigate what happened, so we can clear our name and get back to teaching!\"",
        "crisis": "The dean's expression hardens: \"This is possibly the worst crisis to ever happen here at Avined
            $university. There is a real chance that the damage to the institution's image is quite unrepairable.\" - he looks
            down, clearly dismayed. After a pause he continues: \"You see something happened here that never has before: a
            $murder.\"",
        "murder": "Dean Fabrianted nods: \"Aye, we have preserved the scene of the $crime over\" - he motions to the south east - \"at
            the entrance of the $catacombs. The victim was Professor Fenzeri, a renowned teacher of magic. If you could unravel
            this mystery and figure out what happened, I would be most grateful.\" - he rubs his hands nervously - \"This business of 
            the dead professor is very bad for us. We had to close the place down and send the students home until it's resolved. Please
            feel free to $talk to my $staff and if you piece together what happened, report back to me.\"",
        "crime": "The dean sadly recounts: \"A few days ago a student came to me, reporting that the instructor for their class on the
            history of magic, a Dr. Fenzeri, never showed up to class. Since professors essentially live next door to their classrooms, this
            seemed odd. After a campus-wide search for the missing instructor, we found his corpse, covered in blood, as he is to this day,
            in the tower of the $catacombs. Please figure out what happened! You have my permission to $talk to and interogate my staff in order to unravel
            who committed this $murder.\"",
        "staff": "Dean Fabriantes spreads his hands: \"I cannot understand who could have committed such a serious $crime.  Here, at Avined 
            $university, we only hire the best. That was also how Dr. Fenzeri came to work here.\" - he pauses sighing, then continues - \"I now
            have four professors working for me: Dr. Asteni, Dr. Hyle, Dr. Junto and Dr. Mosten. Besides them there are a few craftsmen who
            ply their trade here for additional income for the university.\"",
        "talk": "Dean Fabriantes looks squarly at you: \"Yes, ask my $staff about their whereabouts during the night of the $crime. As for me,
            after my last class in the afternoon, I went out for a walk around Lake Ennid,\" - he points to the East -\"after that I was in my
            chambers. I'm a deep sleeper and heard nothing during the night.\"",
        "catacombs": "\"You should really ask Dr. Hyle, the historian among my $staff, about the catacombs. My understanding is that it houses
            the final resting place of knights of some old order. The tower is mostly used for storage nowadays which makes it odd that the 
            body of Dr. Fenzeri would have ended up there. Such a horrible $crime\" - he muses - \"and what ghastly business this makes for 
            the reputation of the $univesity.\"",
    },
    waypoints: [ [ 6070, 7796, 1 ], [ 6084, 7796, 1 ], [ 6084, 7780, 1 ], [ 6072, 7775, 1 ], [ 6066, 7763, 1 ] ], 
    schedule: [
        { name: "class", from: 8, to: 18, movement: "anchor", waypointDir: 1 },
        { name: "home", from: 18, to: 8, movement: "anchor", waypointDir: -1 }
    ],
});

addNpcDef({
    name: "Asteni",
    label: "Asteni",
    creature: "woman2",
    convo: {
        "": "You meet middle-aged woman with a serious expression: \"Welcome traveler, I am Dr Asteni, professor of $myth and lore. I suppose
            you have come to ask me about poor Dr. $Fenzeri?\"",
        "myth": "Dr. Asteni gestures around to indicate the univesity: \"My area of study is the myths and lore of Enalim. I have been working
            here at Avined University for the last few years. Before this unfortunate event involving Professor $Fenzeri it was a rather 
            pleasent place to work. I still remember when Dean $Fabriantes hired me...\" - she reminisces.",
        "Fabriantes": "She points to the stone building at the center of campus: \"Dean Fabriantes has been here since before my time. As
            far as I can tell he's a conscientious leader, trying to do the right thing even with this difficult $Fenzeri case.\"",
        "Fenzeri": "Dr. Asteni sighs deeply before continuing: \"Professor Fenzeri taught magic. His speciality was geomancy: magic derived
            from natural sources. In fact,\" - she says, suddenly remembering something - \"he was studying something related to the 
            recent increase in monster attacks, right before he disappeared. He even wrote a $paper on his work.\" - she sighs again - \"I
            just can't believe he's $gone.\"",
        "gone": "She wipes away a tear and continues in a shaky voice: \"Alas, professor $Fenzeri was murdered in cold blood. I still remember
            that day, looking for a $lost pearl necklace. I was so lost in my own search I almost didn't understand the horrible news Dean
            $Fabriantes brought me. Such a senseless crime!\"",
        "lost": () => {
            player.gameState["avined.clue.necklace"] := 1;
            return "She waves her hands saying: \"It is nothing of consequence, I'm sure it will turn up. You see $Fenzeri and I just had dinner 
                together the night before his\" - she chokes out the words - \"murder... and the next day my favorite pearl necklace was nowhere
                to be found. I'm sure it will turn up soon.\"";
            },
        "paper": () => {
            player.gameState["avined.clue.paper"] := 1;
            return "\"Yes, professor $Fenzeri wrote down his thoughts on the recent increase of monster attacks and other strange phenomena
                plagueing Enalim. I don't know where the paper is... maybe ask some other faculty member?\"";
        }
    },
    waypoints: [ [ 6070, 7732, 1 ], [ 6068, 7748, 1 ], [ 6084, 7749, 1 ], [ 6085, 7732, 1 ], [ 6102, 7731, 1 ] ], 
    schedule: [
        { name: "class", from: 8, to: 18, movement: "anchor", waypointDir: 1 },
        { name: "home", from: 18, to: 8, movement: "anchor", waypointDir: -1 }
    ],
});

addNpcDef({
    name: "Hyle",
    label: "Hyle",
    creature: "monk-blue",
    convo: {
        "": "You see a frail man, peering up at you from under his robes: \"Well met traveler, I'm Dr. Hyle. I teach $history here at the university.
            Although what a horrible business... this $murder has us all shaken up.\" - he adds, his voice trailing off oddly.",
        "history": "Dr. Hyle inspects you carefully before continuing: \"Yes, I teach and research the history of Enalim. Specifically, I'm
             an expert in the history of the republic of $Krynt.\" - he seems to peer at you more intensely - \"I believe the past can 
             teach us many things, don't you? Anyway, my work is on hold until this $murder is cleared up.\"",
        "Krynt": () => {
            idx1 := player.inventory.findIndex("item.chalice.krynt");
            idx2 := player.inventory.findIndex("item.sceptre.krynt");
            idx3 := player.inventory.findIndex("item.seal.krynt");
            if(idx1 > -1 || idx2 > -1 || idx3 > -1) {
                if(player.gameState["avined.catacombs.key"] = null) {
                    player.gameState["avined.catacombs.key"] := 1;
                    player.inventory.add("key.avined", -1, -1);
                    return "He moves closer and whispers conspiratorially: \"I sense something special about you traveler. An unexplainable 
                        connection to the Knights of Krynt perhaps? For some reason I feel like you already know more about them than you're
                        letting on.\" - pulls a great, ^brass key^ from his robes and hands it to you - \"I rarely let people enter the $catacombs
                        but for some reason I trust you. Take these keys and explore below - perhaps it will help you unravel to clues to this
                        $murder.\"";
                } else {
                    return "The professor winks at you: \"Like I said earlier, I sense that you have some kind of conncetion to the Knights
                        of Krynt. Take the $catacombs key and explore their resting place. I trust you will find something down there to
                        help you solve the mystery of Fenzeri's $murder.\"";
                }
            } else {
                return "He waves his hands dismissively: \"The Krynt republic was an era of rationality long, long ago. There are few today
                    who would be interested in its arcane mysteries. Even the $catacombs don't get as many visitors as before.\" - he sighs
                    and continues - \"It seems people have accepted that the poor will remain poor and uneducated while the rich live their
                    lavish existence. If people ignore the lessons of history it may seem like there is no other way to live.\" - he 
                    pointificates.";
            }
        },
        "catacombs": "The professor folds his arms and says coldly: \"The catacombs below the university house the remains of the knights of $Krynt.
            These relics are priceless and I vowed to keep their final resting place sacred and away from prying eyes. Only myself and dean
            Fabriantes have the key to explore its mysteries.\" - he pauses, trying to decide if should say more - \"And this is why prior to
            his unfortunate $murder, I was so concerned about Fenzeri's $plans down there.\"",
        "murder": "Professor Hyle shakes his head: \"It is a sad business indeed. I won't lie to you: I had no great love for Dr Fenzeri, nor
            his $plans to perform a ritual in the $catacombs. However, I'm shocked and saddened to hear about his demise. We may not have 
            always seen eye to eye, but I have always respected him as a fellow scholar.\"",
        "plans": "He sighs and says: \"As you probably already know, I am protective of preserving the $catacombs as a sacred historical
            location of the knights of $Krynt. When professor Fenzeri asked me for the keys to perform some kind of magical ritual down there, I
            may have...\" - he trails off, embarrassed - \"Suffice to say, I regret yelling at him now, especially since the poor man's $murder.\""
    },
    waypoints: [ [  6038, 7763, 1 ] ], 
    schedule: [
        { name: "class", from: 8, to: 18, movement: "anchor", waypointDir: 1 },
        { name: "home", from: 18, to: 8, movement: "anchor", waypointDir: -1 }
    ],
});

addNpcDef({
    name: "Enner",
    label: "Enner",
    creature: "man-yellow",
    trade: [ CAT_SWORD, CAT_DAGGER, CAT_LANCE ],
    convo: {
        "": "A large, smiling man greets you: \"Ah welcome treasured customer! Welcome to Enner's $weapon shop! Please take your time and browse
            my wares. Let me know if you have questions, for I am also a $researcher of antique daggers, besides working in sales.\"",
    },
    waypoints: [ [  6038, 7780, 1 ], [  6038, 7792, 1 ] ], 
    schedule: [
        { name: "class", from: 8, to: 18, movement: "anchor", waypointDir: 1 },
        { name: "home", from: 18, to: 8, movement: "anchor", waypointDir: -1 }
    ],
});


addNpcDef({
    name: "Junto",
    label: "Junto",
    creature: "beard2",
    convo: {
        "": "An owlish man looks up, with a surprised expression: \"Ahem, well met stranger. I am Professor Junto, teacher of $geometry, physics and
            engineering here at the $univesity.\" - he shakes his head and adds - \"Poor Fenzeri, he deserved better than $this.\"",
    },
    waypoints: [ [  6104, 7795, 1 ], [ 6118, 7795, 1 ], [ 6118, 7817, 1 ], [ 6102, 7811, 1 ] ], 
    schedule: [
        { name: "class", from: 8, to: 18, movement: "anchor", waypointDir: -1 },
        { name: "home", from: 18, to: 8, movement: "anchor", waypointDir: 1 }
    ],
});

addNpcDef({
    name: "Mosten",
    label: "Mosten",
    creature: "monk",
    convo: {
        "": "You see an older woman, wearing the robes of academia: \"Hello there, I am Professor Mosten, teacher of music and $languages here at the
            $univesity. Although\" - she adds slowly - \"I must confess I have not been able to focus on my $studies since learning of Fenzeri's $fate...\"",
    },
    waypoints: [ [  6071, 7829, 1 ] ], 
    schedule: [
        { name: "class", from: 8, to: 18, movement: "anchor", waypointDir: 1 },
        { name: "home", from: 18, to: 8, movement: "anchor", waypointDir: -1 }
    ],
});
