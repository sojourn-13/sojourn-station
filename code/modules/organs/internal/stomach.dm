/obj/item/organ/internal/stomach
	name = "stomach"
	icon_state = "stomach"
	organ_efficiency = list(OP_STOMACH = 100)
	parent_organ_base = BP_CHEST
	price_tag = 700
	blood_req = 5
	max_blood_storage = 25
	oxygen_req = 5
	w_class = ITEM_SIZE_SMALL

/obj/item/organ/internal/stomach/prosthetic
	name = "prosthetic stomach"
	//icon_state = "stomach-prosthetic" // No prosthetic stomach sprites.
	price_tag = 100
	nature = MODIFICATION_SILICON
	matter = list(MATERIAL_STEEL = 1)
	organ_efficiency = list(OP_STOMACH = 100)
