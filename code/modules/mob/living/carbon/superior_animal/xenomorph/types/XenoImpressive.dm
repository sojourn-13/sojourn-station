/mob/living/carbon/superior_animal/xenomorph/warrior/bull/crusher
	name = "crusher"
	desc = "A powerful xenomorph crusher, while it doesn't have the horns a bull does, it does not need them. This behemoth can knock even the toughest man off his feet in one charge."
	icon_state = "crusher"
	icon_living = "crusher"
	icon_dead = "crusher_dead"
	icon_rest = "crusher_stunned"
	maxHealth = 500
	health = 500
	attack_sound = list('sound/xenomorph/alien_footstep_charge1.ogg', 'sound/xenomorph/alien_footstep_charge2.ogg', 'sound/xenomorph/alien_footstep_charge3.ogg')

	armor = list(melee = 15, bullet = 15, energy = 10, bomb = 30, bio = 100, rad = 100)

	melee_damage_lower = 30
	melee_damage_upper = 35

/mob/living/carbon/superior_animal/xenomorph/warrior/shrike/screecher
	name = "screecher"
	desc = "A powerful xenomorph screecher, the noisy and evolved version the shrike with a scream so horrid it bests even the most vigilant person."
	icon_state = "screecher"
	icon_living = "screecher"
	icon_dead = "screecher_dead"
	icon_rest = "screecher_stunned"
	maxHealth = 400
	health = 400

	melee_damage_lower = 20
	melee_damage_upper = 25

/mob/living/carbon/superior_animal/xenomorph/runner/ravager
	name = "ravager"
	desc = "A powerful xenomorph ravager, the fastest of the hulking xenomorphs with claws sharper than any blade and power to rival renders."
	icon = 'icons/mob/Xenos_2x2.dmi'
	icon_state = "ravager"
	icon_living = "ravager"
	icon_dead = "ravager_dead"
	icon_rest = "ravager_stunned"
	maxHealth = 450
	health = 450

	melee_damage_lower = 40
	melee_damage_upper = 50

	attack_sound = list('sound/xenomorph/alien_bite1.ogg', 'sound/xenomorph/alien_bite2.ogg')

/mob/living/carbon/superior_animal/xenomorph/warrior/defiler
	name = "defiler"
	desc = "A powerful xenomorph defiler, toxins drop from claw and maw, promising a venomous side effect with each attack."
	icon = 'icons/mob/Xenos_2x2.dmi'
	icon_state = "defiler"
	icon_living = "defiler"
	icon_dead = "defiler_dead"
	icon_rest = "defiler_stunned"
	maxHealth = 400
	health = 400

	melee_damage_lower = 30
	melee_damage_upper = 35
	poison_per_bite = 5

/mob/living/carbon/superior_animal/xenomorph/warrior/hivelord
	name = "hivelord"
	desc = "A powerful xenomorph hivelord, of all the xenomorph shock troops, the hivelord stands as the most durable titan."
	icon = 'icons/mob/Xenos_2x2.dmi'
	icon_state = "hivelord"
	icon_living = "hivelord"
	icon_dead = "hivelord_dead"
	icon_rest = "hivelord_stunned"
	maxHealth = 600
	health = 600

	armor = list(melee = 20, bullet = 25, energy = 15, bomb = 30, bio = 100, rad = 100)

	melee_damage_lower = 30
	melee_damage_upper = 35