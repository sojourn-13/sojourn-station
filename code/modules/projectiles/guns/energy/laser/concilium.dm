/obj/item/gun/energy/concillium
	name = "\"Concillium\" las-machinegun"
	desc = "Produced by the New Testament, made to pin down enemies with rapid shots.\
	The low per-shot damage and poor accuracy of this gun is made up for by its rapid rate of fire and large energy capacity, \
	allowing the user to sustain long periods of fire, forcing enemies to seek cover or be torn apart by a rain of laserfire. Takes large power cells"
	icon = 'icons/obj/guns/energy/concilium.dmi'
	icon_state = "concilium"
	item_state = null	//so the human update icon uses the icon_state instead.
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/energy/laser_rifle.ogg' // Big unwieldy gun, despite the shit lasers
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	matter = list(MATERIAL_PLASTEEL = 30, MATERIAL_WOOD = 25, MATERIAL_GLASS = 10, MATERIAL_SILVER = 5, MATERIAL_GOLD = 5)
	projectile_type = /obj/item/projectile/beam/drone
	init_recoil = CARBINE_RECOIL(2)
	fire_delay = 2
	charge_cost = 100 //130 shots on a large spark
	wield_delay = 1.5 SECOND
	wield_delay_factor = 0.5 // 50 vig to instant wield heavy chonker gun
	slowdown_hold = 1 //heavy wood stock. Stupidly chonky
	suitable_cell = /obj/item/cell/large
	damage_multiplier = 1.2 //Kinda bad beam inside but can be upgraded to be a normal laser lmg!
	armor_divisor = 0.1
	init_offset = 3
	price_tag = 2000
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	init_firemodes = list(
		FULL_AUTO_300,
		list(mode_name="short bursts", mode_desc="Fire 5 shots in succession", burst=5,    burst_delay=4, move_delay=6,  icon="burst"),
		list(mode_name="long bursts", mode_desc="Fire 8 shots in succession",  burst=8, burst_delay=4, move_delay=8,  icon="burst"),
		list(mode_name="suppressing fire", mode_desc="Fire 16 shots back to back to keep targets inside cover",  burst=16, burst_delay=4, move_delay=11,  icon="burst")
		)
	blacklist_upgrades = list(/obj/item/gun_upgrade/mechanism/greyson_master_catalyst = TRUE)
	twohanded = TRUE
	serial_type = "Absolute"
