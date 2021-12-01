/mob/living/carbon/superior_animal/psi_monster/mister_dream
	name = "Dreaming King"
	desc = "The Dreaming King, named by the first psion who saw it through a drug induced haze. Thought to first be merely the creation of a fever dream until sojourns into deep maintenance revealed him \
	to be a nightmare come to life. Only one may live at any one time, the king of the other world deep maintenance and woe to anyone that would try to take his crown."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "crab3"
	icon_living = "crab3"

	maxHealth = 3000
	health = 3000
	attack_sound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	melee_damage_lower = 50
	melee_damage_upper = 60
	attacktext = "delivered a devastating blow to"
	emote_see = list("smears its sticky claws along its shoulders.", "bellows in a low voice, \"Render unto the king all which you have.\"", "intones, \"Kneel before the crown.\"")
	healing_factor = 0
	pixel_x = -16
	pixel_y = 0

/mob/living/carbon/superior_animal/psi_monster/mister_dream
	name = "Hound of the Crown"
	desc = "The faithful hound of the dreaming king, a terrible and nightmarish outsider that pursues intruders into the king's realm. At the behest of the king's decree, it has adapted to render psions \
	into powerless nulls. After all, they are the most common thieves in this other wordly realm."
	icon_state = "bigred"
	icon_living = "bigred"
	emote_see = list("looses a ground shaking growl.", "sniffs the air, its jaw opening and closing as black drool seeps from its teeth.", "suddenly howls!")
	poison_per_bite = 5