/obj/item/remains
	name = "remains"
	gender = PLURAL
	icon = 'icons/effects/blood.dmi'
	icon_state = "remains"
	anchored = 0
	sanity_damage = 0.5

/obj/item/remains/human
	desc = "They look like human remains. Some poor soul expired here, a million miles from home."
	sanity_damage = 2.5

/obj/item/remains/xeno
	desc = "They look like the remains of something... alien. They have a strange aura about them."
	icon_state = "remainsxeno"

/obj/item/remains/deer
	desc = "They look like the remains of a large herbivore, picked clean."
	icon_state = "remainsdeer"

/obj/item/remains/mummy1
	name = "mummified remains"
	desc = "They look like humanoid remains. They've been here a long time."
	icon_state = "mummified1"

/obj/item/remains/mummy2
	name = "mummified remains"
	desc = "They look like humanoid remains. They've been here a long time."
	icon_state = "mummified2"

/obj/item/remains/posi
	desc = "They look like the remains of something cybernetic."
	icon_state = "remainsposi"

/obj/item/remains/ribcage
	desc = "They look like animal remains of some sort. Hopefully."
	icon_state = "remainsribcage"

/obj/item/remains/unathi
	desc = "They look like the remains of some sort of tough creature."
	icon_state = "remainsunathi"

/obj/item/remains/tajaran
	desc = "They look like the remains of some sort of feline creature."
	icon_state = "remainstajaran"

/obj/item/remains/robot
	desc = "They look like the remains of something mechanical. They have a strange aura about them."
	icon = 'icons/mob/robots.dmi'
	icon_state = "remainsrobot"

/obj/item/remains/mouse
	desc = "Looks like the remains of a small rodent. It doesn't squeak anymore."
	icon = 'icons/mob/mobs-mouse.dmi'
	icon_state = "skeleton"
	sanity_damage = 0

/obj/item/remains/lizard
	desc = "They look like the remains of a small reptile."
	icon_state = "lizard"

/obj/item/remains/attack_hand(mob/user as mob)
	to_chat(user, SPAN_NOTICE("[src] sinks together into a pile of ash."))
	var/turf/simulated/floor/F = get_turf(src)
	if (istype(F))
		new /obj/effect/decal/cleanable/ash(F)
	qdel(src)

/obj/item/remains/robot/attack_hand(mob/user as mob)
	return
