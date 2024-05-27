/mob/living/carbon/superior_animal/roach/elektromagnetisch
	name = "Elektromagnetisch Roach"
	desc = "A monstrous, dog-sized cockroach. This blue glowing one looks like its plusing with energy."
	icon_state = "elektromagnetisch"
	meat_amount = 2
	turns_per_move = 2
	maxHealth = 75 * ROACH_HEALTH_MOD
	health = 75 * ROACH_HEALTH_MOD
	move_to_delay = 7
	deathmessage = "pulses violently as it dies!"
	melee_damage_lower = 12
	melee_damage_upper = 15 //Rare
	armor_divisor = 4

	mob_size = MOB_MEDIUM
	meat_type = /obj/item/reagent_containers/food/snacks/meat/roachmeat/elektromagnetisch
	knockdown_odds = 1 //its affect shouldnt be stunlocks like this
	inherent_mutations = list(MUTATION_EMP, MUTATION_DEAF, MUTATION_TOURETTES, MUTATION_EPILEPSY, MUTATION_ROACH_BLOOD)

/mob/living/carbon/superior_animal/roach/elektromagnetisch/UnarmedAttack(atom/A, proximity)
	. = ..()
	if(prob(5))
		empulse(loc, 0, 3)
		playsound(loc, list('sound/weapons/guns/unknown_spacegun_burn.ogg', 'sound/weapons/guns/unknown_spacegun_melt.ogg', 'sound/weapons/guns/unknown_spacegun_incinerate.ogg', 'sound/weapons/guns/unknown_spacegun_vaporize.ogg'), 50, 1)

/mob/living/carbon/superior_animal/roach/elektromagnetisch/death(gibbed,message = deathmessage)
	if (stat != DEAD)
		target_mob = null
		stance = initial(stance)
		stop_automated_movement = initial(stop_automated_movement)
		SSmove_manager.stop_looping(src)
		playsound(loc, list('sound/weapons/guns/unknown_spacegun_burn.ogg', 'sound/weapons/guns/unknown_spacegun_melt.ogg', 'sound/weapons/guns/unknown_spacegun_incinerate.ogg', 'sound/weapons/guns/unknown_spacegun_vaporize.ogg'))
		empulse(loc, 3,3) //Death mixes it making it even worst

		density = 0
		layer = LYING_MOB_LAYER

	. = ..()
