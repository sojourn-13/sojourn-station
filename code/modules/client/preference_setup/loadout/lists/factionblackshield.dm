/datum/gear/factionblackshield
	display_name = "beret, blackshield"
	path = /obj/item/clothing/head/rank/trooper/beret
	allowed_roles = list(JOBS_BLACKSHIELD)
	slot = slot_head
	sort_category = "Faction: Blackshield"
	cost = 0

/datum/gear/factionblackshield/captrooper
	display_name = "cap, blackshield"
	path = /obj/item/clothing/head/rank/trooper/cap

/datum/gear/factionblackshield/radiohat // THINK FAST CHUCKLENUTS!
	display_name = "radio cap, blackshield"
	path = /obj/item/device/radio/headset/radiohat_blackshield

/datum/gear/factionblackshield/gloves
	display_name = "blackshield combat gloves"
	path = /obj/item/clothing/gloves/thick/swat/blackshield
	slot = slot_gloves

/datum/gear/factionblackshield/cadet
	display_name = "uniform, cadet"
	path = /obj/item/clothing/under/rank/trooper/cadet
	allowed_roles = list("Corpsman","Blackshield Trooper", "Blackshield Cadet")
	slot = slot_w_uniform

/datum/gear/factionblackshield/gorkasecurity
	display_name = "gorka jumpsuit, security"
	path = /obj/item/clothing/under/rank/security/gorka_ih
	allowed_roles = list("Blackshield Commander","Sergeant","Blackshield Trooper", "Blackshield Cadet")
	slot = slot_w_uniform

/datum/gear/factionblackshield/gorka_pants
	display_name = "gorka security pants"
	path = /obj/item/clothing/under/rank/security/gorkapantsih
	allowed_roles = list("Blackshield Commander","Sergeant","Blackshield Trooper", "Blackshield Cadet")
	slot = slot_w_uniform

/datum/gear/factionblackshield/gorka_pants
	display_name = "gorka security med pants"
	path = /obj/item/clothing/under/rank/medspec/gorkapantsihmed
	allowed_roles = list("Corpsman")
	slot = slot_w_uniform

/datum/gear/factionblackshield/gorkasecuritymed
	display_name = "gorka blue med jumpsuit, security"
	path = /obj/item/clothing/under/rank/medspec/gorka_ih_med_b
	allowed_roles = list("Corpsman")
	slot = slot_w_uniform

/datum/gear/factionblackshield/gorkasecuritygreenmed
	display_name = "gorka green med jumpsuit, security"
	path = /obj/item/clothing/under/rank/medspec/gorka_ih_med_g
	allowed_roles = list("Corpsman")
	slot = slot_wear_suit

/datum/gear/factionblackshield/gorka_ih
	display_name = "gorka jacket, security"
	path = /obj/item/clothing/suit/gorka/toggle/gorka_ih
	allowed_roles = list("Blackshield Commander","Sergeant","Blackshield Trooper", "Blackshield Cadet")
	slot = slot_wear_suit

/datum/gear/factionblackshield/gorka_ih_med_b
	display_name = "gorka jacket, security medical blue"
	path = /obj/item/clothing/suit/gorka/toggle/gorka_ih/ih_med_b
	allowed_roles = list("Corpsman")
	slot = slot_wear_suit

/datum/gear/factionblackshield/gorka_ih_med_g
	display_name = "gorka jacket, security medical green"
	path = /obj/item/clothing/suit/gorka/toggle/gorka_ih/ih_med_g
	allowed_roles = list("Corpsman")
	slot = slot_wear_suit

/datum/gear/factionsecurity/bdu
	display_name = "blackshield battle dress uniform"
	path = /obj/item/clothing/under/rank/bdu/trooper
	slot = slot_w_uniform

/datum/gear/factionblackshield/blackshield
	display_name = "cloak selection, blackshield"
	path = /obj/item/clothing/accessory/job/cape/blackshield
	slot = slot_wear_suit
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/factionblackshield/blackcoat
	display_name = "longcoat selection, blackshield"
	path = /obj/item/clothing/accessory/bscloak
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/factionblackshield/fatigueselection
	display_name = "fatigue selection"
	path = /obj/item/clothing/under/rank/fatigues/
	slot = slot_w_uniform

/datum/gear/factionblackshield/fatigueselection/New() //Like so.
	..()
	var/fatigues = list(
		"Green Fatigues"				=	/obj/item/clothing/under/rank/fatigues,
		"Navy Fatigues"			=	/obj/item/clothing/under/rank/fatigues/navy,
		"Grey Fatigues"			=	/obj/item/clothing/under/rank/fatigues/grey,
		"Camo Fatigues"				=	/obj/item/clothing/under/rank/fatigues/camo,
		"Tan Fatigues"				=	/obj/item/clothing/under/rank/fatigues/tan,
		"Alt Grey Fatigues"				=	/obj/item/clothing/under/rank/fatigues/kav,
		"Alt Green Fatigues"				=	/obj/item/clothing/under/rank/fatigues/kav/green,
		"Alt Tan Fatigues"				=	/obj/item/clothing/under/rank/fatigues/kav/tan,
		"Alt Jungle Fatigues"				=	/obj/item/clothing/under/rank/fatigues/kav/jungle,
	)
	gear_tweaks += new /datum/gear_tweak/path(fatigues)


/datum/gear/factionblackshield/fatiguecoverselection
	display_name = "fatigue cover selection"
	path = /obj/item/clothing/head/rank/fatigue/
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/factionblackshield/blackshieldbackpack
	display_name = "green blackshield backpack"
	path = /obj/item/storage/backpack/militia/green
	slot = slot_back
