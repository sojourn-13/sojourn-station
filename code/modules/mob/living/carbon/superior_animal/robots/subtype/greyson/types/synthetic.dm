/mob/living/carbon/superior_animal/robot/greyson/synthetic
	name = "Greyson Positronic FBP-Utility unit"
	desc = "A full body positronic, tasked with carrying out a variety of duties. This one is unarmed."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "nanotrasen"
	attacktext = "punched"
	turns_per_move = 7
	move_to_delay = 2
	health = 100 * GREYSONROBUST_HEALTH_MOD
	maxHealth = 100 * GREYSONROBUST_HEALTH_MOD
	cleaning = FALSE

/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol
	name = "Greyson Positronic FBP-SEC Mark I unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. This one has an old style energy pistol built into its arm."
	icon_state = "nanotrasenranged"
	ranged = 1

/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/New()
	..()
	if(prob(20))
		drop2 = /obj/item/gun/energy/cog
	if(prob(30))
		cell_drop = /obj/item/cell/medium

/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/esmg
	name = "Greyson Positronic FBP-SEC Mark II unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. This one has a modified burst fire cog laser rifle built into its arm."
	icon_state = "nanotrasenrangedsmg"
	rapid = 1
	rapid_fire_shooting_amount = 3
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/beam/pulse/drone

/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/esmg/Initialize(mapload)

	allowed_stat_modifiers[/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive] += 40 // more aggressive

	. = ..()

/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/rifle
	name = "Greyson Positronic FBP-SEC Mark III unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. This one has a modified heavy duty cog carbine built into its arm."
	icon_state = "nanotrasenrangedassault"
	projectiletype = /obj/item/projectile/beam/midlaser

/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/heavy
	name = "Greyson Positronic FBP-SEC Heavy unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. This one has an overclocked super cog laser rifle built in its arm."
	icon_state = "nanotrasen_ert"
	projectiletype = /obj/item/projectile/beam
	health = 150 * GREYSONROBUST_HEALTH_MOD
	maxHealth = 150 * GREYSONROBUST_HEALTH_MOD
	armor = list(melee = 8, bullet = 6, energy = 10, bomb = 60, bio = 100, rad = 100) //We want to be gunned down, not lasered

/// base type, dont use
/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/sniper
	name = "Greyson Positronic FBP-SEC Sniper unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. This one has an overclocked and overcharged hyper cog laser rifle built into its arm, and a scope in its visor."
	icon_state = "nano_alt"

	get_stat_modifier = FALSE

	projectiletype = /obj/item/projectile/beam/sniper
	telegraph_beam_color = COLOR_ORANGE
	destroy_surroundings = FALSE
	fire_delay = 2
	fire_delay_initial = 2
	delay_for_range = 1.1 SECONDS

	retarget_timer = 10
	retarget_timer_initial = 10

	retarget_chance = 90

	always_telegraph_to_target = FALSE

	advance = FALSE

/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/sniper/lowestrange
	viewRange = 9
	comfy_range = 9

/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/sniper/lowrange //lower performance impact
	viewRange = 20
	comfy_range = 20

/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/sniper/medrange //moderate performance impact
	viewRange = 40
	comfy_range = 40

/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/sniper/highrange_laggy //for use in absurd distances, large performance impact comparatively
	viewRange = 100
	comfy_range = 100
