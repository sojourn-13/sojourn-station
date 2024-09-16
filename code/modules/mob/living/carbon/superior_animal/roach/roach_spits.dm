/obj/item/projectile/roach_spit
	name = "Glowing bile"
	icon = 'icons/obj/hivemind.dmi'
	icon_state = "goo_proj"
	damage_types = list()
	irradiate = 20
	check_armour = ARMOR_BIO
	step_delay = 2

/obj/item/projectile/roach_spit/on_hit(atom/target)
	. = ..()
	if(isliving(target))
		if (!testing)
			var/mob/living/L = target
			var/damage = rand(3, 7)
			L.damage_through_armor(damage, TOX, attack_flag = ARMOR_BIO)

/obj/item/projectile/roach_spit/attack_mob(mob/living/target_mob, distance, miss_modifier=0)
	if (isroach(target_mob))
		return FALSE // so these pass through roaches
	..()

/obj/item/projectile/roach_spit/large
	name = "Glowing bile stream"
	icon = 'icons/obj/hivemind.dmi'
	icon_state = "goo_proj"
	damage_types = list()
	irradiate = 20
	check_armour = ARMOR_BIO
	step_delay = 2

/obj/item/projectile/roach_spit/large/on_hit(atom/target)
	. = ..()
	if(isliving(target))
		if(!testing)
			var/mob/living/L = target
			var/damage = rand(12, 20)
			L.damage_through_armor(damage, BURN, attack_flag = ARMOR_BIO)
			new /obj/effect/decal/cleanable/greenglow/bile(src.loc)

/obj/item/projectile/roach_spit/large/attack_mob(mob/living/target_mob, distance, miss_modifier=0)
	if(isroach(target_mob))
		return FALSE // so these pass through roaches
	..()
