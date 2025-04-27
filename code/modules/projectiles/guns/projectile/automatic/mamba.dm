/////////////////////////
//.257 Mamba, Standard//
/////////////////////////
/obj/item/gun/projectile/automatic/mamba
	name = "\"Mamba\" carbine"
	desc = "Cheaply produced, versatile and made for mass usage are all traits of the .257 \"Mamba\" carbine. Made by Nadezhda Marshal gunsmiths to be used in both close and mid-range combat the Mamba sports an adjustable folding-stock and a holographic sight."
	icon_state = "mamba"
	item_state = "mamba"
	icon = 'icons/obj/guns/projectile/mamba.dmi'
	fire_sound = 'sound/weapons/guns/fire/carbine_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
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
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_MAGWELL, GUN_SIGHT, GUN_KNIFE)
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND,
		FULL_AUTO_300
		)
	serial_type = "NM"
	gun_parts = list(/obj/item/part/gun/frame/mamba = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/srifle = 1)

/obj/item/gun/projectile/automatic/mamba/update_icon()
	..()
	cut_overlays()
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

	if (bayonet)
		add_overlay("bayonet")

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/mamba/Initialize()
	. = ..()
	update_icon()

////////////////////
//7.5mm Viper DMR//
////////////////////
/obj/item/gun/projectile/automatic/mamba/viper
	name = "\"Viper\" marksman rifle"
	desc = "The \"Viper\" designated marksman rifle appears to be a design based off the Nadezhda Marshal's \"Mamba\" carbine. \
	Chambered in 7.5mm and sporting a special recoil-compensating stock, along with an improved scope, the \"Viper\" acts as a perfect intermediate rifle between that of a battle rifle and a sniper; perfect for flexibility in the field."
	icon_state = "viper"
	item_state = "viper"
	icon = 'icons/obj/guns/projectile/viper.dmi'
	fire_sound = 'sound/weapons/guns/fire/dmr_fire.ogg'
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	caliber = CAL_RIFLE
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 10)
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_MAGWELL, GUN_SIGHT)
	price_tag = 1200
	damage_multiplier = 1.2			//Better damage than AS-VAL, lacks autmatic fire
	penetration_multiplier = 1.2	//Same pen as AS-VAL
	extra_damage_mult_scoped = 0.2	//1.4 bonus damage when scoped. ZOOM.
	zoom_factors = list(0.8)
	init_recoil = RIFLE_RECOIL(1)	//Lower than AS-VAL
	folding_stock = FALSE
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND_NOLOSS,
		)
	gun_parts = list(/obj/item/part/gun/frame/mamba = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/lrifle = 1)

/////////////////////////////////////////
//7.5mm Copperhead w/ grenade launcher//
/////////////////////////////////////////
/obj/item/gun/projectile/automatic/mamba/copperhead
	name = "\"Copperhead\" battle rifle"
	desc = "The \"Copperhead\" rifle appears to be a design based off the Nadezhda Marshal's \"Mamba\" carbine. \
	Chambered in 7.5mm and sporting a carry handle the \"Copperhead\" is intended both as a squad support weapon and as a battle rifle sporting a recoil compensating stock as well as an underbarrel grenade launcher to ensure both uses."
	icon_state = "copperhead"
	item_state = "copperhead"
	icon = 'icons/obj/guns/projectile/copperhead.dmi'
	fire_sound = 'sound/weapons/guns/fire/dmr_fire.ogg'
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	caliber = CAL_RIFLE
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 10)
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_MAGWELL, GUN_SIGHT)
	price_tag = 1200
	damage_multiplier = 1.2			//Same as AK
	penetration_multiplier = 1.1	//Higher than AK
	zoom_factors = list(0.4)
	init_recoil = RIFLE_RECOIL(1)
	folding_stock = FALSE
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		FULL_AUTO_300,
		list(mode_name="fire 40mm grenade", mode_desc="Shoot the built in underbarrel grenade launcher",  burst=1, fire_delay=null, move_delay=null,  icon="grenade", use_launcher=1)
		)
	gun_parts = list(/obj/item/part/gun/frame/mamba = 1, /obj/item/part/gun/grip/serb = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/lrifle = 1)
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
//7.5mm Python//
/////////////////
/obj/item/gun/projectile/automatic/mamba/python
	name = "\"Python\" heavy sniper"
	desc = "A fine work of the Nadezhda Marshal gunsmiths is the Python, a heavy rifle with a state of the art smart scope displaying wind speeds, built in range finding, nightvision capability and an internal stabilization system. \
	Chambered in the heavy .408 for velocity and armor peircing capability, able to punch well above its weight even compared to other .408 rifles. However, due to its design, it seems incapable of taking drum magazines."
	icon_state = "python"
	item_state = "python"
	icon = 'icons/obj/guns/projectile/python.dmi'
	fire_sound = 'sound/weapons/guns/fire/python.ogg'
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	caliber = CAL_HRIFLE
	mag_well = MAG_WELL_HRIFLE		//No drum mags, for now. Smaller 14 round mags only due to how hard it slaps.
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 12)
	price_tag = 1400
	fire_delay = 10					//To avoid being a constant spam-click fire gun. Hits way too hard for fast fire rate.
	damage_multiplier = 1.2			//~33 damage base. Same as longarm.
	penetration_multiplier = 1.4
	zoom_factors = list(0.6, 1.2)
	extra_damage_mult_scoped = 0.4	//1.6 total; STRONG due to chambered in .408. ~42 damage base.
	init_recoil = RIFLE_RECOIL(0.8)	//More recoil than Longarm, because it slaps harder.
	see_invisible_gun = SEE_INVISIBLE_NOLIGHTING
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_MAGWELL, GUN_SIGHT)
	folding_stock = FALSE
	init_firemodes = list(
		list(mode_name="semi-automatic", mode_desc = "A semi-automatic firemode.", mode_type = /datum/firemode/automatic, fire_delay=10, icon="semi"
		))

	wield_delay = 1.5 SECOND
	wield_delay_factor = 0.5 // 50 vig to insta wield , heavy class sniper rifle

	//Can't be crafted rn, needs change made to ability to take gun barrel etc. So - you can break it down, but not create new ones.
	gun_parts = list(/obj/item/stack/material/plasteel = 5, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/hrifle = 1)

/obj/item/gun/projectile/automatic/mamba/python/Initialize()
	. = ..()

/obj/item/part/gun/frame/mamba
	name = "Mamba frame"
	desc = "An Mamba carbine frame. A sleek operator's dream."
	icon_state = "frame_mamba"
	matter = list(MATERIAL_PLASTEEL = 8)
	result = /obj/item/gun/projectile/automatic/mamba
	gripvars = list(/obj/item/part/gun/grip/black, /obj/item/part/gun/grip/serb, /obj/item/part/gun/grip/rubber)
	resultvars = list(/obj/item/gun/projectile/automatic/mamba, /obj/item/gun/projectile/automatic/mamba/copperhead, /obj/item/gun/projectile/automatic/mamba/viper)
	mechanismvar = /obj/item/part/gun/mechanism/autorifle
	barrelvars = list(/obj/item/part/gun/barrel/srifle, /obj/item/part/gun/barrel/lrifle)
