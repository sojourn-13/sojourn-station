/obj/item/weapon/gun/energy/laser
	name = "\"Lightfall\" laser rifle"
	desc = "\"Old Testament\" brand laser carbine. Deadly and radiant, like the ire of God it represents."
	icon = 'icons/obj/guns/energy/laser.dmi'
	icon_state = "laser"
	item_state = "laser"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/Laser.ogg'
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 8, MATERIAL_SILVER = 5)
	price_tag = 1250
	projectile_type = /obj/item/projectile/beam/midlaser
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	init_firemodes = list(
		WEAPON_NORMAL,
		WEAPON_CHARGE
	)
	twohanded = TRUE

/obj/item/weapon/gun/energy/laser/mounted
	self_recharge = TRUE
	use_external_power = TRUE
	safety = FALSE
	restrict_safety = TRUE
	damage_multiplier = 0.7
	twohanded = FALSE

/obj/item/weapon/gun/energy/laser/mounted/blitz
	name = "SDF LR \"Strahl\""
	desc = "A miniaturized laser rifle, remounted for robotic use only."
	icon_state = "laser_turret"
	damage_multiplier = 0.9
	charge_meter = FALSE
	twohanded = FALSE

/obj/item/weapon/gun/energy/laser/mounted/cyborg
	name = "integrated \"Cog\" lasgun"
	desc = "A Greyson Positronic design, cheap and widely produced. In the distant past - this was the main weapon of low-rank police forces, billions of copies of this gun were made."
	recharge_time = 10 //Time it takes for shots to recharge (in ticks)

/obj/item/weapon/gun/energy/laser/practice
	name = "OT LG \"Lightfall\" - P"
	desc = "A modified version of \"Old Testament\" brand laser carbine, this one fires less concentrated energy bolts, designed for target practice."
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 8, MATERIAL_SILVER = 2)
	price_tag = 500
	projectile_type = /obj/item/projectile/beam/practice

/obj/item/weapon/gun/energy/retro
	name = "\"Cog\" lasgun"
	icon = 'icons/obj/guns/energy/retro.dmi'
	icon_state = "retro"
	item_state = null	//so the human update icon uses the icon_state instead.
	item_charge_meter = TRUE
	desc = "A Greyson Positronic design, cheap and widely produced. In the distant past - this was the main weapon of low-rank police forces, billions of copies of this gun were made. They are ubiquitous."
	fire_sound = 'sound/weapons/Laser.ogg'
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_HUGE
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 15, MATERIAL_GLASS = 5)
	projectile_type = /obj/item/projectile/beam
	fire_delay = 10 //old technology
	charge_cost = 50
	price_tag = 1000
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	init_firemodes = list(
		WEAPON_NORMAL,
		BURST_2_ROUND
	)
	twohanded = TRUE

/obj/item/weapon/gun/energy/retro/New()
	..()
	if(prob(50))
		icon = 'icons/obj/guns/energy/retro_alt.dmi'
	return

/obj/item/weapon/gun/energy/captain
	name = "\"Destiny\" energy pistol"
	icon = 'icons/obj/guns/energy/capgun.dmi'
	icon_state = "caplaser"
	item_state = "caplaser"
	item_charge_meter = TRUE
	desc = "This weapon is old, yet still robust and reliable. It's marked with an old Greyson Positronic brand, a distant reminder of what this corporation was, before it fell to ruin."
	force = WEAPON_FORCE_PAINFUL
	fire_sound = 'sound/weapons/Laser.ogg'
	slot_flags = SLOT_BELT
	w_class = ITEM_SIZE_NORMAL
	can_dual = TRUE
	projectile_type = /obj/item/projectile/beam
	origin_tech = null
	self_recharge = TRUE
	price_tag = 2250
	init_firemodes = list(
		WEAPON_NORMAL,
		WEAPON_CHARGE
	)
	twohanded = FALSE

/obj/item/weapon/gun/energy/firestorm
	name = "\"Firestorm\" assault SMG"
	desc = "A front loading laser SMG made more close quarters, compactness and its high rate of fire. Luckily it appears to make up for its charge usage by taking medium cell batteries.\
	On the side of the gun under the barrel appears to be an 'H&S' marking. Surprising considering the quality of the weapon!"
	icon = 'icons/obj/guns/energy/firestorm.dmi'
	icon_state = "firestorm"
	item_state = "firestorm"
	w_class = ITEM_SIZE_NORMAL
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/Laser.ogg'
	suitable_cell = /obj/item/weapon/cell/medium
	can_dual = TRUE
	projectile_type = /obj/item/projectile/beam/weak/smg
	projectile_color = "#0000FF"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_PLASTEEL = 13, MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 2, MATERIAL_GLASS = 4)
	price_tag = 650
	damage_multiplier = 0.8
	recoil_buildup = 2
	one_hand_penalty = 3
	projectile_type = /obj/item/projectile/beam
	suitable_cell = /obj/item/weapon/cell/medium
	cell_type = /obj/item/weapon/cell/small
	charge_cost = 40
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	init_firemodes = list(
		BURST_8_ROUND,
		FULL_AUTO_600
		)

/obj/item/weapon/gun/energy/lasercore
	name = "\"Laser Core\" laser carbine"
	desc = "A high-powered laser carbine made by H&S. It was hailed back in its prime for its high-powered shots and compactness. However, it really consumes power."
	icon = 'icons/obj/guns/energy/lasercore.dmi'
	icon_state = "lcore"
	item_state = "lcore"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/Laser.ogg'
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_BULKY
	projectile_type = /obj/item/projectile/beam/heavylaser
	projectile_color = "#0000FF"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 8, MATERIAL_SILVER = 10, MATERIAL_GOLD = 2)
	charge_cost = 120
	fire_delay = 10
	price_tag = 1200
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	init_firemodes = list(
		WEAPON_NORMAL
	)
	twohanded = TRUE
