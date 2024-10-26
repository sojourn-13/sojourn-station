/obj/item/gun/projectile/shotgun/pump/china
	name = "China Lake"
	desc = "This centuries-old design was recently rediscovered and adapted for use in modern battlefields. \
        Working similar to a pump-action combat shotgun, its light weight and robust design quickly made it a popular weapon. \
        It holds up to 4 gernade shells, one in the chamber and three in its tubular magazine."
	icon = 'icons/obj/guns/projectile/chinalake.dmi'
	icon_state = "china_lake"
	item_state = "china_lake"
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	matter = list(MATERIAL_PLASTEEL = 25, MATERIAL_WOOD = 10)
	price_tag = 1750
	caliber = CAL_GRENADE
	load_method = SINGLE_CASING
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 2)
	handle_casings = HOLD_CASINGS
	fire_sound = 'sound/weapons/guns/fire/GLfire.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/china_lake_reload.ogg'   // Might not be a M203 but better than a mag sound.
	max_shells = 3
	fire_delay = 15
	slowdown_hold = 1
	init_recoil = HANDGUN_RECOIL(3)
	twohanded = TRUE
	serial_type = "SA"

/obj/item/gun/projectile/shotgun/pump/china/handle_post_fire(mob/user)
	log_and_message_admins("fired a grenade ([chambered.name]) from a grenade launcher ([src.name]).")
	user.attack_log += "\[[time_stamp()]\] <font color='red'> fired a grenade ([chambered.name]) from a grenade launcher ([src.name])</font>"
	chambered = null
	pump(user)
