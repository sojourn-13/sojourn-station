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

/obj/item/gun/energy/cog/shotgun
	name = "\"Abdicator\" energy shotgun"
	icon = 'icons/obj/guns/energy/abdication.dmi'
	icon_state = "abdication"
	item_state = null
	item_charge_meter = TRUE
	desc = "A shotgun that epitomizes the truth that the tallest of buildings and grandest achievments are built by digging the deepest into the earth, \
	fires superheated-shot in a crimson splutter, as the Reductor rail rifle. \
	This Artificier craft is said to have been conceived originally by Soteria, opted into cooperation with the guild so that it might actually see regular use, in the practised hands of any guild adept. There is no adoption without loss."
	fire_sound = 'sound/weapons/emitter2.ogg'
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun/energy
	can_dual = FALSE
	w_class = ITEM_SIZE_HUGE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 8, MATERIAL_SILVER = 10)
	fire_delay = 25
	charge_cost = 300
	recoil_buildup = 12 //Big blast of heated shot, got some recoil to it.
	damage_multiplier = 1.0 //already quite a bit lethal and dangerous with the burn damage and 'close range spray'.
	gun_tags = list(GUN_PROJECTILE, GUN_LASER, GUN_ENERGY) //essentially a scattershot reductor.
	init_firemodes = list(
	WEAPON_NORMAL
	)