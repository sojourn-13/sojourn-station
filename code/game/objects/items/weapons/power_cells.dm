//BIG CELLS - for APC, borgs and machinery.

/obj/item/cell/large
	name = "Lonestar \"Robustcell 2000L\""
	desc = "Lonestar branded rechargeable L-standardized power cell. This one is the cheapest you can find."
	icon_state = "b_st"
	maxcharge = 2000
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 3, MATERIAL_SILVER = 3)
	preloaded_reagents = list("lithium" = 25)
	price_tag = 150

/obj/item/cell/large/high
	name = "Lonestar \"Robustcell 6000L\""
	desc = "Lonestar branded rechargeable L-standardized power cell. Popular and reliable version."
	icon_state = "b_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 6000
	price_tag = 200

/obj/item/cell/large/super
	name = "Lonestar \"Robustcell 16000L\""
	desc = "Lonestar branded rechargeable L-standardized power cell. This industrial version can store even more energy."
	icon_state = "b_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 16000
	price_tag = 250

/obj/item/cell/large/hyper
	name = "Lonestar \"Robustcell-X 20000L\""
	desc = "Lonestar-brand rechargeable L-standardized power cell. This is the top of the class most advanced version of cell on the market."
	icon_state = "b_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 20000
	price_tag = 300

/obj/item/cell/large/guild
	name = "Artificer's Guild \"Workhorse 14000L\""
	desc = "Artificer's Guild-branded rechargeable L-standardized power cell. This one is made with gold, and charges slightly faster than contemporary cells."
	icon_state = "ag_b_sup"
	maxcharge = 14000
	max_chargerate = 0.16
	origin_tech = list(TECH_POWER = 5)
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 3, MATERIAL_SILVER = 2, MATERIAL_GOLD = 1)
	price_tag = 350

/obj/item/cell/large/guild/depleted
	charge = 0
	starts_max_charge = FALSE

/obj/item/cell/large/moebius
	name = "Soteria \"Power-Geyser 2000L\""
	desc = "Soteria Institute-brand rechargeable L-standardized power cell. This one is as cheap as Lonestar models, yet improved in all senses."
	icon_state = "meb_b_st"
	maxcharge = 2000
	price_tag = 200

/obj/item/cell/large/moebius/high
	name = "Soteria \"Power-Geyser 8000L\""
	desc = "Soteria Laboratories branded rechargeable L-standardized power cell. Popular and reliable version."
	icon_state = "meb_b_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 8000
	price_tag = 250

/obj/item/cell/large/moebius/super
	name = "Soteria \"Power-Geyser 14000L\""
	desc = "Soteria Institute-brand rechargeable L-standardized power cell. This industrial version can store even more energy."
	icon_state = "meb_b_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 14000
	price_tag = 300

/obj/item/cell/large/moebius/hyper
	name = "Soteria \"Power-Geyser 18000L\""
	desc = "Soteria Institute-brand rechargeable L-standardized power cell. Regarded as the second most powerful cell on the market."
	icon_state = "meb_b_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 18000
	price_tag = 350

/obj/item/cell/large/moebius/omega
	name = "Soteria \"Omega-Geyser 20000L\""
	desc = "Soteria Institute-brand rechargeable L-standardized power cell. This one being part of the Omega line, making it the be-all-end-all power cell of its type, yet to hit the open market."
	icon_state = "meb_b_omega"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 3, MATERIAL_SILVER = 3, MATERIAL_GOLD = 6)
	preloaded_reagents = list("lithium" = 15, "radium" = 10)
	origin_tech = list(TECH_POWER = 7)
	maxcharge = 20000
	max_chargerate = 0.24
	price_tag = 450 // takes silver and gold to print, might as well toss in an extra bit of value

/obj/item/cell/large/moebius/nuclear
	name = "Soteria \"Atomcell 14000L\""
	desc = "Soteria Institute branded rechargeable L-standardized power cell. This version able to recharge itself over time."
	icon_state = "meb_b_nu"
	autorecharging = TRUE
	origin_tech = list(TECH_POWER = 6)
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 3, MATERIAL_SILVER = 3, MATERIAL_URANIUM = 6)
	preloaded_reagents = list("radium" = 10, "lithium" = 10, "phosphorus" = 5)
	maxcharge = 14000
	price_tag = 500

/obj/item/cell/large/greyson
	name = "GP-SI \"Posi-cell 16000L\""
	desc = "GP-SI branded rechargeable L-standardized power cell that recharges itself over time. This type has yet to hit the market!"
	icon_state = "greyson_b_omega"
	maxcharge = 16000
	autorecharging = TRUE
	autorecharge_rate = 0.06
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 3, MATERIAL_PLATINUM = 3, MATERIAL_URANIUM = 6)
	preloaded_reagents = list("radium" = 10, "lithium" = 10, "phosphorus" = 5)
	price_tag = 600

/obj/item/cell/large/excelsior
	name = "Excelsior \"Zarya 18000L\""
	desc = "Commie rechargeable L-standardized power cell. Power to the people!"
	icon_state = "exs_l"
	origin_tech = list(TECH_POWER = 3)
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTIC = 2)
	maxcharge = 18000

/obj/item/cell/large/neotheology
	name = "Absolute \"Spark 13000L\""
	desc = "Absolute branded non-rechargeable L-standardized power cell."
	icon_state = "b_nt"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_BIOMATTER = 15)
	maxcharge = 13000
	max_chargerate = 0
	created_max_charge = TRUE

/obj/item/cell/large/neotheology/plasma
	name = "Absolute \"Radiance 20000L\""
	desc = "Absolute branded non-rechargeable L-standardized power cell. This advanced version can store even more energy."
	icon_state = "b_nt_pl"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_BIOMATTER = 7.5)
	maxcharge = 20000

//Meme cells - for fun

/obj/item/cell/large/potato
	name = "potato battery"
	desc = "A rechargeable starch based power cell."
	origin_tech = list(TECH_POWER = 1)
	icon = 'icons/obj/power.dmi'
	icon_state = "potato_cell"
	charge = 100
	maxcharge = 300
	minor_fault = 1
	price_tag = 50
	matter = null

//MEDIUM CELLS - for energy weapons and large devices

/obj/item/cell/medium
	name = "Lonestar \"Robustcell 600M\""
	desc = "Lonestar branded rechargeable M-standardized power cell. This one is the cheapest you can find."
	icon_state = "m_st"
	w_class = ITEM_SIZE_SMALL
	force = WEAPON_FORCE_HARMLESS
	throw_speed = 5
	throw_range = 7
	maxcharge = 600
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 2)
	preloaded_reagents = list("lithium" = 15)
	price_tag = 100

/obj/item/cell/medium/depleted
	charge = 0
	starts_max_charge = FALSE

/obj/item/cell/medium/high
	name = "Lonestar \"Robustcell 800M\""
	desc = "Lonestar branded rechargeable M-standardized power cell. Popular and reliable version."
	icon_state = "m_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 800
	price_tag = 125

/obj/item/cell/medium/high/depleted
	charge = 0
	starts_max_charge = FALSE

/obj/item/cell/medium/super
	name = "Lonestar \"Robustcell 1000M\""
	desc = "Lonestar-brand rechargeable M-standardized power cell. This industrial version can store even more energy."
	icon_state = "m_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 1000
	price_tag = 170

/obj/item/cell/medium/hyper
	name = "Lonestar \"Robustcell-X 1600M\""
	desc = "Lonestar branded rechargeable M-standardized power cell. This is the top of the class most advanced version of cell on the market."
	icon_state = "m_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 1600
	price_tag = 200

/obj/item/cell/medium/hyper/depleted
	charge = 0
	starts_max_charge = FALSE

/obj/item/cell/medium/guild
	name = "Artificer's Guild \"Workhorse 1200M\""
	desc = "Artificer's Guild branded rechargeable M-standardized power cell. This one is made with gold, and charges slightly faster than contemporary cells."
	icon_state = "ag_m_sup"
	maxcharge = 1200
	max_chargerate = 0.16 // Charges twice as fast as the default
	origin_tech = list(TECH_POWER = 5)
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 1, MATERIAL_GOLD = 1)
	price_tag = 200 // More expensive, owing to the gold content

/obj/item/cell/medium/guild/depleted
	charge = 0
	starts_max_charge = FALSE

/obj/item/cell/medium/moebius
	name = "Soteria \"Power-Geyser 800M\""
	desc = "Soteria branded rechargeable M-standardized power cell. This one is as cheap as Lonestar models come."
	icon_state = "meb_m_st"
	maxcharge = 800
	price_tag = 140

/obj/item/cell/medium/moebius/high
	name = "Soteria \"Power-Geyser 1000M\""
	desc = "Soteria Institute branded rechargeable M-standardized power cell. Popular and reliable version."
	icon_state = "meb_m_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 1000
	price_tag = 160

/obj/item/cell/medium/moebius/super
	name = "Soteria \"Power-Geyser 1200M\""
	desc = "Soteria Institute branded rechargeable M-standardized power cell. This industrial version can store even more energy."
	icon_state = "meb_m_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 1200
	price_tag = 180

/obj/item/cell/medium/moebius/hyper
	name = "Soteria \"Power-Geyser 1400M\""
	desc = "Soteria Institute branded rechargeable M-standardized power cell. Regarded as the second most powerful cell on the market."
	icon_state = "meb_m_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 1400
	price_tag = 200

/obj/item/cell/medium/moebius/omega
	name = "Soteria \"Omega-Geyser 1600M\""
	desc = "Soteria Institute branded rechargeable M-standardized power cell. This one being part of the Omega line, making it the be-all-end-all power cell of its type, yet to hit the open market."
	icon_state = "meb_m_omega"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 2, MATERIAL_GOLD = 4)
	preloaded_reagents = list("lithium" = 10, "radium" = 5)
	origin_tech = list(TECH_POWER = 7)
	maxcharge = 1600
	max_chargerate = 0.24
	price_tag = 225

/obj/item/cell/medium/moebius/nuclear
	name = "Soteria \"Atomcell 1000M\""
	desc = "Soteria Institute branded rechargeable M-standardized power cell. This version able to recharge itself over time."
	icon_state = "meb_m_nu"
	autorecharging = TRUE
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 2, MATERIAL_URANIUM = 4)
	preloaded_reagents = list("lithium" = 5, "radium" = 5, "phosphorus" = 5)
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 1000
	price_tag = 250

/obj/item/cell/medium/greyson
	name = "GP-SI \"Posi-cell 1600M\""
	desc = "GP-SI branded rechargeable M-standardized power cell that recharges itself over time. This type has yet to hit the market!"
	icon_state = "greyson_m_omega"
	maxcharge = 1600
	autorecharging = TRUE
	autorecharge_rate = 0.06
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2, MATERIAL_PLATINUM = 2, MATERIAL_URANIUM = 4)
	preloaded_reagents = list("lithium" = 5, "radium" = 5, "phosphorus" = 5)
	price_tag = 325

/obj/item/cell/medium/excelsior
	name = "Excelsior \"Zarya 1100M\""
	desc = "Commie rechargeable M-standardized power cell. Power to the people!"
	icon_state = "exs_m"
	origin_tech = list(TECH_POWER = 3)
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 1)
	maxcharge = 1100

/obj/item/cell/medium/neotheology
	name = "Absolute \"Spark 1000M\""
	desc = "Absolute branded non-rechargeable M-standardized power cell."
	icon_state = "m_nt"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_BIOMATTER = 10)
	maxcharge = 1000
	max_chargerate = 0
	created_max_charge = TRUE

/obj/item/cell/medium/neotheology/plasma
	name = "Absolute \"Radiance 1500M\""
	desc = "Absolute branded non-rechargeable M-standardized power cell. This advanced version can store even more energy."
	icon_state = "m_nt_pl"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_BIOMATTER = 5)
	maxcharge = 1500

//SMALL CELLS - for small devices, such as flashlights, analyzers and HUDs.

/obj/item/cell/small
	name = "Lonestar \"Robustcell 100S\""
	desc = "Lonestar branded rechargeable S-standardized power cell. This one is the cheapest you can find."
	icon_state = "s_st"
	w_class = ITEM_SIZE_TINY
	force = WEAPON_FORCE_HARMLESS
	throw_speed = 5
	throw_range = 7
	maxcharge = 100
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1, MATERIAL_SILVER = 1)
	preloaded_reagents = list("lithium" = 5)
	price_tag = 50

/obj/item/cell/small/depleted
	charge = 0
	starts_max_charge = FALSE

/obj/item/cell/small/high
	name = "Lonestar \"Robustcell 200S\""
	desc = "Lonestar branded rechargeable S-standardized power cell. Popular and reliable version."
	icon_state = "s_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 200
	price_tag = 60

/obj/item/cell/small/high/depleted
	charge = 0
	starts_max_charge = FALSE

/obj/item/cell/small/super
	name = "Lonestar \"Robustcell 300S\""
	desc = "Lonestar branded rechargeable S-standardized power cell. This industrial version can store even more energy."
	icon_state = "s_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 300
	price_tag = 75

/obj/item/cell/small/hyper
	name = "Lonestar \"Robustcell-X 500S\""
	desc = "Lonestar branded rechargeable S-standardized power cell. This is the top of the class most advanced version of cell on the market."
	icon_state = "s_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 500
	price_tag = 90

/obj/item/cell/small/guild
	name = "Artificer's Guild \"Workhorse 300S\""
	desc = "Artificer's Guild branded rechargeable S-standardized power cell. This one is made with gold, and charges slightly faster than contemporary cells."
	icon_state = "ag_s_sup"
	maxcharge = 300
	max_chargerate = 0.16
	origin_tech = list(TECH_POWER = 5)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1, MATERIAL_SILVER = 1, MATERIAL_GOLD = 1)
	price_tag = 100

/obj/item/cell/small/guild/depleted
	charge = 0
	starts_max_charge = FALSE

/obj/item/cell/small/moebius
	name = "Soteria \"Power-Geyser 120S\""
	desc = "Soteria Institute branded rechargeable S-standardized power cell. This one is cheap, yet better than Lonestar models for same price."
	icon_state = "meb_s_st"
	maxcharge = 120
	price_tag = 60

/obj/item/cell/small/moebius/high
	name = "Soteria \"Power-Geyser 250S\""
	desc = "Soteria Institute branded rechargeable S-standardized power cell. Popular and reliable version."
	icon_state = "meb_s_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 250
	price_tag = 75

/obj/item/cell/small/moebius/super
	name = "Soteria \"Power-Geyser 300S\""
	desc = "Soteria Institute branded rechargeable S-standardized power cell. This industrial version can store even more energy."
	icon_state = "meb_s_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 300
	price_tag = 85

/obj/item/cell/small/moebius/hyper
	name = "Soteria \"Power-Geyser 400S\""
	desc = "Soteria Institute branded rechargeable S-standardized power cell. Regarded as the second most powerful cell on the market."
	icon_state = "meb_s_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 400
	price_tag = 100

/obj/item/cell/small/moebius/omega
	name = "Soteria \"Omega-Geyser 500S\""
	desc = "Soteria Institute branded rechargeable S-standardized power cell. This one being part of the Omega line making it the be-all-end-all power cell of its type, yet to hit the open market."
	icon_state = "meb_s_omega"
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1, MATERIAL_SILVER = 1, MATERIAL_GOLD = 2)
	preloaded_reagents = list("radium" = 5)
	origin_tech = list(TECH_POWER = 7)
	maxcharge = 500
	max_chargerate = 0.24
	price_tag = 115

/obj/item/cell/small/moebius/nuclear
	name = "Soteria \"Atomcell 300S\""
	desc = "Soteria Institute branded rechargeable S-standardized microreactor cell. Recharges itself over time."
	icon_state = "meb_s_nu"
	autorecharging = TRUE
	origin_tech = list(TECH_POWER = 6)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1, MATERIAL_SILVER = 1, MATERIAL_URANIUM = 2)
	preloaded_reagents = list("radium" = 5)
	maxcharge = 300
	price_tag = 130

/obj/item/cell/small/moebius/pda
	name = "Soteria \"Atomcell 50S\""
	desc = "Soteria Institute branded S-standardized microreactor cell. Recharges itself over time."
	icon_state = "meb_pda"
	origin_tech = list(TECH_POWER = 4)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1, MATERIAL_URANIUM = 1)
	preloaded_reagents = list("radium" = 5)
	maxcharge = 50
	// Autorecharge rate is buffed compared to eris, to compensate for the cell's cooldown.
	autorecharging = TRUE
	autorecharge_rate = 0.007
	recharge_time = 1
	price_tag = 65

/obj/item/cell/small/greyson
	name = "GP-SI \"Posi-cell 400S\""
	desc = "GP-SI branded rechargeable S-standardized power cell that recharges itself over time. This type has yet to hit the market!"
	icon_state = "greyson_s_omega"
	maxcharge = 400
	autorecharging = TRUE
	autorecharge_rate = 0.06
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1, MATERIAL_PLATINUM = 1, MATERIAL_URANIUM = 2)
	preloaded_reagents = list("radium" = 5)
	price_tag = 150

/obj/item/cell/small/excelsior
	name = "Excelsior \"Zarya 400S\""
	desc = "Commie rechargeable S-standardized power cell. Power to the people!"
	icon_state = "exs_s"
	origin_tech = list(TECH_POWER = 3)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1)
	maxcharge = 400

/obj/item/cell/small/neotheology
	name = "Absolute \"Spark 300S\""
	desc = "Absolute branded non-rechargeable S-standardized power cell."
	icon_state = "s_nt"
	matter = list(MATERIAL_STEEL = 1, MATERIAL_BIOMATTER = 5)
	maxcharge = 300
	max_chargerate = 0
	created_max_charge = TRUE

/obj/item/cell/small/neotheology/plasma
	name = "Absolute \"Radiance 500S\""
	desc = "Absolute branded non-rechargeable S-standardized power cell. This advanced version can store even more energy."
	icon_state = "s_nt_pl"
	matter = list(MATERIAL_STEEL = 1, MATERIAL_BIOMATTER = 2.5)
	maxcharge = 500

// One cell to rule them all!
/obj/item/cell/large/hydrogen
	name = "hydrogen cell adapter"
	desc = "An advanced device designed to convert the power held within regular cryo-sealed hydrogen fuel cell into power suitable for most electronic systems."
	icon_state = "hydrogen"
	max_chargerate = 0 // Cannot be charged
	origin_tech = list(TECH_POWER = 2)
	var/ratio = 200 // How much power does 1 unit of hydrogen give. At 150 plasma per cell, a single cell would provide 200 * 150 = 30000 total power, or 10k more than the best cells
	var/obj/item/hydrogen_fuel_cell/fuel_cell // The fuel cell that we drain power from

/obj/item/cell/large/hydrogen/Initialize()
	. = ..()
	update_charge() // Update the charge

// Update the current max charge and charge so that we don't have to keep manually referencing the fuel cell.
/obj/item/cell/large/hydrogen/proc/update_charge()
	maxcharge = fuel_cell?.max_plasma * ratio
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
	if(istype(W, /obj/item/hydrogen_fuel_cell))
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

/obj/item/cell/large/hydrogen/update_icon()
	icon_state = "[initial(icon_state)]_[fuel_cell ? "1" : "0"]" // hydrogen_1 if it has a fuel cell, hydrogen_0 if it doesn't.

// Subtype that start loaded
/obj/item/cell/large/hydrogen/loaded/New()
	..()
	fuel_cell = new(src)
	update_charge()

// A cell powered by an ameridian core. It is self-charging and used in the Ameridian Knight Rig, where it cannot be removed.
/obj/item/cell/large/ameridian
	name = "ameridian power cell"
	desc = "An advanced device designed to extract power from ameridian cores. However it can only extract power while not in use."
	icon_state = "hydrogen"
	maxcharge = 20000
	autorecharging = TRUE
	autorecharge_rate = 0.1
	price_tag = 600
	origin_tech = list(TECH_POWER = 15)
	var/obj/item/ameridian_core/core

/obj/item/cell/large/ameridian/New()
	..()
	update_core()

/obj/item/cell/large/ameridian/examine(mob/user)
	..()
	if(!core)
		to_chat(user, SPAN_NOTICE("[src] doesn't have an ameridian core installed."))

/obj/item/cell/large/ameridian/attackby(obj/item/W, mob/user)
	..()
	if(istype(W, /obj/item/ameridian_core) && !core)
		insert_item(W, user) // Insert the fuel cell into the adapter
		core = W
		update_core() // Update the charge
		return

/obj/item/cell/large/ameridian/MouseDrop(over_object)
	if(core)
		usr.visible_message(
								SPAN_NOTICE("[usr] remove [core] from [src]."),
								SPAN_NOTICE("You remove [core] from [src].")
									)
		eject_item(core, usr)
		core = null
		update_core() // Update the charge
	else
		to_chat(usr, SPAN_NOTICE("[src] doesn't have an ameridian core."))

/obj/item/cell/large/ameridian/update_icon()
	icon_state = "[initial(icon_state)]_[core ? "1" : "0"]" // hydrogen_1 if it has a core, hydrogen_0 if it doesn't.

/obj/item/cell/large/ameridian/proc/update_core()
	autorecharging = core ? TRUE : FALSE
	update_icon()

/obj/item/cell/large/ameridian/loaded/New()
	..()
	core = new(src)
	update_core()

// Hand crank
/obj/item/device/manual_charger
	name = "manual recharger"
	desc = "A basic hand crank recharger utilizing a manual mechanism."
	icon = 'icons/obj/machines/chemistry.dmi'
	icon_state = "centrifuge_makeshift"
	matter = list(MATERIAL_STEEL = 30)
	cell = null
	suitable_cell = /obj/item/cell
	var/charge_per_cycle = 30
	var/inuse = FALSE

/obj/item/device/manual_charger/attackby(obj/item/I, mob/user)
	if(istype(I, suitable_cell) && insert_item(I, user) && !cell)
		cell = I
		return
	..()

/obj/item/device/manual_charger/MouseDrop(over_object)
	if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(cell, usr))
		cell = null

/obj/item/device/manual_charger/attack_self(mob/user)
	if(!cell)
		to_chat(user, SPAN_WARNING("Their is no cell currently loaded in the spool."))
		return
	if(0 >= cell.max_chargerate)
		to_chat(user, SPAN_WARNING("This type of cell can't be recharged."))
		return
	if(inuse)
		to_chat(user, SPAN_WARNING("You are already charging the cell!"))
		return
	inuse = TRUE
	user.visible_message(SPAN_NOTICE("[user] starts turning the handle on [src]."), SPAN_NOTICE("You start to turn the handle on [src]."))
	if(do_after(user, 12 + (30 * user.stats.getMult(STAT_TGH, STAT_LEVEL_ADEPT))))
		if(!cell)
			return
		if(cell.charge >= cell.maxcharge)
			user.visible_message(SPAN_NOTICE("The cell can not be charged any more!"))
			return
		else
			cell.charge += min(charge_per_cycle, cell.maxcharge - cell.charge)
	inuse = FALSE

/obj/item/device/manual_charger/dropped(mob/user)
	inuse = FALSE

// Improv crank
/obj/item/device/manual_charger/improv
	name = "handmade manual recharger"
	desc = "A handmade manual crank charger. Barely capable of charging cells."
	charge_per_cycle = 10
