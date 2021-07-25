/obj/item/legcuffs
	name = "leg cuffs"
	desc = "Use this to keep prisoners in line."
	gender = PLURAL
	icon = 'icons/obj/items.dmi'
	icon_state = "handcuff"
	flags = CONDUCT
	throwforce = WEAPON_FORCE_HARMLESS
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 1)
	matter = list(MATERIAL_STEEL = 2)
	var/breakouttime = 300	//Deciseconds = 30s = 0.5 minute

/obj/item/legcuffs/fuzzy
	name = "fuzzy leg cuffs"
	icon_state = "fuzzylegcuff"
	breakouttime = 150
	desc = "Use this to keep... 'prisoners' in line."
