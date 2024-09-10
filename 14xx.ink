
== iirtc_1401(sl) ==
// Crime on the Streets
// dealing partly with negative social media from another bid!

LIST 14xx_conditions = 14UNDEF = 0, 14Raging, 14Dead, 14DeadCost
VAR 14xx_state = 14UNDEF
//TRAMPOLINE(sl)

{phase:
- xBID: -> BID(sl)
- xPLAN: -> PLAN(sl)
- xATCON: -> ATCON(sl)
}



= BID(sl)


//bid intro - works differently depending on if we're already being aggressive

{ SEENLOOP(iirtc_5101.aggressive):
    Maybe it's revenge against the Con for your own stirring previously, but you're starting to notice rumours about the "dangerous crime" in Lanark turning up in various places on {social_media(period)}.
}
{not SEENLOOP(iirtc_5101.aggressive):
    Just because you're going High, this doesn't seem to be stopping the rival Cons going Low. You've noticed rumours about the "dangerous crime" in Lanark turning up in various places on {social_media(period)}.
}

//test experience for how much we learn about the source
The perpetrator has tried to cover their tracks via sockpuppets and rumourmongering offline. 
{ experience:
  - extensive:
    They're <i>good</i> but you're <i>better</i> - the timings of the initial posts, and some digging with your contacts, makes it pretty clear it's the {social_media(period)} team for the Hillwood bid. Apparently they don't want to settle for just hosting NASFIC in 2 years, and are prepared to play dirty! 
        //Hillwood is from Hey Arnold! and is a Seattle stand-in
  - average:
    They're <i>good</i>, and you can't get anything concrete on them. However, it seems most likely that it's one of the NA con bids, given the spellings and grammar.
  - else: 
    They're really really good, and you have no firm idea of who's the source. 
}

{dejavu > 2: .}

The Committee is pretty concerned about the negative effect this is already having on the bid's image. People are already asking about "safe areas" of Lanark, and even some of the Committee's close contacts seem to be getting a bit antsy. 
It's up to you to sort this out.

Do you:

- (choices)
//allow *both* positive options here if you have enough energy
+ {not SEENLOOP(choice_loop)} [Say Nothing]You decide that the last thing this needs is the legitimacy of an official response. //need to note if we also said nothing in 51xx
    //if you choose to do nothing, you don't get to also do something
    -> nothing -> 
+ {not SEENLOOP(attack) && energy > 0 } [Attack the Rumour Mongers Directly]x
    ~ energy -= 1 
    -> attack -> choice_loop -> choices
+ {not SEENLOOP(address) && energy > 0 } [Address the Content of the Rumours]y
    ~ energy -= 1 
    -> address -> choice_loop -> choices
+ [Move On] 
     
    
-

-> goto_l(sl)

= choice_loop
->->

//IIRTC choices are 33% "address" route [you have to talk about stats]
//                  50% resolves issue [it dies off]
//                  16% works in your favour [makes attackers look bad] but with financial cost in PLAN (1409 PLAN)
// for us, "making attacker look bad" needs the attacker to be obvious (so it depends on experience)
= nothing 
~ temp val = RANDOM(-1,4) + LIST_VALUE(experience)
{ 
 - val < 3:
    Despite your valiant efforts to ignore the issue and hope it dies down, the "safety problem" takes on a life of its own. Fans are now spontaneously bringing up concerns in every conversation about the bid, so you're going to have to actually talk about it.
    Because you've lost control of the narrative, there's no space left to actually address the <i>source</i> of the rumours, you're just going to need to fight the actual message.
    -> address ->
  - val < 6:
    ~ 14xx_state = 14Dead
    As you suspected, the "safety issue" has a limited lifespan. After a slightly nervous few weeks, everyone gets distracted by a new talking point and forgets any of their concerns about the mean streets of Lanark.
  - else:
    ~ 14xx_state = 14DeadCost
    Carefully choosing <i>how</i> not to talk about the safety issue has allowed you to present the subtle impression of being the victim of bullying. The {social_media(period)} Judo pays off: now everyone is talking about how unfair it is that people were fixating on safety concerns purely in Lanark. Without you needing to do a thing, someone else brings up the significant homeless issue in Hillwood...
    Goodwill towards the Lanark bid looks like it's improving by contrast, good job!
    ~ conscore += 1
}
->->


//IIRTC choices are 66% goes badly
//                  33% leads to address
// we should also have a special secret high-experience "goes well" option here
= attack 
~ temp val = RANDOM(-1,4) + LIST_VALUE(experience)
{
    - val < 5:
        //bad
        Talking about it - even as an attack - keeps the issue in everyone's minds. You should have remembered that feelings aren't logical, and it doesn't matter so much <i>why</i> people heard something, but how that thing makes them feel.
        The conversation about the Lanark bid is now dominated by arguments about safety and messaging and entirely devoid of any goodwill.
        ~ 14xx_state = 14Raging
        ~ conscore -= 1
    - val < 7:
        //address
        Talking about the safety issue as an attack works briefly, but even this engagement also gives the conversation itself legitimacy. In the end, you have to actually talk about the rumours themselves
        -> address ->
    - else: 
        //high exp option - needs to be a better payoff than the others because of risk
        Going on the offense was a high-risk option, but you're good enough to pull it off. With some carefully seeded hints to make it obvious to an interested observer that all this conversation is being driven by Hillwood committee members, you manage to stoke a backlash against your rival bid <i>and</i> make Lanark look like an unjustly maligned victim. 
        So successful is this that even legitimate concerns about Lanark as a city now look like churlish criticisms.
        ~ 14xx_state = 14Dead
        ~ conscore += 3
}
->->


//we can get here directly, but also via random choices in other options
// IIRTC has this result in a guaranteed Goodwill loss for making this a conversation
// and then gives a choice as to either:
//   Keep on engaging (with adverts)
//          ->  makes things worse (costs money, keeps conversation even longer)
                1408 PLAN (Raging)
//   Back Off to not prolong the discusson
//          -> nothing immediate
//              1410 PLAN (Finance cost)
= address
The problem with engaging directly with the rumours is that you immediately give legitimacy to the topic of conversation. It's obvious that making people think about crime makes them feel unsafe, and you can almost <i>feel</i> the community's excitement about MetaCon draining away.
~ conscore -= 1
    What's more, your opponent isn't giving up - this is quickly turning into a he-said/she-said situation and a Pyrrhic victory at best.
    There's still time to change tactics if you want to...

+ Continue engaging, ask the Committee to spend funds on advertising.
    ~ conscore -= 1 
    Continuing to engage also continues the downward trend in mood in the community - and now the Committee has had to recommit funds in order to hurt themselves more!
        ~ frustration += 1
    ~ 14xx_state = 14Raging
    ->->
+ Back off, enough harm has already been done by engaging at all!
    Sometimes the best you can do is to stop making things even worse. Your previous actions mean that the crime and safety issue is never going away, but at least you're not stoking the fire even further and spending funds to do it!
    ~ 14xx_state = 14Raging
    ->->


= PLAN(sl)
 
 //PLAN phase is just resolutions here, all the meat is in BID
 { 14xx_state:
 - 14Dead: //nothing to do!
    -> goto_l(sl)
 - 14Raging: 
    Thanks to your previous actions, the crime and safety issue is still dominant in the minds of prospective MetaCon attendees. Not only are attending memberships significantly down, but the Committee makes sure you're aware that your inability to handle this publicity storm has forced them to hire additional security to make people feel safer. 
        ~ conscore -= 2 
 - 14DeadCost: 
    Despite your cunning {social_media(period)} Judo on the crime and safety issue, there's still an inevitable silent minority who were turned off before you (in)acted, and haven't returned since. 
    Whilst they're not longer speaking openly, the Committee feels that the slight downturn in attending member registrations is mostly these people. It's not a huge problem, but is eating a little into the margins.
        ~ conscore -= 1
    
 }
 -> goto_l(sl)
 
= ATCON(sl)

//there is no ATCON phase for this scenario...

-> goto_l(sl)
