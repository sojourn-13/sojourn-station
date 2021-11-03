/obj/item/robot_module/robot/knine
	name = "Security K9 Module"
	sprites = list(
					"K9 Hound" = "k9",
					"V2 K9 Hound" = "ihsechound",
					)
	channels = list("Marshal" = 1, "Blackshield" = 1)
	networks = list(NETWORK_SECURITY)
	can_be_pushed = 0

	supported_upgrades = list(/obj/item/borg/upgrade/tasercooler,
							  /obj/item/borg/upgrade/jetpack,
							  /obj/item/borg/upgrade/bigknife)

	health = 210 //Very tanky!
	speed_factor = 1.1 //Kinda slow
	power_efficiency = 1.55 //Decent we are meant to be around the colony

	stat_modifiers = list(
		STAT_ROB = 60,
		STAT_TGH = 60,
		STAT_BIO = 25,
		STAT_COG = 120,
		STAT_MEC = 15 //weldering cracks
	)

	desc = "Focused on keeping the peace and fighting off threats to the colony, the IH K9 Module is a \
	heavily armored, though lightly armed battle unit."

/obj/item/robot_module/robot/knine/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/device/flash(src)
	src.modules += new /obj/item/borg/sight/hud/sec(src)
	src.modules += new /obj/item/handcuffs/cyborg(src)
	src.modules += new /obj/item/tool/baton/robot(src)
	src.modules += new /obj/item/gun/energy/taser/mounted/cyborg(src)
	src.modules += new /obj/item/taperoll/police(src)
	src.modules += new /obj/item/tool/robotic_omni_sec(src) //borrows and the like.
	src.modules += new /obj/item/tool/weldingtool/robotic/weaker(src) //cracks and the like.
	src.modules += new /obj/item/tool/knife/tacknife(src)
	src.modules += new /obj/item/gun/projectile/automatic/riot_autoshotgun/robo(src)
	src.modules += new /obj/item/gripper/ammo(src)
	src.modules += new /obj/item/gripper/upgrade(src)
	src.modules += new /obj/item/device/scanner/price(src)
	src.modules += new /obj/item/device/gps(src)
	src.modules += new /obj/item/pen/robopen(src)
	src.modules += new /obj/item/form_printer(src)
	src.modules += new /obj/item/gripper/paperwork(src)
	//src.modules += new /obj/item/device/holowarrant(src)
	//src.modules += new /obj/item/book/manual/wiki/security_ironparagraphs(src) // book of ironhammer paragraphs - its broken
	src.emag += new /obj/item/gun/energy/laser/mounted/cyborg(src)

	R.icon 		 = 'icons/mob/robots_wide.dmi'
	R.pixel_x 	 = -16
	R.old_x 	 = -16
	R.default_pixel_x = -16

	..(R)

/obj/item/robot_module/robot/knine/respawn_consumable(var/mob/living/silicon/robot/R, var/amount)
	..()
	var/obj/item/gun/energy/taser/mounted/cyborg/T = locate() in src.modules
	if(T.cell.charge < T.cell.maxcharge)
		T.cell.give(T.charge_cost * amount)
		T.update_icon()
	else
		T.charge_tick = 0
	var/obj/item/tool/baton/robot/B = locate() in src.modules
	if(B && B.cell)
		B.cell.give(amount)

	..()

/obj/item/robot_module/robot/medihound
	name = "Soteria Medihound Module"
	sprites = list(
					"Medical Hound" = "medihound",
					"Dark Medical Hound (Static)" = "medihounddark",
					"V2 Medihound" = "vale",
					)
	channels = list("Medical" = 1)
	networks = list(NETWORK_MEDICAL)
	can_be_pushed = 0
	supported_upgrades = list(/obj/item/borg/upgrade/hypospray/medical,
							  /obj/item/borg/upgrade/jetpack,
							  /obj/item/borg/upgrade/satchel_of_holding_for_borgs)
	health = 120 //Fragile
	speed_factor = 1.25 //Bit faster
	power_efficiency = 0.9 //Very poor, shackled to a charger

	stat_modifiers = list(
		STAT_BIO = 60,
		STAT_COG = 120,
		STAT_MEC = 15 //weldering cracks
	)

	desc = "A versatile medical hound, equipped with all the tools necessary for surgery, chemistry, and \
	 general patient treatments. Medihound has a vast array of items, but this comes at a hefty cost. \
	 The medihound is essentially shackled to the medbay and can't afford to stray too far. \
	 Its low power efficiency means it needs to charge regularly"

/obj/item/robot_module/robot/medihound/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/tool/crowbar/robotic(src)
	src.modules += new /obj/item/device/flash(src)
	src.modules += new /obj/item/borg/sight/hud/med(src)
	src.modules += new /obj/item/device/scanner/health(src)
	src.modules += new /obj/item/reagent_containers/borghypo/medical(src)
	src.modules += new /obj/item/tool/robotic_omni_surgery(src)
	src.modules += new /obj/item/tool/weldingtool/robotic/weaker(src) //hardsuits.
	src.modules += new /obj/item/gripper/chemistry(src)
	src.modules += new /obj/item/reagent_containers/dropper/industrial(src)
	src.modules += new /obj/item/reagent_containers/syringe(src)
	src.modules += new /obj/item/reagent_containers/glass/beaker/large(src)
	src.modules += new /obj/item/reagent_containers/glass/beaker/large(src) //Two beakers
	src.modules += new /obj/item/device/scanner/reagent/adv(src)
	src.modules += new /obj/item/autopsy_scanner(src) // an autopsy scanner
	src.modules += new /obj/item/roller_holder(src)
	src.modules += new /obj/item/shockpaddles/robot(src)
	src.modules += new /obj/item/gripper/upgrade(src)
	src.modules += new /obj/item/device/scanner/price(src)
	src.modules += new /obj/item/device/gps(src)
	src.modules += new /obj/item/pen/robopen(src)
	src.modules += new /obj/item/form_printer(src)
	src.modules += new /obj/item/gripper/paperwork(src)
	src.emag += new /obj/item/reagent_containers/spray/acid(src)

	R.icon = 'icons/mob/robots_wide.dmi'
	R.pixel_x 	 = -16
	R.old_x  	 = -16
	R.default_pixel_x = -16

	var/datum/matter_synth/medicine = new /datum/matter_synth/medicine(10000)
	synths += medicine

	var/obj/item/stack/nanopaste/N = new /obj/item/stack/nanopaste(src)
	var/obj/item/stack/medical/advanced/bruise_pack/B = new /obj/item/stack/medical/advanced/bruise_pack(src)
	var/obj/item/stack/medical/advanced/ointment/O = new /obj/item/stack/medical/advanced/ointment(src)
	N.uses_charge = 1
	N.charge_costs = list(1000)
	N.synths = list(medicine)
	B.uses_charge = 1
	B.charge_costs = list(1000)
	B.synths = list(medicine)
	O.uses_charge = 1
	O.charge_costs = list(1000)
	O.synths = list(medicine)
	src.modules += N
	src.modules += B
	src.modules += O

	var/obj/item/stack/medical/splint/S = new /obj/item/stack/medical/splint(src)
	S.uses_charge = 1
	S.charge_costs = list(1000)
	S.synths = list(medicine)
	src.modules += S

	..(R)


/obj/item/robot_module/medical/general/respawn_consumable(var/mob/living/silicon/robot/R, var/amount)
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

/obj/item/robot_module/robot/scrubpup
	name = "Custodial Hound Module"
	sprites = list(
					"Custodial Hound" = "scrubpup",
					)
	channels = list("Service" = 1)
	can_be_pushed = 0
	supported_upgrades = list(/obj/item/borg/upgrade/jetpack,
							  /obj/item/borg/upgrade/satchel_of_holding_for_borgs)

	health = 175 //Bulky
	speed_factor = 1.1 //Slow
	power_efficiency = 0.8 //Poor

	stat_modifiers = list(
		STAT_ROB = 25,
		STAT_TGH = 25,
		STAT_BIO = 25,
		STAT_COG = 120,
		STAT_MEC = 15 //weldering cracks
	)
	desc = "A vast machine designed for cleaning up trash and scrubbing floors. A fairly specialised task, \
	but requiring a large capacity. The huge chassis consequentially grants it a degree of toughness, \
	though it is slow and cheaply made"

/obj/item/robot_module/robot/scrubpup/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/device/flash(src)
	src.modules += new /obj/item/gripper/service(src)
	src.modules += new /obj/item/soap/deluxe(src)
	src.modules += new /obj/item/storage/bag/robotic/trash(src)
	src.modules += new /obj/item/mop(src)
	src.modules += new /obj/item/device/lightreplacer(src)
	src.modules += new /obj/item/reagent_containers/glass/bucket(src) // a hydroponist's bucket
	src.modules += new /obj/item/matter_decompiler(src) // free drone remains for all
	src.modules += new /obj/item/device/t_scanner(src)
	src.modules += new /obj/item/tool/robotic_omni_cleaner(src)
	src.modules += new /obj/item/gripper/upgrade(src)
	src.modules += new /obj/item/device/scanner/price(src)
	src.modules += new /obj/item/device/gps(src)
	src.modules += new /obj/item/pen/robopen(src)
	src.modules += new /obj/item/form_printer(src)
	src.modules += new /obj/item/gripper/paperwork(src)
	src.emag += new /obj/item/reagent_containers/spray/lube(src)

	R.icon = 'icons/mob/robots_wide.dmi'
	R.pixel_x 	 = -16
	R.old_x  	 = -16
	R.default_pixel_x = -16

	..(R)


/obj/item/robot_module/robot/scrubpup/respawn_consumable(var/mob/living/silicon/robot/R, var/amount)
	..()
	var/obj/item/device/lightreplacer/LR = locate() in src.modules
	LR.Charge(R, amount)
	if(src.emag)
		var/obj/item/reagent_containers/spray/lube/S = locate() in src.emag
		S.reagents.add_reagent("lube", 2 * amount)

	R.icon 		 = 'icons/mob/robots_wide.dmi'
	R.pixel_x 	 = -16
	R.old_x 	 = -16
	R.default_pixel_x = -16
	..()

/obj/item/robot_module/robot/science
	name = "Soteria Science Hound Module"
	sprites = list(
					"Research Hound" = "science",
					)
	channels = list("Science" = 1)
	can_be_pushed = 0
	supported_upgrades = list(/obj/item/borg/upgrade/jetpack,
							  /obj/item/borg/upgrade/satchel_of_holding_for_borgs)

	health = 115 //Weak
	speed_factor = 1.3 //Average
	power_efficiency = 0.75 //Poor efficiency

	desc = "Built for working in a well-equipped lab, and designed to handle a wide variety of research \
	duties, this module prioritises flexibility over efficiency. Capable of working in R&D, Toxins, \
	chemistry, xenobiology and robotics."

	stat_modifiers = list(
		STAT_BIO = 40,
		STAT_COG = 120,
		STAT_MEC = 30
	)

/obj/item/robot_module/robot/science/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/device/flash(src)
	//src.modules += new /obj/item/portable_destructive_analyzer(src) dosnt work
	src.modules += new /obj/item/gripper/research(src)
	src.modules += new /obj/item/gripper/no_use/loader(src)
	src.modules += new /obj/item/device/robotanalyzer(src)
	src.modules += new /obj/item/card/robot(src)
	src.modules += new /obj/item/tool/robotic_omni_sci(src)
	src.modules += new /obj/item/tool/multitool/robotic(src) //hydro checks for tool rather then use
	src.modules += new /obj/item/tool/weldingtool/robotic(src)
	src.modules += new /obj/item/robot_harvester(src)
	src.modules += new /obj/item/reagent_containers/syringe(src)
	src.modules += new /obj/item/gripper/chemistry(src)
	src.modules += new /obj/item/reagent_containers/dropper/industrial(src)
	src.modules += new /obj/item/reagent_containers/glass/beaker/large(src)
	src.modules += new /obj/item/device/scanner/reagent/adv(src)
	src.modules += new /obj/item/extinguisher(src)
	src.modules += new /obj/item/storage/bag/produce(src)
	src.modules += new /obj/item/gripper/upgrade(src)
	src.modules += new /obj/item/device/science_tool(src)
	src.modules += new /obj/item/device/scanner/price(src)
	src.modules += new /obj/item/pen/robopen(src)
	src.modules += new /obj/item/form_printer(src)
	src.modules += new /obj/item/gripper/paperwork(src)
	src.modules += new /obj/item/storage/part_replacer(src)
	src.modules += new /obj/item/device/gps(src)
	src.emag += new /obj/item/hand_tele(src) //Why
	src.emag += new /obj/item/tool/pickaxe/onestar/cyborg(src)

	var/datum/matter_synth/nanite = new /datum/matter_synth/nanite(10000)
	synths += nanite

	var/obj/item/stack/nanopaste/N = new /obj/item/stack/nanopaste(src)
	N.uses_charge = 1
	N.charge_costs = list(1000)
	N.synths = list(nanite)
	src.modules += N

	R.icon 		 = 'icons/mob/robots_wide.dmi'
	R.pixel_x 	 = -16
	R.old_x 	 = -16
	R.default_pixel_x = -16
	..()

/obj/item/robot_module/robot/engiedog
	name = "Artificer Hound Module"
	sprites = list(
					"V2 Engihound" = "thottbot",
					"Pupdozer" = "pupdozer",
					"Artificer Safty Hound" = "kg",
					)
	channels = list("Engineering" = 1)
	networks = list(NETWORK_ENGINEERING)
	can_be_pushed = 0
	supported_upgrades = list(/obj/item/borg/upgrade/arc_welder,
							  /obj/item/borg/upgrade/rcd,
							  /obj/item/borg/upgrade/jetpack)

	health = 170 //Slightly above average
	speed_factor = 1.4 //Slightly above average
	power_efficiency = 0.9 //Slightly below average

	desc = "The engineering module is designed for setting up and maintaining core colony systems, \
	as well as occasional repair work here and there. It's a good all rounder that can serve most \
	engineering tasks."

	stat_modifiers = list(
		STAT_COG = 120,
		STAT_MEC = 40,
		STAT_BIO = 25
	)


/obj/item/robot_module/robot/engiedog/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/device/flash(src)
	src.modules += new /obj/item/borg/sight/meson(src)
	src.modules += new /obj/item/extinguisher(src)
	src.modules += new /obj/item/tool/weldingtool/robotic(src)
	src.modules += new /obj/item/tool/multitool/robotic(src)
	src.modules += new /obj/item/tool/robotic_omni_engi(src)
	src.modules += new /obj/item/tool/tape_roll/fiber/robotic(src) //Window repair
	src.modules += new /obj/item/reagent_containers/glass/beaker/large(src)
	src.modules += new /obj/item/device/t_scanner(src)
	src.modules += new /obj/item/device/scanner/gas(src)
	src.modules += new /obj/item/taperoll/engineering(src)
	src.modules += new /obj/item/gripper(src)
	src.modules += new /obj/item/gripper/no_use/loader(src)
	src.modules += new /obj/item/device/lightreplacer(src)
	src.modules += new /obj/item/device/pipe_painter(src)
	src.modules += new /obj/item/device/floor_painter(src)
	src.modules += new /obj/item/inflatable_dispenser(src)
	src.modules += new /obj/item/reagent_containers/spray/krag_b_gone(src)
	src.modules += new /obj/item/gripper/upgrade(src)
	src.modules += new /obj/item/device/scanner/price(src)
	src.modules += new /obj/item/pen/robopen(src)
	src.modules += new /obj/item/form_printer(src)
	src.modules += new /obj/item/gripper/paperwork(src)
	src.modules += new /obj/item/device/gps(src)
	src.emag += new /obj/item/tool/saw/hyper(src)

	var/datum/matter_synth/metal = new /datum/matter_synth/metal(60000)
	var/datum/matter_synth/glass = new /datum/matter_synth/glass(40000)
	var/datum/matter_synth/plasteel = new /datum/matter_synth/plasteel(20000)
	var/datum/matter_synth/wire = new /datum/matter_synth/wire(45)
	var/datum/matter_synth/wood = new /datum/matter_synth/wood(20000)
	var/datum/matter_synth/plastic = new /datum/matter_synth/plastic(15000)
	synths += metal
	synths += glass
	synths += plasteel
	synths += wire
	synths += wood
	synths += plastic

	var/obj/item/matter_decompiler/MD = new /obj/item/matter_decompiler(src)
	MD.metal = metal
	MD.glass = glass
	src.modules += MD

	var/obj/item/stack/material/cyborg/steel/M = new (src)
	M.synths = list(metal)
	src.modules += M

	var/obj/item/stack/material/cyborg/glass/G = new (src)
	G.synths = list(glass)
	src.modules += G

	var/obj/item/stack/rods/cyborg/Ro = new /obj/item/stack/rods/cyborg(src)
	Ro.synths = list(metal)
	src.modules += Ro

	var/obj/item/stack/cable_coil/cyborg/C = new /obj/item/stack/cable_coil/cyborg(src)
	C.synths = list(wire)
	src.modules += C

	var/obj/item/stack/tile/floor/cyborg/S = new /obj/item/stack/tile/floor/cyborg(src)
	S.synths = list(metal)
	src.modules += S

	var/obj/item/stack/material/cyborg/glass/reinforced/RG = new (src)
	RG.synths = list(metal, glass)
	src.modules += RG

	var/obj/item/stack/material/cyborg/plasteel/PL = new (src)
	PL.synths = list(plasteel)
	src.modules += PL

	var/obj/item/stack/material/cyborg/wood/W = new (src)
	W.synths = list(wood)
	src.modules += W

	var/obj/item/stack/material/cyborg/plastic/PS = new (src)
	PS.synths = list(plastic)
	src.modules += PS

	var/obj/item/stack/tile/wood/cyborg/FWT = new (src)
	FWT.synths = list(wood)
	src.modules += FWT

	R.icon 		 = 'icons/mob/robots_wide.dmi'
	R.pixel_x 	 = -16
	R.old_x 	 = -16
	R.default_pixel_x = -16
	..()

/obj/item/robot_module/robot/engiedog/respawn_consumable(var/mob/living/silicon/robot/R, var/amount)
	if(src.modules)
		var/obj/item/reagent_containers/spray/krag_b_gone/KBG = locate() in src.modules //Krag-B-Gone
		KBG.reagents.add_reagent("silicate", 2 * amount)
	..()
