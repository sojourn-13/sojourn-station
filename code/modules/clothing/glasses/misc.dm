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
			item_state = initial(item_state)
			to_chat(usr, "You flip the eyepatch to cover your right eye.")
		else
			src.active = !src.active
			icon_state = "[initial(icon_state)]_left"
			item_state = "[initial(item_state)]_left"
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

/obj/item/clothing/glasses/eyepatch/medpatch
	name = "MediHUD eyepatch"
	desc = "An eyepatch worn to cover a single eye, with a built-in heads-up display that scans the humans in view and provides accurate data about their health status."
	icon_state = "hudpatch"
	item_state = "hudpatch"

/obj/item/clothing/glasses/eyepatch/medpatch/process_hud(var/mob/M)
	process_med_hud(M, 1)

/obj/item/clothing/glasses/eyepatch/secpatch
	name = "Tactical HUD eyepatch"
	desc = "An eyepatch worn to cover a single eye, with a built-in heads-up display for combat and security information."
	icon_state = "secpatch"
	item_state = "secpatch"
	flash_protection = FLASH_PROTECTION_MINOR // They cover just one eye!

/obj/item/clothing/glasses/eyepatch/secpatch/process_hud(var/mob/M)
	process_sec_hud(M, 1)

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
	prescription = 1

/obj/item/clothing/glasses/binoclard_lenses/dark
	name = "dark binoclard glasses"
	desc = "Standard glasses that correct and enhance vision. These ones are a darker rounded lens to allow rule of cool rather then protection."
	icon_state = "black_binoclard_lenses"
	item_state = "black_binoclard_lenses"

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

/obj/item/clothing/glasses/regular/hack_lens
	name = "hacker goggles"
	desc = "A green fake hud deplay for tacticool operations, also correct and enhance vision."
	icon_state = "hacker_glasses" //Sprite by Odio_el_Comino#2671
	item_state = "hacker_glasses"

/obj/item/clothing/glasses/regular/hack_lens/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Flip Down"] = "hacker_glasses"
	options["Flip Up"] = "hacker_glasses_up"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

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
	flash_protection = FLASH_PROTECTION_MINOR
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/glasses/sunglasses/big
	name = "large sunglasses"
	desc = "A rather large pair of sunglasses."
	icon_state = "bigsunglasses"
	item_state = "bigsunglasses"
	flash_protection = FLASH_PROTECTION_MINOR
	darkness_view = -1
	obscuration = MEDIUM_OBSCURATION

/obj/item/clothing/glasses/sunglasses/helltaker // Part of the whole Helltaker dude drip. - Seb
	name = "devilish sunglasses"
	desc = "A stylish pair of small, circular sunglasses that keeps your eyes surprisingly well hidden."
	icon_state = "hellgoggles"
	item_state = "hellgoggles"
	flash_protection = FLASH_PROTECTION_MINOR
	darkness_view = -1
	obscuration = MEDIUM_OBSCURATION

/obj/item/clothing/glasses/aviator
	name = "black aviators"
	desc = "A pair of black-tinted designer sunglasses."
	icon_state = "aviator"
	item_state = "aviator"
	darkness_view = -1
	flash_protection = FLASH_PROTECTION_MINOR

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
	flash_protection = FLASH_PROTECTION_MAJOR // You are literally blind wearing these.

/obj/item/clothing/glasses/blindfold/tape
	name = "length of tape"
	desc = "It's a robust DIY blindfold!"
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "tape_cross"
	item_state = null
	w_class = ITEM_SIZE_TINY

/obj/item/clothing/glasses/crayon_blindfold
	name = "tineidae blindfold"
	desc = "A blindfold worn by priests and priestesses of the Papilionis Order to ritualistically cover their eyes. \
			They attune with their user, allowing a greater range of perception."
	icon_state = "crayon_blindfold"
	tint = TINT_BLIND // For non-cultists
	obscuration = MEDIUM_OBSCURATION // Still hard to aim a gun with a literal blindfold
	flash_protection = FLASH_PROTECTION_MAJOR // By all intents and purposes, a blindfold
	var/sight_modifier = FALSE
	var/sight_bonus = FALSE

/obj/item/clothing/glasses/crayon_blindfold/equipped(var/mob/M)
	.=..()
	update_blindfold(M)

/obj/item/clothing/glasses/crayon_blindfold/dropped(var/mob/M)
	.=..()
	update_blindfold(M)

/obj/item/clothing/glasses/crayon_blindfold/proc/update_blindfold(mob/living/carbon/human/user)
	if(istype(user))
		if(user.glasses == src && !sight_modifier)
			for(var/datum/language/L in user.languages) // Give bonuses only to cultists that are nearsighted/blinded
				if((L.name == LANGUAGE_CULT || L.name == LANGUAGE_OCCULT) && (user.disabilities&NEARSIGHTED || user.disabilities&BLIND))
					user.additional_darksight += 1
					prescription = 1
					darkness_view = 7
					tint = TINT_NONE
					sight_modifier = TRUE
					sight_bonus = TRUE
				else
					prescription = 0
					darkness_view = 0
					tint = TINT_BLIND
					sight_modifier = TRUE
					sight_bonus = TRUE
		if(sight_bonus && !(user.glasses == src)) // We back to our initial stats in case it gets picked up by noncultists
			user.additional_darksight -= 1
			prescription = 0
			darkness_view = 0
			tint = TINT_BLIND
			sight_modifier = FALSE
			sight_bonus = FALSE


/obj/item/clothing/glasses/ballistic
	name = "ballistic goggles"
	desc = "Protects the eyes from sudden flashes, debris, and light shrapnel."
	icon_state = "ballistic"
	item_state = "ballistic"
	prescription = TRUE
	action_button_name = "Switch Polarization"
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 2)
	flash_protection = FLASH_PROTECTION_MINOR

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
			flash_protection = FLASH_PROTECTION_MODERATE
			darkness_view = -4
			to_chat(usr, "You switch \the [src]' polarization on to protect your eyes.")
		else
			src.active = !src.active
			flags_inv &= ~HIDEEYES
			body_parts_covered &= ~EYES
			icon_state = "[initial(icon_state)]off"
			flash_protection = FLASH_PROTECTION_MINOR
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
