
//A borg intended to serve as an antag in itself, though generally reserved for adminspawning
//Sort of like a robot ninja
//Not currently implemented
/obj/item/robot_module/hunter_seeker
	name = "hunter seeker robot module"
	languages = list(
					LANGUAGE_COMMON = 1,
					LANGUAGE_ILLYRIAN = 1,
					LANGUAGE_CYRILLIC = 1,
					LANGUAGE_JIVE = 0
					//LANGUAGE_TERMINATOR = 1 this is not real
					)

	sprites = list(
					"Hunter Seeker" = "hunter_seeker"
					)

/obj/item/robot_module/hunter_seeker/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/device/flash(src)
	src.modules += new /obj/item/borg/sight/thermal(src)
	//src.modules += new /obj/item/gun/energy/net/mounted(src)
	//src.modules += new /obj/item/gun/energy/mountedcannon(src)
	//src.modules += new /obj/item/melee/energy/glaive(src)
	src.modules += new /obj/item/tool/weldingtool/robotic(src)
	src.modules += new /obj/item/tool/multitool/robotic(src)
	src.modules += new /obj/item/tool/robotic_omni/engi(src)
	src.modules += new /obj/item/tool/tape_roll/fiber/robotic(src) //Window repair
	src.modules += new /obj/item/device/gps(src)

	..(R)

//Syndicate borg is intended for summoning by contractors. Not currently implemented
/obj/item/robot_module/syndicate
	name = "syndicate robot module"
	hide_on_manifest = TRUE
	languages = list(
					LANGUAGE_COMMON = 1,
					LANGUAGE_ILLYRIAN = 1,
					LANGUAGE_CYRILLIC = 1,
					LANGUAGE_JIVE = 0
					)

	sprites = list(
					"Bloodhound" = "syndie_bloodhound",
					"Treadhound" = "syndie_treadhound",
					"Precision" = "syndi-medi",
					"Heavy" = "syndi-heavy",
					"Artillery" = "spidersyndi",
					"Miss" = "missm_syndie"
					)

	stat_modifiers = list(
		STAT_BIO = 60,
		STAT_COG = 120,
		STAT_ROB = 60,
		STAT_TGH = 60,
		STAT_MEC = 60
	)

/obj/item/robot_module/syndicate/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/device/flash(src)
	src.modules += new /obj/item/borg/sight/thermal(src)
	src.modules += new /obj/item/melee/energy/sword(src)
	src.modules += new /obj/item/tool/weldingtool/robotic(src)
	src.modules += new /obj/item/tool/multitool/robotic(src)
	src.modules += new /obj/item/tool/robotic_omni/engi(src)
	src.modules += new /obj/item/tool/tape_roll/fiber/robotic(src) //handcuffs and mouth tape
	//Todo, replace these with suitable weapons from eris
	//src.modules += new /obj/item/gun/energy/mountedsmg(src)
	//src.modules += new /obj/item/gun/energy/net/mounted(src)
	//src.modules += new /obj/item/gun/launcher/grenade/cyborg(src)
	src.modules += new /obj/item/device/gps(src)
	//src.modules += new /obj/item/robot_emag(src)

/obj/item/robot_module/engineering/construction
	name = "construction robot module"
	no_slip = 1
	health = 270 //tough
	speed_factor = 0.65 //Very slow!
	power_efficiency = 1.3 //Good for the long haul

	supported_upgrades = list(/obj/item/borg/upgrade/arc_welder,
							  /obj/item/borg/upgrade/rcd,
							  /obj/item/borg/upgrade/jetpack)


	desc = "The construction module is a ponderous, overgeared monstrosity, huge and bulky. \
	Designed for constructing new sections or repairing major damage, it is equipped for long \
	journeys through maintenance or around the colony. The heavy chassis and power system comes at a great \
	toll in speed though."

/obj/item/robot_module/engineering/construction/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/device/flash(src)
	src.modules += new /obj/item/borg/sight/meson(src)
	src.modules += new /obj/item/extinguisher(src)
	src.modules += new /obj/item/rcd/borg(src)
	src.modules += new /obj/item/tool/weldingtool/robotic(src)
	src.modules += new /obj/item/tool/multitool/robotic(src)
	src.modules += new /obj/item/tool/robotic_omni/engi(src)
	src.modules += new /obj/item/tool/tape_roll/fiber/robotic(src) //Window repair
	src.modules += new /obj/item/device/pipe_painter(src)
	src.modules += new /obj/item/gripper/no_use/loader(src)
	src.modules += new /obj/item/gripper(src)
	src.modules += new /obj/item/device/t_scanner(src) // to check underfloor wiring
	src.modules += new /obj/item/device/scanner/gas(src) // to check air pressure in the area
	src.modules += new /obj/item/device/lightreplacer(src) // to install lightning in the area
	src.modules += new /obj/item/device/floor_painter(src)// to make america great again (c)
	src.modules += new /obj/item/inflatable_dispenser(src) // to stop those pesky human beings entering the zone
	src.modules += new /obj/item/hatton/robot(src)
	src.modules += new /obj/item/reagent_containers/glass/bucket(src)
	src.modules += new /obj/item/reagent_containers/spray/krag_b_gone(src)
	src.modules += new /obj/item/device/gps(src)
	src.modules += new /obj/item/pen/robopen(src)
	src.modules += new /obj/item/form_printer(src)
	src.modules += new /obj/item/gripper/paperwork(src)
	src.emag = new /obj/item/tool/saw/hyper(src)

	//src.emag = new /obj/item/gun/energy/plasmacutter/mounted(src)
	//src.malfAImodule += new /obj/item/rtf(src) //We don't have these features

	var/datum/matter_synth/metal = new /datum/matter_synth/metal(80000)
	var/datum/matter_synth/plasteel = new /datum/matter_synth/plasteel(40000)
	var/datum/matter_synth/glass = new /datum/matter_synth/glass(60000)
	var/datum/matter_synth/wire = new /datum/matter_synth/wire(60)
	synths += metal
	synths += plasteel
	synths += glass
	synths += wire

	var/obj/item/stack/material/cyborg/steel/M = new (src)
	M.synths = list(metal)
	src.modules += M

	var/obj/item/stack/material/cyborg/glass/G = new (src)
	G.synths = list(glass)
	src.modules += G

	var/obj/item/stack/rods/cyborg/Ro = new /obj/item/stack/rods/cyborg(src)
	Ro.synths = list(metal)
	src.modules += Ro

	var/obj/item/stack/material/cyborg/plasteel/S = new (src)
	S.synths = list(plasteel)
	src.modules += S

	var/obj/item/stack/material/cyborg/glass/reinforced/RG = new (src)
	RG.synths = list(metal, glass)
	src.modules += RG

	var/obj/item/stack/tile/floor/cyborg/FT = new /obj/item/stack/tile/floor/cyborg(src) // to add floor over the metal rods lattice
	FT.synths = list(metal)
	src.modules += FT

	var/obj/item/stack/cable_coil/cyborg/C = new /obj/item/stack/cable_coil/cyborg(src) // Let there be light electric said and after that did cut the wire
	C.synths = list(wire)
	src.modules += C

	..(R)

/obj/item/robot_module/engineering/construction/respawn_consumable(var/mob/living/silicon/robot/R, var/amount)
	if(src.modules)
		var/obj/item/reagent_containers/spray/krag_b_gone/KBG = locate() in src.modules //Krag-B-Gone
		KBG.reagents.add_reagent("silicate", 2 * amount)
	..()
	..(R)

/obj/item/robot_module/medical/rescue
	name = "rescue robot module"
	sprites = list(
			"Basic" = "robotmedi",
			"Classic" = "medbot",
			"Standard" = "surgeon",
			"Advanced Droid" = "droid-rescue",
			"Sleek" = "sleekrescue",
			"Needles" = "medicalrobot",
			"Drone" = "drone-medical",
			"Heavy" = "heavymed",
			"Miss" = "missm_med",
			"Medical Junkbot" = "qualified_doctor"
			)

	//Rescue module has built in crew monitor
	//General medical does not, they're expected to stay in medbay and use the computers
	subsystems = list(/datum/nano_module/crew_monitor)
	supported_upgrades = list(/obj/item/borg/upgrade/hypospray_medical,
							  /obj/item/borg/upgrade/jetpack)
	health = 270 //Tough
	speed_factor = 1.3 //Turbospeed!
	power_efficiency = 1.2 //Good for long journeys

	stat_modifiers = list(
		STAT_BIO = 40,
		STAT_ROB = 30,
		STAT_TGH = 30,
		STAT_COG = 120,
		STAT_MEC = 15, //weldering cracks
	)

	desc = "The rescue borg fills the role of paramedic. \
	Fearlessly venturing out into danger in order to pick up the wounded, stabilise them and bring \
	them home. It has a relatively small toolset, mostly gear for getting where it needs to go and \
	finding its way around. This streamlined design allows it to be the fastest of all droid modules."

//TODO: Give the rescue module some kind of powerful melee weapon to use as a breaching tool.
//Possibly a robot equivilant of the fire axe
/obj/item/robot_module/medical/rescue/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/device/flash(src)
	src.modules += new /obj/item/borg/sight/hud/med(src)
	src.modules += new /obj/item/device/scanner/health(src)
	src.modules += new /obj/item/tool/robotic_omni/standard(src)
	src.modules += new /obj/item/tool/weldingtool/robotic/weaker(src)
	src.modules += new /obj/item/roller_holder(src)
	src.modules += new /obj/item/hatton/robot(src)
	src.modules += new /obj/item/gripper/chemistry(src)
	src.modules += new /obj/item/reagent_containers/borghypo/rescue(src)
	src.modules += new /obj/item/reagent_containers/syringe(src)
	src.modules += new /obj/item/reagent_containers/glass/beaker/large(src)
	src.modules += new /obj/item/extinguisher/mini(src)
	src.modules += new /obj/item/inflatable_dispenser(src) // Allows usage of inflatables. Since they are basically robotic alternative to EMTs, they should probably have them.
	src.modules += new /obj/item/device/gps(src) // for coordinating with medical suit health sensors console
	src.modules += new /obj/item/tool/scalpel(src)
	src.modules += new /obj/item/pen/robopen(src)
	src.modules += new /obj/item/form_printer(src)
	src.modules += new /obj/item/gripper/paperwork(src)
	src.emag += new /obj/item/reagent_containers/spray/acid(src)

	var/datum/matter_synth/medicine = new /datum/matter_synth/medicine(15000)
	synths += medicine

	var/obj/item/stack/medical/splint/S = new /obj/item/stack/medical/splint(src)
	S.uses_charge = 1
	S.charge_costs = list(1000)
	S.synths = list(medicine)
	src.modules += S

	..(R)

/obj/item/robot_module/medical/rescue/respawn_consumable(var/mob/living/silicon/robot/R, var/amount)
	var/obj/item/reagent_containers/syringe/S = locate() in src.modules
	if(S.mode == 2)
		S.reagents.clear_reagents()
		S.mode = initial(S.mode)
		S.desc = initial(S.desc)
		S.update_icon()

	if(src.emag)
		var/obj/item/reagent_containers/spray/acid/PS = locate() in src.emag
		PS.reagents.add_reagent("pacid", 2 * amount)

	..()

//Combat module is a high grade security borg for use in emergencies.
//They have lethal weapons and shielding
//Not currently implemented, needs discussion
/obj/item/robot_module/combat
	name = "combat robot module"
	hide_on_manifest = TRUE
	channels = list("Security" = 1)
	networks = list(NETWORK_SECURITY)
	subsystems = list(/datum/nano_module/crew_monitor)
	sprites = list("Roller" = "droid-combat")
	can_be_pushed = 0

/obj/item/robot_module/combat/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/device/flash(src)
	src.modules += new /obj/item/borg/sight/hud/sec(src)
	src.modules += new /obj/item/gun/energy/laser/mounted/cyborg(src)
	//src.modules += new /obj/item/melee/hammer/powered(src)
	src.modules += new /obj/item/borg/combat/shield(src)
	src.modules += new /obj/item/borg/combat/mobility(src)
	src.modules += new /obj/item/tool/crowbar/robotic(src)
	src.modules += new /obj/item/device/gps(src)
	src.emag = new /obj/item/gun/energy/lasercannon/mounted(src)
	..(R)
