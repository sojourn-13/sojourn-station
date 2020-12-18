/obj/item/organ/internal/kidney
	name = "kidney"
	icon_state = "kidney_left"
	organ_efficiency = list(OP_KIDNEYS = 50)
	parent_organ_base = BP_GROIN
	specific_organ_size = 1
	price_tag = 1500

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