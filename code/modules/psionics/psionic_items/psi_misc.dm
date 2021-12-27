//////////////////////////////
//			Psionic Misc.
//////////////////////////////
// These are psion related items that are often singular and don't really have the scope for their own page. -Kaz
/obj/item/psi_injector
	name = "cerebrix inhaler"
	desc = "A modified inhaler which delivers over-saturated cerebrix diluted in water before being aerosolized. Unlike a direct injection or drinking, this method prevents overdosing or nasty side \
	side effects at the cost of spending more cerebrix for what it returns in essence. Useful for psions to allow them to directly and easily regain essence a limited number of times."
	icon = 'icons/obj/syringe.dmi'
	icon_state = "psi_inhaler"
	force = WEAPON_FORCE_HARMLESS
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1)
	var/use = 4 // Number of times it can be used.
	var/point_per_use = 1 // Amount of points it give to a psion each use.

/obj/item/psi_injector/update_icon()
	if(use <= 0)
		icon_state = "psi_inhaler_used"


/obj/item/psi_injector/examine(mob/user)
	..()
	to_chat(user, "It has [use] uses left.")
	to_chat(user, "It can give [point_per_use] essence per use to a psion.")

/obj/item/psi_injector/attack(atom/target, mob/user)
	update_icon()
	if(ishuman(target)) // Check if it's an actual mob and not a wall
		var/mob/living/carbon/human/T = target
		var/obj/item/organ/internal/psionic_tumor/PT = T.random_organ_by_process(BP_PSION)
		if(PT) // Is the target a psion
			if(PT.max_psi_points - PT.psi_points >= point_per_use) // Is there space to give the psion the points?
				if(use) // Do we have uses left?
					user.visible_message("[user] injects [target] with the [src].", "You inject [target] with the [src]!")
					PT.psi_points += point_per_use
					use--
					update_icon()
					return
				else
					to_chat(user, "The [src.name] has no doses left.")
					update_icon()
					return
			else
				to_chat(user, "[T.name] already has the maximum amount of essence \his body can hold.")
				update_icon()
				return
		else
			to_chat(user, "You can't inject this into a non-psion.")
			return
	..()

/datum/design/research/item/clothing/tinfoil
	name = "Blue-Ink Psionic Shielding Apparatus"
	desc = "The product of an eccentric scientist who was fed up with telepathic cat-calls. This device shields the wearer from recieving \
	telepathic messages, but also prevents psions from using their abilities altogether when worn. The perfect Psionic Containment device. \
	Despite the advanced technology involved, it looks a little like a tin-foil hat."
	build_path = /obj/item/clothing/head/psionic/tinfoil

/obj/item/clothing/head/psionic/tinfoil
	name = "Blue-Ink Psionic Shielding Apparatus"
	icon_state = "tinfoil"
	desc = "The product of an eccentric scientist who was fed up with telepathic cat-calls. This device shields the wearer from recieving \
	telepathic messages, but also prevents psions from using their abilities altogether when worn. The perfect Psionic Containment device. \
	Despite the advanced technology involved, it looks a little like a tin-foil hat."
	origin_tech = list(TECH_MAGNET = 6)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_SILVER = 0.5)
	psi_blocking = 10
	price_tag = 150

