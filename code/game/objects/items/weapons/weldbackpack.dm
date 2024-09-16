/obj/item/weldpack
	name = "welding kit"
	desc = "A heavy-duty, portable welding fluid carrier."
	slot_flags = SLOT_BACK
	icon = 'icons/obj/storage.dmi'
	icon_state = "welderpack"
	w_class = ITEM_SIZE_BULKY
	var/max_fuel = 350
	my_fuel = "fuel"

/obj/item/weldpack/canister
	name = "canister"
	desc = "You may need it to keep additional fuel on hand."
	slot_flags = null
	icon_state = "canister"
	w_class = ITEM_SIZE_NORMAL
	max_fuel = 100

/obj/item/weldpack/canister/oil
	name = "oil canister"
	desc = "You may need it to keep additional oil on hand."
	slot_flags = null
	icon_state = "canister_oil"
	my_fuel = "oil"
	w_class = ITEM_SIZE_NORMAL
	max_fuel = 100

/obj/item/weldpack/Initialize()
	create_reagents(max_fuel)
	reagents.add_reagent(my_fuel, max_fuel)
	. = ..()

/obj/item/weldpack/afterattack(obj/O as obj, mob/user as mob, proximity)
	if(!proximity) // this replaces and improves the get_dist(src,O) <= 1 checks used previously
		return
	if (istype(O, /obj/structure/reagent_dispensers/fueltank) && src.reagents.total_volume < max_fuel)
		O.reagents.trans_to_obj(src, max_fuel)
		to_chat(user, SPAN_NOTICE("You crack the cap off the top of the pack and fill it back up again from the tank."))
		playsound(src.loc, 'sound/effects/refill.ogg', 50, 1, -6)
		return
	else if (istype(O, /obj/structure/reagent_dispensers/fueltank) && src.reagents.total_volume == max_fuel)
		to_chat(user, SPAN_WARNING("The pack is already full!"))
		return

/obj/item/weldpack/examine(mob/user)
	..(user)
	to_chat(user, text("\icon[] [] units of fuel left!", src, src.reagents.total_volume))
	return

/obj/item/weldpack/proc/explode()
	if (reagents.total_volume > 150)
		explosion(src.loc,1,2,4)
	else if (reagents.total_volume > 50)
		explosion(src.loc,0,1,3)
	else if (reagents.total_volume > 0)
		explosion(src.loc,0,1,2)
	if(src)
		qdel(src)

/obj/item/weldpack/canister/flamethrower
	name = "flamethrower canister"
	desc = "Contains all the fuel needed to burn down any jungle and those strange talking trees."
	icon = 'icons/obj/guns/launcher/backburner.dmi'
	icon_state = "canister_g"
	max_fuel = 200
