/obj/item/organ/internal/nerve
	name = "nerve synapses"
	icon_state = "nerve"
	desc = "Looking at this makes you feel nervous."
	organ_efficiency = list(OP_NERVE = 100)
	price_tag = 100
	max_damage = IORGAN_TINY_HEALTH
	min_bruised_damage = IORGAN_TINY_BRUISE
	min_broken_damage = IORGAN_TINY_BREAK
	specific_organ_size = 1
	blood_req = 0.5
	max_blood_storage = 2.5
	nutriment_req = 0.5
	w_class =  ITEM_SIZE_TINY

//Handle surgical insertion of a nerve modifying the NSA
/obj/item/organ/internal/nerve/replaced_mob(mob/living/carbon/human/target)
	..(target)
	if(owner && owner.metabolism_effects)
		owner.metabolism_effects.calculate_nsa(TRUE)

//Handle surgical removal of a nerve modifying the NSA. Great way to tank your NSA into the shitter.
/obj/item/organ/internal/nerve/removed_mob(mob/living/user)
	owner.metabolism_effects.calculate_nsa(TRUE)
	..(user)


//Handle NSA changing due to organ damage
/obj/item/organ/internal/nerve/take_damage(amount, silent, sharp = FALSE, edge = FALSE)
	..(amount, silent)
	owner.metabolism_effects.calculate_nsa(TRUE)

//Handle NSA changing due to organs healing
/obj/item/organ/internal/nerve/heal_damage(amount, natural = TRUE)
	..(amount, natural)
	owner.metabolism_effects.calculate_nsa(TRUE)

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
	specific_organ_size = 1.1

/obj/item/organ/internal/nerve/sensitive_nerve/exalt
	name = "exalt nerve synapses"
	desc = "Extra sensitive to poorness. This exalted organ is bigger and more complex than standard nerves.\
	Likely worth more on the black market."
	organ_efficiency = list(OP_NERVE = 105)
	price_tag = 125

/obj/item/organ/internal/nerve/sensitive_nerve/exalt_leg
	name = "exalt nerve synapses (legs)"
	desc = "Tooled for quick movement and extra sensitive to poorness. This exalted organ is bigger and more complex than standard nerves.\
	Likely worth more on the black market."
	price_tag = 500
