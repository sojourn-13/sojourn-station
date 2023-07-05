#define NORMAL_MASK_SANITY_COEFF_BUFF 1.3

/obj/item/clothing/mask/muzzle
	name = "muzzle"
	desc = "To stop that awful noise."
	icon_state = "muzzle"
	item_state = "muzzle"
	body_parts_covered = FACE
	w_class = ITEM_SIZE_SMALL
	gas_transfer_coefficient = 0.90
	muffle_voice = FALSE

/obj/item/clothing/mask/muzzle/tape
	name = "length of tape"
	desc = "It's a robust DIY muzzle!"
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "tape_cross"
	item_state = null
	w_class = ITEM_SIZE_TINY

/obj/item/clothing/mask/muzzle/New()
    ..()
    say_messages = list("Mmfph!", "Mmmf mrrfff!", "Mmmf mnnf!")
    say_verbs = list("mumbles", "says")

// Clumsy folks can't take the mask off themselves.
/obj/item/clothing/mask/muzzle/attack_hand(mob/user as mob)
	if(user.wear_mask == src && !user.IsAdvancedToolUser())
		return 0
	..()

/obj/item/clothing/mask/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/device/assembly/voice))
		if(src.muffle_voice == TRUE)
			to_chat(user, SPAN_NOTICE("[src] already has a voice transmitter in it!"))
			return
		to_chat(user, SPAN_NOTICE("[user] installs a voice transmitter in [src]."))
		src.muffle_voice = TRUE
		qdel(W)

/obj/item/clothing/mask/surgical
	name = "sterile mask"
	desc = "A sterile mask designed to help prevent the spread of diseases."
	icon_state = "sterile"
	item_state = "sterile"
	w_class = ITEM_SIZE_SMALL
	body_parts_covered = FACE
	item_flags = FLEXIBLEMATERIAL
	gas_transfer_coefficient = 0.90
	permeability_coefficient = 0.01
	armor_list = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 75,
		rad = 0
	)
	price_tag = 10

/obj/item/clothing/mask/surgical/New()
	..()
	AddComponent(/datum/component/clothing_sanity_protection, NORMAL_MASK_SANITY_COEFF_BUFF)

//Alt race masks here
/obj/item/clothing/mask/surgical/kriosan
	name = "kriosan surgical mask"
	desc = "A sterile mask designed and fitted to help prevent the spread of diseases for your local kriosan."
	icon_state = "kriosan_sterile"
	flags_inv = HIDEFACE
	body_parts_covered = 0

//End

/obj/item/clothing/mask/snorkel
	name = "snorkel"
	desc = "Diving goggles complete with an attached air tube."
	icon_state = "snorkel"
	flags_inv = HIDEFACE
	body_parts_covered = 0

/obj/item/clothing/mask/ai
	name = "camera MIU"
	desc = "Allows for direct mental connection to accessible camera networks."
	icon_state = "s-ninja"
	item_state = "s-ninja"
	flags_inv = HIDEFACE
	body_parts_covered = 0
	var/mob/observer/eye/aiEye/eye

/obj/item/clothing/mask/ai/Initialize(mapload, ...)
	. = ..()
	eye = new(src)

/obj/item/clothing/mask/ai/equipped(var/mob/user, var/slot)
	..(user, slot)
	if(slot == slot_wear_mask)
		eye.owner = user
		user.eyeobj = eye

		for(var/datum/chunk/c in eye.visibleChunks)
			c.remove(eye)
		eye.setLoc(user)

/obj/item/clothing/mask/ai/dropped(var/mob/user)
	..()
	if(eye.owner == user)
		for(var/datum/chunk/c in eye.visibleChunks)
			c.remove(eye)

		eye.owner.eyeobj = null
		eye.owner = null

// Bandanas below
/obj/item/clothing/mask/bandana
	name = "black bandana"
	desc = "A black bandana with nanotech lining. Can be worn on the head or face."
	flags_inv = HIDEFACE
	slot_flags = SLOT_MASK|SLOT_HEAD
	body_parts_covered = FACE
	icon_state = "bandblack"
	item_state = "bandblack"
	item_flags = FLEXIBLEMATERIAL
	w_class = ITEM_SIZE_SMALL
	price_tag = 20
	muffle_voice = FALSE

/obj/item/clothing/mask/bandana/equipped(var/mob/user, var/slot)
	switch(slot)
		if(slot_wear_mask) //Mask is the default for all the settings
			flags_inv = HIDEFACE
			body_parts_covered = FACE
			icon_state = initial(icon_state)
		if(slot_head)
			flags_inv = 0
			body_parts_covered = HEAD
			icon_state = "[initial(icon_state)]_up"

	return ..()

/obj/item/clothing/mask/bandana/red
	name = "red bandana"
	desc = "A red bandana with nanotech lining. Can be worn on the head or face."
	icon_state = "bandred"
	item_state = "bandred"

/obj/item/clothing/mask/bandana/blue
	name = "blue bandana"
	desc = "A blue bandana with nanotech lining. Can be worn on the head or face."
	icon_state = "bandblue"
	item_state = "bandblue"

/obj/item/clothing/mask/bandana/green
	name = "green bandana"
	desc = "A green bandana with nanotech lining. Can be worn on the head or face."
	icon_state = "bandgreen"
	item_state = "bandgreen"

/obj/item/clothing/mask/bandana/yellow
	name = "yellow bandana"
	desc = "A yellow bandana with nanotech lining. Can be worn on the head or face."
	icon_state = "bandgold"
	item_state = "bandgold"

/obj/item/clothing/mask/bandana/orange
	name = "orange bandana"
	desc = "A orange bandana with nanotech lining. Can be worn on the head or face."
	icon_state = "bandorange"
	item_state = "bandorange"

/obj/item/clothing/mask/bandana/purple
	name = "purple bandana"
	desc = "A purple bandana with nanotech lining. Can be worn on the head or face."
	icon_state = "bandpurple"
	item_state = "bandpurple"

/obj/item/clothing/mask/rank/botanist
	name = "botany bandana"
	desc = "A botany bandana with nanotech lining. Can be worn on the head or face."
	icon_state = "bandbotany"
	item_state = "bandbotany"

/obj/item/clothing/mask/bandana/camo
	name = "camo bandana"
	desc = "A tactical camouflage bandana with nanotech lining. Can be worn on the head or face."
	icon_state = "bandcamo"
	item_state = "bandcamo"

/obj/item/clothing/mask/bandana/skull
	name = "skull bandana"
	desc = "A skull-pattern bandana with nanotech lining. Can be worn on the head or face."
	icon_state = "bandskull"
	item_state = "bandskull"
