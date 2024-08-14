


LIST Numbers = one, two, three, four, five
LIST TimePeriod = undeterminate, c1990s, c2020s, c2050s
LIST Fandom = undeterminate, weak, average, obsessive
VAR period = TimePeriod.undeterminate
VAR frustration = 0
VAR fandom = Fandom.undeterminate 

-> BEGIN


== function WC(p) ==
    { p:  
    - TimePeriod.undeterminate: 0
    - c1990s: 53
    - c2020s: 82
    - c2050s: 110
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


== BEGIN == 

<b>If I Fran The Con</b>

A loud ringing sound permeates the perfect silence, penetrating into the comforting warmth of sleep.

 * Answer It
    -> Period
 * Ignore It and Try to Get to Sleep
    -> Sleep
    
== Sleep ==

The ringing sound continues, drilling deeper into the soft shell protecting you from the world outside. 

 + Answer It
    -> Period
 +  Ignore It and Try to Get to Sleep
   { Sleep < 3:  -> SleepWorkAround | -> Ring_Off }

== SleepWorkAround ==

//We need this because Ink is v silly and doesn't count "self-links" as incrementing the visit count
~ frustration += 1
-> Sleep
    
== Ring_Off ==

Finally, the infernal ringing stops, and you return to sleep.

    -> END
    
== Period ==

Giving up your attempt to ignore the distraction, you:

+ lean over and pick up the receiver from the telephone on the sideboard
   ~ period = c1990s
   -> HIRED
+ grab your cellphone from the sideboard, and thumb "accept"
   ~ period = c2020s
   -> HIRED
+ open a FediNet port to the incoming request
   ~ period = c2050s
   -> HIRED


== HIRED ==


The {voice(period)} on the end of the line is {frustration > 1: excited| frustrated}.
"Fran," it begins, "I'm glad you {frustration > 0: finally} answered, there's a fantastic opportunity coming up!
"You know I've been invited onto the bid committee for WorldCon {WC(period)}?"

You do - they've not stopped going on about it since they got the position of "Ribbon Planner" on the committee, which they claim is a vital component of a successful event.
As for you, your connection with SF&F is:

+ [just that {weak_SF(period)}] <i>weak</i>
 ~ fandom = weak
  -> HIRED2
+ [a healthy appreciation of {average_SF(period)}] <i>healthy</i> 
 ~ fandom = average
 -> HIRED2
+ [extensive - you can name every {obsessive_SF(period)}] <i>extensive</i>
 ~ fandom = obsessive
 -> HIRED2 
 
 
 == HIRED2 ==
 
 The {voice(period)} continues.
 "Well, in any case, the committee wanted to get the word out on {social_media(period)} and so they're looking for an expert.
 "I remembered that you'd been building a following, so I suggested your name and the committee jumped at the chance to get someone with your experience.
 "(I may have laid it on a little thick, but what are friends for?)"
 
 
 

    -> END
