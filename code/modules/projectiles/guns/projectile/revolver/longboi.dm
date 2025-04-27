/obj/item/gun/projectile/revolver/longboi
	name = "\"Long\" revolver"
	desc = "A novelty revolver made by the Lonestar with an incredously long barrel favored by those with more sense and style, its extended barrel gives it incredible recoil control but inexplicably reduces stopping power and penetration. \
	Uses .50 Kurz."
	icon = 'icons/obj/guns/projectile/Long_Revolver.dmi'
	icon_state = "longRevolver"
	fire_sound = 'sound/weapons/guns/fire/12mm_revolver.ogg'
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_50
	slot_flags = SLOT_BACK|SLOT_BELT	//Can't fit a holster due to length
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	max_shells = 5
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 6)
	price_tag = 1250 //It's a novelty item.
	damage_multiplier = 0.9
	penetration_multiplier = 1.1
	init_recoil = HANDGUN_RECOIL(1.1)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_CALIBRE_50)
	twohanded = TRUE
	serial_type = "LSS"
	wield_delay = 0.5 SECOND
	wield_delay_factor = 0.5 // 50 vig
