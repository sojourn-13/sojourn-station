
//Base type basically for all are lovely subtypes
/mob/living/carbon/superior/robot/gp/synth
	name = "Greyson Positronic FBP Frame Unit"
	desc = "A full body positronic, tasked with carrying out a variety of duties. \
	This unit is a frame not equiped with any gear."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "nanotrasen"
	attacktext = "punched"
	turns_per_move = 7
	move_to_delay = 2
	health = 100 * GREYSONROBUST_HEALTH_MOD
	maxHealth = 100 * GREYSONROBUST_HEALTH_MOD
	cleaning = FALSE
	can_block = TRUE

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior/durable = 15,
		/datum/stat_modifier/mob/living/carbon/superior/armor/mult/negative/low = 7,
		/datum/stat_modifier/mob/living/carbon/superior/armor/mult/negative/medium = 3,
		/datum/stat_modifier/mob/living/carbon/superior/young/robotic = 5, //we dont want them ALWAYS to be mega super fast
		/datum/stat_modifier/mob/living/carbon/superior/old/robotic = 15,
		/datum/stat_modifier/mob/living/carbon/superior/brutish/robotic = 15,
		/datum/stat_modifier/mob/living/damage/negative/mixed/flat/low = 6,
		/datum/stat_modifier/mob/living/carbon/superior/brutal/robotic = 6,
		/datum/stat_modifier/mob/living/carbon/superior/aggressive/savage/robotic = 2,
		/datum/stat_modifier/mob/living/carbon/superior/aggressive = 8,
		/datum/stat_modifier/mob/living/carbon/superior/deadeye = 12,
		/datum/stat_modifier/mob/living/carbon/superior/triggerfinger/robotic = 7,
		/datum/stat_modifier/mob/living/carbon/superior/quickdraw = 3,
		/datum/stat_modifier/mob/living/carbon/superior/slowdraw = 8,
		/datum/stat_modifier/mob/living/carbon/superior/slowaimed = 8,
		/datum/stat_modifier/mob/living/carbon/superior/resilience_perk = 5,
	)


/mob/living/carbon/superior/robot/gp/synth/New()
	..()
	stats.changeStat(STAT_TGH, 10)
	stats.changeStat(STAT_MEC, 25)

/mob/living/carbon/superior/robot/gp/synth/combative
	name = "Greyson Positronic FBP-SEC Heavy Unit"
	desc = "A full body positronic, tasked with carrying out a variety of duties. \
	This unit has a set of heavy armor and agumentation-shield as well as a set of arm blades."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "nanotrasen_combative"
	attacktext = "synth_armblade_attack_flick"
	cleaning = FALSE


	//Legitly the mob's stats. If this is unfair to the player then its 100% unfair to the mob!
	//Even has less armor and hp then a human in basic gear! (other then E gun stuff.)
	melee_damage_lower = WEAPON_FORCE_BRUTAL
	melee_damage_upper = WEAPON_FORCE_BRUTAL
	armor_divisor = ARMOR_PEN_MODERATE

	//Different things
	can_block = TRUE
	health_point_to_block = 0.8 //When missing 20% of hp start blocking
	health = 180 * GREYSONROBUST_HEALTH_MOD
	maxHealth = 180 * GREYSONROBUST_HEALTH_MOD
	//We get heavy engery armor rather then bullet/melee as thats what GP interaly uses most, cog lasers.
	armor = list(melee = 9, bullet = 7, energy = 11, bomb = 80, bio = 100, rad = 100)

/mob/living/carbon/superior/robot/gp/synth/combative/New()
	..()
	stats.changeStat(STAT_TGH, 35)
	stats.changeStat(STAT_MEC, 25)

/mob/living/carbon/superior/robot/gp/synth/epistol
	name = "Greyson Positronic FBP-SEC Mark I Unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. \
	This one has an old style energy pistol built into its arm."
	icon_state = "nanotrasenranged"
	ranged = 1

/mob/living/carbon/superior/robot/gp/synth/epistol/New()
	..()
	if(prob(20))
		drop2 = /obj/item/gun/energy/cog
	if(prob(30))
		cell_drop = /obj/item/cell/medium

	stats.changeStat(STAT_TGH, 5) //Total of 15 tgh

/mob/living/carbon/superior/robot/gp/synth/epistol/esmg
	name = "Greyson Positronic FBP-SEC Mark II Unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. \
	This one has a modified burst fire cog laser rifle built into its arm."
	icon_state = "nanotrasenrangedsmg"
	rapid = 1
	rapid_fire_shooting_amount = 3
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/beam/pulse/drone

/mob/living/carbon/superior/robot/gp/synth/epistol/esmg/Initialize(mapload)

	allowed_stat_modifiers[/datum/stat_modifier/mob/living/carbon/superior/aggressive] += 40 // more aggressive

	. = ..()

/mob/living/carbon/superior/robot/gp/synth/epistol/rifle
	name = "Greyson Positronic FBP-SEC Mark III Unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. \
	This one has a modified heavy duty cog carbine built into its arm."
	icon_state = "nanotrasenrangedassault"
	projectiletype = /obj/item/projectile/beam/midlaser

/mob/living/carbon/superior/robot/gp/synth/epistol/heavy
	name = "Greyson Positronic FBP-SEC Heavy Unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. \
	This one has an overclocked super cog laser rifle built in its arm, as well as extra plates of armor designed against \
	laser beams or other energy based weapons."
	icon_state = "nanotrasen_ert"
	projectiletype = /obj/item/projectile/beam
	health = 150 * GREYSONROBUST_HEALTH_MOD
	maxHealth = 150 * GREYSONROBUST_HEALTH_MOD
	//We get heavy engery armor rather then bullet/melee as thats what GP interaly uses most, cog lasers.
	armor = list(melee = 8, bullet = 6, energy = 10, bomb = 60, bio = 100, rad = 100)

/mob/living/carbon/superior/robot/gp/synth/heavy/New()
	..()
	stats.changeStat(STAT_TGH, 10) //Total of 25 tgh

/// Base unit for Snipers, Use subtypes rather then this one
/mob/living/carbon/superior/robot/gp/synth/epistol/sniper
	name = "Greyson Positronic FBP-SEC Sniper Unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. \
	This one has an overclocked and overcharged hyper cog laser rifle built into its arm, and a scope in its visor."
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

//Lowest extra view meaning it has the lowest in performance impact compared to others
/mob/living/carbon/superior/robot/gp/synth/epistol/sniper/lowestrange
	name = "Greyson Positronic FBP-SEC Sniper Mark I Unit"
	viewRange = 9
	comfy_range = 9

//Lower performance impact
/mob/living/carbon/superior/robot/gp/synth/epistol/sniper/lowrange
	name = "Greyson Positronic FBP-SEC Sniper Mark II Unit"
	viewRange = 20
	comfy_range = 20

//Moderate performance impact
/mob/living/carbon/superior/robot/gp/synth/epistol/sniper/medrange
	name = "Greyson Positronic FBP-SEC Sniper Mark III Unit"
	viewRange = 40
	comfy_range = 40

//For use in absurd distances, large performance impact comparatively
/mob/living/carbon/superior/robot/gp/synth/epistol/sniper/highrange_laggy
	name = "Greyson Positronic FBP-SEC Sniper Mark V Unit"
	viewRange = 100
	comfy_range = 100
