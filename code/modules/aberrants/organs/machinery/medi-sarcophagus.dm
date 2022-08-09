/obj/machinery/sleeper/sarcophagus
	name = "medi-sarcophagus"
	icon = 'icons/obj/medisarcophagus.dmi'
	icon_state = "sarcophagus_0"
	desc = "A fancy bed with built-in injectors, a dialysis machine, and a limited health scanner. It looks like it needs to be pried open."
	var/horror_occupant = null
	var/mob_count = 1

	// Internal
	var/preset_direction = FALSE

/obj/machinery/sleeper/sarcophagus/Initialize()
	. = ..()
	if(!preset_direction)
		set_dir(pick(NORTH, EAST, WEST))

	available_chemicals = list("inaprovaline2" = "Synth-Inaprovaline", "anti_toxin" = "Dylovene")

	if(prob(75))
		available_chemicals |= list("paracetamol" = "Paracetamol")
	if(prob(75))
		available_chemicals |= list("polystem" = "Polystem")

	if(prob(50))
		available_chemicals |= pick(list(list("bicaridine" = "Bicaridine"), list("toxin" = "Bicaridone"), list("mold" = "Bicarizine")))
	if(prob(50))
		available_chemicals |= pick(list(list("dermaline" = "Dermaline"), list("toxin" = "Dermazine"), list("mold" = "Dermalyne")))
	if(prob(50))
		available_chemicals |= pick(list(list("tramadol" = "Tramadol"), list("toxin" = "Tramadone"), list("mold" = "Tramamol")))
	if(prob(50))
		available_chemicals |= pick(list(list("hyronalin" = "Hyronalin"), list("toxin" = "Hyronaline"), list("mold" = "Hyronalyne")))

	if(prob(25))
		available_chemicals |= pick(list(list("oxycodone" = "Oxycodone"), list("toxin" = "Oxycodol"), list("mold" = "Oxycodine")))

	if(prob(5))
		available_chemicals |= pick(list(list("meralyne" = "Meralyne"), list("toxin" = "Meraline"), list("mold" = "Meradine")))
	if(prob(5))
		available_chemicals |= pick(list(list("rezadone" = "Rezadone"), list("toxin" = "Rezadine"), list("mold" = "Rezaline")))

	if(prob(1))
		available_chemicals |= list("ossisine" = "Ossisine")
	if(prob(1))
		available_chemicals |= list("kyphotorin" = "Kyphotorin")

/obj/machinery/sleeper/sarcophagus/update_icon()
	var/is_occupied = horror_occupant || occupant ? 1 : 0
	icon_state = "sarcophagus_[num2text(is_occupied)]"
	set_light(1.4, is_occupied, COLOR_LIGHTING_RED_DARK)

/obj/machinery/sleeper/sarcophagus/go_in(mob/M, mob/user)
	if(horror_occupant)
		to_chat(user, SPAN_WARNING("\The [src] is already occupied."))
		return
	. = ..()

/obj/machinery/sleeper/sarcophagus/go_out()
	if(horror_occupant)
		desc = "A fancy bed with built-in injectors, a dialysis machine, and a limited health scanner."

		for(var/count in 1 to mob_count)
			new horror_occupant(src.loc)

		horror_occupant = null

		update_use_power(1)
		update_icon()
		toggle_filter()

		return
	. = ..()

/obj/machinery/sleeper/sarcophagus/attackby(obj/item/I, mob/user)
	if(..())
		return
	if(istool(I) && horror_occupant)
		var/obj/item/tool/T = I
		if(T.has_quality(QUALITY_PRYING))
			user.visible_message(SPAN_NOTICE("[user] starts opening the [src]. Something stirs within the [src]..."), SPAN_NOTICE("You start opening \the [src]. Something stirs within the [src]..."))
			if(!I.use_tool(user = user, target =  src, base_time = WORKTIME_NORMAL, required_quality = QUALITY_PRYING, fail_chance = FAILCHANCE_NORMAL, required_stat = STAT_ROB, forced_sound = WORKSOUND_EASY_CROWBAR))
				return
			go_out()

/obj/machinery/sleeper/sarcophagus/abomination
	horror_occupant = /obj/random/mob/sarcophagus

// To be placed on the map
/obj/machinery/sleeper/sarcophagus/random
	preset_direction = TRUE

/obj/machinery/sleeper/sarcophagus/random/Initialize()
	. = ..()
	if(prob(50))
		horror_occupant = /obj/random/mob/sarcophagus
	else
		horror_occupant = null
		desc = "A fancy bed with built-in injectors, a dialysis machine, and a limited health scanner."

	update_icon()

/obj/random/mob/sarcophagus
	name = "random hivemob"

/obj/random/mob/sarcophagus/item_to_spawn() //list of spawnable mobs
	return pickweight(list(/mob/living/simple_animal/hostile/hivemind/himan = 10,
							/mob/living/simple_animal/hostile/hivemind/stinger = 8,
							/mob/living/simple_animal/hostile/hivemind/lobber = 6,
							/mob/living/simple_animal/hostile/hivemind/phaser = 4,
							/mob/living/simple_animal/hostile/hivemind/hiborg = 2,
							/mob/living/simple_animal/hostile/hivemind/mechiver = 1))
