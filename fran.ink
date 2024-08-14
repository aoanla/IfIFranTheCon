


LIST Numbers = one, two, three, four, five
LIST TimePeriod = undeterminate, c1990s, c2020s, c2050s
VAR period = undeterminate
VAR frustration = 0

-> BEGIN


== function WC(p) ==
    { 
    - p == undeterminate:
        ~ return "0"
    - p == c1990s:
        ~ return "53"
    - p == c2020s:
        ~ return "82"
    - p == c2050s:
        ~ return "110"
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


The { period == c2050s: impression-stream | voice} on the end of the line is {frustration > 1: excited| frustrated}.
"Fran," it begins, "I'm glad you {frustration > 0: finally} answered, there's a fantastic opportunity coming up!
"You know I've been invited onto the bid committee for WorldCon {WC(period)}?"


    -> END
