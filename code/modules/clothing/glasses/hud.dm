/obj/item/clothing/glasses/hud
	name = "HUD"
	desc = "A heads-up display that provides important info in (almost) real time."
	flags = 0 //doesn't protect eyes because it's a monocle, duh
	prescription = TRUE
	origin_tech = list(TECH_MAGNET = 3, TECH_BIO = 2)
	var/list/icon/current = list() //the current hud icons
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1, MATERIAL_SILVER = 0.5)
	price_tag = 200

/obj/item/clothing/glasses/proc/process_hud(var/mob/M)
	if(hud)
		hud.process_hud(M)

/obj/item/clothing/glasses/hud/process_hud(var/mob/M)
	return

/obj/item/clothing/glasses/hud/health
	name = "health scanner HUD"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their health status."
	icon_state = "healthhud"
	body_parts_covered = 0

/obj/item/clothing/glasses/hud/health/scouter
	name = "health scanner HUD"
	desc = "A low profile heads-up display that scans the humans in view and provides accurate data about their health status."
	icon_state = "healthscouter"
	body_parts_covered = 0

/obj/item/clothing/glasses/hud/health/halfmoon
	name = "health scanner HUD"
	desc = "Sleek rimless halfmoon glasses that sit tight on the nose bridge.  A blur of medical information zips across it's opulent lens."
	icon_state = "healthhalfmoon"
	body_parts_covered = 0

/obj/item/clothing/glasses/hud/health/process_hud(var/mob/M)
	process_med_hud(M, 1)

/obj/item/clothing/glasses/hud/security
	name = "security HUD"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their ID status and security records."
	icon_state = "securityhud"
	flash_protection = FLASH_PROTECTION_MINOR
	body_parts_covered = 0
	var/global/list/jobs[0]

/obj/item/clothing/glasses/hud/security/jensenshades
	name = "augmented shades"
	desc = "Polarized bioneural eyewear, designed to augment your vision."
	icon_state = "jensenshades"
	item_state = "jensenshades"
	flash_protection = FLASH_PROTECTION_MINOR
	vision_flags = SEE_MOBS
	see_invisible = SEE_INVISIBLE_NOLIGHTING

/obj/item/clothing/glasses/hud/security/process_hud(var/mob/M)
	process_sec_hud(M, 1)

/obj/item/clothing/glasses/sechud
	name = "HUD sunglasses"
	desc = "A pair of stylish sunglasses with an integrated Security-HUD. No one said cops couldn't be stylish."
	icon_state = "sunhud"
	prescription = TRUE
	flash_protection = FLASH_PROTECTION_MINOR

	New()
		..()
		src.hud = new/obj/item/clothing/glasses/hud/security(src)
		return

/obj/item/clothing/glasses/sechud/tactical
	name = "security tactical HUD"
	desc = "Improved Flash-resistant goggles with inbuilt combat and security information."
	flash_protection = FLASH_PROTECTION_MODERATE
	icon_state = "swatgoggles"

/obj/item/clothing/glasses/hud/broken/process_hud(mob/M)
	process_broken_hud(M, 1)
