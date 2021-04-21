
/**********************Material box**************************/

/obj/structure/material_box
	icon = 'icons/obj/mining.dmi'
	icon_state = "orebox0"
	name = "material box"
	desc = "A heavy box used for storing materials."
	density = 1
	var/last_update = 0
	var/list/stored_material = list()
	var/stored_prices

/obj/structure/material_box/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/stack/material))
		user.remove_from_mob(W)
		src.contents += W
	if (istype(W, /obj/item/weapon/storage))
		var/obj/item/weapon/storage/S = W
		S.hide_from(usr)
		if (locate(/obj/item/stack/material) in S.contents)
			for(var/obj/item/stack/material/O in S.contents)
				S.remove_from_storage(O, src) //This will move the item to this item's contents
			playsound(loc, S.use_sound, 50, 1, -5)
			user.visible_message(SPAN_NOTICE("[user.name] empties the [S] into the box"), SPAN_NOTICE("You empty the [S] into the box."), SPAN_NOTICE("You hear a rustling sound"))
		else
			to_chat(user, SPAN_WARNING("There's no material inside the [S] to empty into here"))
	update_material_count()

	return

/obj/structure/material_box/proc/update_material_count()

	stored_material = list()

	for(var/obj/item/stack/material/O in contents)

		if(stored_material[O.name])
			stored_material[O.name]++
		else
			stored_material[O.name] = stored_material[O.name] + O.amount
		stored_prices[O.name] = O.amount * O.price_tag + stored_prices[O.name]

/obj/structure/material_box/examine(mob/user)
	to_chat(user, "That's an [src].")
	to_chat(user, desc)

	// Borgs can now check contents too.
	if((!ishuman(user)) && (!isrobot(user)))
		return

	if(!Adjacent(user)) //Can only check the contents of material boxes if you can physically reach them.
		return

	add_fingerprint(user)

	if(!contents.len)
		to_chat(user, "It is empty.")
		return

	if(world.time > last_update + 10)
		update_material_count()
		last_update = world.time

	to_chat(user, "It holds:")
	for(var/material in stored_material)
		to_chat(user, "- [stored_material[material]] [material] worth [stored_prices[material]]")
		//to_chat(user, "- [stored_material[material]] [material]")
	return


/obj/structure/material_box/verb/empty_box()
	set name = "Empty Material Box"
	set category = "Object"
	set src in view(1)

	if(!ishuman(usr)) //Only living, intelligent creatures with hands can empty material boxes.
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

	for (var/obj/item/stack/material/O in contents)
		contents -= O
		O.loc = src.loc
	to_chat(usr, "\blue You empty the material box")

	return

/obj/structure/material_box/ex_act(severity)
	if(severity == 1.0 || (severity < 3.0 && prob(50)))
		for (var/obj/item/stack/material/O in contents)
			O.loc = src.loc
			O.ex_act(severity++)
		qdel(src)
		return