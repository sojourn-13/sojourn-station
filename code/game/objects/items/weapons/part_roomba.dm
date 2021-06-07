// Parts for the custom roomba located in code\modules\mob\living\simple_animal\hostile\doomba.dm

// Circuit
/obj/item/weapon/circuitboard/roomba
	name = "roomba circuit board"
	icon = 'icons/obj/module.dmi'
	icon_state = "std_mod"
	item_state = "electronic"
	board_type = "other"

/obj/item/weapon/circuitboard/roomba/control
	build_name = "roomba central control module"
	desc = "A control board for a roomba."
	icon_state = "mainboard"
	origin_tech = list(TECH_DATA = 3)

// Armor Plating
/obj/item/weapon/roomba_plating
	name = "roomba plating"
	desc = "Some steel sheets for attaching on a roomba to give it protection."
	icon = 'icons/obj/robot_component.dmi'
	icon_state = "armor"

	// The total armor it will give to the roomba.
	var/armor_stat = list(
		melee = 25,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 100, // It's a robot, no pain or diseases for you buddy.
		agony = 100
	)

/obj/item/weapon/roomba_plating/heavy
	name = "heavy roomba plating"
	desc = "Some plasteel sheets for attaching on a roomba to give it extra protection."
	armor_stat = list(
		melee = 50,
		bullet = 50,
		energy = 50,
		bomb = 50,
		bio = 100,
		agony = 100
	)

// Knife
/obj/item/weapon/tool/knife/roomba_knife
	name = "roomba knife"
	desc = "A knife with tape on it, for attaching on a roomba."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "knife_roomba"
	tool_qualities = list() // So that it can't trigger the screwdriving part.
	var/damage_boost = 30 // The damage bonus it give to the roomba when installed.
