// Slime limbs.
/obj/item/organ/external/slime
	dislocated = -1
	brute_mod = 1.15
	burn_mod = 1.15

/obj/item/organ/external/slime/droplimb(var/clean, var/disintegrate = DROPLIMB_EDGE, var/ignore_children = null)
	disintegrate = DROPLIMB_BLUNT
	..()
