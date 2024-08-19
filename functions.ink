
== fran_fired ==
{frustration > threshold: ->-> FIRED}
->->


== goto_l(sl)
//should have the "Fran Fired" check here before we go elsewhere
-> fran_fired -> 
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
    

//I don't need this yet
== function dejaRAND(l) ==
//where l is a list of 7 items (1-6 for die, plus 7 for dejavu
    ~ temp dieroll = LIST_RANDOM(l)
    {  LIST_VALUE(dieroll) <= dejavu: 
        ~ dieroll = LIST_MIN(l)
    }
    ~ return dieroll
    
== function SEENLOOP(knot)

~ return TURNS_SINCE(-> BEGIN) > TURNS_SINCE(knot)



== function WC(p) ==
    { p:  
    - TimePeriod.undeterminate: 0
    - c1990s: 53
    - c2020s: 82
    - c2050s: 111
    }
    
== function phonecall(p) == 
{ p:
    - TimePeriod.undeterminate: astral sending
    - c1990s: phone call
    - c2020s: text
    - c2050s: sim-stream
}

== function mensrights(p) == 
{ p:
    - TimePeriod.undeterminate: elf justice
    - c1990s: traditional marriage
    - c2020s: mens' rights
    - c2050s: physical sapients
}    
    
== function weak_SF(p) ==
    {p: 
    - TimePeriod.undeterminate: a strange blank #TODO
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
    - c1990s: character in #TODO
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
    
== function speak(p) ==
    {p: 
    - TimePeriod.undeterminate: mind-speak
    - c1990s: talk 
    - c2020s: talk
    - c2050s: link
    }
    
== function social_media(p) ==
    {p:
    - TimePeriod.undeterminate: palantir
    - c1990s: UseNet
    - c2020s: socials
    - c2050s: HyperX
    }

//TODO
== function weak_exp(p) ==
    {p:
    - TimePeriod.undeterminate: «I'm sorry, I really don't have the time for this»
    - c1990s: «I guess I've posted on UseNet before... I can have a go»
    - c2020s: «» #TODO
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
    - TimePeriod.undeterminate: «Hastur subscribes to my newsletter, I can handle this»
    - c1990s: «I run my own IRC server and webmistress a webring, this won't be a problem»
    - c2020s: «I've even got my own OnlyFrans (it's doing very well thank you), getting the word out on this will be a peace of cake, if I have the time»
    - c2050s: «They're even following my sense-casts on the Musksphere, handling this will be easy»
    }

== function WAMOloc(p) == 
    {p:
    - TimePeriod.undeterminate: something eldritch #TODO
    - c1990s: alt.space.moon.colony
    - c2020s: \#GreenMoon
    - c2050s: \#\#MuskWorldLiberation
    }
