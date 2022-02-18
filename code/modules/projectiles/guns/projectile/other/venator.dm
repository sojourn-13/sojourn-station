/obj/item/gun/projectile/venator
	name = "\"Venator\" pneumatic rifle"
	desc = "A heavy bastard child of a China Lake and what appears a Gladstone mixed in with guild's expertise. Despite it's janky appearance it packs quite the punch capable of delivering rods with almost same force as an actual anti-tank rifle. It bears a thunderbolt on it's stock with words 'Never another subjugation' underneath."
	icon = 'icons/obj/guns/projectile/venator.dmi'
	icon_state = "venator"
	item_state = "venator"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 2)
	caliber = CAL_CROSSBOW
	recoil_buildup = 70
	load_method = SINGLE_CASING
	max_shells = 1
	ammo_type = /obj/item/ammo_casing/crossbow_bolts/pneumatic
	fire_sound = 'sound/weapons/railgun.ogg'
	reload_sound = 'sound/weapons/guns/interact/rifle_load.ogg'
	matter = list(MATERIAL_PLASTEEL = 40, MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 3000 //750 more than Reductor
	one_hand_penalty = 80
	damage_multiplier = 1.2
	penetration_multiplier = 1.1
	twohanded = TRUE
	sharp = FALSE
	saw_off = FALSE
	gun_tags = list(GUN_AMR, GUN_PROJECTILE)