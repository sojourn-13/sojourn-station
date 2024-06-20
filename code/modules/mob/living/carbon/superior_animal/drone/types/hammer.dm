// Admin only for now, big hammer, lots of damage, tanky as fuck.
/mob/living/carbon/superior_animal/handmade/hammer
	name = "Custom-made Hammer Drone"
	desc = "Built from the Soteria robotics division's craftsmanship, and gathered designs of Greyson positronics, each of these fully robotic automatons is a unique, handmade, heavily armored assembly."
	icon = 'icons/mob/custom_bot.dmi'
	icon_state = "soteria_rockethammer_handmade"
	health = 800
	maxHealth = 800
	melee_damage_lower = 70
	melee_damage_upper = 80
	armor = list(melee = 17, bullet = 17, energy = 17, bomb = 50, bio = 100, rad = 100)
	exam_message = "This one appears to wield a stellar-grade engine shaped into a hammer."

/mob/living/carbon/superior_animal/handmade/hammer/UnarmedAttack()
	var/atom/targetted_mob = (target_mob?.resolve())

	if(!Adjacent(targetted_mob))
		return

	//special attacks
	if(prob(35))
		hammer_slam()
		return

	return ..() //default attack

/mob/living/carbon/superior_animal/handmade/hammer/proc/hammer_slam()
	src.visible_message(SPAN_DANGER("[src] slam its hammer on the ground!"))
	for(var/atom/target in range(1, src))
		if(target != src)
			target.attack_generic(src, rand(melee_damage_lower, melee_damage_upper))

/mob/living/carbon/superior_animal/handmade/hammer/death()
	new /obj/item/tool/hammer/charge(src.loc)
	..()
