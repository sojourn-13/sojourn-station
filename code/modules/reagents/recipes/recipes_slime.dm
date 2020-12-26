
/* Slime cores */

/datum/chemical_reaction/slime
	var/required = null

/datum/chemical_reaction/slime/ui_data()
	var/list/dat = ..()
	dat["required_object"] = required
	return dat

/datum/chemical_reaction/slime/can_happen(var/datum/reagents/holder)
	if(holder.my_atom && istype(holder.my_atom, required))
		var/obj/item/slime_extract/T = holder.my_atom
		if(T.Uses > 0)
			return ..()
	return 0

/datum/chemical_reaction/slime/on_reaction(var/datum/reagents/holder)
	var/obj/item/slime_extract/T = holder.my_atom
	T.Uses--
	if(T.Uses <= 0)
		T.visible_message("\icon[T]<span class='notice'>\The [T]'s power is consumed in the reaction.</span>")
		T.name = "used slime extract"
		T.desc = "This extract has been used up."

//Grey
/datum/chemical_reaction/slime/spawn
	result = null
	required_reagents = list("plasma" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/grey

/datum/chemical_reaction/slime/spawn/on_reaction(var/datum/reagents/holder)
	holder.my_atom.visible_message(SPAN_WARNING("Infused with plasma, the core begins to quiver and grow, and soon a new baby slime emerges from it!"))
	var/mob/living/carbon/slime/S = new /mob/living/carbon/slime
	S.loc = get_turf(holder.my_atom)
	..()

/datum/chemical_reaction/slime/monkey
	result = null
	required_reagents = list("blood" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/grey

/datum/chemical_reaction/slime/monkey/on_reaction(var/datum/reagents/holder)
	for(var/i = 1, i <= 3, i++)
		var /obj/item/weapon/reagent_containers/food/snacks/monkeycube/M = new /obj/item/weapon/reagent_containers/food/snacks/monkeycube
		M.loc = get_turf(holder.my_atom)
	..()

//Green
/datum/chemical_reaction/slime/mutate
	result = "mutationtoxin"
	required_reagents = list("plasma" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/green

//Metal
/datum/chemical_reaction/slime/metal
	result = null
	required_reagents = list("plasma" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/metal

/datum/chemical_reaction/slime/metal/on_reaction(var/datum/reagents/holder)
	var/obj/item/stack/material/steel/M = new /obj/item/stack/material/steel
	M.amount = 15
	M.loc = get_turf(holder.my_atom)
	var/obj/item/stack/material/plasteel/P = new /obj/item/stack/material/plasteel
	P.amount = 5
	P.loc = get_turf(holder.my_atom)
	..()

/datum/chemical_reaction/slime/metal_2
	result = null
	required_reagents = list("water" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/metal

/datum/chemical_reaction/slime/metal/on_reaction(var/datum/reagents/holder)
	var/obj/item/stack/material/steel/M = new /obj/item/stack/material/plastic
	M.amount = 15
	M.loc = get_turf(holder.my_atom)
	..()

//Gold
/datum/chemical_reaction/slime/wealth
	result = null
	required_reagents = list("plasma" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/gold

/datum/chemical_reaction/slime/wealth/on_reaction(var/datum/reagents/holder)
	var/obj/item/stack/material/steel/M = new /obj/item/stack/material/gold
	M.amount = 15
	M.loc = get_turf(holder.my_atom)
	var/obj/item/stack/material/plasteel/P = new /obj/item/stack/material/platinum
	P.amount = 5
	P.loc = get_turf(holder.my_atom)
	..()

/datum/chemical_reaction/slime/wealth_light
	result = null
	required_reagents = list("MATERIAL_URANIUM" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/gold

/datum/chemical_reaction/slime/wealth/on_reaction(var/datum/reagents/holder)
	var/obj/item/stack/material/steel/M = new /obj/item/stack/material/silver
	M.amount = 15
	M.loc = get_turf(holder.my_atom)
	var/obj/item/stack/material/plasteel/P = new /obj/item/stack/material/glass
	P.amount = 5
	P.loc = get_turf(holder.my_atom)
	..()

//Silver
/datum/chemical_reaction/slime/bork
	result = null
	required_reagents = list("plasma" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/silver

/datum/chemical_reaction/slime/bork/on_reaction(var/datum/reagents/holder)
	var/list/borks = typesof(/obj/item/weapon/reagent_containers/food/snacks) - /obj/item/weapon/reagent_containers/food/snacks
	playsound(get_turf(holder.my_atom), 'sound/effects/phasein.ogg', 100, 1)
	for(var/mob/living/carbon/human/M in viewers(get_turf(holder.my_atom), null))
		if(M.eyecheck() < FLASH_PROTECTION_MODERATE)
			if (M.HUDtech.Find("flash"))
				flick("e_flash", M.HUDtech["flash"])

	for(var/i = 1, i <= 4 + rand(1,2), i++)
		var/chosen = pick(borks)
		var/obj/B = new chosen
		if(B)
			B.loc = get_turf(holder.my_atom)
			if(prob(50))
				for(var/j = 1, j <= rand(1, 3), j++)
					step(B, pick(NORTH, SOUTH, EAST, WEST))
	..()

//Blue
/datum/chemical_reaction/slime/frost
	result = "frostoil"
	required_reagents = list("plasma" = 1)
	result_amount = 10
	required = /obj/item/slime_extract/blue

//Dark Blue
/datum/chemical_reaction/slime/freeze
	result = null
	required_reagents = list("plasma" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/darkblue
	mix_message = "The slime extract begins to vibrate violently!"

/datum/chemical_reaction/slime/freeze/on_reaction(var/datum/reagents/holder)
	..()
	sleep(50)
	playsound(get_turf(holder.my_atom), 'sound/effects/phasein.ogg', 100, 1)
	for(var/mob/living/M in range (get_turf(holder.my_atom), 7))
		M.bodytemperature -= 140
		to_chat(M, SPAN_WARNING("You feel a chill!"))

//Orange
/datum/chemical_reaction/slime/casp
	result = "capsaicin"
	required_reagents = list("blood" = 1)
	result_amount = 10
	required = /obj/item/slime_extract/orange

/datum/chemical_reaction/slime/fire
	result = null
	required_reagents = list("plasma" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/orange
	mix_message = "The slime extract begins to vibrate violently!"

/datum/chemical_reaction/slime/fire/on_reaction(var/datum/reagents/holder)
	..()
	sleep(50)
	var/turf/location = get_turf(holder.my_atom.loc)
	for(var/turf/simulated/floor/target_tile in range(0, location))
		target_tile.assume_gas("plasma", 25, 1400)
		spawn (0)
			target_tile.hotspot_expose(700, 400)

//Yellow
/datum/chemical_reaction/slime/overload
	result = null
	required_reagents = list("blood" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/yellow

/datum/chemical_reaction/slime/overload/on_reaction(var/datum/reagents/holder, var/created_volume)
	..()
	empulse(get_turf(holder.my_atom), 3, 7)

/datum/chemical_reaction/slime/cell
	result = null
	required_reagents = list("plasma" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/yellow

/datum/chemical_reaction/slime/cell/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/obj/item/weapon/cell/large/slime/P = new /obj/item/weapon/cell/large/slime
	P.loc = get_turf(holder.my_atom)

/datum/chemical_reaction/slime/glow
	result = null
	required_reagents = list("water" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/yellow
	mix_message = "The contents of the slime core harden and begin to emit a warm, bright light."

/datum/chemical_reaction/slime/glow/on_reaction(var/datum/reagents/holder, var/created_volume)
	..()
	var/obj/item/device/slimelight/F = new /obj/item/device/slimelight
	F.loc = get_turf(holder.my_atom)

//Purple
/datum/chemical_reaction/slime/psteroid
	result = null
	required_reagents = list("plasma" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/purple

/datum/chemical_reaction/slime/psteroid/on_reaction(var/datum/reagents/holder, var/created_volume)
	..()
	var/obj/item/weapon/slimesteroid/P = new /obj/item/weapon/slimesteroid
	P.loc = get_turf(holder.my_atom)

/datum/chemical_reaction/slime/jam
	result = "slimejelly"
	required_reagents = list("sugar" = 1)
	result_amount = 10
	required = /obj/item/slime_extract/purple

//Dark Purple
/datum/chemical_reaction/slime/plasma
	result = null
	required_reagents = list("plasma" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/darkpurple

/datum/chemical_reaction/slime/plasma/on_reaction(var/datum/reagents/holder)
	..()
	var/obj/item/stack/material/plasma/P = new /obj/item/stack/material/plasma
	P.amount = 10
	P.loc = get_turf(holder.my_atom)

//Red
/datum/chemical_reaction/slime/glycerol
	result = "glycerol"
	required_reagents = list("plasma" = 1)
	result_amount = 8
	required = /obj/item/slime_extract/red

/datum/chemical_reaction/slime/osmium
	result = null
	required_reagents = list("frostoil" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/red

/datum/chemical_reaction/slime/osmium/on_reaction(var/datum/reagents/holder)
	var/obj/item/stack/material/steel/M = new /obj/item/stack/material/osmium
	M.amount = 15
	M.loc = get_turf(holder.my_atom)
	var/obj/item/stack/material/plasteel/P = new /obj/item/stack/material/mhydrogen
	P.amount = 5
	P.loc = get_turf(holder.my_atom)
	..()

/datum/chemical_reaction/slime/bloodlust
	result = null
	required_reagents = list("blood" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/red

/datum/chemical_reaction/slime/bloodlust/on_reaction(var/datum/reagents/holder)
	..()
	for(var/mob/living/carbon/slime/slime in viewers(get_turf(holder.my_atom), null))
		slime.rabid = 1
		slime.visible_message(SPAN_WARNING("The [slime] is driven into a frenzy!"))

//Pink
/datum/chemical_reaction/slime/ppotion
	result = null
	required_reagents = list("plasma" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/pink

/datum/chemical_reaction/slime/ppotion/on_reaction(var/datum/reagents/holder)
	..()
	var/obj/item/weapon/slimepotion/P = new /obj/item/weapon/slimepotion
	P.loc = get_turf(holder.my_atom)

//Black
/datum/chemical_reaction/slime/mutate2
	result = "amutationtoxin"
	required_reagents = list("plasma" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/black

//Oil
/datum/chemical_reaction/slime/explosion
	result = null
	required_reagents = list("plasma" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/oil
	mix_message = "The slime extract begins to vibrate violently!"

/datum/chemical_reaction/slime/explosion/on_reaction(var/datum/reagents/holder)
	..()
	sleep(50)
	explosion(get_turf(holder.my_atom), 1, 3, 6)

//Light Pink
/datum/chemical_reaction/slime/potion2
	result = null
	result_amount = 1
	required = /obj/item/slime_extract/lightpink
	required_reagents = list("plasma" = 1)

/datum/chemical_reaction/slime/potion2/on_reaction(var/datum/reagents/holder)
	..()
	var/obj/item/weapon/slimepotion2/P = new /obj/item/weapon/slimepotion2
	P.loc = get_turf(holder.my_atom)

//Adamantine
/datum/chemical_reaction/slime/golem
	result = null
	required_reagents = list("plasma" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/adamantine

/datum/chemical_reaction/slime/golem/on_reaction(var/datum/reagents/holder)
	..()
	var/obj/effect/golemrune/Z = new /obj/effect/golemrune
	Z.loc = get_turf(holder.my_atom)
	Z.announce_to_ghosts()