== iirtc_5101(sl)
//Fran Frasier versus WAMO
= TRAMPOLINE(sl)

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

* Focus on building your bid's presence, going the extra mile and diverting effort from your other projects.
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
 - 0: -> IGNORED ->
 - else: -> WARNED ->
 }


-> goto_l(sl)



= PLANRES1 
//result of Warning the Committee in a more readable place
~ PLANRES1_v = 1

    

->->

//we told the ctte not to worry in PLAN
= IGNORED 

->->


//we released a statement in PLAN
= WARNED

->->