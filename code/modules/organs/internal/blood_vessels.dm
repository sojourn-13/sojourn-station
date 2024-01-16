/obj/item/organ/internal/blood_vessel
	name = "blood vessels"
	icon_state = "blood_vessel"
	organ_efficiency = list(OP_BLOOD_VESSEL= 100)
	price_tag = 100
	max_damage = IORGAN_SMALL_HEALTH
	min_bruised_damage = IORGAN_SMALL_BRUISE
	min_broken_damage = IORGAN_SMALL_BREAK
	max_damage = 8
	min_bruised_damage = 2
	min_broken_damage = 4
	specific_organ_size = 0.5
	max_blood_storage = 100
	oxygen_req = 2
	nutriment_req = 1
	w_class =  ITEM_SIZE_TINY

/obj/item/organ/internal/blood_vessel/prosthetic
	name = "plastic tubes"
	desc = "Some thin plastic tubes, can act as blood vesels."
	icon_state = "blood_vessel-prosthetic"
	price_tag = 100
	nature = MODIFICATION_SILICON
	matter = list(MATERIAL_STEEL = 1)
	organ_efficiency = list(OP_BLOOD_VESSEL = 100)

/obj/item/organ/internal/blood_vessel/extensive
	name = "extensive blood vessels"
	icon_state = "blood_vessel_extensive"
	price_tag = 150
	oxygen_req = 2
	organ_efficiency = list(OP_BLOOD_VESSEL = 150)
	specific_organ_size = 0.6


/obj/item/organ/internal/blood_vessel/extensive/exalt
	name = "Exalt blood vessels"
	desc = "Genetically Improved blood vessels for pumping only the most blue of blood."
