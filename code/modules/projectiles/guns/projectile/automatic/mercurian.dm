/obj/item/gun/projectile/automatic/mercu
	name = "Mercurian Anti-Atmos Rifle"
	desc = "An attempt to bring an old design to a more modern era, the classic Sol Fed design but revamped for a contemporary cartridge and a custom big bore rifle intended to breach through tough windows on shuttle craft, station exteriors, or faceshields before laying down a hail of 10x24. Any growing pirate or marine's dream for EVA and boarding operations."
	icon = 'icons/obj/guns/projectile/mercurian.dmi'
	icon_state = "mercu"
	item_state = "mercu"
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_PAINFUL
	caliber = "10x24"
	origin_tech = list(TECH_COMBAT = 12, TECH_MATERIAL = 10)
	slot_flags = SLOT_BELT|SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE
	auto_eject = FALSE
	matter = list(MATERIAL_PLASTEEL = 35, MATERIAL_PLASTIC = 35, MATERIAL_PLATINUM = 20)
	price_tag = 1750
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/sfrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/sfrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/sfrifle_cock.ogg'
	damage_multiplier = 1.1
	penetration_multiplier = 1.2
	init_recoil = LMG_RECOIL(0.6)
	serial_type = "Sol Fed"

	wield_delay = 1.0 SECOND
	wield_delay_factor = 0.4 // 40 vig for insta wield
	gun_parts = list(/obj/item/part/gun/frame/solmarine = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/clrifle = 1)

	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE ,GUN_SCOPE, GUN_MAGWELL)
	allow_greyson_mods = FALSE

	init_firemodes = list(
		FULL_AUTO_600,
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND,
			list(mode_name="fire underbarrel", mode_desc="Shoot the underbarrel rifle",  burst=null, fire_delay=null, move_delay=null,  icon="grenade", use_launcher=1)
		)

	var/obj/item/gun/projectile/automatic/underslung/borerifle/borerifle

/obj/item/gun/projectile/automatic/mercu/Initialize()
	. = ..()
	borerifle = new(src)

/obj/item/gun/projectile/automatic/mercu/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/ammo_casing/ball)))
		borerifle.load_ammo(I, user)
	else
		..()

/obj/item/gun/projectile/automatic/mercu/attack_hand(mob/user)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(user.get_inactive_hand() == src && cur_mode.settings["use_launcher"])
		borerifle.unload_ammo(user)
	else
		..()

/obj/item/gun/projectile/automatic/mercu/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(cur_mode.settings["use_launcher"])
		borerifle.Fire(target, user, params, pointblank, reflex)
		if(!borerifle.chambered)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/gun/projectile/automatic/mercu/Initialize()
	. = ..()
	update_icon()


/obj/item/gun/projectile/automatic/mercu/examine(mob/user)
	..()
	if(borerifle.loaded.len)
		to_chat(user, "\The [borerifle] has \a [borerifle.chambered] loaded.")
	else
		to_chat(user, "\The [borerifle] is empty.")

/obj/item/gun/projectile/automatic/underslung/borerifle
	name = "Underslung large bore rifle"
	desc = "Not much more than a tube and a firing mechanism, this large bore rifle is designed to be fitted to another gun."
	fire_sound = 'sound/weapons/guns/fire/sniper.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/china_lake_reload.ogg'
	w_class = ITEM_SIZE_NORMAL
	matter = null
	force = 5
	max_shells = 1
	init_recoil = HMG_RECOIL(1)
	safety = FALSE
	twohanded = FALSE
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/ball
	caliber = CAL_BALL
	handle_casings = EJECT_CASINGS
	init_firemodes = list(
		list(mode_name = "semiauto",  mode_desc = "Fire as fast as you can pull the trigger", burst=1, fire_delay=2.5, move_delay=null, icon="semi"),
		)
	serial_type = "LSS"



/obj/item/gun/projectile/automatic/mercu/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if(wielded)
		itemstring += "_doble"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/mercu/Initialize()
	. = ..()
	update_icon()
