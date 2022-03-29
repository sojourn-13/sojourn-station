/obj/item/clothing/shoes/costume/history/centurion
	name = "centurion sandals"
	desc = "A pair of buckled leather strap sandals."
	icon_state = "roman"
	item_state = "roman"
	permeability_coefficient = 0.9

/obj/item/clothing/shoes/costume/history/knight
	name = "knight shoes"
	desc = "A pair of plated boots befitting a medieval knight."
	icon_state = "knight"
	item_state = "knight"
	permeability_coefficient = 0.9

/obj/item/clothing/shoes/costume/job/mime
	name = "mime shoes"
	icon_state = "mime"

/obj/item/clothing/shoes/costume/animal/griffin
	name = "griffin boots"
	desc = "A pair of costume boots fashioned after bird talons."
	icon_state = "griffinboots"
	item_state = "griffinboots"

/obj/item/clothing/shoes/costume/history/jester
	name = "jester shoes"
	desc = "A pair of flamboyant shoes for jesting around in."
	icon_state = "jester_shoes"
	item_state = "jester_shoes"

/obj/item/clothing/shoes/costume/job/clown
	desc = "The prankster's standard-issue clowning shoes. Damn they're huge!"
	name = "clown shoes"
	icon_state = "clown"
	item_state = "clown_shoes"
	slowdown = SHOES_SLOWDOWN+0.4
	force = 0
	var/footstep = 1	//used for squeeks whilst walking
	species_restricted = null

/obj/item/clothing/shoes/costume/job/clown/handle_movement(var/turf/walking, var/running)
	if(running)
		if(footstep >= 2)
			footstep = 0
			playsound(src, "clownstep", 50, 1) // this will get annoying very fast.
		else
			footstep++
	else
		playsound(src, "clownstep", 20, 1)