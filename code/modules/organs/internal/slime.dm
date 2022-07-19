/obj/item/organ/internal/bone/slime
	name = "slime bone"
	desc = "The slime equivalent of a 'bone', this cartilaginous slime act as both bone, nerve & muscle all in one."
	icon_state = "blood_vessel-prosthetic"
	organ_efficiency = list(OP_BONE = 100, OP_MUSCLE = 100, OP_NERVE = 100)
	price_tag = 100
	force = WEAPON_FORCE_NORMAL

/obj/item/organ/internal/bone/slime/removed_mob()
	..()
	visible_message(SPAN_NOTICE("[src] lose cohesion and become a puddle of goo!"))
	qdel(src)

/obj/item/organ/internal/heart/slime
	name = "slime vascular system"
	desc = "A complex, organic knot of pulsating jelly and crystalline particles."
	icon = 'icons/mob/slimes.dmi'
	icon_state = "bluespace slime extract"
	dead_icon = "bluespace slime extract"

/obj/item/organ/internal/heart/slime/removed_mob()
	..()
	visible_message(SPAN_NOTICE("[src] lose cohesion and become a puddle of goo!"))
	qdel(src)

/obj/item/organ/internal/eyes/slime
	name = "slime photoreceptors"
	desc = "A pulsating complex of jelly-like orbs."

/obj/item/organ/internal/eyes/slime/removed_mob()
	..()
	visible_message(SPAN_NOTICE("[src] lose cohesion and become a puddle of goo!"))
	qdel(src)

/obj/item/organ/internal/stomach/slime
	name = "slime digestive sack"
	desc = "a pulsating sack that contains especially heavy acids and sand."

/obj/item/organ/internal/stomach/slime/removed_mob()
	..()
	visible_message(SPAN_NOTICE("[src] lose cohesion and become a puddle of goo!"))
	qdel(src)

