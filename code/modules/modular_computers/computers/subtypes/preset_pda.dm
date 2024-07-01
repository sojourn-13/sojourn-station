/obj/item/modular_computer/pda/install_default_hardware()
	..()
	network_card = new network_card_type(src)
	hard_drive = new hard_drive_type(src)
	processor_unit = new processor_unit_type(src)
	card_slot = new /obj/item/computer_hardware/card_slot(src)
	cell = new /obj/item/cell/small/moebius/pda(src)
	gps_sensor= new /obj/item/computer_hardware/gps_sensor(src)
	led = new /obj/item/computer_hardware/led(src)
	if(scanner_type)
		scanner = new scanner_type(src)
	if(tesla_link_type)
		tesla_link = new tesla_link_type(src)


/obj/item/modular_computer/pda/install_default_programs()
	..()

	hard_drive.store_file(new /datum/computer_file/program/chatclient())
	hard_drive.store_file(new /datum/computer_file/program/email_client())
	hard_drive.store_file(new /datum/computer_file/program/crew_manifest())
	hard_drive.store_file(new /datum/computer_file/program/wordprocessor())
	hard_drive.store_file(new /datum/computer_file/program/records())
	hard_drive.store_file(new /datum/computer_file/program/bounty_board_app())
	hard_drive.store_file(new /datum/computer_file/program/trade/order())
	//if(prob(30)) //harmless tax software // We don't have antags that can use it and it can get confused with the other one. -R4d6
	//	hard_drive.store_file(new /datum/computer_file/program/uplink())
	if(prob(60))
		hard_drive.store_file(new /datum/computer_file/program/tax())

// PDA types

/obj/item/modular_computer/pda/engineering
	icon_state = "pda-e"
	icon_state_unpowered = "pda-e"
	scanner_type = /obj/item/computer_hardware/scanner/atmos

/obj/item/modular_computer/pda/security
	icon_state = "pda-s"
	icon_state_unpowered = "pda-s"

/obj/item/modular_computer/pda/forensics
	icon_state = "pda-s"
	icon_state_unpowered = "pda-s"
	scanner_type = /obj/item/computer_hardware/scanner/reagent

/obj/item/modular_computer/pda/corpsman
	icon_state = "pda-s"
	icon_state_unpowered = "pda-s"
	scanner_type = /obj/item/computer_hardware/scanner/medical

/obj/item/modular_computer/pda/science
	hard_drive_type = /obj/item/computer_hardware/hard_drive/small/adv

/obj/item/modular_computer/pda/moebius/install_default_programs()
	..()
	hard_drive.store_file(new /datum/computer_file/program/signaller)
	hard_drive.store_file(new /datum/computer_file/program/chem_catalog)

/obj/item/modular_computer/pda/science/science
	icon_state = "pda-nt"
	icon_state_unpowered = "pda-nt"
	scanner_type = /obj/item/computer_hardware/scanner/reagent

/obj/item/modular_computer/pda/science/medical
	icon_state = "pda-m"
	icon_state_unpowered = "pda-m"
	scanner_type = /obj/item/computer_hardware/scanner/medical

/obj/item/modular_computer/pda/science/chemistry
	icon_state = "pda-m"
	icon_state_unpowered = "pda-m"
	scanner_type = /obj/item/computer_hardware/scanner/reagent

/obj/item/modular_computer/pda/science/roboticist
	icon_state = "pda-robot"
	icon_state_unpowered = "pda-robot"


/obj/item/modular_computer/pda/church
	icon_state = "pda-neo"
	icon_state_unpowered = "pda-neo"


/obj/item/modular_computer/pda/heads
	name = "command PDA"
	icon_state = "pda-h"
	icon_state_unpowered = "pda-h"
	hard_drive_type = /obj/item/computer_hardware/hard_drive/small/adv
	processor_unit_type = /obj/item/computer_hardware/processor_unit/adv/small
	network_card_type = /obj/item/computer_hardware/network_card/advanced
	tesla_link_type = /obj/item/computer_hardware/tesla_link
	scanner_type = /obj/item/computer_hardware/scanner/paper

/obj/item/modular_computer/pda/heads/hop
	icon_state = "pda-hop"
	icon_state_unpowered = "pda-hop"
	scanner_type = /obj/item/computer_hardware/scanner/paper

/obj/item/modular_computer/pda/heads/hos
	icon_state = "pda-hos"
	icon_state_unpowered = "pda-hos"
	scanner_type = /obj/item/computer_hardware/scanner/paper

/obj/item/modular_computer/pda/heads/ce
	icon_state = "pda-ce"
	icon_state_unpowered = "pda-ce"
	scanner_type = /obj/item/computer_hardware/scanner/atmos

/obj/item/modular_computer/pda/heads/cmo
	icon_state = "pda-cmo"
	icon_state_unpowered = "pda-cmo"
	scanner_type = /obj/item/computer_hardware/scanner/medical

/obj/item/modular_computer/pda/heads/cmo/install_default_programs()
	..()
	hard_drive.store_file(new /datum/computer_file/program/chem_catalog())

/obj/item/modular_computer/pda/heads/rd
	icon_state = "pda-rd"
	icon_state_unpowered = "pda-rd"
	scanner_type = /obj/item/computer_hardware/scanner/reagent

/obj/item/modular_computer/pda/captain
	icon_state = "pda-c"
	icon_state_unpowered = "pda-c"
	hard_drive_type = /obj/item/computer_hardware/hard_drive/small/adv
	processor_unit_type = /obj/item/computer_hardware/processor_unit/adv/small
	network_card_type = /obj/item/computer_hardware/network_card/advanced
	tesla_link_type = /obj/item/computer_hardware/tesla_link
	scanner_type = /obj/item/computer_hardware/scanner/paper

/obj/item/modular_computer/pda/ert
	icon_state = "pda-h"
	icon_state_unpowered = "pda-h"
	hard_drive_type = /obj/item/computer_hardware/hard_drive/small/adv
	processor_unit_type = /obj/item/computer_hardware/processor_unit/adv/small
	network_card_type = /obj/item/computer_hardware/network_card/advanced
	tesla_link_type = /obj/item/computer_hardware/tesla_link

/obj/item/modular_computer/pda/cargo
	icon_state = "pda-sup"
	icon_state_unpowered = "pda-sup"
	scanner_type = /obj/item/computer_hardware/scanner/price

/obj/item/modular_computer/pda/syndicate
	icon_state = "pda-syn"
	icon_state_unpowered = "pda-syn"
	hard_drive_type = /obj/item/computer_hardware/hard_drive/small/adv
	processor_unit_type = /obj/item/computer_hardware/processor_unit/adv/small
	network_card_type = /obj/item/computer_hardware/network_card/advanced
	tesla_link_type = /obj/item/computer_hardware/tesla_link

/obj/item/modular_computer/pda/club_worker
	icon_state = "pda-club"
	icon_state_unpowered = "pda-club"

/obj/item/modular_computer/pda/club_worker/install_default_programs()
	..()
	hard_drive.store_file(new /datum/computer_file/program/drink_catalog())
	hard_drive.store_file(new /datum/computer_file/program/cook_catalog())


// PDA box
/obj/item/storage/box/PDAs
	name = "box of spare PDAs"
	desc = "A box of spare PDA microcomputers."
	icon = 'icons/obj/pda.dmi'
	icon_state = "pdabox"

/obj/item/storage/box/PDAs/populate_contents()
	new /obj/item/modular_computer/pda(src)
	new /obj/item/modular_computer/pda(src)
	new /obj/item/modular_computer/pda(src)
	new /obj/item/modular_computer/pda(src)
	new /obj/item/modular_computer/pda(src)
