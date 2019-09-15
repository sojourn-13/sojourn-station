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
	if(istype(tool, /obj/item/weapon/tool/screwdriver) && !istype(src, /obj/structure/sign/double))
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

/obj/structure/sign/double/map
	name = "station map"
	desc = "A framed picture of the station."

/obj/structure/sign/double/map/left
	icon_state = "map-left"

/obj/structure/sign/double/map/right
	icon_state = "map-right"

/obj/structure/sign/double/coffee
	name = "coffee & sweets"
	desc = "A charming wooden cafe sign."

/obj/structure/sign/double/coffee/left
	icon_state = "coffee-left"

/obj/structure/sign/double/coffee/right
	icon_state = "coffee-right"

/obj/structure/sign/double/gamecenter
	name = "game center"
	desc = "A flashing arcade sign. Glitzy."

/obj/structure/sign/double/gamecenter/left
	icon_state = "gamecenter-left"

/obj/structure/sign/double/gamecenter/right
	icon_state = "gamecenter-right"

/obj/structure/sign/double/drivethru
	name = "drivethru"
	desc = "An eye-catching drivethru sign."

/obj/structure/sign/double/drivethru/left
	icon_state = "drivethru1"

/obj/structure/sign/double/drivethru/right
	icon_state = "drivethru2"

/obj/structure/sign/departmentold/examroom
	name = "\improper EXAM"
	desc = "A rectangular sign which reads 'EXAM ROOM'."
	icon_state = "examroom"

/obj/structure/sign/warning/vacuum
	name = "\improper HARD VACUUM AHEAD"
	desc = "A warning sign which reads 'HARD VACUUM AHEAD'."
	icon_state = "space"

/obj/structure/sign/warning/pods
	name = "\improper ESCAPE PODS"
	desc = "A warning sign which reads 'ESCAPE PODS'."
	icon_state = "pods"

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

/obj/structure/sign/medsci/greencross
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "greencross"

/obj/structure/sign/medsci/lifestar
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "lifestar"

/obj/structure/sign/plaque/goldenplaque
	name = "The Most Robust Men Award for Robustness"
	desc = "To be Robust is not an action or a way of life, but a mental state. Only those with the force of Will strong enough to act during a crisis, saving friend from foe, are truly Robust. Stay Robust my friends."
	icon_state = "goldenplaque"

/obj/structure/sign/plaque/kiddieplaque
	name = "\improper AI developers plaque"
	desc = "Next to the extremely long list of names and job titles, there is a drawing of a little child. Beneath the image, someone has scratched the word \"PACKETS\""
	icon_state = "kiddieplaque"

/obj/structure/sign/plaque/wordplaque
	name = "\improper AI developers plaque"
	desc = "Next to the extremely long list of names and job titles, there is a drawing of a little child. Beneath the image, someone has scratched the word \"PACKETS\""
	icon_state = "writingplaque"

/obj/structure/sign/plaque/atmosplaque
	name = "\improper FEA atmospherics division plaque"
	desc = "This plaque commemorates the fall of the Atmos FEA division. For all the charred, dizzy, and brittle men who have died in its hands."
	icon_state = "atmosplaque"

/obj/structure/sign/double/maltesefalcon	//The sign is 64x32, so it needs two tiles. ;3
	name = "The Maltese Falcon"
	desc = "The Maltese Falcon, Space Bar and Grill."

/obj/structure/sign/double/maltesefalcon/left
	icon_state = "maltesefalcon-left"

/obj/structure/sign/double/maltesefalcon/right
	icon_state = "maltesefalcon-right"

/obj/structure/sign/departmentold/science			//These 3 have multiple types, just var-edit the icon_state to whatever one you want on the map
	name = "\improper SCIENCE"
	desc = "A rectangular sign which reads 'SCIENCE'."
	icon_state = "science1"

/obj/structure/sign/departmentold/science2
	name = "\improper SCIENCE"
	desc = "A rectangular sign which reads 'SCIENCE'."
	icon_state = "science2"

/obj/structure/sign/departmentold/chemistry
	name = "\improper CHEMISTRY"
	desc = "A rectangular sign which reads 'CHEMISTRY'."
	icon_state = "chemistry1"

/obj/structure/sign/departmentold/chemistry2
	name = "\improper CHEMISTRY"
	desc = "A rectangular sign which reads 'CHEMISTRY'."
	icon_state = "chemistry2"

/obj/structure/sign/departmentold/botany
	name = "\improper HYDROPONICS"
	desc = "A rectangular sign which reads 'HYDROPONICS'."
	icon_state = "hydro1"

/obj/structure/sign/departmentold/botany2
	name = "\improper HYDROPONICS"
	desc = "A rectangular sign which reads 'HYDROPONICS'."
	icon_state = "hydro2"

/obj/structure/sign/departmentold/botany3
	name = "\improper HYDROPONICS STORAGE"
	desc = "A rectangular sign which reads 'HYDROPONICS'."
	icon_state = "hydro3"

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

/obj/structure/sign/directions
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

/obj/structure/sign/warning/airlock
	name = "\improper EXTERNAL AIRLOCK"
	icon_state = "doors"

/obj/structure/sign/warning/biohazard
	name = "\improper BIOHAZARD"
	icon_state = "bio"

/obj/structure/sign/warning/bomb_range
	name = "\improper BOMB RANGE"
	icon_state = "blast"

/obj/structure/sign/warning/caution
	name = "\improper CAUTION"
	icon_state = "securearea"

/obj/structure/sign/warning/compressed_gas
	name = "\improper COMPRESSED GAS"
	icon_state = "hikpa"

/obj/structure/sign/warning/deathsposal
	name = "\improper DISPOSAL LEADS TO SPACE"
	icon_state = "deathsposal"

/obj/structure/sign/warning/docking_area
	name = "\improper KEEP CLEAR: DOCKING AREA"
	icon_state = "securearea"

/obj/structure/sign/warning/evac
	name = "\improper KEEP CLEAR: EVAC DOCKING AREA"
	icon_state = "evac"

/obj/structure/sign/warning/fire
	name = "\improper DANGER: FIRE"
	icon_state = "fire"

/obj/structure/sign/warning/high_voltage
	name = "\improper HIGH VOLTAGE"
	icon_state = "shock"

/obj/structure/sign/warning/hot_exhaust
	name = "\improper HOT EXHAUST"
	icon_state = "fire"

/obj/structure/sign/warning/mail_delivery
	name = "\improper MAIL DELIVERY"
	icon_state = "maildelivery"

/obj/structure/sign/warning/internals_required
	name = "\improper INTERNALS REQUIRED"
	icon_state = "securearea"

/obj/structure/sign/warning/lethal_turrets
	name = "\improper LETHAL TURRETS"
	icon_state = "turrets"

/obj/structure/sign/warning/lethal_turrets/New()
	..()
	desc += " Enter at own risk!."

/obj/structure/sign/warning/moving_parts
	name = "\improper MOVING PARTS"
	icon_state = "movingparts"

/obj/structure/sign/warning/nosmoking_1
	name = "\improper NO SMOKING"
	icon_state = "nosmoking"

/obj/structure/sign/warning/nosmoking_2
	name = "\improper NO SMOKING"
	icon_state = "nosmoking2"

/obj/structure/sign/warning/pods
	name = "\improper ESCAPE PODS"
	icon_state = "pods"

/obj/structure/sign/warning/radioactive
	name = "\improper RADIOACTIVE AREA"
	icon_state = "radiation"

/obj/structure/sign/warning/secure_area
	name = "\improper SECURE AREA"
	icon_state = "securearea2"

/obj/structure/sign/warning/armory
	name = "\improper ARMORY"
	icon_state = "armorywarning"

/obj/structure/sign/warning/server_room
	name = "\improper SERVER ROOM"
	icon_state = "server"

/obj/structure/sign/warning/siphon_valve
	name = "\improper SIPHON VALVE"
	icon_state = "securearea"

/obj/structure/sign/warning/vacuum
	name = "\improper HARD VACUUM AHEAD"
	icon_state = "space"

/obj/structure/sign/warning/vent_port
	name = "\improper EJECTION/VENTING PORT"
	icon_state = "securearea"

/obj/structure/sign/warning/emergence
	name = "\improper EMERGENT INTELLIGENCE DETAILS"
	icon_state = "rogueai"

//Eris signs

/obj/structure/sign/atmos/atmos_co2
	name = "carbon dioxide warning sign"
	desc = "WARNING! CO2 flow tube. Ensure the flow is disengaged before working."
	icon_state = "atmos_co2"

/obj/structure/sign/atmos/atmos_n2o
	name = "nitrous oxide warning sign"
	desc = "WARNING! N2O flow tube. Ensure the flow is disengaged before working."
	icon_state = "atmos_n2o"

/obj/structure/sign/atmos/atmos_plasma
	name = "plasma warning sign"
	desc = "WARNING! Plasma flow tube. Ensure the flow is disengaged before working."
	icon_state = "atmos_plasma"

/obj/structure/sign/atmos/atmos_n2
	name = "nitrogen warning sign"
	desc = "WARNING! N2 flow tube. Ensure the flow is disengaged before working."
	icon_state = "atmos_n2"

/obj/structure/sign/atmos/atmos_o2
	name = "oxygen warning sign"
	desc = "WARNING! O2 flow tube. Ensure the flow is disengaged before working."
	icon_state = "atmos_o2"

/obj/structure/sign/atmos/atmos_air
	name = "air warning sign"
	desc = "WARNING! Air flow tube. Ensure the flow is disengaged before working."
	icon_state = "atmos_air"

/obj/structure/sign/atmos/atmos_waste
	name = "atmos waste warning sign"
	desc = "WARNING! Waste flow tube. Ensure the flow is disengaged before working."
	icon_state = "atmos_waste"

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

/obj/structure/sign/levels/stairsup
	desc = "A silver sign which shows a stairway up."
	name = "STAIRS"
	icon_state = "stairs_up"

/obj/structure/sign/levels/stairsdown
	desc = "A silver sign which shows a stairway down."
	name = "STAIRS"
	icon_state = "stairs_down"

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

/obj/structure/sign/faction/nanotrasen
	name = "\improper NanoTrasen"
	desc = "An old metal sign which reads 'NanoTrasen'."
	icon_state = "NT"

/obj/structure/sign/signnew/biohazard
	name = "BIOLOGICAL HAZARD"
	desc = "Warning: Biological and-or toxic hazards present in this area!"
	icon_state = "biohazard"

/obj/structure/sign/signnew/corrosives
	name = "CORROSIVE SUBSTANCES"
	desc = "Warning: Corrosive substances prezent in this area!"
	icon_state = "corrosives"

/obj/structure/sign/signnew/explosives
	name = "EXPLOSIVE SUBSTANCES"
	desc = "Warning: Explosive substances present in this area!"
	icon_state = "explosives"

/obj/structure/sign/signnew/flammables
	name = "FLAMMABLE SUBSTANCES"
	desc = "Warning: Flammable substances present in this area!"
	icon_state = "flammable"

/obj/structure/sign/signnew/laserhazard
	name = "LASER HAZARD"
	desc = "Warning: High powered laser emitters operating in this area!"
	icon_state = "laser"

/obj/structure/sign/signnew/danger
	name = "DANGEROUS AREA"
	desc = "Warning: Generally hazardous area! Exercise caution."
	icon_state = "danger"

/obj/structure/sign/signnew/magnetics
	name = "MAGNETIC FIELD HAZARD"
	desc = "Warning: Extremely powerful magnetic fields present in this area!"
	icon_state = "magnetics"

/obj/structure/sign/signnew/opticals
	name = "OPTICAL HAZARD"
	desc = "Warning: Optical hazards present in this area!"
	icon_state = "optical"

/obj/structure/sign/signnew/radiation
	name = "RADIATION HAZARD"
	desc = "Warning: Significant levels of radiation present in this area!"
	icon_state = "radiation"

/obj/structure/sign/signnew/secure
	name = "SECURE AREA"
	desc = "Warning: Secure Area! Do not enter without authorization!"
	icon_state = "secure"

/obj/structure/sign/signnew/electrical
	name = "ELECTRICAL HAZARD"
	desc = "Warning: Electrical hazards! Wear protective equipment."
	icon_state = "electrical"

/obj/structure/sign/signnew/cryogenics
	name = "CRYOGENIC TEMPERATURES"
	desc = "Warning: Extremely low temperatures in this area."
	icon_state = "cryogenics"

/obj/structure/sign/signnew/canisters
	name = "PRESSURIZED CANISTERS"
	desc = "Warning: Highly pressurized canister storage."
	icon_state = "canisters"

/obj/structure/sign/signnew/oxidants
	name = "OXIDIZING AGENTS"
	desc = "Warning: Oxidizing agents in this area, do not start fires!"
	icon_state = "oxidants"

/obj/structure/sign/signnew/memetic
	name = "MEMETIC HAZARD"
	desc = "Warning: Memetic hazard, wear meson goggles!"
	icon_state = "memetic"

/obj/structure/sign/painting/paintingwaves
	desc = "A large foamy wave crashing into the rocky and sunlit shore."
	name = "painting"
	icon_state = "painting1"

/obj/structure/sign/painting/paintingstreet
	desc = "A serene city street with a few people on a summer day."
	name = "painting"
	icon_state = "painting2"

/obj/structure/sign/painting/paintingsunset
	desc = "A blazing sunset seen from a steep cliff above the sea."
	name = "painting"
	icon_state = "painting3"

/obj/structure/sign/painting/paintingvalley
	desc = "A wooded mountain valley, explored by a group of horsemen."
	name = "painting"
	icon_state = "painting4"

/obj/structure/sign/painting/paintingtable
	desc = "A table with a piece of white cloth, several fruits and a skull."
	name = "painting"
	icon_state = "painting5"

/obj/structure/sign/painting/paintingbird
	desc = "A long-tailed bird perches on a cherry blossom branch."
	name = "painting"
	icon_state = "painting6"

/obj/structure/sign/painting/paintingsnow
	desc = "A lone figure in the setting sun, gazing at the snow-peaked mountains."
	name = "painting"
	icon_state = "painting7"

/obj/structure/sign/painting/paintingtemple
	desc = "A hilly landscape, with a large temple standing on the bank of a river."
	name = "painting"
	icon_state = "painting8"

/obj/structure/sign/painting/paintingdesert
	desc = "A small encampment in the desert, with a flowing river in the distance."
	name = "painting"
	icon_state = "painting9"

/obj/structure/sign/painting/paintingsea
	desc = "A barque at sea, lit by the full moon."
	name = "painting"
	icon_state = "painting10"

/obj/structure/sign/residential/clock
	name = "\improper clock"
	desc = "A small wall-mounted clock."
	icon_state = "clock"

/obj/structure/sign/painting/russianstalin
	name = "communist portrait"
	desc = "A portrait of some kind of communist figure."
	icon_state = "stalin"

/obj/structure/sign/painting/russianlenin
	name = "communist portrait"
	desc = "A portrait of some kind of communist figure."
	icon_state = "lenin"

//Eris departments

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

//Eris factions

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

/obj/structure/sign/misc/derelict1
	name = "decrepit sign"
	desc = "A rusted sign displaying some technical information. Too worn to read, unfortunately."
	icon_state = "something-old1"

/obj/structure/sign/misc/derelict2
	name = "decrepit sign"
	desc = "A rusted sign displaying some kind of old insignia. It looks imposing."
	icon_state = "something-old2"

/obj/structure/sign/residential/periodic
	name = "periodic table"
	desc = "A scientific chart illustrating the elements."
	icon_state = "periodic"

/obj/structure/sign/painting/monkey
	name = "monkey painting"
	desc = "A small painting of a glaring monkey. Very ominous."
	icon_state = "monkey_painting"

/obj/structure/sign/residential/rent
	name = "rent sign"
	desc = "A sign advertising a property for rent."
	icon_state = "rent"

/obj/structure/sign/residential/fine
	name = "'fine sign"
	desc = "A sign issuing a reminder to pay any financial penalties."
	icon_state = "fine"

/obj/structure/sign/residential/vote
	name = "vote sign"
	desc = "A sign that stresses the importance of democracy."
	icon_state = "vote"

/obj/structure/sign/residential/phone
	name = "phone sign"
	desc = "A sign directing to a nearby public radio."
	icon_state = "phoneicon"

/obj/structure/sign/residential/bus
	name = "bus sign"
	desc = "A sign signifying a transport hub."
	icon_state = "bus"

/obj/structure/sign/residential/barber
	name = "barber"
	desc = "A spinning pole signifying a barber shop."
	icon_state = "barber"

/obj/structure/sign/residential/techshop
	name = "techshop"
	desc = "A decorative green sign advertising a techshop."
	icon_state = "techshop"

/obj/structure/sign/residential/botany
	name = "botany"
	desc = "A botany sign."
	icon_state = "botany"

/obj/structure/sign/residential/loan
	name = "loan"
	desc = "A financial sign."
	icon_state = "loan"

/obj/structure/sign/misc/ntmining
	name = "nanotrasen mining sign"
	desc = "A rugged sign highlighting an old Nanotrasen mining claim."
	icon_state = "ntpod"

/obj/structure/sign/misc/shelter
	name = "shelter sign"
	desc = "A high visibility sign designating a safe shelter."
	icon_state = "survival"

/obj/structure/sign/neon/Destroy()
	set_light(0)
	return ..()

/obj/structure/sign/neon
	desc = "A glowing sign."
	icon = 'icons/obj/signs.dmi'
	plane = -25
	light_range = 4
	light_power = 2

/obj/structure/sign/neon/item
	name = "item store"
	icon_state = "item"
	light_color = "#B79F41" //copper

/obj/structure/sign/neon/motel
	name = "motel"
	icon_state = "motel"
	light_color = "#59FF9B" //teal

/obj/structure/sign/neon/hotel
	name = "hotel"
	icon_state = "hotel"
	light_color = "#59FF9B" //teal

/obj/structure/sign/neon/flashhotel
	name = "hotel"
	icon_state = "flashhotel"
	light_color = "#FF8FF8" //hot pink

/obj/structure/sign/neon/lovehotel
	name = "hotel"
	icon_state = "lovehotel"
	light_color = "#59FF9B" //teal

/obj/structure/sign/neon/sushi
	name = "sushi"
	icon_state = "sushi"
	light_color = "#7DD3FF"  //sky blue

/obj/structure/sign/neon/bakery
	name = "bakery"
	icon_state = "bakery"
	light_color = "#FF8FEE" //hot pink

/obj/structure/sign/neon/beer
	name = "pub"
	icon_state = "beer"
	light_color = "#CBDC54" //yellow

/obj/structure/sign/neon/inn
	name = "inn"
	icon_state = "inn"
	light_color = "#F070FF"  //deeper hot pink

/obj/structure/sign/neon/cafe
	name = "cafe"
	icon_state = "cafe"
	light_color = "#FF8FEE" //hot pink

/obj/structure/sign/neon/diner
	name = "diner"
	icon_state = "diner"
	light_color = "#59FF9B" //teal

/obj/structure/sign/neon/bar_alt
	name = "bar"
	icon_state = "bar_alt"
	light_color = "#39FFA4" //teal

/obj/structure/sign/neon/casino
	name = "casino"
	icon_state = "casino"
	light_color = "#6CE08A" //teal

/obj/structure/sign/neon/cupcake
	name = "cupcake"
	icon_state = "cupcake"
	light_color = "#F4A9D8" //pink!

/obj/structure/sign/neon/cupcake2
	name = "cupcake"
	icon_state = "cupcake2"
	light_color = "#F4A9D8" //pink!

/obj/structure/sign/neon/peace
	name = "peace"
	icon_state = "peace"
	light_color = "#8559FF" //a cross between the blue and purple

/obj/structure/sign/neon/sale
	name = "sale"
	icon_state = "sale"
	light_color = "#6EB6FF" //sky blue

/obj/structure/sign/neon/exit
	name = "exit"
	icon_state = "exit"
	light_color = "#7FEA6A" //lime green

/obj/structure/sign/neon/closed
	name = "close"
	icon_state = "close"
	light_color = "#7FEA6A" //lime green

/obj/structure/sign/neon/closed2
	name = "closed"
	icon_state = "closed"
	light_color = "#39FFA4" //teal

/obj/structure/sign/neon/open
	name = "open"
	icon_state = "open"
	light_color = "#FFFFFF" //white

/obj/structure/sign/neon/disco
	name = "disco"
	icon_state = "disco"

/obj/structure/sign/neon/phone
	name = "phone"
	icon_state = "phone"
	light_color = "#7FEA6A" //lime green

/obj/structure/sign/neon/armory
	name = "armory"
	icon_state = "armory"
	light_color = "#7FEA6A" //lime green

/obj/structure/sign/neon/pizza
	name = "pizza"
	icon_state = "pizza"
	light_color = "#33CC00" //green

/obj/structure/sign/neon/clothes
	name = "clothes"
	icon_state = "clothes"
	light_color = "#FF9326" //orange

/obj/structure/sign/neon/bar
	name = "bar sign"
	desc = "The sign says 'Bar' on it."
	icon_state = "bar"
	light_color = "#63C4D6" //light blue

/obj/structure/sign/neon/hospital
	name = "hospital sign"
	desc = "A neon hospital sign"
	icon_state = "medical_on"
	light_color = "#7FEA6A" //lime green

/obj/structure/sign/neon/hospital/red
	icon_state = "medicalred_on"
	light_color = "#da0205" //red