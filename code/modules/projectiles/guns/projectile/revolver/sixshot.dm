/obj/item/gun/projectile/revolver/sixshot
	name = "\"Six-Shot\" revolving shotgun"
	desc = "A unique, revolving shotgun using a revolver cylinder. You can't tell if the person who made it deserves an award or to be tried as a criminal."
	icon = 'icons/obj/guns/projectile/sixshot.dmi'
	icon_state = "sixshot"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	slot_flags = SLOT_BACK
	caliber = CAL_SHOTGUN
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	max_shells = 6
	fire_sound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 15, MATERIAL_STEEL = 5)
	price_tag = 500
	damage_multiplier = 0.8
	recoil_buildup = 15
	one_hand_penalty = 30
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/revolver/sixshot/sawn
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)

/obj/item/gun/projectile/revolver/sixshot/conversion
	name = "\"Ten-Shot\" conversion shotgun"
	desc = "A unique, revolving shotgun using a revolver cylinder. You can't tell if the person who made it deserves an award or to be tried as a criminal. This one has been given a belt \
	fed conversion that increases its capacity by four additional slugs."
	icon = 'icons/obj/guns/projectile/sixshotconversion.dmi'
	icon_state = "sixshot_belt"
	max_shells = 10
	matter = list(MATERIAL_PLASTEEL = 24, MATERIAL_WOOD = 15, MATERIAL_STEEL = 5)
	price_tag = 600
	recoil_buildup = 12 // Added weight for better control.
	one_hand_penalty = 50 // But now its unwieldy as fuck. -Kaz
	saw_off = FALSE

/obj/item/gun/projectile/revolver/sixshot/update_icon()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(wielded)
		itemstring += "_doble"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/revolver/sixshot/sawn
	name = "sawn-off \"Six-Shot\" revolving shotgun"
	desc = "An absolutely mutilated Six-Shot revolving shotgun. The mad-man who did this lobbed off the stock into just a wood pistol grip and shortened the barrel to be barely longer than the cylinder."
	icon = 'icons/obj/guns/projectile/sawnoff/sixshot.dmi'
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_PAINFUL
	slot_flags = SLOT_BACK|SLOT_BELT|SLOT_HOLSTER
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_WOOD = 5, MATERIAL_STEEL= 5)
	price_tag = 250
	damage_multiplier = 0.7
	penetration_multiplier = 0.8
	recoil_buildup = 20 //Still a shotgun
	one_hand_penalty = 26