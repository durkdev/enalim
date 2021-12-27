addNpcDef({
    name: "Akhim",
    label: "Akhim",
    creature: "beard",
    trade: [ CAT_SWORD, CAT_DAGGER, CAT_AXE, CAT_LANCE, CAT_ARMOR, CAT_HELMET, CAT_LEGGING, CAT_GLOVE, CAT_SHIELD, CAT_BOOTS],
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
        "crisis": ""
    },
    waypoints: [ [ 6070, 7796, 1 ], [ 6084, 7796, 1 ], [ 6084, 7780, 1 ], [ 6072, 7775, 1 ], [ 6066, 7762, 1 ] ], 
    schedule: [
        { name: "class", from: 8, to: 18, movement: "anchor", waypointDir: 1 },
        { name: "home", from: 18, to: 8, movement: "anchor", waypointDir: -1 }
    ],
});
