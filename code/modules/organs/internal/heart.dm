/obj/item/organ/internal/vital/heart
	name = "heart"
	desc = "A small heart, sadly no gold..."
	icon_state = "heart-on"
	organ_efficiency = list(OP_HEART = 100)
	parent_organ_base = BP_CHEST
	dead_icon = "heart-off"
	price_tag = 1200
	specific_organ_size = 2
	max_damage = IORGAN_VITAL_HEALTH
	min_bruised_damage = IORGAN_VITAL_BRUISE
	min_broken_damage = IORGAN_VITAL_BREAK
	oxygen_req = 10
	nutriment_req = 10
	var/open
	w_class = ITEM_SIZE_SMALL

/obj/item/organ/internal/vital/heart/open
	open = 1

/obj/item/organ/internal/vital/heart/prosthetic
	name = "prosthetic heart"
	desc = "A metal heart, doesn't beat like a normal heart, but does the same job."
	icon_state = "heart-prosthetic"
	dead_icon = "heart-prosthetic"
	price_tag = 100
	nature = MODIFICATION_SILICON
	matter = list(MATERIAL_STEEL = 1)

/obj/item/organ/internal/vital/heart/proc/is_working()
	if(!is_usable())
		return FALSE

	return owner && (owner.pulse > PULSE_NONE || BP_IS_ROBOTIC(src) || (owner.status_flags & FAKEDEATH)) //TODO: "owner &&" was added as a runtime fix, needs better fix.

/obj/item/organ/internal/vital/heart/plant
	name = "centralized capillary"
	desc = "The centralized heart of a plantoid, functioning as little more than a capillary."
	icon_state = "heart_plant-on"

/obj/item/organ/internal/vital/heart/huge
	name = "six-chambered heart"
	desc = "A complex heart, good enough to hold two (metaphorical) wolves."
	icon_state = "heart_huge"
	organ_efficiency = list(OP_HEART = 150)
	specific_organ_size = 2.3
	price_tag = 1500
	max_blood_storage = 100
	nutriment_req = 15
	dead_icon = "heart_huge"

/obj/item/organ/internal/vital/heart/huge/baboon
	name = "mega-baboon heart"
	desc = "Beats to the drums of the jungle."

/obj/item/organ/internal/vital/heart/huge/exalt
	name = "Exalt heart"
	desc = "A genetically enhanced heart, pumping with the spirit of capitalism.\
	Likely worth more on the black market."