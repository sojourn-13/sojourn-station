/obj/machinery/optable/altar
	name = "Absolutism altar"
	desc = "The altar."
	icon = 'icons/obj/neotheology_machinery.dmi'
	icon_state = "optable-idle"
	y_offset = 10

	var/list/acceptable_items = list(
	/obj/item/implant/core_implant/cruciform,
	/obj/item/implant/core_implant/cruciform/tessellate,
	/obj/item/implant/core_implant/cruciform/lemniscate,
	/obj/item/implant/core_implant/cruciform/monomial,
	/obj/item/implant/core_implant/cruciform/divisor,
	/obj/item/cruciform_upgrade,
	/obj/item/cruciform_upgrade/natures_blessing,
	/obj/item/cruciform_upgrade/faiths_shield,
	/obj/item/cruciform_upgrade/cleansing_presence,
	/obj/item/cruciform_upgrade/martyr_gift,
	/obj/item/cruciform_upgrade/wrath_of_god,
	/obj/item/cruciform_upgrade/speed_of_the_chosen
	)
	var/list/available_slots = list()
	var/request_cooldown = FALSE //Whether this altar has had an item requested from it in the last 10 minutes

/obj/machinery/optable/altar/New()
	//bottom left
	available_slots += list(list("offset" = list("x" = -8 , "y" = -3), "item" = null))
	//bottom right
	available_slots += list(list("offset" = list("x" = 8 , "y" = -3), "item" = null))
	..()

/obj/machinery/optable/altar/attackby(obj/item/I, mob/user)
	if(!istype(I) || !(I.type in acceptable_items))
		return

	item_cleanup()
	var/list/slot = null
	for(var/j = 1, j <= available_slots.len, j++)
		slot = available_slots[j]
		if (slot["item"] == null)
			break
		slot = null

	if(!slot)
		to_chat(user, "<span class='notice'>There is no free space on \the [src] to place \the [I]!</span>")
		return

	if (user.unEquip(I, src.loc))
		I.pixel_x = slot["offset"]["x"]
		I.pixel_y = slot["offset"]["y"]
		slot["item"] = I

/obj/machinery/optable/altar/proc/item_cleanup()
	var/turf/T = get_turf(src)

	for(var/j = 1, j <= available_slots.len, j++)
		if(!(available_slots[j]["item"] in T.contents))
			available_slots[j]["item"] = null

/obj/machinery/optable/altar/proc/cooldown(var/T)
	request_cooldown = TRUE
	addtimer(CALLBACK(src, PROC_REF(cooled_off)), T)

/obj/machinery/optable/altar/proc/cooled_off()
	request_cooldown = FALSE
