/obj/item/gun/projectile/automatic/omnirifle/omnicarbine/solmarine
	name = "\"Solarian\" carbine"
	desc = "An ancient looking rifle found commonly in the Sol Federation's old military stockpiles. Reliable but heavily dated. \
		 It appears to have been converted at some point to chamber in .257, possibly having taken different rounds at some point. \
		 Someone.. also thought it was a good idea to slap some sort of underbarrel shotgun to it. Clunky, but it works!"
	icon = 'icons/obj/guns/projectile/solmarine.dmi'
	icon_state = "solmarine"
	item_state = "solmarine"
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 6)
	mag_well = MAG_WELL_STANMAG
	caliber = CAL_LRIFLE
	price_tag = 1250
	damage_multiplier = 1.0
	penetration_multiplier = 1.2
	recoil_buildup = 2
	one_hand_penalty = 25
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND,
		list(mode_name="fire shotgun", mode_desc="Shoot the underbarrel shotgun",  burst=null, fire_delay=null, move_delay=null,  icon="grenade", use_launcher=1)
		)
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/automatic/omnirifle/omnicarbine/solmarine/sawn
	serial_type = "Sol Fed"

	var/obj/item/gun/projectile/automatic/underslung/shotgun_3/shotgun
	var/shotgun_haver = TRUE

/obj/item/gun/projectile/automatic/omnirifle/omnicarbine/solmarine/Initialize()
	. = ..()
	if(shotgun_haver)
		shotgun = new(src)

/obj/item/gun/projectile/automatic/omnirifle/omnicarbine/solmarine/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(cur_mode.settings["use_launcher"])
		//We trigger like this three times, and then if nothing is inside the pistol swap back to are normal shotgun mode
		shotgun.Fire(target, user, params, pointblank, reflex)
		if(!shotgun.contents)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/gun/projectile/automatic/omnirifle/omnicarbine/solmarine/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/ammo_casing/shotgun)) && shotgun_haver)
		shotgun.load_ammo(I, user)
	else
		..()

/obj/item/gun/projectile/automatic/underslung/shotgun_3
	name = "built in shotgun"
	desc = "Not much more than a tube and a firing mechanism, this shotgun is designed to be fitted to another gun."
	fire_sound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/shotgun_insert.ogg'
	w_class = ITEM_SIZE_NORMAL
	matter = null
	force = 5
	max_shells = 3
	recoil_buildup = 8
	safety = FALSE
	twohanded = FALSE
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	caliber = CAL_SHOTGUN
	handle_casings = EJECT_CASINGS
	init_firemodes = list(
		list(mode_name = "semiauto",  mode_desc = "Fire as fast as you can pull the trigger", burst=1, fire_delay=2.5, move_delay=null, icon="semi"),
		)
	serial_type = "H&S"

/obj/item/gun/projectile/automatic/omnirifle/omnicarbine/solmarine/sawn
	name = "sawn down \"Solarian\" carbine"
	desc = "An ancient looking rifle found commonly in the Sol Federation's old military stockpiles. Reliable but heavily dated. \
		 It appears to have been converted at some point to chamber in .257, possibly having taken different rounds at some point. \
		 Someone butchered this thing beyond recognition! At least it fits in a holster."
	icon = 'icons/obj/guns/projectile/sawnoff/solmarine.dmi'
	icon_state = "solmarine"
	item_state = "solmarine"
	damage_multiplier = 0.8
	price_tag = 650
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	w_class = ITEM_SIZE_SMALL
	can_dual = TRUE
	recoil_buildup = 4
	one_hand_penalty = 20
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)

	shotgun_haver = FALSE
