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

//Handle surgical insertion of a nerve modifying the NSA
/obj/item/organ/internal/nerve/replaced_mob(mob/living/carbon/human/target)
	..(target)
	target.calculate_nsa_bonus(TRUE)

//Handle surgical removal of a nerve modifying the NSA. Great way to tank your NSA into the shitter.
/obj/item/organ/internal/nerve/removed_mob(mob/living/user)
	..(user)
	user.calculate_nsa_bonus(TRUE)


/obj/item/organ/internal/nerve/take_damage(amount, silent)
	..(amount, silent)
	user.calculate_nsa_bonus(TRUE)

/obj/item/organ/internal/nerve/heal_damage(amount, natural = TRUE)
	..(amount, natural)
	user.calculate_nsa_bonus(TRUE)

/obj/item/organ/internal/nerve/robotic
	name = "nerve wire"
	icon_state = "wire"
	desc = "Used to carry the sensation of touch of robotic limbs."
	nature = MODIFICATION_SILICON
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1)

/obj/item/organ/internal/nerve/sensitive_nerve
	name = "sensitive nerve synapses"
	desc = "This organ is the touchy-feely sort. It seems a little bigger more complex than standard nerves."
	price_tag = 150
	icon_state = "nerve_sensitive"
	organ_efficiency = list(OP_NERVE = 150)
	specific_organ_size = 0.6

/obj/item/organ/internal/nerve/sensitive_nerve/exalt
	name = "exalt nerve synapses"
	desc = "Extra sensitive to poorness. This exalted organ is bigger and more complex than standard nerves.\
	Likely worth more on the black market."