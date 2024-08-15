


LIST Numbers = one, two, three, four, five
LIST TimePeriod = undeterminate, c1990s, c2020s, c2050s
LIST Skills = undeterminate, weak, average, extensive
VAR period = TimePeriod.undeterminate
//Fran Stats
VAR frustration = 0
VAR fandom = Skills.undeterminate 
VAR experience = Skills.undeterminate
//Mysterious reality breaking newgame+, ++ counter leading to the Eternal Franpion
VAR dejavu = 0

-> BEGIN


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

== function weak_exp(p) ==
    {p:
    - TimePeriod.undeterminate: «I'm sorry, I really don't have the time for this»
    - c1990s: «I'm sorry, I really don't have the time for this»
    - c2020s: «I'm sorry, I really don't have the time for this»
    - c2050s: «I'm sorry, I really don't have the time for this»
    }
    
== function average_exp(p) ==
    {p:
    - TimePeriod.undeterminate: «I'm sorry, I really don't have the time for this»
    - c1990s: «I'm sorry, I really don't have the time for this»
    - c2020s: «I'm sorry, I really don't have the time for this»
    - c2050s: «I'm sorry, I really don't have the time for this»
    }
    
== function extensive_exp(p) ==
    {p:
    - TimePeriod.undeterminate: «I'm sorry, I really don't have the time for this»
    - c1990s: «I'm sorry, I really don't have the time for this»
    - c2020s: «I'm sorry, I really don't have the time for this»
    - c2050s: «I'm sorry, I really don't have the time for this»
    }

== BEGIN == 

~ period = TimePeriod.undeterminate
~ frustration = 0
~ fandom = Skills.undeterminate 
~ experience = Skills.undeterminate

<b>If I Fran The Con</b>

A loud ringing sound permeates the perfect silence, penetrating into the comforting warmth of sleep.

- (sleep) 

 + [Answer It]
 + [Ignore It and Try to Get to Sleep]
    ~ frustration += 1
    {sleep < 3: -> sleep | -> Ring_Off }
    
= call

Giving up your attempt to ignore the distraction, you:

{dejavu:  *\ {dejavu: 
        - 1: have a strange feeling you've been here before
        - other: somehow know this is about MetaCon 
        }
    ~ dejavu += 1
    -> call 
    }
+ lean over and pick up the receiver from the telephone on the sideboard
   ~ period = c1990s
+ grab your cellphone from the sideboard, and thumb "accept"
   ~ period = c2020s
+ open a NeuroWeb port to the incoming request
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

+ [just that {weak_SF(period)}] <i>weak</i>
 ~ fandom = weak
+ [a healthy appreciation of {average_SF(period)}] <i>healthy</i> 
 ~ fandom = average
+ [extensive - you can name every {obsessive_SF(period)}] <i>extensive</i>
 ~ fandom = extensive
 
 -
 
 The {voice(period)} continues.
 "Well, in any case, the committee wanted to get the word out on {social_media(period)} and so they're looking for an expert.
 "I remembered that you'd been building a following, so I suggested your name and the committee jumped at the chance to get someone with your experience.
 "(I may have laid it on a little thick, but what are friends for?)"
 
 + [Protest that you only have a little experience] {weak_exp(period)}
  ~ experience = weak
 + [Agree to do your best with your developing contacts list] {average_exp(period)}
  ~ experience = average
 + [Confidently assert that this is well within your skill set] {extensive_exp(period)}
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
 
 - (iirtc_5101_node)
 
 

-> END

== iirtc_5101
//Fran Frasier versus WAMO

= BID

//I think these should be like yields - each scenario yields to a random remaining one at the end of each stage
//and the last one yields to a random new one to start going through the next stage
-> END

= PLAN
 
 -> END
 
= ATCON

-> END
    
== iirtc_5201 ==
//NASA publicity


-> END


== iirtc_901 ==
 //GoH publicity

-> END


== iirtc_5901 ==
 //'Scithers' Award balloting and too much money and expectations

-> END

== iirtc_801 ==
// Progress Report management

-> END

== iirtc_2001 == 
//the big media premiere

-> END

//****************************************************************************************************************META

== dejavu_track ==

//freaky conversation 1

-> END


//****************************************************************************************************************ENDINGS
    
== Ring_Off ==

Finally, the infernal ringing stops, and you return to sleep.

    -> END





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

 -> BEGIN