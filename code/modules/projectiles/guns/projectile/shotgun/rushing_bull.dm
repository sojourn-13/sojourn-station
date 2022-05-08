/obj/item/gun/projectile/automatic/bull_autoshotgun
	name = "\"Rushing Bull\" tactical shotgun" //With correct mods this can be better then the pug
	desc = "Lightweight, ergonomic and with a fast cycling speed, this semi-automatic shotgun is a breacher's dream. \
	The internal components are a work of art, able to operate smoothly no matter the circumstance. \
	A discreet black finish coats its composite polymers and metallic alloys, Blackshield colors stamped to denote its origins. \
	Under the ejection port stands the figure of a large Sablekyne, large horns pointing forward as they rage on. \
	The last thing they saw coming. Best used with slugs rather than buckshot due to its rifling."
	icon = 'icons/obj/guns/projectile/rushingbull.dmi'
	icon_state = "rushingbull"
	item_state = "rushingbull"
	max_shells = 8
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	flags = CONDUCT
	slot_flags = SLOT_BACK
	caliber = CAL_SHOTGUN
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	handle_casings = EJECT_CASINGS
	fire_sound = 'sound/weapons/guns/fire/rushingbull.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/shotgun_insert.ogg'
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 600
	penetration_multiplier = 2
	pierce_multiplier = 2
	damage_multiplier = 0.6 //Pug has 0.7 do to its fire normal modes
	recoil_buildup = 13
	one_hand_penalty = 15 //full sized shotgun level
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SCOPE)
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/automatic/cattle_autoshotgun
	init_firemodes = list(
		list(mode_name="semiauto", mode_desc="Shoot once per pull after chambering", burst=1, fire_delay=5, move_delay=null, icon="semi")
		)
	serial_type = "NM"

/obj/item/gun/projectile/automatic/cattle_autoshotgun
	name = "\"Cattle Stampede\" tactical shotgun" //With correct mods this can be better then the pug
	desc = "A smaller version of the \"Rushing Bull\" tactical shotgun, slimmed down for use as a side arm with better recoil control. \
	This fine shotgun has a shorter internal tube magazine, taking 5 shells instead of the normal 8 of its regular version. \
	Its compact size allows it to be carried under one's belt with ease."
	icon = 'icons/obj/guns/projectile/rushingbull_sawn.dmi'
	icon_state = "rushingbull_sawn"
	item_state = "rushingbull_sawn"
	max_shells = 5
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_PAINFUL
	flags = CONDUCT
	slot_flags = SLOT_BELT
	caliber = CAL_SHOTGUN
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	handle_casings = EJECT_CASINGS
	fire_sound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/shotgun_insert.ogg'
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 5)
	price_tag = 600
	penetration_multiplier = 1.5
	pierce_multiplier = 1.5
	damage_multiplier = 0.6 //Pug has 0.7 do to its fire normal modes
	recoil_buildup = 13
	one_hand_penalty = 15 //full sized shotgun level
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)
	saw_off = FALSE
	init_firemodes = list(
		list(mode_name="semiauto", mode_desc="Shoot once per pull after chambering", burst=1, fire_delay=5, move_delay=null, icon="semi")
		)


