/obj/item/organ/external/chest/exalt
	default_description = /datum/organ_description/chest/exalt
	nature = MODIFICATION_SUPERIOR

/obj/item/organ/external/groin/exalt
	default_description = /datum/organ_description/groin/exalt
	nature = MODIFICATION_SUPERIOR

/obj/item/organ/external/head/exalt
	default_description = /datum/organ_description/head/exalt
	nature = MODIFICATION_SUPERIOR

/obj/item/organ/external/head/exalt/New(mob/living/carbon/human/holder, datum/organ_description/OD)
	..(holder, OD)
	var/obj/item/organ_module/install_implant = new /obj/item/organ_module/active/hud/night_bio
	install_implant.install(src)

/obj/item/organ/external/exalt
	nature = MODIFICATION_SUPERIOR