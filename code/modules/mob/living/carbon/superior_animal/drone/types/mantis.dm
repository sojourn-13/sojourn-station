// Less HP, less damage, but faster and can attack in an AoE and pin down mobs.
/mob/living/carbon/superior_animal/handmade/mantis
	name = "Custom-made Mantis Drone"
	desc = "Built from the Soteria robotics division's craftsmanship, and gathered designs of Greyson positronics, each of these fully robotic automatons is a unique, handmade, heavily armored assembly."
	icon = 'icons/mob/custom_bot.dmi'
	icon_state = "soteria_mantis_handmade"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	health = 450
	maxHealth = 450
	melee_damage_lower = 30
	melee_damage_upper = 40
	move_to_delay = 2
	exam_message = "This one bears mantis blades to pin down it's target."
	var/already_slashed = FALSE // So that we don't do the round slash twice in a row.

/mob/living/carbon/superior_animal/handmade/mantis/UnarmedAttack()
	if(!Adjacent(target_mob))
		return

	if(!(already_slashed)) // So that we don't do two splash slash in a row

		// Special attacks
		if(prob(15)) // Luck or enough targets
			splash_slash()
			already_slashed = TRUE
			return

		if(prob(30))
			stun_with_claw()
			already_slashed = TRUE
			return

	already_slashed = FALSE
	return ..() //default attack

/mob/living/carbon/superior_animal/handmade/mantis/proc/splash_slash()
	src.visible_message(SPAN_DANGER("[src] spins around and slashes in a circle!"))
	for(var/atom/target in range(1, src))
		if((target != src) && !(target in friends) && (isValidAttackTarget(target))) // Check if the target is valid and not the mantis or a friend
			UnarmedAttack(target, 1)

/mob/living/carbon/superior_animal/handmade/mantis/proc/stun_with_claw()
	if(isliving(target_mob))
		var/mob/living/victim = target_mob
		victim.Weaken(5) //decent-length stun
		src.visible_message(SPAN_WARNING("[src] pins [victim] to the floor with its blades!"))
