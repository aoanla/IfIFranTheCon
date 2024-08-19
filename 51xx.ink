== iirtc_5101(sl)
//Fran Frasier versus WAMO
//TRAMPOLINE
{phase:
- xBID: -> BID(sl)
- xPLAN: -> PLAN(sl)
- xATCON: -> ATCON(sl)
}


= BID(sl)

«Sure, send me over the packet and I'll get to work.»

...

A few hours later, you've familarised yourself with the info on MetaCon {WC(period)} bids. It looks like there's a few competitors to the bid you're supporting, some of which look to be actual serious rivals, but also that your bid has practically no {social_media(period)} presence at all...

{dejavu > 2: Also, you weirdly hear a faint quacking from somewhere, despite there being no ducks around that you can see.}

Do you:

* { energy > 1 } Focus on building your bid's presence, going the extra mile and diverting effort from your other projects.
    ~ frustration -= 2
    ~ energy -= 2
    ~ conscore += 2
* Put in a token effort to build reputation, but keep your powder dry for if the bid is successful
    ~ frustration += 1
* Focus on destroying those serious competitors - no-one bests Fran Frasier!
    ~ frustration += 2
    ~ conscore -= 2
//Potential for choice 3 to divert to "kicked off" end choice, influenced by frustration

- 

//results


-> goto_l(sl)

= PLAN(sl)
//5104 

It's a success: your bid has succeeded in being Selected to host MetaCon {WC(period)}!
This also means you're going to be even more busy handling all of the promotion for the event as it heads towards going live...

//random chance we don't notice, based on experience
 { LIST_RANDOM(Skills) > experience: 

 This is a lot of work, but you don't notice anything particularly worrying on {social_media(period)}, so maybe everything will be okay.
 //dejavu can rescue us here
  { RANDOM(1,6) < dejavu:
    However, there's something niggling in the back of your head, like you've been here before, so you check again... 
    -> PLAN2(sl)
    }
 -> goto_l(sl) 
 }
 
 -> PLAN2(sl)
 
 = PLAN2(sl)
 //actually 5104, if you notice the WAMO
 Hm, your attention is drawn to {WAMOloc(period)}, where there's some chatter from a group called WAMO mentioning MetaCon.
 Apparently, the catering company the venue insist on - Luna Catering Company - have a signature moon pie with a green filling. WAMO - Writers Advocating {period == c2050s: against Musksphere Oppression|for Moon Occupation} - are concerned that Earth's primary satellite is being insulted by the scientific inaccuracy of this product, and are starting to make noise about it.
 At this point, no-one serious seems to have noticed the noise, but it might be worth warning the committee to take action before it gets worse.
 
 * Warn the Committee to release a statement
    //experience determines how well the statement goes
    -> PLANRES1 -> 
 * [Ignore the fuss, it's not going to catch on] You tell the committee that there's some weirdos called WAMO agitating, but that they can be safely ignored. At least this frees up more time for promotion!
 
 //this is the null result

 -
 -> goto_l(sl)
 
= ATCON(sl)

Well, you finally made it here - the venue is moved into, Hucksters are setting up their stalls, Programmes are printed and Registration is just about to open.
Of course, this also means that you're handling a new and exciting set of questions about every tiny thing that the Committee didn't think of in advance...

//if we didn't notice the QuackFest issue, then it blows up here
// LOGIC NOTE: I think i need to reset these visit counters if I am looping with dejavu... 
{ not SEENLOOP(->iirtc_5101.PLAN2): 
<i>Fuck</i>, it looks like one of those things might be on <i>you</i>. Apparently you missed that some fringe org called WAMO have a weird beef with the Catering company the Con contracted with, and they've been formenting dissent in some obscure corner of {social_media(period)} for <i>months</i>.
It looks like several panellists and high-profile authors are sympathetic to the cause and have dropped out at the last minute, and registrations are being cancelled.
    ~ frustration += 9
    ~ conscore -= 2
    -> goto_l(sl)
}
//otherwise, how did we do in dealing with WAMO?

//we told the committee not to worry
{ SEENLOOP(->iirtc_5101.PLANRES1): 
     { 
     - SEENLOOP(->iirtc_5101.NOT_RESOLVED): 
        <- BOYCOTT
     -  SEENLOOP(->iirtc_5101.RESOLVED):
        <- QUIET 
        //or we dropped Luna Catering
    - else:    However, before all of that, the Committee would like to talk to you about your advice to drop Luna Catering. It seems that the venue's strict catering rules mean that no other caterer could be found (despite, the Committee emphasises, significant unseemly grovelling that they were forced into by your actions), and so all the con-goers are having to go off-site to get food.
        This is, they emphasise, a DISASTER.
        ~ frustration += 6
        ~ conscore -= 3
    }
}

-    
-> goto_l(sl)



= PLANRES1 
//result of Warning the Committee in a more readable place
 You let the committee know about the potential drama, and help them prepare a suitable set of statements.
{ RANDOM(1,4) < LIST_VALUE(experience):
    Whether due to your experience or not, the intervention seems to help calm people down - whilst WAMO are still mumbling in their own group, the wider world is satisfied.
    Good job, Fran!
    ~ conscore += 1
    ~ frustration -= 2
    ->->
}

It doesn't seem to do a lot of good - in fact, making the statements seems to have just drawn attention to the developing drama! The discussion is now spreading across {social_media(period)} and threatens to blow up into something major.
~frustration += 1
~conscore -= 1
Despite their decided unhappiness with this turn of events, the Committee would like you to handle this properly...

* [Do Nothing] You advise the Committee that at this point, doing anything will just amplify matters further.
    {RANDOM(1,6):
    -1: You're right - only a day later, {social_media(period)} is distracted by an entirely different drama, and, whilst WAMO are still upset, the wider world has forgotten about them.
        -> RESOLVED ->
    -else: 
        -> NOT_RESOLVED ->
    }
* [Flatter WAMO and make concessions] You work with the Committee to draft a suitably conciliatory statement to WAMO.
    {RANDOM(1,3) < LIST_VALUE(experience):
        You already know how to work with individuals obsessed with an obscure interest no-one else cares about by dealing with the Committee, so handing WAMO is a piece of cake. You flatter their concerns whilst carefully not making any strong commitments about significant change, and they eat it all up like one of those moon pies.
        -> RESOLVED ->
    - else: 
       WAMO treat your concessions as just more validation of the rightness of their cause, and continue to make demands. 
    -> NOT_RESOLVED ->
    }
* [Drop Luna Catering, despite them being the only approved caterer for the venue.] You advise the Committee that WAMO are clearly irrational, and the only thing that will sate them is dropping the offending caterer.
    WAMO immediately declare victory, and luckily the parts of {social_media(period)} who were looking forward to those moon pies are not so rabid, so the entire thing dies down.
-
->->

= RESOLVED
    It looks like disaster (at least, <i>this</i> disaster) is averted!.
    ~frustration -= 1
->->

= NOT_RESOLVED
    It doesn't look like this one is going away before the Con...
->->

//situation was not resolved
= BOYCOTT 
{RANDOM(1,6):
    - 1: Unfortunately, the calls for boycott from WAMO on {social_media(period)} have had more influence than you feared. Several high-profile authors joined the boycott, and took significant fen with them. The Con is still viable, but it's definitely wounded by this.
        ~ frustration += 4
        ~ conscore -= 2
    - 2: -> B_COMMON ->->
    - 3: -> B_COMMON ->->
    - else: Luckily, the rating fire about Luna Catering on {social_media(period)} was limited entirely there. Anyone who was going to go to MetaCon seems to have been insufficiently interested in the debate to change their behaviour - attendance is as good as the Committee had planned for.
}
//I don't understand why this doesn't need a -> DONE as a thread...

= B_COMMON 
    The boycott calls from WAMO have been ignored by sensible people, but sadly not all con-goers are such people. Whilst attendance isn't significantly down, there is a bit of a negative feeling around the food trucks bringing the mood down overall.
    ~conscore -= 1
->->

//arguments nixed
= QUIET
    Thankfully, the drama about WAMO and the Luna Catering Company have stayed quiet since you dealt with them.
-> DONE //because this is a thread?