/obj/structure/sign
	icon = 'icons/obj/decals.dmi'
	anchored = 1
	opacity = 0
	density = 0
	layer = SIGN_LAYER
	w_class = ITEM_SIZE_NORMAL

/obj/structure/sign/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			qdel(src)
			return
		if(3.0)
			qdel(src)
			return
		else
	return

/obj/structure/sign/attackby(obj/item/tool as obj, mob/user as mob)	//deconstruction
	if(istype(tool, /obj/item/weapon/tool/screwdriver) && !istype(src, /obj/structure/sign/residential/barsign))
		to_chat(user, "You unfasten the sign with your [tool].")
		var/obj/item/sign/S = new(src.loc)
		S.name = name
		S.desc = desc
		S.icon_state = icon_state
		//var/icon/I = icon('icons/obj/decals.dmi', icon_state)
		//S.icon = I.Scale(24, 24)
		S.sign_state = icon_state
		qdel(src)
	else ..()

/obj/item/sign
	name = "sign"
	desc = ""
	icon = 'icons/obj/decals.dmi'
	w_class = ITEM_SIZE_NORMAL		//big
	var/sign_state = ""

/obj/item/sign/attackby(obj/item/tool as obj, mob/user as mob)	//construction
	if(istype(tool, /obj/item/weapon/tool/screwdriver) && isturf(user.loc))
		var/direction = input("In which direction?", "Select direction.") in list("North", "East", "South", "West", "Cancel")
		if(direction == "Cancel") return
		var/obj/structure/sign/S = new(user.loc)
		switch(direction)
			if("North")
				S.pixel_y = 32
			if("East")
				S.pixel_x = 32
			if("South")
				S.pixel_y = -32
			if("West")
				S.pixel_x = -32
			else return
		S.name = name
		S.desc = desc
		S.icon_state = sign_state
		to_chat(user, "You fasten \the [S] with your [tool].")
		qdel(src)
	else ..()

/*Directional Signs*/

/obj/structure/sign/directions/generic
	name = "direction sign"
	desc = "A direction sign pointing the way to a location."
	icon_state = "direction"

/obj/structure/sign/directions/science
	name = "\improper Science"
	desc = "A direction sign pointing the way to the Research department."
	icon_state = "direction_sci"

/obj/structure/sign/directions/engineering
	name = "\improper Engineering"
	desc = "A direction sign pointing the way to the Engineering department."
	icon_state = "direction_eng"

/obj/structure/sign/directions/security
	name = "\improper Security department"
	desc = "A direction sign pointing the way to the Security department."
	icon_state = "direction_sec"

/obj/structure/sign/directions/medical
	name = "\improper Medical"
	desc = "A direction sign pointing the way to the Medical department."
	icon_state = "direction_med"

/obj/structure/sign/directions/evac
	name = "\improper Evac"
	desc = "A direction sign pointing the way to the shuttle bay."
	icon_state = "direction_evac"

/obj/structure/sign/directions/command
	name = "\improper Command"
	desc = "A direction sign pointing the way to the bridge."
	icon_state = "direction_cmd"

/obj/structure/sign/directions/elevator
	name = "\improper Elevator"
	desc = "A direction sign pointing the way to the elevator."
	icon_state = "direction_elv"

/obj/structure/sign/directions/cryo
	name = "\improper Cryogenic Storage"
	desc = "A direction sign pointing the way to cryogenic storage."
	icon_state = "direction_cry"

/obj/structure/sign/directions/roomnum
	name = "room number"
	desc = "A sign detailing the number of the room beside it."
	icon_state = "roomnum"

/obj/structure/sign/directions/map
	name = "station map"
	desc = "A framed picture of the station."
	icon_state = "map-left"

/obj/structure/sign/directions/map/right
	name = "station map"
	desc = "A framed picture of the station."
	icon_state = "map-right"

/*Levels - Decks, Hangars, Sections, Etc.*/

/obj/structure/sign/levels/deck1
	desc = "A silver sign which reads 'DECK I'."
	name = "DECK I"
	icon_state = "deck1"

/obj/structure/sign/levels/deck2
	desc = "A silver sign which reads 'DECK II'."
	name = "DECK II"
	icon_state = "deck2"

/obj/structure/sign/levels/deck3
	desc = "A silver sign which reads 'DECK III'."
	name = "DECK III"
	icon_state = "deck3"

/obj/structure/sign/levels/deck4
	desc = "A silver sign which reads 'DECK IV'."
	name = "DECK IV"
	icon_state = "deck4"

/obj/structure/sign/levels/deck5
	desc = "A silver sign which reads 'DECK V'."
	name = "DECK V"
	icon_state = "deck5"

/obj/structure/sign/levels/smalldeck1
	desc = "A silver sign which reads 'DECK I'."
	name = "DECK I"
	icon_state = "deck1small"

/obj/structure/sign/levels/smalldeck2
	desc = "A silver sign which reads 'DECK II'."
	name = "DECK II"
	icon_state = "deck2small"

/obj/structure/sign/levels/smalldeck3
	desc = "A silver sign which reads 'DECK III'."
	name = "DECK III"
	icon_state = "deck3small"

/obj/structure/sign/levels/smalldeck4
	desc = "A silver sign which reads 'DECK IV'."
	name = "DECK IV"
	icon_state = "deck4small"

/obj/structure/sign/levels/smalldeck5
	desc = "A silver sign which reads 'DECK V'."
	name = "DECK V"
	icon_state = "deck5small"

/obj/structure/sign/levels/olddeck1
	desc = "A silver sign which reads 'DECK I'."
	name = "DECK I"
	icon_state = "deck-1old"

/obj/structure/sign/levels/olddeck2
	desc = "A silver sign which reads 'DECK II'."
	name = "DECK II"
	icon_state = "deck-2old"

/obj/structure/sign/levels/olddeck3
	desc = "A silver sign which reads 'DECK III'."
	name = "DECK III"
	icon_state = "deck-3old"

/obj/structure/sign/levels/olddeck4
	desc = "A silver sign which reads 'DECK IV'."
	name = "DECK IV"
	icon_state = "deck-4old"

/obj/structure/sign/levels/hangar1
	desc = "A rectangular sign which reads 'HANGAR 1'."
	name = "HANGAR 1"
	icon_state = "hangar-1"

/obj/structure/sign/levels/hangar2
	desc = "A rectangular sign which reads 'HANGAR 2'."
	name = "HANGAR 2"
	icon_state = "hangar-2"

/obj/structure/sign/levels/hangar3
	desc = "A rectangular sign which reads 'HANGAR 3'."
	name = "HANGAR 3"
	icon_state = "hangar-3"

/obj/structure/sign/levels/section1
	desc = "A silver sign which reads 'SECTION I'."
	name = "SECTION I"
	icon_state = "sec1"

/obj/structure/sign/levels/section2
	desc = "A silver sign which reads 'SECTION II'."
	name = "SECTION II"
	icon_state = "sec2"

/obj/structure/sign/levels/section3
	desc = "A silver sign which reads 'SECTION III'."
	name = "SECTION III"
	icon_state = "sec3"

/obj/structure/sign/levels/section4
	desc = "A silver sign which reads 'SECTION IV'."
	name = "SECTION IV"
	icon_state = "sec4"

/obj/structure/sign/levels/section5
	desc = "A silver sign which reads 'SECTION V'."
	name = "SECTION V"
	icon_state = "sec5"

/obj/structure/sign/levels/stairsup
	desc = "A silver sign which shows a stairway up."
	name = "STAIRS"
	icon_state = "stairs_up"

/obj/structure/sign/levels/stairsdown
	desc = "A silver sign which shows a stairway down."
	name = "STAIRS"
	icon_state = "stairs_down"

/*Departmental Signs*/

/obj/structure/sign/department
	name = "department sign"
	desc = "Sign of some important ship compartment."

/obj/structure/sign/department/medbay
	name = "MEDBAY"
	icon_state = "medbay"

/obj/structure/sign/department/virology
	name = "VIROLOGY"
	icon_state = "virology"

/obj/structure/sign/department/chem
	name = "CHEMISTRY"
	icon_state = "chem"

/obj/structure/sign/department/gene
	name = "GENETICS"
	icon_state = "gene"

/obj/structure/sign/department/morgue
	name = "MORGUE"
	icon_state = "morgue"

/obj/structure/sign/department/operational
	name = "OPERATIONAL"
	icon_state = "operational"

/obj/structure/sign/department/sci
	name = "SCIENCE"
	icon_state = "sci"

/obj/structure/sign/department/xenolab
	name = "XENOLAB"
	icon_state = "xenolab"

/obj/structure/sign/department/anomaly
	name = "ANOMALYLAB"
	icon_state = "anomaly"

/obj/structure/sign/department/dock
	name = "DOKUCHAYEV DOCK"
	icon_state = "dock"

/obj/structure/sign/department/rnd
	name = "RND"
	icon_state = "rnd"

/obj/structure/sign/department/robo
	name = "ROBOTICS"
	icon_state = "robo"

/obj/structure/sign/department/toxins
	name = "TOXINS"
	icon_state = "toxins"

/obj/structure/sign/department/toxin_res
	name = "TOXINLAB"
	icon_state = "toxin_res"

/obj/structure/sign/department/eva
	name = "E.V.A."
	icon_state = "eva"

/obj/structure/sign/department/ass
	name = "TOOL STORAGE"
	icon_state = "ass"

/obj/structure/sign/department/bar
	name = "BAR"
	icon_state = "bar"

/obj/structure/sign/department/biblio
	name = "LIBRARY"
	icon_state = "biblio"

/obj/structure/sign/department/chapel
	name = "CHAPEL"
	icon_state = "chapel"

/obj/structure/sign/department/bridge
	name = "BRIDGE"
	icon_state = "bridge"

/obj/structure/sign/department/telecoms
	name = "TELECOMS"
	icon_state = "telecoms"

/obj/structure/sign/department/conference_room
	name = "CONFERENCE"
	icon_state = "conference_room"

/obj/structure/sign/department/ai
	name = "AI"
	icon_state = "ai"

/obj/structure/sign/department/cargo
	name = "CARGO"
	icon_state = "cargo"

/obj/structure/sign/department/mail
	name = "MAIL"
	icon_state = "mail"

/obj/structure/sign/department/miner_dock
	name = "HULK DOCK"
	icon_state = "miner_dock"

/obj/structure/sign/department/cargo_dock
	name = "CARGO A5 DOCK"
	icon_state = "cargo_dock"

/obj/structure/sign/department/eng
	name = "ENGINEERING"
	icon_state = "eng"

/obj/structure/sign/department/engine
	name = "ENGINE"
	icon_state = "engine"

/obj/structure/sign/department/gravi
	name = "GRAVGEN"
	icon_state = "gravi"

/obj/structure/sign/department/atmos
	name = "ATMOSPHERICS"
	icon_state = "atmos"

/obj/structure/sign/department/shield
	name = "SHIELDGEN"
	icon_state = "shield"

/obj/structure/sign/department/drones
	name = "DRONES"
	icon_state = "drones"

/obj/structure/sign/department/interrogation
	name = "INTERROGATION"
	icon_state = "interrogation"

/obj/structure/sign/department/commander
	name = "IHS COMMANDER"
	icon_state = "commander"

/obj/structure/sign/department/armory
	name = "IHS ARMORY"
	icon_state = "armory"

/obj/structure/sign/department/prison
	name = "PRISON"
	icon_state = "prison"

/*Old Department Signs - they have the old look but might still be useful.*/

/obj/structure/sign/departmentold/science
	name = "\improper SCIENCE"
	desc = "A rectangular sign which reads 'SCIENCE'."
	icon_state = "science1"

/obj/structure/sign/departmentold/science/variant1
	name = "\improper SCIENCE"
	desc = "A rectangular sign which reads 'SCIENCE'."
	icon_state = "science2"

/obj/structure/sign/departmentold/science/small
	name = "\improper SCIENCE"
	desc = "A rectangular sign which reads 'SCIENCE'."
	icon_state = "sciencesmall"

/obj/structure/sign/departmentold/chemistry
	name = "\improper CHEMISTRY"
	desc = "A rectangular sign which reads 'CHEMISTRY'."
	icon_state = "chemistry1"

/obj/structure/sign/departmentold/chemistry/variant1
	name = "\improper CHEMISTRY"
	desc = "A rectangular sign which reads 'CHEMISTRY'."
	icon_state = "chemistry2"

/obj/structure/sign/departmentold/chemistry/small
	name = "\improper CHEMISTRY"
	desc = "A rectangular sign which reads 'CHEMISTRY'."
	icon_state = "chemistrysmall"

/obj/structure/sign/departmentold/botany
	name = "\improper HYDROPONICS"
	desc = "A rectangular sign which reads 'HYDROPONICS'."
	icon_state = "hydro1"

/obj/structure/sign/departmentold/botany/variant1
	name = "\improper HYDROPONICS"
	desc = "A rectangular sign which reads 'HYDROPONICS'."
	icon_state = "hydro2"

/obj/structure/sign/departmentold/botany/variant2
	name = "\improper HYDROPONICS STORAGE"
	desc = "A rectangular sign which reads 'HYDROPONICS'."
	icon_state = "hydro3"

/obj/structure/sign/departmentold/botany/small
	name = "\improper HYDROPONICS"
	desc = "A rectangular sign which reads 'HYDROPONICS'."
	icon_state = "hydrosmall"

/obj/structure/sign/departmentold/engineering
	name = "\improper ENGINEERING"
	desc = "A rectangular sign which reads 'ENGINEERING'."
	icon_state = "engineold"

/obj/structure/sign/departmentold/cargo
	name = "\improper CARGO"
	desc = "A rectangular sign which reads 'CARGO'."
	icon_state = "cargoold"

/obj/structure/sign/departmentold/chapel
	name = "\improper CHAPEL"
	desc = "A rectangular sign which reads 'HOLY'."
	icon_state = "holyold"

/obj/structure/sign/departmentold/examroom
	name = "\improper EXAM"
	desc = "A rectangular sign which reads 'EXAM ROOM'."
	icon_state = "examroom"

/obj/structure/sign/departmentold/examroom/small
	name = "\improper EXAM"
	desc = "A rectangular sign which reads 'EXAM ROOM'."
	icon_state = "examsmall"

/obj/structure/sign/departmentold/security
	name = "\improper SECURITY"
	desc = "A rectangular sign which reads 'SECURITY'."
	icon_state = "securityold"

/obj/structure/sign/departmentold/custodian
	name = "\improper SECURITY"
	desc = "A rectangular sign which reads 'CUSTODIAN'."
	icon_state = "custodianold"

/obj/structure/sign/departmentold/restroom
	name = "\improper RESTROOM"
	desc = "A rectangular sign which reads 'RESTROOM'."
	icon_state = "restroomold"

/*Medsci*/

/obj/structure/sign/medsci/redcross
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "redcross"

/obj/structure/sign/medsci/bluecross
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "bluecross"

/obj/structure/sign/medsci/bluecross2
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "bluecross2"

/obj/structure/sign/medsci/bluecross3
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "bluecross3"

/obj/structure/sign/medsci/greencross
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "greencrossbig"

/obj/structure/sign/medsci/greencross2
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "greencross"

/obj/structure/sign/medsci/greencross3
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "greencross2"

/obj/structure/sign/medsci/firstaidstation
	name = "first aid station"
	desc = "A sign signifying a first aid station."
	icon_state = "firstaidstation"

/obj/structure/sign/medsci/lifestar
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "lifestar"

/obj/structure/sign/medsci/hospital
	name = "CITY HOSPITAL"
	icon = 'icons/obj/signs.dmi'
	icon_state = "meetingroom1"

/obj/structure/sign/medsci/hospital/right
	name = "CITY HOSPITAL"
	icon = 'icons/obj/signs.dmi'
	icon_state = "meetingroom2"

/*Faction Signs*/

/obj/structure/sign/faction
	name = "faction sign"
	desc = "Faction sign of some sort."

/obj/structure/sign/faction/ironhammer
	name = "Ironhammer Security"
	desc = "A sign depicting the insignia of Ironhammer Security, the military firm."
	icon_state = "ironhammer"

/obj/structure/sign/faction/ironhammer_banner
	name = "Ironhammer Security"
	desc = "A banner depicting the insignia of Ironhammer Security, the military firm."
	icon_state = "ironhammerold"

/obj/structure/sign/faction/one_star
	name = "One Star"
	desc = "A rugged banner depicting the all-seeing eye of One Star, the fallen empire."
	icon_state = "one_star"

/obj/structure/sign/faction/one_star_old
	name = "One Star"
	desc = "A torn banner depicting the all-seeing eye of One Star, the fallen empire."
	icon_state = "one_star_old"

/obj/structure/sign/faction/frozenstar
	name = "Frozen Star"
	desc = "A sign depicting the insignia of Frozen Star, the prominent weapons manufacturer."
	icon_state = "frozenstar"

/obj/structure/sign/faction/moebius
	name = "Moebius Laboratories"
	desc = "A sign depicting the insignia of Moebius Laboratories, the pharmaceutical and research organisation."
	icon_state = "moebius"

/obj/structure/sign/faction/neotheology
	name = "NeoTheology"
	desc = "A sign depicting the Tau Cross - the symbol of NeoTheology."
	icon_state = "neotheology"

/obj/structure/sign/faction/neotheology_old
	name = "NeoTheology"
	desc = "A decaying sign depicting the Tau Cross - the symbol of NeoTheology."
	icon_state = "neotheology-old"

/obj/structure/sign/faction/neotheology_cross
	name = "NeoTheology Tau Cross"
	desc = "The religious symbol of NeoTheology - the Tau cross. This one appears to be decorative."
	icon_state = "wall_cross_steel"

/obj/structure/sign/faction/neotheology_cross/gold
	desc = "The religious symbol of NeoTheology - the Tau cross. This one appears to be decorative."
	icon_state = "wall_cross_gold"

/obj/structure/sign/faction/astersguild
	name = "Asters Guild"
	desc = "A sign depicting the insignia of Asters Guild, the transport monopolists."
	icon_state = "astersguild"

/obj/structure/sign/faction/technomancers
	name = "Technomancer League"
	desc = "A sign depicting the insignia of the Technomancer League, the clan of mechanists."
	icon_state = "technomancers"

/obj/structure/sign/faction/excelsior
	name = "Excelsior"
	desc = "A sign depicting the insignia of Excelsior, the communist mining union."
	icon_state = "excelsior"

/obj/structure/sign/faction/excelsior_old
	name = "Excelsior"
	desc = "A decaying sign depicting the insignia of Excelsior, the communist mining union."
	icon_state = "excelsior-old"

/obj/structure/sign/faction/nanotrasen
	name = "\improper NanoTrasen"
	desc = "An old metal sign which reads 'NanoTrasen'."
	icon_state = "NT"

/obj/structure/sign/faction/solgov
	name = "\improper SolGov"
	desc = "A blue metal banner with a SolGov insignia.."
	icon_state = "solgovseal"

/*Misc - signs that don't really fit into a category. Still useful!*/

/obj/structure/sign/misc/derelict1
	name = "decrepit sign"
	desc = "A rusted sign displaying some technical information. Too worn to read, unfortunately."
	icon_state = "something-old1"

/obj/structure/sign/misc/derelict2
	name = "decrepit sign"
	desc = "A rusted sign displaying some kind of old insignia. It looks imposing."
	icon_state = "something-old2"

/obj/structure/sign/misc/enlist
	name = "enlistment sign"
	desc = "A battered military recruitment sign."
	icon_state = "enlist"

/obj/structure/sign/misc/ntmining
	name = "nanotrasen mining sign"
	desc = "A rugged sign highlighting an old Nanotrasen mining claim."
	icon_state = "ntpod"

/obj/structure/sign/misc/shelter
	name = "shelter sign"
	desc = "A high visibility sign designating a safe shelter."
	icon_state = "survival"