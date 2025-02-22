/mob/living/carbon/superior/spider/hunter/shocker
	name = "shock rock spider"
	desc = "Furry and black, it makes you shudder to look at it. This one has yellowed metallic chitin that crackles with electricity."
	icon_state = "spark"
	icon_living = "spark"
	/// Percentage chance to shock targets apon melee
	var/shock_chance = 15 //arbitrary
	/// Minimum value for electric charge
	var/shock_minimum = 10
	/// Maximum value for electric charge
	var/shock_maximum = 20
	/// Tracker var for our cooldown, will be set to cooldown_increment + world.time apon successful shock
	var/cooldown = 0
	/// How much cooldown will be incremented
	var/cooldown_increment = 5
	inherent_mutations = list(MUTATION_SHOCK_LESS)

/mob/living/carbon/superior/spider/hunter/shocker/UnarmedAttack(var/atom/A, var/proximity)
	. = ..()

	if (cooldown <= world.time)
		if(isliving(A))
			var/mob/living/targetted_mob = A
			if(istype(targetted_mob) && prob(shock_chance))
				var/electrocution_amount = (rand(shock_minimum, shock_maximum))
				if (targetted_mob.weakened || targetted_mob.stunned) //to prevent stunlocks from heavy electrocutions
					if (electrocution_amount > 15)
						electrocution_amount = 15
				if(iscarbon(targetted_mob) || issilicon(targetted_mob)) // only carbons or silicons can be affected by electricity
					targetted_mob.electrocute_act(electrocution_amount, src)
				else
					targetted_mob.damage_through_armor(electrocution_amount, BURN)
				playsound(src, 'sound/voice/insect_battle_screeching.ogg', 30, 1, -3)
				visible_message(SPAN_DANGER("Bright yellow bolts of electricity jump from \the [src]'s chitin to \the [targetted_mob]!"))
				cooldown = (world.time + cooldown_increment)
