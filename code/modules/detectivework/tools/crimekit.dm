//crime scene kit
/obj/item/storage/briefcase/crimekit
	name = "crime scene kit"
	desc = "A stainless steel-plated carrycase for all your forensic needs. Feels heavy and has a hook on the back that allows for easy belt storage."
	icon = 'icons/obj/forensics.dmi'
	icon_state = "case"
	item_state = "case"
	storage_slots = 12 //Techinnally better then a harness but, much bigger so no stacking them in bags
	slot_flags = SLOT_BELT //This one is techinnally meant to be on a detective at all times
	price_tag = 50

/obj/item/storage/briefcase/crimekit/populate_contents()
	new /obj/item/storage/box/swabs(src)
	new /obj/item/storage/box/fingerprints(src)
	new /obj/item/reagent_containers/spray/luminol(src)
	new /obj/item/device/uv_light(src)
	new /obj/item/forensics/sample_kit(src)
	new /obj/item/forensics/sample_kit/powder(src)