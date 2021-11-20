/obj/item/organ/internal/nerve
	name = "nerve synapses"
	icon_state = "nerve"
	desc = "Looking at this makes you feel nervous."
	organ_efficiency = list(OP_NERVE = 100)
	price_tag = 100
	specific_organ_size = 0.5
	blood_req = 0.5
	max_blood_storage = 2.5
	nutriment_req = 0.5
	w_class =  ITEM_SIZE_TINY

/obj/item/organ/internal/nerve/robotic
	name = "nerve wire"
	icon_state = "wire"
	desc = "Used to carry the sensation of touch of robotic limbs."
	nature = MODIFICATION_SILICON
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1)

/obj/item/organ/internal/nerve/sensitive_nerve
	name = "sensitive nerves"
	icon_state = "nerve_sensitive"
	organ_efficiency = list(OP_NERVE = 150)
	specific_organ_size = 0.6