/obj/item/organ/internal/lungs
	name = "lungs"
	icon_state = "lungs"
	gender = PLURAL
	organ_efficiency = list(OP_LUNGS = 100)
	parent_organ_base = BP_CHEST
	specific_organ_size = 2
	price_tag = 1500
	blood_req = 10
	max_blood_storage = 50
	nutriment_req = 10
	var/breath_modulo = 2
	w_class = ITEM_SIZE_SMALL

/obj/item/organ/internal/lungs/long
	name = "long lungs"
	icon_state = "long_lungs"
	organ_efficiency = list(OP_LUNGS = 133)
	specific_organ_size = 3
	breath_modulo = 8

/obj/item/organ/internal/lungs/prosthetic
	name = "prosthetic lungs"
	icon_state = "lungs-prosthetic"
	price_tag = 100
	nature = MODIFICATION_SILICON
	matter = list(MATERIAL_STEEL = 1)
