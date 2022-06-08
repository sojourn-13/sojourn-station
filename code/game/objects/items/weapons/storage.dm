/obj/item/storage/sheath
	name = "absolutism sheath"
	desc = "Made to store only the swords of the church."
	icon = 'icons/obj/sheath.dmi'

	icon_state = "sheath"
	item_state = "sheath"
	slot_flags = SLOT_BELT
	price_tag = 50
	matter = list(MATERIAL_BIOMATTER = 5)
	storage_slots = 1
	w_class = ITEM_SIZE_NORMAL
	max_w_class = ITEM_SIZE_HUGE

	can_hold = list(
		/obj/item/tool/sword/nt,
		/obj/item/tool/sword/saber
		)
	cant_hold = list(
		/obj/item/tool/knife/dagger/nt,
		/obj/item/tool/spear/halberd
		)
//	insertion_sound = 'sound/effects/holster/sheathin.ogg'
//	extraction_sound = 'sound/effects/holster/sheathout.ogg'

/obj/item/storage/sheath/non_church
	name = "sheath"
	desc = "Made to store swords."

/obj/item/storage/sheath/attack_hand(mob/living/carbon/human/user)
	if(contents.len && (src in user))
		var/obj/item/I = contents[contents.len]
		if(istype(I))
			hide_from(usr)
			var/turf/T = get_turf(user)
			remove_from_storage(I, T)
			usr.put_in_hands(I)
			add_fingerprint(user)
	else
		..()

/obj/item/storage/sheath/New()
	..()
	update_icon()

/obj/item/storage/sheath/update_icon()
	overlays.Cut()
	cut_overlays()
	var/icon_to_set = "0" // If there nothing in content then icon_to_set won't change to anything and will stay 0
	for(var/obj/item/tool/sword/SW in contents)
		icon_to_set = SW.icon_state
	item_state = "[icon_state]_[icon_to_set]"
	add_overlay(icon_to_set)
	. = ..()
