/obj/item/gun/projectile/automatic/omnirifle/solmarine
	name = "\"Solarian\" carbine"
	desc = "An ancient looking rifle found commonly in the Sol Federation's old military stockpiles. Reliable but heavily dated. \
		 It appears to have been converted at some point to chamber in .257, possibly having taken different rounds at some point. \
		 Someone.. also thought it was a good idea to slap some sort of underbarrel shotgun to it. Clunky, but it works!"
	icon = 'icons/obj/guns/projectile/solmarine.dmi'
	icon_state = "solmarine"
	item_state = "solmarine"
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 6)
	w_class = ITEM_SIZE_BULKY
	mag_well = MAG_WELL_RIFLE
	caliber = CAL_LRIFLE
	fire_sound = 'sound/weapons/guns/fire/carbine_fire.ogg'
	price_tag = 1100
	damage_multiplier = 1.0
	penetration_multiplier = 1.2
	init_recoil = CARBINE_RECOIL(1.1)
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND,
		list(mode_name="fire shotgun", mode_desc="Shoot the underbarrel shotgun",  burst=null, fire_delay=null, move_delay=null,  icon="grenade", use_launcher=1)
		)
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/automatic/omnirifle/solmarine/sawn
	serial_type = "Sol Fed"
	wield_delay = 1 SECOND
	wield_delay_factor = 0.3 // 30 vig for insta wield


	var/obj/item/gun/projectile/automatic/underslung/shotgun_3/shotgun
	var/shotgun_haver = TRUE
	gun_parts = list(/obj/item/part/gun/frame/solmarine = 1, /obj/item/part/gun/grip/serb = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/srifle = 1)

/obj/item/gun/projectile/automatic/omnirifle/solmarine/Initialize()
	. = ..()
	if(shotgun_haver)
		shotgun = new(src)

/obj/item/gun/projectile/automatic/omnirifle/solmarine/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(cur_mode.settings["use_launcher"])
		//We trigger like this three times, and then if nothing is inside the pistol swap back to are normal shotgun mode
		shotgun.Fire(target, user, params, pointblank, reflex)
		if(!shotgun.contents)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/gun/projectile/automatic/omnirifle/solmarine/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/ammo_casing/shotgun)) && shotgun_haver)
		shotgun.load_ammo(I, user)
	else
		..()

/obj/item/gun/projectile/automatic/underslung/shotgun_3
	name = "built in shotgun"
	desc = "Not much more than a tube and a firing mechanism, this shotgun is designed to be fitted to another gun."
	fire_sound = 'sound/weapons/guns/fire/shotgun_fire.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/shotgun_insert.ogg'
	w_class = ITEM_SIZE_NORMAL
	matter = null
	force = 5
	max_shells = 3
	init_recoil = RIFLE_RECOIL(1.2)
	safety = FALSE
	twohanded = FALSE
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/shotgun
	caliber = CAL_SHOTGUN
	handle_casings = EJECT_CASINGS
	init_firemodes = list(
		list(mode_name = "semiauto",  mode_desc = "Fire as fast as you can pull the trigger", burst=1, fire_delay=2.5, move_delay=null, icon="semi"),
		)
	serial_type = "H&S"

/obj/item/gun/projectile/automatic/omnirifle/solmarine/sawn
	name = "sawn down \"Solarian\" carbine"
	desc = "An ancient looking rifle found commonly in the Sol Federation's old military stockpiles. Reliable but heavily dated. \
		 It appears to have been converted at some point to chamber in .257, possibly having taken different rounds at some point. \
		 It is butchered beyond recognition! At least it fits in a holster..."
	icon = 'icons/obj/guns/projectile/sawnoff/solmarine.dmi'
	icon_state = "solmarine"
	item_state = "solmarine"
	damage_multiplier = 0.8
	price_tag = 650
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_PLASTEEL = 6, MATERIAL_PLASTIC = 3)
	gun_parts = list(/obj/item/part/gun/grip/serb = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/stack/material/plasteel = 2)
	can_dual = TRUE
	init_recoil = CARBINE_RECOIL(1.2)
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)

	shotgun_haver = FALSE
	wield_delay = 0.1 SECOND
	wield_delay_factor = 0.1 // 10 vig for insta wield

/obj/item/gun/projectile/automatic/omnirifle/solmarine/shotgunless
	name = "\"Saturnian\" carbine"
	desc = "An ancient design that predates mass autolathe-printed rifles found commonly in the Sol Federation's oldest military stockpiles. Reliable but heavily dated. \
		 Unlike other old Sol models, this one was always intented to be a .257."
	icon = 'icons/obj/guns/projectile/martian.dmi'
	icon_state = "service"
	item_state = "service"
	matter = list(MATERIAL_IRON = 20, MATERIAL_PLASTIC = 16)
	shotgun_haver = FALSE
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL, GUN_SILENCABLE, GUN_KNIFE)	//No shotgun, so it can take a bayonet.
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/automatic/omnirifle/solmarine/shotgunless_sawn
	serial_type = "Sol Fed"
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)
	gun_parts = list(/obj/item/part/gun/frame/solmarine = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/srifle = 1)
	wield_delay = 0.2 SECOND
	wield_delay_factor = 0.2 // 20 vig for insta wield

/obj/item/gun/projectile/automatic/omnirifle/solmarine/shotgunless/update_icon()
	..()
	cut_overlays()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (bayonet)
		add_overlay("bayonet")

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/omnirifle/solmarine/shotgunless/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/projectile/automatic/omnirifle/solmarine/shotgunless_sawn
	name = "sawn down \"Saturnian\" carbine"
	desc = "An ancient design that predates mass autolathe-printed rifles found commonly in the Sol Federation's oldest military stockpiles. Reliable but heavily dated. \
		 Unlike other old stocks this one was always intented to be a .257.\
		 Someone butchered this thing beyond recognition! At least it fits in a holster now."
	icon = 'icons/obj/guns/projectile/sawnoff/solmarine.dmi'
	matter = list(MATERIAL_IRON = 10, MATERIAL_PLASTIC = 8)
	init_recoil = CARBINE_RECOIL(1.2)
	damage_multiplier = 0.8
	price_tag = 650
	icon_state = "solmarine"
	item_state = "solmarine"
	gun_parts = list(/obj/item/part/gun/grip/serb = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/stack/material/plasteel = 2)
	shotgun_haver = FALSE
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)
	wield_delay = 0.1 SECOND
	wield_delay_factor = 0.01 // 1 vig for insta wield


/obj/item/part/gun/frame/solmarine
	name = "Solmarine frame"
	desc = "A Solmarine carbine frame. For those who want to be re-enactors of soldiers from 600 years ago."
	icon_state = "frame_sol"
	matter = list(MATERIAL_PLASTEEL = 8)
	result = /obj/item/gun/projectile/automatic/omnirifle/solmarine/shotgunless
	gripvars = list(/obj/item/part/gun/grip/serb, /obj/item/part/gun/grip/black, /obj/item/part/gun/grip/rubber)
	resultvars = list(/obj/item/gun/projectile/automatic/omnirifle/solmarine, /obj/item/gun/projectile/automatic/omnirifle/solmarine/shotgunless, /obj/item/gun/projectile/automatic/mercu)
	mechanismvar = /obj/item/part/gun/mechanism/autorifle
	barrelvars = list(/obj/item/part/gun/barrel/srifle, /obj/item/part/gun/barrel/clrifle)
