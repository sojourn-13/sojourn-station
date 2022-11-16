/obj/item/gun/energy/cog
	name = "\"Cog\" lasgun"
	icon = 'icons/obj/guns/energy/cog.dmi'
	icon_state = "cog"
	item_state = null	//so the human update icon uses the icon_state instead.
	item_charge_meter = TRUE
	desc = "A Greyson Positronic design, cheap and widely produced. In the distant past - this was the main weapon of low-rank police forces, billions of copies of this gun were made. They are ubiquitous."
	fire_sound = 'sound/weapons/Laser.ogg'
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_BULKY
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 15, MATERIAL_GLASS = 5)
	projectile_type = /obj/item/projectile/beam
	fire_delay = 10 //old technology
	charge_cost = 50
	price_tag = 800
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	init_firemodes = list(
		WEAPON_NORMAL
	)
	twohanded = TRUE
	serial_type = "GP"
	max_upgrades = 4 //Older platform meaning 1 less

/obj/item/gun/energy/cog/gear
	name = "\"Gear\" lasgun"
	desc = "A Greyson Positronic design, cheap and widely produced. In the distant past - this was the main weapon of low-rank police forces, billions of copies of this gun were made. They are ubiquitous. \
	This model has been modified by the Marshals to allow for non-lethal electrodes to be discharged as well as lasers, but at the cost of its cell-usage efficiency."
	icon = 'icons/obj/guns/energy/cog_alt.dmi' // Using their proper sprite now
	w_class = ITEM_SIZE_BULKY
	fire_delay = 10
	projectile_type = /obj/item/projectile/beam/stun
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 15, MATERIAL_SILVER = 10)
	init_firemodes = list(
		list(mode_name="stun", mode_desc="fires a concentrated stun beam", projectile_type=/obj/item/projectile/beam/stun, charge_cost = 50, icon="stun", fire_sound='sound/weapons/Taser3.ogg'),
		list(mode_name="lethal", mode_desc="fires a concentrated laser blast", projectile_type=/obj/item/projectile/beam, charge_cost = 50, icon="kill", fire_sound='sound/weapons/Laser4.ogg')
	)
	serial_type = "NM"

/* Far removed from original concept, do not uncomment. - Seb

/obj/item/gun/energy/cog/sprocket
	name = "Soteria \"Sprocket\" lasgun"
	desc = "Originally a Greyson Positronic design, tinkered by Marshals to allow nonlethal reduction of rowdy personnel, this gun has been further modified by Soteria to include a foldable stock, \
			making it lightweight and easy to operate by non-trained personnel, at the cost of its laser component being downsized making it pack less of a punch."
	icon = 'icons/obj/guns/energy/sprocket.dmi'
	icon_state = "sprocket"
	damage_multiplier = 0.9 // +0.1 when unfolded = baseline Cog
	penetration_multiplier = 0.8 // +0.2 when unfolded = base Cog
	projectile_type = /obj/item/projectile/beam/stun
	w_class = ITEM_SIZE_NORMAL // Starts folded, bulk added when unfolded FAR surpasses BULKY class
	folding_stock = TRUE // Foldable stock for easy carry
	price_tag = 950
	fire_delay = 10
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 10, MATERIAL_SILVER = 10)
	init_firemodes = list(
		list(mode_name="stun", mode_desc="Fires a ball of condensed energy to disable people", projectile_type=/obj/item/projectile/energy/electrode, charge_cost = 300, fire_delay=50, icon="grenade", fire_sound='sound/weapons/Taser.ogg'),
		list(mode_name="lethal", mode_desc="Fires a concentrated laser blast", projectile_type=/obj/item/projectile/beam/weak, charge_cost = 50, icon="kill", fire_sound='sound/weapons/Laser.ogg')
	)
	serial_type = "GP-SI"

/obj/item/gun/energy/cog/sprocket/update_icon() // Necessary for the folded and unfolded states
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(charge_meter)
		var/ratio = 0

		if(cell && cell.charge >= charge_cost)
			ratio = cell.charge / cell.maxcharge
			ratio = min(max(round(ratio, 0.25) * 100, 25), 100)

		if(modifystate)
			iconstring = "[modifystate][ratio]"
		else
			iconstring = "[initial(icon_state)][ratio]"

		if(item_charge_meter)
			itemstring += "-[item_modifystate][ratio]"

	if(wielded)
		itemstring += "_double"

	if(!folded)
		iconstring += "_stock"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/energy/cog/sprocket/preloaded // Preloaded version for the Lifeline Tech gear

/obj/item/gun/energy/cog/sprocket/preloaded/New()
	cell = new /obj/item/cell/medium/moebius/high(src)
	. = ..()
	update_icon()
*/

/obj/item/gun/energy/cog/sawn
	name = " \"Pinion\" lasgun"
	icon = 'icons/obj/guns/energy/obrez_retro.dmi'
	desc = "Nicknamed the 'Coglet', The \"Pinion\" lasgun is the result of advanced AI conforming the Cog to meet the demand of mercurial gun laws. Concessions have been made, but by excluding the stock and much of the focusing lens, the weapon just barely squeezes into a standard-issue holster."
	icon_state = "shorty"
	item_state = "shorty"
	slot_flags = SLOT_BACK|SLOT_HOLSTER
	matter = list(MATERIAL_STEEL = 5, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 5)
	damage_multiplier = 0.7
	penetration_multiplier = 0.7
	charge_cost = 50
	price_tag = 400
	init_firemodes = list(
		WEAPON_NORMAL
	)
	twohanded = FALSE
	init_recoil = HANDGUN_RECOIL(0.2)
	serial_type = "GP-SI"
