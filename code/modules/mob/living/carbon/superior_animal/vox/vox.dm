/mob/living/carbon/superior_animal/vox
	name = "Matasa sojoji"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects."
	icon_state = "vox_marsmud"
	icon = 'icons/mob/mobs-voxy.dmi'

	maxHealth = 50 * VOXBIRD_HEALTH_MOD
	health = 50 * VOXBIRD_HEALTH_MOD

	faction = "vox_tribe" //In case of different tribes
	turns_per_move = 5
	see_in_dark = 10
	speak_emote = list("grumbles")
	emote_see = list("looks around for a target.")
	attacktext = "claws"
	meat_amount = 4
	meat_type = /obj/item/reagent_containers/food/snacks/meat/chicken/vox
	mob_size = MOB_MEDIUM
	can_burrow = FALSE
	randpixel = 0
	deathmessage = "slumps down and seems to no longer move!"
	attack_sound = 'sound/weapons/slash.ogg'

	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/wolf_tooth)

	armor = list(melee = 2, bullet = 1, energy = 0, bomb = 20, bio = 20, rad = 0)

	get_stat_modifier = TRUE

	melee_sharp = TRUE //Claws
	armor_divisor = 1.25

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

	fire_verb = "flings a rock"

	melee_damage_lower = 12
	melee_damage_upper = 16

	colony_friend = FALSE
	friendly_to_colony = FALSE

	projectiletype = /obj/item/projectile/bullet/rock
	limited_ammo = TRUE
	mag_drop = FALSE
	ranged = TRUE
	rounds_left = 1
	mag_type = /obj/item/stack/ore
	mags_left = 6 //each vox has 6 rocks normally
	rounds_per_fire = 1
	reload_message = "picks up a rock!"
	range_telegraph = "starts to spin their sling around, orienting it towards"
	bones_amount = 1
	var/knock_over_odds = 5
	inherent_mutations = list(MUTATION_BLOOD_BANK)
