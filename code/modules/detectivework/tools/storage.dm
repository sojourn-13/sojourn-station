/obj/item/storage/box/swabs
	name = "box of swab kits"
	desc = "Sterilized equipment within. Do not contaminate."
	icon = 'icons/obj/forensics.dmi'
	icon_state = "dnakit"
	illustration = null
	can_hold = list(/obj/item/forensics/swab)
	storage_slots = 14

/obj/item/storage/box/swabs/populate_contents()
	for(var/i in 1 to storage_slots) // Fill 'er up.
		new /obj/item/forensics/swab(src)

/obj/item/storage/box/evidence
	name = "evidence bag box"
	desc = "A box claiming to contain evidence bags."
	can_hold = list(/obj/item/evidencebag)

/obj/item/storage/box/evidence/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/evidencebag(src)

/obj/item/storage/box/fingerprints
	name = "box of fingerprint cards"
	desc = "Sterilized equipment within. Do not contaminate."
	icon = 'icons/obj/forensics.dmi'
	icon_state = "dnakit"
	illustration = null
	can_hold = list(/obj/item/sample/print)
	storage_slots = 14

/obj/item/storage/box/fingerprints/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/sample/print(src)