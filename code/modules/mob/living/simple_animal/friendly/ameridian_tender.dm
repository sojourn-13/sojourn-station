// Colony-made golem. Smol, cute & friendly.
// It doesn't do any damage, but doesn't get attacked by golems.

/mob/living/simple_animal/ameridian_tender
	name = "ameridian tender"
	desc = "A weird creature made of ameridian"
	icon = 'icons/obj/ameridian.dmi'
	icon_state = "golem_ameridian_purple" // Sprite from Eris, I don't know who made them. -R4d6
	faction = "ameridian"
	attacktext = "smacked"
	mob_size = MOB_SMALL
	speak_chance = 0
	hunger_enabled = FALSE
	turns_per_move = 3
	move_to_delay = 10
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "whacks"
	friendly = "nuzzles"
	leather_amount = 0
	bones_amount = 0
	colony_friend = TRUE // We are fren
	friendly_to_colony = TRUE
	universal_speak = FALSE
	universal_understand = TRUE

	needs_environment = FALSE

	light_range = 1
	light_color = COLOR_LIGHTING_GREEN_BRIGHT
	mob_classification = CLASSIFICATION_SYNTHETIC
	mob_bump_flag = ALLMOBS
	mob_swap_flags = ALLMOBS
	mob_push_flags = ALLMOBS

	armor = list(melee = 5, bullet = 5, energy = 5, bomb = 0, bio = 100, rad = 100) // Fragile fren

	attack_sound = 'sound/weapons/heavysmash.ogg' //So we dont make bite sounds

	maxHealth = 125 //Lets not die to a single roach bit
	health = 125 //Most things deal 40 at a time
	melee_damage_lower = 5
	melee_damage_upper = 10
	var/obj/structure/ameridian_crystal/target_crystal
	var/spread_threshold = 3 // How many crystals need to be near a mature crystal for it to be available to harvest?

/mob/living/simple_animal/ameridian_tender/New()
	..()
	update_icons()

/mob/living/simple_animal/ameridian_tender/update_icons()
	..()
	transform = initial(transform)
	transform *= 0.5

/mob/living/simple_animal/ameridian_tender/death()
	..()

/mob/living/simple_animal/ameridian_tender/Life()
	if(..())
		tend_crystal()

// Harvest nearby crystals
/mob/living/simple_animal/ameridian_tender/proc/tend_crystal()
	if(target_crystal?.loc == null) // The crystal is in nullspace
		target_crystal = null

	if(!target_crystal)
		get_target_crystal()
		if(!target_crystal) // Still no nearby crystal
			return

	// We got a crystal, but it is too far away, go toward it.
	if(get_dist(get_turf(src), get_turf(target_crystal)) > 1)
		walk_to(src, target_crystal, 1, move_to_delay)
		return

	// We got a crystal, and it is right next to us.
	if(is_crystal_ready(target_crystal)) // Safety check
		target_crystal.harvest_crystals()
		target_crystal = null
	else // The crystal wasn't ready yet.
		target_crystal = null

// Look around for crystals that are ready to harvest
/mob/living/simple_animal/ameridian_tender/proc/get_target_crystal()
	for(var/obj/structure/ameridian_crystal/AC in view(scan_range, src))
		if(istype(AC, /obj/structure/ameridian_crystal/spire))
			continue

		if(is_crystal_ready(AC))
			target_crystal = AC
			break

// Check if the crystal is mature and has spread
/mob/living/simple_animal/ameridian_tender/proc/is_crystal_ready(var/obj/structure/ameridian_crystal/AC)
	if(AC?.growth == AC?.max_growth)
		var/num_crystal = 0
		for(var/obj/structure/ameridian_crystal/Crystal in orange(AC.spread_range, AC))
			if(Crystal == AC)
				continue
			else
				num_crystal++

		if(num_crystal >= spread_threshold)
			return TRUE
	return FALSE
