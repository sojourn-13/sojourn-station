/obj/item/gun/projectile/automatic/alemao
	name = "\"O Alemao\" auto-pistol"
	desc = "An old-world pistol mutilated and modified into an SMG of sorts. Compact, high rate of fire, but rather.. shoddily made. You swear you can see the welding lines; figures, it's made by Nadezhda Marshals gunsmiths. \
	It appears to only be able to take .35 pistol magazines; being unfit for SMG magazines due to their smaller width. It almost looks good in a way! Almost.."
	icon = 'icons/obj/guns/projectile/alemao.dmi'
	icon_state = "alemao"
	item_state = "alemao"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_PISTOL
	mag_well = MAG_WELL_PISTOL|MAG_WELL_H_PISTOL
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_WOOD = 4)
	price_tag = 550
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35)
	damage_multiplier = 0.9
	recoil_buildup = 3
	one_hand_penalty = 10
	load_method = MAGAZINE
	init_firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=1.5, move_delay=null, 	icon="semi"),
		list(mode_name="2-round bursts", burst=2, fire_delay=2, move_delay=2,    	icon="burst"),
		)

/obj/item/gun/projectile/automatic/alemao/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)
