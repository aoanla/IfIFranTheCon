
// Note, the scenarios in the Discord game were 51xx obviously, 4xx, 10xx, 1xx, 54xx, 30xx, 24xx, 41xx, 16xx
// At the moment, I've taken different scenarios from IIRTC that seemed to be social mediay
// but I might still switch to using a subset from the Discord instead (obviously, 51xx first still!)
// In particular, I think 16xx is quite applicable...

LIST Numbers = one, two, three, four, five
LIST TimePeriod = undeterminate, c1990s, c2020s, c2050s
LIST Skills = undeterminate, weak, average, extensive
LIST Scenarios = S_5101, S_5201, S_5901, S_801, S_2001
LIST Phase = none, xBID, xPLAN, xATCON
VAR period = TimePeriod.undeterminate
//Fran Stats
VAR frustration = 0
VAR fandom = Skills.undeterminate 
VAR experience = Skills.undeterminate
//Mysterious reality breaking newgame+, ++ counter leading to the Eternal Franpion
VAR dejavu = 0
VAR callcnt = 0
VAR phase = none
//Con stats
VAR conscore = 10



-> PRELUDE

== goto_l(sl)
{ LIST_COUNT(sl):
    - 0: -> BEGIN.dispatch
    - else: 
        ~ temp s = LIST_RANDOM(sl)
        -> goto(s,sl - s)
}
        
== goto(s, sl)
{ s:
- S_5101: -> iirtc_5101(sl)
- S_5201: -> iirtc_5201(sl)
//- S_901:  -> iirtc_901(sl)
- S_5901: -> iirtc_5901(sl)
- S_801:  -> iirtc_801(sl)
- S_2001: -> iirtc_2001(sl)
}
    

== function dejaRAND(-> l) ==
//where l is a list of 7 items (1-6 for die, plus 7 for dejavu
    ~ temp dieroll = RANDOM(2,7)
    { dieroll <= dejavu: 
        ~ dieroll = 1
    }
    ~ return l(dieroll)
    

== function WC(p) ==
    { p:  
    - TimePeriod.undeterminate: 0
    - c1990s: 53
    - c2020s: 82
    - c2050s: 111
    }
    
== function weak_SF(p) ==
    {p: 
    - TimePeriod.undeterminate: a strange blank
    - c1990s: you thought Winona Ryder and Keanu Reeves were hot in Dracula
    - c2020s: you saw some of the Marvel movies
    - c2050s: you simmed a movie about a world with frozen water at the poles once
    }
    == function average_SF(p) ==
    {p: 
    - TimePeriod.undeterminate: eldritch cubehedrons
    - c1990s: Doctor Who
    - c2020s: Doctor Who
    - c2050s: Doctor Who
    }

== function obsessive_SF(p) ==
    {p: 
    - TimePeriod.undeterminate: floople in the dread dimensions
    - c1990s: character in 
    - c2020s: in-joke in Lower Decks, citing series and episode.
    - c2050s: episode in the complete run of One Piece
    }

== function voice(p) ==
    {p: 
    - TimePeriod.undeterminate: emanation
    - c1990s: voice 
    - c2020s: voice
    - c2050s: impression-stream
    }
    
== function social_media(p) ==
    {p:
    - TimePeriod.undeterminate: palantir
    - c1990s: UseNet
    - c2020s: socials
    - c2050s: HyperNet
    }

//TODO
== function weak_exp(p) ==
    {p:
    - TimePeriod.undeterminate: «I'm sorry, I really don't have the time for this»
    - c1990s: «I'm sorry, I really don't have the time for this»
    - c2020s: «I'm sorry, I really don't have the time for this»
    - c2050s: «I'm sorry, I really don't have the time for this»
    }

//TODO
== function average_exp(p) ==
    {p:
    - TimePeriod.undeterminate: «I'm sorry, I really don't have the time for this»
    - c1990s: «I'm sorry, I really don't have the time for this»
    - c2020s: «I'm sorry, I really don't have the time for this»
    - c2050s: «I'm sorry, I really don't have the time for this»
    }

//TODO
== function extensive_exp(p) ==
    {p:
    - TimePeriod.undeterminate: «I'm sorry, I really don't have the time for this»
    - c1990s: «I'm sorry, I really don't have the time for this»
    - c2020s: «I'm sorry, I really don't have the time for this»
    - c2050s: «I'm sorry, I really don't have the time for this»
    }

== PRELUDE

<b>If I Fran The Con</b>
<i>by Sam Skipsey, a f<s>r</s>angame for If I Ran the <s>Zoo</s>... Con, inspired by John Coxon's game for the WorldCon 82 / Glasgow 24 Discord, and written in Ink</i>

&nbsp;
<hr/>

-> BEGIN


== BEGIN == 

~ period = TimePeriod.undeterminate
~ frustration = 0
~ fandom = Skills.undeterminate 
~ experience = Skills.undeterminate
~ phase = none



A loud ringing sound permeates the perfect silence, penetrating into the comforting warmth of sleep.
~ callcnt = 0

- (sleep) 

 + [Answer It]
  -> call
 + [Ignore It and Try to Get to Sleep]
    ~ frustration += 1
    {sleep < 3: -> sleep | -> Ring_Off }
    
= call


Giving up your attempt to ignore the distraction, you <>

- (callpoint)

+ {dejavu} { not callcnt } \ <>{dejavu == 1: have a strange feeling you've been here before, but... | somehow know this is about MetaCon, and... }
    ~ dejavu += 1
    ~ callcnt += 1
    -> callpoint 
* lean over and pick up the receiver from the telephone on the sideboard
   ~ period = c1990s
* grab your cellphone from the sideboard, and thumb "accept"
   ~ period = c2020s
* <>open a NeuroWeb port to the incoming request
   ~ period = c2050s

-

The {voice(period)} on the end of the line is {frustration > 1: excited| frustrated}.
"Fran," it begins, "I'm glad you {frustration > 0: finally} answered, there's a fantastic opportunity coming up! <>{dejavu > 2:"}

{dejavu > 2: 
    * «This is about MetaCon, isn't it?»
        -> dejavu_track
    * [Let Them Continue]
        -> cont
}

-> cont

= cont

"You know I've been invited onto the bid committee for MetaCon {WC(period)}?"

You do - they've not stopped going on about it since they got the position of "Ribbon Planner" on the committee, which they claim is a vital component of a successful event.
As for you, your connection with SF&F is:

* [just that {weak_SF(period)}] <i>weak</i>
 ~ fandom = weak
* [a healthy appreciation of {average_SF(period)}] <i>healthy</i> 
 ~ fandom = average
* [extensive - you can name every {obsessive_SF(period)}] <i>extensive</i>
 ~ fandom = extensive
 
 -
 
 The {voice(period)} continues.
 "Well, in any case, the committee wanted to get the word out on {social_media(period)} and so they're looking for an expert.
 "I remembered that you'd been building a following, so I suggested your name and the committee jumped at the chance to get someone with your experience.
 "(I may have laid it on a little thick, but what are friends for?)"
 
 * [Protest that you only have a little experience] {weak_exp(period)}
  ~ experience = weak
 * [Agree to do your best with your developing contacts list] {average_exp(period)}
  ~ experience = average
 * [Confidently assert that this is well within your skill set] {extensive_exp(period)}
  ~ experience = extensive 
 * [Refuse the Offer] «I'm sorry, I really don't have the time for this»
    -> refused_the_call
  
 - 
 
 "Fran, <>{experience: 
 - weak: I know you don't think you're up for this, but think of this as a trial of fire
 - average: I'm glad you said yes - and hopefully it'll be good for your CV too!
 - extensive: I know, I know we're lucky to have you, seriously :p 
 } 
 "Anyway, I think we should start right away... here's some basic facts about our bid
 "... and our opponents. 
 "Can you try to create some buzz for us to maximise our visibility?"
 
 ~ phase = xBID
 
 //select the set of scenarios for this time
 ~ Scenarios = ()
 ~ Scenarios +=  LIST_RANDOM(LIST_ALL(Scenarios) - Scenarios)
 ~ Scenarios +=  LIST_RANDOM(LIST_ALL(Scenarios) - Scenarios)
 
 -> goto(S_5101, Scenarios) 
 
 //and jump to first one, which will be 5101
 = dispatch 
 
 { phase:
 //we finished last phase
 - xATCON: -> Epilogue
 - else: 
         ~ phase++
         -> goto(S_5101, Scenarios) 
 }


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
* Put in a token effort to build reputation, but keep your powder dry for if the bid is successful.
* Focus on destroying those serious competitors - no-one bests Fran Frasier!

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
 
 -> goto_l(sl)
 
= ATCON(sl)

Well, you finally made it here - the venue is moved into, Hucksters are setting up their stalls, Programmes are printed and Registration is just about to open.
Of course, this also means that you're handling a new and exciting set of questions about every tiny thing that the Committee didn't think of in advance...

//if we didn't notice the QuackFest issue, then it blows up here
{ not PLAN2: 
<i>Fuck</i>, it looks like one of those things might be on <i>you</i>. Apparently you missed that some fringe org called "Writers Advocating for Moon Occupation" have a weird beef with the Catering company the Con contracted with, and they've been formenting dissent in some obscure corner of {social_media(period)} for <i>months</i>.
It looks like several panellists and high-profile authors are sympathetic to the cause and have dropped out at the last minute, and registrations are being cancelled.
    ~ frustration += 1
    ~ conscore -= 2
    -> goto_l(sl)
}
//otherwise, how did we do in dealing with WAMO?


-> goto_l(sl)
    
== iirtc_5201(sl)  ==
//NASA publicity
= TRAMPOLINE(sl)

{phase:
- xBID: -> BID(sl)
- xPLAN: -> PLAN(sl)
- xATCON: -> ATCON(sl)
}


= BID(sl)

//intro text

{dejavu > 2: Also, you weirdly hear a faint meowing from somewhere, despite there being no cats around that you can see.}

//choice text

-> goto_l(sl)

= PLAN(sl)
 
 -> goto_l(sl)
 
= ATCON(sl)

-> goto_l(sl)



== iirtc_5901(sl) ==
 //'Scithers' Award balloting and too much money and expectations
= TRAMPOLINE(sl)

{phase:
- xBID: -> BID(sl)
- xPLAN: -> PLAN(sl)
- xATCON: -> ATCON(sl)
}



= BID(sl)

//intro text

{dejavu > 2: Also, you weirdly hear a faint jingling from somewhere, like {period > c1990s: old-fashioned} coins dropping onto a hard surface.}

//decision text

-> goto_l(sl)

= PLAN(sl)
 
 -> goto_l(sl)
 
= ATCON(sl)

-> goto_l(sl)

== iirtc_801(sl) ==
// Progress Report management
= TRAMPOLINE(sl)

{phase:
- xBID: -> BID(sl)
- xPLAN: -> PLAN(sl)
- xATCON: -> ATCON(sl)
}



= BID(sl)

//There is no BID phase item for this one, so we *only* get the dejavu text here

{dejavu > 2: You have a brief moment where you worry about how the Progress Reports will work, once we win the Bid. Then you decide you're getting ahead of yourself.}

-> goto_l(sl)

= PLAN(sl)
 
 -> goto_l(sl)
 
= ATCON(sl)

-> goto_l(sl)

== iirtc_2001(sl) == 
//the big media premiere
= TRAMPOLINE(sl)

{phase:
- xBID: -> BID(sl)
- xPLAN: -> PLAN(sl)
- xATCON: -> ATCON(sl)
}


= BID(sl)

//there is no BID phase item for this one, so we only get the dejavu text

{dejavu > 2: You have a brief premonition that you should prepare in case a <i>really big</i> {period > c2020s: sense-exp | movie } studio decides to get involved; but you have no idea why you'd expect that...}

-> goto_l(sl)

= PLAN(sl)
 
 -> goto_l(sl)
 
= ATCON(sl)

-> goto_l(sl)

//****************************************************************************************************************META

== dejavu_track ==

//freaky conversation 1

-> END


//****************************************************************************************************************ENDINGS
    
== Ring_Off ==

Finally, the infernal ringing stops, and you return to sleep.

    -> END


== Epilogue ==

The Con is over, your score is: 

SCORE

-> BEGIN 



== refused_the_call ==

"Oh, sorry, Fran. I thought this would be a good thing for you, but if you're not interested, I'm sure the committee can manage by itself."

+ [Time Passes] 

Despite their disappointment, your friend continues to give you updates on how the Con bid is going. There's some kind of ruckus about a catering contract offending some astronomy nerds, and it sounds like the special exhibitions aren't getting a lot of visibility, but somehow the bid is successful.

-

+ [Time Passes]

As the Con approaches, media interest builds. With only amateur experience in {social_media(period)}, the controversy about catering continues to dominate the conversation, even spilling into less specialist channels. 

By the time the Con starts, a large fraction of fans have decided to boycott the whole event on the basis of ridiculous half-truths inflated by uncontrolled speculation. Others complain that they were unaware of a number of special guests that they are now missing an opportunity to meet...

Things only get better, as an increasingly morose friend vents to you during the Con that every single issue that has come up has been fumbled in communication, and now people are demanding refunds.

You wonder if things would have been better if you had said «yes».
    ~ dejavu += 1

 -> BEGIN 


    
