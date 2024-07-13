/mob/living/carbon/superior_animal/vox/wasp
	name = "Jungle wasp"
	desc = " A mostly normal wasp save for its extensive growth due to alteration by the anomalous planet itself. Its stinger is sharp and filled with painful toxins."
	icon_state = "masterbee"
	icon = 'icons/mob/mobs-voxy.dmi'

	maxHealth = 75
	health = 75

	faction = "vox_tribe" //In case of different tribes
	turns_per_move = 2
	move_to_delay = 2
	see_in_dark = 10
	speak_emote = list("grumbles")
	emote_see = list("looks around for a target.")
	attacktext = "stings"
	meat_amount = 4
	meat_type = /obj/item/reagent_containers/food/snacks/meat
	mob_size = MOB_MEDIUM
	can_burrow = FALSE
	randpixel = 0
	deathmessage = "falls from the sky curling up into a ball before laying flat!"
	attack_sound = 'sound/weapons/slash.ogg'
	var/dropped_goods = FALSE //so you can't revive and kill the same wasp for goodies

	ranged = FALSE

	has_special_parts = FALSE

	armor = list(melee = 2, bullet = 3, energy = 1, bomb = 20, bio = 20, rad = 0)

	get_stat_modifier = TRUE

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/armor/mult/positive/low = 15,
		/datum/stat_modifier/mob/living/carbon/superior_animal/armor/mult/negative/low = 15,
		/datum/stat_modifier/mob/living/carbon/superior_animal/young = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/old = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutish = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutal = 3,
		/datum/stat_modifier/mob/living/carbon/superior_animal/deadeye = 6,
		/datum/stat_modifier/mob/living/carbon/superior_animal/quickdraw = 5,
		/datum/stat_modifier/mob/living/speed/flat/positive/low = 5,
		/datum/stat_modifier/mob/living/speed/flat/negative/low = 5,
	)

	fire_verb = "flings a sharp stinger shard"

	melee_damage_lower = 12
	melee_damage_upper = 16

	mag_type = /obj/item/stack/ore
	mags_left = 6 //each vox has 6 rocks normally
	rounds_per_fire = 1
	reload_message = "perpares fling a sting!"
	range_telegraph = "starts to push out its stinger, orienting it towards "
	bones_amount = 0
	inherent_mutations = list(MUTATION_BLOOD_BANK, MUTATION_SEASONED_MIND, MUTATION_SHOCK_LESS)
	var/poison_per_bite = 3
	var/poison_type = "wasp_toxin"

/mob/living/carbon/superior_animal/vox/wasp/UnarmedAttack(atom/A, proximity)
	. = ..()
	if(!.)
		return

	if(poison_per_bite > 0)

		if(isliving(A))
			var/mob/living/L = A
			if(istype(L) && L.reagents)
				var/zone_armor =  L.getarmor(targeted_organ, ARMOR_MELEE)
				var/poison_injected = zone_armor ? poison_per_bite * (-0.01 * zone_armor + 1) : poison_per_bite
				L.reagents.add_reagent(poison_type, poison_injected)

/mob/living/carbon/superior_animal/vox/wasp/death(message = deathmessage)
	..()
	if(!dropped_goods)
		dropped_goods = TRUE
		var/nb_goods = rand(1, 3)
		for(var/i in 1 to nb_goods)
			new /obj/item/stack/wax(loc)
