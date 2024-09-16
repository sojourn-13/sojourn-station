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

// Bone Reinforcement
/datum/design/research/item/mechfab/prosthesis/bone_brace
	build_path = /obj/item/modification/organ/internal/electromechanical/bone_braces
	name = "Bone Braces"

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

/datum/design/research/item/mechfab/prosthesis_moebius/head
	build_path = /obj/item/organ/external/robotic/moebius/head

/datum/design/research/item/mechfab/prosthesis_moebius/chest
	build_path = /obj/item/organ/external/robotic/moebius/torso

/*Robotic Internals ====================================
TODO: Get this all sorted out, atm people will have to print of
the lims and such to pull out the internal bits for other people if needed
/datum/design/research/item/mechfab/robotic_internals
	category = "Medical"

/datum/design/research/item/mechfab/robotic_internals/heart
	build_path = /obj/item/organ/internal/vital/heart/prosthetic
	category = "Medical"

/datum/design/research/item/mechfab/robotic_internals/liver
	build_path = /obj/item/organ/external/robotic/moebius/torso
	category = "Medical"

/datum/design/research/item/mechfab/robotic_internals/lung
	build_path = /obj/item/organ/external/robotic/moebius/torso
	category = "Medical"

/datum/design/research/item/mechfab/robotic_internals/blood
	build_path = /obj/item/organ/external/robotic/moebius/torso
	category = "Medical"

/datum/design/research/item/mechfab/robotic_internals/nerves
	build_path = /obj/item/organ/external/robotic/moebius/torso
	category = "Medical"

/datum/design/research/item/mechfab/robotic_internals/eyes
	build_path = /obj/item/organ/internal/eyes/prosthetic
	category = "Medical"

/datum/design/research/item/mechfab/robotic_internals/
	build_path = /obj/item/organ/external/robotic/moebius/torso
	category = "Medical"

/datum/design/research/item/mechfab/robotic_internals
	build_path = /obj/item/organ/external/robotic/moebius/torso
	category = "Medical"*/

//Modules ====================================

/datum/design/research/item/mechfab/modules
	category = CAT_PROSTHESIS

/datum/design/research/item/mechfab/modules/armor
	name = "Sub-Dermal Body Armor"
	build_path = /obj/item/organ_module/armor

/datum/design/research/item/mechfab/modules/ablativearmor
	name = "Sub-Dermal Ablative Armor"
	build_path = /obj/item/organ_module/armor/ablative

/datum/design/research/item/mechfab/modules/armblade
	name = "Embedded Arm Blade"
	build_path = /obj/item/organ_module/active/simple/armblade

/datum/design/research/item/mechfab/modules/wolverine
	name = "Embedded Claws"
	build_path = /obj/item/organ_module/active/simple/wolverine

/datum/design/research/item/mechfab/modules/energy_blade
	name = "Embedded Energy Blade"
	build_path = /obj/item/organ_module/active/simple/armblade/energy_blade

/datum/design/research/item/mechfab/modules/taser
	name = "Embedded Taser"
	build_path = /obj/item/organ_module/active/simple/taser

/datum/design/research/item/mechfab/modules/armsmg
	name = "Embedded SMG"
	build_path = /obj/item/organ_module/active/simple/armsmg

/datum/design/research/item/mechfab/modules/armshield
	name = "Embedded Shield"
	build_path = /obj/item/organ_module/active/simple/armshield

/datum/design/research/item/mechfab/modules/runner
	name = "Mechanical Muscles"
	build_path = /obj/item/organ_module/muscle

/datum/design/research/item/mechfab/modules/multitool/surgical
	name = "Embedded Surgical Multitool"
	build_path = /obj/item/organ_module/active/simple/surgical

/datum/design/research/item/mechfab/modules/multitool/engineer
	name = "Embedded Artificer's Multitool"
	build_path = /obj/item/organ_module/active/simple/engineer

/datum/design/research/item/mechfab/modules/multitool/miner
	name = "Embedded Mining Multitool"
	build_path = /obj/item/organ_module/active/multitool/miner

/datum/design/research/item/mechfab/modules/multitool/farmer
	name = "Embedded Farming Multitool"
	build_path = /obj/item/organ_module/active/multitool/farmer

//increases max sanity
/datum/design/research/item/mechfab/modules/sanity_mind_helper
	name = "S.M.H Enhancer" //Sanity Mental Hider
	build_path = /obj/item/organ_module/sanity_mind_helper

//Helps regen sanity faster passively
/datum/design/research/item/mechfab/modules/sanity_on_a_buget
	name = "Cortex Support Cyberware"
	build_path = /obj/item/organ_module/sanity_on_a_buget

//litterly a small arm pouch
/datum/design/research/item/mechfab/modules/arm_pouch
	name = "Embedded Pouch"
	build_path = /obj/item/organ_module/active/simple/small_pouch

//increases nsa
/datum/design/research/item/mechfab/modules/viv_bank
	name = "NSA Banker"
	build_path = /obj/item/organ_module/viv_bank

//increases how much you can store hunger
//TODO: better explain to the player that this is accually 2 implants in one!
//The little bit of lore is that the two creaters had a friendly compition on what would be better, storing more foor, or using less
//In the end a they were able to merge them into one, best of both worlds
/datum/design/research/item/mechfab/modules/snack_system
	name = "S.N.A.C.K System" //Storage Nutrience: Advanced Cal Keeper
	build_path = /obj/item/organ_module/snack_system

//increases how much you can store blood
/datum/design/research/item/mechfab/modules/sanguin_stash
	name = "Sanguin-Stash"
	build_path = /obj/item/organ_module/sanguin_stash

//Implants
/datum/design/research/item/implant
	build_type = PROTOLATHE | MECHFAB
	name_category = "implantable biocircuit"
	category = CAT_PROSTHESIS

/datum/design/research/item/implant/pad
	name = "Implant Pad"
	build_path = /obj/item/implantpad

/datum/design/research/item/implant/chemical
	name = "Chemical Implant"
	build_path = /obj/item/implantcase/chem

/datum/design/research/item/implant/freedom
	name = "Freedom Implant"
	build_path = /obj/item/implantcase/freedom

/datum/design/research/item/implant/alarm
	name = "Death Alarm Implant"
	build_path = /obj/item/implantcase/death_alarm

/datum/design/research/item/implant/track
	name = "Tracking Implant"
	build_path = /obj/item/implantcase/tracking


/datum/design/research/item/mechfab/modules/hud

/datum/design/research/item/mechfab/modules/hud/med
	build_path = /obj/item/organ_module/active/hud/med
	name = "Embedded Med HUD Shades"

/datum/design/research/item/mechfab/modules/hud/sec
	build_path = /obj/item/organ_module/active/hud/sec
	name = "Embedded Security HUD Shades"

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
	build_path = /obj/item/biogoop/thermal
	name = "Embedded bio-thermal shades"

/datum/design/research/item/mechfab/modules/hud/welder_bio
	build_path = /obj/item/biogoop/welding
	name = "Embedded bio-welder shades"

/datum/design/research/item/mechfab/modules/hud/night_bio
	build_path = /obj/item/biogoop/night
	name = "Embedded bio-night vision shades"
