/datum/stat_modifier/mob/living/carbon/superior_animal/biosilicified

	armor_adjustment = list(
	melee = 10,
	bullet = 5,
	bomb = 10,
	agony = 15 //Rubbers deal way less to us!
	)

	armor_penetration_increment = 15

	stattags = DEFENSE_STATTAG | MELEE_STATTAG

	prefix = "Biosilicified"

	description = "Networks of wafer-thin crystalline lattice span the surface of this one, both hardening itself towards blunt trauma and improving its own penetration abilities."

/datum/stat_modifier/mob/living/carbon/superior_animal/lambertian

	armor_adjustment = list(
	energy = 10,
	agony = 10
	)

	flash_resistances_increment = 2
	armor_penetration_increment = 5

	stattags = DEFENSE_STATTAG

	prefix = "Lambertian"

	description = "This one is covered in a silvery-white sheen, improving it's ability to resist energy attacks and pain, as well as mitigating flashes."
