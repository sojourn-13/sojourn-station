/obj/item/weapon/robot_module/robot/knine
	name = "Ironhammer K9 Module"
	sprites = list(
					"K9 Hound" = "k9",
					"V2 K9 Hound" = "ihsechound",
					)
	channels = list("Security" = 1)
	networks = list(NETWORK_SECURITY)
	can_be_pushed = 0

	health = 300 //Very tanky!
	speed_factor = 0.85 //Kinda slow
	power_efficiency = 1.15 //Decent

	stat_modifiers = list(
		STAT_ROB = 30,
		STAT_TGH = 20
	)

	desc = "Focused on keeping the peace and fighting off threats to the ship, the IH K9 Module is a \
	heavily armored, though lightly armed battle unit."

/obj/item/weapon/robot_module/robot/knine/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/weapon/tool/crowbar/robotic(src)
	src.modules += new /obj/item/device/flash(src)
	src.modules += new /obj/item/borg/sight/hud/sec(src)
	src.modules += new /obj/item/weapon/handcuffs/cyborg(src)
	src.modules += new /obj/item/weapon/melee/baton/robot(src)
	src.modules += new /obj/item/weapon/gun/energy/taser/mounted/cyborg(src)
	src.modules += new /obj/item/taperoll/police(src)
	//src.modules += new /obj/item/device/holowarrant(src)
	src.modules += new /obj/item/weapon/book/manual/wiki/security_ironparagraphs(src) // book of ironhammer paragraphs
	src.emag = new /obj/item/weapon/gun/energy/laser/mounted(src)

	R.icon 		 = 'icons/mob/robots_wide.dmi'
	R.pixel_x 	 = -16
	R.old_x 	 = -16
	R.default_pixel_x = -16

	..(R)

/obj/item/weapon/robot_module/robot/knine/respawn_consumable(var/mob/living/silicon/robot/R, var/amount)
	..()
	var/obj/item/weapon/gun/energy/taser/mounted/cyborg/T = locate() in src.modules
	if(T.cell.charge < T.cell.maxcharge)
		T.cell.give(T.charge_cost * amount)
		T.update_icon()
	else
		T.charge_tick = 0
	var/obj/item/weapon/melee/baton/robot/B = locate() in src.modules
	if(B && B.cell)
		B.cell.give(amount)

	..()

/obj/item/weapon/robot_module/robot/medihound
	name = "Moebius Medihound Module"
	sprites = list(
					"Medical Hound" = "medihound",
					"Dark Medical Hound (Static)" = "medihounddark",
					"V2 Medihound" = "vale",
					)
	channels = list("Medical" = 1)
	networks = list(NETWORK_MEDICAL)
	can_be_pushed = 0

	health = 140 //Fragile
	speed_factor = 0.8 //Kinda slow
	power_efficiency = 0.6 //Very poor, shackled to a charger

	stat_modifiers = list(
		STAT_BIO = 40,
		STAT_COG = 10
	)

	desc = "A versatile medical hound, equipped with all the tools necessary for surgery, chemistry, and \
	 general patient treatments. Medihound has a vast array of items, but this comes at a hefty cost. \
	 The medihound is essentially shackled to the medbay and can't afford to stray too far. \
	 Its low power efficiency means it needs to charge regularly"

/obj/item/weapon/robot_module/robot/medihound/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/weapon/tool/crowbar/robotic(src)
	src.modules += new /obj/item/device/flash(src)
	src.modules += new /obj/item/borg/sight/hud/med(src)
	src.modules += new /obj/item/device/scanner/healthanalyzer(src)
	src.modules += new /obj/item/weapon/reagent_containers/borghypo/medical(src)
	src.modules += new /obj/item/weapon/tool/scalpel(src)
	src.modules += new /obj/item/weapon/tool/hemostat(src)
	src.modules += new /obj/item/weapon/tool/retractor(src)
	src.modules += new /obj/item/weapon/tool/cautery(src)
	src.modules += new /obj/item/weapon/tool/bonesetter(src)
	src.modules += new /obj/item/weapon/tool/saw/circular(src)
	src.modules += new /obj/item/weapon/tool/surgicaldrill(src)
	src.modules += new /obj/item/weapon/gripper/chemistry(src)
	src.modules += new /obj/item/weapon/reagent_containers/dropper/industrial(src)
	src.modules += new /obj/item/weapon/reagent_containers/syringe(src)
	src.modules += new /obj/item/device/scanner/reagent_scanner/adv(src)
	src.modules += new /obj/item/weapon/autopsy_scanner(src) // an autopsy scanner
	src.emag = new /obj/item/weapon/reagent_containers/spray(src)
	src.emag.reagents.add_reagent("pacid", 250)
	src.emag.name = "Polyacid spray"

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


/obj/item/weapon/robot_module/medical/general/respawn_consumable(var/mob/living/silicon/robot/R, var/amount)
	var/obj/item/weapon/reagent_containers/syringe/S = locate() in src.modules
	if(S.mode == 2)
		S.reagents.clear_reagents()
		S.mode = initial(S.mode)
		S.desc = initial(S.desc)
		S.update_icon()

	if(src.emag)
		var/obj/item/weapon/reagent_containers/spray/PS = src.emag
		PS.reagents.add_reagent("pacid", 2 * amount)
	..()

/obj/item/weapon/robot_module/robot/scrubpup
	name = "Custodial Hound Module"
	sprites = list(
					"Custodial Hound" = "scrubpup",
					)
	channels = list("Service" = 1)
	can_be_pushed = 0

	health = 250 //Bulky
	speed_factor = 0.85 //Slow
	power_efficiency = 0.8 //Poor

	stat_modifiers = list(
		STAT_ROB = 20
	)

	desc = "A vast machine designed for cleaning up trash and scrubbing floors. A fairly specialised task, \
	but requiring a large capacity. The huge chassis consequentially grants it a degree of toughness, \
	though it is slow and cheaply made"

/obj/item/weapon/robot_module/robot/scrubpup/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/weapon/tool/crowbar/robotic(src)
	src.modules += new /obj/item/device/flash(src)
	src.modules += new /obj/item/weapon/gripper/service(src)
	src.modules += new /obj/item/weapon/soap/nanotrasen(src)
	src.modules += new /obj/item/weapon/storage/bag/trash/robot(src)
	src.modules += new /obj/item/weapon/mop(src)
	src.modules += new /obj/item/device/lightreplacer(src)
	src.modules += new /obj/item/weapon/reagent_containers/glass/bucket(src) // a hydroponist's bucket
	src.modules += new /obj/item/weapon/matter_decompiler(src) // free drone remains for all
	src.modules += new /obj/item/device/t_scanner(src)
	src.emag = new /obj/item/weapon/reagent_containers/spray(src)
	src.emag.reagents.add_reagent("lube", 250)
	src.emag.name = "Lube spray"

	R.icon = 'icons/mob/robots_wide.dmi'
	R.pixel_x 	 = -16
	R.old_x  	 = -16
	R.default_pixel_x = -16

	..(R)


/obj/item/weapon/robot_module/custodial/respawn_consumable(var/mob/living/silicon/robot/R, var/amount)
	..()
	var/obj/item/device/lightreplacer/LR = locate() in src.modules
	LR.Charge(R, amount)
	if(src.emag)
		var/obj/item/weapon/reagent_containers/spray/S = src.emag
		S.reagents.add_reagent("lube", 2 * amount)

	R.icon 		 = 'icons/mob/robots_wide.dmi'
	R.pixel_x 	 = -16
	R.old_x 	 = -16
	R.default_pixel_x = -16
	..()

/obj/item/weapon/robot_module/robot/science
	name = "Moebius Science Hound Module"
	sprites = list(
					"Research Hound" = "science",
					)
	channels = list("Science" = 1)
	can_be_pushed = 0

	health = 160 //Weak
	speed_factor = 1.0 //Average
	power_efficiency = 0.75 //Poor efficiency

	desc = "Built for working in a well-equipped lab, and designed to handle a wide variety of research \
	duties, this module prioritises flexibility over efficiency. Capable of working in R&D, Toxins, \
	chemistry, xenobiology and robotics."

	stat_modifiers = list(
		STAT_BIO = 30,
		STAT_COG = 40,
		STAT_MEC = 30
	)

/obj/item/weapon/robot_module/robot/science/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/device/flash(src)
	src.modules += new /obj/item/weapon/portable_destructive_analyzer(src)
	src.modules += new /obj/item/weapon/gripper/research(src)
	src.modules += new /obj/item/weapon/gripper/no_use/loader(src)
	src.modules += new /obj/item/device/robotanalyzer(src)
	src.modules += new /obj/item/weapon/card/robot(src)
	src.modules += new /obj/item/weapon/tool/wrench/robotic(src)
	src.modules += new /obj/item/weapon/tool/screwdriver/robotic(src)
	src.modules += new /obj/item/weapon/tool/crowbar/robotic(src)
	src.modules += new /obj/item/weapon/tool/scalpel(src)
	src.modules += new /obj/item/weapon/tool/saw/circular(src)
	src.modules += new /obj/item/weapon/extinguisher/mini(src)
	src.modules += new /obj/item/weapon/reagent_containers/syringe(src)
	src.modules += new /obj/item/weapon/gripper/chemistry(src)
	src.modules += new /obj/item/weapon/reagent_containers/dropper/industrial(src)
	src.modules += new /obj/item/device/scanner/reagent_scanner/adv(src)
	src.modules += new /obj/item/weapon/extinguisher(src)
	src.modules += new /obj/item/weapon/storage/bag/plants(src)
	src.modules += new /obj/item/weapon/pen/robopen(src)
	src.emag = new /obj/item/weapon/hand_tele(src)

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

/obj/item/weapon/robot_module/robot/engiedog
	name = "Technomancer Hound Module"
	sprites = list(
					"V2 Engihound" = "thottbot",
					"Pupdozer" = "pupdozer",
					)
	channels = list("Engineering" = 1)
	networks = list(NETWORK_ENGINEERING)
	can_be_pushed = 0

	health = 240 //Slightly above average
	speed_factor = 1.1 //Slightly above average
	power_efficiency = 0.9 //Slightly below average

	desc = "The engineering module is designed for setting up and maintaining core ship systems, \
	as well as occasional repair work here and there. It's a good all rounder that can serve most \
	engineering tasks."

	stat_modifiers = list(
		STAT_COG = 20,
		STAT_MEC = 40
	)

/obj/item/weapon/robot_module/robot/engiedog/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/device/flash(src)
	src.modules += new /obj/item/borg/sight/meson(src)
	src.modules += new /obj/item/weapon/extinguisher(src)
	src.modules += new /obj/item/weapon/rcd/borg(src)
	src.modules += new /obj/item/weapon/tool/weldingtool/robotic(src)
	src.modules += new /obj/item/weapon/tool/screwdriver/robotic(src)
	src.modules += new /obj/item/weapon/tool/wrench/robotic(src)
	src.modules += new /obj/item/weapon/tool/crowbar/robotic(src)
	src.modules += new /obj/item/weapon/tool/wirecutters/robotic(src)
	src.modules += new /obj/item/weapon/tool/multitool/robotic(src)
	src.modules += new /obj/item/device/t_scanner(src)
	src.modules += new /obj/item/device/scanner/analyzer(src)
	src.modules += new /obj/item/taperoll/engineering(src)
	src.modules += new /obj/item/weapon/gripper(src)
	src.modules += new /obj/item/weapon/gripper/no_use/loader(src)
	src.modules += new /obj/item/device/lightreplacer(src)
	src.modules += new /obj/item/device/pipe_painter(src)
	src.modules += new /obj/item/device/floor_painter(src)
	src.modules += new /obj/item/weapon/inflatable_dispenser(src)
	src.emag = new /obj/item/weapon/melee/baton(src)

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

	var/obj/item/weapon/matter_decompiler/MD = new /obj/item/weapon/matter_decompiler(src)
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
