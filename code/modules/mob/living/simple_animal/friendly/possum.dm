// The poss itself.
/mob/living/simple_animal/opossum
	name = "opossum"
	real_name = "opossum"
	desc = "It's an opossum, a small scavenging marsupial."
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "possum"
	speak_emote = list("hisses")
	pass_flags = PASSTABLE
	see_in_dark = 6
	maxHealth = 50
	health = 50
	density = FALSE
	mob_size = MOB_SMALL
	inherent_mutations = list(MUTATION_NEARSIGHTED, MUTATION_SCREAMING, MUTATION_TOURETTES, MUTATION_THICK_FUR)
	colony_friend = TRUE
	friendly_to_colony = TRUE

	var/is_angry = FALSE
	var/play_dead_until = 0
	var/be_angery_until = 0

/mob/living/simple_animal/opossum/adjustBruteLoss(var/amount,var/include_robo)
	. = ..()
	if(amount >= 3)
		respond_to_damage()

/mob/living/simple_animal/opossum/adjustFireLoss(var/amount,var/include_robo)
	. = ..()
	if(amount >= 3)
		respond_to_damage()

/mob/living/simple_animal/opossum/lay_down()
	. = ..()
	update_icon()

/mob/living/simple_animal/opossum/Process()
	..()
	if(world.time > be_angery_until && is_angry)
		is_angry = FALSE
	if(world.time > play_dead_until)
		resting = FALSE
	update_icon()

/mob/living/simple_animal/opossum/proc/respond_to_damage()
	if(!resting && stat == CONSCIOUS)
		if(!is_angry)
			visible_message("<b>\The [src]</b> hisses!")
			is_angry = TRUE
			be_angery_until = world.time + rand(30 SECONDS, 1 MINUTE)
		else
			visible_message("<b>\The [src]</b> dies!")
			resting = TRUE
			play_dead_until = world.time + rand(1 MINUTE, 2 MINUTES)
		update_icon()

/mob/living/simple_animal/opossum/update_icon()
	icon_state = initial(icon_state)
	if(stat == DEAD || (resting && is_angry))
		icon_state = "[icon_state]_dead"
	else if(resting || stat == UNCONSCIOUS)
		icon_state = "[icon_state]_sleep"
	else if(is_angry)
		icon_state = "[icon_state]_aaa"


/mob/living/simple_animal/opossum/poppy
	name = "Poppy the Safety Possum"
	desc = "It's an opossum, a small scavenging marsupial. It's wearing appropriate personal protective equipment, though."
	icon_state = "poppy"
	sanity_damage = -1

	var/list/aaa_words = list(
		"delaminat",
		"meteor",
		"fire",
		"breach",
		"loose",
		"level 7",
		"level seven",
		"biohazard",
		"blob",
		"vine"
	)

/mob/living/simple_animal/opossum/poppy/on_hear_say(mob/living/speaker, message)
	message = lowertext(message)
	for(var/aaa in aaa_words)
		if(findtext(message, aaa))
			respond_to_damage()
			return
	..()
