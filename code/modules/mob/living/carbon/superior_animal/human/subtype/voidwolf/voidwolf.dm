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
	var/block_chance = FALSE

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
		ranged = TRUE

/mob/living/carbon/superior_animal/human/voidwolf/emergency
	name = "Void Wolf Emergenecy Trooper"
	desc = "A Void Wolf mercenary in an emergency corps uniform. Teleported into the hell by order of a field officer, and ready to stand up against all the horrors of this world!"
	icon_state = "voidwolfemergenecy_melee"
	icon_dead = "voidwolfemergenecy_dead"
	melee_damage_lower = 35
	melee_damage_upper = 50
	maxHealth = 250 * VOIDWOLF_HEALTH_MOD
	health = 250 * VOIDWOLF_HEALTH_MOD
	attacktext = "slashed"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	drop_items = list()
	melee_sharp = TRUE
	armor_divisor = 4
	melee_damage_type = BRUTE
	meat_amount = 0
	block_chance = 75
	flash_resistances = FLASH_PROTECTION_MODERATE
	var/eye_safety = 1
	var/ear_safety = 1
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure

	armor = list(melee = 5, bullet = 7, energy = 7, bomb = 50, bio = 100, rad = 50)

/mob/living/carbon/superior_animal/human/voidwolf/emergency/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(prob(block_chance) || moved)
		moved = FALSE
		visible_message("\red \b [src] blocks the [O]!")
		return
	..()

/mob/living/carbon/superior_animal/human/voidwolf/emergency/bullet_act(var/obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(block_chance))
		..()
	else if (!(Proj.testing))
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(3, 1, src)
		s.start()
		visible_message("\red <B>[src] blocks [Proj] with its shield!</B>")
	return TRUE

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

/mob/living/carbon/superior_animal/human/voidwolf/miner
	name = "Void Wolf Miner"
	desc = "A Void Wolf mercenary equipped with a sharp pickaxe. Genetically modified to work more productively underground."
	melee_damage_lower = 25
	melee_damage_upper = 30
	maxHealth = 175
	health = 175
	icon_state = "voidminer_pickage"
	icon_dead = "voidengie_dead"
	attacktext = list("hit", "pierced", "sliced", "attacked")
	attack_sound = 'sound/weapons/bladeslice.ogg'
	drop_items = list(/obj/item/tool/pickaxe)
	armor_divisor = 4

/mob/living/carbon/superior_animal/human/voidwolf/miner/death()
	..()
	/obj/random/material_ore
	/obj/random/material_ore_small
	/obj/random/material_ore/low_chance
	drop_death_loot()

/mob/living/carbon/superior_animal/human/voidwolf/miner/Initialize()
	..()
	if(prob(50))
		icon_state = "voidminer"
		desc = "A Void Wolf mercenary equipped with a big mining drill. Genetically modified to work more productively underground."
		maxHealth = 200
		health = 200
		drop_items = list(/obj/item/tool/pickaxe/drill)
		melee_damage_lower = 30
		melee_damage_upper = 35
		armor_divisor = 3
		delay_for_melee = 0.5

/mob/living/carbon/superior_animal/human/voidwolf/heavy
	name = "Void Wolf Heavy Trooper"
	desc = "Heavy"
	icon = 'icons/mob/64x64.dmi'
	icon_state = "voidheavy_new"
	icon_living = "voidheavy"
	icon_dead = null
	default_pixel_x = -16
	mob_size =  3
	environment_smash = 2
	break_stuff_probability = 95
	flash_resistances = 100
	stop_automated_movement_when_pulled = 0
	speak_chance = 20
	maxHealth = 750
	health = 750
	var/healing_factor = 15
	melee_damage_lower = 60
	melee_damage_upper = 75
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "smashes"
	attack_sound = 'sound/effects/bang.ogg'
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0
	fire_verb = "fires"
	faction = "pirate"
	flash_resistances = FLASH_PROTECTION_MODERATE
	move_to_delay = 3
	var/knockdown_odds = 5
	var/affects_chaos = FALSE
	var/transform_ed = FALSE
	react_to_attack = TRUE
	target_out_of_sight_mode = GUESS_LOCATION_WITH_END_OF_LINE
	out_of_sight_turf_LOS_check = TRUE
	turns_per_move = 10
	turns_since_move = 0
	wander = 1

	light_range = 4
	light_color = "#53377A"

	target_telegraph = "fumbles to ready their weapon, preparing to engage"
	rush_target_telegraph = "quickly snaps their aim toward"

	armor = list(melee = 20, bullet = 30, energy = 30, bomb = 80, bio = 100, rad = 80) //Legitmently their armor

	get_stat_modifier = TRUE

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/durable = 10,
		/datum/stat_modifier/health/flat/positive/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/old = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutish = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutal = 15,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive/savage = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/triggerfinger = 15,
		/datum/stat_modifier/mob/living/carbon/superior_animal/quickdraw = 10,
	)

//Drops
	meat_amount = 0
	meat_type = null

	drop_items = list()

/mob/living/carbon/superior_animal/human/voidwolf/heavy/death(gibbed, deathmessage = "drops its weapon as it explodes in a shower of gore when their death implant detonates!")
	..()
	icon_state = "voidheavy_dead"
	sleep(9)
	new /obj/effect/gibspawner/human(src.loc)
	new /obj/effect/gibspawner/human(src.loc)
	new /obj/effect/gibspawner/human(src.loc)
	playsound(src, 'sound/effects/Explosion2.ogg', 75, 1, -3)
	drop_death_loot()
	qdel(src)
	return


/mob/living/carbon/superior_animal/human/voidwolf/heavy/start_pulling(var/atom/movable/AM)
	to_chat(src, SPAN_WARNING("Your hand gets pushed away from \the [src]. !"))
	return

/mob/living/carbon/superior_animal/human/voidwolf/captain/high/New()
	..()
	for(var/mob/M in range(10, src))
		if(!M.stat && !isAI(M))
			shake_camera(M, 3, 1)

/mob/living/carbon/superior_animal/human/voidwolf/heavy/emp_act(severity)
	..()
	if(rapid)
		rapid = FALSE
	if(prob(95) && ranged)
		ranged = FALSE

/mob/living/carbon/superior_animal/human/voidwolf/heavy/Bump(var/atom/obstacle)
	.=..()
	if(iscarbon(obstacle))
		var/mob/living/carbon/J = obstacle
		J.take_organ_damage(3)
		say(pick("RHAAAA!", "ROARHR-R-R!", "GHRA-A-AR-RH!"))
		J.throw_at(get_edge_target_turf(src,pick(alldirs)),rand(3,6),30)

/mob/living/carbon/superior_animal/human/voidwolf/heavy/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(knockdown_odds))
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			else
				L.Weaken(2)
				L.visible_message(SPAN_DANGER("\the [src] uses its mass to knock over \the [L]!"))
	. = ..()

/mob/living/carbon/superior_animal/human/voidwolf/heavy/slip()
	return FALSE
// Can't slip

/mob/living/carbon/superior_animal/human/voidwolf/heavy/start_pulling(var/atom/movable/AM)
	to_chat(src, SPAN_WARNING("Your hand gets stopped preventing you from pulling \the [src]. !"))
	return

//ARMED HEAVY TROOPS

/mob/living/carbon/superior_animal/human/voidwolf/heavy/breacher
	name = "Void Wolf Heavy Breacher"
	desc = "A Void Wolf mercenary in an emergency corps uniform. Teleported into the hell by order of a field officer, and ready to stand up against all the horrors of this world!"
	icon_state = "voidheavy_hammershield"
	icon_dead = "voidheavy_dead"
	melee_damage_lower = 30 //One arm attack.
	melee_damage_upper = 45 //One arm attack.
	maxHealth = 860
	health = 860
	attacktext = "crushed"
	attack_sound = 'sound/effects/bang.ogg'
	drop_items = list()
	melee_sharp = FALSE
	armor_divisor = 4
	melee_damage_type = BRUTE
	meat_amount = 0
	turns_per_move = 4
	move_to_delay = 8
	block_chance = 50

	armor = list(melee = 20, bullet = 50, energy = 60, bomb = 80, bio = 100, rad = 80)

/mob/living/carbon/superior_animal/human/voidwolf/heavy/breacher/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(prob(block_chance) || moved)
		icon_state = "voidheavy_hammershield_blocked"
		moved = FALSE
		visible_message("\red \b [src] blocks the [O]!")
		armor = list(melee = 40, bullet = 60, energy = 70, bomb = 100, bio = 100, rad = 80)
		sleep(3 SECOND)
		icon_state = "voidheavy_hammershield"
		armor = list(melee = 20, bullet = 50, energy = 60, bomb = 80, bio = 100, rad = 80)
		return
	..()

/mob/living/carbon/superior_animal/human/voidwolf/heavy/breacher/bullet_act(var/obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(block_chance))
		..()
	else if (!(Proj.testing))
		icon_state = "voidheavy_hammershield_blocked"
		moved = FALSE
		visible_message("\red <B>[src] blocks [Proj] with its shield!</B>")
		armor = list(melee = 40, bullet = 60, energy = 70, bomb = 100, bio = 100, rad = 80)
		sleep(3 SECOND)
		icon_state = "voidheavy_hammershield"
		armor = list(melee = 20, bullet = 50, energy = 60, bomb = 80, bio = 100, rad = 80)
	return TRUE

/mob/living/carbon/superior_animal/human/voidwolf/heavy/breacher/Life()
	. = ..()
	if(health <= (maxHealth * 0.5) && transform_ed == FALSE)
		icon_state = "voidheavy_hammer"
		icon_living = "voidheavy_hammer"
		icon_dead = "voidheavy_dead"
		armor = list(melee = 10, bullet = 20, energy = 5, bomb = 20, bio = 100, rad = 100)
		block_chance = 0
		environment_smash = 2
		break_stuff_probability = 100
		knockdown_odds = 50
		healing_factor = 15
		melee_damage_lower = 60
		melee_damage_upper = 75
		move_to_delay -= 4
		turns_per_move += 2
		transform_ed = TRUE
		ear_damage = 1
		eye_blind = 1
		additional_darksight = 3
		delay_for_melee -= 1 SECONDS

/mob/living/carbon/superior_animal/human/voidwolf/heavy/breacher/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(knockdown_odds))
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			else
				L.Weaken(2)
				L.visible_message(SPAN_DANGER("\the [src] uses the mass of his weapon to knock over \the [L]!"))
	. = ..()

/mob/living/carbon/superior_animal/human/voidwolf/heavy/gunner
	name = "Void Wolf Heavy Gunner"
	desc = "A Void Wolf mercenary in an emergency corps uniform. Teleported into the hell by order of a field officer, and ready to stand up against all the horrors of this world!"
	icon_state = "voidheavy_gunner"
	icon_dead = "voidheavy_dead"
	melee_damage_lower = 30 //One arm attack.
	melee_damage_upper = 45 //One arm attack.
	maxHealth = 860
	health = 860
	attacktext = "crushed"
	attack_sound = 'sound/effects/bang.ogg'
	drop_items = list()
	ranged = TRUE
	rapid = TRUE
	limited_ammo = TRUE
	comfy_range = 1
	mags_left = 1 //One mags.
	ranged_cooldown = 0.5
	delay_for_rapid_range = 1
	rounds_left = 80 //Only two. 80 bullets.
	rapid_fire_shooting_amount = 40 //DAKKA DAKKA DAKKA!
	initial_firing_offset = 15 //Suppressed fire!
	current_firing_offset = 20 //Suppressed fire!
	projectiletype = /obj/item/projectile/bullet/pistol_35/hv
	casingtype = /obj/item/ammo_casing/pistol_35/spent/hv
	melee_sharp = FALSE
	armor_divisor = 4
	melee_damage_type = BRUTE
	meat_amount = 0
	turns_per_move = 4
	move_to_delay = 8
	block_chance = 20

	armor = list(melee = 10, bullet = 50, energy = 60, bomb = 80, bio = 100, rad = 80)

/mob/living/carbon/superior_animal/human/voidwolf/heavy/gunner/attackby(var/obj/item/O as obj, var/mob/user as mob)
	..()

/mob/living/carbon/superior_animal/human/voidwolf/heavy/gunner/bullet_act(var/obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(block_chance))
		..()
	else if (!(Proj.testing))
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(3, 1, src)
		s.start()
		visible_message("\red <B>[src] blocks [Proj] with its shield on his weapon!</B>")
	return TRUE

/mob/living/carbon/superior_animal/human/stranger/right_before_firing()
	flick("voidheavy_gunner_Fire",src)
	sleep(40 SECOND)
	..()

/mob/living/carbon/superior_animal/human/voidwolf/heavy/gunner/Life()
	. = ..()
	if(mags_left == 0 && transform_ed == FALSE)
		sleep(45 SECOND)
		icon_state = "voidheavy_gunner_change"
		sleep(10)
		icon_living = "voidheavy"
		icon_dead = "voidheavy_dead"
		armor = list(melee = 0, bullet = 15, energy = 5, bomb = 100, bio = 100, rad = 100)
		environment_smash = 2
		break_stuff_probability = 100
		knockdown_odds = 50
		healing_factor = 15
		melee_damage_lower = 10
		melee_damage_upper = 60
		move_to_delay = 1
		ranged = FALSE
		transform_ed = TRUE
		ranged_cooldown = 30
		ear_damage = 1
		eye_blind = 1
		additional_darksight = 3
		delay_for_melee -= 1 SECONDS

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

/mob/living/carbon/superior_animal/human/voidwolf/ranged/emergency
	name = "Void Wolf Emergenecy Trooper"
	desc = "A Void Wolf mercenary in an emergency corps uniform. Teleported into the hell by order of a field officer, and ready to stand up against all the horrors of this world!"
	icon_state = "voidwolfemergenecy"
	icon_dead = "voidwolfemergenecy_dead"
	melee_damage_lower = 35
	melee_damage_upper = 40
	maxHealth = 200 * VOIDWOLF_HEALTH_MOD
	health = 200 * VOIDWOLF_HEALTH_MOD
	attacktext = "slashed"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	projectilesound = 'sound/weapons/energy/laser.ogg'
	drop_items = list()
	armor_divisor = 4
	melee_damage_type = BRUTE
	meat_amount = 0
	block_chance = FALSE
	ranged = TRUE
	rapid = TRUE
	rapid_fire_shooting_amount = 4
	ranged_cooldown = 2
	projectiletype = /obj/item/projectile/beam/voidwolf
	drop_items = list()
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 16
	mag_type = /obj/item/cell/medium/high/depleted
	mags_left = 1
	melee_sharp = FALSE
	armor_divisor = 1
	flash_resistances = FLASH_PROTECTION_MODERATE
	var/eye_safety = 1
	var/ear_safety = 1
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure

	armor = list(melee = 3, bullet = 4, energy = 4, bomb = 50, bio = 100, rad = 50)

/mob/living/carbon/superior_animal/human/voidwolf/ranged/emergency/OpenFire(target_mob)
	if(prob(20))
		sleep(4 SECOND)
		icon_state = "voidwolfemergenecy_change"
		icon_living = "voidwolfemergenecy_change"
		maxHealth += 50
		health += 50
		block_chance = 75
		melee_sharp = TRUE
		melee_damage_upper = 50
		ranged = FALSE
		armor_divisor = 3
		armor = list(melee = 5, bullet = 7, energy = 7, bomb = 50, bio = 100, rad = 50)
	..()

/mob/living/carbon/superior_animal/human/voidwolf/ranged/emergency/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(prob(block_chance) || moved)
		moved = FALSE
		visible_message("\red \b [src] blocks the [O]!")
		return
	..()

/mob/living/carbon/superior_animal/human/voidwolf/ranged/emergency/bullet_act(var/obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(block_chance))
		..()
	else if (!(Proj.testing))
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(3, 1, src)
		s.start()
		visible_message("\red <B>[src] blocks [Proj] with its shield!</B>")
	return TRUE


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

/mob/living/carbon/superior_animal/human/voidwolf/captain/New()
	..()
	reload_message = "[name] ejects a depleted cell and rapidly reloads a new one with one hand!"

/mob/living/carbon/superior_animal/human/voidwolf/captain/movement_tech()
	moved = TRUE
	if(!weakened && stat == CONSCIOUS)
		attemptAttackOnTarget()

/mob/living/carbon/superior_animal/human/voidwolf/captain/high
	name = "Void Wolf Tactical Officer"
	desc = "MAYBE I DON'T KNOW WHAT HUMAN LOSSES AND HUMANITY ARE, BUT I KNOW THAT THIS HEIGHT WILL BE TAKEN AT ANY COST!"
	icon_state = "voidwolfcaphigh"
	icon_dead = "voidwolfcaphigh_dead"
	melee_damage_lower = 50
	melee_damage_upper = 65
	maxHealth = 250 * VOIDWOLF_HEALTH_MOD
	health = 250 * VOIDWOLF_HEALTH_MOD
	ranged_cooldown = 1
	ranged = TRUE
	rapid = FALSE
	projectiletype = /obj/item/projectile/beam/voidwolf
	drop_items = list(/obj/item/trash/material/e_sword_cutlass, /obj/item/gun/energy/gun)
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 8
	casingtype = /obj/item/ammo_casing/beam/ap/spent
	mag_type = /obj/item/ammo_magazine/speed_loader_kurtz_50
	mags_left = 1
	melee_sharp = TRUE //Rapier
	armor_divisor = 3
	move_and_attack = TRUE
	flash_resistances = FLASH_PROTECTION_MODERATE
	block_chance = 20
	var/loaded_ammo = 0
	var/eye_safety = 1
	var/ear_safety = 1
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	var/list/possible_ranged_attack = list(
		/obj/item/projectile/beam/voidwolf,
		/obj/item/projectile/grenade/throwing/voidwolf,
		/obj/item/projectile/grenade/throwing/voidwolf/smoke,
	)

	times_to_get_stat_modifiers = 2 //two prefixes

	armor = list(melee = 8, bullet = 7, energy = 7, bomb = 60, bio = 100, rad = 100)

	var/special_ability_cooldown = 30 SECONDS
	var/ability_cooldown = 30 SECONDS

/mob/living/carbon/superior_animal/human/voidwolf/captain/high/OpenFire(target_mob)
	projectiletype = pick(possible_ranged_attack)
	if(projectiletype == /obj/item/projectile/beam/voidwolf)
		rapid = TRUE
		rapid_fire_shooting_amount = 2
	if(projectiletype == /obj/item/projectile/grenade/throwing/voidwolf)
		var/obj/item/grenade/chem_grenade/teargas/vw/g1 = new /obj/item/grenade/chem_grenade/teargas/vw(target_mob)
		playsound(src, 'sound/weapons/armbomb.ogg', 30, 1, -3)
		sleep(5 SECOND)
		g1.prime()
		sleep(10)
		g1.prime()
		sleep(10)
		g1.prime()
	if(projectiletype == /obj/item/projectile/grenade/throwing/voidwolf/smoke)
		var/obj/item/grenade/smokebomb/vw_empty/g2 = new /obj/item/grenade/smokebomb/vw_empty(get_step_rand(target_mob))
		playsound(src, 'sound/weapons/armbomb.ogg', 30, 1, -3)
		sleep(5 SECOND)
		g2.prime()
		sleep(10)
		g2.prime()
		sleep(10)
		g2.prime()
	..()
	rapid = FALSE


/mob/living/carbon/superior_animal/human/voidwolf/captain/high/New()
	..()
	reload_message = "[name] ejects a depleted cell and rapidly reloads a new one with one hand!"

/mob/living/carbon/superior_animal/human/voidwolf/captain/high/movement_tech()
	moved = TRUE
	if(!weakened && stat == CONSCIOUS)
		attemptAttackOnTarget()

/mob/living/carbon/superior_animal/human/voidwolf/captain/high/Life()
	if(prob(1))
		src.visible_message("\red \icon[src] [src] shudders and shakes as some of it's damaged systems come back online.")
		adjustBruteLoss(rand(-20,-30)) //we heal fast
		adjustFireLoss(rand(-20,-30))
		if(!rapid)
			rapid = TRUE
		if(prob(95) && !ranged)
			ranged = TRUE

	. = ..()
	var/mob/living/targetted_mob = (target_mob?.resolve())

//checks if cooldown is over and is targeting mob, if so, activates special ability
	if(targetted_mob && world.time > special_ability_cooldown)
		special_ability()

//It's sets manually
/mob/living/carbon/superior_animal/human/voidwolf/captain/high/proc/special_ability()
	return

/mob/living/carbon/superior_animal/human/voidwolf/captain/high/proc/is_on_cooldown()
	if(world.time >= special_ability_cooldown)
		return FALSE
	return TRUE

/mob/living/carbon/superior_animal/human/voidwolf/captain/high/special_ability()
    //Additional solders! 2 melee. 1 ranged.
    visible_emote("whistles!")
    playsound(src, 'sound/misc/whistle_attention.ogg', 90, 1)
    var/void_elite = 0
    var/void_myrmidon = 0
    var/void_emergency = 2
    var/void_ranged_emergency = 1
    var/list/validtargets = list()
    var/target = FALSE
    if(prob(40)) //Additional solders! 2 ranged. 1 melee.
        void_ranged_emergency  = 2
        void_emergency = 1
    else if(prob(10)) //Elite! 2 ranged. 2 melee.
        void_elite = 2
        void_myrmidon = 2
    for(var/turf/simulated/floor/T in oview(2, src))
        validtargets += T

    var/spawned = 0
    for(spawned, void_elite>=spawned, spawned++)
        target = pick(validtargets)
        new /mob/living/carbon/superior_animal/human/voidwolf/elite(target)
    spawned = 0
    for(spawned, void_myrmidon>=spawned, spawned++)
        target = pick(validtargets)
        new /mob/living/carbon/superior_animal/human/voidwolf/elite/myrmidon(target)
    spawned = 0
    for(spawned, void_emergency>=spawned, spawned++)
        target = pick(validtargets)
        new /mob/living/carbon/superior_animal/human/voidwolf/emergency(target)
    spawned = 0
    for(spawned, void_ranged_emergency>=spawned, spawned++)
        target = pick(validtargets)
        new /mob/living/carbon/superior_animal/human/voidwolf/ranged/emergency(target)
    special_ability_cooldown = world.time + ability_cooldown

/mob/living/carbon/superior_animal/human/voidwolf/captain/high/attackby(var/obj/item/O as obj, var/mob/user as mob)
	.=..()
	if(prob(20))
		playsound(src, 'sound/items/whistle.ogg', 90, 1)
		new /mob/living/carbon/superior_animal/human/voidwolf/ranged/emergency(src.loc)
		visible_message("An emergency response trooper comes out of nowhere and blocks your way to the officer!")
	if(prob(block_chance) || moved)
		moved = FALSE
		visible_message("\red \b [src] blocks the [O]!")
		return
	..()


/mob/living/carbon/superior_animal/human/voidwolf/captain/high/bullet_act(var/obj/item/projectile/P)
	.=..()
	if(prob(20))
		playsound(src, 'sound/items/whistle.ogg', 90, 1)
		new /mob/living/carbon/superior_animal/human/voidwolf/emergency(src.loc)
		visible_message("An emergency response trooper comes out of nowhere and blocks your way to the officer!")
	if(!P)
		return
	if(prob(block_chance))
		..()
	else if (!(P.testing))
		visible_message("\red <B>[src] dodge [P]!</B>")
	return TRUE

/mob/living/carbon/superior_animal/human/voidwolf/ranged/sniper
	name = "Void Wolf Heavy Sniper"
	desc = "A Void Wolf mercenary wielding an Anti-material sniper rifle."
	icon_state = "voidwolfsniper"
	icon_dead = "voidwolfsniper_dead"
	projectilesound = 'sound/weapons/guns/fire/smg_fire.ogg'
	melee_damage_lower = 20
	melee_damage_upper = 25
	maxHealth = 150
	health = 150
	comfy_range = 16
	viewRange = 22
	var/vision_range = 22
	ranged = TRUE
	rapid = TRUE
	rapid_fire_shooting_amount = 8
	delay_for_rapid_range = 0.15
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/bullet/pistol_35
	drop_items = null
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 36
	mag_type = /obj/item/ammo_magazine/smg_35/empty
	casingtype = /obj/item/ammo_casing/pistol_35/spent
	mags_left = 6
	melee_sharp = FALSE
	armor_divisor = 1
	block_chance = 20

	var/special_ability_cooldown = 30 SECONDS
	var/ability_cooldown = 30 SECONDS
	var/range = 7

	armor = list(melee = 15, bullet = 13, energy = 12, bomb = 75, bio = 100, rad = 25)

/mob/living/carbon/superior_animal/human/voidwolf/ranged/sniper/proc/special_ability()
	return

/mob/living/carbon/superior_animal/human/voidwolf/ranged/sniper/proc/is_on_cooldown()
	if(world.time >= special_ability_cooldown)
		return FALSE
	return TRUE

/mob/living/carbon/superior_animal/human/voidwolf/ranged/sniper/special_ability()
	var/obj/item/grenade/smokebomb/vw_empty/g3 = new /obj/item/grenade/smokebomb/vw_empty(src)
	icon_state = "voidwolfsniper_smoke"
	playsound(src, 'sound/weapons/armbomb.ogg', 30, 1, -3)
	sleep(5 SECOND)
	g3.prime(src)
	sleep(10)
	g3.prime(src)
	sleep(10)
	g3.prime(src)
	special_ability_cooldown = world.time + ability_cooldown

/mob/living/carbon/superior_animal/human/voidwolf/ranged/sniper/OpenFire(target_mob)
	if(icon_state == "voidwolfsniper_rifle")
		sleep(2 SECOND)
		playsound(src, 'sound/weapons/guns/interact/rifle_load.ogg', 90, 1)
	if(icon_state == "voidwolfsniper_c20r")
		return

/mob/living/carbon/superior_animal/human/voidwolf/ranged/sniper/bullet_act(var/obj/item/projectile/P)
	.=..()
	if(!(P.testing))
		if(prob(50))
			sleep(5)
			icon_state = "voidwolfsniper_blink"
			var/turf/T = get_random_secure_turf_in_range(src, 2, 1)
			do_sparks(3, 0, src.loc)
			do_teleport(src, T)
			return FALSE
			sleep(1)
			mob_reload()
			update_icon()
	. = ..()

/mob/living/carbon/superior_animal/human/voidwolf/ranged/sniper/attackby(var/obj/item/O as obj, var/mob/user as mob)
	.=..()
	if(prob(block_chance) || moved)
		moved = FALSE
		visible_message("\red \b [src] blocks the [O]!")
		return
	..()

/mob/living/carbon/superior_animal/human/voidwolf/ranged/sniper/mob_reload()
	..()
	var/mob/living/targetted_mob = (target_mob?.resolve())
	if(targetted_mob)
		var/armor = targetted_mob.getarmor(null, "bullet")
		if(armor)
			armor /= 0.6 //this is are sorta default
		if((get_dist(targetted_mob, src) > range)) //+
			icon_state = "voidwolfsniper_rifle"
			projectilesound = "sound/weapons/guns/fire/AMR.ogg"
			projectiletype = /obj/item/projectile/bullet/antim
			rapid = FALSE
			ranged = 1
			rounds_left += 1
			casingtype = null
			mag_type = null
			visible_message(SPAN_DANGER("<b>[src]</b> prepare rifle!"))
			if(armor >= 7)
				projectiletype = /obj/item/projectile/bullet/antim
				visible_message(SPAN_DANGER("<b>[src]</b> loads AP shell casing in rifle!"))
				if(prob(30))
					projectiletype = /obj/item/projectile/bullet/antim/incend
					visible_message(SPAN_DANGER("<b>[src]</b> loads \"Willy Pete\" shell casing in rifle!"))
				return
			if(armor < 3)
				projectiletype = /obj/item/projectile/bullet/antim/lethal
				visible_message(SPAN_DANGER("<b>[src]</b> loads \"Red-Nose\" shell casing in rifle!"))
				if(prob(30))
					projectiletype = /obj/item/projectile/bullet/antim/incend
					visible_message(SPAN_DANGER("<b>[src]</b> loads \"Willy Pete\" shell casing in rifle!"))
				return
			return
		if((get_dist(targetted_mob, src) <= range)) //-
			icon_state = "voidwolfsniper_c20r"
			projectilesound = "sound/weapons/guns/fire/smg_fire.ogg"
			projectiletype = /obj/item/projectile/bullet/pistol_35/lethal
			casingtype = /obj/item/ammo_casing/pistol_35/spent/
			mag_type = /obj/item/ammo_magazine/smg_35/empty
			visible_message(SPAN_DANGER("<b>[src]</b> prepare SMG"))
			if(armor)
				armor /= 0.6
			if(armor >= 7)
				projectiletype = /obj/item/projectile/bullet/pistol_35/hv
				casingtype = /obj/item/ammo_casing/pistol_35/spent/hv
				visible_message(SPAN_DANGER("<b>[src]</b> loads in a HV magazine!"))
				return
			if(armor < 3)
				projectiletype = /obj/item/projectile/bullet/pistol_35/lethal
				casingtype = /obj/item/ammo_casing/pistol_35/spent/lethal
				visible_message(SPAN_DANGER("<b>[src]</b> loads in a HP magazine!"))
				return
			projectiletype = /obj/item/projectile/bullet/pistol_35
			casingtype = /obj/item/ammo_casing/pistol_35/
			return
	projectiletype = /obj/item/projectile/bullet/pistol_35
	casingtype = /obj/item/ammo_casing/pistol_35/spent
	return

/mob/living/carbon/superior_animal/human/voidwolf/ranged/sniper/findTarget()
	var/mob/living/targetted_mob = (target_mob?.resolve())
	vision_range = 25
	if(targetted_mob && world.time > special_ability_cooldown)
		special_ability()

/mob/living/carbon/superior_animal/human/voidwolf/ranged/sniper/death(gibbed, deathmessage = "drops its weapon as it explodes in a shower of gore when their death implant detonates!")
	..()
	if(prob (50))
		icon_state = "voidwolfsniper_dead"
		new /obj/effect/gibspawner/human(src.loc)
		playsound(src, 'sound/effects/Explosion2.ogg', 75, 1, -3)
		new /obj/item/gun/projectile/automatic/c20r/reaver_modded
		if(prob(33))
			new /obj/item/part/gun/grip/serb
		if(prob(33))
			new /obj/item/part/gun/barrel/antim
		return
	icon_state = "voidwolfsniper_teleport"
	sleep(20)
	qdel(src)
	return
