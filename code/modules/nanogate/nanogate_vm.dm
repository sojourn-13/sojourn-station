/obj/item/modular_computer/tablet/nanogate
	action_button_name = "Access Nanogate Interface"
	icon_state = "generic"
	var/obj/item/organ/internal/nanogate/linked_nanogate
	suitable_cell = /obj/item/cell/small/moebius/pda

//If the parts get damaged then there's no way to fix them, so the tablet itself is EMP proof
//Howver, you can't turn it on when your nanogate is broken - If it turns out you can, report the bug!
/obj/item/modular_computer/tablet/nanogate/emp_act(severity)
	return

//Currently it's a slightly fancy tablet but nothing super special.
//TODO: Make variants for each type of nanogate.
/obj/item/modular_computer/tablet/nanogate/install_default_hardware()
	. = ..()
	processor_unit = new/obj/item/computer_hardware/processor_unit/small(src)
	tesla_link = new/obj/item/computer_hardware/tesla_link(src)
	hard_drive = new/obj/item/computer_hardware/hard_drive/small(src)
	network_card = new/obj/item/computer_hardware/network_card/advanced(src)
	cell = new suitable_cell(src)

/obj/item/modular_computer/tablet/nanogate/Initialize()
	. = ..()
	enable_computer()

/obj/item/modular_computer/tablet/nanogate/install_default_programs()
	..()
	hard_drive.store_file(new/datum/computer_file/program/email_client())
	hard_drive.store_file(new/datum/computer_file/program/chatclient())
	hard_drive.store_file(new/datum/computer_file/program/wordprocessor())
	hard_drive.store_file(new/datum/computer_file/program/newsbrowser())
	hard_drive.store_file(new/datum/computer_file/program/camera_monitor())
	hard_drive.store_file(new/datum/computer_file/program/records())
	hard_drive.store_file(new/datum/computer_file/program/tax())


//The action button. It should only be usable when the user is alive and conscious. No sleep texting!
/datum/action/item_action/hands_free/nanogate_vm
	check_flags = AB_CHECK_ALIVE|AB_CHECK_STUNNED
	target = /obj/item/modular_computer/tablet/nanogate

/datum/action/item_action/hands_free/nanogate_vm/CheckRemoval(mob/living/user)
	return !(user.stats.getPerk(PERK_NANOGATE))
