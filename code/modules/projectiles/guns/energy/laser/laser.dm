/obj/item/gun/energy/laser
	name = "\"Lightfall\" laser rifle"
	desc = "\"Old Testament\" brand laser carbine. Deadly and radiant, like the divine wrath it represents."
	icon = 'icons/obj/guns/energy/laser.dmi' // No longer scoped, stop the lies!
	icon_state = "laser"
	item_state = "laser"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/energy/laser_rifle.ogg'
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_NORMAL
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_WOOD = 8, MATERIAL_SILVER = 6)
	price_tag = 900
	projectile_type = /obj/item/projectile/beam/midlaser
	fire_delay = 5
	charge_cost = 50
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	init_firemodes = list(
		WEAPON_NORMAL,
		WEAPON_CHARGE
	)
	twohanded = TRUE
	serial_type = "Absolute"

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.2 // 20 vig

/obj/item/gun/energy/laser/mounted
	self_recharge = TRUE
	use_external_power = TRUE
	safety = FALSE
	restrict_safety = TRUE
	damage_multiplier = 0.7
	twohanded = FALSE
	serial_type = "SI"

/obj/item/gun/energy/laser/mounted/blitz
	name = "SDF LR \"Strahl\""
	desc = "A miniaturized laser rifle, remounted for robotic use only. Also has the ablity to have a Master Unmaker integrated into it."
	icon_state = "laser_turret"
	damage_multiplier = 0.9
	charge_meter = FALSE
	twohanded = FALSE
	serial_type = "GP"
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	allow_greyson_mods = TRUE

/obj/item/gun/energy/laser/mounted/cyborg
	name = "integrated \"Cog\" laser carbine"
	desc = "A Greyson Positronic design, cheap and widely produced. In the distant past - this was the main weapon of low-rank police forces, billions of copies of this gun were made."
	icon = 'icons/obj/guns/energy/cog.dmi'
	icon_state = "cog"
	recharge_time = 4 //Time it takes for shots to recharge (in ticks)
	damage_multiplier = 0.8
	projectile_type = /obj/item/projectile/beam/heavylaser
	cell_type = /obj/item/cell/medium/moebius/high
	charge_cost = 50

/obj/item/gun/energy/laser/practice
	name = "OT LG \"Lightfall\" - P"
	desc = "A modified version of \"Old Testament\" brand laser carbine, this one fires less concentrated energy bolts, designed for target practice."
	matter = list(MATERIAL_STEEL = 10, MATERIAL_WOOD = 2)
	price_tag = 150
	projectile_type = /obj/item/projectile/beam/practice

/obj/item/gun/energy/captain
	name = "\"Destiny\" energy pistol"
	icon = 'icons/obj/guns/energy/capgun.dmi'
	icon_state = "caplaser"
	item_state = "caplaser"
	item_charge_meter = TRUE
	desc = "This self-recharging weapon is old, yet still robust and reliable. It's marked with an old Greyson Positronic brand, a distant reminder of what this corporation was, before it fell to ruin. Also has the ablity to have a Master Unmaker integrated into it."
	force = WEAPON_FORCE_PAINFUL
	fire_sound = 'sound/weapons/energy/laser_pistol.ogg'
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_HOLSTER
	w_class = ITEM_SIZE_NORMAL
	can_dual = TRUE
	projectile_type = /obj/item/projectile/beam
	origin_tech = null
	self_recharge = TRUE
	price_tag = 2250
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	init_firemodes = list(
		WEAPON_NORMAL,
		WEAPON_CHARGE
	)
	twohanded = FALSE
	allow_greyson_mods = TRUE
	serial_type = "GP"

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // 20 vig

/obj/item/gun/energy/zwang
	name = "\"Zwang\" energy revolver"
	desc = "The \"Zwang\" is a law enforcer's best friend of a sidearm. Carrying both an extremely effective lethal and non-lethal firemode. \
	Luckily, it does not sacrifice style for efficiency. The 'cylinder' spins its cell while firing, mimicking a double-action revolver mechanism to make use of multiple connection points."
	icon = 'icons/obj/guns/energy/zwang.dmi'
	icon_state = "zwang"
	item_state = "zwang"
	item_charge_meter = TRUE
	can_dual = TRUE
	charge_cost = 160
	matter = list(MATERIAL_PLASTEEL = 13, MATERIAL_PLASTIC = 6, MATERIAL_SILVER = 6)
	price_tag = 1400

	init_firemodes = list(
		list(mode_name="stunshot", projectile_type=/obj/item/projectile/energy/electrode/stunshot, fire_sound = 'sound/weapons/energy/Taser.ogg', fire_delay=35, icon="stun"),
		list(mode_name="lethal", projectile_type=/obj/item/projectile/beam/midlaser, fire_sound='sound/weapons/energy/laser_pistol.ogg', fire_delay=10, icon="kill"),
	)
	serial_type = "NM"

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // 20 vig

/obj/item/gun/energy/zwang/update_icon()
	..()
	cut_overlays()
	var/datum/firemode/current_mode = firemodes[sel_mode]
	if(current_mode.name == "stunshot")
		add_overlay("tazer_zwang")
	else
		add_overlay("laser_zwang")
