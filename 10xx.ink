
== iirtc_1001(sl) ==
// The Gaming Room - 
// - Fran's interaction here is counter-socials against the evil ~~H*sbr*~~ I mean Era Games.
//TRAMPOLINE(sl)

{phase:
- xBID: -> BID(sl)
- xPLAN: -> PLAN(sl)
- xATCON: -> ATCON(sl)
}



= BID(sl)

//There is no BID phase item for this one, so we *only* get the dejavu text here

{dejavu > 2: You have a brief moment where you worry about what would happen if a big games company tried to buy the Con. Then you dismiss it as unlikely, who'd let something like that happen?}

-> goto_l(sl)

= PLAN(sl)

//We're going to go with the scenario where Era Games has run ads before confirming with the Committee.

At the last Committee meeting, the games room organisers were in a panic. It seems that Era Games - publishers of a range of {tabletop(period)} games and, by acquisition, owners of the world's largest RPG system, Wilderness & Wyverns - have been advertising that MetaCon {WC(period)} will be the host of a tournament for their latest {ccg(period)}, with a prize of {ccgprize(period)}!

The games room rep is insistent that they didn't agree to this: Era proposed that they would run the game room for the Con a few weeks previously, but the Committee hadn't gotten around to replying yet. This is clearly an attempt to strongarm the Committee into making a decision via popular acclaim.

That <i>also</i> makes it your job to fix this. Lucky you, {fran(period)}.

//The scenario in IIRTC focuses on managing what we offer Era. In *this* version, the Committee will make some decisions and Fran needs to finesse the socials to make this happen and manage fallout.

 
 -> goto_l(sl)
 
= ATCON(sl)

-> goto_l(sl)
