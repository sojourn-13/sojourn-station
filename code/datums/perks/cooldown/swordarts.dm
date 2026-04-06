/datum/perk/cooldown/ignis_gladius_artium
	name = "Sword Art: Ignis Gladius Artium (Corrected) (Imminitation) (Weakened)"
	desc = "Something is correcting your movements and adjusting your stance."
	icon_state = "scuttlebug"
	perk_lifetime = 30 SECONDS
	gain_text = null
	lose_text = null
	var/sezionatura = 2
	var/ammo_shots = 0

/datum/perk/cooldown/ignis_gladius_artium/assign(mob/living/L)
	..()

/datum/perk/cooldown/ignis_gladius_artium/on_process()
	if(sezionatura > 5)
		sezionatura -= 0.1 //Slow lose it
	if(ammo_shots)
		ammo_shots -= 0.5
		if(ammo_shots < 0)
			ammo_shots = 0
	..()