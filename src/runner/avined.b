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
    waypoints: [ [ 6066, 7763, 1 ] ], 
    schedule: [
        { name: "class", from: 8, to: 18, movement: "anchor", waypointDir: 1 },
        { name: "home", from: 18, to: 8, movement: "anchor", waypointDir: -1 }
    ],
});

addNpcDef({
    name: "Fabriantes2",
    label: "Fabriantes",
    creature: "monk",
    convo: {
        "": "You are not completely surprised to see dean Fabriantes here, afterall he's one of the only other people with access to the catacombs. The dean hails
            you: \"I had hoped to keep you out of this, traveler... believe me when I say, it gives me no pleasure to contemplate $murder yet again...\"",
        "murder": "The dean nods and continues in a melancholy voice: \"Yes, you see I had to do away with Fenzeri. That old fool with his obsession with geomancy 
            was getting too $close to figuring out everything. Still, I believe I had a solid $plan... or at least until you started to put the pieces together, anyway.\" -
            he wipes is forehead and continues - \"I suppose one more crime will not taint my legacy in the cabal, so if we're $done talking, I suppose we can proceed...\"",
        "plan": "The dean spreads his hands: \"I might as well come clean since you won't walk out of here alive anyway. As you know the being Vesnu is
            poised to enter our reality. Aiding this is the Cabal of Vesnu, a collection of superior minds, with yours truly leading its local efforts. 
            We believe that Lord Vesnu's arrival will herald a new age of abyssal power, one from which we stand to benefit greatly. To this end, we
            constructed this $device.\" - he points to the mechanism in the center of the room - \"Alas Fenzeri spotted our movements in the magics of Enalim 
            and so he had to be... uh... 'removed' before he could get $close to ringing the alarm.\"",
        "close": "\"Since Lord Vesnu is a being of pure magical energy, his entrance into Enalim is bound to cause some disturbance in the realms of magic. Part of
            my work in the Cabal of Vesnu is to smooth over these waves of errant magic using illusions and other means. Oh, the general population may notice an
            increase of monsters here or there, but it took someone like Fenzeri to see the truth.\" - he sighs and adds - \"So naturally, his $murder was a consequence of
            just him being nosy, the poor fool.\"",
        "device": "Dean Fabriantes looks proudly at the fruits of his insanity, a whirring contraption exuding a magical miasma you can practically feel: \"This device
            is called the Orb of Confusion. Its main purpose is to smooth over the bumps in the magical ether caused by Lord Vesnu's movements as he gets $close to Enalim.
            I involved nearly $everyone building this, not that the fools noticed...\" - he trails off snickering evilly - \"This is what Fenzeri nearly uncovered and what 
            caused his $murder.\" - he scratches his forhead and adds - \"Of course now that you have seen it, perhaps we're $done talking and can proceed with your demise?\"",
        "everyone": "The dean waves his hand: \"Ay yes, of course I already knew how to enter the catacombs, but I needed engineering help from Junto, a few pearls from Asteni,
            and some general language and history primers from the others. So you see, even without their consent, all of us here at the univesity did our part to welcome
            Lord Vesnu. Of course, only I will benefit from his powers. It is only fair since I was also the one carrying out the mission's unpleasent part: the $murder of
            professor Fenzeri.\"",
        "done": () => {
            # start combat
            player.gameState["avenid.boss.fight"] := 1;

            # Fabriantes becomes enraged
            convertNpc(6216, 7741, 1, "FabriantesBoss");
            
            # and calls for help
            setCreature(6203, 7749, 1, creaturesTemplates.spirit);
            setCreature(6203, 7757, 1, creaturesTemplates.spirit);
            setCreature(6231, 7749, 1, creaturesTemplates.spirit);
            setCreature(6231, 7757, 1, creaturesTemplates.spirit);

            return "_end_convo_";
        }
    },
    addByScript: true,
    waypoints: [ [ 6216, 7741, 1 ] ], 
    schedule: [
        { name: "store", from: 0, to: 24, movement: "anchor", waypointDir: -1 },
    ],
});

addNpcDef({
    name: "Asteni",
    label: "Asteni",
    creature: "woman2",
    convo: {
        "": () => {
            if(isItemInInventory("item.necklace.pearl.avined", true)) {
                return "You give Professor Asteni back her lost necklace. She thanks you profusely, saying: \"Thank you for recovering this! It's strange though... a few pearls are missing. Oh
                    well, it was my mother's so I mainly keep it for sentimental reasons. Thanks you again!\"";
            }
            if(player.gameState["avined.quest"] = 1) {
                return "Professor Asteni shakes her head: \"I just can't believe that Dean Fabriantes killed my dear friend, professor Fenzeri. You'll have
                    to excuse me, but I must sort out my thoughts about all this.\". She moves away clearly not wishing to talk anymore.";
            }
            return "You meet middle-aged woman with a serious expression: \"Welcome traveler, I am Dr Asteni, professor of $myth and lore. I suppose
                you have come to ask me about poor Dr. $Fenzeri?\"";
        },
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
        "": () => {
            if(player.gameState["avined.quest"] = 1) {
                return "Professor Hyle shakes your hand: \"I am grateful to you for unraveling the mystery of Fenzeri's murder. However, I must now 
                    return to my studies.\". With that he dismisses you.";
            }        
            return "You see a frail man, peering up at you from under his robes: \"Well met traveler, I'm Dr. Hyle. I teach $history here at the university.
            Although what a horrible business... this $murder has us all shaken up.\" - he adds, his voice trailing off oddly.";
        },
        "history": "Dr. Hyle inspects you carefully before continuing: \"Yes, I teach and research the history of Enalim. Specifically, I'm
             an expert in the history of the republic of $Krynt.\" - he seems to peer at you more intensely - \"I believe the past can 
             teach us many things, don't you? Anyway, my work is on hold until this $murder is cleared up.\"",
        "Krynt": () => {
            idx1 := isItemInInventory("item.chalice.krynt");
            idx2 := isItemInInventory("item.sceptre.krynt");
            idx3 := isItemInInventory("item.seal.krynt");
            if(idx1 || idx2 || idx3) {
                if(player.gameState["avined.catacombs.key"] = null) {
                    player.gameState["avined.catacombs.key"] := 1;
                    player.inventory.add("key.avined");
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
        "researcher": () => {
            if(isItemInInventory("item.dagger.vesnu")) {
                player.gameState["avined.dagger"] := 1;
                return "You show Enner the dagger you found next to Professor Fenzeri's body. Enner inspects the weapon with a thoughtful expression: \"Hmm, I can't say I've seen
                    a one like it before. The inscriptions on the blade\" - something you completely failed to notice - \"are in an ancient language I'm not familiar with. Oh well,
                    if you feel like parting with it, let me know!\"";
            } else {
                return "Enner waves his hands to indicate a vast knowledge antique tools: \"Ah yes, I'm quite the expert on daggers, you know. Even the grand duchess Zanka, had
                    once entreated me in her castle at Wyntergale for the sole purpose of showing me her collection of old knives. If you should come across any... let me know!\"";
            }
        }
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
        "": () => {
            if(player.gameState["avined.quest"] = 1) {
                return "Professor Junto stares at you: \"And so it was Dean Fabriantes who murdered Professor Fenzeri? I just can't believe it...\" He
                    keeps staring while you slowly back away...";
            }        
            return "An owlish man looks up, with a surprised expression: \"Ahem, well met stranger. I am Professor Junto, teacher of geometry, physics and
            $engineering here at the univesity.\" - he shakes his head and adds - \"Poor Fenzeri, he deserved better than $this.\"";
        },
        "engineering": "Professor Junto motions around you: \"Ah yes, I teach the maths and related subjects. Interestingly I end up helping people with all
            kinds of projects around campus because of my field. Why just the other day Professor Mosten - or wait, was it Dean Fabriantes?\" - he pauses trying
            to remember - \"Well I can't recall who it was. At any rate, I helped someone with what seemed like a kinetic scuplture project. You would not believe
            the types of things engineering is useful for! Of course none of $this will help poor Professor Fenzeri... It is so tragic...\" - he adds sadly.",
        "this": "Professor Junto is clearly saddened by the murder: \"Oh yeah, it's tragic what happened to Fenzeri. He and I were close $friends actually. He always
            took an active interest in my field, especially in $engineering. Which just shows what an open-minded soul he was, it being the opposite of his interests...\" - he
            pauses, then adds - \"...Magics, you know.\"",
        "friends": () => {
            if(player.gameState["avined.clue.paper"] = 1) {
                return "Upon hearing they were friends, you remember about Fenzeri's unfinished paper and mention it to Professor Junto. He nods and says: \"Oh yes, he showed it to me a while back. Of 
                    course, none of it made any sense to me, but I do remember one line that stood out:\" - he pauses then recites from memory - \"'Deformed waves of magical energy clearly indicate some
                    foreign being, trying to enter our world from another dimension. The deformations hint at a vast malign intelligence...'\" - he pauses again then adds: \"Now, I wonder what that means?\"";
            } else {
                return "He nods again saying: \"Oh yes we spent a lot of time together. I was fascinated by his magical research and he was kind enough to feign an interest in $engineering. Or maybe he
                    truly was interested - who can say now?!\" - He seems on the verge of sobbing.";
            }
        }
    },
    waypoints: [ [  6104, 7795, 1 ], [ 6118, 7795, 1 ], [ 6118, 7817, 1 ], [ 6102, 7812, 1 ] ], 
    schedule: [
        { name: "class", from: 8, to: 18, movement: "anchor", waypointDir: 1 },
        { name: "home", from: 18, to: 8, movement: "anchor", waypointDir: -1 }
    ],
});

addNpcDef({
    name: "Mosten",
    label: "Mosten",
    creature: "monk",
    convo: {
        "": () => {
            if(player.gameState["avined.dagger"] = 1) {
                player.gameState["avined.dagger"] := 2;
                return "You show professor Mosten the dagger you recovered from Fenzeri's body. She inspects the writing on the blade and nods: \"It is old allright. That dagger is from the Krynt period, but
                    it was not used by the knights. The inscription on the blade is in Fenlen, an ancient language, and it reads: 'Come ye faithful to the cloud fortress of Utaglo to witness (or maybe 'aid'?)
                    the coming of Lord Vesnu'.\" - she shakes her head - \"It is an evil thing, that knife. I would get rid of it, and quickly!\"";
            } else {
                if(player.gameState["avined.quest"] = 1) {
                    return "Professor Mosten speaks slowly: \"I never would have thought that Dean Fabriantes is capable of such a monstrous deed... You must
                        excuse me but I need to consider this matter in privacy.\". She motions for you to be on your way.";
                }        
                return "You see an older woman, wearing the robes of academia: \"Hello there, I am Professor Mosten, teacher of music and $languages here at the
                    univesity. Although\" - she adds slowly - \"I must confess I have not been able to focus on my studies since learning of Fenzeri's $murder...\"";
            }
        },
        "languages": "She nods and says: \"Yes, in fact dead languages of Enalim are my speciality. Did you know for example,\" - she continues, clearly 
            engaged by the subject - \"that there are examples of an old tongue here at the univesity? I don't have access to the $catacombs, but I believe
            there may be ancient phrases down there worth studying.\"",
        "catacombs": () => {
            if(player.gameState["avined.catacombs.key"] = 1) {
                if(player.gameState["avenid.sign.1"] = 1 && player.gameState["avenid.sign.2"] = 1 && player.gameState["avenid.sign.3"] = 1 && player.gameState["avenid.sign.4"] = 1) {
                    return "You recite the four strange phrases you found in the catacombs. Professor Mosten listens intently and after some thinking finally says: \"It
                        seems to me that the four texts are part of a single phrase in Fenlen, an ancient language from the Krynt era of Enalim. I believe that putting
                        the four $together results in an example of a command phrase - one known to operate ancient machinery!\"";
                } else {
                    return "Professor Mosten smiles and says: \"Professor Hyle tells me he gave you access to the catacombs. This is very good news! Finally I
                        can learn about the use of old $languages down there. If you see old written text, be sure to note them all down and come back to me. Once
                        you have seen all such texts, I will try to decode their meaning.\"";
                }
            } else {
                return "Professor Mosten points to the east: \"The university catacombs lie under the stone tower to the south east of here. Access to it is 
                    controlled by Professor Hyle, who, I must say, is excessively protective of the place. He claims that access by non-experts on the history of
                    Krynt would cause permanent damage.\" - she shrugs, continuing - \"I guess he's right but still... I would like to know if there are examples
                    of old $languages down there.\"";
            }
        },
        "together": () => {
            player.gameState["avined.catacombs.open"] := 1;
            restartActiveSections();
            return "Professor Mosten recites: \"Secten erd firdn mos mosdu ust a unnen flr!\" - she pauses drammatically. For a short time nothing happens, but after
            a minute or so of silence, you hear a ^loud grating noise^ that seems to emanate from underground. Professor Mosten nods as if she was expecting this: \"I
            think you should head back to the catacombs to see if anything has changed. I believe the Fenlen command phrase I recited has just caused something to
            activate. Something that has lain dormant for many eons.\"";
        },
        "murder": "She sighs and says: \"Professor Fenzeri was a wonderful researcher of magics. He and I often worked together, especially when he stumbled upon a 
            spell in one of the ancient $languages of Enalim. I don't know what he was working on prior to his death, but I remember him telling me that his new project
            involved something beyond the borders of Enalim. I hope you figure out who did this. I fear this university will not be able to function until you do.\"",
    },
    waypoints: [ [  6071, 7829, 1 ] ], 
    schedule: [
        { name: "class", from: 8, to: 18, movement: "anchor", waypointDir: 1 },
        { name: "home", from: 18, to: 8, movement: "anchor", waypointDir: -1 }
    ],
});
