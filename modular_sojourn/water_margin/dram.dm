/obj/item/culivation_dram
	name = "Culivated Dram"
	desc = "A small vial full of a liquid that has processed though C-3 Theorium."
	icon = 'modular_sojourn/bolus_icons.dmi'
	icon_state = "dram"
	w_class = ITEM_SIZE_SMALL

	var/damage_fire = 0
	var/damage_brute = 0

	var/sanity_max_level_editor = 20
	var/sanity_level_change_cap_editor = -0.1
	var/insight_passive_gain_multiplier_editor = -0.005
	var/insight_rest_threshold_editor = 0 // this is a bad thing to gain

	var/free_processes = 3

	var/internal_code = "I like pancakes."
	var/external_code = "So you hate waffles?"
	var/code_langth //What about crepe?

/obj/item/culivation_dram/Initialize()
	. = ..()
	generate_internal_code()

/obj/item/culivation_dram/proc/generate_internal_code()
	code_langth = rand(9, 15)
	var/current_langth = 0
	external_code = ""
	internal_code = ""

	while(code_langth > current_langth)
		current_langth += 1
		external_code += pick(span_green("▌"), span_red("▌"), span_blue("▌"), span_purple("▌"))

/obj/item/culivation_dram/proc/exstend_internal_code(var/num)
	var/code_added = 0

	while(code_added < num)
		code_added += 1
		external_code += pick(span_green("▌"), span_red("▌"), span_blue("▌"), span_purple("▌"))

/obj/item/culivation_dram/examine(mob/user)
	..()

	var/message = "Code-To-Match: <span class='bold'>[external_code]</span>.\n"

	if(internal_code)
		message += "Internal Code: <span class='bold'>[internal_code]</span>.\n"

	if(free_processes > 0)
		message += "Processes before Side-Affects: [free_processes].\n"

	if(0 > free_processes)
		message += "Processes with Side-Affects: [free_processes].\n"


	if(damage_brute || damage_fire)
		message += "Current Lethality value: [damage_brute + damage_fire].\n"


	to_chat(user, "[message]")

/obj/item/bolus/attack_self(mob/user as mob)
	..()
	check(user)

//So that we can nom it by attacking areselfs
/obj/item/culivation_dram/attack(mob/M as mob, mob/user as mob, def_zone)
	if(M == user)
		check(user)
		return
	..()

/obj/item/culivation_dram/proc/nom(mob/user)
	if(isliving(user))
		if(internal_code == external_code)
			var/mob/living/carbon/human/H = user
			H.sanity.change_max_level(sanity_max_level_editor)
			H.sanity.insight_rest_threshold += insight_rest_threshold_editor
			to_chat(user, SPAN_NOTICE("The dram goes down smoothly allowing a breakthough in emotional stablization."))

			if(damage_fire + damage_brute > 20)
				to_chat(user, SPAN_NOTICE("After a moment the dram starts to burn your insides well also rapidly expanding your blood vessels!"))

			if(0 >= free_processes)
				H.apply_damage(damage_brute, BRUTE)
				H.apply_damage(damage_fire, BURN)

			H.sanity.level_change_cap += sanity_level_change_cap_editor
			H.sanity.insight_passive_gain_multiplier += insight_passive_gain_multiplier_editor

		else
			to_chat(user, SPAN_NOTICE("After slowly consuming the dram nothing happens."))

	qdel(src)

/obj/item/culivation_dram/proc/check(mob/user)
	if(isliving(user))
		var/mob/living/L = user

		//Dead cant eat a dram
		if(L.stat == DEAD)
			return

		//Small check for humans to prevent eating through masks
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			var/obj/item/blocked = H.check_mouth_coverage()
			if(blocked)
				to_chat(H, SPAN_WARNING("\The [blocked] is in the way!"))
				return

		nom(user)
		return

	to_chat(user, SPAN_NOTICE("Only living things can drink a dram."))
