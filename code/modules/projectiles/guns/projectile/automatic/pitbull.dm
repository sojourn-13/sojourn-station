/obj/item/gun/projectile/automatic/pitbull
	name = "\"Pitbull\" carbine"
	desc = "The M7 Pitbull was an older bullpup rifle model manufactured by \"Sol Federation\" primarily for planetary defense forces and private military firms. It includes an underbarrel grenade launcher which is compatible with most modern grenade types. Uses 6.5mm Carbine rounds."
	icon = 'icons/obj/guns/projectile/pitbull.dmi'
	icon_state = "pitbull"
	item_state = "pitbull"
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_LRIFLE
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 3)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 10)
	price_tag = 1600
	fire_sound = 'sound/weapons/guns/fire/batrifle_fire.ogg'
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE
	unload_sound 	= 'sound/weapons/guns/interact/batrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/batrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/batrifle_cock.ogg'
	init_recoil = CARBINE_RECOIL(1)
	penetration_multiplier = 1
	damage_multiplier = 1.1
	zoom_factors = list(0.2)
	gun_parts = list(/obj/item/part/gun/frame/bulldog = 1, /obj/item/part/gun/grip/serb = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/srifle = 1)
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL)
	serial_type = "Sol Fed"

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND,
		list(mode_name="fire grenades", mode_desc="Shoots the underbarrel grenade tube",  burst=null, fire_delay=null, move_delay=null,  icon="grenade", use_launcher=1)
		)

	var/obj/item/gun/projectile/underslung/launcher

/obj/item/gun/projectile/automatic/pitbull/Initialize()
	. = ..()
	launcher = new(src)

/obj/item/gun/projectile/automatic/pitbull/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/ammo_casing/grenade)))
		launcher.load_ammo(I, user)
	else
		..()

/obj/item/gun/projectile/automatic/pitbull/attack_hand(mob/user)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(user.get_inactive_hand() == src && cur_mode.settings["use_launcher"])
		launcher.unload_ammo(user)
	else
		..()

/obj/item/gun/projectile/automatic/pitbull/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(cur_mode.settings["use_launcher"])
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/gun/projectile/automatic/pitbull/Initialize()
	. = ..()
	update_icon()


/obj/item/gun/projectile/automatic/pitbull/examine(mob/user)
	..()
	if(launcher.loaded.len)
		to_chat(user, "\The [launcher] has \a [launcher.chambered] loaded.")
	else
		to_chat(user, "\The [launcher] is empty.")

/obj/item/gun/projectile/automatic/pitbull/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if(wielded)
		itemstring += "_doble"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/pitbull/Initialize()
	. = ..()
	update_icon()

