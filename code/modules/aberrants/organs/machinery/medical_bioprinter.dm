// Bioprinter for organ printing
/obj/machinery/autolathe/bioprinter/med
	name = "Medical Bioprinter"
	desc = "NeoTheology machine for printing things using biomass. Configured for medical use."
	icon_state = "bioprinter_med"
	//circuit = /obj/item/electronics/circuitboard/autolathe/bioprinter/med
	build_type = ORGAN_GROWER		// Should not be able to use church disks
	default_disk = /obj/item/computer_hardware/hard_drive/portable/design/omg/diy_organs
	stored_material = list(MATERIAL_BIOMATTER = 480)

/obj/machinery/autolathe/bioprinter/RefreshParts()
	..()
	speed = initial(speed) + 4 + 2
	mat_efficiency = 1

/obj/machinery/autolathe/bioprinter/med/eject(material, amount)
	var/material/M = get_material_by_name(material)
	if(M.stack_type == /obj/item/stack/material/biomatter)
		speak("<span style='color:red'>Biomatter cannot be removed from this machine.</span>")
		return
	..()
