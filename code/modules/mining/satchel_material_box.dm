
/**********************Material box**************************/

/obj/structure/material_box
	name = "material box"
	desc = "A heavy box used for storing material sheets."
	icon = 'icons/obj/mining.dmi'
	icon_state = "orebox0"
	density = TRUE

/obj/structure/material_box/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/stack/material))
		insert_item(W, user)
	else
		..()

/obj/structure/material_box/examine(mob/user)
	..()
	if(!contents.len)
		to_chat(user, SPAN_NOTICE("It is empty."))
		return

	to_chat(user, SPAN_NOTICE("It holds : "))
	var/final_price = 0 // The final price that get displayed

	for(var/mats in MATERIAL_LIST) // Check every material type.
		var/mats_price = 0 // Total price of that material type
		var/mats_amount = 0 // Total amount of sheets of that material type
		for(var/obj/item/stack/material/M in contents) // Check everything in the box.
			if(M.material.name == mats) // Check if it is the correct type
				mats_amount += M.amount
				mats_price += M.price_tag * M.amount
		if(mats_amount > 0)
			to_chat(user, SPAN_NOTICE("	[mats]. Amount : [mats_amount]. Value : [mats_price]$."))
		final_price += mats_price

	to_chat(user, SPAN_NOTICE("Total Price : [final_price]"))
	return

/obj/structure/material_box/verb/empty_box()
	set name = "Empty Material Box"
	set category = "Object"
	set src in view(1)

	if(!ishuman(usr) && !isrobot(usr)) //Only living, intelligent creatures with hands can empty material boxes.
		to_chat(usr, "\red You are physically incapable of emptying the material box.")
		return

	if( usr.stat || usr.restrained() )
		return

	if(!Adjacent(usr)) //You can only empty the box if you can physically reach it
		to_chat(usr, "You cannot reach the material box.")
		return

	add_fingerprint(usr)

	if(contents.len < 1)
		to_chat(usr, "\red The material box is empty")
		return

	for (var/obj/item/stack/M in contents)
		contents -= M
		M.loc = src.loc
	to_chat(usr, "\blue You empty the ore box")
	return TRUE

/obj/structure/material_box/ex_act(severity)
	if(severity == 1.0 || (severity < 3.0 && prob(50)))
		for (var/obj/item/stack/material/O in contents)
			O.loc = src.loc
			O.ex_act(severity++)
		qdel(src)
		return
