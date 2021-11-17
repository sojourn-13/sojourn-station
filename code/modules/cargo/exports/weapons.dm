// Weapon exports. Stun batons, disablers, etc.

/datum/export/weapon
	include_subtypes = FALSE

/datum/export/weapon/baton
	cost = 100
	unit_name = "stun baton"
	export_types = list(/obj/item/tool/baton)

/datum/export/weapon/knife
	cost = 300
	unit_name = "combat knife"
	export_types = list(/obj/item/tool/knife)

/datum/export/weapon/taser
	cost = 350
	unit_name = "taser"
	export_types = list(/obj/item/gun/energy/taser)

/datum/export/weapon/laser
	cost = 500
	unit_name = "laser gun"
	export_types = list(/obj/item/gun/energy/laser)

/datum/export/weapon/energy_gun
	cost = 900
	unit_name = "energy gun"
	export_types = list(/obj/item/gun/energy/gun,
										/obj/item/gun/energy)

/datum/export/weapon/shotgun
	cost = 350
	unit_name = "combat shotgun"
	export_types = list(/obj/item/gun/projectile/shotgun)


/datum/export/weapon/flashbang
	cost = 15
	unit_name = "flashbang grenade"
	export_types = list(/obj/item/grenade/flashbang)

/datum/export/weapon/teargas
	cost = 15
	unit_name = "tear gas grenade"
	export_types = list(/obj/item/grenade/chem_grenade/teargas)


/datum/export/weapon/flash
	cost = 10
	unit_name = "handheld flash"
	export_types = list(/obj/item/device/flash)
	include_subtypes = TRUE

/datum/export/weapon/handcuffs
	cost = 5
	unit_name = "pair"
	message = "of handcuffs"
	export_types = list(/obj/item/handcuffs)

//////////////////////////////////////////////////////////////////////////////
/////////////////////// Material  Katana's ///////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/export/weapon/katana
	cost = 500
	unit_name = "steel katana"
	export_types = list(/obj/item/material/sword/katana)

/datum/export/weapon/katana/silver
	cost = 1000
	unit_name = "silver katana"
	export_types = list(/obj/item/material/sword/katana/silver)

/datum/export/weapon/katana/gold
	cost = 1500
	unit_name = "gold katana"
	export_types = list(/obj/item/material/sword/katana/gold)

/datum/export/weapon/katana/diamond
	cost = 2500
	unit_name = "diamond katana"
	export_types = list(/obj/item/material/sword/katana/diamond)

/datum/export/weapon/katana/plastic
	cost = 100
	unit_name = "plastic katana"
	export_types = list(/obj/item/material/sword/katana/plastic)

/datum/export/weapon/katana/platinum
	cost = 3000
	unit_name = "platinum katana"
	export_types = list(/obj/item/material/sword/katana/platinum)

/datum/export/weapon/katana/plasteel
	cost = 750
	unit_name = "plasteel katana"
	export_types = list(/obj/item/material/sword/katana/plasteel)

/datum/export/weapon/katana/uranium
	cost = 2000
	unit_name = "uranium katana"
	export_types = list(/obj/item/material/sword/katana/uranium)

/datum/export/weapon/katana/iron
	cost = 250
	unit_name = "iron katana"
	export_types = list(/obj/item/material/sword/iron)
