//Hivemind special objects stored here, like projectiles, wreckages or artifacts


//toxic shot, turret's ability use it
/obj/item/projectile/goo
	name = "electrolyzed goo"
	icon = 'icons/obj/hivemind.dmi'
	icon_state = "goo_proj"
	damage_types = list(BURN = 15) //Shot in large amounts and stacks a bit with its burn damage
	check_armour = ARMOR_ENERGY //Unlike Bio, it's not either 0% or 100%. Strong Energy armour isn't common, But most of armour has some protection against energy.
	step_delay = 2
	var/second_hit_damage = 10

/obj/item/projectile/goo/on_hit(atom/target)
	. = ..()
	if (!testing)
		if(isliving(target) && !issilicon(target) )
			var/mob/living/L = target
			L.damage_through_armor(second_hit_damage, BURN, attack_flag = ARMOR_RAD)
			if(!(locate(/obj/effect/decal/cleanable/spiderling_remains) in target.loc))
				var/obj/effect/decal/cleanable/spiderling_remains/goo = new /obj/effect/decal/cleanable/spiderling_remains(target.loc)
				goo.name = "[name]" //from "acrid goo" to "acidic goo", and from "acidic goo" to "electrolyzed goo"
				goo.desc = "An unknown, bubbling liquid. The fumes smell awful with a hint of ozone."

/obj/item/projectile/goo/fast
	name = "electrolyzed goop"
	step_delay = 0.5

/obj/item/projectile/goo/fire_starter
	name = "smoldering goo"
	fire_stacks = 1

/obj/item/projectile/goo/harder_second_hit
	name = "sticky goo"
	second_hit_damage = 15

/obj/item/projectile/goo/heavyer
	name = "thick electrolyzed goo"
	damage_types = list(BURN = 20)
	step_delay = 2.5
