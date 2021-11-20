/obj/item/gun/projectile/automatic/maxim
	name = "Excelsior machine gun"
	desc = "An old and surprisingly deprecated gun from the Excelsior. One of their more dangerous weapons, effective at dealing with crowds or suppressing firing lines."
	icon = 'icons/obj/guns/projectile/maxim.dmi'
	icon_state = "maxim"
	item_state = "maxim"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	slot_flags = 0
	max_shells = 96
	caliber = CAL_RIFLE
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = MAGAZINE
	mag_well = MAG_WELL_PAN
	tac_reloads = FALSE
	matter = list(MATERIAL_PLASTEEL = 42, MATERIAL_PLASTIC = 15, MATERIAL_WOOD = 5)
	price_tag = 3000
	unload_sound 	= 'sound/weapons/guns/interact/lmg_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/lmg_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/lmg_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	recoil_buildup = 0.5
	one_hand_penalty = 30 //not like it's used anyway, but LMG level
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)
	twohanded = TRUE

	init_firemodes = list(
		FULL_AUTO_600,
		list(mode_name="short bursts", mode_desc="dakka 5 shots in quick succession", burst=5,    burst_delay=2, move_delay=6,  icon="burst"),
		list(mode_name="long bursts", mode_desc="Dakka 8 shots in succession",  burst=8, burst_delay=4, move_delay=8,  icon="burst"),
		list(mode_name="suppressing fire", mode_desc="DAKKA 16 shots back to back to keep targets inside cover",  burst=16, burst_delay=4, move_delay=11,  icon="burst")
		)

/obj/item/gun/projectile/automatic/maxim/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "[initial(icon_state)]-full"
		set_item_state("-full")
	else
		icon_state = initial(icon_state)
		set_item_state()
	return
