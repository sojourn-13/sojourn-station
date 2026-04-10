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

/datum/perk/cooldown/nt_swords
	name = "Fractal Weapon Art: Dividing Strikes"
	desc = "The most basic and standard of the Absolute's arts, used from ranks of fractals to high ranks of crusaders."
	icon_state = "scuttlebug"
	perk_lifetime = 300 SECONDS
	gain_text = null
	lose_text = null
	var/swings = 0

/datum/perk/cooldown/nt_swords/assign(mob/living/L)
	..()

/datum/perk/cooldown/nt_shield
	name = "Fractal Weapon Art: Parentheses"
	desc = "The strangest of the Fractal Weapon Arts as the main use of the shield is to draw aggression to the user, or for defense \
	the art however makes use of overwhelming defense as offence."
	icon_state = "scuttlebug"
	perk_lifetime = 300 SECONDS
	gain_text = null
	lose_text = null
	var/swings = 0

/datum/perk/cooldown/nt_shield/assign(mob/living/L)
	..()

/datum/perk/cooldown/nt_dagger
	name = "Fractal Weapon Art: Mult Point"
	desc = "A fast movement based art that makes full use of the weapons swing to leave deeper stabs and faster slashes."
	icon_state = "scuttlebug"
	perk_lifetime = 300 SECONDS
	gain_text = null
	lose_text = null
	var/swings = 0

/datum/perk/cooldown/nt_dagger/assign(mob/living/L)
	..()

/datum/perk/cooldown/nt_spears
	name = "Fractal Weapon Art: Subtracted Battle"
	desc = "When it comes to Fractal Weapon Arts, the Subtracted Battle movements are counted as a jackpot. \
	The mix between range and increased speed allows the user to keep use a style of evade and strike that many lean towards."
	icon_state = "scuttlebug"
	perk_lifetime = 300 SECONDS
	gain_text = null
	lose_text = null
	var/swings = 0

/datum/perk/cooldown/nt_spears/assign(mob/living/L)
	..()

/datum/perk/cooldown/nt_hammer
	name = "Fractal Weapon Art: Fraction Heave"
	desc = "The Fraction Heave Fractal Weapon Art leaves much to be desired, its finality and uninteresting movements leave many \
	disappointed with its showing of force."
	icon_state = "scuttlebug"
	perk_lifetime = 300 SECONDS
	gain_text = null
	lose_text = null
	var/swings = 0

/datum/perk/cooldown/nt_hammer/assign(mob/living/L)
	..()

/datum/perk/cooldown/nt_furioso
	name = "Prime Weapon Art: Furioso Calculation"
	desc = "A weapon art rarely used do to its conditions. \
	One of the few Prime Weapon Arts recognized by the Church of the Absolute's New Testament weapons division"
	icon_state = "scuttlebug"
	perk_lifetime = 300 SECONDS
	gain_text = "The cruciform burns hot, correcting your movements and forms rapidly swapping arts as you wield them"
	lose_text = "A coldness borrows into your cruciform, as it completes its calculations."

/datum/perk/cooldown/nt_furioso/assign(mob/living/L)
	..()