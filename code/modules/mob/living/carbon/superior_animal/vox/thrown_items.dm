/obj/item/projectile/bullet/rock
	name = "sharp stone"
	damage_types = list(BRUTE = 16)
	agony = 12
	armor_divisor = 1
	step_delay = 1.15
	check_armour = ARMOR_MELEE
	can_ricochet = FALSE
	embed = FALSE
	sharp = FALSE
	affective_damage_range = 1
	affective_ap_range = 1

/obj/item/projectile/bullet/spear
	name = "rock fragements"
	damage_types = list(BRUTE = 24) //Same as a .40
	agony = 15
	armor_divisor = 1.25 //primitive.
	step_delay = 1
	check_armour = ARMOR_MELEE
	can_ricochet = FALSE
	embed = FALSE
	sharp = FALSE
	affective_damage_range = 2
	affective_ap_range = 2

/obj/item/projectile/bullet/spear/toxic
	name = "coated rock fragements"
	var/toxin_coated

/obj/item/projectile/bullet/spear/toxic/New()
	 toxin_coated = pick("amatoxin","pararein","toxin","fuel") //they get fuel form random containers

	 return ..()

/obj/item/projectile/bullet/spear/toxic/on_hit(atom/target, def_zone = null)
	if (!testing)
		if(isliving(target))
			var/mob/living/L = target
			if(istype(L) && L.reagents)
				L.reagents.add_reagent(toxin_coated, 1) //Really really bad so low amouts
				to_chat(target, "<span class='info'>The tip of the spear was coated in something!</span>")
