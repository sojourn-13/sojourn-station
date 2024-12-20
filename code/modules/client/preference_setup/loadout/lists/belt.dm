/datum/gear/belt
	display_name = "champion belt"
	path = /obj/item/storage/belt/champion
	slot = slot_belt
	sort_category = "Utility belts"
	cost = 4

/datum/gear/belt/tool
	display_name = "tool belt"
	path = /obj/item/storage/belt/utility
	cost = 2


/datum/gear/belt/sheath
	display_name = "sheath for cheap blades"
	path = /obj/item/storage/sheath/non_church/general
	cost = 1

/datum/gear/belt/toolbelt
	display_name = "handmade tool belt"
	path = /obj/item/storage/belt/utility/handmade
	cost = 2

/datum/gear/belt/nt_belt
	display_name = "Absolutism utility belt"
	path = /obj/item/storage/belt/utility/neotheology
	allowed_roles = list("Prime","Vector")
	cost = 2

/datum/gear/belt/nt_belt_tactical
	display_name = "Absolutism tactical belt"
	path = /obj/item/storage/belt/security/neotheology
	allowed_roles = list("Prime","Vector")
	cost = 3


/datum/gear/belt/medbelt
	display_name = "Medical belt Selection"
	path = /obj/item/storage/belt/medical
	allowed_roles = list("Soteria Doctor","Soteria Biolab Officer","Soteria Lifeline Technician")
	cost = 1

/datum/gear/belt/medbelt/New()
	..()
	var/belts = list(
		"Medical Belt"				=	/obj/item/storage/belt/medical,
		"EMT Belt"			=	/obj/item/storage/belt/medical/emt,
	)
	gear_tweaks += new /datum/gear_tweak/path(belts)


