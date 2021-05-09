/obj/item/weapon/gun/energy/sst
	name = "\"SST Abnegate\" handgun"
	desc = "\"Soteria Surface Tension\" brand handgun. A cooperative project between Soteria Medical and Soteria Research, the Abnegate uses Greyson tech to internally synthesize soporific coated .35 calliber bullets. \
	Initially designed at the request of orderlies for a proper way to sedate rowdy armored targets from a distance."
	icon = 'icons/obj/guns/energy/abnegate.dmi'
	icon_state = "abnegate"
	item_state = "abnegate"
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	origin_tech = list(TECH_COMBAT = 10)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_STEEL = 8, MATERIAL_SILVER = 8, MATERIAL_PLATINUM = 2)
	charge_cost = 100
	twohanded = FALSE
	gun_tags = list(GUN_PROJECTILE, GUN_LASER, GUN_ENERGY, GUN_CALIBRE_35)
	suitable_cell = /obj/item/weapon/cell/medium
	fire_delay = 5
	recoil_buildup = 2
	can_dual = TRUE
	damage_multiplier = 1.2
	projectile_type=/obj/item/projectile/bullet/pistol_35/rubber/soporific
	price_tag = 1750

/obj/item/weapon/gun/energy/sst/formatbound
	name = "\"SST Format Bound\" handgun"
	desc = "\"Soteria Surface Tension\" brand heavy handgun. Further development on the cooperative project between Soteria Medical and Soteria Research known as Soteria Surface Tension. \
	This heavy handgun fires a stronger bullet and carries more anesthetics, for the stubborn person that won't get out of your medical bay."
	icon = 'icons/obj/guns/energy/format_bound.dmi'
	icon_state = "format_bound"
	item_state = "format_bound"
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	charge_cost = 150
	gun_tags = list(GUN_PROJECTILE, GUN_LASER, GUN_ENERGY)
	suitable_cell = /obj/item/weapon/cell/medium
	fire_delay = 12
	recoil_buildup = 6
	can_dual = FALSE
	damage_multiplier = 1.3
	projectile_type=/obj/item/projectile/bullet/magnun_40/rubber/soporific
	matter = list(MATERIAL_PLASTEEL = 18, MATERIAL_STEEL = 10,  MATERIAL_SILVER = 12, MATERIAL_PLATINUM = 5)
	price_tag = 1600

/obj/item/weapon/gun/energy/sst/humility
	name = "\"SST Humility\" shotgun"
	desc = "\"Soteria Surface Tension\" brand semi-automatic shotgun. Larger threats demanded larger ordinance and Soteria responded to the internal need for such equipment. \
	Its internal mechanism prints out soporific coated ammunition as it fires. The Humility has the firepower to down larger monstrous targets as well as stop anyone why may be posing a threat to Soteria Medical. "
	icon = 'icons/obj/guns/energy/humility.dmi'
	wielded_item_state = "_doble"
	icon_state = "humility"
	item_state = "humility"
	charge_cost = 800
	fire_sound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_LASER, GUN_ENERGY)
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	charge_meter = FALSE
	twohanded = TRUE
	suitable_cell = /obj/item/weapon/cell/large
	slot_flags = SLOT_BACK
	matter = list(MATERIAL_PLASTEEL = 30, MATERIAL_STEEL = 20, MATERIAL_SILVER = 15, MATERIAL_GOLD = 12, MATERIAL_PLATINUM = 10)
	price_tag = 2500
	recoil_buildup = 15
	projectile_type=/obj/item/projectile/bullet/shotgun/beanbag/soporific
	can_dual = FALSE
	damage_multiplier = 1.2
	fire_delay = 18

/obj/item/weapon/gun/energy/sst/humility/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(wielded)
		itemstring += "_doble"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/energy/sst/systemcost
	name = "\"SST System Cost\" light machinegun"
	desc = "\"Soteria Surface Tension\" brand light machinegun. The true answer to a horde of either monsters or rubberneckers in the medical bay. \
	Able to fire soporific coated bullets at a high rate of fire, the System Cost is an orderly's dream come true."
	icon = 'icons/obj/guns/energy/system_cost.dmi'
	icon_state = "system_cost"
	item_state = "system_cost"
	fire_sound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	wielded_item_state = "_doble"
	projectile_type=/obj/item/projectile/bullet/rifle_75/rubber/soporific
	can_dual = FALSE
	price_tag = 3200
	charge_meter = FALSE
	charge_cost = 450
	suitable_cell = /obj/item/weapon/cell/large
	recoil_buildup = 2
	can_dual = FALSE
	twohanded = TRUE
	gun_tags = list(GUN_PROJECTILE, GUN_LASER, GUN_ENERGY)
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	matter = list(MATERIAL_PLASTEEL = 35, MATERIAL_STEEL = 25, MATERIAL_SILVER = 15, MATERIAL_GOLD = 12, MATERIAL_PLATINUM = 12, MATERIAL_URANIUM = 8)
	damage_multiplier = 1.2
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		FULL_AUTO_300
		)

/obj/item/weapon/gun/energy/sst/systemcost/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(wielded)
		itemstring += "_doble"

	icon_state = iconstring
	set_item_state(itemstring)
