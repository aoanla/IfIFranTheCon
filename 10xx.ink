
== iirtc_1001(sl) ==
// The Gaming Room - 
// - Fran's interaction here is counter-socials against the evil ~~H*sbr*~~ I mean Era Games.

LIST 10xx_result = 10UNDEF, 10NOTOURN, 10REDUCEDTOURN, 10FULLTOURN
VAR 10xx_state = 10UNDEF
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

The games room rep is insistent that they didn't agree to this: Era proposed that they would run the game room for the Con a few weeks previously, but the Committee hadn't gotten around to replying yet. 
On being asked, Era claim that this was a "misunderstanding" but they've already taken money from some competitors and the PR campaign has already been planned and paid for. "All" Era want is to monopolise the games room for every afternoon of the Con, which the Committee rejected out of hand.
    Unfortunately, Era is also right that they've already created an expectation that the tournament will happen. This is clearly an attempt to strongarm the Committee into making a decision via popular acclaim.

That <i>also</i> makes it your job to fix this. Lucky you, {fran(period)}.

//The scenario in IIRTC focuses on managing what we offer Era. In *this* version, the Committee will make some decisions and Fran needs to finesse the socials to make this happen and manage fallout.
+ Aggressively run a campaign blaming Era for trying to manipulate the Con 
  -> blame ->
+ Attempt to take control of the narrative by rebranding this as a WorldCon tournament with reduced hours
  -> rebrand -> 

 - 
 -> goto_l(sl)
 
 //this is v high risk but with enough experience and understanding of fandom...
 = blame
 ~ temp roll = RANDOM(-2,3) + LIST_VALUE(experience) + LIST_VALUE(fandom)
 {
    - roll < 4: 
        It's a big mistake to go in swinging against a cultural giant, especially when they have a head start on you. The gamers immediately see your complaints as a disingenous attempt to back out of an agreement that they assume you already made, and quickly get up in arms. 
        In order to manage things, the Committee is forced to capitulate to Era's original demands - <i>and</i> make you issue a full apology as well!
        ~ frustration += 1
        ~ conscore -= 2
        ~ 10xx_state = 10FULLTOURN
    - roll < 6:
    //intermediate state - bad for everyone including Era
        ~ conscore -= 1
        ~ 10xx_state = 10REDUCEDTOURN
    - else: 
        Surprisingly, for such a large company, Era's PR team are apparently completely blind to how they're perceived by the indie gaming community - as the elephant in the room, threatening to crush everyone else or claim the entire hobby as their own. With some careful messaging, you're able to construct a backlash against Era, reminding everyone of previous incidents in their past and making out MetaCon as a helpless victim. 
        Certainly, this doesn't work with everyone - there's a lot of casual gamers who really only know Era - but you get enough momentum to force Era to reconsider entirely. As a bonus, the Con itself gets a lot of goodwill as the underdog, and a surge of signups from indie gaming groups wanting to support the event!
        ~ frustration -= 1
        ~ conscore += 2
        ~ 10xx_state = 10NOTOURN
 }
 ->->
 
 //rebranding can't ever get 10NOTOURN, but you can force Era to agree to reduced tournament terms by out PRing them.
 = rebrand
 ~ temp roll = RANDOM(-2,3) + LIST_VALUE(experience) + LIST_VALUE(fandom) 
 { 
    - roll < 4:
        bad
        ~ 10xx_state = 10FULLTOURN
    - else:
        good
        ~ 10xx_state = 10REDUCEDTOURN
 }
 
 ->->
 
 
= ATCON(sl)

//result depends on 10xxx_state

{ 10xx_state:
 - 10NOTOURN:
    //no tournament
    There's 
 - 10REDUCEDTOURN:
 
 - 10FULLTOURN:
 
 }

-> goto_l(sl)
