/obj/item/gun/projectile/revolver/little_comet
	name = "\"Little Comet\" revolver"
	desc = "A special revolver developed to be as flashy and over priced as the businessmen that carry them. A special gravity based modification in the cylinder allows for it to over penetrate \
	even solid steel walls despite its low caliber, the weapons value derived from said gravitonic modification being old tech from Greyson Positronics that can no longer be reproduced. Uses .35 special rounds."
	icon = 'icons/obj/guns/projectile/little_comet.dmi'
	icon_state = "little_comet"
	item_state = "little_comet"
	drawChargeMeter = FALSE
	max_shells = 6
	caliber = CAL_PISTOL
	fire_sound = 'sound/weapons/guns/fire/9mm_revolver.ogg'
	origin_tech = list(TECH_COMBAT = 10, TECH_MATERIAL = 2)
	ammo_type = /obj/item/ammo_casing/pistol_35
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 6)
	price_tag = 5000
	damage_multiplier = 1.1 //because pistol round
	penetration_multiplier = 10 //Max.
	pierce_multiplier =  5
	init_recoil = RIFLE_RECOIL(0.3)
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_SILENCABLE)
	serial_type = "XSyndi"

/obj/item/gun/projectile/revolver/little_comet/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/revolver/little_comet/New()
	..()
	GLOB.all_faction_items[src] = GLOB.department_security

/obj/item/gun/projectile/revolver/little_comet/Destroy()
	for(var/mob/living/carbon/human/H in viewers(get_turf(src)))
		LEGACY_SEND_SIGNAL(H, COMSIG_OBJ_FACTION_ITEM_DESTROY, src)
	GLOB.all_faction_items -= src
	..()

/obj/item/gun/projectile/revolver/little_comet/attackby(obj/item/I, mob/user, params)
	if(nt_sword_attack(I, user))
		return FALSE
	..()
