/mob/living/carbon/superior_animal/xenomorph/warrior/praetorian
	name = "praetorian"
	desc = "The praetorian, the second most powerful and ruthless xenomorph ever birthed from the dark pit these monsters crawled from."
	icon = 'icons/mob/Xenos_2x2.dmi'
	icon_state = "praetorian"
	icon_living = "praetorian"
	icon_dead = "praetorian_dead"
	icon_rest = "praetorian_stunned"

	maxHealth = 1600
	health = 1600

	melee_damage_lower = 40
	melee_damage_upper = 50

	move_to_delay = 2
	turns_per_move = 12

/mob/living/carbon/superior_animal/xenomorph/warrior/shrike/praetorian/queen
	name = "queen"
	desc = "The xenomorph queen, the apex of the xenomorphs and the source of all infestations. A living avatar of millions of worlds left in ruin."
	icon = 'icons/mob/Xenos_2x2.dmi'
	icon_state = "queen"
	icon_living = "queen"
	icon_dead = "queen_dead"
	icon_rest = "queen_stunned"
	status_flags = 0

	maxHealth = 3000
	health = 3000
	poison_per_bite = 10

	melee_damage_lower = 40
	melee_damage_upper = 50

	move_to_delay = 2
	turns_per_move = 12

/mob/living/carbon/superior_animal/xenomorph/warrior/shrike/praetorian/queen/UnarmedAttack(var/atom/A, var/proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && !L.weakened && prob(30))
			L.Weaken(8)
			L.visible_message(SPAN_DANGER("\the [src] rams \the [L] off there feet!"))

	. = ..()