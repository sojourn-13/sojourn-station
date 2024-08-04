/datum/gear/factionsecurity
	display_name = "winter coat, security"
	path = /obj/item/clothing/suit/hooded/wintercoat/security
	allowed_roles = list(JOBS_SECURITY)
	slot = slot_wear_suit
	sort_category = "Faction: Security"
	cost = 0

/datum/gear/factionsecurity/ironhammer_wintercoat //it's just a generic marshal plate carrier coat with no added coverage -Dongels
	display_name = "security armored coat"
	path = /obj/item/clothing/suit/armor/vest/ironhammer_wintercoat

/datum/gear/factionsecurity/miljacket_marshal //it's a Jacket for Marshals Commisioned by pneumo/husky and sprited/coded by Dromkii
	display_name = "marshal jacket"
	path = /obj/item/clothing/suit/storage/toggle/miljacket_marshal

/datum/gear/factionsecurity/snowsuitsecurity
	display_name = "snowsuit, security"
	path = /obj/item/clothing/suit/storage/snowsuit/security

/datum/gear/factionsecurity/beretcommander
	display_name = "beret, security head"
	path = /obj/item/clothing/head/rank/commander
	allowed_roles = list("Warrant Officer")
	slot = slot_head

/datum/gear/factionsecurity/beretwarden
	display_name = "beret, supply specialist"
	path = /obj/item/clothing/head/rank/warden/beret
	allowed_roles = list("Supply Specialist")
	slot = slot_head

/datum/gear/factionsecurity/beretironhammer
	display_name = "beret, security"
	path = /obj/item/clothing/head/rank/ironhammer
	allowed_roles = list("Ranger","Marshal Officer", "Marshal Officer Jr")
	slot = slot_head

/datum/gear/factionsecurity/capsarge
	display_name = "cap, supply specialist"
	path = /obj/item/clothing/head/soft/sarge2soft
	allowed_roles = list("Supply Specialist")
	slot = slot_head

/datum/gear/factionsecurity/capofficer
	display_name = "cap, officer"
	path = /obj/item/clothing/head/rank/janacap
	slot = slot_head

/datum/gear/factionsecurity/capfield
	display_name = "cap, field"
	path = /obj/item/clothing/head/soft/sec2soft
	slot = slot_head

/datum/gear/factionsecurity/cappatrolblue
	display_name = "cap, patrol blue"
	path = /obj/item/clothing/head/seccap
	slot = slot_head

/datum/gear/factionsecurity/cappatrolblack
	display_name = "cap, patrol black"
	path = /obj/item/clothing/head/seccorp
	slot = slot_head

/datum/gear/factionsecurity/cloak
	display_name = "cloak, warrant officer"
	path = /obj/item/clothing/accessory/job/cape/ihc
	allowed_roles = list("Warrant Officer")
	slot = slot_wear_suit
	sort_category = "Faction: Security"

/datum/gear/factionsecurity/cloakironhammer
	display_name = "cloak, security"
	path = /obj/item/clothing/accessory/job/cape/ironhammer

/datum/gear/factionsecurity/bdu
	display_name = "security battle dress uniform"
	path = /obj/item/clothing/under/rank/bdu/marshal
	slot = slot_w_uniform

/datum/gear/factionsecurity/winterbootssecurity
	display_name = "winter boots, security"
	path = /obj/item/clothing/shoes/winter/security
	slot = slot_shoes

/datum/gear/factionsecurity/secpatch
	display_name = "HUD eyepatch"
	path = /obj/item/clothing/glasses/eyepatch/secpatch

/datum/gear/factionsecurity/secglasses
	display_name = "HUD Glasses"
	path = /obj/item/clothing/glasses/sechud
	cost = 2 //has flash protection

/datum/gear/factionsecurity/security
	display_name = "security HUD"
	path = /obj/item/clothing/glasses/hud/security

/datum/gear/factionsecurity/security_tact
	display_name = "tactical security HUD"
	path = /obj/item/clothing/glasses/sechud/tactical
	cost = 2 //has flash protection
