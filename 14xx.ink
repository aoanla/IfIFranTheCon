
== iirtc_1401(sl) ==
// Crime on the Streets
// dealing partly with negative social media from another bid!
//TRAMPOLINE(sl)

{phase:
- xBID: -> BID(sl)
- xPLAN: -> PLAN(sl)
- xATCON: -> ATCON(sl)
}



= BID(sl)

//bid intro

{dejavu > 2: .}

-> goto_l(sl)

= PLAN(sl)
 
 //PLAN phase is just resolutions here, all the meat is in BID
 
 -> goto_l(sl)
 
= ATCON(sl)

//there is no ATCON phase for this scenario...

-> goto_l(sl)
