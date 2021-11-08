/obj/item/clothing/glasses/hud/health/shades
	name = "augmented health scanner shades"
	desc = "A heads-up display that scans the humanoids in view and provides accurate data about their health status."
	icon_state = "medshades"
	item_state = "medshades"
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1)

/obj/item/clothing/glasses/hud/security/shades
	name = "augmented security shades"
	desc = "A heads-up display that scans the humanoids in view and provides accurate data about their ID status and security records."
	icon_state = "secshades"
	item_state = "secshades"
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1)

/obj/item/clothing/glasses/shades/night
	name = "augmented night vision shades"
	desc = "You can totally see in the dark now!"
	icon_state = "nightshades"
	item_state = "nightshades"
	darkness_view = 7
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	origin_tech = list(TECH_MAGNET = 3)
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1, MATERIAL_SILVER = 0.5)

/obj/item/clothing/glasses/shades/night/Initialize()
	. = ..()
	screenOverlay = global_hud.nvg

/obj/item/clothing/glasses/shades/thermal
	name = "augmented thermal shades"
	desc = "Thermals in the shape of glasses."
	icon_state = "thermalshades"
	item_state = "thermalshades"
	vision_flags = SEE_MOBS
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	flash_protection = FLASH_PROTECTION_REDUCED
	origin_tech = list(TECH_MAGNET = 3, TECH_ILLEGAL = 4)
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1, MATERIAL_DIAMOND = 1)

/obj/item/clothing/glasses/shades/thermal/Initialize()
	. = ..()
	screenOverlay = global_hud.thermal

/obj/item/clothing/glasses/welding/superior/shades
	name = "augmented welding shades"
	desc = "Welding goggles made from more expensive materials."
	icon_state = "weldershades"
	item_state = "weldershades"
	prescription = TRUE
	tint = TINT_NONE
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1)

/obj/item/clothing/glasses/shades/thermal/bio
	name = "augmented bio-thermal shades"
	desc = "Thermals in the shape of eyes. These ones are... twitching."
	icon_state = "bioshades"
	item_state = "bioshades"
	origin_tech = list(TECH_BIO = 12)
	matter = list(MATERIAL_BIOMATTER = 1)

/obj/item/clothing/glasses/welding/superior/shades/bio
	name = "augmented bio-welding shades"
	desc = "Welding goggles made from biomatter. These ones are... twitching."
	icon_state = "bioshades"
	item_state = "bioshades"
	origin_tech = list(TECH_BIO = 4)
	matter = list(MATERIAL_BIOMATTER = 1)

/obj/item/clothing/glasses/shades/night/bio
	name = "augmented bio-night vision shades"
	desc = "Night-vision goggles made from biomass. These ones are... twitching."
	icon_state = "bioshades"
	item_state = "bioshades"
	origin_tech = list(TECH_BIO = 8)
	matter = list(MATERIAL_BIOMATTER = 1)

/obj/item/clothing/glasses/shades/night/bio_mycus
	name = "fungal night vision membrane"
	desc = "A special fungal membrane created by the mycus that allows them to see in the dark."
	icon_state = "mycus_eye"
	item_state = "mycus_eye"
	origin_tech = list(TECH_BIO = 8)
	matter = list(MATERIAL_BIOMATTER = 1)

/obj/item/biogoop/thermal
	name = "incomplete organic thermal implant"
	matter = list(MATERIAL_BIOMATTER = 240)

/obj/item/biogoop/thermal/attackby(obj/item/I, mob/user)
	if(istype(I,/obj/item/stack/nanopaste))
		var/obj/item/stack/S = I
		if(S.use(1))
			to_chat(user, SPAN_NOTICE("You apply the nanite matrix, shaping the bioaugment into the hunter."))
			playsound(loc, 'sound/items/biotransform.ogg', 50, 1)
			new /obj/item/organ_module/active/hud/thermal_bio(get_turf(src))
			qdel(src)
			return
	return ..()

/obj/item/biogoop/welding
	name = "incomplete organic welder implant"
	matter = list(MATERIAL_BIOMATTER = 40)

/obj/item/biogoop/welding/attackby(obj/item/I, mob/user)
	if(istype(I,/obj/item/stack/nanopaste))
		var/obj/item/stack/S = I
		if(S.use(1))
			to_chat(user, SPAN_NOTICE("You apply the nanite matrix, shaping the bioaugment into the shade."))
			playsound(loc, 'sound/items/biotransform.ogg', 50, 1)
			new /obj/item/organ_module/active/hud/welder_bio(get_turf(src))
			qdel(src)
			return
	return ..()

/obj/item/biogoop/night
	name = "incomplete organic night-vision implant"
	matter = list(MATERIAL_BIOMATTER = 120)

/obj/item/biogoop/night/attackby(obj/item/I, mob/user)
	if(istype(I,/obj/item/stack/nanopaste))
		var/obj/item/stack/S = I
		if(S.use(1))
			to_chat(user, SPAN_NOTICE("You apply the nanite matrix, shaping the bioaugment into the haunt."))
			playsound(loc, 'sound/items/biotransform.ogg', 50, 1)
			new /obj/item/organ_module/active/hud/night_bio(get_turf(src))
			qdel(src)
			return
	return ..()
