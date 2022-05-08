/obj/item/gun/energy/laser
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
	serial_type = "Absolute"

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
	desc = "A miniaturized laser rifle, remounted for robotic use only."
	icon_state = "laser_turret"
	damage_multiplier = 0.9
	charge_meter = FALSE
	twohanded = FALSE
	serial_type = "GP"

/obj/item/gun/energy/laser/mounted/cyborg
	name = "integrated \"Cog\" lasgun"
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
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 8, MATERIAL_SILVER = 2)
	price_tag = 500
	projectile_type = /obj/item/projectile/beam/practice

/obj/item/gun/energy/captain
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
	serial_type = "GP"

/obj/item/gun/energy/firestorm
	name = "\"Firestorm\" assault SMG"
	desc = "A front loading laser SMG made more close quarters, compactness and its high rate of fire. Luckily it appears to make up for its charge usage by taking medium cell batteries.\
	On the side of the gun under the barrel appears to be an 'H&S' marking. Surprising considering the quality of the weapon!"
	icon = 'icons/obj/guns/energy/firestorm.dmi'
	icon_state = "firestorm"
	item_state = "firestorm"
	w_class = ITEM_SIZE_NORMAL
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/Laser.ogg'
	can_dual = TRUE
	projectile_type = /obj/item/projectile/beam/weak/smg
	projectile_color = "#0000FF"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_PLASTEEL = 13, MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 2, MATERIAL_GLASS = 4)
	price_tag = 1100
	damage_multiplier = 0.8
	recoil_buildup = 2
	one_hand_penalty = 3
	projectile_type = /obj/item/projectile/beam
	cell_type = /obj/item/cell/small
	charge_cost = 40
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	init_firemodes = list(
		BURST_8_ROUND,
		FULL_AUTO_600
		)
	folding_stock = TRUE //we can fold are stocks
	serial_type = "H&S"

/obj/item/gun/energy/firestorm/update_icon()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(charge_meter)
		var/ratio = 0

		//make sure that rounding down will not give us the empty state even if we have charge for a shot left.
		if(cell && cell.charge >= charge_cost)
			ratio = cell.charge / cell.maxcharge
			ratio = min(max(round(ratio, 0.25) * 100, 25), 100)

		if(modifystate)
			iconstring = "[modifystate][ratio]"
		else
			iconstring = "[initial(icon_state)][ratio]"

		if(item_charge_meter)
			itemstring += "-[item_modifystate][ratio]"

	if (!cell)
		iconstring += "_slide"

	if(wielded)
		itemstring += "_doble"

	if(!folded)
		iconstring += "_stock"


	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/energy/lasercore
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
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	init_firemodes = list(
		WEAPON_NORMAL
	)
	twohanded = TRUE
	folding_stock = TRUE //we can fold are stocks
	serial_type = "H&S"

/obj/item/gun/energy/lasercore/update_icon()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(charge_meter)
		var/ratio = 0

		//make sure that rounding down will not give us the empty state even if we have charge for a shot left.
		if(cell && cell.charge >= charge_cost)
			ratio = cell.charge / cell.maxcharge
			ratio = min(max(round(ratio, 0.25) * 100, 25), 100)

		if(modifystate)
			iconstring = "[modifystate][ratio]"
		else
			iconstring = "[initial(icon_state)][ratio]"

		if(item_charge_meter)
			itemstring += "-[item_modifystate][ratio]"

	if (!cell)
		iconstring += "_slide"

	if(wielded)
		itemstring += "_doble"

	if(!folded)
		iconstring += "_stock"


	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/energy/sunrise
	name = "\"Sunrise\" laser SMG"
	desc = "The \"Sunrise\" laser SMG is a Nadezhda Marshal's special in terms of its creation.\
	This once dated SMG design has been completely stripped down and shoved full of hardware from a Firestorm and Discolaser.\
	However parts themselves appear to have been modified to allow for the beams to keep much of their power through high-focused lenses!\
	Etched into the guns receiver on the left side is a script \"M\" letter."
	icon = 'icons/obj/guns/energy/sunrise.dmi'
	icon_state = "sunrise"
	item_state = "sunrise"
	fire_sound = 'sound/weapons/guns/fire/sunrise_fire.ogg'
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BACK
	item_charge_meter = TRUE
	can_dual = FALSE
	twohanded = TRUE
	projectile_type = /obj/item/projectile/beam/midlaser
	projectile_color = "#C48A18"
	cell_type = /obj/item/cell/medium
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 10, MATERIAL_SILVER = 4, MATERIAL_GLASS = 10, MATERIAL_URANIUM = 2)
	recoil_buildup = 2
	damage_multiplier = 0.75
	penetration_multiplier = 1.0
	price_tag = 3000
	charge_cost = 20
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	init_firemodes = list(
		BURST_8_ROUND,
		FULL_AUTO_800
		)
	serial_type = "NM"

/obj/item/gun/energy/sunrise/update_icon()
	..()
	overlays.Cut()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(charge_meter)
		var/ratio = 0

		//make sure that rounding down will not give us the empty state even if we have charge for a shot left.
		if(cell && cell.charge >= charge_cost)
			ratio = cell.charge / cell.maxcharge
			ratio = min(max(round(ratio, 0.25) * 100, 25), 100)

		if(modifystate)
			iconstring = "[modifystate][ratio]"
		else
			iconstring = "[initial(icon_state)][ratio]"

	if (cell)
		iconstring += "_mag"
		itemstring += "_mag"

	if(istype(cell, /obj/item/cell/medium/moebius/nuclear))
		overlays += image(icon, "nuke_cell")

	else if(istype(cell, /obj/item/cell/medium/moebius))
		overlays += image(icon, "moeb_cell")

	else if(istype(cell, /obj/item/cell/medium/excelsior))
		overlays += image(icon, "excel_cell")

	else if(istype(cell, /obj/item/cell/medium))
		overlays += image(icon, "guild_cell")

/obj/item/gun/energy/peacekeeper
	name = "\"Peacekeeper\" energy shotgun"
	desc = "The \"Peacekeeper\" enegry shotgun is a Marshal made weapon, specializing in blasting high-powered electrodes from its cell's charge.\
	Despite appearing to be made in a hurry the gun is incredibly versitile, though it risks burning its cell out on lethal firemodes."
	icon = 'icons/obj/guns/energy/peacekeeper.dmi'
	icon_state = "peacekeeper"
	item_state = "peacekeeper"
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BACK
	item_charge_meter = TRUE
	can_dual = FALSE
	twohanded = TRUE
	cell_type = /obj/item/cell/medium
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_STEEL = 8, MATERIAL_WOOD = 10, MATERIAL_SILVER = 4)
	fire_delay = 30
	recoil_buildup = 12
	damage_multiplier = 1
	penetration_multiplier = 0.7
	price_tag = 900
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	init_firemodes = list(
		list(mode_name="stunshot", projectile_type=/obj/item/projectile/energy/electrode/stunshot, fire_sound= 'sound/weapons/Taser.ogg', charge_cost = 200, icon="stun"),
		list(mode_name="buckshot", projectile_type=/obj/item/projectile/bullet/pellet/shotgun/energy, fire_sound='sound/weapons/guns/fire/sunrise_fire.ogg', charge_cost = 100, icon="kill"),
	)

/obj/item/gun/energy/peacekeeper/update_icon()
	..()
	overlays.Cut()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(charge_meter)
		var/ratio = 0

		//make sure that rounding down will not give us the empty state even if we have charge for a shot left.
		if(cell && cell.charge >= charge_cost)
			ratio = cell.charge / cell.maxcharge
			ratio = min(max(round(ratio, 0.25) * 100, 25), 100)

		if(modifystate)
			iconstring = "[modifystate][ratio]"
		else
			iconstring = "[initial(icon_state)][ratio]"

		if(item_charge_meter)
			itemstring += "-[item_modifystate][ratio]"

	if (!cell)
		iconstring += "-slide"

	if(wielded)
		itemstring += "_doble"

/obj/item/gun/energy/peacekeeper/proc/update_mode()
	var/datum/firemode/current_mode = firemodes[sel_mode]
	if(current_mode.name == "stunshot")
		add_overlay("peacekeeper")
	else
		add_overlay("lpeacekeeper")

/obj/item/gun/energy/zwang
	name = "\"Zwang\" energy revolver"
	desc = "The \"Zwang\" is a law enforcer's best friend of a sidearm. Carrying both an extremely effective lethal and non-lethal firemode. \
	Luckily it does not sacrifice style for effiency neither. The 'revolver' spins its cell while firing, mimicking that of a double-action to make use of multiple connection points."
	icon = 'icons/obj/guns/energy/zwang.dmi'
	icon_state = "zwang"
	item_state = "zwang"
	item_charge_meter = TRUE
	can_dual = TRUE
	charge_cost = 160
	matter = list(MATERIAL_PLASTEEL = 13, MATERIAL_PLASTIC = 6, MATERIAL_SILVER = 6)
	price_tag = 1600

	init_firemodes = list(
		list(mode_name="stunshot", projectile_type=/obj/item/projectile/energy/electrode/stunshot, fire_sound = 'sound/weapons/Taser.ogg', fire_delay=80, icon="stun"),
		list(mode_name="lethal", projectile_type=/obj/item/projectile/beam/midlaser, fire_sound='sound/weapons/Laser.ogg', fire_delay=40, icon="kill"),
	)

/obj/item/gun/energy/zwang/update_icon()
	..()
	overlays.Cut()
	var/datum/firemode/current_mode = firemodes[sel_mode]
	if(current_mode.name == "stunshot")
		add_overlay("tazer_zwang")
	else
		add_overlay("laser_zwang")