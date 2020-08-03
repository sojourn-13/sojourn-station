/obj/item/device/restoration
	name = "restoration kit"
	desc = "Used to clean and repair damaged items."
	icon = 'icons/obj/forensics.dmi'
	icon_state = "case_trinket"
	item_state = "case_trinket"
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_ENGINEERING = 3)
	matter = list(MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 10)

/obj/item/device/restoration/afterattack(atom/target, mob/user as mob, proximity)
	if(!proximity) return

	else if(istype(target) && target.oldified == FALSE)
		to_chat(user, "<span class='notice'>This doesn't need to be resorted!</span>")
		return

	else if(istype(target) && target.oldified == TRUE)
		to_chat(user, "You start restoring the [target.name]")
		if(do_after(user, 150, target))
			to_chat(user, "<span class='notice'>You start to restore \the [target.name].If only you could fix it...</span>")
			name = initial(name)
			color = initial(color)
			//oldified = FALSE We look nice, but are not young again...
			return
		else
			to_chat(user, "<span class='notice'>You need to stand still to restore \the [target.name]!</span>")
			return

