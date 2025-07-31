//EXTREMELY RARE able heck some people up or do events with
//Requires chaos level 3 or admins
/mob/living/carbon/superior/psi/ploge
	name = "Ploge"
	desc = "Hideous mass of flesh and dreams, this monstrosity was once just another body lost to the deep, but now has been bent and molded for a new purpose."

	momento_mori = /obj/effect/decal/cleanable/psi_ash

	icon_state = "loge"
	icon_living = "loge"

	phaser = FALSE
	psionic_respawn = FALSE

	maxHealth = 1000 * PSIMOB_HEALTH_MOD
	health = 1000 * PSIMOB_HEALTH_MOD

	//Good stats baseline in case admins dont edit these
	armor = list(melee = 15, bullet = 7, energy = 7, bomb = 20, bio = 50, rad = 100, agony = 100)

	ranged = TRUE
	comfy_range = 8

	projectiletype = /obj/item/projectile/goo

	var/knockdown_odds = 10 //Maybe stay away from it

	can_burrow = FALSE
	melee_damage_lower = 15
	melee_damage_upper = 25
	armor_divisor = 3
	ranged = TRUE

	pixel_x = 0
	pixel_y = 0
	default_pixel_x = 0
	default_pixel_y = 0
	size_pixel_offset_x = 0

	var/transform_ed = FALSE
	can_leave = TRUE
	research_value = 11000

// BUMP!
/mob/living/carbon/superior/psi/ploge/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(knockdown_odds))
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			else
				L.Weaken(3)
				L.visible_message(SPAN_DANGER("\the [src] uses its mass to knock over \the [L]!"))
	. = ..()

/mob/living/carbon/superior/psi/ploge/Life()
	. = ..()
	if(health <= (maxHealth * 0.66) && transform_ed == FALSE)
		icon_state = "ploge"
		icon_living = "ploge"
		knockdown_odds = 50
		melee_damage_lower = 30
		melee_damage_upper = 35
		armor_divisor = 4
		transform_ed = TRUE
		projectiletype = /obj/item/projectile/tether/lash
		for(var/mob/living/target in targets_in_range(in_hear_range = TRUE))
			if(target.stat == CONSCIOUS && target.faction != "psi_monster")
				if(isdeaf(target))
					continue
				if(ishuman(target))
					var/mob/living/carbon/human/H = target
					if(istype(H.l_ear, /obj/item/clothing/ears/earmuffs) && istype(H.r_ear, /obj/item/clothing/ears/earmuffs))
						continue
					use_ability(target)
					playsound(src, 'sound/xenomorph/4_xeno_roars.ogg', 200, 1)

/mob/living/carbon/superior/psi/ploge/proc/use_ability(mob/living/target)
	if(target.faction == "psi_monster")
		return
	if(target == src)
		return

	var/mob/living/carbon/human/H = target
	if(istype(H))
		if(prob(100 - H.stats.getStat(STAT_VIG)))
			H.Weaken(4)
			to_chat(H, SPAN_WARNING("A horrifying roar of primal soul-less terror sears through your mind!"))
		else
			to_chat(H, SPAN_NOTICE("You hear the horrifying roar of a soul-less monster but block out any fear!"))
	else
		target.Weaken(4)
		to_chat(target, SPAN_WARNING("A horrifying roar of primal soul-less terror sears through your mind!"))

/mob/living/carbon/superior/psi/ploge/proc/targets_in_range(range = world.view, in_hear_range = FALSE)
	var/list/range_list = list()
	var/list/target_list = list()
	if(in_hear_range)
		range_list = hearers(range, src)
	else
		range_list = range(range, src)
	for(var/atom/movable/M in range_list)
		var/mob/target = M.get_mob()
		if(target)
			target_list += target
	return target_list


/mob/living/carbon/superior/psi/ploge/proc/regain_range()
	ranged = TRUE


/mob/living/carbon/superior/psi/ploge/right_after_firing(atom/firing_target, obj/item/projectile/trace_arg)
	ranged = FALSE
	addtimer(CALLBACK(src, PROC_REF(regain_range)), 60) // gives some time for the monster to run upto or attack the mob

/mob/living/carbon/superior/psi/ploge/UnarmedAttack(atom/A, proximity)
	..()
	ranged = TRUE
