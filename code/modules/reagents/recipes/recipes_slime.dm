
/* Slime cores */

/datum/chemical_reaction/slime
	var/required = null

/datum/chemical_reaction/slime/nano_ui_data()
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
		T.name = "used slime plort"
		T.desc = "This plort has been used up."

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

//
/datum/chemical_reaction/slime/monkey
	result = null
	required_reagents = list("blood" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/grey

/datum/chemical_reaction/slime/monkey/on_reaction(var/datum/reagents/holder)
	for(var/i = 1, i <= 3, i++)
		var /obj/item/reagent_containers/food/snacks/monkeycube/M = new /obj/item/reagent_containers/food/snacks/monkeycube
		M.loc = get_turf(holder.my_atom)
	..()

//
/datum/chemical_reaction/slime/roach_cube
	result = null
	required_reagents = list("blattedin" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/grey

/datum/chemical_reaction/slime/roach_cube/on_reaction(var/datum/reagents/holder)
	for(var/i = 1, i <= 3, i++)
		var/obj/random/rations/roachcube/R = new /obj/random/rations/roachcube
		R.loc = get_turf(holder.my_atom)
	..()

//
/datum/chemical_reaction/slime/spider_lings
	result = null
	required_reagents = list("pararein" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/grey

/datum/chemical_reaction/slime/spider_lings/on_reaction(var/datum/reagents/holder)
	for(var/i = 1, i <= 3, i++)
		var/obj/effect/spider/spiderling/S = new /obj/effect/spider/spiderling
		S.loc = get_turf(holder.my_atom)
	..()

//Green
/datum/chemical_reaction/slime/mutate
	result = "mutagen"
	required_reagents = list("plasma" = 1)
	result_amount = 10
	required = /obj/item/slime_extract/green


/datum/chemical_reaction/slime/mutate_clear
	result = null
	required_reagents = list("water" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/green

/datum/chemical_reaction/slime/mutate_clear/on_reaction(var/datum/reagents/holder)
	for(var/i = 1, i <= 1, i++)
		var/obj/item/genetics/purger/slime/P = new /obj/item/genetics/purger/slime
		P.loc = get_turf(holder.my_atom)
	..()

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

//
/datum/chemical_reaction/slime/metal_2
	result = null
	required_reagents = list("water" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/metal

/datum/chemical_reaction/slime/metal_2/on_reaction(var/datum/reagents/holder)
	var/obj/item/stack/material/plastic/P = new /obj/item/stack/material/plastic
	P.amount = 15
	P.loc = get_turf(holder.my_atom)
	..()

//
/datum/chemical_reaction/slime/metal_3
	result = null
	required_reagents = list("radium" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/metal

/datum/chemical_reaction/slime/metal_3/on_reaction(var/datum/reagents/holder)
	var/obj/item/stack/material/uranium/U = new /obj/item/stack/material/uranium
	U.amount = 3
	U.loc = get_turf(holder.my_atom)
	for (var/mob/living/M in range(5,U.loc))
		M.apply_effect(25,IRRADIATE,0)
		M.updatehealth()
	..()

//Gold
/datum/chemical_reaction/slime/wealth
	result = null
	required_reagents = list("plasma" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/gold

/datum/chemical_reaction/slime/wealth/on_reaction(var/datum/reagents/holder)
	var/obj/item/stack/material/gold/G = new /obj/item/stack/material/gold
	G.amount = 15
	G.loc = get_turf(holder.my_atom)

//
/datum/chemical_reaction/slime/honey
	result = "honey"
	required_reagents = list("nutriment" = 5)
	result_amount = 20
	required = /obj/item/slime_extract/gold

//Silver
/datum/chemical_reaction/slime/bork
	result = null
	required_reagents = list("plasma" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/silver

/datum/chemical_reaction/slime/bork/on_reaction(var/datum/reagents/holder)
	var/list/borks = typesof(/obj/item/reagent_containers/food/snacks) - /obj/item/reagent_containers/food/snacks
	playsound(get_turf(holder.my_atom), 'sound/effects/phasein.ogg', 100, 1)
	for(var/mob/living/carbon/human/M in viewers(get_turf(holder.my_atom), null))
		if(M.eyecheck() < FLASH_PROTECTION_MINOR)
			M.flash(0, FALSE , FALSE , FALSE, 0) // flashed by the gods or something idk

	for(var/i = 1, i <= 4 + rand(1,2), i++)
		var/chosen = pick(borks)
		var/obj/B = new chosen
		if(B)
			B.loc = get_turf(holder.my_atom)
			if(prob(50))
				for(var/j = 1, j <= rand(1, 3), j++)
					step(B, pick(NORTH, SOUTH, EAST, WEST))
	..()

/datum/chemical_reaction/slime/bork2
	result = "enzyme"
	required_reagents = list("nutriment" = 5)
	result_amount = 5
	required = /obj/item/slime_extract/silver

//
/datum/chemical_reaction/slime/wealth_light
	result = null
	required_reagents = list(MATERIAL_URANIUM = 5)
	result_amount = 1
	required = /obj/item/slime_extract/silver

/datum/chemical_reaction/slime/wealth_light/on_reaction(var/datum/reagents/holder)
	var/obj/item/stack/material/silver/S = new /obj/item/stack/material/silver
	S.amount = 15
	S.loc = get_turf(holder.my_atom)
	var/obj/item/stack/material/tritium/T = new /obj/item/stack/material/tritium
	T.amount = 5
	T.loc = get_turf(holder.my_atom)
	..()

//Blue
/datum/chemical_reaction/slime/frost
	result = "frostoil"
	required_reagents = list("water" = 1)
	result_amount = 10
	required = /obj/item/slime_extract/blue

//
/datum/chemical_reaction/slime/glass
	result = null
	required_reagents = list("plasma" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/blue

/datum/chemical_reaction/slime/glass/on_reaction(var/datum/reagents/holder)
	var/obj/item/stack/material/glass/G = new /obj/item/stack/material/glass
	G.amount = 15
	G.loc = get_turf(holder.my_atom)
	var/obj/item/stack/material/glass/plasmaglass/P = new /obj/item/stack/material/glass/plasmaglass
	P.amount = 5
	P.loc = get_turf(holder.my_atom)
	..()

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

//
/datum/chemical_reaction/slime/pureslime
	result = "pureslimejelly"
	required_reagents = list("honey" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/darkblue
	mix_message = "The core shimmers in gentle light before returning to normal."

//Orange
/datum/chemical_reaction/slime/casp
	result = "condensedcapsaicin"
	required_reagents = list("blood" = 1)
	result_amount = 10
	required = /obj/item/slime_extract/orange

//
/datum/chemical_reaction/slime/fire_resist
	result = null
	required_reagents = list("water" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/orange

/datum/chemical_reaction/slime/fire_resist/on_reaction(var/datum/reagents/holder, var/created_volume)
	..()
	var/obj/item/slime_potion/slimes_fire_resist/P = new /obj/item/slime_potion/slimes_fire_resist
	P.loc = get_turf(holder.my_atom)

//
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

//
/datum/chemical_reaction/slime/shock_resist
	result = null
	required_reagents = list("plasma" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/yellow

/datum/chemical_reaction/slime/shock_resist/on_reaction(var/datum/reagents/holder, var/created_volume)
	..()
	var/obj/item/slime_potion/slimes_shock_resist/P = new /obj/item/slime_potion/slimes_shock_resist
	P.loc = get_turf(holder.my_atom)

//
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
	var/obj/item/slime_potion/slimesteroid/P = new /obj/item/slime_potion/slimesteroid
	P.loc = get_turf(holder.my_atom)

//
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

//
/datum/chemical_reaction/slime/toolupgrade
	result = null
	required_reagents = list(MATERIAL_URANIUM = 1, MATERIAL_GOLD = 1, MATERIAL_SILVER = 1)
	result_amount = 1
	required = /obj/item/slime_extract/darkpurple

/datum/chemical_reaction/slime/toolupgrade/on_reaction(var/datum/reagents/holder)
	..()
	var/obj/item/tool_upgrade/augment/randomizer/R = new /obj/item/tool_upgrade/augment/randomizer
	R.loc = get_turf(holder.my_atom)

//Red
/datum/chemical_reaction/slime/glycerol
	result = "glycerol"
	required_reagents = list("plasma" = 1)
	result_amount = 8
	required = /obj/item/slime_extract/red

//
/datum/chemical_reaction/slime/osmium
	result = null
	required_reagents = list("frostoil" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/red

/datum/chemical_reaction/slime/osmium/on_reaction(var/datum/reagents/holder)
	var/obj/item/stack/material/osmium/O = new /obj/item/stack/material/osmium
	O.amount = 15
	O.loc = get_turf(holder.my_atom)
	var/obj/item/stack/material/mhydrogen/H = new /obj/item/stack/material/mhydrogen
	H.amount = 5
	H.loc = get_turf(holder.my_atom)
	..()

//
/datum/chemical_reaction/slime/speed_vial
	result = null
	required_reagents = list("water" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/red

/datum/chemical_reaction/slime/speed_vial/on_reaction(var/datum/reagents/holder)
	..()
	var/obj/item/slime_potion/slimes_speed/P = new /obj/item/slime_potion/slimes_speed
	P.loc = get_turf(holder.my_atom)

//
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
/datum/chemical_reaction/slime/docile_baby
	result = null
	required_reagents = list("nutriment" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/pink

/datum/chemical_reaction/slime/docile_baby/on_reaction(var/datum/reagents/holder)
	..()
	var/obj/item/slime_potion/slime_docile/P = new /obj/item/slime_potion/slime_docile
	P.loc = get_turf(holder.my_atom)

//
/datum/chemical_reaction/slime/docile_adult
	result = null
	result_amount = 1
	required = /obj/item/slime_extract/pink
	required_reagents = list("honey" = 5)

/datum/chemical_reaction/slime/docile_adult/on_reaction(var/datum/reagents/holder)
	..()
	var/obj/item/slime_potion/slime_docile_adult/P = new /obj/item/slime_potion/slime_docile_adult
	P.loc = get_turf(holder.my_atom)

//Black
/* //should be replaced with something/reworked some day but I've no ideas.
/datum/chemical_reaction/slime/mutate2
	result = "amutationtoxin"
	required_reagents = list("plasma" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/black
*/

datum/chemical_reaction/slime/spawn2
	result = null
	required_reagents = list("mutagen" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/black

/datum/chemical_reaction/slime/spawn2/on_reaction(var/datum/reagents/holder)
	holder.my_atom.visible_message(SPAN_WARNING("The core begins to quiver and grow, and soon a new baby slime emerges from it!"))
	var/mob/living/carbon/slime/S = new /mob/living/carbon/slime
	S.loc = get_turf(holder.my_atom)
	var/list/colors = list("grey" = 10,
	"purple" = 4,
	"metal" = 4,
	"orange" = 4,
	"blue" = 4,
	"dark blue" = 2,
	"dark purple" = 2,
	"yellow" = 2,
	"silver" = 2,
	"pink" = 1,
	"red" = 1,
	"gold" = 1,
	"green" = 1)
	S.set_mutation(pickweight(colors))
	..()

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

//
/datum/chemical_reaction/slime/thermal
	result = null
	required_reagents = list("water" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/oil

/datum/chemical_reaction/slime/thermal/on_reaction(var/datum/reagents/holder)
	..()
	var/obj/item/slime_thermals/T = new /obj/item/slime_thermals
	T.loc = get_turf(holder.my_atom)

//
/datum/chemical_reaction/slime/noslip
	result = null
	required_reagents = list("lube" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/oil
	mix_message = "The slime extract begins to vibrate violently!"

/datum/chemical_reaction/slime/noslip/on_reaction(var/datum/reagents/holder)
	..()
	var/obj/item/noslipmodule/N = new /obj/item/noslipmodule
	N.loc = get_turf(holder.my_atom)

//Light Pink
//Peace thru a iron fist~
/datum/chemical_reaction/slime/slaughto
	result = null
	required_reagents = list("plasticide" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/lightpink
	mix_message = "The slime extract begins to twist and bend!"

/datum/chemical_reaction/slime/slaughto/on_reaction(var/datum/reagents/holder)
	..()
	var/obj/item/gun/projectile/automatic/slaught_o_matic/N = new /obj/item/gun/projectile/automatic/slaught_o_matic
	N.loc = get_turf(holder.my_atom)
	N.choosen_color = "pink"
	N.update_icon()

//
/datum/chemical_reaction/slime/peace_obedience
	result = null
	required_reagents = list("woodpulp" = 10)
	result_amount = 1
	required = /obj/item/slime_extract/lightpink
	mix_message = "The slime extract begins to twist and bend!"

/datum/chemical_reaction/slime/peace_obedience/on_reaction(var/datum/reagents/holder)
	..()
	var/obj/item/material/baseballbat/N = new /obj/item/material/baseballbat
	N.loc = get_turf(holder.my_atom)

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

//
/datum/chemical_reaction/slime/diamond
	result = null
	required_reagents = list("pureslimejelly" = 1)
	result_amount = 1
	required = /obj/item/slime_extract/adamantine

/datum/chemical_reaction/slime/diamond/on_reaction(var/datum/reagents/holder)
	..()
	var/obj/item/stack/material/diamond/D = new /obj/item/stack/material/diamond
	D.amount = 5
	D.loc = get_turf(holder.my_atom)
	var/obj/item/stack/material/biomatter/B = new /obj/item/stack/material/biomatter
	B.amount = 5
	B.loc = get_turf(holder.my_atom)

//
/datum/chemical_reaction/slime/platinum
	result = null
	required_reagents = list(MATERIAL_URANIUM = 1, MATERIAL_GOLD = 1, MATERIAL_SILVER = 1)
	result_amount = 1
	required = /obj/item/slime_extract/adamantine

/datum/chemical_reaction/slime/platinum/on_reaction(var/datum/reagents/holder)
	..()
	var/obj/item/stack/material/platinum/P = new /obj/item/stack/material/platinum
	P.amount = 5
	P.loc = get_turf(holder.my_atom)

//Rainbow
