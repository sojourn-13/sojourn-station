/mob/living/carbon/superior_animal/psi_monster/Life()
	. = ..()
	var/turf/L = get_turf(src)
	if(L.get_lumcount() < 0.8)
		heal_overall_damage(1,1)
		updatehealth()
	if(health >= (maxHealth * 0.9) && (L.get_lumcount() <= 0.8))
		alpha = 10
