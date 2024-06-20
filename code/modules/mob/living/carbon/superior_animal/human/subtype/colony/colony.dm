//Colony allies for events to help support players

/mob/living/carbon/superior_animal/human/colony_allie
	name = "Blackshield Infantryman"
	desc = "A Blackshield Vatgrown Trooper Ready To Fight for the Colony Armed with a Modern Duty Battle Carbine, He seems able to Fight on Long and Close Quarters, He seems like an Average Fighter"
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "BS"
	icon_dead = "BS_dead"
	stop_automated_movement_when_pulled = 0
	maxHealth = 200
	health = 200
	melee_damage_lower = 35
	melee_damage_upper = 35
	attacktext = "slashed"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	fire_verb = "fires"
	var/egun = FALSE
	var/suited_for_space = FALSE

	target_telegraph = "fumbles to ready their weapon, preparing to engage"
	rush_target_telegraph = "quickly snaps their aim toward"

	armor = list(melee = 10, bullet = 10, energy = 7, bomb = 30, bio = 100, rad = 50)

	inherent_mutations = list(MUTATION_HEART, MUTATION_LUNG, MUTATION_LIVER, MUTATION_BLOOD_VESSEL, MUTATION_MUSCLES, MUTATION_NERVES)

	get_stat_modifier = TRUE

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/durable = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/young = 12,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutal = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive/savage = 1,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/slowaimed = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/triggerfinger = 15,
		/datum/stat_modifier/mob/living/carbon/superior_animal/quickdraw = 5
	)

//Drops
	meat_amount = 4
	meat_type = /obj/item/reagent_containers/food/snacks/meat/human

	can_burrow = FALSE
	colony_friend = TRUE
	friendly_to_colony = TRUE

	drop_items = list(/obj/item/gun/projectile/automatic/duty)
	faction = "neutral"

	//range/ammo stuff
	ranged = 1
	rapid_fire_shooting_amount = 1
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/bullet/light_rifle_257
	projectilesound = 'sound/weapons/guns/fire/carbine.ogg'
	limited_ammo = FALSE
	mag_drop = TRUE
	rounds_left = 10
	mag_type = /obj/item/ammo_magazine/speed_loader_light_rifle_257/empty
	mags_left = 3 //3+1
	light_range = 5
	light_color = COLOR_LIGHTING_BLUE_BRIGHT

/mob/living/carbon/superior_animal/human/colony_allie/ship_breaker_marks
	name = "Shipbreaker Marksman"
	desc = "A Prospector Shipbreaker Scout Armed with a Cog laser carbine, The gun seems modified to shoot on burst mode to deal the double of hits to the Enemy, he seems to be an Veteran Vatgrown Fighter."
	icon_state = "Shipbreakercg"
	icon_dead = "Shipbreakercg_dead"
	rapid = 1
	rapid_fire_shooting_amount = 2
	drop_items = list(/obj/item/gun/energy/cog)
	mag_type = /obj/item/cell/medium/high/depleted
	projectilesound = 'sound/weapons/energy/Laser.ogg'
	melee_damage_lower = 10
	melee_damage_upper = 10
	egun = TRUE
	suited_for_space = TRUE
	projectiletype = /obj/item/projectile/beam

//They are all waring space suits
	breath_required_type = NONE
	breath_poison_type = NONE
	min_breath_required_type = 0
	min_breath_poison_type = 0

	min_air_pressure = 0
	min_bodytemperature = 0
	light_range = 5
	light_color = COLOR_LIGHTING_BLUE_BRIGHT

/mob/living/carbon/superior_animal/human/colony_allie/ship_breaker_marks/sword
	name = "Shipbreaker Marksman"
	desc = "A Vatborn Prospector Shipbreaker Scout Armed with a Spider Rose and a Laser Sword To Kill any Enemy durable enough To survive his Aim, he Seems to be an Veteran Fighter."
	icon_state = "Shipbreakerlssp"
	icon_dead = "Shipbreakerlssp_dead"
	rapid = 0
	drop_items = list(/obj/item/trash/material/e_sword_cutlass, /obj/item/gun/energy/gun)
	mag_type = /obj/item/cell/medium/high/depleted
	projectilesound = 'sound/weapons/energy/Laser.ogg'
	melee_damage_lower = 30
	melee_damage_upper = 40
	mags_left = 0 //0+1
	projectiletype = /obj/item/projectile/beam
	light_range = 5
	light_color = COLOR_LIGHTING_BLUE_BRIGHT
	melee_sharp = TRUE //Eswords and welders
/*
/mob/living/carbon/superior_animal/human/colony_allie/lonestar_merc
	name = "Lonestar Corporate Infantryman"
	desc = "A private vatborn from lonestar, Well paid and Geared this veteran soldier is armed with a Laser Carbine ready to anihilate any threat to the Corporation, He Seems To be an Veteran Fighter."
	icon_state = "LSCICarb"
	icon_dead = "LSCICarb_dead"
	rapid = 1
	rapid_fire_shooting_amount = 2
	drop_items = list(/obj/item/gun/energy/lasercore)
	mag_type = /obj/item/cell/medium/high/depleted
	projectilesound = 'sound/weapons/energy/Laser.ogg'
	melee_damage_lower = 10
	melee_damage_upper = 10
	egun = TRUE
	suited_for_space = TRUE
	armor = list(melee = 12, bullet = 12, energy = 10, bomb = 30, bio = 100, rad = 50)
	projectiletype = /obj/item/projectile/beam
	light_range = 5
	light_color = COLOR_LIGHTING_BLUE_BRIGHT

//They are all waring space suits
	breath_required_type = NONE
	breath_poison_type = NONE
	min_breath_required_type = 0
	min_breath_poison_type = 0

	min_air_pressure = 0
	min_bodytemperature = 0

/mob/living/carbon/superior_animal/human/colony_allie/lonestar_breacher_merc
	name = "Lonestar Corporate Breacher"
	desc = "A Private Vatborn Soldier from Lonestar Well paid and Geared This veteran soldier is armed with An Advanced Laser Handgun Set to kill while on his other hand he is wearing a charged Power Fist, He seems to be an Veteran Fighter."
	icon_state = "LSCIRvMp"
	icon_dead = "LSCIRvMp_dead"
	rapid = 1
	rapid_fire_shooting_amount = 2
	drop_items = list(/obj/item/gun/energy, /obj/item/tool/power_fist)
	mag_type = /obj/item/cell/medium/high/depleted
	projectilesound = 'sound/weapons/energy/Laser.ogg'
	melee_damage_lower = 40
	melee_damage_upper = 40
	mags_left = 0 //0+1
	egun = TRUE
	suited_for_space = TRUE
	projectiletype = /obj/item/projectile/beam
	armor = list(melee = 12, bullet = 12, energy = 10, bomb = 30, bio = 100, rad = 50)

//They are all waring space suits
	breath_required_type = NONE
	breath_poison_type = NONE
	min_breath_required_type = 0
	min_breath_poison_type = 0

	min_air_pressure = 0
	min_bodytemperature = 0

	light_range = 5
	light_color = COLOR_LIGHTING_BLUE_BRIGHT
*/
/mob/living/carbon/superior_animal/human/colony_allie/handle_breath(datum/gas_mixture/breath) //we have are own air supplies
	if(suited_for_space)
		return
	..()

/mob/living/carbon/superior_animal/human/colony_allie/handle_environment(var/datum/gas_mixture/environment) //are armor legit is a void suit
	if(suited_for_space)
		return
	..()

/mob/living/carbon/superior_animal/human/colony_allie/start_pulling(var/atom/movable/AM)
	to_chat(src, SPAN_WARNING("Your hand gets pushed away from \the [src]. !"))
	return

/mob/living/carbon/superior_animal/human/colony_allie/death()
	..()
	drop_death_loot()

/mob/living/carbon/superior_animal/human/colony_allie/emp_act(severity)
	..()
	if(rapid && egun)
		rapid = FALSE
	if(prob(95) && ranged && egun)
		ranged = FALSE

