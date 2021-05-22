/obj/item/organ/internal/heart
	name = "heart"
	desc = "A small heart, sadly no gold..."
	icon_state = "heart-on"
	organ_efficiency = list(OP_HEART = 100)
	parent_organ_base = BP_CHEST
	dead_icon = "heart-off"
	price_tag = 3000
	specific_organ_size = 2
	oxygen_req = 10
	nutriment_req = 10
	var/open
	w_class = ITEM_SIZE_SMALL

/obj/item/organ/internal/heart/open
	open = 1

/obj/item/organ/internal/heart/prosthetic
	name = "prosthetic heart"
	desc = "A metal heart, doesn't beat like a normal heart, but do the same job."
	icon_state = "heart-prosthetic"
	dead_icon = "heart-prosthetic"
	price_tag = 100
	nature = MODIFICATION_SILICON
	matter = list(MATERIAL_STEEL = 1)

/obj/item/organ/internal/heart/proc/is_working()
	if(!is_usable())
		return FALSE

	return owner && (owner.pulse > PULSE_NONE || BP_IS_ROBOTIC(src) || (owner.status_flags & FAKEDEATH)) //TODO: "owner &&" was added as a runtime fix, needs better fix.