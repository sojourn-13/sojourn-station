/datum/gear/factionironhammer/detcorporate
	display_name = "inspectors uniform"
	path = /obj/item/clothing/under/rank/inspector/uniform
	allowed_roles = list("Ironhammer Inspector")
	slot = slot_w_uniform
	sort_category = "Faction: Ironhammer"

/datum/gear/factionironhammer/beret/bsec_officer
	display_name = "beret, operative"
	path = /obj/item/clothing/head/sec/navy/officer
	allowed_roles = list("Ironhammer Operative")
	slot = slot_head
	sort_category = "Faction: Ironhammer"

/datum/gear/factionironhammer/beret/bsec_warden
	display_name = "beret, warden"
	path = /obj/item/clothing/head/sec/navy/warden
	allowed_roles = list("Ironhammer Gunnery Sergeant")
	slot = slot_head
	sort_category = "Faction: Ironhammer"

/datum/gear/factionironhammer/beret/bsec_hos
	display_name = "beret, commander"
	path = /obj/item/clothing/head/sec/navy/hos
	allowed_roles = list("Ironhammer Commander")
	slot = slot_head
	sort_category = "Faction: Ironhammer"

/datum/gear/factionironhammer/corp
	display_name = "cap, inspector"
	path = /obj/item/clothing/head/seccorp
	allowed_roles = list("Ironhammer Inspector")
	slot = slot_head
	sort_category = "Faction: Ironhammer"

/datum/gear/factionironhammer
	display_name = "cap, ironhammer"
	path = /obj/item/clothing/head/seccap
	allowed_roles = list("Ironhammer Operative","Ironhammer Commander","Ironhammer Gunnery Sergeant", "Ironhammer Inspector", "Ironhammer Medical Specialist")
	slot = slot_head
	sort_category = "Faction: Ironhammer"

/datum/gear/factionironhammer/security
	display_name = "security HUD"
	path = /obj/item/clothing/glasses/hud/security
	allowed_roles = list(JOBS_SECURITY)
	slot = slot_glasses
	sort_category = "Faction: Ironhammer"

/datum/gear/factionironhammer/holster
	display_name = "holster selection"
	path = /obj/item/clothing/accessory/holster
	flags = GEAR_HAS_TYPE_SELECTION
	allowed_roles = list("Ironhammer Commander","Ironhammer Gunnery Sergeant","Ironhammer Inspector","Ironhammer Medical Specialist","Ironhammer Operative","First Officer","Captain")
	sort_category = "Faction: Ironhammer"

/datum/gear/factionironhammer/cloakironhammer
	display_name = "cloak, ironhammer"
	path = /obj/item/clothing/suit/hooded/cloak/job/ironhammer
	allowed_roles = list("Ironhammer Operative","Ironhammer Commander","Ironhammer Gunnery Sergeant", "Ironhammer Inspector", "Ironhammer Medical Specialist")
	slot = slot_wear_suit
	sort_category = "Faction: Ironhammer"

/datum/gear/factionironhammer/cloakihc
	display_name = "cloak, ironhammer commander"
	path = /obj/item/clothing/suit/hooded/cloak/job/ihc
	allowed_roles = list("Ironhammer Commander")
	slot = slot_wear_suit
	sort_category = "Faction: Ironhammer"
