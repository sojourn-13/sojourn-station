/obj/machinery/autolathe/bioprinter
	name = "church bioprinter"
	desc = "A strange looking machine for printing things using biomass."
	icon_state = "bioprinter"
	unsuitable_materials = list()
	build_type = AUTOLATHE | BIOPRINTER
	storage_capacity = 480
	speed = 5
	have_recycling = TRUE
	queue_max = 16 //Might be 8 in game do to wires

/obj/machinery/autolathe/bioprinter/attackby(obj/item/I, mob/user)
	//hacky way to forbid deconstruction but use ..()
	var/tool_type = I.get_tool_type(user, list(QUALITY_SCREW_DRIVING), src)
	if(tool_type == QUALITY_SCREW_DRIVING)
		return

	//it needs to have panel open, but just in case
	if(istype(I, /obj/item/storage/part_replacer))
		return

	..(I, user)

/obj/machinery/autolathe/bioprinter/RefreshParts()
	..()
	speed = initial(speed) + 4 + 2
	mat_efficiency = max(0.2, 1.0 - (4 * 0.1))

/obj/machinery/autolathe/bioprinter/disk
	default_disk = /obj/item/computer_hardware/hard_drive/portable/design/nt_bioprinter

/obj/machinery/autolathe/bioprinter/public
	default_disk = /obj/item/computer_hardware/hard_drive/portable/design/nt_bioprinter/public

// Bioprinter for organ printing
/obj/machinery/autolathe/bioprinter/med
	name = "Medical Bioprinter"
	desc = "NeoTheology machine for printing things using biomass. Configured for medical use."
	icon_state = "bioprinter_med"
	//circuit = /obj/item/electronics/circuitboard/autolathe/bioprinter/med
	build_type = AUTOLATHE | ORGAN_GROWER		// Should not be able to use NT disks
	default_disk = /obj/item/computer_hardware/hard_drive/portable/design/medical
	stored_material = list(
		MATERIAL_BIOMATTER = 360,
		MATERIAL_STEEL = 60,
		MATERIAL_PLASTIC = 60,
		MATERIAL_GLASS = 60
		)

/obj/machinery/autolathe/bioprinter/med/eject(material, amount)
	var/material/M = get_material_by_name(material)
	if(M.stack_type == /obj/item/stack/material/biomatter)
		speak("<span style='color:red'>Biomatter cannot be removed from this machine.</span>")
		return
	..()
