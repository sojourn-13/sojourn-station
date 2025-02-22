//Void Wolfs are VERY wip. They're set up as basic enemies with the sprites.

/*Melee Void Wolfs*/
/mob/living/carbon/superior/human/voidwolf
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
		/datum/stat_modifier/mob/living/carbon/superior/durable = 5,
		/datum/stat_modifier/health/flat/negative/low = 5,
		/datum/stat_modifier/health/flat/positive/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior/armor/mult/negative/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior/young = 12,
		/datum/stat_modifier/mob/living/carbon/superior/old = 5,
		/datum/stat_modifier/mob/living/carbon/superior/brutish = 5,
		/datum/stat_modifier/mob/living/damage/negative/mixed/flat/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior/brutal = 5,
		/datum/stat_modifier/mob/living/carbon/superior/aggressive/savage = 1,
		/datum/stat_modifier/mob/living/carbon/superior/aggressive = 10,
		/datum/stat_modifier/mob/living/carbon/superior/deadeye = 5,
		/datum/stat_modifier/mob/living/carbon/superior/slowaimed = 5,
		/datum/stat_modifier/mob/living/carbon/superior/triggerfinger = 15,
		/datum/stat_modifier/mob/living/carbon/superior/quickdraw = 5,
		/datum/stat_modifier/mob/living/carbon/superior/slowdraw = 10,
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
	meat_type = /obj/item/reagent_containers/snacks/meat/human

	drop_items = list(/obj/item/trash/material/e_sword_cutlass, /obj/item/shield/riot/damaged)
	faction = "pirate"

	fancy_attack_overlay = "voidwolf_slash_flick"
	fancy_attack_shading = "#9b111e" //Ruby

/mob/living/carbon/superior/human/voidwolf/handle_breath(datum/gas_mixture/breath) //we have are own air supplies
	return

/mob/living/carbon/superior/human/voidwolf/handle_environment(var/datum/gas_mixture/environment) //are armor legit is a void suit
	return

/mob/living/carbon/superior/human/voidwolf/start_pulling(var/atom/movable/AM)
	to_chat(src, SPAN_WARNING("Your hand gets pushed away from \the [src]. !"))
	return

/mob/living/carbon/superior/human/voidwolf/death()
	..()
	drop_death_loot()

/mob/living/carbon/superior/human/voidwolf/emp_act(severity)
	..()
	if(rapid)
		rapid = FALSE
	if(prob(95) && ranged)
		ranged = FALSE


/mob/living/carbon/superior/human/voidwolf/fieldtech
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

	fancy_attack_overlay = "voidwolf_fad_flick"
	fancy_attack_shading = "#ffc87c" //Yellow Topaz" //Ruby

/*Ranged Void Wolfs*/
/mob/living/carbon/superior/human/voidwolf/ranged
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
	fancy_attack_overlay = "voidwolf_gun_melee_flick"
	fancy_attack_shading = "#2975A7" //Sapphire


/mob/living/carbon/superior/human/voidwolf/ranged/New()
	..()
	reload_message = "[name] ejects a depleted cell and rapidly reloads a new one!"

/mob/living/carbon/superior/human/voidwolf/fieldtech/ranged
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

/mob/living/carbon/superior/human/voidwolf/fieldtech/ranged/New()
	..()
	reload_message = "[name] ejects a depleted cell and fumbles a new one into their weapon."

/mob/living/carbon/superior/human/voidwolf/ranged/aerotrooper
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

/mob/living/carbon/superior/human/voidwolf/ranged/aerotrooper/New()
	..()
	reload_message = "[name] ejects a depleted cell and rapidly reloads a new one!"

/mob/living/carbon/superior/human/voidwolf/captain
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
	projectiletype = /obj/item/projectile/beam/voidwolf
	drop_items = list(/obj/item/trash/material/e_sword_cutlass, /obj/item/gun/energy/gun)
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 8
	mag_type = /obj/item/cell/small/high/depleted
	mags_left = 1
	melee_sharp = TRUE //Eswords
	armor_divisor = 3
	move_and_attack = TRUE

	times_to_get_stat_modifiers = 2 //two prefixes

/mob/living/carbon/superior/human/voidwolf/captain/New()
	..()
	reload_message = "[name] ejects a depleted cell and rapidly reloads a new one with one hand!"

/mob/living/carbon/superior/human/voidwolf/captain/movement_tech()
	moved = TRUE
	if(!weakened && stat == CONSCIOUS)
		attemptAttackOnTarget()
