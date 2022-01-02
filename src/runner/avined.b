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
        "": "You see a frail man, peering up at you from under his robes: \"Well met traveler, I'm Dr. Hyle. I teach $history here at the $university.
            Although what a horrible business... this $murder has us all shaken up.\" - he adds, his voice trailing off oddly.",
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
