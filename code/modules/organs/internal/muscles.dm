/obj/item/organ/internal/muscle
	name = "muscle"
	icon_state = "human_muscle"
	desc = "Rip and tear"
	organ_efficiency = list(OP_MUSCLE = 100)
	price_tag = 100
	max_damage = IORGAN_SMALL_HEALTH
	min_bruised_damage = IORGAN_SMALL_BRUISE
	min_broken_damage = IORGAN_SMALL_BREAK
	specific_organ_size = 1
	blood_req = 0.5
	max_blood_storage = 2.5
	nutriment_req = 0.5
	w_class = ITEM_SIZE_SMALL

/obj/item/organ/internal/muscle/robotic
	name = "hydraulic muscles"
	desc = "Hydraulic systems that act as muscles. Doesn't outperform their organic counterpart though."
	icon_state = "robotic_muscle"
	desc = "Expand and contract"
	nature = MODIFICATION_SILICON
	organ_efficiency = list(OP_MUSCLE = 100)
	specific_organ_size = 1
	matter = list(MATERIAL_STEEL = 1)

/obj/item/organ/internal/muscle/super_muscle
	name = "super muscle"
	desc = "A wierd flex, but more than okay. This muscle has been genetically altered to be stronger than normal."
	icon_state = "human_muscle_super"
	price_tag = 150
	organ_efficiency = list(OP_MUSCLE = 150)
	specific_organ_size = 1.2

/obj/item/organ/internal/muscle/super_muscle/exalt
	name = "exalt muscle"
	desc = "Used for carrying this colony. This muscle makes an Exalt stronger than normal.\
	Likely worth more on the black market."
