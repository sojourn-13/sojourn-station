/obj/item/gun/projectile/shotgun/pump/aktion
	name = "\"Aktion\" single-action revolver"
	desc = "A curious, high power revolved. The Aktion is held up by certain hardcore firearms enthusiasts as the pinacle of efficiency and reliability and decried by others as inconvenient and impractical. None can deny the efficient mechanism and high power brought to bare by this weapon."
	icon = 'icons/obj/guns/projectile/aktion.dmi'
	icon_state = "aktion"
	item_state = "aktion"
	max_shells = 6
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	slot_flags = SLOT_BELT | SLOT_HOLSTER
	caliber = CAL_MAGNUM
	load_method = SINGLE_CASING|SPEEDLOADER
	ammo_type = /obj/item/ammo_casing/magnum_40
	handle_casings = CYCLE_CASINGS
	unload_sound 	= 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	pumpshotgun_sound	= 'sound/weapons/guns/interact/rev_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/12mm_revolver.ogg'
	fire_delay = 2 //all revolvers can fire faster, but have huge recoil
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 10)
	price_tag = 750
	damage_multiplier = 1.5 //BIG boy BIG Recoil.
	penetration_multiplier = 1.4
	init_recoil = HANDGUN_RECOIL(1.3)
	fire_animatio = TRUE
	saw_off = FALSE
	allow_racking = FALSE
	serial_type = "NM"

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.15 // 15 vig
	gun_parts = null
	alt_plus_one_loading = FALSE
