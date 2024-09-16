// Slime limbs.
/obj/item/organ/external/slime
	nature = MODIFICATION_SLIME
	min_broken_damage = 60 //because of how we work, we need more health to not just explode the moment we get hurt.
	nonsolid = 1
	nerve_struck = -1

/obj/item/organ/external/slime/make_base_internal_organs()
	if(is_stump(src))
		return
	make_bones() // We only need the "bones"

/obj/item/organ/external/slime/update_limb_efficiency()
	var/raw_efficiency = 300
	limb_efficiency = round(((raw_efficiency/(240+((2*raw_efficiency)/10))) * 100)) //Diminishing returns as total limb efficiency increases.

/obj/item/organ/external/slime/droplimb(var/clean, var/disintegrate = DISMEMBER_METHOD_EDGE, var/ignore_children = null)
	disintegrate = DISMEMBER_METHOD_BLUNT
	..()
