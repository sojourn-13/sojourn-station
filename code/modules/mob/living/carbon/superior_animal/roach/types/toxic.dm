/mob/living/carbon/superior_animal/roach/toxic
	name = "Gestrahlte Roach"
	desc = "A hulking beast of green, congealed waste. It has an enlarged salivatory gland for vomiting toxic waste on enemies."
	icon_state = "radioactiveroach"

	meat_amount = 3
	turns_per_move = 1
	maxHealth = 40 * ROACH_HEALTH_MOD
	health = 40 * ROACH_HEALTH_MOD

	contaminant_immunity = TRUE

	knockdown_odds = 3
	melee_damage_lower = 3
	melee_damage_upper = 7 //Weaker than hunter
	armor_divisor = 1.3

/mob/living/carbon/superior_animal/roach/toxic/UnarmedAttack(atom/A, proximity)
	. = ..()

	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(25))
			var/damage = rand(melee_damage_lower, melee_damage_upper)
			L.damage_through_armor(damage, TOX)
			playsound(src, 'sound/voice/insect_battle_screeching.ogg', 30, 1, -3)
			L.visible_message(SPAN_DANGER("\the [src] globs up some toxic bile all over \the [L]!"))
