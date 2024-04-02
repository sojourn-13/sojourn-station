/obj/item/gun/projectile/boltgun/flare_gun
	name = "H&S .22 \"Dazzlation\" light pistol"
	desc = "\"Dazzlation\" is also known as a flare gun made of plastic with some steel interworkings."
	icon = 'icons/obj/guns/projectile/flaregun.dmi'
	icon_state = "flaregun"
	item_state = "pistol"
	caliber = CAL_FLARE
	origin_tech = list(TECH_COMBAT = 1, TECH_MATERIAL = 1)
	bulletinsert_sound = 'sound/weapons/guns/interact/bullet_insert.ogg'
	fire_sound = 'sound/weapons/guns/interact/hpistol_cock.ogg'
	w_class = ITEM_SIZE_SMALL
	can_dual = TRUE
	load_method = SINGLE_CASING
	max_shells = 1
	matter = list(MATERIAL_PLASTIC = 4, MATERIAL_STEEL = 2)
	ammo_type = /obj/item/ammo_casing/flare
	init_recoil = HMG_RECOIL(0.01)
	force = WEAPON_FORCE_WEAK
	saw_off = FALSE
	sharp = FALSE
	bolt_training = FALSE
	eject_animatio = FALSE //TODO: this
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE) //We cant be overshooter or sharpened, but we can take a scope!
	price_tag = 30
	gun_parts = null //no free mosin!
	serial_type = "H&S"


/obj/item/gun/projectile/boltgun/flare_gun/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (bolt_open)
		iconstring += "_open"
	else
		iconstring += "_closed"

	icon_state = iconstring
	set_item_state(itemstring)
