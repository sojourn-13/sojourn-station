/obj/item/gun/energy/lasercore
	name = "\"Laser Core\" laser carbine"
	desc = "A high-powered laser carbine made by H&S. It was hailed back in its prime for its high-powered shots and compactness. However, it really consumes power."
	icon = 'icons/obj/guns/energy/lasercore.dmi'
	icon_state = "lcore"
	item_state = "lcore"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/energy/laser_sniper.ogg'
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_BULKY
	projectile_type = /obj/item/projectile/beam/heavylaser
	projectile_color = "#0000FF"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 8, MATERIAL_SILVER = 10, MATERIAL_GOLD = 2)
	charge_cost = 120
	fire_delay = 10
	price_tag = 950
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
