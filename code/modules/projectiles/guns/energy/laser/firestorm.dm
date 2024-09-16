/obj/item/gun/energy/firestorm
	name = "\"Firestorm\" assault SMG"
	desc = "A front loading laser SMG made for close quarter and medium range combat, its compactness and its high rate of fire leaving its targets aflame has earned its nickname. Luckily it appears to make up for its charge usage by taking medium cell batteries.\
	On the side of the gun under the barrel appears to be an 'H&S' marking. Surprising considering the quality of the weapon!"
	icon = 'icons/obj/guns/energy/firestorm.dmi'
	icon_state = "firestorm"
	item_state = "firestorm"
	w_class = ITEM_SIZE_NORMAL
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/guns/fire/sunrise_fire.ogg' // Also a laser SMG
	can_dual = TRUE
	projectile_type = /obj/item/projectile/beam/weak/smg/firestorm
	projectile_color = "#0000FF"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_PLASTEEL = 13, MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 2, MATERIAL_GLASS = 4)
	price_tag = 850
	damage_multiplier = 0.8
	init_recoil = CARBINE_RECOIL(0.2)
	projectile_type = /obj/item/projectile/beam
	cell_type = /obj/item/cell/small
	charge_cost = 40
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	init_firemodes = list(
		BURST_8_ROUND,
		FULL_AUTO_600
		)
	folding_stock = TRUE //we can fold our stock
	serial_type = "H&S"

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.2 // 20 vig

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
