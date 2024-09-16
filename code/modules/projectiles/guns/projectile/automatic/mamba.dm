/////////////////////////
//6.5mm Mamba, Standard//
/////////////////////////
/obj/item/gun/projectile/automatic/mamba
	name = "\"Mamba\" carbine"
	desc = "Produced cheaply, versatile and made for mass usage are all traits of the 6.5mm \"Mamba\" carbine. Made by Nadezhda Marshal gunsmiths to be used in both close and mid-range combat the Mamba sports a folding adjustable stock and a holographic sight."
	icon_state = "mamba"
	item_state = "mamba"
	icon = 'icons/obj/guns/projectile/mamba.dmi'
	fire_sound = 'sound/weapons/guns/fire/carbine.ogg'
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BACK
	caliber = CAL_LRIFLE
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 10)
	damage_multiplier = 1
	penetration_multiplier = 1
	extra_damage_mult_scoped = 0.2
	zoom_factors = list(0.8)
	price_tag = 950
	init_recoil = CARBINE_RECOIL(1)
	folding_stock = TRUE
	can_dual = FALSE //please god please please NO MORE NO MORE GOD, PLEASE
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_MAGWELL, GUN_SIGHT)
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND,
		FULL_AUTO_300
		)
	serial_type = "NM"
	gun_parts = list(/obj/item/part/gun/frame/mamba = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/srifle = 1)

/obj/item/gun/projectile/automatic/mamba/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(!folded)
		iconstring += "_stock"

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if(wielded)
		itemstring += "_doble"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/mamba/Initialize()
	. = ..()
	update_icon()

/////////////////////////////////////////
//7.62mm Copperhead w/ grenade launcher//
/////////////////////////////////////////
/obj/item/gun/projectile/automatic/mamba/copperhead
	name = "\"Copperhead\" battle rifle"
	desc = "The \"Copperhead\" rifle appears to be a design based off the Nadezhda Marshal's \"Mamba\" carbine, chambered in 7.62mm and sporting a carry handle the Copperhead is intended both as a squad support weapon and as a battle rifle, sporting a recoil compensating stock as well as an underbarrel grenade launcher to ensure both uses."
	icon_state = "copperhead"
	item_state = "copperhead"
	icon = 'icons/obj/guns/projectile/copperhead.dmi'
	fire_sound = 'sound/weapons/guns/fire/rifle.ogg'
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	caliber = CAL_RIFLE
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 10)
	price_tag = 1200
	damage_multiplier = 1.2
	penetration_multiplier = 1.1
	zoom_factors = list(0.4)
	init_recoil = CARBINE_RECOIL(1)
	folding_stock = FALSE
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		FULL_AUTO_300,
		list(mode_name="fire 40mm grenade", mode_desc="Shoot the built in underbarrel grenade launcher",  burst=1, fire_delay=null, move_delay=null,  icon="grenade", use_launcher=1)
		)
	gun_parts = list(/obj/item/part/gun/frame/mamba = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/lrifle = 1)
	var/obj/item/gun/projectile/underslung/launcher

/obj/item/gun/projectile/automatic/mamba/copperhead/Initialize()
	. = ..()
	launcher = new(src)

/obj/item/gun/projectile/automatic/mamba/copperhead/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/ammo_casing/grenade)))
		launcher.load_ammo(I, user)
	else
		..()

/obj/item/gun/projectile/automatic/mamba/copperhead/attack_hand(mob/user)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(user.get_inactive_hand() == src && cur_mode.settings["use_launcher"])
		launcher.unload_ammo(user)
	else
		..()

/obj/item/gun/projectile/automatic/mamba/copperhead/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(cur_mode.settings["use_launcher"])
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/gun/projectile/automatic/mamba/copperhead/Initialize()
	. = ..()
	update_icon()


/obj/item/gun/projectile/automatic/mamba/copperhead/examine(mob/user)
	..()
	if(launcher.loaded.len)
		to_chat(user, "\The [launcher] has \a [launcher.chambered] loaded.")
	else
		to_chat(user, "\The [launcher] is empty.")

//////////////////
//7.62mm Python//
/////////////////
/obj/item/gun/projectile/automatic/mamba/python
	name = "\"Python\" heavy sniper"
	desc = "A fine work of the Nadezhda Marshal gunsmiths is the Python, a heavy rifle with a state of the art smart scope displaying wind speeds, built in range finding, nightvision capability, and an internal stabilization system. Chambered in 7.62mm for stability, the normally mediocre round punches above its weight to compete with larger 8.6x70mm rifles."
	icon_state = "python"
	item_state = "python"
	icon = 'icons/obj/guns/projectile/python.dmi'
	fire_sound = 'sound/weapons/guns/fire/python.ogg'
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	caliber = CAL_RIFLE
	mag_well = MAG_WELL_RIFLE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 12)
	price_tag = 1400
	fire_delay = 15
	damage_multiplier = 1.2
	penetration_multiplier = 1.4
	zoom_factors = list(1.2)
	extra_damage_mult_scoped = 0.4
	init_recoil = CARBINE_RECOIL(1.2)
	see_invisible_gun = SEE_INVISIBLE_NOLIGHTING
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_SIGHT)
	folding_stock = FALSE
	init_firemodes = list(
		list(mode_name="semi-automatic", mode_desc = "A semi-automatic firemode.", mode_type = /datum/firemode/automatic, fire_delay=15, icon="semi"
		))

	wield_delay = 1.5 SECOND
	wield_delay_factor = 0.4 // 40 vig to insta wield , heavy class rifle

/obj/item/gun/projectile/automatic/mamba/python/Initialize()
	. = ..()

/obj/item/part/gun/frame/mamba
	name = "Mamba frame"
	desc = "An Mamba carbine frame. A sleek operator's dream."
	icon_state = "frame_mamba"
	matter = list(MATERIAL_PLASTEEL = 8)
	result = /obj/item/gun/projectile/automatic/mamba
	gripvars = list(/obj/item/part/gun/grip/black, /obj/item/part/gun/grip/rubber)
	resultvars = list(/obj/item/gun/projectile/automatic/mamba, /obj/item/gun/projectile/automatic/mamba/copperhead)
	mechanismvar = /obj/item/part/gun/mechanism/autorifle
	barrelvars = list(/obj/item/part/gun/barrel/srifle, /obj/item/part/gun/barrel/lrifle)
