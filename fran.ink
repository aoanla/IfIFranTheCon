


LIST Numbers = one, two, three, four, five
LIST TimePeriod = undeterminate, c1990s, c2020s, c2050s
LIST Skills = undeterminate, weak, average, extensive
LIST Scenarios = S_5101, S_5201, S_901, S_5901, S_801, S_2001
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
- S_901:  -> iirtc_901(sl)
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
 + [Refuse the Offer] «I'm sorry, I really don't have the time for this»
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

We are in bid 5101

-> goto_l(sl)

= PLAN(sl)
 
 -> goto_l(sl)
 
= ATCON(sl)

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

We are in bid 5201

-> goto_l(sl)

= PLAN(sl)
 
 -> goto_l(sl)
 
= ATCON(sl)

-> goto_l(sl)



== iirtc_901(sl) ==
 //GoH publicity
= TRAMPOLINE(sl)

{phase:
- xBID: -> BID(sl)
- xPLAN: -> PLAN(sl)
- xATCON: -> ATCON(sl)
}



= BID(sl)

We are in bid 901

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

We are in bid 5901

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

We are in bid 801

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

We are in bid 2001

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


    
