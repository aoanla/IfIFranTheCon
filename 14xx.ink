
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
The perpetrator has tried to cover their tracks via sockpuppets and rumourmongering offline. 
{ experience:
  - extensive:
    They're <i>good</i> but you're <i>better</i> - the timings of the initial posts, and some digging with your contacts, makes it pretty clear it's the {social_media(period)} team for the Hillwood bid. Apparently they don't want to settle for just hosting NASFIC in 2 years, and are prepared to play dirty! 
        //Hillwood is from Hey Arnold! and is a Seattle stand-in
  - average:
    They're <i>good</i>, and you can't get anything concrete on them. However, it seems most likely that it's one of the NA con bids, given the spellings and grammar.
  - else: 
    They're really really good, and you have no firm idea of who's the source. 
}

{dejavu > 2: .}

The Committee is pretty concerned about the negative effect this is already having on the bid's image. People are already asking about "safe areas" of Lanark, and even some of the Committee's close contacts seem to be getting a bit antsy. 
It's up to you to sort this out.

Do you:


//allow *both* positive options here if you have enough energy
* [Say Nothing]You decide that the last thing this needs is the legitimacy of an official response. //need to note if we also said nothing in 51xx
    Blah
* [Attack the Rumour Mongers Directly]x
    ~ energy -= 1 
* [Address the Content of the Rumours]y
    ~ energy -= 1 
    
-

-> goto_l(sl)

= PLAN(sl)
 
 //PLAN phase is just resolutions here, all the meat is in BID
 
 -> goto_l(sl)
 
= ATCON(sl)

//there is no ATCON phase for this scenario...

-> goto_l(sl)
