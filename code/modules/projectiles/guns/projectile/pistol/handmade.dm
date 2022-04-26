/obj/item/gun/projectile/handmade_pistol
	name = "handmade pistol"
	desc = "An unreliable hand-crafted pistol liable to blow up in your hands, while it has a chance to jam with every shot its easy and cheap to make with customizable calibers. \
	Reloading, clearing jams, and opening or closing the chamber is done with a screwdriver. This one chambers up to six .35 pistol ammo."
	icon = 'icons/obj/guns/projectile/hm_pistol.dmi'
	icon_state = "hm_pistol"
	item_state = "pistol"
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	matter = list(MATERIAL_STEEL = 3, MATERIAL_WOOD = 2)
	can_dual = TRUE
	load_method = SINGLE_CASING
	max_shells = 6
	damage_multiplier = 1.36
	recoil_buildup = 2
	var/chamber_open = FALSE
	var/jammed = FALSE
	var/jam_chance = 15
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_CALIBRE_35)
	max_upgrades = 0
	price_tag = 50
	serial_type = "INDEX"
	serial_shown = FALSE

/obj/item/gun/projectile/handmade_pistol/magnum
	name = "handmade magnum"
	desc = "An unreliable hand-crafted pistol liable to blow up in your hands, while it has a chance to jam with every shot its easy and cheap to make with customizable calibers. \
	Reloading, clearing jams, and opening or closing the chamber is done with a screwdriver. This one chambers up to four .40 magnum ammo."
	caliber = CAL_MAGNUM
	max_shells = 4
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)
	price_tag = 60

/obj/item/gun/projectile/handmade_pistol/shotgun
	name = "handmade slugger"
	desc = "An unreliable hand-crafted pistol liable to blow up in your hands, while it has a chance to jam with every shot its easy and cheap to make with customizable calibers. \
	Reloading, clearing jams, and opening or closing the chamber is done with a screwdriver. This one chambers up to two 20mm shotgun ammo. This model sports a higher jam chance \
	and recoil as a result of its caliber."
	caliber = CAL_SHOTGUN
	max_shells = 2
	recoil_buildup = 18 //Still a shotgun
	jam_chance = 25
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)
	price_tag = 70

/obj/item/gun/projectile/handmade_pistol/anti_material
	name = "handmade man-opener"
	desc = "An unreliable hand-crafted pistol liable to blow up in your hands, while it has a chance to jam with every shot its easy and cheap to make with customizable calibers. \
	Reloading, clearing jams, and opening or closing the chamber is done with a screwdriver. This one chambers up to one .60-06 anti material ammo. What mad man made this? It's jam chance and recoil \
	are much higher than normal."
	caliber = CAL_ANTIM
	max_shells = 1
	damage_multiplier = 1
	recoil_buildup = 30 //still a massive bullet
	jam_chance = 35
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)
	price_tag = 75

obj/item/gun/projectile/handmade_pistol/New()
	..()
	open_chamber()

/obj/item/gun/projectile/handmade_pistol/special_check(mob/user)
	if(jammed)
		to_chat(user, SPAN_WARNING("[src] is jammed!"))
		return 0
	else
		if(loaded.len && prob(jam_chance)) //you know, when you try to shot and "aaaaawwwww fuk"
			jammed = TRUE
			playsound(src.loc, 'sound/weapons/guns/interact/hpistol_cock.ogg', 70, 1)
			to_chat(user, SPAN_DANGER("[src] is jammed!"))
			return 0
	return ..()

/obj/item/gun/projectile/handmade_pistol/attackby(obj/item/W as obj, mob/user as mob)
	if(!chamber_open)
		if(W.use_tool(user, src, WORKTIME_INSTANT, QUALITY_SCREW_DRIVING, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			open_chamber()
			to_chat(user, SPAN_NOTICE("You force open the chamber with [W]."))
	else if(chamber_open)
		if(W.use_tool(user, src, WORKTIME_INSTANT, QUALITY_SCREW_DRIVING, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			chamber_open = FALSE
			icon_state = "hm_pistol"
			playsound(src.loc, 'sound/weapons/guns/interact/batrifle_magout.ogg', 65, 1)
			to_chat(user, SPAN_NOTICE("You force the chamber closed with [W]."))
	..()

/obj/item/gun/projectile/handmade_pistol/load_ammo(var/obj/item/A, mob/user)
	if(istype(A, /obj/item/ammo_casing))
		if(!chamber_open)
			to_chat(user, SPAN_WARNING("You need to open chamber first."))
			return
		..()

/obj/item/gun/projectile/handmade_pistol/unload_ammo(mob/user, var/allow_dump=1)
	if(!chamber_open)
		return
	..()

/obj/item/gun/projectile/handmade_pistol/proc/open_chamber()
	src.jammed = FALSE
	src.chamber_open = TRUE
	icon_state = "hm_pistol_open"
	playsound(src.loc, 'sound/weapons/guns/interact/batrifle_magout.ogg', 65, 1)