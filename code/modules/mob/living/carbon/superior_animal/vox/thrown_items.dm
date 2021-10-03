/obj/item/projectile/bullet/rock
	name = "sharp stone"
	damage_types = list(BRUTE = 16)
	agony = 12
	armor_penetration = 5
	step_delay = 0.75
	check_armour = ARMOR_MELEE
	can_ricochet = FALSE
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/spear
	name = "rock fragements"
	damage_types = list(BRUTE = 24) //Same as a .40
	agony = 15
	armor_penetration = 25
	step_delay = 0.75
	check_armour = ARMOR_MELEE
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE

/obj/item/projectile/bullet/spear/toxic
	name = "coated rock fragements"
	var/toxin_coated

/obj/item/projectile/bullet/spear/toxic/New()
	 toxin_coated = pick("amatoxin","pararein","toxin","fuel") //they get fuel form random containers

/obj/item/projectile/bullet/spear/toxic/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents)
			L.reagents.add_reagent(toxin_coated, 1) //Really really bad so low amouts
			to_chat(target, "<span class='info'>The tip of the spear was coated in something!</span>")
