/obj/item/weapon/gun/projectile/boltgun
	name = "\"Kardashev-Mosin\" boltgun"
	desc = "Weapon for hunting or endless trench warfare. \
			If you're on a budget, it's a darn good rifle for just about everything."
	icon = 'icons/obj/guns/projectile/boltgun.dmi'
	icon_state = "boltgun"
	item_state = "boltgun"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_ROBUST
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	caliber = CAL_RIFLE
	fire_delay = 12 // double the standart
	damage_multiplier = 1.1
	penetration_multiplier  = 1.5
	recoil_buildup = 40 //same as AMR
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|SPEEDLOADER
	max_shells = 10
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'
	reload_sound = 'sound/weapons/guns/interact/rifle_load.ogg'
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 500
	one_hand_penalty = 20 //full sized rifle with bayonet is hard to keep on target
	var/bolt_open = 0
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut") // Considering attached bayonet
	sharp = 1
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_BAYONET)
	saw_off = TRUE
	sawn = /obj/item/weapon/gun/projectile/boltgun/sawn

/obj/item/weapon/gun/projectile/boltgun/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (item_suffix)
		itemstring += "[item_suffix]"

	if (bolt_open)
		iconstring += "_open"
	else
		iconstring += "_closed"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/projectile/boltgun/Initialize()
	. = ..()
	update_icon()

/obj/item/weapon/gun/projectile/boltgun/attack_self(mob/user) //Someone overrode attackself for this class, soooo.
	if(zoom)
		toggle_scope(user)
		return
	bolt_act(user)

/obj/item/weapon/gun/projectile/boltgun/proc/bolt_act(mob/living/user)
	playsound(src.loc, 'sound/weapons/guns/interact/rifle_boltback.ogg', 75, 1)
	bolt_open = !bolt_open
	if(bolt_open)
		if(chambered)
			to_chat(user, SPAN_NOTICE("You work the bolt open, ejecting [chambered]!"))
			chambered.forceMove(get_turf(src))
			loaded -= chambered
			chambered = null
		else
			to_chat(user, SPAN_NOTICE("You work the bolt open."))
	else
		to_chat(user, SPAN_NOTICE("You work the bolt closed."))
		playsound(src.loc, 'sound/weapons/guns/interact/rifle_boltforward.ogg', 75, 1)
		bolt_open = 0
	add_fingerprint(user)
	update_icon()

/obj/item/weapon/gun/projectile/boltgun/special_check(mob/user)
	if(bolt_open)
		to_chat(user, SPAN_WARNING("You can't fire [src] while the bolt is open!"))
		return 0
	return ..()

/obj/item/weapon/gun/projectile/boltgun/load_ammo(var/obj/item/A, mob/user)
	if(!bolt_open)
		return
	..()

/obj/item/weapon/gun/projectile/boltgun/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		return
	..()


/obj/item/weapon/gun/projectile/boltgun/sa
	name = "\"Novakovic\" boltgun"
	desc = "Weapon for hunting, or endless trench warfare. \
			If you're on a budget, it's a darn good rifle for just about everything. \
			This copy, in fact, is a reverse-engineered poor-quality copy of a more perfect copy of an ancient rifle"
	icon = 'icons/obj/guns/projectile/boltgun_wood.dmi'
	icon_state = "boltgun"
	item_state = "boltgun"
	max_shells = 5
	price_tag = 300
	recoil_buildup = 40
	damage_multiplier = 1
	matter = list(MATERIAL_STEEL = 20, MATERIAL_WOOD = 10)
	saw_off = TRUE
	sawn = /obj/item/weapon/gun/projectile/boltgun/sawn/sa


/obj/item/weapon/gun/projectile/boltgun/scout
	name = "\"Scout\" heavy boltgun"
	desc = "Weapon for hunting, sniping, and competition shooting. Chambered in .408 Heavy Rifle rounds, it packs the reach and accuracy for every occasion."
	icon = 'icons/obj/guns/projectile/heavyboltgun.dmi'
	icon_state = "boltgun"
	item_state = "boltgun"
	force = WEAPON_FORCE_PAINFUL
	damage_multiplier = 1.3
	penetration_multiplier  = 1.6
	recoil_buildup = 50
	max_shells = 5
	zoom_factor = 2.0
	price_tag = 1500
	sharp = 0
	caliber = CAL_HRIFLE
	load_method = SINGLE_CASING
	one_hand_penalty = 50 //No trick shots
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 10)
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)
	saw_off = TRUE
	sawn = /obj/item/weapon/gun/projectile/boltgun/sawn/scout

/obj/item/weapon/gun/projectile/boltgun/scout/light
	name = "\"Sika\" light boltgun"
	desc = "Weapon for hunting, sniping, and competition shooting. Chambered in .257, it's a common varmint and plinking rifle."
	icon = 'icons/obj/guns/projectile/lightboltgun.dmi'
	icon_state = "boltgun"
	item_state = "boltgun"
	max_shells = 10
	price_tag = 1000
	damage_multiplier = 1
	caliber = CAL_LRIFLE
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 10)
	fire_sound = 'sound/weapons/guns/fire/batrifle_fire.ogg'
	saw_off = TRUE
	sawn = /obj/item/weapon/gun/projectile/boltgun/sawn/light

/obj/item/weapon/gun/projectile/boltgun/scout/light/wood
	name = "\"Roe\" light boltgun"
	desc = "Weapon for hunting, sniping, and competition shooting. Chambered in .257, it's a common varmint and plinking rifle."
	icon = 'icons/obj/guns/projectile/lightboltgun_wood.dmi'
	icon_state = "boltgun"
	item_state = "boltgun"
	max_shells = 10
	price_tag = 1000
	caliber = CAL_LRIFLE
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_WOOD = 10, MATERIAL_GLASS = 10)
	saw_off = TRUE
	sawn = /obj/item/weapon/gun/projectile/boltgun/sawn/light/wood

/obj/item/weapon/gun/projectile/boltgun/sawn
	name = "\"obrez\" boltgun"
	desc = "A crudly mangled and sawn-down 7.5mm bolt action rifle. Rifle was fine."
	icon = 'icons/obj/guns/projectile/sawnoff/boltgun.dmi'
	icon_state = "obrez"
	item_state = "obrez"
	force = WEAPON_FORCE_NORMAL
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	price_tag = 75
	sharp = 0
	recoil_buildup = 60
	penetration_multiplier = 0.5
	damage_multiplier = 0.9
	fire_delay = 18
	one_hand_penalty = 10
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 4)
	saw_off = FALSE

/obj/item/weapon/gun/projectile/boltgun/sawn/sa
	name = "\"obrez\" boltgun"
	icon = 'icons/obj/guns/projectile/sawnoff/boltgun_wood.dmi'
	icon_state = "obrez"
	item_state = "obrez"
	max_shells = 5
	one_hand_penalty = 10
	matter = list(MATERIAL_STEEL = 10, MATERIAL_WOOD = 4)
	saw_off = FALSE

/obj/item/weapon/gun/projectile/boltgun/sawn/scout
	name = "\"obrez\" heavy boltgun"
	desc = "A crudly mangled and sawn-down .408 bolt action rifle. Rifle was fine."
	icon = 'icons/obj/guns/projectile/sawnoff/heavyboltgun.dmi'
	icon_state = "obrez"
	item_state = "obrez"
	caliber = CAL_HRIFLE
	load_method = SINGLE_CASING
	fire_delay = 18
	max_shells = 5
	one_hand_penalty = 15
	saw_off = FALSE

/obj/item/weapon/gun/projectile/boltgun/sawn/light
	name = "\"obrez\" light boltgun"
	desc = "A crudly mangled and sawn-down .257 bolt action rifle. Rifle was fine."
	icon = 'icons/obj/guns/projectile/sawnoff/boltgun.dmi'
	icon_state = "obrez"
	item_state = "obrez"
	caliber = CAL_LRIFLE
	load_method = SINGLE_CASING
	fire_delay = 18
	one_hand_penalty = 15
	fire_sound = 'sound/weapons/guns/fire/batrifle_fire.ogg'
	saw_off = FALSE

/obj/item/weapon/gun/projectile/boltgun/sawn/light/wood
	name = "\"obrez\" light boltgun"
	desc = "A crudly mangled and sawn-down .257 bolt action rifle. Rifle was fine."
	icon = 'icons/obj/guns/projectile/sawnoff/boltgun_wood.dmi'
	icon_state = "obrez"
	item_state = "obrez"
	caliber = CAL_LRIFLE
	load_method = SINGLE_CASING
	fire_delay = 18
	max_shells = 10
	one_hand_penalty = 15
	saw_off = FALSE

// Star-Striker! A sci only gun that fires laser based shells
/obj/item/weapon/gun/projectile/boltgun/scout/sci
	name = "\"Star Striker\" laser boltgun"
	desc = "A weapon based on the Sike boltgun line but fitted to use longer, laser based casings. Chambered in laser casings."
	icon = 'icons/obj/guns/energy/starstriker.dmi'
	icon_state = "starstriker"
	item_state = "starstriker"
	max_shells = 10
	price_tag = 250 //no...
	damage_multiplier = 1
	caliber = CAL_SCI
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2, TECH_MAGNET = 3, TECH_POWER = 6)
	fire_sound = 'sound/weapons/Laser.ogg'
	saw_off = FALSE
