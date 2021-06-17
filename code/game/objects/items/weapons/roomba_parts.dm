// Parts for the custom roomba located in code\modules\mob\living\simple_animal\hostile\doomba.dm

// Parts for the fabrication of the roomba.
/obj/item/weapon/roomba_part
	name = "roomba parts"
	desc = "Parts for the assembly of a roomba."
	icon = 'icons/mob/custom_roomba.dmi'

/obj/item/weapon/roomba_part/control
	name = "roomba central control module"
	desc = "A control board for a roomba."
	icon_state = "mainboard"
	origin_tech = list(TECH_DATA = 3)

/obj/item/weapon/roomba_part/treads
	name = "roomba treads"
	desc = "Treads for the assembly of a roomba."
	icon_state = "roomba_treads"

// Armor Plating
/obj/item/weapon/roomba_part/roomba_plating
	name = "roomba plating"
	desc = "Some steel sheets for attaching on a roomba to give it protection."
	icon_state = "roomba_armor"

	// The total armor it will give to the roomba.
	var/armor_stat = list(
		melee = 25,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 100, // It's a robot, no pain or diseases for you buddy.
		agony = 100
	)

/obj/item/weapon/roomba_part/roomba_plating/heavy
	name = "heavy roomba plating"
	desc = "Some plasteel sheets for attaching on a roomba to give it extra protection."
	icon_state = "roomba_armor_heavy"
	armor_stat = list(
		melee = 50,
		bullet = 50,
		energy = 50,
		bomb = 50,
		bio = 100,
		agony = 100
	)

// Knife
/obj/item/weapon/roomba_part/roomba_knife
	name = "roomba knife"
	desc = "A knife with tape on it, for attaching on a roomba."
	icon_state = "roomba_knife"
	tool_qualities = list() // So that it can't trigger the screwdriving part.
	var/damage_boost = 30 // The damage bonus it give to the roomba when installed.
