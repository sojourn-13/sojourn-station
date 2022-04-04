//NEVER USE THIS IT SUX	-PETETHEGOAT
//THE GOAT WAS RIGHT - RKF

var/global/list/cached_icons = list()

/obj/item/reagent_containers/glass/paint
	desc = "It's a paint bucket."
	name = "paint bucket"
	icon = 'icons/obj/items.dmi'
	icon_state = "paint_neutral"
	item_state = "paintcan"
	matter = list(MATERIAL_STEEL = 2)
	w_class = ITEM_SIZE_NORMAL
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(10,20,30,60)
	volume = 60
	unacidable = 0
	var/paint_type = "red"

	afterattack(turf/simulated/target, mob/user, proximity)
		if(!proximity) return
		if(istype(target) && reagents.total_volume > 5)
			user.visible_message(SPAN_WARNING("\The [target] has been splashed with something by [user]!"))
			reagents.trans_to_turf(target, 5)
		else
			return ..()

	New()
		if(paint_type && length(paint_type) > 0)
			name = paint_type + " " + name
		..()
		reagents.add_reagent("water", volume*3/5)
		reagents.add_reagent("plasticide", volume/5)
		if(paint_type == "white") //why don't white crayons exist
			reagents.add_reagent("aluminum", volume/5)
		else if (paint_type == "black")
			reagents.add_reagent("carbon", volume/5)
		else
			reagents.add_reagent("crayon_dust_[paint_type]", volume/5)
		reagents.handle_reactions()

	red
		icon_state = "paint_red"
		paint_type = "red"

	yellow
		icon_state = "paint_yellow"
		paint_type = "yellow"

	green
		icon_state = "paint_green"
		paint_type = "green"

	blue
		icon_state = "paint_blue"
		paint_type = "blue"

	purple
		icon_state = "paint_violet"
		paint_type = "purple"

	black
		icon_state = "paint_black"
		paint_type = "black"

	white
		icon_state = "paint_white"
		paint_type = "white"

//Subtypes for admins
/obj/item/reagent_containers/glass/paint/white
	paint_type = "white"

/obj/item/reagent_containers/glass/paint/black
	paint_type = "black"

/obj/item/reagent_containers/glass/paint/yellow
	paint_type = "yellow"

/obj/item/reagent_containers/glass/paint/green
	paint_type = "green"

/obj/item/reagent_containers/glass/paint/blue
	paint_type = "blue"

/obj/item/reagent_containers/glass/paint/red
//Yes the parent is red by default. This is for admins to spawn in the red type without second guessing.

/obj/item/reagent_containers/glass/paint/purple
	paint_type = "purple" // Not even a real colour but what ever
