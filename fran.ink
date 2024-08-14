LIST Numbers = one, two, three, four, five

<b>If I Fran The Con</b>

You wake up to your cellphone buzzing at you incessantly from the sideboard across from you.

 * Answer It
    -> Hired
 * Turn Over and Try to Get to Sleep
    -> Sleep
    
== Sleep ==

The cellphone keeps buzzing. 

 + Answer It
    -> Hired
 + {Sleep < 3} Turn Over and Try to Get to Sleep
    -> SleepWorkAround
 + {Sleep == 3} Turn Over and Try to Get to Sleep
    -> Ring_Off

== SleepWorkAround ==

//We need this because Ink is v silly and doesn't count "self-links" as incrementing the visit count

-> Sleep
    
== Ring_Off ==

Finally, whoever is on the other end of the phone gives up, and blessed silence returns.

    -> END
    
== Hired ==

The voice on the end of the line is {Sleep < 2: excited| frustrated}.

    -> END
