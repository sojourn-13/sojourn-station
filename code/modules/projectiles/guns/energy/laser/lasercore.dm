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

/obj/item/gun/energy/lasercore/militia
	name = "Blackshield \"Laser Core\" carbine"
	desc = "A high-powered laser carbine made by H&S and modified by the Marshals. Hailed in its prime for its high power and compactness, notable improvements have been made to its energy efficiency and it bears blackshield IFF stripes. however it is somewhat slower to fire."
	icon = 'icons/obj/guns/energy/lasercore_bs.dmi'
	icon_state = "lcore"
	item_state = "lcore"
	projectile_color = "#6f5791"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 8, MATERIAL_SILVER = 10, MATERIAL_GOLD = 2)
	charge_cost = 100
	fire_delay = 13
	price_tag = 1100 //slightly more expensive. Tweaked!
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	init_firemodes = list(
		WEAPON_NORMAL
	)
	serial_type = "NM"

/obj/item/gun/energy/lasercore/militia/blaster
	name = "\"Gleam\" Laser Rifle"
	desc = "An old and venerable design from arms giants H&S. Originally pitched as a high-end upgrade to the 'Laser Core' available to those Federation forces \
	with both the need and finances to afford it. Insanely tempermental, these weapons while an improvement in almost every way over their base platform are infamous \
	for its high maintenance, requiring both frequent and expensive parts replacement to remain up to spec. This one still bears the scar of its H&S serial which appears\
	to have been 'drawn over' with an electro-stensil."
	icon = 'icons/obj/guns/energy/gleam.dmi' //Credit to Aurora for the sprite that I shamelessly kitbashed to serve my costs.
	icon_state = "gleam"
	item_state = "gleam"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 4, MATERIAL_WOOD = 12, MATERIAL_SILVER = 15, MATERIAL_GOLD = 4, MATERIAL_DIAMOND = 3) //steal the COs laser for copper wire.
	extra_bulk = 15 //A bit more bulk than an unfolded laser-core.
	damage_multiplier = 1.1 //essentially the same bonus you get from
	armor_divisor = 0.2
	zoom_factors = list(0.4)
	extra_damage_mult_scoped = 0.2
	max_upgrades = 3 //we're already pretty beefy.
	charge_cost = 80
	fire_delay = 10
	price_tag = 2500 //SPENSIVE
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	folding_stock = FALSE
	init_firemodes = list(
		WEAPON_NORMAL,
		BURST_2_ROUND
		)
