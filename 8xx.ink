
== iirtc_801(sl) ==
// Progress Report management
//TRAMPOLINE(sl)

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
