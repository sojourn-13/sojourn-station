/obj/item/gun/projectile/shotgun/slidebarrel
	name = "slide barrel shotgun"
	desc = "Made out of trash, but rather special on its design"
	icon = 'icons/obj/guns/projectile/slideshotgun.dmi'
	icon_state = "slideshotgun"//evan, temp icon
	item_state = "slideshotgun"
	max_shells = 1
	caliber = CAL_SHOTGUN
	load_method = SINGLE_CASING|SPEEDLOADER
	handle_casings = HOLD_CASINGS
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	can_dual = TRUE
	ammo_type = /obj/item/ammo_casing/shotgun
	matter = list(MATERIAL_STEEL = 20, MATERIAL_WOOD = 10)
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_PAINFUL
	damage_multiplier = 0.7
	init_recoil = RIFLE_RECOIL(1.6)
	price_tag = 250 //cheap as they get
	serial_type = "INDEX"
	serial_shown = FALSE

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.4 // 40 vig
