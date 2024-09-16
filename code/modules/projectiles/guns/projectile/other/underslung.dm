/obj/item/gun/projectile/underslung
	name = "underslung grenade launcher"
	desc = "Not much more than a tube and a firing mechanism, this grenade launcher is designed to be fitted to a rifle."
	fire_sound = 'sound/weapons/guns/fire/ubgl.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/china_lake_reload.ogg' // M203 reload sound, without the cocking.
	w_class = ITEM_SIZE_NORMAL
	matter = null
	force = 5
	max_shells = 1
	safety = FALSE
	twohanded = FALSE
	caliber = CAL_GRENADE
	fire_delay = 15
	handle_casings = EJECT_CASINGS
	serial_type = "H&S"

/obj/item/gun/projectile/underslung/attack_self()
	return

// Snowflake SBAW integrated grenade launcher mode
/obj/item/gun/projectile/underslung/built_in
	name = "integrated grenade launcher"
	desc = "Integrated grenade launcher for a SBAW, acting as a secondary magazine, yet firing from the same barrel."
	w_class = ITEM_SIZE_BULKY // It's literally the gun itself, kind of.
	max_shells = 5
	fire_delay = 15 // Prevents grenade spam.
	serial_type = "Sol Fed" // Same as the SBAW it belongs to.
