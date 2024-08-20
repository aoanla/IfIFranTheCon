
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

//bid intro - works differently depending on if we're already being aggressive

{ SEENLOOP(iirtc_5101.aggressive):
    Maybe it's revenge against the Con for your own stirring previously, but you're starting to notice rumours about the "dangerous crime" in Lanark turning up in various places on {social_media(period)}.
}
{not SEENLOOP(iirtc_5101.aggressive):
    Just because you're going High, this doesn't seem to be stopping the rival Cons going Low. You've noticed rumours about the "dangerous crime" in Lanark turning up in various places on {social_media(period)}.
}

//test experience for how much we learn about the source

{dejavu > 2: .}

-> goto_l(sl)

= PLAN(sl)
 
 //PLAN phase is just resolutions here, all the meat is in BID
 
 -> goto_l(sl)
 
= ATCON(sl)

//there is no ATCON phase for this scenario...

-> goto_l(sl)
