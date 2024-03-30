/obj/item/gun/projectile/shotgun/doublebarrel
	name = "double-barreled shotgun"
	desc = "An immortal classic in 20mm smoothbore."
	icon = 'icons/obj/guns/projectile/dshotgun.dmi'
	icon_state = "dshotgun"
	item_state = "dshotgun"
	//SPEEDLOADER because rapid unloading.
	//In principle someone could make a speedloader for it, so it makes sense.
	load_method = SINGLE_CASING|SPEEDLOADER
	handle_casings = CYCLE_CASINGS
	max_shells = 2
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	flags = CONDUCT
	slot_flags = SLOT_BACK
	caliber = CAL_SHOTGUN
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 1)
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	bulletinsert_sound 	= 'sound/weapons/guns/interact/shotgun_insert.ogg'
	fire_sound = 'sound/weapons/guns/fire/max_sawn_off.ogg' //Actual double barrel sound
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 10)
	price_tag = 600
	init_recoil = RIFLE_RECOIL(1.3)
	var/bolt_open = 0
	burst_delay = 0
	init_firemodes = list(
		list(mode_name="Single barrel", mode_desc="Shoots one barrel", burst=1, icon="semi"),
		list(mode_name="Double barrel", mode_desc="Shoots both barrels at once", burst=2, icon="burst"),
		)
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/shotgun/doublebarrel/sawn
	serial_type = "SA"
	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.3 // 30 vig , great as a surprise
	gun_parts = list(/obj/item/part/gun/frame/doublebarrel = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/shotgun = 1, /obj/item/part/gun/barrel/shotgun = 1)
	perk_plusone_eligible = FALSE

/obj/item/part/gun/frame/doublebarrel
	name = "double-barreled shotgun frame"
	desc = "A double-barreled shotgun frame. An immortal classic of cowboys and bartenders alike."
	icon_state = "frame_dshotgun"
	result = /obj/item/gun/projectile/shotgun/doublebarrel
	resultvars = list(/obj/item/gun/projectile/shotgun/doublebarrel)
	gripvars = list(/obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/shotgun
	barrelvars = list(/obj/item/part/gun/barrel/shotgun)

/obj/item/gun/projectile/shotgun/doublebarrel/update_icon()
	..()

	var/iconstring = initial(icon_state)

	if (bolt_open)
		iconstring += "_open"

	icon_state = iconstring

/obj/item/gun/projectile/shotgun/doublebarrel/attack_self(mob/user) //Someone overrode attackself for this class, soooo.
	if(zoom)
		toggle_scope(user)
		return
	bolt_act(user)

/obj/item/gun/projectile/shotgun/doublebarrel/proc/bolt_act(mob/living/user)
	bolt_open = !bolt_open
	if(bolt_open)
		playsound(src.loc, 'sound/weapons/guns/interact/shotgun_break.ogg', 75, 1)
		to_chat(user, SPAN_NOTICE("You snap the barrel open."))
		unload_ammo(user, allow_dump=1)
	else
		playsound(src.loc, 'sound/weapons/guns/interact/shotgun_close.ogg', 75, 1)
		to_chat(user, SPAN_NOTICE("You snap the barrel closed"))
		bolt_open = 0
	add_fingerprint(user)
	update_icon()

/obj/item/gun/projectile/shotgun/doublebarrel/special_check(mob/user)
	if(bolt_open)
		to_chat(user, SPAN_WARNING("You can't fire [src] while the barrel is open!"))
		return 0
	return ..()

/obj/item/gun/projectile/shotgun/doublebarrel/load_ammo(var/obj/item/A, mob/user)
	if(!bolt_open)
		to_chat(user, SPAN_WARNING("You can't load [src] while the barrel is closed!"))
		return
	..()

/obj/item/gun/projectile/shotgun/doublebarrel/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		return
	..()

//Subtypes

/obj/item/gun/projectile/shotgun/doublebarrel/pellet
	ammo_type = /obj/item/ammo_casing/shotgun/pellet

/obj/item/gun/projectile/shotgun/doublebarrel/flare
	name = "signal shotgun"
	desc = "A double-barreled shotgun meant to fire signal illumination shells."
	ammo_type = /obj/item/ammo_casing/shotgun/illumination

/obj/item/gun/projectile/shotgun/doublebarrel/sawn
	name = "sawn-off shotgun"
	desc = "Omar's coming!"
	icon = 'icons/obj/guns/projectile/sawnoff/sawnshotgun.dmi'
	icon_state = "sawnshotgun"
	item_state = "sawnshotgun"
	gun_parts = list(/obj/item/stack/material/wood = 2, /obj/item/part/gun/mechanism/shotgun = 1, /obj/item/stack/material/plasteel = 2)
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	can_dual = TRUE
	caliber = CAL_SHOTGUN
	ammo_type = /obj/item/ammo_casing/shotgun/pellet
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_WOOD = 10)
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_PAINFUL
	damage_multiplier = 0.8 //slightly weaker due to sawn-off barrels
	init_recoil = RIFLE_RECOIL(1.1)
	saw_off = FALSE

	wield_delay = 0 SECOND //KER-BLAM!!!

/obj/item/gun/projectile/shotgun/doublebarrel/axe
	name = "axe double-barreled shotgun"
	desc = "A mutilated clasic shotgun chambered in 20mm, this one complete with an axe head towards the barrels!"
	icon_state = "bshotgun"
	item_state = "bshotgun"
	damage_multiplier = 0.8 //slightly weaker due to the fact - you know, you put a fucking axe on it.
	init_recoil = RIFLE_RECOIL(1)
	saw_off = FALSE
	sharp = TRUE //Duh, it's an axe.
	force = WEAPON_FORCE_ROBUST
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG,GUN_BAYONET)
