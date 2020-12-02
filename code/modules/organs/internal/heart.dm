/obj/item/organ/internal/heart
	name = "heart"
	icon_state = "heart-on"
	organ_efficiency = list(OP_HEART = 100)
	parent_organ_base = BP_CHEST
	dead_icon = "heart-off"
	price_tag = 3000
	specific_organ_size = 2
	var/open

/obj/item/organ/internal/heart/open
	open = 1

/obj/item/organ/internal/heart/prosthetic
	name = "prosthetic heart"
	icon_state = "heart-prosthetic"
	dead_icon = "heart-prosthetic"
	price_tag = 100

/obj/item/organ/internal/heart/proc/is_working()
	if(!is_usable())
		return FALSE

	return owner && (owner.pulse > PULSE_NONE || BP_IS_ROBOTIC(src) || (owner.status_flags & FAKEDEATH)) //TODO: "owner &&" was added as a runtime fix, needs better fix.