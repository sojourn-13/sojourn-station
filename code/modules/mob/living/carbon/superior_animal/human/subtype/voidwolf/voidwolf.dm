//Void Wolfs are VERY wip. They're set up as basic enemies with the sprites.

/*Melee Void Wolfs*/
/mob/living/carbon/superior_animal/human/voidwolf
	name = "Void Wolf Commando"
	desc = "A Void Wolf mercenary wielding an energy blade and riot shield."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "voidwolf_melee"
	icon_dead = "voidwolf_melee_dead"
	stop_automated_movement_when_pulled = 0
	maxHealth = 125 * VOIDWOLF_HEALTH_MOD
	health = 125 * VOIDWOLF_HEALTH_MOD
	melee_damage_lower = 30
	melee_damage_upper = 30

	melee_sharp = FALSE //Eswords
	armor_divisor = 3

	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure

	attacktext = "slashed"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0
	fire_verb = "fires"

	target_telegraph = "fumbles to ready their weapon, preparing to engage"
	rush_target_telegraph = "quickly snaps their aim toward"

	armor = list(melee = 2, bullet = 2, energy = 2, bomb = 0, bio = 100, rad = 50) //Legitmently their armor

	inherent_mutations = list(MUTATION_HEART, MUTATION_LUNG, MUTATION_LIVER, MUTATION_BLOOD_VESSEL, MUTATION_MUSCLES, MUTATION_NERVES)

	get_stat_modifier = TRUE

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/durable = 5,
		/datum/stat_modifier/health/flat/negative/low = 5,
		/datum/stat_modifier/health/flat/positive/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/armor/mult/negative/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/young = 12,
		/datum/stat_modifier/mob/living/carbon/superior_animal/old = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutish = 5,
		/datum/stat_modifier/mob/living/damage/negative/mixed/flat/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutal = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive/savage = 1,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/deadeye = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/slowaimed = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/triggerfinger = 15,
		/datum/stat_modifier/mob/living/carbon/superior_animal/quickdraw = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/slowdraw = 10,
	)

//They are all waring space suits
	breath_required_type = NONE
	breath_poison_type = NONE
	min_breath_required_type = 0
	min_breath_poison_type = 0

	min_air_pressure = 0
	min_bodytemperature = 0

//Drops
	meat_amount = 4
	meat_type = /obj/item/reagent_containers/food/snacks/meat/human

	drop_items = list(/obj/item/trash/material/e_sword_cutlass, /obj/item/shield/riot/damaged)
	faction = "pirate"

/mob/living/carbon/superior_animal/human/voidwolf/handle_breath(datum/gas_mixture/breath) //we have are own air supplies
	return

/mob/living/carbon/superior_animal/human/voidwolf/handle_environment(var/datum/gas_mixture/environment) //are armor legit is a void suit
	return

/mob/living/carbon/superior_animal/human/voidwolf/start_pulling(var/atom/movable/AM)
	to_chat(src, SPAN_WARNING("Your hand gets pushed away from \the [src]. !"))
	return

/mob/living/carbon/superior_animal/human/voidwolf/death()
	..()
	drop_death_loot()

/mob/living/carbon/superior_animal/human/voidwolf/emp_act(severity)
	..()
	if(rapid)
		rapid = FALSE
	if(prob(95) && ranged)
		ranged = FALSE


/mob/living/carbon/superior_animal/human/voidwolf/fieldtech
	name = "Void Wolf Field Tech"
	desc = "A Void Wolf mercenary wielding an industrial welder."
	melee_damage_lower = 20
	melee_damage_upper = 22
	icon_state = "voidengie"
	icon_dead = "voidengie_dead"
	attacktext = "burnt"
	attack_sound = 'sound/items/Welder.ogg'
	drop_items = list(/obj/item/tool/weldingtool/advanced)
	melee_sharp = FALSE
	armor_divisor = 1
	melee_damage_type = BURN

/*Ranged Void Wolfs*/
/mob/living/carbon/superior_animal/human/voidwolf/ranged
	name = "Void Wolf Trooper"
	desc = "A Void Wolf mercenary wielding an energy rifle."
	icon_state = "voidwolf"
	icon_dead = "voidwolf_dead"
	projectilesound = 'sound/weapons/energy/laser.ogg'
	melee_damage_lower = 10 //We dont like melee
	melee_damage_upper = 15
	maxHealth = 75 * VOIDWOLF_HEALTH_MOD
	health = 75 * VOIDWOLF_HEALTH_MOD
	ranged = TRUE
	rapid = TRUE
	rapid_fire_shooting_amount = 3
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/beam
	drop_items = list(/obj/item/gun/energy/cog)
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 16
	mag_type = /obj/item/cell/medium/high/depleted
	mags_left = 1
	melee_sharp = FALSE
	armor_divisor = 1

/mob/living/carbon/superior_animal/human/voidwolf/ranged/New()
	..()
	reload_message = "[name] ejects a depleted cell and rapidly reloads a new one!"

/mob/living/carbon/superior_animal/human/voidwolf/fieldtech/ranged
	name = "Void Wolf Field Tech"
	desc = "A Void Wolf mercenary wielding an industrial welder and energy pistol."
	icon_state = "voidengie_ranged"
	icon_dead = "voidengie_ranged_dead"
	melee_damage_lower = 20
	melee_damage_upper = 22
	ranged = TRUE
	rapid = FALSE
	projectiletype = /obj/item/projectile/beam
	projectilesound = 'sound/weapons/energy/laser.ogg'
	drop_items = list(/obj/item/tool/weldingtool/advanced, /obj/item/gun/energy/gun/martin)
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 4
	mag_type = /obj/item/cell/small/high/depleted
	mags_left = 2
	melee_sharp = FALSE
	armor_divisor = 1
	melee_damage_type = BURN

/mob/living/carbon/superior_animal/human/voidwolf/fieldtech/ranged/New()
	..()
	reload_message = "[name] ejects a depleted cell and fumbles a new one into their weapon."

/mob/living/carbon/superior_animal/human/voidwolf/ranged/aerotrooper
	name = "Void Wolf Aerotrooper"
	desc = "A Void Wolf mercenary wielding an energy rifle and jetpack."
	icon_state = "voidwolf_flying"
	icon_dead = "voidwolf_flying_dead"
	ranged = TRUE
	rapid = TRUE
	rounds_left = 16
	mags_left = 2
	rapid_fire_shooting_amount = 3
	projectiletype = /obj/item/projectile/beam
	drop_items = list(/obj/item/gun/energy/cog)
	melee_sharp = FALSE
	armor_divisor = 1

/mob/living/carbon/superior_animal/human/voidwolf/ranged/aerotrooper/New()
	..()
	reload_message = "[name] ejects a depleted cell and rapidly reloads a new one!"

/mob/living/carbon/superior_animal/human/voidwolf/captain
	name = "Void Wolf Captain"
	desc = "A Void Wolf field commander wielding an energy sword and Spider Rose combo. "
	icon_state = "voidwolfcap"
	icon_dead = "voidwolfcap_dead"
	melee_damage_lower = 30
	melee_damage_upper = 35
	maxHealth = 150 * VOIDWOLF_HEALTH_MOD
	health = 150 * VOIDWOLF_HEALTH_MOD
	ranged_cooldown = 3
	ranged = TRUE
	rapid = FALSE
	projectiletype = /obj/item/projectile/beam
	drop_items = list(/obj/item/trash/material/e_sword_cutlass, /obj/item/gun/energy/gun)
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 8
	mag_type = /obj/item/cell/small/high/depleted
	mags_left = 1
	melee_sharp = TRUE //Eswords
	armor_divisor = 3

	times_to_get_stat_modifiers = 2 //two prefixes

/mob/living/carbon/superior_animal/human/voidwolf/captain/New()
	..()
	reload_message = "[name] ejects a depleted cell and rapidly reloads a new one with one hand!"

//Reavers, the void wolf elite.
/mob/living/carbon/superior_animal/human/voidwolf/elite
	// basetype, dont use
	name = "Void Reaver Stormtrooper"
	desc = "A void wolf reaver stormtrooper, vatgrown and given bionic enhancements, with far better equipment and decades of experience raiding ships and killing men under the command of a true reaver."
	icon_state = "reaver_lasrak"
	projectilesound = 'sound/weapons/energy/Laser.ogg'
	melee_damage_lower = 20 //We dont like melee
	melee_damage_upper = 25
	ranged = TRUE
	rapid = TRUE
	rapid_fire_shooting_amount = 3
	ranged_cooldown = 3
	drop_items = list(/obj/item/gun/energy/firestorm/reaver_modded,/obj/random/cloth/assault/reaver)
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 20
	mag_type = /obj/item/cell/medium/high/depleted
	mags_left = 3

	flash_resistances = 20 //no.
	melee_sharp = TRUE //Eswords
	armor_divisor = 3
	armor = list(melee = 15, bullet = 13, energy = 12, bomb = 75, bio = 100, rad = 25) //Legitmently their armor

/mob/living/carbon/superior_animal/human/voidwolf/elite/New()
	..()
	reload_message = "[name] ejects a depleted cell and rapidly reloads a new one!"

/mob/living/carbon/superior_animal/human/voidwolf/elite/Initialize()

	allowed_stat_modifiers[/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive/savage] += 10 //10% extra chance to be a glass cannon

	. = ..()

/mob/living/carbon/superior_animal/human/voidwolf/elite/laserak
	projectiletype = /obj/item/projectile/beam/weak/ap/reaver
	drop_items = list(/obj/item/gun/energy/firestorm/reaver_modded,/obj/random/cloth/assault/reaver)

	mag_type = /obj/item/cell/medium/high/depleted
	mags_left = 3

	rapid_fire_shooting_amount = 5 //we're using the burst 5 mode
	delay_for_rapid_range = 0.22 SECONDS
	melee_sharp = FALSE
	armor_divisor = 1

/obj/item/gun/energy/firestorm/reaver_modded

	initialized_upgrades = list(/obj/item/gun_upgrade/trigger/dangerzone,
								/obj/item/tool_upgrade/refinement/laserguide,
								/obj/item/tool_upgrade/productivity/ergonomic_grip,
								/obj/item/gun_upgrade/barrel/bore,
								/obj/item/tool_upgrade/refinement/stabilized_grip, // max is 5
								)

/mob/living/carbon/superior_animal/human/voidwolf/elite/c20r
	icon_state = "reaver_bulldog"
	projectilesound = 'sound/weapons/guns/fire/smg_fire.ogg'
	projectiletype = /obj/item/projectile/bullet/pistol_35
	drop_items = list(/obj/item/gun/projectile/automatic/c20r/reaver_modded)

	rapid_fire_shooting_amount = 8 // WE FIRE REALLY GODDAMN FAST
	delay_for_rapid_range = 0.15 SECONDS
	rounds_left = 32
	mag_type = /obj/item/ammo_magazine/smg_35/empty
	mags_left = 6 //since we fire. FAST

	casingtype = /obj/item/ammo_casing/pistol_35/spent
	melee_sharp = FALSE
	armor_divisor = 1

/obj/item/gun/projectile/automatic/c20r/reaver_modded

	initialized_upgrades = list(/obj/item/gun_upgrade/trigger/dangerzone,
								/obj/item/tool_upgrade/refinement/laserguide,
								/obj/item/tool_upgrade/productivity/ergonomic_grip,
								/obj/item/tool_upgrade/refinement/stabilized_grip,
								/obj/item/gun_upgrade/barrel/forged,
								)

/mob/living/carbon/superior_animal/human/voidwolf/elite/c20r/New()
	..()
	reload_message = "[name] rapidly reloads before the empty mag hits the ground!"

/mob/living/carbon/superior_animal/human/voidwolf/elite/c20r/emp_act(severity)
	return
/*
/mob/living/carbon/superior_animal/human/voidwolf/elite/gyrojet
	icon_state = "reaver_gyro"
	projectilesound = 'sound/weapons/guns/fire/ubgl.ogg'
	projectiletype = /obj/item/projectile/bullet/gyro
	drop_items = list(/obj/random/cloth/assault/reaver/*,obj/item/gun/projectile/gyropistol*/)
	rapid = FALSE
	rounds_left = 4
	mag_type = /obj/item/ammo_magazine/a75/empty
	mags_left = 0 //no spare mags, they are lethal

	get_stat_modifier = FALSE

casingtype = /obj/item/ammo_casing/a75/spent
	melee_sharp = FALSE
	armor_divisor = 1

/mob/living/carbon/superior_animal/human/voidwolf/elite/gyrojet/New()
	..()
	reload_message = "[name] rapidly reloads before the empty mag hits the ground!"// You should be panicing

/mob/living/carbon/superior_animal/human/voidwolf/elite/gyrojet/emp_act(severity)
	return
*/
/mob/living/carbon/superior_animal/human/voidwolf/elite/myrmidon
	icon_state = "reaver_melee"
	melee_damage_lower = 35
	melee_damage_upper = 40
	ranged = FALSE
	rapid = FALSE
	limited_ammo = FALSE
	drop_items = list(/obj/item/tool/sword/saber/cutlass, /obj/item/shield/buckler/energy/reaver/damaged,/obj/random/cloth/assault/reaver)

	melee_sharp = TRUE //Eswords
	armor_divisor = 3
	var/block_chance = 65

/mob/living/carbon/superior_animal/human/voidwolf/elite/myrmidon/New()
	..()
	reload_message = "[name] rapidly reloads?!"

/mob/living/carbon/superior_animal/human/voidwolf/elite/myrmidon/emp_act(severity)
	return

/mob/living/carbon/superior_animal/human/voidwolf/elite/myrmidon/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(prob(block_chance))
		visible_message("\red \b [src] blocks the [O]!")
		return
	..()

/mob/living/carbon/superior_animal/human/voidwolf/elite/myrmidon/bullet_act(var/obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(block_chance))
		..()
	else if (!(Proj.testing))
		visible_message("\red <B>[src] blocks [Proj] with its shield!</B>")
	return TRUE

/mob/living/carbon/superior_animal/human/voidwolf/elite/Initialize()
	..()
	if(prob(50))
		icon_state = "[icon_state]_elite"

/mob/living/carbon/superior_animal/human/voidwolf/elite/death(gibbed, deathmessage = "drops its weapon as it explodes in a shower of gore when their death implant detonates!")
	..()
	new /obj/effect/gibspawner/human(src.loc)
	playsound(src, 'sound/effects/Explosion2.ogg', 75, 1, -3)
	drop_death_loot()
	qdel(src)
	return
