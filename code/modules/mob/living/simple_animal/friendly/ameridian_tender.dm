// Colony-made golem. Smol, cute & friendly.
// It doesn't do any damage, but doesn't get attacked by golems.

/mob/living/simple_animal/ameridian_tender
	name = "ameridian tender"
	desc = "An automaton powered by an ameridian core. It instinctively cares for ameridian crystals, letting them grow and spread before harvesting them. \
			Its unique nature means that it doesn't get attacked by other ameridian-based lifeform or get damaged by anti-ameridian sonic weaponry."
	icon = 'icons/obj/ameridian.dmi'
	icon_state = "tender" // Sprites by Quill#6000
	faction = "ameridian"
	attacktext = "smacked"
	mob_size = MOB_MEDIUM // Small mobs can't open doors.
	speak_chance = 0
	hunger_enabled = FALSE
	turns_per_move = 10
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
	mob_bump_flag = SIMPLE_ANIMAL
	mob_swap_flags = SIMPLE_ANIMAL
	mob_push_flags = SIMPLE_ANIMAL
	mob_always_swap = TRUE
	pass_flags = PASSTABLE
	possession_candidate = FALSE
	armor = list(melee = 5, bullet = 5, energy = 5, bomb = 0, bio = 100, rad = 100) // Fragile fren
	attack_sound = 'sound/weapons/heavysmash.ogg' //So we dont make bite sounds
	maxHealth = 125 //Lets not die to a single roach bit
	health = 125 //Most things deal 40 at a time
	melee_damage_lower = 5
	melee_damage_upper = 10
	var/obj/item/held_item = null //Storage for single item they can hold.
	var/obj/structure/ameridian_crystal/target_crystal
	var/spread_threshold = 3 // How many crystals need to be near a mature crystal for it to be available to harvest?

/mob/living/simple_animal/ameridian_tender/ghost_control
	possession_candidate = TRUE

/mob/living/simple_animal/ameridian_tender/New()
	..()
	update_icons()

/mob/living/simple_animal/ameridian_tender/update_icons()
	..()
	transform = initial(transform)
	transform *= 0.5


/mob/living/simple_animal/ameridian_tender/examine(mob/user)
	..(user)
	if(held_item)
		to_chat(user, "[src] is carrying \icon[held_item] \a [held_item].")

/mob/living/simple_animal/ameridian_tender/death()
	..()
	if(held_item) // if the tender is holding an item
		held_item.loc = src.loc
		held_item = null

/mob/living/simple_animal/ameridian_tender/Life()
	if(..() && !client)
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
		visible_emote("harvest an ameridian crystal.")
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
	if(AC?.growth >= AC?.max_growth)
		var/num_crystal = 0
		for(var/obj/structure/ameridian_crystal/Crystal in orange(AC.spread_range, AC))
			if(Crystal == AC)
				continue
			else
				num_crystal++

		if(num_crystal >= spread_threshold)
			return TRUE
	return FALSE


// Ghost stuff
/mob/living/simple_animal/ameridian_tender/UnarmedAttack(var/atom/A, var/proximity)
	if(A.Adjacent(src))
		if(istype(A, /obj/structure/ameridian_crystal) && !istype(A, /obj/structure/ameridian_crystal/spire))
			var/obj/structure/ameridian_crystal/AC = A
			if(do_after(src, 1 SECOND, AC))
				AC.harvest_crystals()
				return TRUE
			else return FALSE

		if(isitem(A) && !held_item && A.loc != src)
			var/obj/item/I = A
			if(I.w_class <= ITEM_SIZE_NORMAL)
				held_item = I
				held_item.loc = src
				visible_message(SPAN_NOTICE("[src] scoops up [held_item]."), \
								SPAN_NOTICE("You grab [held_item]."))
				return TRUE
			else
				return FALSE

		if(isturf(A) && held_item)
			visible_message(SPAN_NOTICE("[src] drops [held_item]."), \
							SPAN_NOTICE("You drop [held_item]."))
			held_item.Move(A)
			held_item = null
			return TRUE
	..()

/mob/living/simple_animal/ameridian_tender/verb/change_name()
	set name = "Change your name"
	set category = "Tender"
	set desc = "Allows you to change your name one time."

	var/new_name = sanitize_text(input(usr, "Choose your new name", "Name Choice", null) as null|text)

	if(!new_name) // We didn't choose a name
		to_chat(usr, SPAN_NOTICE("You will decide your name later."))
		return FALSE

	to_chat(usr, SPAN_NOTICE("You change your name to [new_name]."))
	SetName(new_name)
	verbs -= /mob/living/simple_animal/ameridian_tender/verb/change_name
	return TRUE

/mob/living/simple_animal/ameridian_tender/do_possession(var/mob/observer/ghost/possessor)
	. = ..()
	if(.)
		to_chat(src, SPAN_NOTICE("As an Ameridian Tender, your purpose is to cultivate and harvest & spread ameridian crystals."))
		to_chat(src, SPAN_NOTICE("Golems will not attack you, and neither will the colony's defences, \
								but that will not prevent the colony's inhabitants from destroying you."))
		to_chat(src, SPAN_NOTICE("You can harvest crystals by clicking them when next to them. Be sure to let them grow and spread to not remove your purpose, as you cannot seed more crystals."))
		to_chat(src, SPAN_NOTICE("You can also pick up one normal sized item or lower by clicking on it. You can drop it by clicking on a turf."))
		to_chat(src, SPAN_NOTICE("You can hear, but cannot talk."))

		to_chat(src, SPAN_WARNING("You can change your name once. Choose carefully."))

/mob/living/simple_animal/ameridian_tender/toggle_AI()
	set hidden = TRUE // We don't need this cluttering our screen
