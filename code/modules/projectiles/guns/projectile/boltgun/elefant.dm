/obj/item/gun/projectile/boltgun/elefant
	name = "\"Elefant\" pneumatic rifle"
	desc = "A heavy bastard child of a China Lake and what appears a Gladstone mixed in with guild's expertise. Despite it's janky appearance it packs quite the punch being chambered in .60-06 delivering almost same force as an actual anti-tank rifle. It bears a thunderbolt on it's stock with words 'Never another subjugation' underneath"
	icon = 'icons/obj/guns/projectile/elefant.dmi'
	icon_state = "elefant"
	item_state = "elefant"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 2)
	caliber = CAL_ANTIM
	recoil_buildup = 70
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING
	max_shells = 3
	ammo_type = /obj/item/ammo_casing/antim
	fire_sound = 'sound/weapons/railgun.ogg'
	reload_sound = 'sound/weapons/guns/interact/rifle_load.ogg'
	matter = list(MATERIAL_PLASTEEL = 40, MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 10000
	one_hand_penalty = 80
	damage_multiplier = 0.6
	penetration_multiplier = 0.6 //It's a glorified railway rifle, no way it's even close to actual AMR.
	extra_damage_mult_scoped = 0.2 //Same damage modifier as actual unscoped AMR with this.
	twohanded = TRUE
	sharp = FALSE
	saw_off = FALSE
	eject_animatio = FALSE
	bolt_training = FALSE
	gun_tags = list(GUN_AMR, GUN_PROJECTILE)