/obj/item/gun/energy/concillium
	name = "\"Concillium\" las-machinegun"
	desc = "Newest creation of the New Testament made exactly to pin down enemies with rapid shots. \
	The low damage and bad accuracy (considering the size) of this gun is not to be judged badly considering their rapid rate of fire and large energy capacity, \
	allowing the user to keep firing, forcing enemies to seek cover instead of running against the rate of fire. "
	icon = 'icons/obj/guns/energy/concilium.dmi'
	icon_state = "concilium"
	item_state = null	//so the human update icon uses the icon_state instead.
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/Laser.ogg'
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	matter = list(MATERIAL_PLASTEEL = 30, MATERIAL_WOOD = 25, MATERIAL_GLASS = 15, MATERIAL_SILVER = 5, MATERIAL_GOLD = 3)
	projectile_type = /obj/item/projectile/beam/drone
	recoil_buildup = 3
	one_hand_penalty = 30 //not like it's used anyway, but LMG level
	charge_cost = 25
	damage_multiplier = 1 //REALLY bad beam inside but can be upgraded to be a normal laser lmg!
	init_offset = 3
	price_tag = 2000
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	init_firemodes = list(
		FULL_AUTO_600,
		list(mode_name="short bursts", mode_desc="dakka 5 shots in quick succession", burst=5,    burst_delay=2, move_delay=6,  icon="burst"),
		list(mode_name="long bursts", mode_desc="Dakka 8 shots in succession",  burst=8, burst_delay=4, move_delay=8,  icon="burst"),
		list(mode_name="suppressing fire", mode_desc="DAKKA 16 shots back to back to keep targets inside cover",  burst=16, burst_delay=4, move_delay=11,  icon="burst")
		)
	twohanded = TRUE
	serial_type = "Absolute"
