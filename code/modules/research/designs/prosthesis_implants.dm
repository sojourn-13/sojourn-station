//Prosthesis ====================================

/datum/design/research/item/mechfab/prosthesis
	category = CAT_PROSTHESIS
	starts_unlocked = TRUE

/datum/design/research/item/mechfab/prosthesis/r_arm
	build_path = /obj/item/organ/external/robotic/r_arm

/datum/design/research/item/mechfab/prosthesis/l_arm
	build_path = /obj/item/organ/external/robotic/l_arm

/datum/design/research/item/mechfab/prosthesis/r_leg
	build_path = /obj/item/organ/external/robotic/r_leg

/datum/design/research/item/mechfab/prosthesis/l_leg
	build_path = /obj/item/organ/external/robotic/l_leg

/datum/design/research/item/mechfab/prosthesis/groin
	build_path = /obj/item/organ/external/robotic/groin

//Upgraded prosthesis ========================
/datum/design/research/item/mechfab/prosthesis_moebius
	category = CAT_PROSTHESIS

/datum/design/research/item/mechfab/prosthesis_moebius/r_arm
	build_path = /obj/item/organ/external/robotic/moebius/r_arm

/datum/design/research/item/mechfab/prosthesis_moebius/l_arm
	build_path = /obj/item/organ/external/robotic/moebius/l_arm

/datum/design/research/item/mechfab/prosthesis_moebius/r_leg
	build_path = /obj/item/organ/external/robotic/moebius/r_leg

/datum/design/research/item/mechfab/prosthesis_moebius/l_leg
	build_path = /obj/item/organ/external/robotic/moebius/l_leg

/datum/design/research/item/mechfab/prosthesis_moebius/groin
	build_path = /obj/item/organ/external/robotic/moebius/groin

//Modules ====================================

/datum/design/research/item/mechfab/modules
	category = CAT_PROSTHESIS

/datum/design/research/item/mechfab/modules/armor
	name = "subdermal body armor"
	build_path = /obj/item/organ_module/armor

/datum/design/research/item/mechfab/modules/armblade
	name = "Embedded armblade"
	build_path = /obj/item/organ_module/active/simple/armblade

/datum/design/research/item/mechfab/modules/runner
	name = "Mechanical muscles"
	build_path = /obj/item/organ_module/muscle

/datum/design/research/item/mechfab/modules/multitool/surgical
	build_path = /obj/item/organ_module/active/simple/surgical
	name = "Embedded surgical multitool"

/datum/design/research/item/mechfab/modules/multitool/engineer
	build_path = /obj/item/organ_module/active/simple/engineer
	name = "Embedded Artificer multitool"

/datum/design/research/item/mechfab/modules/multitool/miner
	build_path = /obj/item/organ_module/active/multitool/miner
	name = "Embedded mining multitool"


//Implants
/datum/design/research/item/implant
	build_type = PROTOLATHE | MECHFAB
	name_category = "implantable biocircuit"
	category = CAT_PROSTHESIS

/datum/design/research/item/implant/chemical
	name = "chemical"
	build_path = /obj/item/weapon/implantcase/chem

/datum/design/research/item/implant/freedom
	name = "freedom"
	build_path = /obj/item/weapon/implantcase/freedom

/datum/design/research/item/implant/alarm
	name = "death alarm"
	build_path = /obj/item/weapon/implantcase/death_alarm

/datum/design/research/item/mechfab/modules/hud

/datum/design/research/item/mechfab/modules/hud/med
	build_path = /obj/item/organ_module/active/hud/med
	name = "Embedded Med Hud Shades"

/datum/design/research/item/mechfab/modules/hud/sec
	build_path = /obj/item/organ_module/active/hud/sec
	name = "Embeded Security Hud Shades"

/datum/design/research/item/mechfab/modules/hud/night
	build_path = /obj/item/organ_module/active/hud/night
	name = "Embedded Night Vision Shades"

/datum/design/research/item/mechfab/modules/hud/thermal
	build_path = /obj/item/organ_module/active/hud/thermal
	name = "Embedded Thermal Shades"

/datum/design/research/item/mechfab/modules/hud/welder
	build_path = /obj/item/organ_module/active/hud/welder
	name = "Embedded Welder Shades"

/datum/design/research/item/mechfab/modules/hud/thermal_bio
	build_path = /obj/item/weapon/biogoop/thermal
	name = "Embedded bio-thermal shades"

/datum/design/research/item/mechfab/modules/hud/welder_bio
	build_path = /obj/item/weapon/biogoop/welding
	name = "Embedded bio-welder shades"

/datum/design/research/item/mechfab/modules/hud/night_bio
	build_path = /obj/item/weapon/biogoop/night
	name = "Embedded bio-night vision shades"