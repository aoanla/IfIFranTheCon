
// Note, the scenarios in the Discord game were 51xx obviously, 4xx, 10xx, 1xx, 54xx, 30xx, 24xx, 41xx, 16xx
// At the moment, I've taken different scenarios from IIRTC that seemed to be social mediay
// but I might still switch to using a subset from the Discord instead (obviously, 51xx first still!)
// In particular, I think 16xx is quite applicable...

LIST Numbers = one, two, three, four, five
LIST TimePeriod = undeterminate = 1 , c1990s, c2020s, c2050s
LIST Skills = undeterminate = 1 , weak, average, extensive
LIST Scenarios = S_5101, S_5201, S_5901, S_801, S_2001
LIST Phase = none, xBID, xPLAN, xATCON
VAR period = TimePeriod.undeterminate
VAR threshold = 0
//Fran Stats
VAR frustration = 0
VAR fandom = Skills.undeterminate 
VAR experience = Skills.undeterminate
VAR energy = 10
//Mysterious reality breaking newgame+, ++ counter leading to the Eternal Franpion
VAR dejavu = 0
VAR callcnt = 0
VAR phase = none
//Con stats
VAR conscore = 10
VAR sleep_v = 0


-> PRELUDE


INCLUDE functions.ink
INCLUDE 51xx.ink
INCLUDE 52xx.ink
INCLUDE 59xx.ink
INCLUDE 8xx.ink
INCLUDE 20xx.ink
INCLUDE 10xx.ink
INCLUDE 14xx.ink


== PRELUDE

<b>If I Fran The Con</b>
<i>by Sam Skipsey, a f<s>r</s>angame for If I Ran the <s>Zoo</s>... Con, inspired by John Coxon's game for the WorldCon 82 / Glasgow 24 Discord, and written in Ink</i>

&nbsp;
<hr/>

-> BEGIN


== BEGIN == 

~ period = TimePeriod.undeterminate
~ frustration = 0
~ fandom = Skills.undeterminate 
~ experience = Skills.undeterminate
~ phase = none
~ threshold = 0
~ energy = 5 //some starting energy, which you can increase with sleep
~ sleep_v = 0


A loud ringing sound permeates the perfect silence, penetrating into the comforting warmth of sleep.
~ callcnt = 0

- (sleep) 

 + [Answer It]
  -> call
 + [Ignore It and Try to Get to Sleep]
    ~ frustration += 1
    ~ sleep_v += 1
    ~ energy += 1
    {sleep_v < 3: -> sleep | -> Ring_Off }
    
= call


Giving up your attempt to ignore the distraction, you <>

- (callpoint)

+ {dejavu} { not callcnt } \ <i>{dejavu == 1: have a strange feeling you've been here before, but... | somehow know this is about MetaCon, and... }</i>
    ~ dejavu += 1
    ~ callcnt += 1
    -> callpoint 
+ <i>lean over and pick up the receiver from the telephone on the sideboard</i>
   ~ period = c1990s
+ <i>grab your cellphone from the sideboard, and thumb "accept"</i>
   ~ period = c2020s
+ <i>open a NeuroWeb port to the incoming request</i>
   ~ period = c2050s

-

The {voice(period)} on the end of the line is {frustration > 1: excited| frustrated}.
"{fran(period)}," it begins, "I'm glad you {frustration > 0: finally} answered, there's a fantastic opportunity coming up! {dejavu > 1:"}

    + {dejavu > 1}  «This is about MetaCon, isn't it?»
        -> dejavu_track -> cont
    + [Let Them Continue]
        -> cont
    

-> cont

= cont

"You know I've been invited onto the bid committee for MetaCon {WC(period)}?"

You do - they've not stopped going on about it since they got the position of "Ribbon Planner" on the committee, which they claim is a vital component of a successful event.
As for you, your connection with SF&F is:

+ [just that {weak_SF(period)}] <i>weak</i>
 ~ fandom = weak
+ [a healthy appreciation of {average_SF(period)}] <i>healthy</i> 
 ~ fandom = average
+ [extensive - you can name every {obsessive_SF(period)}] <i>extensive</i>
 ~ fandom = extensive
 
 -
 
 The {voice(period)} continues.
 "Well, in any case, the committee wanted to get the word out on {social_media(period)} and so they're looking for an expert.
 "I remembered that you'd been building a following, so I suggested your name and the committee jumped at the chance to get someone with your experience.
 "(I may have laid it on a little thick, but what are friends for?)"
 
 + [Protest that you only have a little experience] {weak_exp(period)}
  ~ experience = weak
 + [Agree to do your best with your developing contacts list] {average_exp(period)}
  ~ experience = average
 + [Confidently assert that this is well within your skill set] {extensive_exp(period)}
  ~ experience = extensive 
 + [Refuse the Offer] «I'm sorry, I really don't have the time for this»
    -> refused_the_call
  
 - 
 
 "{fran(period)}, <>{experience: 
 - weak: I know you don't think you're up for this, but think of this as a trial of fire
 - average: I'm glad you said yes - and hopefully it'll be good for your CV too!
 - extensive: I know, I know we're lucky to have you, seriously :p 
 } 
 "Anyway, I think we should start right away... here's some basic facts about our bid
 "... and our opponents. 
 "Can you try to create some buzz for us to maximise our visibility?"

-> TRAMPOLINE

== TRAMPOLINE
 ~ phase = xBID
 ~ threshold += 3
 
 
 //select the set of scenarios for this time
 ~ Scenarios = ()
 ~ Scenarios +=  LIST_RANDOM(LIST_ALL(Scenarios) - S_5101 - Scenarios)
 ~ Scenarios +=  LIST_RANDOM(LIST_ALL(Scenarios) - S_5101 - Scenarios)
 
 //{Scenarios}
  
 -> goto(S_5101, Scenarios) 
 
 //and jump to first one, which will be 5101
 = dispatch 
 
 { phase:
 //we finished last phase
 - xATCON: -> Epilogue
 - else: 
         ~ phase++
         ~ threshold = 3*threshold //it's harder to fire a post the later it gets
         ~ energy += 3 //replenish energy
         -> goto(S_5101, Scenarios) 
 }


//****************************************************************************************************************META

== dejavu_track ==

//freaky conversation 1, for initial call
The {voice(period)} seems a little flustered.
"Um, how did you guess? Have I been talking about it too much already?"

+ [Lean into their fluster]«You <i>have</i> been going on about it every time we {speak(period)}...»
    ~ frustration += 1 //being called out is *always annoying
    "Oh, have I? Well, it <i>is</i> a big part of my life at the moment, given how much of an opportunity it is!"
+ [Minimise]«Oh, nothing, just a random guess!»
    "Huh, okay...
+ [Admit to Deja Vu]«Actually, I had a weird feeling just before that I've had this conversation before...»
    {frustration: 
        ~frustration += 1
    }  //makes you sound like a weirdo if already slightly annoying
    ~ dejavu += 1 //opens you to weirdness in turn
    A note of concern seeps in.
    "Hmm, have you been getting enough sleep?
- 

"Anyway...

->->


//****************************************************************************************************************ENDINGS
    
== Ring_Off ==

Finally, the infernal ringing stops, and you return to sleep.

    -> END

== FIRED ==

Your friend on the Con contacts you to pass on the bad news: despite all the work you've put in, the Committee feels that you've been more bad than good, and they're going to have to let you go.

~ dejavu += 1

-> BEGIN



== Epilogue ==

The Con is over, your score is: 

//todo - three or so options here based on conscore range?
{conscore}

~ dejavu += 1

-> BEGIN 



== refused_the_call ==

"Oh, sorry, {fran(period)}. I thought this would be a good thing for you, but if you're not interested, I'm sure the committee can manage by itself."
The voice hangs up.

+ [Time Passes] 

Despite their disappointment, your friend continues to give you updates on how the Con bid is going. There's some kind of ruckus about a catering contract offending some astronomy nerds, and it sounds like the special exhibitions aren't getting a lot of visibility, but somehow the bid is successful.

-

+ [Time Passes]

As the Con approaches, media interest builds. With only amateur experience in {social_media(period)}, the controversy about catering continues to dominate the conversation, even spilling into less specialist channels. 

By the time the Con starts, a large fraction of fans have decided to boycott the whole event on the basis of ridiculous half-truths inflated by uncontrolled speculation. Others complain that they were unaware of a number of special guests that they are now missing an opportunity to meet...

Things only get better, as an increasingly morose friend vents to you during the Con that every single issue that has come up has been fumbled in communication, and now people are demanding refunds.

You wonder if things would have been better if you had said «yes».
    ~ dejavu += 1

 -> BEGIN 


    
