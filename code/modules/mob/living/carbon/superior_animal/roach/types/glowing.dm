/mob/living/carbon/superior_animal/roach/glowing
	name = "Gluhend Roach"
	desc = "A huge dog-sized roach that been evolved to produce small amouts of uranium in its glad, becoming stronger and glowing sickly green."
	icon_state = "glowingroach"
	light_range = 2
	light_color = COLOR_LIGHTING_GREEN_DARK

	meat_amount = 2
	turns_per_move = 1
	maxHealth = 40 * ROACH_HEALTH_MOD
	health = 40 * ROACH_HEALTH_MOD

	flash_resistances = 10 //We are the light

	meat_type = /obj/item/reagent_containers/food/snacks/meat/roachmeat/glowing

	armor = list(melee = 8, bullet = 1, energy = 1, bomb = 5, bio = 20, rad = 100, agony = 0)

	contaminant_immunity = TRUE
	toxin_immune = TRUE

	knockdown_odds = 3 //Well we still can knockdown we dont tend to over other affects
	melee_damage_lower = 5
	melee_damage_upper = 7 //Weaker than hunter
	armor_divisor = 1

/mob/living/carbon/superior_animal/roach/glowing/UnarmedAttack(var/atom/A, var/proximity)
	. = ..()

	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(25))
			var/damage = rand(melee_damage_lower, melee_damage_upper) + 5 //10-12 burns
			L.damage_through_armor(damage, BURN)
			playsound(src, 'sound/voice/insect_battle_screeching.ogg', 30, 1, -3)
			L.visible_message(SPAN_DANGER("\the [src] pinches hard, chemically burning \the [L]!"))
		if(prob(5))
			var/mob/living/carbon/C = L
			var/safety = C.eyecheck()
			if(safety < FLASH_PROTECTION_MINOR)
				var/flash_strength = 5
				if(ishuman(L))
					var/mob/living/carbon/human/H = L
					flash_strength *= H.flash_mod
				if(flash_strength > 0)
					L.Weaken(flash_strength)
					if (L.HUDtech.Find("flash"))
						flick("e_flash", L.HUDtech["flash"])
					L.visible_message(SPAN_DANGER("\the [src] flashes a bright green, blinding \ [L]!"))
			else
				L.visible_message(SPAN_DANGER("\the [src] fails to blind \ [L]!"))
