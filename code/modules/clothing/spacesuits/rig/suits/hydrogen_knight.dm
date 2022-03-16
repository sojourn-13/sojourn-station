/obj/item/rig/hydrogen_knight
	name = "Hydrogen Knight suit control module"
	suit_type = "Hydrogen Knight"
	desc = "An armored, knight-like suit designed by Soteria's best roboticists and powered by hydrogen."
	icon_state = "eva_rig"
	armor_list = list(
		melee = 50,
		bullet = 30,
		energy = 30,
		bomb = 20,
		bio = 100,
		rad = 100
	)
	slowdown = 0.3
	offline_slowdown = 1
	offline_vision_restriction = 1

	chest_type = /obj/item/clothing/suit/space/rig/hydrogen_knight
	helm_type =  /obj/item/clothing/head/helmet/space/rig/hydrogen_knight
	boot_type =  /obj/item/clothing/shoes/magboots/rig/hydrogen_knight
	glove_type = /obj/item/clothing/gloves/rig/hydrogen_knight
	cell_type =  /obj/item/cell/large/hydrogen
	air_type =   /obj/item/tank/oxygen

	extra_allowed = list(
		/obj/item/tool/hydrogen_sword
	)

	req_access = list()
	req_one_access = list()

/obj/item/clothing/suit/space/rig/hydrogen_knight
	name = "hydrogen knight suit"

/obj/item/clothing/head/helmet/space/rig/hydrogen_knight
	name = "hydrogen knight helm"

/obj/item/clothing/shoes/magboots/rig/hydrogen_knight
	name = "hydrogen knight boots"

/obj/item/clothing/gloves/rig/hydrogen_knight
	name = "hydrogen knight gauntlets"



// One cell to rule them all!
// More seriously this is the hydrogen cell used to power the Hydrogen Knight rig, using an actual hydrogen fuel cell
/obj/item/cell/large/hydrogen
	name = "hydrogen cell adapter"
	desc = "An advanced device designed to convert the power held within regular cryo-sealed hydrogen fuel cell into power suitable for most electronic systems."
	max_chargerate = 0 // Cannot be charged
	origin_tech = list(TECH_POWER = 2)
	var/ratio = 200 // How much power does 1 unit of hydrogen give. At 150 plasma per cell, a single cell would provide 200 * 150 = 30000 total power, or 10k more than the best cells
	var/obj/item/hydrogen_fuel_cell/fuel_cell // The fuel cell that we drain power from

/obj/item/cell/large/hydrogen/Initialize()
	. = ..()
	fuel_cell = new(src) // Start with a fuel cell
	update_charge() // Update the charge

// Update the current max charge and charge so that we don't have to keep manually referencing the fuel cell.
/obj/item/cell/large/hydrogen/proc/update_charge()
	maxcharge = fuel_cell?.max_plasma
	charge = fuel_cell?.plasma * ratio

	if(!maxcharge) // If the max charge is somehow null
		maxcharge = 1 // Set to 1 to prevent divisions by 0.
	if(!charge)
		charge = 0

	update_icon()

/obj/item/cell/large/hydrogen/drain_power(var/drain_check, var/surge, var/power = 0)
	..()

/obj/item/cell/large/hydrogen/use(var/amount)
	charge_tick = max(charge_delay, charge_tick) //The cooldown could be shorter than the refresh time.
	if(rigged && amount > 0)
		explode()
		return 0
	var/used = fuel_cell.use(amount / ratio) ? amount : 0
	update_charge()
	update_icon()
	return used

/obj/item/cell/large/hydrogen/give(var/amount)
	..()
	update_charge() // Do the normal stuff, then update the charge.

/obj/item/cell/large/hydrogen/attackby(obj/item/W, mob/user)
	..()
	if(istype(W, /obj/item/reagent_containers/syringe))
		var/obj/item/hydrogen_fuel_cell/H = W
		insert_item(H, user) // Insert the fuel cell into the adapter
		fuel_cell = H
		update_charge() // Update the charge
		return

/obj/item/cell/large/hydrogen/MouseDrop(over_object)
	if(fuel_cell)
		usr.visible_message(
								SPAN_NOTICE("[usr] detach [fuel_cell] from [src]."),
								SPAN_NOTICE("You detach [fuel_cell] from [src].")
									)
		eject_item(fuel_cell, usr)
		fuel_cell = null
		update_charge() // Update the charge
	else
		to_chat(usr, SPAN_NOTICE("[src] doesn't have an hydrogen fuel cell."))

