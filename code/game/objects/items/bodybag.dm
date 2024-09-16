//Also contains /obj/structure/closet/body_bag because I doubt anyone would think to look for bodybags in /object/structures
// Note that deploying body bags is based on attack self hard coding, well folding themselfs up is modular "item_path"
/obj/item/bodybag
	name = "body bag"
	desc = "A folded bag designed for the storage and transportation of cadavers."
	icon = 'icons/obj/bodybag.dmi'
	icon_state = "bodybag_folded"
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_PLASTIC = 2)
	preloaded_reagents = list("plasticide" = 30,)
	price_tag = 10

	attack_self(mob/user)
		var/obj/structure/closet/body_bag/R = new /obj/structure/closet/body_bag(user.loc)
		R.add_fingerprint(user)
		qdel(src)

/obj/structure/closet/body_bag
	name = "body bag"
	desc = "A plastic bag designed for the storage and transportation of cadavers."
	icon = 'icons/obj/bodybag.dmi'
	icon_state = "bodybag"
	open_sound = 'sound/items/zip.ogg'
	close_sound = 'sound/items/zip.ogg'
	var/item_path = /obj/item/bodybag //What item do we get back when folding it up?
	density = 0
	storage_capacity = (MOB_MEDIUM * 4) - 1 //Holds 6 medium size mob or 11 smalls
	var/contains_body = 0
	layer = LOW_OBJ_LAYER+0.01
	old_lock_odds = -100 // No more ID locked bodybags/stasis bags, please!!!
	old_chance = -100 // And not old either!! Just to be safe!! - Seb

/obj/structure/closet/body_bag/attackby(W as obj, mob/user as mob)
	if (istype(W, /obj/item/pen))
		var/t = input(user, "What would you like the label to be?", text("[]", src.name), null)  as text
		if (user.get_active_hand() != W)
			return
		if (!in_range(src, user) && src.loc != user)
			return
		t = sanitizeSafe(t, MAX_NAME_LEN)
		if (t)
			src.name = "body bag - "
			src.name += t
			src.add_overlay(image(src.icon, "bodybag_label"))
		else
			src.name = "body bag"
	//..() //Doesn't need to run the parent. Since when can fucking bodybags be welded shut? -Agouri
		return
	else if(istype(W, /obj/item/tool/wirecutters))
		to_chat(user, "You cut the tag off the bodybag.")
		src.name = "body bag"
		src.cut_overlays()
		return

/obj/structure/closet/body_bag/store_mobs(var/stored_units)
	contains_body = ..()
	return contains_body

/obj/structure/closet/body_bag/close()
	if(..())
		density = 0
		return 1
	return 0

/obj/structure/closet/body_bag/MouseDrop(over_object, src_location, over_location)
	..()
	if((over_object == usr && (in_range(src, usr) || usr.contents.Find(src))))
		if(!ishuman(usr))	return
		if(opened)	return 0
		if(contents.len)	return 0
		visible_message("[usr] folds up the [src.name]")
		new item_path(get_turf(src))
		spawn(0)
			qdel(src)
		return

/obj/structure/closet/body_bag/update_icon()
	if(opened)
		icon_state = "bodybag_open"
	else if(contains_body > 0)
		icon_state = "bodybag_full"
	else
		icon_state = "bodybag_closed"

/obj/item/bodybag/cryobag
	name = "stasis bag"
	desc = "A folded, non-reusable bag designed to prevent additional damage to an occupant. Especially useful if short on time or in \
	a hostile environment."
	icon = 'icons/obj/cryobag.dmi'
	icon_state = "bodybag_folded"
	origin_tech = list(TECH_BIO = 4)
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 1)
	price_tag = 50

/obj/item/bodybag/cryobag/attack_self(mob/user)
	var/obj/structure/closet/body_bag/cryobag/R = new /obj/structure/closet/body_bag/cryobag(user.loc)
	R.add_fingerprint(user)
	qdel(src)

/obj/structure/closet/body_bag/cryobag
	name = "stasis bag"
	desc = "A non-reusable plastic bag designed to prevent additional damage to an occupant. Especially useful if short on time or in \
	a hostile environment. This one features a much more advanced design that preserves its occupant in cryostasis."
	icon = 'icons/obj/cryobag.dmi'
	item_path = /obj/item/bodybag/cryobag
	store_misc = 0
	store_items = 0
	var/used = 0
	var/obj/item/tank/tank = null
	var/existing_degradation
	old_lock_odds = -100
	old_chance = -100  // Making extra sure just in case it doesn't inherit properly.

/obj/structure/closet/body_bag/cryobag/New()
	tank = new /obj/item/tank/emergency_oxygen(null) //It's in nullspace to prevent ejection when the bag is opened.
	..()

/obj/structure/closet/body_bag/cryobag/Destroy()
	qdel(tank)
	tank = null
	return ..()

/obj/structure/closet/body_bag/cryobag/open()
	. = ..()
	if(used)
		var/obj/item/O = new/obj/item(src.loc)
		O.name = "used stasis bag"
		O.icon = src.icon
		O.icon_state = "bodybag_used"
		O.desc = "A used stasisbag. It's nothing but trash now."
		O.matter = list(MATERIAL_PLASTIC = 0.5, MATERIAL_SILVER = 0.2)
		qdel(src)

/obj/structure/closet/body_bag/cryobag/Entered(atom/movable/AM)
	if(ishuman(AM))
		var/mob/living/carbon/human/H = AM
		H.in_stasis = 1
		if(H.timeofdeath)
			src.existing_degradation = world.time - H.timeofdeath
		src.used = 1
	..()

/obj/structure/closet/body_bag/cryobag/Exited(atom/movable/AM)
	if(ishuman(AM))
		var/mob/living/carbon/human/H = AM
		H.in_stasis = 0
		if(H.timeofdeath && src.existing_degradation)
			H.timeofdeath = world.time - src.existing_degradation
	..()

/obj/structure/closet/body_bag/cryobag/return_air() //Used to make stasis bags protect from vacuum.
	if(tank)
		return tank.air_contents
	..()

/obj/structure/closet/body_bag/cryobag/examine(mob/user)
	..()
	if(Adjacent(user)) //The bag's rather thick and opaque from a distance.
		to_chat(user, "<span class='info'>You peer into \the [src].</span>")
		for(var/mob/living/L in contents)
			L.examine(user)

/obj/structure/closet/body_bag/attackby(obj/item/W, mob/user)
	..() // Allows to use health analyzer on the mob inside

/obj/item/bodybag/xenobio
	name = "xenobio body bag"
	desc = "A folded bag designed for the storage and transportation of slimes and monkeys."
	icon_state = "xb_bodybag_folded"

	attack_self(mob/user)
		var/obj/structure/closet/body_bag/xenobio/R = new /obj/structure/closet/body_bag/xenobio(user.loc)
		R.add_fingerprint(user)
		qdel(src)

/obj/structure/closet/body_bag/xenobio
	name = "xenobio body bag"
	desc = "A plastic bag designed for the storage and transportation of monkeys and slimes."
	icon_state = "xb_bodybag"
	item_path = /obj/item/bodybag/xenobio //What item do we get back when folding it up?
	storage_capacity = (MOB_MEDIUM * 10) //Holds 10 monkeys or slimes. Ideally this will fully clean a pen in one go.

/obj/structure/closet/body_bag/xenobio/update_icon()
	if(opened)
		icon_state = "xb_bodybag_open"
	else if(contains_body > 0)
		icon_state = "xb_bodybag_closed"
	else
		icon_state = "xb_bodybag_closed"

/obj/structure/closet/body_bag/xenobio/store_misc(var/stored_units)
	return 0 //set to zero for safty. You shouldn't be able to add items to the xenobio version.

/obj/structure/closet/body_bag/xenobio/store_items(var/stored_units)
	return 0 //set to zero for safty. You shouldn't be able to add items to the xenobio version.

/obj/structure/closet/body_bag/xenobio/store_mobs(var/stored_units)
	var/added_units = 0
	for(var/mob/living/M in src.loc)
		if(!istype(M,/mob/living/carbon/slime) && !istype(M,/mob/living/carbon/human/monkey))
			continue
		if(M.buckled || M.pinned.len)
			continue
		if(stored_units + added_units + M.mob_size > storage_capacity)
			break
		if(M.client)
			M.client.perspective = EYE_PERSPECTIVE
			M.client.eye = src
		M.forceMove(src)
		added_units += M.mob_size
		contains_body = added_units
	return contains_body
