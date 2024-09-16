
//Code and sprite stolen from Occult, all credit for it to anconfuzedrock
/obj/item/clothing/head/fishing
	name = "fishing hat"
	desc = "It's a peaked cap with a quirky slogan."
	icon_state = "greensoft0"
	siemens_coefficient = 0.9
	var/slogan = ""
	var/hatsize = 0
	var/colourtype

/obj/item/clothing/head/fishing/red
	name = "red fishing hat"
	colourtype = "red"

/obj/item/clothing/head/fishing/green
	name = "green fishing hat"
	colourtype = "green"

/obj/item/clothing/head/fishing/blue
	name = "blue fishing hat"
	colourtype = "blue"

/obj/item/clothing/head/fishing/orange
	name = "orange fishing hat"
	colourtype = "blue"

/obj/item/clothing/head/fishing/grey
	name = "grey fishing hat"
	colourtype = "grey"

/obj/item/clothing/head/fishing/purple
	name = "purple fishing hat"
	colourtype = "purple"

/obj/item/clothing/head/fishing/yellow
	name = "yellow fishing hat"
	colourtype = "yellow"

/obj/item/clothing/head/fishing/navy
	name = "navy fishing hat"
	colourtype = "navy"

/obj/item/clothing/head/fishing/black
	name = "black fishing hat"
	colourtype = "black"

/obj/item/clothing/head/fishing/Initialize()
	//short phrases that women and fish may have about you
	var/feelings = list("love me",
						"fear me",
						"are wary of me",
						"are afraid of me",
						"despise me",
						"are ambivalent towards me",
						"don't care about me",
						"lust after me",
						"are down bad for me",
						"can't stand me",
						"want me",
						"desire me",
						"kiss me",
						"kill me",
						"avoid me",
						"have no words for me",
						"hate me",
						"make memes of me",
						"demoralise me",
						"perpetually mock me",
						"scare me",
						"issue restraining orders to me",
						"leave me",
						"took the kids from me",
						"demand satisfaction from me",
						"dropkick me",
						"suplex me",
						"worry about me",
						"gossip about me",
						"defame me",
						"disbelieve my existence",
						"conspire against me",
						"draw me as the soyjack",
						"draw me as the chad",
						"wreck me",
						"walk all over me",
						"lay eggs down my throat",
						"dream about me",
						"steal my lunch money",
						"contact me about my spaceship's extended warranty",
						"envy me",
						"combo me",
						"want to kidnap me",
						"fold me in half",
						"think my spacetruck is hot",
						"hate my spacetruck",
						"are more into my spacetruck than me",
						"ask me for docking codes",
						"crush soda cans on my forehead",
						"gun me down in the streets of miami",
						"drop me off of inconveniently high places",
						"leave threatening messages on my voicemail",
						"write fanfiction about me",
						"attempt to approach me"
						)
	//significantly more complex feelings that women and fish may have about you
	var/verylongfeelings = list("construct inferior defensive walls lacking additional fall back locations as they believe their initial defense shall be enough to withstand me",
							"insist upon forming an unsteady yet reliable alliance in which they teeter upon the dual edge of betrayal and ruination in the perpetual desire to bring ruin upon me",
							"construct elaborate fantasies about my graphic and harrowing death at the hands of a giant robot",
							"call it oven when you of in the cold food of out hot eat the food",
							"step on emp mines next to me so I have to go get my tablet and pda repaired and they charge me 1200 credits",
							"hunt me down and ambush me in my private restroom by bursting out of a vent before my trusty friend uses his thermal-vision to detect me in danger and fires penetrating rounds through the wall to scare them away",
							"misinterpret what I mean when I say I drink vinegar out of a shotglass and just chug the whole thing instead of taking a small sip, leaving them with an hour long coughing fit",
							"are hurled millennia into the future for their hubris but nonetheless attempt to enslave me from my abode deep within the earth",
							"make light of my attire while at the coffee shop, unaware that I am a powerful wizard with the means to cast forth the veil of ignorance from their eyes",
							"cower before my T-posing to assert dominance, except I don't know the difference between T-posing and A-posing (neither of which have anything to do with T&A, which is very confusing)",
							"use my power to create a new universe but destroy all life on earth in the process and are left alone to rebuild with nothing for company but me",
							"hold A to charge a buster shot only to get hit by my homing missiles, starting a juggle chain which results in losing all their health and having to restart from the last checkpoint",
							"attempt once more to best me and gain access to my keep of riches and treasure, but I put their foolish ambitions to rest with force",
							"bump into me in the supermarket and exchange an awkward hello, neither of us expecting to meet each other in this liminal environs and unsure how the context of our relationship can adapt to this happenstance congregation",
							"pursue me to the ends of the earth, constantly thwarted by inconsequential setbacks, and when they catch up and I ask in an exasperated voice why they respond 'you owe me a credit'",
							"call me just to 'chat' but actually mention they are moving and, obviously, since I'm the ONLY guy they know with a truck it would be great if I could help out, they said they'd buy me pizza but that doesn't really cover it",
							"shuffle uncomfortably as we continue to sit in near-total silence having exhausted all topics of conversation hours ago but neither of us having worked up the spirit to suggest that we part ways and go home",
							"promise me fast food but conveniently forget to pull into the drivethrough on the way home, leaving me burgerless",
							"leave me in the car all alone with my favorite music and a bottle of water in the summer",
							"create designs of particularly verbose hats describing extreme complexities and deep philosophical implications of their unusually specific feelings and often not particularly kind thoughts about me",
							"methodically place brick after agonising brick in the wall they are constructing to forever entomb me in the basement which they claimed contained a case of Amontillado wine"
						)

	//time to actually generate the slogan
	//80% chance of it just being a basic women/fish combo
	if(prob(80))
		slogan = "Women [pick(feelings)], Fish [pick(feelings)]"
	else //we generate something more complex
		if(prob(75)) //USUALLY one of the short simple phrases
			slogan = "Women [pick(feelings)]"
		else
			slogan = "Women [pick(verylongfeelings)]"
		//second line
		if(prob(75)) //USUALLY one of the short simple phrases
			slogan = "[slogan], Fish [pick(feelings)]"
		else
			slogan = "[slogan], Fish [pick(verylongfeelings)]"
		//chance of a third line
		if(prob(50))
			hatsize = 1
			if(prob(50)) //if a third line is rolled it's way more likely to be a long one
				slogan = "[slogan], [pick("Roaches", "Men")] [pick(feelings)]"
			else
				slogan = "[slogan], [pick("Roaches", "Men")] [pick(verylongfeelings)]"
			//you can even get a fourth
			if(prob(25))
				if(prob(25)) //if a fourth line is rolled it's way WAY more likely to be a long one
					slogan = "[slogan], [pick("Spiders", "Skrell", "Unathi", "Tajarans")] [pick(feelings)]"
				else
					slogan = "[slogan], [pick("Spiders", "Skrell", "Unathi", "Tajarans")] [pick(verylongfeelings)]"
	//now we have the slogan, apply this to the description and name
	desc = "A peaked cap with text reading '[slogan]'."
	name = "\improper '[slogan]' hat"

	//pick a hue
	if(!colourtype)
		colourtype = pick("green", "red", "blue", "yellow", "purple", "orange", "grey", "black", "navy")

	//finally, take our hat size and pick the icon accordingly
	icon_state = "[colourtype]soft[hatsize]"
	item_state_slots = list(slot_r_hand_str = "helmet", slot_l_hand_str = "helmet", slot_head_str = "[colourtype]soft[hatsize]")