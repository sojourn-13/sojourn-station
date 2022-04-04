/datum/design/research/item/chameleon_kit
	name = "Chameleon Kit"
	desc = "A kit containing a full set of clothes and a toy gun with dials to change their appearance. Impersonate anyone!"
	build_path = /obj/item/storage/box/syndie_kit/chameleon
	category = CAT_CLOTHING

/datum/design/research/item/binaryencrypt
	name = "Binary Encryption Key"
	desc = "Allows for deciphering the binary channel on-the-fly."
	build_path = /obj/item/device/encryptionkey/binary
	category = "Bluespace Telecoms"

/datum/design/research/item/night_goggles
	name = "Night Vision Goggles"
	desc = "Goggles that use a small cell to magnify visible light perceived, allowing you to see better in the dark."
	build_path = /obj/item/clothing/glasses/powered/night
	category = CAT_CLOTHING

/datum/design/research/item/thermal_goggles
	name = "Thermal Vision Goggles"
	desc = "Goggles that use a small cell to perceive heat-emitting lifeforms through walls."
	build_path = /obj/item/clothing/glasses/powered/thermal
	category = CAT_CLOTHING

/datum/design/research/item/glowstick
	name = "Undark Glowstick"
	desc = "A refined cocktail of all the needed things to glow in the dark!"
	build_path = /obj/item/device/lighting/glowstick/undark //Yes 1920s were a wild time
	chemicals = list("radium" = 5, "phosphorus" = 10)
	materials = list(MATERIAL_GLASS = 2, MATERIAL_PLASTIC = 15)

/datum/design/research/item/cleaner
	name = "SI \"Spot\" Cleaning Pistol"
	desc = "After extensive study of the cleaner carbine and some schematics obtained under shady circumstances some clean freaks made a lesser but far more compact version of the Old Testament favorite."
	materials = list(MATERIAL_PLASTEEL = 10, MATERIAL_WOOD = 8, MATERIAL_PLASTIC = 20) //No free refills
	build_path = /obj/item/gun/matter/launcher/nt_sprayer/mini
