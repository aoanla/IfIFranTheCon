

//a trigger test for if Fran is fired
== fran_fired ==
{frustration > threshold: ->-> FIRED}
->->



//this and goto implement the core trampoline/dispatch system 
//to allow "scenario knots" to fire sequentially [along with the trampolines in each scenario
// which should probably be constructed as an included thread for each]
== goto_l(sl)
//should have the "Fran Fired" check here before we go elsewhere
-> fran_fired -> 
{ LIST_COUNT(sl):
    - 0: -> TRAMPOLINE.dispatch
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
    
    
//"have we seen this knot on this iteration of the loop"
// - replaces just testing {knot} if we want the option to be available in future loops but only once per loop
== function SEENLOOP(knot)

~ return TURNS_SINCE(-> BEGIN) > TURNS_SINCE(knot)


//Fran's name
== function fran(p) ==
{ p:
- TimePeriod.undeterminate: Fr'n
    - c1990s: Fran
    - c2020s: Fran
    - c2050s: FR4N
    }

//Fran's full name
== function franfrasier(p) ==
{ p:
- TimePeriod.undeterminate: Fr'n Fr'zz'r
    - c1990s: Fran Frasier
    - c2020s: Fran Frasier
    - c2050s: FR4N-F745137
}


//the MetaCon version
== function WC(p) ==
    { p:  
    - TimePeriod.undeterminate: 0
    - c1990s: 53
    - c2020s: 82
    - c2050s: 111
    }

//how does the average person get instant communication    
== function phonecall(p) == 
{ p:
    - TimePeriod.undeterminate: astral sending
    - c1990s: phone call
    - c2020s: text
    - c2050s: sim-stream
}

//a laughable "rights" org for people with privilege already
== function mensrights(p) == 
{ p:
    - TimePeriod.undeterminate: elf justice
    - c1990s: traditional marriage
    - c2020s: mens' rights
    - c2050s: physical sapients
}    

//a touchstone for someone vaguely interested in SF&F    
== function weak_SF(p) ==
    {p: 
    - TimePeriod.undeterminate: a strange blank #TODO
    - c1990s: you thought Winona Ryder and Keanu Reeves were hot in Dracula
    - c2020s: you saw some of the Marvel movies
    - c2050s: you simmed a movie about a world with frozen water at the poles once
    }
    
//a touchstone for someone averagely SF&F fannish    
    == function average_SF(p) ==
    {p: 
    - TimePeriod.undeterminate: eldritch cubehedrons
    - c1990s: Doctor Who
    - c2020s: Doctor Who
    - c2050s: Doctor Who
    }

//a touchstone for someone deeply SF&Fish
== function obsessive_SF(p) ==
    {p: 
    - TimePeriod.undeterminate: floople in the dread dimensions
    - c1990s: character in #TODO
    - c2020s: in-joke in Lower Decks, citing series and episode.
    - c2050s: episode in the complete run of One Piece
    }

//the format of the communication via phonecall
== function voice(p) ==
    {p: 
    - TimePeriod.undeterminate: emanation
    - c1990s: voice 
    - c2020s: tone
    - c2050s: impression-stream
    }

//    
== function speak(p) ==
    {p: 
    - TimePeriod.undeterminate: mind-speak
    - c1990s: talk 
    - c2020s: talk
    - c2050s: link
    }

//what is the electronic medium for social interaction    
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
    - c2020s: the \#GreenMoon hashtag
    - c2050s: \#\#MuskWorldLiberation
    }
    
    
== function tabletop(p) ==
    {p:
    - TimePeriod.undeterminate: card #TODO
    - c1990s: tabletop
    - c2020s: tabletop
    - c2050s: VR
    }

== function ccg(p) ==
    {p:
    - TimePeriod.undeterminate: kenning challenge #TODO
    - c1990s: tabletop tactics game
    - c2020s: collectable card game
    - c2050s: hyper-net battler
    }
    
    
== function ccgprize(p) ==
    {p:
    - TimePeriod.undeterminate: a hundred mortal souls #TODO
    - c1990s: £10k
    - c2020s: £100k
    - c2050s: €1m
    }