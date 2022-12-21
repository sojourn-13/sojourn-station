/datum/design/research/circuit
	build_type = IMPRINTER
	chemicals = list("silicon" = 5)

/datum/design/research/circuit/AssembleDesignName(atom/temp_atom)
	..()
	var/obj/item/circuitboard/C = temp_atom
	if(!istype(C))
		return

	if(C.board_type == "machine")
		name = "Machine circuit ([item_name])"
	else if(C.board_type == "computer")
		name = "Computer circuit ([item_name])"

/datum/design/research/circuit/AssembleDesignDesc()
	if(!desc)
		desc = "Allows for the construction of \a [item_name] circuit board."

/datum/design/research/circuit/arcade_battle
	name = "battle arcade machine"
	build_path = /obj/item/circuitboard/arcade/battle
	category = CAT_MISC

/datum/design/research/circuit/arcade_orion_trail
	name = "orion trail arcade machine"
	build_path = /obj/item/circuitboard/arcade/orion_trail
	category = CAT_MISC

/datum/design/research/circuit/secdata
	name = "security records console"
	build_path = /obj/item/circuitboard/secure_data
	sort_string = "DABAA"
	category = CAT_COMP

/datum/design/research/circuit/prisonmanage
	name = "prisoner management console"
	build_path = /obj/item/circuitboard/prisoner
	category = CAT_COMP

/datum/design/research/circuit/med_data
	name = "medical records console"
	build_path = /obj/item/circuitboard/med_data
	category = CAT_COMP

/datum/design/research/circuit/operating
	name = "patient monitoring console"
	build_path = /obj/item/circuitboard/operating
	category = CAT_COMP

/datum/design/research/circuit/scan_console
	name = "DNA machine"
	build_path = /obj/item/circuitboard/scan_consolenew
	category = CAT_MEDI

/datum/design/research/circuit/sleeper
	name = "Sleeper"
	build_path = /obj/item/circuitboard/sleeper
	category = CAT_MEDI

/datum/design/research/circuit/autodoc
	name = "Autodoc"
	build_path = /obj/item/circuitboard/autodoc
	category = CAT_MEDI

/datum/design/research/circuit/clonepod
	name = "clone pod"
	build_path = /obj/item/circuitboard/clonepod
	category = CAT_MEDI

/datum/design/research/circuit/clonescanner
	name = "cloning scanner"
	build_path = /obj/item/circuitboard/clonescanner
	category = CAT_MEDI

/datum/design/research/circuit/chemmaster
	name = "ChemMaster 3000"
	build_path = /obj/item/circuitboard/chemmaster
	category = CAT_MEDI

/datum/design/research/circuit/chem_heater
	name = "Chemical Heater"
	build_path = /obj/item/circuitboard/chem_heater
	category = CAT_MEDI

/datum/design/research/circuit/chemical_dispenser
	name = "Chemical Dispenser"
	build_path = /obj/item/circuitboard/chemical_dispenser
	category = CAT_MEDI

/datum/design/research/circuit/teleconsole
	name = "teleporter control console"
	build_path = /obj/item/circuitboard/teleporter
	category = CAT_BLUE

/datum/design/research/circuit/robocontrol
	name = "robotics control console"
	build_path = /obj/item/circuitboard/robotics
	category = CAT_COMP

/datum/design/research/circuit/mechacontrol
	name = "exosuit control console"
	build_path = /obj/item/circuitboard/mecha_control
	category = CAT_COMP

/datum/design/research/circuit/rdconsole
	name = "unlicensed R&D control console"
	build_path = /obj/item/circuitboard/rdconsole_unlicensed
	category = CAT_COMP

/datum/design/research/circuit/aifixer
	name = "AI integrity restorer"
	build_path = /obj/item/circuitboard/aifixer
	category = CAT_COMP

/datum/design/research/circuit/comm_monitor
	name = "telecommunications monitoring console"
	build_path = /obj/item/circuitboard/comm_monitor
	category = CAT_TCOM

/datum/design/research/circuit/comm_server
	name = "telecommunications server monitoring console"
	build_path = /obj/item/circuitboard/comm_server
	category = CAT_TCOM

/datum/design/research/circuit/message_monitor
	name = "messaging monitor console"
	build_path = /obj/item/circuitboard/message_monitor
	category = CAT_TCOM

/datum/design/research/circuit/aiupload
	name = "AI upload console"
	build_path = /obj/item/circuitboard/aiupload
	category = CAT_COMP

/datum/design/research/circuit/borgupload
	name = "cyborg upload console"
	build_path = /obj/item/circuitboard/borgupload
	category = CAT_COMP

/datum/design/research/circuit/destructive_analyzer
	name = "destructive analyzer"
	build_path = /obj/item/circuitboard/destructive_analyzer
	category = CAT_COMP

/datum/design/research/circuit/slime_compresser
	name = "slime compresser"
	build_path = /obj/item/circuitboard/slime_compresser
	category = CAT_MACHINE

/datum/design/research/circuit/protolathe
	name = "protolathe"
	build_path = /obj/item/circuitboard/protolathe
	sort_string = "HABAB"
	category = CAT_MACHINE

/datum/design/research/circuit/circuit_imprinter
	name = "circuit imprinter"
	build_path = /obj/item/circuitboard/circuit_imprinter
	category = CAT_MACHINE

/datum/design/research/circuit/autolathe
	name = "autolathe"
	build_path = /obj/item/circuitboard/autolathe
	category = CAT_MACHINE

/datum/design/research/circuit/rdservercontrol
	name = "R&D server control console"
	build_path = /obj/item/circuitboard/rdservercontrol
	category = CAT_COMP

/datum/design/research/circuit/rdserver
	name = "R&D server"
	build_path = /obj/item/circuitboard/rdserver
	category = CAT_MACHINE

/datum/design/research/circuit/mechfab
	name = "exosuit fabricator"
	build_path = /obj/item/circuitboard/mechfab
	category = CAT_MACHINE

/datum/design/research/circuit/mech_recharger
	name = "mech recharger"
	build_path = /obj/item/circuitboard/mech_recharger
	category = CAT_MACHINE

/datum/design/research/circuit/repair_station
	name = "cyborg auto-repair platform"
	build_path = /obj/item/circuitboard/repair_station
	category = CAT_MACHINE

/datum/design/research/circuit/recharge_station
	name = "cyborg recharge station"
	build_path = /obj/item/circuitboard/recharge_station
	category = CAT_MACHINE

/datum/design/research/circuit/recharger
	name = "recharger"
	build_path = /obj/item/circuitboard/recharger
	category = CAT_POWER

/datum/design/research/circuit/atmosalerts
	name = "atmosphere alert console"
	build_path = /obj/item/circuitboard/atmos_alert
	category = CAT_COMP

/datum/design/research/circuit/air_management
	name = "atmosphere monitoring console"
	build_path = /obj/item/circuitboard/air_management
	category = CAT_COMP

/datum/design/research/circuit/dronecontrol
	name = "drone control console"
	build_path = /obj/item/circuitboard/drone_control
	category = CAT_COMP

/datum/design/research/circuit/powermonitor
	name = "power monitoring console"
	build_path = /obj/item/circuitboard/powermonitor
	category = CAT_COMP

/datum/design/research/circuit/solarcontrol
	name = "solar control console"
	build_path = /obj/item/circuitboard/solar_control
	category = CAT_COMP

/datum/design/research/circuit/pacman
	name = "PACMAN-type generator"
	build_path = /obj/item/circuitboard/pacman
	category = CAT_POWER

/datum/design/research/circuit/superpacman
	name = "SUPERPACMAN-type generator"
	build_path = /obj/item/circuitboard/pacman/super
	category = CAT_POWER

/datum/design/research/circuit/mrspacman
	name = "MRSPACMAN-type generator"
	build_path = /obj/item/circuitboard/pacman/mrs
	category = CAT_POWER

/datum/design/research/circuit/miss
	name = "MISS-PACMAN-type generator"
	build_path = /obj/item/circuitboard/pacman/miss
	category = CAT_POWER

/datum/design/research/circuit/camp
	name = "CAMP-PACMAN-type generator"
	build_path = /obj/item/circuitboard/pacman/camp
	category = CAT_POWER

/datum/design/research/circuit/diesel
	name = "diesel-type generator"
	build_path = /obj/item/circuitboard/diesel
	category = CAT_POWER

/datum/design/research/circuit/hydrogen_gen
	name = "hydrogen-type generator"
	build_path = /obj/item/circuitboard/hydrogen_gen
	category = CAT_POWER

/datum/design/research/circuit/batteryrack
	name = "cell rack PSU"
	build_path = /obj/item/circuitboard/batteryrack
	category = CAT_POWER

/datum/design/research/circuit/smes_cell
	name = "'SMES' superconductive magnetic energy storage"
	desc = "Allows for the construction of circuit boards used to build a SMES."
	build_path = /obj/item/circuitboard/smes
	category = CAT_POWER

/datum/design/research/circuit/breakerbox
	name = "breaker box"
	build_path = /obj/item/circuitboard/breakerbox
	category = CAT_POWER

/datum/design/research/circuit/gas_heater
	name = "gas heating system"
	build_path = /obj/item/circuitboard/unary_atmos/heater
	category = CAT_MACHINE

/datum/design/research/circuit/gas_cooler
	name = "gas cooling system"
	build_path = /obj/item/circuitboard/unary_atmos/cooler
	category = CAT_MACHINE

/datum/design/research/circuit/secure_airlock
	name = "secure airlock electronics"
	desc =  "Allows for the construction of a tamper-resistant airlock electronics."
	build_path = /obj/item/airlock_electronics/secure
	category = CAT_MISC

/datum/design/research/circuit/biogenerator
	name = "biogenerator"
	build_path = /obj/item/circuitboard/biogenerator
	category = CAT_MACHINE

/datum/design/research/circuit/miningdrill
	name = "mining drill head"
	build_path = /obj/item/circuitboard/miningdrill
	category = CAT_MINING

/datum/design/research/circuit/miningdrillbrace
	name = "mining drill brace"
	build_path = /obj/item/circuitboard/miningdrillbrace
	category = CAT_MINING

/datum/design/research/circuit/comconsole
	name = "communications console"
	build_path = /obj/item/circuitboard/communications
	category = CAT_COMP

// Telecomms
/datum/design/research/circuit/tcom
	name_category = "telecommunications machinery"
	category = CAT_TCOM

/datum/design/research/circuit/tcom/server
	name = "server mainframe"
	build_path = /obj/item/circuitboard/telecomms/server

/datum/design/research/circuit/tcom/processor
	name = "processor unit"
	build_path = /obj/item/circuitboard/telecomms/processor

/datum/design/research/circuit/tcom/bus
	name = "bus mainframe"
	build_path = /obj/item/circuitboard/telecomms/bus

/datum/design/research/circuit/tcom/hub
	name = "hub mainframe"
	build_path = /obj/item/circuitboard/telecomms/hub

/datum/design/research/circuit/tcom/relay
	name = "relay mainframe"
	build_path = /obj/item/circuitboard/telecomms/relay

/datum/design/research/circuit/tcom/broadcaster
	name = "subspace broadcaster"
	build_path = /obj/item/circuitboard/telecomms/broadcaster

/datum/design/research/circuit/tcom/receiver
	name = "subspace receiver"
	build_path = /obj/item/circuitboard/telecomms/receiver

/datum/design/research/circuit/ntnet_relay
	name = "NTNet Quantum Relay"
	build_path = /obj/item/circuitboard/ntnet_relay
	category = CAT_TCOM

// Shield Generators
/datum/design/research/circuit/shield
	name_category = "shield generator"
	category = CAT_MISC

/datum/design/research/circuit/shield/hull
	name = "hull"
	build_path = /obj/item/circuitboard/shield_generator
/*
/datum/design/research/circuit/shield/capacitor
	name = "capacitor"
	desc = "Allows for the construction of a shield capacitor circuit board."
	build_path = /obj/item/circuitboard/shield_cap
*/

//BS
/datum/design/research/circuit/telesci/console
	name = "TeleSci Console"
	build_path = /obj/item/circuitboard/telesci_console
	sort_string = "VAAAD"
	category = CAT_BLUE

/datum/design/research/circuit/telesci/hub
	name = "TeleSci Pad"
	build_path = /obj/item/circuitboard/telesci_pad
	sort_string = "VAAAE"
	category = CAT_BLUE

/datum/design/research/circuit/telesci/relay
	name = "TeleSci Relay"
	build_path = /obj/item/circuitboard/telesci_relay
	sort_string = "VAAF"
	category = CAT_BLUE

/datum/design/research/circuit/telesci/inhibit
	name = "Teleporter Inhibitor"
	build_path = /obj/item/circuitboard/tele_inhibitor
	sort_string = "VAAQ"
	category = CAT_BLUE

/datum/design/research/circuit/bssilk/console
	name = "Bluespace Snare Control Console"
	build_path = /obj/item/circuitboard/bssilk_cons
	category = CAT_BLUE

/datum/design/research/circuit/bssilk/hub
	name = "Bluespace Snare Hub"
	build_path = /obj/item/circuitboard/bssilk_hub
	category = CAT_BLUE

/datum/design/research/circuit/teleporter/station
	name = "Teleporter Station"
	build_path = /obj/item/circuitboard/teleporterstation
	category = CAT_BLUE

/datum/design/research/circuit/teleporter/hub
	name = "Teleporter Hub"
	build_path = /obj/item/circuitboard/teleporterhub
	category = CAT_BLUE

/*
//Experimental devices
/datum/design/research/circuit/mindswapper
	name = "experimental mind swapper"
	build_path = /obj/item/circuitboard/mindswapper
	category = CAT_MEDI
*/

/datum/design/research/circuit/tesla_turret
	name = "experimental tesla turret"
	build_path = /obj/item/circuitboard/tesla_turret
	category = CAT_POWER

/datum/design/research/circuit/ameridian_refinery
	name = "ameridian refinery"
	build_path = /obj/item/circuitboard/ameridian_refinery
	category = CAT_AMERIDIAN

/datum/design/research/circuit/liquid_ameridian_processor
	name = "liquid ameridian processor"
	build_path = /obj/item/circuitboard/liquid_ameridian_processor
	category = CAT_AMERIDIAN

/datum/design/research/circuit/ameridian_analyzer
	name = "liquid ameridian analyzer"
	build_path = /obj/item/circuitboard/ameridian_analyzer
	category = CAT_AMERIDIAN

/datum/design/research/circuit/ameridianshieldwallgen
	name = "sonic fence generator"
	build_path = /obj/item/circuitboard/ameridianshieldwallgen
	category = CAT_AMERIDIAN



//Industrial Printing

/datum/design/research/circuit/industrial_chems
	name = "Industrial Chem Dispenser"
	build_path = /obj/item/circuitboard/chemical_dispenser/industrial
	category = CAT_MEDI

/datum/design/research/circuit/industrial_autolathe
	name = "Industrial Autolathe"
	build_path = /obj/item/circuitboard/autolathe_industrial
	category = CAT_MACHINE

/datum/design/research/circuit/recharger_industrial
	name = "Industrial Recharger"
	build_path = /obj/item/circuitboard/recharger/industrial
	category = CAT_POWER

/datum/design/research/circuit/industrial_grinder
	name = "Industrial Grinder"
	build_path = /obj/item/circuitboard/industrial_grinder
	category = CAT_MEDI

//Hydro

/datum/design/research/circuit/extractor
	name = "Lysis Isolation Centrifuge"
	build_path = /obj/item/circuitboard/extractor
	category = CAT_MACHINE

/datum/design/research/circuit/seed_extractor
	name = "Seed Extractor"
	build_path = /obj/item/circuitboard/seed_extractor
	category = CAT_MACHINE

/datum/design/research/circuit/editor
	name = "Bioballistic Delivery System"
	build_path = /obj/item/circuitboard/editor
	category = CAT_MACHINE

/*
// Cargo
/datum/design/research/circuit/ordercomp
	name = "supply ordering console"
	build_path = /obj/item/circuitboard/ordercomp
	category = CAT_COMP

/datum/design/research/circuit/supplycomp
	name = "supply control console"
	build_path = /obj/item/circuitboard/supplycomp
	category = CAT_COMP
*/
