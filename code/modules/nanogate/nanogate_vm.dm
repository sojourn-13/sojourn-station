/obj/item/modular_computer/tablet/nanogate
	action_button_name = "Access Nanogate Interface"
	icon_state = "generic"
	icon_state_unpowered = "generic"
	screen_light_range = 0 //So our nanogate users don't look like they work for the federal government
	screen_light_strength = 0
	var/obj/item/organ/internal/nanogate/linked_nanogate
	suitable_cell = /obj/item/cell/small/moebius/pda

//If the parts get damaged then there's no way to fix them, so the tablet itself is EMP proof
//Howver, you can't turn it on when your nanogate is broken - If it turns out you can, report the bug!
/obj/item/modular_computer/tablet/nanogate/emp_act(severity)
	return

/obj/item/computer_hardware/network_card/advanced/satlink
	name = "satellite uplink"
	desc = "A highly advanced satellite uplink that works anywhere on the planet."
	ethernet = TRUE //Unlimited connection range.

/obj/item/modular_computer/tablet/nanogate/ui_state(mob/user)
	return GLOB.deep_inventory_state

// We have to override this because there's really stupid shitcode in /atom/ui_status that checks Adjacent ignoring UI_state completely
/obj/item/modular_computer/tablet/nanogate/ui_status(mob/user, datum/ui_state/state)
	if(linked_nanogate.status & ORGAN_BROKEN)
		return UI_CLOSE
	return state.can_use_topic(src, user)

//Currently it's a slightly fancy tablet but nothing super special.
//TODO: Make variants for each type of nanogate.
/obj/item/modular_computer/tablet/nanogate/install_default_hardware()
	. = ..()
	processor_unit = new/obj/item/computer_hardware/processor_unit/small(src)
	tesla_link = new/obj/item/computer_hardware/tesla_link(src)
	hard_drive = new/obj/item/computer_hardware/hard_drive/small/adv(src)
	network_card = new/obj/item/computer_hardware/network_card/advanced/satlink(src)
	cell = new suitable_cell(src)

/obj/item/modular_computer/tablet/nanogate/Initialize()
	. = ..()
	enable_computer()

/obj/item/modular_computer/tablet/nanogate/proc/login_email()
	var/datum/computer_file/program/email_client/P = getProgramByType(/datum/computer_file/program/email_client)
	var/mob/living/carbon/human/user = linked_nanogate.owner
	if(P && user.mind)
		P.stored_login = user.mind.initial_email_login["login"]
		P.stored_password = user.mind.initial_email_login["password"]
		P.update_email()


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
