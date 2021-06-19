/obj/item/weapon/gun/projectile/automatic/riot_autoshotgun
	name = "\"State\" riot shotgun" //With correct mods this can be better then the pug
	desc = "A Seinemetall Defense GmbH riot auto action shotgun, its uncommonly seen deployed in most police operation dye to the success of the \"Gladstone\". \
	This particular shotgun has been redesigned many times, never quite reaching a standard everyone was happy with, with some lauding it as confusing for a shotgun. \
	Holds up to eight 20mm shells in a tube magazine."
	icon = 'icons/obj/guns/projectile/milshotgun.dmi'
	icon_state = "cshotgun"
	item_state = "cshotgun"
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
	fire_sound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/shotgun_insert.ogg'
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 600
	damage_multiplier = 0.8 //Pug has 0.7 do to its fire normal modes
	recoil_buildup = 13
	one_hand_penalty = 15 //full sized shotgun level
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)

	init_firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, icon="semi")
		)
