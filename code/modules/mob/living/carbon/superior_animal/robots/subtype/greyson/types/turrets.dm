// OneStar patrol borg that defends OneStar facilities
// Sprites by Keereere
/mob/living/carbon/superior_animal/robot/greyson/stalker
	name = "\"Iron Lock Security\" Stalker Mk1"
	desc = "A ruthless patrol borg that defends Greyson facilities. This one has a single \"Scaffold\" caseless rifle, still enough to kill pesky intruders."
	icon_state = "stalker_mk1"
	icon_living = "stalker_mk1"
	pass_flags = PASSTABLE

	mob_size = MOB_MEDIUM

	maxHealth = 75 * GREYSONWEAK_HEALTH_MOD
	health = 75 * GREYSONWEAK_HEALTH_MOD

	faction = "greyson"

	deathmessage = "suddenly shuts down, its eye light switching to a dim red."
	attacktext = "bonked"
	attack_sound = 'sound/weapons/smash.ogg'
	speak_emote = list("beeps")
	emote_see = list("beeps repeatedly", "whirrs violently", "flashes its indicator lights", "emits a ping sound")
	speak_chance = 5

	move_to_delay = 6
	turns_per_move = 5
	see_in_dark = 10
	meat_type = null
	meat_amount = 0
	stop_automated_movement_when_pulled = 0

	melee_damage_lower = 12
	melee_damage_upper = 17
	destroy_surroundings = FALSE
	armor = list(melee = 8, bullet = 6, energy = 10, bomb = 60, bio = 100, rad = 100) //We want to be gunned down, not lasered

	times_to_get_stat_modifiers = 2 //two prefixes

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/durable = 25,
		/datum/stat_modifier/mob/living/damage/positive/mixed/mult/low = 5,
		/datum/stat_modifier/mob/living/damage/negative/mixed/mult/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/armor/flat/negative/low = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/armor/flat/negative/medium = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/armor/flat/negative/high = 1,
		/datum/stat_modifier/mob/living/carbon/superior_animal/old/robotic = 20, //these guys are old
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutal/robotic = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive/savage/robotic = 1,
		/datum/stat_modifier/mob/living/carbon/superior_animal/deadeye = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/slowaimed = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/triggerfinger/robotic = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/quickdraw = 5,
	)

	contaminant_immunity = TRUE

	light_range = 3
	light_color = COLOR_LIGHTING_BLUE_BRIGHT
	mob_classification = CLASSIFICATION_SYNTHETIC

	reload_message = "ejects a magazine as it loudly reloads with mechanical speed!"
	ranged = TRUE //will it shoot?
	rapid = FALSE //will it shoot fast?
	projectiletype = /obj/item/projectile/bullet/c10x24
	projectilesound = 'sound/weapons/Gunshot.ogg'
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 99
	mag_type = /obj/item/ammo_magazine/c10x24/empty
	mags_left = 1
	casingtype = null
	ranged_cooldown = 5
	fire_verb = "fires"
	acceptableTargetDistance = 6
	comfy_range = 5
	range_telegraph = "'s servos begin to spool up, aiming at"

/mob/living/carbon/superior_animal/robot/greyson/stalker/New()
	. = ..()
	pixel_x = 0
	pixel_y = 0
	if(prob(1) && (!drop1))
		drop1 = /obj/item/gun/projectile/automatic/scaffold
	if(prob(30) && (!cell_drop))
		cell_drop = /obj/item/cell/large

/mob/living/carbon/superior_animal/robot/greyson/stalker/dual
	name = "\"Iron Lock Security\" Stalker Mk2"
	desc = "A ruthless patrol borg that defends Greyson facilities. This one is an upgraded version with dual \"Scaffold\" caseless rifles, don\'t stand in front of it for too long."
	icon_state = "stalker_mk2"
	icon_living = "stalker_mk2"
	ranged_cooldown = 8
	rounds_left = 33
	mags_left = 3
	maxHealth = 125 * GREYSONROBUST_HEALTH_MOD
	health = 125 * GREYSONROBUST_HEALTH_MOD
	rapid = TRUE
	rapid_fire_shooting_amount = 3


/mob/living/carbon/superior_animal/robot/greyson/stalker/dual/New()
	. = ..()
	if(prob(1) && (!drop2))
		drop2 = /obj/item/gun/projectile/automatic/scaffold

/obj/item/stalker_fuel_rod
	name = "plasma fuel rod"
	desc = "A greyson-alloyed fuel rod, filled to the brim with plasma."

	origin_tech = list(TECH_POWER = 6, TECH_PLASMA = 4, TECH_ENGINEERING = 4)
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASMA = 5, MATERIAL_PLASMAGLASS = 1, MATERIAL_DIAMOND = 2, MATERIAL_PLATINUM = 1)

	icon = 'icons/obj/chemical.dmi'
	icon_state = "fuel_rod"

	preloaded_reagents = list("plasma" = 30)

/obj/item/stalker_fuel_rod/depleted
	name = "spent fuel rod"
	desc = "A empty greyson-alloyed fuel rod, previously having contained some combustable substance. Presumably."

	origin_tech = list(TECH_POWER = 3, TECH_PLASMA = 2, TECH_ENGINEERING = 2)
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASMAGLASS = 1, MATERIAL_DIAMOND = 2, MATERIAL_PLATINUM = 1)

	icon_state = "fuel_rod_depleted"

	preloaded_reagents = null

// mini-boss enemy that demands attention or else they will nuke someone. VERY POWERFUL
/mob/living/carbon/superior_animal/robot/greyson/stalker/dual/plasma_cannon
	name = "\"Iron Lock Security\" Assault Stalker Mk2"
	desc = "A ruthless patrol borg that defends Greyson facilities. This one has a pair of massively oversized plasma cannons, and has been fitted with thick layers of ablative plating, as well as bomb shielding, although at the cost of it's mobility. This will destroy you."

	range_charge_telegraph = "'s plasma cannons grow brighter, and it hums louder, preparing to fire at"
	range_telegraph = "'s plasma cannons let out an eerie and TERRIFYING whine as it prepares to unleash it's devastating payload upon"
	target_telegraph = "begins to hum, it's plasma cannons glowing with a dim, growing light, as it turns to"

	telegraph_beam_color = COLOR_RED
	color = COLOR_RED

	rounds_left = 4 //low ammo
	mag_type = /obj/item/stalker_fuel_rod/depleted
	mags_left = 2

	armor = list(melee = 8, bullet = 12, energy = 20, bomb = 100, bio = 100, rad = 100) //if people want to melee the stalker that explodes apon death, power to them

	get_stat_modifier = FALSE // lol no

	maxHealth = 400 * GREYSONROBUST_HEALTH_MOD //tanky
	health = 400 * GREYSONROBUST_HEALTH_MOD

	deathmessage = "violently explodes, its internal generator combusting in a brilliant blue-white flame!"
	reload_message = "lets out a hiss as a fuel rod ejects from its carapace!"

	projectiletype = /obj/item/projectile/hydrogen/cannon/max //devastating
	fire_delay = 5 //5 ticks of charging to fire. very important since this will fucking instakill most people
	fire_delay_initial = 5
	rapid_fire_shooting_amount = 2

	delay_for_range = 2 SECONDS
	delay_for_rapid_range = 1 SECOND

	retarget_timer = 15
	retarget_timer_initial = 15
	retarget_chance = 90

	projectilesound = 'sound/weapons/energy/hydrogen_heavy.ogg'
	projectilevolume = 300

	fire_through_walls = TRUE //this bad boy can BREAK cover

	move_to_delay = 11 //slow as hell due to it's armor and weapons. also balance reasons.

/mob/living/carbon/superior_animal/robot/greyson/stalker/dual/plasma_cannon/New()
	. = ..()

	drop1 = null
	drop2 = null

	if (prob(30))
		drop1 = /obj/item/stalker_fuel_rod

	if (prob(45))
		drop2 = /obj/item/stack/material/plasteel/random

	if (cell_drop)
		cell_drop = /obj/item/cell/large/greyson


/mob/living/carbon/superior_animal/robot/greyson/stalker/dual/plasma_cannon/ex_act(severity) // we dont want it to bomb itself
	return FALSE

/mob/living/carbon/superior_animal/robot/greyson/stalker/dual/plasma_cannon/death()

	explosion(src.loc, 0, 1, 2, 3)

	. = ..()
