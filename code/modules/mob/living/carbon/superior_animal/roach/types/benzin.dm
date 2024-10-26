/mob/living/carbon/superior_animal/roach/nitro
	name = "Benzin Roach"
	desc = "A monstrous, dog-sized cockroach. This one smells like welding fuel. Likely to explode when shot!"
	icon_state = "boomroach"
	turns_per_move = 4
	maxHealth = 25 * ROACH_HEALTH_MOD
	health = 25 * ROACH_HEALTH_MOD
	melee_damage_upper = 3
	meat_type = /obj/item/reagent_containers/food/snacks/meat/roachmeat/nitro
	meat_amount = 3
	var/fuel_amount = 50
	var/leaking = FALSE
	var/impending_explosion = FALSE

	var/exploded = FALSE

/mob/living/carbon/superior_animal/roach/nitro/ex_act()
	if(!exploded)
		kerplode()

/mob/living/carbon/superior_animal/roach/nitro/Move()
	..()
	if(leaking && (fuel_amount > 0.5))
		var/transfer = fuel_amount * 0.2
		new /obj/effect/decal/cleanable/liquid_fuel(src.loc, transfer, 1)
		fuel_amount -= transfer

/mob/living/carbon/superior_animal/roach/nitro/bullet_act(obj/item/projectile/slug)
	if(!exploded && slug.ignition_source)
		kerplode()
	else
		. = ..()

/mob/living/carbon/superior_animal/roach/nitro/fire_act()
	if(!exploded && !impending_explosion)
		impending_explosion = TRUE
		spawn(rand(30,150))
			kerplode()
	. = ..()

/mob/living/carbon/superior_animal/roach/nitro/proc/kerplode()
	impending_explosion = TRUE
	if(!exploded)
		exploded = TRUE
		visible_message(SPAN_DANGER("\the [src] violently explodes!"))
		explosion(src.loc,0,0,2) //explosion weaker than a welding tank
		gib()

/mob/living/carbon/superior_animal/roach/nitro/attackby(obj/item/I)
	if(isflamesource(I))
		kerplode()
	else
		if(I.sharp)
			leaking = TRUE
		. = ..()

/mob/living/carbon/superior_animal/roach/nitro/death()
	. = ..()
	if(src)
		if(!exploded && !leaking)
			new /obj/effect/decal/cleanable/liquid_fuel(src.loc, max((fuel_amount - 5),2), 1)		//A welderfuel tank below 50 units makes the explosion above (with no flash).
			leaking = TRUE



