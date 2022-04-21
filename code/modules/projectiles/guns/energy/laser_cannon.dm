/obj/item/gun/energy/lasercannon
	name = "\"Titanica\" laser cannon"
	desc = "A bulky outdated and now abandoned H&S design for an energy weapon that allows for it to shoot condenced laser beams to really burn a whole in anything. At its time it was compared to the \"Bull\" as one of the worst personal defence laser firearms created."
	icon = 'icons/obj/guns/energy/lascannon.dmi'
	icon_state = "lasercannon"
	item_state = "lasercannon"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/lasercannonfire.ogg'
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3, TECH_POWER = 3) //Shows that its not as high tech but still rather smartly designed
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BELT|SLOT_BACK
	projectile_type = /obj/item/projectile/beam/heavylaser
	charge_cost = 100
	fire_delay = 20
	matter = list(MATERIAL_STEEL = 25, MATERIAL_SILVER = 6)
	price_tag = 500
	one_hand_penalty = 5
	twohanded = TRUE
	init_firemodes = list(
		WEAPON_NORMAL
		)
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	serial_type = "H&S"

/obj/item/gun/energy/lasercannon/mounted
	name = "mounted laser cannon"
	self_recharge = TRUE
	use_external_power = TRUE
	damage_multiplier = 0.7 //Mounted cannon deals less do to being a mini-verson
	recharge_time = 10
	safety = FALSE
	restrict_safety = TRUE
	one_hand_penalty = 0 // It's mounted on the arm and there's no way to wield it.
	twohanded = FALSE

/obj/item/gun/energy/lasercannon/rnd
	name = "\"Solaris\" laser cannon"
	desc = "A outdated and abandoned design for an energy weapon, revamped by Soteria Institute. The lasing medium is enclosed in a tube lined with uranium-235 and subjected to high neutron flux in a nuclear reactor core. \
		This incredible technology packed inside let it stand on it's own has one of the markets best laser cannon for turret defense and firepower! "
	icon = 'icons/obj/guns/energy/si_lascannon.dmi'
	matter = list(MATERIAL_STEEL = 25, MATERIAL_SILVER = 4, MATERIAL_URANIUM = 1)
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_POWER = 3)
	price_tag = 1500
	init_firemodes = list(
		WEAPON_NORMAL,
		WEAPON_CHARGE
		)
	serial_type = "SI"
