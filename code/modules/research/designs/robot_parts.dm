/datum/design/research/item/mechfab/robot
	category = CAT_ROBOT
	build_type = MECHFAB
	starts_unlocked = TRUE

/datum/design/research/item/mechfab/robot/exoskeleton
	name = "Robot exoskeleton"
	build_path = /obj/item/robot_parts/robot_suit

/datum/design/research/item/mechfab/robot/torso
	name = "Robot torso"
	build_path = /obj/item/robot_parts/chest

/datum/design/research/item/mechfab/robot/head
	name = "Robot head"
	build_path = /obj/item/robot_parts/head

/datum/design/research/item/mechfab/robot/l_arm
	name = "Robot left arm"
	build_path = /obj/item/robot_parts/l_arm

/datum/design/research/item/mechfab/robot/r_arm
	name = "Robot right arm"
	build_path = /obj/item/robot_parts/r_arm

/datum/design/research/item/mechfab/robot/l_leg
	name = "Robot left leg"
	build_path = /obj/item/robot_parts/l_leg

/datum/design/research/item/mechfab/robot/r_leg
	name = "Robot right leg"
	build_path = /obj/item/robot_parts/r_leg

/datum/design/research/item/mechfab/robot/component
	name_category = "robot component"
	category = CAT_ROBOT
	starts_unlocked = TRUE

/datum/design/research/item/mechfab/robot/component/binary_communication_device
	name = "Binary communication device"
	build_path = /obj/item/robot_parts/robot_component/binary_communication_device

/datum/design/research/item/mechfab/robot/component/radio
	name = "Robot Radio"
	build_path = /obj/item/robot_parts/robot_component/radio

/datum/design/research/item/mechfab/robot/component/actuator
	name = "Actuator"
	build_path = /obj/item/robot_parts/robot_component/actuator

/datum/design/research/item/mechfab/robot/component/diagnosis_unit
	name = "Diagnosis unit"
	build_path = /obj/item/robot_parts/robot_component/diagnosis_unit

/datum/design/research/item/mechfab/robot/component/camera
	name = "Robot Camera"
	build_path = /obj/item/robot_parts/robot_component/camera

/datum/design/research/item/mechfab/robot/component/armour
	name = "Robot Armour plating"
	build_path = /obj/item/robot_parts/robot_component/armour

/datum/design/research/item/mechfab/robot/component/armour/mkii
	name = "Mark II energy armour plating"
	build_path = /obj/item/robot_parts/robot_component/armour/mkii

/datum/design/research/item/mechfab/robot/component/armour/mkv
	name = "Mark V extra armour plating"
	build_path = /obj/item/robot_parts/robot_component/armour/mkv


/datum/design/research/item/mechfab/robot/component/jetpack
	name = "Robot Jet Pack module"
	desc = "Self refilling jet pack that makes the unit suitable for EVA work."
	build_path = /obj/item/robot_parts/robot_component/jetpack
	starts_unlocked = FALSE

// Robot updates
/datum/design/research/item/robot_upgrade
	build_type = MECHFAB
	category = CAT_ROBOT
	name_category = "robot upgrade"

/datum/design/research/item/robot_upgrade/rename
	name = "Rename module"
	desc = "Used to rename a cyborg."
	build_path = /obj/item/borg/upgrade/rename
	starts_unlocked = TRUE

/datum/design/research/item/robot_upgrade/reset
	name = "Reset module"
	desc = "Used to reset a cyborg's module. Destroys any other upgrades applied to the robot."
	build_path = /obj/item/borg/upgrade/reset
	starts_unlocked = TRUE

/datum/design/research/item/robot_upgrade/floodlight
	name = "Floodlight module"
	desc = "Used to boost cyborg's integrated light intensity."
	build_path = /obj/item/borg/upgrade/floodlight
	starts_unlocked = TRUE

/datum/design/research/item/robot_upgrade/restart
	name = "Emergency restart module"
	desc = "Used to force a restart of a disabled-but-repaired robot, bringing it back online."
	build_path = /obj/item/borg/upgrade/restart
	starts_unlocked = TRUE

/datum/design/research/item/robot_upgrade/vtec
	name = "VTEC module"
	desc = "Used to kick in a robot's VTEC systems, increasing their speed."
	build_path = /obj/item/borg/upgrade/vtec

/datum/design/research/item/robot_upgrade/power_saver
	name = "Power Saver module"
	desc = "Used to kick in a robot's Power Saver systems, increasing their power efficiency."
	build_path = /obj/item/borg/upgrade/power_saver

/datum/design/research/item/robot_upgrade/tasercooler
	name = "Rapid taser cooling module"
	desc = "Used to cool a mounted taser, increasing the potential current in it and thus its recharge rate."
	build_path = /obj/item/borg/upgrade/tasercooler

/datum/design/research/item/robot_upgrade/rcd
	name = "RCD module"
	desc = "A rapid construction device module for use during construction operations."
	build_path = /obj/item/borg/upgrade/rcd

/datum/design/research/item/robot_upgrade/arc_welder
	name = "Integrated Arc Welder module"
	desc = "An electric based, safe welder for a robotic unit."
	build_path = /obj/item/borg/upgrade/arc_welder

/datum/design/research/item/robot_upgrade/medical_hypo_upgrade
	name = "Expanded Medical Hypo Upgrade"
	desc = "A smarter hypo synthesizer to make more complex chemicals. Made for medical modules."
	build_path = /obj/item/borg/upgrade/hypospray_medical

/datum/design/research/item/robot_upgrade/rescue_hypo_upgrade
	name = "Expanded Rescue Hypo Upgrade"
	desc = "A smarter hypo synthesizer to make more complex chemicals. Made for rescue modules."
	build_path = /obj/item/borg/upgrade/hypospray_rescue

/datum/design/research/item/robot_upgrade/syndicate
	name = "Illegal upgrade"
	desc = "Allows for the construction of lethal upgrades for cyborgs."
	build_path = /obj/item/borg/upgrade/syndicate

/datum/design/research/item/robot_upgrade/bigknife
	name = "Combat Knife upgrade"
	desc = "Allows for the construction of lethal upgrades for sec-based bots."
	build_path = /obj/item/borg/upgrade/bigknife

/datum/design/research/item/robot_upgrade/satchel_of_holding_for_borgs
	name = "Satchel of holding equipment upgrade"
	desc = "Allows for the construction of lethal upgrades for sec-based bots."
	build_path = /obj/item/borg/upgrade/satchel_of_holding_for_borgs