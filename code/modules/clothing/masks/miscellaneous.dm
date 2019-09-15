/obj/item/clothing/mask/muzzle
	name = "muzzle"
	desc = "To stop that awful noise."
	icon_state = "muzzle"
	item_state = "muzzle"
	body_parts_covered = FACE
	w_class = ITEM_SIZE_SMALL
	gas_transfer_coefficient = 0.90
	voicechange = 1

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
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 60, rad = 0)
	price_tag = 10

/obj/item/clothing/mask/costume/misc/fakemoustache
	name = "fake moustache"
	desc = "A totally inconspicuous imitation moustache."
	icon_state = "fake-moustache"
	flags_inv = HIDEFACE
	body_parts_covered = 0

/obj/item/clothing/mask/snorkel
	name = "Snorkel"
	desc = "Diving goggles complete with an attached air tube."
	icon_state = "snorkel"
	flags_inv = HIDEFACE
	body_parts_covered = 0

//scarves (fit in in mask slot)
/obj/item/clothing/mask/scarf
	name = "blue neck scarf"
	desc = "A blue neck scarf."
	icon_state = "blue_scarf"
	item_state = "blue_scarf"
	body_parts_covered = FACE
	item_flags = FLEXIBLEMATERIAL
	w_class = ITEM_SIZE_SMALL
	gas_transfer_coefficient = 0.90
	price_tag = 50

/obj/item/clothing/mask/scarf/stripedblue
	name = "striped blue scarf"
	desc = "A striped blue scarf."
	icon_state = "stripedbluescarf"
	item_state = "stripedbluescarf"

/obj/item/clothing/mask/scarf/red
	name = "red scarf"
	desc = "A red neck scarf."
	icon_state = "red_scarf"
	item_state = "red_scarf"

/obj/item/clothing/mask/scarf/stripedred
	name = "striped red scarf"
	desc = "A striped red scarf."
	icon_state = "stripedredscarf"
	item_state = "stripedredscarf"

/obj/item/clothing/mask/scarf/redwhite
	name = "checkered scarf"
	desc = "A red and white checkered neck scarf."
	icon_state = "redwhite_scarf"
	item_state = "redwhite_scarf"

/obj/item/clothing/mask/scarf/green
	name = "green scarf"
	desc = "A green neck scarf."
	icon_state = "green_scarf"
	item_state = "green_scarf"

/obj/item/clothing/mask/scarf/stripedgreen
	name = "striped green scarf"
	desc = "A striped green scarf."
	icon_state = "stripedgreenscarf"
	item_state = "stripedgreenscarf"

/obj/item/clothing/mask/scarf/ninja
	name = "ninja scarf"
	desc = "A stealthy, ominous scarf."
	icon_state = "ninja_scarf"
	item_state = "ninja_scarf"
	siemens_coefficient = 0

/obj/item/clothing/mask/costume/animal/pig
	name = "pig mask"
	desc = "A rubber pig mask."
	icon_state = "pig"
	item_state = "pig"
	flags_inv = HIDEFACE|BLOCKHAIR
	w_class = ITEM_SIZE_SMALL
	siemens_coefficient = 0.9
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/costume/halloween/demon
	name = "demon mask"
	desc = "A rubber demon mask."
	icon_state = "demon"
	item_state = "demon"
	flags_inv = HIDEFACE|BLOCKHAIR
	w_class = ITEM_SIZE_SMALL
	siemens_coefficient = 0.9
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/costume/halloween/scarecrow
	name = "scarecrow sack"
	desc = "A decaying burlap sack with eyeholes."
	icon_state = "scarecrow"
	item_state = "scarecrow"
	flags_inv = HIDEFACE|BLOCKHAIR

/obj/item/clothing/mask/costume/halloween/mummy
	name = "mummy bandages"
	desc = "A firm wrap of sandy cloth covering the face."
	icon_state = "mummy"
	item_state = "mummy"
	flags_inv = HIDEFACE|BLOCKHAIR

/obj/item/clothing/mask/costume/animal/dolphin
	name = "dolphin mask"
	desc = "A rubber dolphin mask."
	icon_state = "dolphin"
	item_state = "dolphin"
	flags_inv = HIDEFACE|BLOCKHAIR
	w_class = ITEM_SIZE_SMALL
	siemens_coefficient = 0.9
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/costume/animal/shark
	name = "shark mask"
	desc = "A rubber shark mask."
	icon_state = "shark"
	item_state = "shark"
	flags_inv = HIDEFACE|BLOCKHAIR
	w_class = ITEM_SIZE_SMALL
	siemens_coefficient = 0.9
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/costume/halloween/goblin
	name = "goblin mask"
	desc = "A rubber goblin mask."
	icon_state = "goblin"
	item_state = "goblin"
	flags_inv = HIDEFACE|BLOCKHAIR
	w_class = ITEM_SIZE_SMALL
	siemens_coefficient = 0.9
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/costume/misc/guy
	name = "guy fawkes mask"
	desc = "A mask stylised to depict Guy Fawkes."
	icon_state = "guyfawkes"
	item_state = "guyfawkes"
	flags_inv = HIDEFACE|BLOCKHAIR
	w_class = ITEM_SIZE_SMALL
	siemens_coefficient = 0.9
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/costume/misc/gondola
	name = "gondola mask"
	desc = "A mask resembling some sort of strange creature."
	icon_state = "gondola"
	item_state = "gondola"
	flags_inv = HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/costume/misc/tiki
	name = "startled tiki mask"
	desc = "A primitive wooden mask. This one has a shocked expression."
	icon_state = "tiki_eyebrow"
	item_state = "tiki_eyebrow"

/obj/item/clothing/mask/costume/misc/tiki/angry
	name = "angry tiki mask"
	desc = "A primitive wooden mask. This one looks furious about something."
	icon_state = "tiki_angry"
	item_state = "tiki_angry"

/obj/item/clothing/mask/costume/misc/tiki/confused
	name = "confused tiki mask"
	desc = "A primitive wooden mask. This one doesn't seem very sure of itself."
	icon_state = "tiki_confused"
	item_state = "tiki_confused"

/obj/item/clothing/mask/costume/misc/tiki/happy
	name = "happy tiki mask"
	desc = "A primitive wooden mask. This one is smiling with joy."
	icon_state = "tiki_happy"
	item_state = "tiki_happy"

/obj/item/clothing/mask/costume/animal/horse
	name = "horse mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a horse."
	icon_state = "horsehead"
	item_state = "horsehead"
	flags_inv = HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES
	w_class = ITEM_SIZE_SMALL
	siemens_coefficient = 0.9

/obj/item/clothing/mask/costume/animal/horse/New()
    ..()
    // The horse mask doesn't cause voice changes by default, the wizard spell changes the flag as necessary
    say_messages = list("NEEIIGGGHHHH!", "NEEEIIIIGHH!", "NEIIIGGHH!", "HAAWWWWW!", "HAAAWWW!")
    say_verbs = list("whinnies", "neighs", "says")

/obj/item/clothing/mask/ai
	name = "camera MIU"
	desc = "Allows for direct mental connection to accessible camera networks."
	icon_state = "s-ninja"
	item_state = "s-ninja"
	flags_inv = HIDEFACE
	body_parts_covered = 0
	var/mob/observer/eye/aiEye/eye

/obj/item/clothing/mask/ai/New()
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

/obj/item/clothing/mask/bandana/botany
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