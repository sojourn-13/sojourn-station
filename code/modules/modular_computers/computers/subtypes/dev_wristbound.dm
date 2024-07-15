/obj/item/modular_computer/wrist
	name = "wristbound computer"
	desc = "An old-school predecesor to common PDA, bulky and cumbersome. While nowhere near as popular as it's successor it still remains in use by scavengers and less fortunate men for it's durability and superior flashlight."
	icon = 'icons/obj/modular_wristbound.dmi'
	icon_state = "wristbound"
	icon_state_unpowered = "wristbound"
	w_class = ITEM_SIZE_SMALL
	screen_light_strength = 1.8 //A lot brighter than normal PDA
	screen_light_range = 2
	slot_flags = SLOT_GLOVES
	matter = list(MATERIAL_STEEL = 3, MATERIAL_GLASS = 2)
	hardware_flag = PROGRAM_PDA
	max_hardware_size = 1

	stores_pen = TRUE
	stored_pen = /obj/item/pen
	price_tag = 100
	suitable_cell = /obj/item/cell/small //We take small battery

	var/scanner_type = null
	var/tesla_link_type = /obj/item/computer_hardware/tesla_link
	var/hard_drive_type = /obj/item/computer_hardware/hard_drive/small
	var/processor_unit_type = /obj/item/computer_hardware/processor_unit/small
	var/network_card_type = /obj/item/computer_hardware/network_card
	var/gunshot_residue // fucking motherfuck.

/obj/item/modular_computer/wrist/Initialize()
	. = ..()
	enable_computer()

/obj/item/modular_computer/wrist/AltClick(var/mob/user)
	if(!CanPhysicallyInteract(user))
		return
	if(card_slot && istype(card_slot.stored_card))
		eject_id()
	else
		..()
