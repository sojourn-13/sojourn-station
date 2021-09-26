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
	price_tag = 900
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	init_firemodes = list(
		WEAPON_NORMAL,
		BURST_2_ROUND
	)
	twohanded = TRUE

/obj/item/gun/energy/cog/New()
	..()
	if(prob(50))
		icon = 'icons/obj/guns/energy/cog_alt.dmi'
	return
