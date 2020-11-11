//BIG CELLS - for APC, borgs and machinery.

/obj/item/weapon/cell/large
	name = "Lonestar \"Robustcell 2000L\""
	desc = "Lonestar branded rechargeable L-standardized power cell. This one is the cheapest you can find."
	icon_state = "b_st"
	maxcharge = 2000
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 3, MATERIAL_SILVER = 3)
	price_tag = 200

/obj/item/weapon/cell/large/high
	name = "Lonestar \"Robustcell 6000L\""
	desc = "Lonestar branded rechargeable L-standardized power cell. Popular and reliable version."
	icon_state = "b_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 6000

/obj/item/weapon/cell/large/super
	name = "Lonestar \"Robustcell 16000L\""
	desc = "Lonestar branded rechargeable L-standardized power cell. This advanced version can store even more energy."
	icon_state = "b_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 16000

/obj/item/weapon/cell/large/hyper
	name = "Lonestar \"Robustcell-X 20000L\""
	desc = "Lonestar branded rechargeable L-standardized power cell. Looks like this is a rare and powerful prototype."
	icon_state = "b_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 20000

/obj/item/weapon/cell/large/moebius
	name = "Soteria \"Power-Geyser 2000L\""
	desc = "Soteria Institute branded rechargeable L-standardized power cell. This one is cheap, yet better than Lonestar models for same price."
	icon_state = "meb_b_st"
	maxcharge = 2000

/obj/item/weapon/cell/large/moebius/high
	name = "Soteria \"Power-Geyser 8000L\""
	desc = "Soteria Laboratories branded rechargeable L-standardized power cell. Popular and reliable version."
	icon_state = "meb_b_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 8000

/obj/item/weapon/cell/large/moebius/super
	name = "Soteria \"Power-Geyser 14000L\""
	desc = "Soteria Institute branded rechargeable L-standardized power cell. This advanced version can store even more energy."
	icon_state = "meb_b_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 14000

/obj/item/weapon/cell/large/moebius/hyper
	name = "Soteria \"Power-Geyser 18000L\""
	desc = "Soteria Institute branded rechargeable L-standardized power cell. Looks like this is rare and powerful prototype."
	icon_state = "meb_b_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 18000

/obj/item/weapon/cell/large/moebius/omega
	name = "Soteria \"Omega-Geyser 20000L\""
	desc = "Soteria branded rechargeable L-standardized power cell. This one being part of the Omega line making it the be all end all power cell of its type."
	icon_state = "meb_b_omega"
	matter = list(MATERIAL_STEEL = 12, MATERIAL_PLASTIC = 12, MATERIAL_SILVER = 9, MATERIAL_GOLD = 6) //DEAR LOAD WHAT ARE THOSE COSTS?
	origin_tech = list(TECH_POWER = 7)
	maxcharge = 20000

/obj/item/weapon/cell/large/moebius/nuclear
	name = "Soteria \"Atomcell 14000L\""
	desc = "Soteria Institute branded rechargeable L-standardized power cell. This version able to recharge itself over time."
	icon_state = "meb_b_nu"
	autorecharging = TRUE
	origin_tech = list(TECH_POWER = 6)
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 3, MATERIAL_SILVER = 3, MATERIAL_URANIUM = 6)
	maxcharge = 14000

/obj/item/weapon/cell/large/excelsior
	name = "Excelsior \"Zarya 18000L\""
	desc = "Commie rechargeable L-standardized power cell. Power to the people!"
	icon_state = "exs_l"
	origin_tech = list(TECH_POWER = 3)
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTIC = 2)
	maxcharge = 18000

//Meme cells - for fun and cancer

/obj/item/weapon/cell/large/potato
	name = "potato battery"
	desc = "A rechargable starch based power cell."
	origin_tech = list(TECH_POWER = 1)
	icon = 'icons/obj/power.dmi'
	icon_state = "potato_cell"
	charge = 100
	maxcharge = 300
	minor_fault = 1

/obj/item/weapon/cell/large/slime
	name = "charged slime core"
	desc = "A yellow slime core infused with plasma, it crackles with power."
	origin_tech = list(TECH_POWER = 2, TECH_BIO = 4)
	icon = 'icons/mob/slimes.dmi'
	icon_state = "yellow slime extract"
	maxcharge = 10000
	matter = null

//MEDIUM CELLS - for energy weapons and large devices

/obj/item/weapon/cell/medium
	name = "Lonestar \"Robustcell 600M\""
	desc = "Lonestar branded rechargeable M-standardized power cell. This one is the cheapest you can find."
	icon_state = "m_st"
	w_class = ITEM_SIZE_SMALL
	force = WEAPON_FORCE_HARMLESS
	throw_speed = 5
	throw_range = 7
	maxcharge = 600
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 2)
	price_tag = 100

/obj/item/weapon/cell/medium/high
	name = "Lonestar \"Robustcell 800M\""
	desc = "Lonestar branded rechargeable M-standardized power cell. Popular and reliable version."
	icon_state = "m_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 800

/obj/item/weapon/cell/medium/super
	name = "Lonestar \"Robustcell 1000M\""
	desc = "Lonestar branded rechargeable M-standardized power cell. This advanced version can store even more energy."
	icon_state = "m_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 1000

/obj/item/weapon/cell/medium/hyper
	name = "Lonestar \"Robustcell-X 1600M\""
	desc = "Lonestar branded rechargeable M-standardized power cell. Looks like this is a rare and powerful prototype."
	icon_state = "m_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 1600

/obj/item/weapon/cell/medium/moebius
	name = "Lonestar \"Power-Geyser 800M\""
	desc = "Lonestar branded rechargeable M-standardized power cell. This one is cheap, yet better than Lonestar models for same price."
	icon_state = "meb_m_st"
	maxcharge = 800

/obj/item/weapon/cell/medium/moebius/high
	name = "Soteria \"Power-Geyser 1000M\""
	desc = "Soteria Institute branded rechargeable M-standardized power cell. Popular and reliable version."
	icon_state = "meb_m_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 1000

/obj/item/weapon/cell/medium/moebius/super
	name = "Soteria \"Power-Geyser 1200M\""
	desc = "Soteria Institute branded rechargeable M-standardized power cell. This advanced version can store even more energy."
	icon_state = "meb_m_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 1200

/obj/item/weapon/cell/medium/moebius/hyper
	name = "Soteria \"Power-Geyser 1400M\""
	desc = "Soteria Institute branded rechargeable M-standardized power cell. Looks like this is rare and powerful prototype."
	icon_state = "meb_m_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 1400

/obj/item/weapon/cell/medium/moebius/omega
	name = "Soteria \"Omega-Geyser 1600M\""
	desc = "Soteria branded rechargeable M-standardized power cell. This one being part of the Omega line making it the be all end all power cell of its type."
	icon_state = "meb_m_omega"
	matter = list(MATERIAL_STEEL = 9, MATERIAL_PLASTIC = 9, MATERIAL_SILVER = 6, MATERIAL_GOLD = 3) //DEAR LOAD WHAT ARE THOSE COSTS?
	origin_tech = list(TECH_POWER = 7)
	maxcharge = 1600

/obj/item/weapon/cell/medium/moebius/nuclear
	name = "Soteria \"Atomcell 1000M\""
	desc = "Soteria Institute branded rechargeable M-standardized power cell. This version able to recharge itself over time."
	icon_state = "meb_m_nu"
	autorecharging = TRUE
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 2, MATERIAL_URANIUM = 4)
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 1000

/obj/item/weapon/cell/medium/excelsior
	name = "Excelsior \"Zarya 1100M\""
	desc = "Commie rechargeable M-standardized power cell. Power to the people!"
	icon_state = "exs_m"
	origin_tech = list(TECH_POWER = 3)
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 1)
	maxcharge = 1100

//SMALL CELLS - for small devices, such as flashlights, analyzers and HUDs.

/obj/item/weapon/cell/small
	name = "Lonestar \"Robustcell 100S\""
	desc = "Lonestar branded rechargeable S-standardized power cell. This one is the cheapest you can find."
	icon_state = "s_st"
	w_class = ITEM_SIZE_TINY
	force = WEAPON_FORCE_HARMLESS
	throw_speed = 5
	throw_range = 7
	maxcharge = 100
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1, MATERIAL_SILVER = 1)
	price_tag = 50

/obj/item/weapon/cell/small/high
	name = "Lonestar \"Robustcell 200S\""
	desc = "Lonestar branded rechargeable S-standardized power cell. Popular and reliable version."
	icon_state = "s_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 200

/obj/item/weapon/cell/small/super
	name = "Lonestar \"Robustcell 300S\""
	desc = "Lonestar branded rechargeable S-standardized power cell. This advanced version can store even more energy."
	icon_state = "s_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 300

/obj/item/weapon/cell/small/hyper
	name = "Lonestar \"Robustcell-X 500S\""
	desc = "Lonestar branded rechargeable S-standardized power cell. Looks like this is a rare and powerful prototype."
	icon_state = "s_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 500

/obj/item/weapon/cell/small/moebius
	name = "Soteria \"Power-Geyser 120S\""
	desc = "Soteria Institute branded rechargeable S-standardized power cell. This one is cheap, yet better than Lonestar models for same price."
	icon_state = "meb_s_st"
	maxcharge = 120

/obj/item/weapon/cell/small/moebius/high
	name = "Soteria \"Power-Geyser 250S\""
	desc = "Soteria Institute branded rechargeable S-standardized power cell. Popular and reliable version."
	icon_state = "meb_s_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 250

/obj/item/weapon/cell/small/moebius/super
	name = "Soteria \"Power-Geyser 300S\""
	desc = "Soteria Institute branded rechargeable S-standardized power cell. This advanced version can store even more energy."
	icon_state = "meb_s_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 300

/obj/item/weapon/cell/small/moebius/hyper
	name = "Soteria \"Power-Geyser 400S\""
	desc = "Soteria Institute branded rechargeable S-standardized power cell. Looks like this is rare and powerful prototype."
	icon_state = "meb_s_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 400

/obj/item/weapon/cell/small/moebius/omega
	name = "Soteria \"Omega-Geyser 500S\""
	desc = "Soteria branded rechargeable S-standardized power cell. This one being part of the Omega line making it the be all end all power cell of its type."
	icon_state = "meb_s_omega"
	matter = list(MATERIAL_STEEL = 5, MATERIAL_PLASTIC = 5, MATERIAL_SILVER = 3, MATERIAL_GOLD = 1) //DEAR LOAD WHAT ARE THOSE COSTS?
	origin_tech = list(TECH_POWER = 7)
	maxcharge = 500

/obj/item/weapon/cell/small/moebius/nuclear
	name = "Soteria \"Atomcell 300S\""
	desc = "Soteria Institute branded rechargeable S-standardized microreactor cell. Recharges itself over time."
	icon_state = "meb_s_nu"
	autorecharging = TRUE
	origin_tech = list(TECH_POWER = 6)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1, MATERIAL_SILVER = 1, MATERIAL_URANIUM = 2)
	maxcharge = 300

/obj/item/weapon/cell/small/moebius/pda
	name = "Soteria \"Atomcell 50S\""
	desc = "Soteria Institute branded S-standardized microreactor cell. Recharges itself over time."
	icon_state = "meb_pda"
	origin_tech = list(TECH_POWER = 4)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1, MATERIAL_URANIUM = 1)
	maxcharge = 50
	// Autorecharge rate is calculated for PDA power consumption: enough to offset it, unless PDA light is on.
	autorecharging = TRUE
	autorecharge_rate = 0.0007
	recharge_time = 1

/obj/item/weapon/cell/small/excelsior
	name = "Excelsior \"Zarya 400S\""
	desc = "Commie rechargeable S-standardized power cell. Power to the people!"
	icon_state = "exs_s"
	origin_tech = list(TECH_POWER = 3)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1)
	maxcharge = 400

// Hand crank
/obj/item/device/manual_charger
	name = "manual recharger"
	desc = "A basic hand crank recharger utilising a manual mechanism."
	icon = 'icons/obj/machines/chemistry.dmi'
	icon_state = "centrifuge_makeshift"
	matter = list(MATERIAL_STEEL = 30)
	var/obj/item/weapon/cell/cell = null
	var/suitable_cell = /obj/item/weapon/cell

/obj/item/device/makeshift_centrifuge/attack_self(mob/user)
	var/obj/item/weapon/cell/cell
	if(do_after(user, 60 - (1 * user.stats.getMult(STAT_TGH, STAT_LEVEL_ADEPT))))
		if(!cell)
			return
		if(cell.charge >= cell.maxcharge)
			user.visible_message(SPAN_NOTICE("The cell can not be charged any more!"))
			return
		else
			user.visible_message(SPAN_NOTICE("[user] have started to turn handle on \the [src]."), SPAN_NOTICE("You started to turn handle on \the [src]."))
			cell.charge += 100
			return //Stafy Return
