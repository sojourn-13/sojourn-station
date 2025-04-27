/obj/item/gun/projectile/automatic/maxim
	name = "Excelsior \"Maxim\" machine gun"
	desc = "\"There is only one way in which the murderous death agonies of the old society and the bloody birth throes of the new society can be shortened, \
			simplified and concentrated, and that way is revolutionary terror.\"\nAn old and unsurprisingly deprecated gun from the Excelsior. \
			One of their most dangerous weapons, effective at dealing with crowds or suppressing firing lines. Uses the unique 7.5mm pan-magazines."
	icon = 'icons/obj/guns/projectile/maxim.dmi'
	icon_state = "maxim"
	item_state = "maxim"
	excelsior = TRUE
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	slot_flags = SLOT_BACK
	max_shells = 1
	slowdown_hold = 1
	caliber = CAL_RIFLE
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PAN
	tac_reloads = FALSE
	matter = list(MATERIAL_PLASTEEL = 42, MATERIAL_PLASTIC = 20)
	price_tag = 2500
	unload_sound 	= 'sound/weapons/guns/interact/pan_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/lmg_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/lmg_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	init_recoil = HMG_RECOIL(0.8)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)
	twohanded = TRUE
	serial_type = "EXC"

	init_firemodes = list(
		FULL_AUTO_600,
		list(mode_name="short bursts", mode_desc="dakka 5 shots in quick succession", burst=5,    burst_delay=2, move_delay=6,  icon="burst"),
		list(mode_name="long bursts", mode_desc="Dakka 8 shots in succession",  burst=8, burst_delay=4, move_delay=8,  icon="burst"),
		list(mode_name="suppressing fire", mode_desc="DAKKA 16 shots back to back to keep targets inside cover",  burst=16, burst_delay=4, move_delay=11,  icon="burst")
		)

	wield_delay = 2 SECOND
	wield_delay_factor = 0.5 // 50 vig , excels are not as trained
	gun_parts = list(/obj/item/part/gun/frame/maxim = 1, /obj/item/part/gun/grip/excel = 1, /obj/item/part/gun/mechanism/machinegun = 1, /obj/item/part/gun/barrel/lrifle = 1)


/obj/item/gun/projectile/automatic/maxim/NM_colony
	name = "\"Oprichnik\" machine gun"
	desc = "An old and unsurprisingly deprecated top feeding machine gun chambered in 7.5mm. A dangerous weapon effective at dealing with crowds or suppressing firing lines. Takes specialized pan-magazines from Excelsior Maxims, while being completely free from their taint."
	icon = 'icons/obj/guns/projectile/maxim_colony.dmi'
	icon_state = "maxim_bs"
	item_state = "maxim_bs"
	price_tag = 2000
	serial_type = "NM"
	excelsior = FALSE
	gun_parts = list(/obj/item/part/gun/frame/maxim = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/machinegun = 1, /obj/item/part/gun/barrel/lrifle = 1)

/obj/item/gun/projectile/automatic/maxim/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "[initial(icon_state)]-full"
		set_item_state("-full")
	else
		icon_state = initial(icon_state)
		set_item_state()
	return

/obj/item/part/gun/frame/maxim
	name = "Maxim frame"
	desc = "A Maxim HMG frame. Whatever happens, we have got the Maxim gun and they have not."
	icon_state = "frame_maxim"
	result = /obj/item/gun/projectile/automatic/maxim
	gripvars = list(/obj/item/part/gun/grip/excel, /obj/item/part/gun/grip/black)
	mechanismvar = /obj/item/part/gun/mechanism/machinegun
	barrelvars = list(/obj/item/part/gun/barrel/lrifle)
	resultvars = list(/obj/item/gun/projectile/automatic/maxim, /obj/item/gun/projectile/automatic/maxim/NM_colony)
