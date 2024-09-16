/obj/item/organ/internal/vital/lungs
	name = "lungs"
	icon_state = "lungs"
	desc = "This organ is breathtaking."
	gender = PLURAL
	organ_efficiency = list(OP_LUNGS = 100)
	parent_organ_base = BP_CHEST
	specific_organ_size = 2
	price_tag = 700
	blood_req = 10
	max_blood_storage = 50
	nutriment_req = 10
	var/breath_modulo = 2
	w_class = ITEM_SIZE_SMALL

/obj/item/organ/internal/vital/lungs/long
	name = "long lungs"
	icon_state = "long_lungs"
	organ_efficiency = list(OP_LUNGS = 150)
	specific_organ_size = 2.3
	breath_modulo = 8

/obj/item/organ/internal/vital/lungs/prosthetic
	name = "prosthetic lungs"
	desc = "Lungs made out of metal. Still work just as well as normal lungs."
	icon_state = "lungs-prosthetic"
	price_tag = 1000
	price_tag = 100
	nature = MODIFICATION_SILICON
	matter = list(MATERIAL_STEEL = 1)

/obj/item/organ/internal/vital/lungs/plant
	name = "air sacs"
	desc = "Lungs made for a plantoid species, works just as well as a normal set."
	icon_state = "lungs_plant"

/obj/item/organ/internal/vital/lungs/long/exalt
	name = "exalt lungs"
	desc = "Augmented lungs for filtering out poor air, and the air of the poors.\
	Likely worth more on the black market."
	price_tag = 2250