/obj/item/clothing/glasses/eyepatch
	name = "eyepatch"
	desc = "A black patch worn to cover a single eye."
	icon_state = "eyepatch"
	item_state = "eyepatch"
	body_parts_covered = 0
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/glasses/eyepatch/attack_self()
	adjust()

/obj/item/clothing/glasses/eyepatch/verb/adjust()
	set category = "Object"
	set name = "Flip Eyepatch"
	set src in usr

	if(usr.canmove && !usr.stat && !usr.restrained())
		if(!src.active)
			src.active = !src.active
			icon_state = initial(icon_state)
			to_chat(usr, "You flip the eyepatch to cover your right eye.")
		else
			src.active = !src.active
			icon_state = "[initial(icon_state)]_left"
			to_chat(usr, "You flip the eyepatch to cover your left eye.")
		update_wear_icon()
		usr.update_action_buttons()

/obj/item/clothing/glasses/eyepatch_strapless
	name = "strapless eyepatch"
	desc = "A black strapless patch worn to cover a single eye."
	icon_state = "eyepatch_strapless"
	item_state = "eyepatch_strapless"
	body_parts_covered = 0

/obj/item/clothing/glasses/eyepatch_strapless/attack_self()
	adjust()

/obj/item/clothing/glasses/eyepatch_strapless/verb/adjust()
	set category = "Object"
	set name = "Flip Eyepatch"
	set src in usr

	if(usr.canmove && !usr.stat && !usr.restrained())
		if(!src.active)
			src.active = !src.active
			icon_state = initial(icon_state)
			to_chat(usr, "You flip the eyepatch to cover your right eye.")
		else
			src.active = !src.active
			icon_state = "[initial(icon_state)]_left"
			to_chat(usr, "You flip the eyepatch to cover your left eye.")
		update_wear_icon()
		usr.update_action_buttons()

/obj/item/clothing/glasses/monocle
	name = "monocle"
	desc = "A rather dapper eyeglass usually worn for cosmetic purposes."
	icon_state = "monocle"
	item_state = "headset" // lol
	body_parts_covered = 0

/obj/item/clothing/glasses/binoclard_lenses
	name = "binoclard lenses"
	desc = "Wide rim disks for glasses popularized back vagabonds and drifters alike."
	icon_state = "binoclard_lenses"
	item_state = "binoclard_lenses" // lol
	body_parts_covered = 0

/obj/item/clothing/glasses/scanners
	name = "scanning goggles"
	desc = "A very oddly shaped pair of goggles with bits of wire poking out the sides. A soft humming sound emanates from it."
	icon_state = "uzenwa_sissra_1"

/obj/item/clothing/glasses/regular
	name = "glasses"
	desc = "Standard glasses that correct and enhance vision."
	icon_state = "glasses"
	item_state = "glasses"
	prescription = 1
	body_parts_covered = 0

/obj/item/clothing/glasses/regular/hipster
	name = "hipster glasses"
	desc = "Trendy glasses that correct and enhance vision."
	icon_state = "hipster_glasses"
	item_state = "hipster_glasses"

/obj/item/clothing/glasses/threedglasses
	name = "3d glasses"
	desc = "Glasses that create threedimensional images. They also look cool."
	icon_state = "3d"
	item_state = "3d"
	body_parts_covered = 0
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/glasses/regular/gglasses
	name = "green glasses"
	desc = "Stylish glasses with a forest green tint."
	icon_state = "gglasses"
	item_state = "gglasses"
	body_parts_covered = 0

/obj/item/clothing/glasses/artist
	name = "4-D Glasses"
	desc = "You can see in every dimension, and get four times the amount of headache!"
	icon_state = "artist"
	item_state = "artist_glasses"
	body_parts_covered = 0

/obj/item/clothing/glasses/sunglasses
	name = "sunglasses"
	desc = "A pair of standard sunglasses."
	name = "sunglasses"
	icon_state = "sun"
	item_state = "sunglasses"
	darkness_view = -1
	flash_protection = FLASH_PROTECTION_MODERATE
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/glasses/sunglasses/big
	name = "large sunglasses"
	desc = "A rather large pair of sunglasses."
	icon_state = "bigsunglasses"
	item_state = "bigsunglasses"
	flash_protection = FLASH_PROTECTION_MAJOR
	darkness_view = -3
	obscuration = MEDIUM_OBSCURATION

/obj/item/clothing/glasses/sunglasses/helltaker // Part of the whole Helltaker dude drip. - Seb
	name = "devilish sunglasses"
	desc = "A stylish pair of small, circular sunglasses that keeps your eyes surprisingly well hidden."
	icon_state = "hellgoggles"
	item_state = "hellgoggles"
	flash_protection = FLASH_PROTECTION_MAJOR
	darkness_view = -3
	obscuration = MEDIUM_OBSCURATION

/obj/item/clothing/glasses/aviator
	name = "black aviators"
	desc = "A pair of black-tinted designer sunglasses."
	icon_state = "aviator"
	item_state = "aviator"
	darkness_view = -1
	flash_protection = FLASH_PROTECTION_MODERATE

/obj/item/clothing/glasses/aviator/red
	name = "red aviators"
	desc = "A pair of red-tinted designer sunglasses."
	icon_state = "aviator_sec"
	item_state = "aviator_sec"

/obj/item/clothing/glasses/aviator/green
	name = "green aviators"
	desc = "A pair of green-tinted designer sunglasses."
	icon_state = "aviator_eng"
	item_state = "aviator_eng"

/obj/item/clothing/glasses/aviator/blue
	name = "blue aviators"
	desc = "A pair of blue-tinted designer sunglasses."
	icon_state = "aviator_med"
	item_state = "aviator_med"

/obj/item/clothing/glasses/blindfold
	name = "blindfold"
	desc = "A material that covers the eyes, preventing sight."
	icon_state = "blindfold"
	item_state = "blindfold"
	tint = TINT_BLIND
	obscuration = HEAVY_OBSCURATION

/obj/item/clothing/glasses/blindfold/tape
	name = "length of tape"
	desc = "It's a robust DIY blindfold!"
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "tape_cross"
	item_state = null
	w_class = ITEM_SIZE_TINY

/obj/item/clothing/glasses/ballistic
	name = "ballistic goggles"
	desc = "Protects the eyes from sudden flashes, debris, and light shrapnel."
	icon_state = "ballistic"
	item_state = "ballistic"
	prescription = TRUE
	action_button_name = "Switch Polarization"
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 2)
	flash_protection = FLASH_PROTECTION_MODERATE

/obj/item/clothing/glasses/ballistic/attack_self()
	adjust()


/obj/item/clothing/glasses/ballistic/verb/adjust()
	set name = "Adjust goggle polarization"
	set category = "Object"
	set src in usr

	if(usr.canmove && !usr.stat && !usr.restrained())
		if(!src.active)
			src.active = !src.active
			flags_inv |= HIDEEYES
			body_parts_covered |= EYES
			icon_state = initial(icon_state)
			flash_protection = FLASH_PROTECTION_MAJOR
			darkness_view = -4
			to_chat(usr, "You switch \the [src]' polarization on to protect your eyes.")
		else
			src.active = !src.active
			flags_inv &= ~HIDEEYES
			body_parts_covered &= ~EYES
			icon_state = "[initial(icon_state)]off"
			flash_protection = FLASH_PROTECTION_MODERATE
			to_chat(usr, "You switch \the [src]' polarization to automatic.")
		update_wear_icon()
		usr.update_action_buttons()

/obj/item/clothing/glasses/ballistic/med
	name = "ballistic medHUD"
	desc = "A mediHUD visor constructed with more durable materials to protect your eyes against sudden flashes, debris and shrapnel."
	icon_state = "ballisticmed"
	item_state = "ballisticmed"

/obj/item/clothing/glasses/ballistic/med/process_hud(var/mob/M)
	process_med_hud(M, 1)

/obj/item/clothing/glasses/ballistic/perscription
	name = "perscription ballistic goggles"
	desc = "Protects the eyes from sudden flash, debris, and light shrapnel, and astigmatism."
	icon_state = "ballistic"
	item_state = "ballistic"
	prescription = 1
