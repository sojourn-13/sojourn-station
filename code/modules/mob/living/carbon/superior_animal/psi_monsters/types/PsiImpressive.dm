/mob/living/carbon/superior_animal/psi_monster/flesh_behemoth
	name = "flesh behemoth"
	desc = "Hunger, hunger for meat. Meat meat meat. It comes, impossibly strong and looking to devour everything in its path, a wicked blade of bone ready to slice you apart. It's ability to regenerate \
	from even the most disgusting wounds requires you bring light to stall its power."
	icon_state = "vargo"
	icon_living = "vargo"

	maxHealth = 1200
	health = 1200
	attack_sound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	melee_damage_lower = 30
	melee_damage_upper = 40
	emote_see = list("drags a blackened tongue along its arm blade.", "chuckles, \"I'll bring slaughter to the lambs!\"", "mumbles, \"This edge is nice and sharp.\"")
	turns_per_move = 3
	healing_factor = 50
	attacktext = "carved"

/mob/living/carbon/superior_animal/psi_monster/mind_gazer
	name = "mind gazer"
	desc = "One of the more twisted creatures in this other world, its origin unknown, but its nightmarish speed and strength greatly feared."
	icon_state = "regugriator22"
	icon_living = "regugriator22"

	maxHealth = 400
	health = 400
	melee_damage_lower = 25
	melee_damage_upper = 30
	emote_see = list("whirls about, its massive singular eye spasming,", "suddenly halts, its singular pupil dilating!", "whistles a small tune...")
	turns_per_move = 8
	healing_factor = 10
	attacktext = "rammed"

/mob/living/carbon/superior_animal/psi_monster/pus_maggot/ash_wendigo
	name = "ash wendigo"
	desc = "Rage given form, agonized and seeking to punish others for its fate. With skull wreathed in fire, it comes for you."
	icon_state = "guardA"
	icon_living = "guardA"

	maxHealth = 600
	health = 600
	melee_damage_lower = 25
	melee_damage_upper = 30
	emote_see = list("crackles and pops as its head burns!", "looses a haunting scream!", "claws at its head, trying to put out the fire!")
	burn_attack_text = "wreathes its claws in fire before striking!"
	burn_attack_sound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	healing_factor = 0 // Head is a source of light.
	light_range = 6 // Makes it harder for other psi monsters to regen. Because rage.
	chameleon_skill = 155 // Has a harder time cloaking given its natural light.
	light_color = COLOR_LIGHTING_RED_BRIGHT
	attacktext = "clawed"

/mob/living/carbon/superior_animal/psi_monster/cerebral_crusher
	name = "cerebral crusher"
	desc = "A hulking creature of bone, powerful and ponderous in its strength, its claws are coated in toxins that weaken the mind, its touching draining and its ability to rend flesh murderous."
	icon_state = "farartbot"
	icon_living = "farartbot"

	maxHealth = 800
	health = 800
	attack_sound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	melee_damage_lower = 30
	melee_damage_upper = 40
	emote_see = list("scratches at its bone plates.", "moans, \"We hear your thoughts, we feel your fear.\"", "groans, \"Kill us, end this nightmare.\"")
	turns_per_move = 4
	poison_per_bite = 2
	healing_factor = 10
	attacktext = "slammed"

/mob/living/carbon/superior_animal/psi_monster/wasonce/crimson_jelly
	name = "crimson jelly"
	desc = "A genetic abomination left to rot, midway through the transformation into something far worse. The end result of horrible creatures left to gestate instead of being properly purged. \
	It hungers and its body may spread its genetic instability, but at least it is weakened with age."
	icon = 'icons/mob/psi_monsters.dmi'
	icon_state = "oormat"
	icon_living = "oormat"

	maxHealth = 1000
	health = 1000
	chameleon_skill = 10
	healing_factor = 10

/mob/living/carbon/superior_animal/psi_monster/wasonce/pitch_horror
	name = "pitch horror"
	desc = "Left to fester, to grow, to mutate into a terrible thing of eyes and teeth. What never should have been twisted into something unbearable to the minds of men. It comes and brings \
	mutating horror in its wake. Only the light may halt its unnatural regeneration."
	icon = 'icons/mob/psi_monsters.dmi'
	icon_state = "hyper"
	icon_living = "hyper"
	chameleon_skill = 10
	healing_factor = 50
	maxHealth = 1500
	health = 1500