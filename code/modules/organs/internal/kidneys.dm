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
	price_tag = 1500
	w_class =  ITEM_SIZE_TINY

/obj/item/organ/internal/kidney/left
/obj/item/organ/internal/kidney/right
	icon_state = "kidney_right"

/obj/item/organ/internal/kidney/left/cindarite
	name = "cindarite kidney"
	icon_state = "kidney_left_cindar"
	desc = "A dense set of tightly packed kidneys that work twice as better than a standard kidney."
	price_tag = 5000
	organ_efficiency = list(OP_KIDNEYS = 100)

/obj/item/organ/internal/kidney/right/cindarite
	icon_state = "kidney_right_cindar"

/obj/item/organ/internal/kidney/prosthetic
	name = "prosthetic kidneys"
	desc = "Prosthetic kindeys, doesn't work as well as the real deal.
	icon_state = "kidneys-prosthetic"
	price_tag = 100
	nature = MODIFICATION_SILICON
	matter = list(MATERIAL_STEEL = 1)
	organ_efficiency = list(OP_KIDNEYS = 50)

/obj/item/organ/internal/kidney/left
/obj/item/organ/internal/kidney/right
	icon_state = "kidneys-prosthetic2"
