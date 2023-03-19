/obj/item/organ/internal/kidney
	name = "kidney"
	icon_state = "kidney_left"
	organ_efficiency = list(OP_KIDNEYS = 50)
	parent_organ_base = BP_GROIN
	specific_organ_size = 1
	blood_req = 1.5
	max_blood_storage = 7.5
	oxygen_req = 2.5
	nutriment_req = 2
	price_tag = 500
	w_class =  ITEM_SIZE_TINY

/obj/item/organ/internal/kidney/left
/obj/item/organ/internal/kidney/right
	icon_state = "kidney_right"

/obj/item/organ/internal/kidney/left/plant
	name = "kidney bean"
	desc = "A green mushy bean that produces plant liquids"
	icon_state = "kidney_left_plant"

/obj/item/organ/internal/kidney/right/plant
	name = "kidney bean"
	desc = "A green mushy bean that produces plant liquids"
	icon_state = "kidney_right_plant"

/obj/item/organ/internal/kidney/left/cindarite
	name = "cindarite kidney"
	icon_state = "kidney_left_cindar"
	desc = "A dense set of tightly packed kidneys that work four times better than a standard kidney.\
	Likely worth more on the black market."
	price_tag = 1000
	organ_efficiency = list(OP_KIDNEYS = 200)

/obj/item/organ/internal/kidney/right/cindarite
	icon_state = "kidney_right_cindar"
	desc = "A dense set of tightly packed kidneys that work twice as better than a standard kidney.\
	Likely worth more on the black market."
	price_tag = 1000 //The right kidney should be worth as much as the left one.
	organ_efficiency = list(OP_KIDNEYS = 200)

/obj/item/organ/internal/kidney/prosthetic
	name = "prosthetic kidneys"
	desc = "Prosthetic kindeys, doesn't work as well as the real deal."
	icon_state = "kidneys-prosthetic"
	price_tag = 100
	nature = MODIFICATION_SILICON
	matter = list(MATERIAL_STEEL = 1)
	organ_efficiency = list(OP_KIDNEYS = 50)

/obj/item/organ/internal/kidney/prosthetic/left
/obj/item/organ/internal/kidney/prosthetic/right
	icon_state = "kidneys-prosthetic2"

/obj/item/organ/internal/kidney/left/exalt
	name = "Exalt kidney"
	icon_state = "kidney_left"
	desc = "A dense set of Artisinal kidneys. Works twice as well as a common peasant's kidney.\
	Likely worth more on the black market."
	price_tag = 700
	organ_efficiency = list(OP_KIDNEYS = 150)

/obj/item/organ/internal/kidney/right/exalt
	name = "Exalt kidney"
	icon_state = "kidney_right"
	desc = "A dense set of Artisinal kidneys. Works twice as well as a common peasant's kidney.\
	Likely worth more on the black market."
	price_tag = 700
	organ_efficiency = list(OP_KIDNEYS = 150)