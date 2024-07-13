/mob/living/carbon/superior_animal/human/eventwolf
	name = "Void Wolf Juggernaut"
	desc = "A Void Wolf mercenary, heavily armoured with a large power-hammer."
	melee_damage_lower = 60
	melee_damage_upper = 70
	icon_state = "voidwolfmarauder"
	icon_dead = "voidwolfmarauder_dead"
	health = 450
	maxHealth = 450
	ranged = FALSE

	armor = list(melee = 7, bullet = 17, energy = 7, bomb = 35, bio = 100, rad = 50)
	faction = "pirate"
	icon = 'icons/mob/mobs-humanoid.dmi'

	get_stat_modifier = FALSE
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure

/mob/living/carbon/superior_animal/human/eventwolf/handle_breath(datum/gas_mixture/breath) //we have are own air supplies
	return

/mob/living/carbon/superior_animal/human/eventwolf/handle_environment(var/datum/gas_mixture/environment) //are armor legit is a void suit
	return

/mob/living/carbon/superior_animal/human/eventwolf/start_pulling(var/atom/movable/AM)
	to_chat(src, SPAN_WARNING("Your hand gets pushed away from \the [src]. !"))
	return



/mob/living/carbon/superior_animal/human/eventwolf/explosive
	name = "Void Wolf Bomber"
	desc = "A Void Wolf with an explosive rig around it's chest..."
	icon_state = "voidwolfsuicider"
	health = 100
	maxHealth = 100
	move_to_delay = 3
	stop_automated_movement_when_pulled = 0
	melee_damage_lower = 10
	melee_damage_upper = 10
	armor = list(melee = 2, bullet = 2, energy = 2, bomb = 0, bio = 100, rad = 50)


/mob/living/carbon/superior_animal/human/voidwolf/eventwolf/explosive/UnarmedAttack()
	. = ..()
	if(.) // If we succeeded in hitting.
		visible_message(SPAN_DANGER("\The [src] charges in and detonates!"))
		explosion(get_turf(loc), 0, 0, 2, 3)
		death()
