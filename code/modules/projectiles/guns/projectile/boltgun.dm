/obj/item/gun/projectile/boltgun
	name = "\"Kardashev-Mosin\" boltgun"
	desc = "Weapon for hunting or endless trench warfare. \
			If you're on a budget, it's a darn good rifle for just about everything."
	icon = 'icons/obj/guns/projectile/boltgun.dmi'
	icon_state = "boltgun"
	item_state = "boltgun"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_ROBUST
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	caliber = CAL_RIFLE
	fire_delay = 2
	damage_multiplier = 1.1
	penetration_multiplier  = 1.5
	init_recoil = HMG_RECOIL(0.6)
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|SPEEDLOADER
	max_shells = 10
	fire_sound = 'sound/weapons/guns/fire/mosin_fire.ogg'
	reload_sound = 'sound/weapons/guns/interact/rifle_load.ogg'
	fire_sound_silenced = 'sound/weapons/guns/fire/rifle_silenced.ogg' // More cohesive sound, still loud for its caliber
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 500
	var/bolt_open = 0
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut") // Considering attached bayonet
	sharp = TRUE //We have a knife!
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_BAYONET, GUN_SCOPE, GUN_SILENCABLE)
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/boltgun/sawn/true
	var/bolt_training = TRUE
	eject_animatio = TRUE //we infact have bullet animations
	allow_racking = FALSE
	perk_plusone_eligible = TRUE //Lib sideload port - this and the one below.
	alt_plus_one_loading = TRUE
	serial_type = "Hunter Inc"

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // 20 vig
	gun_parts = list(/obj/item/part/gun/frame/boltgun = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/boltgun = 1, /obj/item/part/gun/barrel/lrifle = 1)

/obj/item/gun/projectile/boltgun/sawn //subtype for code
	name = "\"obrez\" mosin boltgun"
	desc = "A crudely mangled and sawn-down 7.62mm bolt action rifle. The rifle was fine before."
	icon = 'icons/obj/guns/projectile/sawnoff/boltgun.dmi'
	icon_state = "obrez"
	item_state = "obrez"
	force = WEAPON_FORCE_NORMAL
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	price_tag = 75
	sharp = 0
	init_recoil = HMG_RECOIL(0.8)
	penetration_multiplier = 0.5
	damage_multiplier = 0.9
	fire_delay = 4
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SILENCABLE)
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 4)
	saw_off = FALSE
	bolt_training = FALSE //Training didnt cover obrez
	gun_parts = list(/obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/boltgun = 1, /obj/item/stack/material/plasteel = 2)

/obj/item/gun/projectile/boltgun/sawn/true //used for the Kardashev-Mosin, so we dont cheat crafting menus

/obj/item/gun/projectile/boltgun/update_icon()
	..()
	cut_overlays()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (item_suffix)
		itemstring += "[item_suffix]"

	if (bolt_open)
		iconstring += "_open"
	else
		iconstring += "_closed"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	if (bayonet)	//Used not for base Mosin, but any sub-types that end up able to take bayonets.
		add_overlay("bayonet")

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/boltgun/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/projectile/boltgun/attack_self(mob/user) //Someone overrode attackself for this class, soooo.
	if(zoom)
		toggle_scope(user)
		return
	bolt_act(user)

/obj/item/gun/projectile/boltgun/handle_post_fire(mob/user)
	..()
	if(bolt_training && user.stats.getPerk(PERK_BOLT_REFLECT) && loaded.len>0)
		to_chat(user, SPAN_NOTICE("Your hands move instinctively to chamber a new round!"))
		bolt_act(user)
		bolt_act(user)
		return
	if(bolt_training && user.stats.getPerk(PERK_BOLT_REFLECT) && loaded.len==0)
		to_chat(user, SPAN_NOTICE("You stop your hands from instinctively chambering a new round."))
		bolt_act(user)
		return

/obj/item/gun/projectile/boltgun/proc/bolt_act(mob/living/user)
	playsound(src.loc, 'sound/weapons/guns/interact/rifle_boltback.ogg', 75, 1)
	bolt_open = !bolt_open
	if(bolt_open)
		var/print_string = "You work the bolt open."
		if(loaded.len)
			if(chambered)
				if(eject_animatio && loaded.len) // Our bullet animation check
					if(silenced)
						flick("bullet_eject_s", src)
					else
						flick("bullet_eject", src)
					print_string = "You work the bolt open, ejecting [chambered]!"
					chambered.forceMove(get_turf(src))
					loaded -= chambered
					chambered = null
			else
				if(eject_animatio && loaded.len) // Our bullet animation check
					if(silenced)
						flick("bullet_eject_s", src)
					else
						flick("bullet_eject", src)
				if(LAZYLEN(loaded))
					var/obj/item/ammo_casing/B = loaded[loaded.len]
					print_string = "You work the bolt open, ejecting [B]!"
					B.forceMove(get_turf(src))
					loaded -= B
		side_loading(user)

		to_chat(user, SPAN_NOTICE(print_string))
	else
		to_chat(user, SPAN_NOTICE("You work the bolt closed."))
		playsound(src.loc, 'sound/weapons/guns/interact/rifle_boltforward.ogg', 75, 1)
		bolt_open = 0
	if(user)
		add_fingerprint(user)
	update_icon()

/obj/item/gun/projectile/boltgun/process_chambered()
	..()
	if(LAZYLEN(loaded))
		var/obj/item/ammo_casing/B = loaded[1]
		if(B.is_caseless && !B.BB)
			loaded -= B
			QDEL_NULL(B)

/obj/item/gun/projectile/boltgun/special_check(mob/user)
	if(bolt_open)
		to_chat(user, SPAN_WARNING("You can't fire [src] while the bolt is open!"))
		return 0
	return ..()

/obj/item/gun/projectile/boltgun/load_ammo(var/obj/item/A, mob/user)
	if(istype(A, /obj/item/ammo_casing)) // Should prevent the following message while sawing down the gun or adding a mod. - Seb
		if(!bolt_open)
			to_chat(user, SPAN_WARNING("You cannot add in ammo to \the [src] while the bolt is closed!"))
			return
	..()

/obj/item/gun/projectile/boltgun/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		to_chat(user, SPAN_WARNING("You can't take ammo out of \the [src] while the bolt is closed!"))
		return
	..()

/obj/item/part/gun/frame/boltgun
	name = "bolt-action rifle frame"
	desc = "A bolt-action rifle frame. For hunting or endless trench warfare."
	icon_state = "frame_serbrifle"
	result = /obj/item/gun/projectile/boltgun
	gripvars = list(/obj/item/part/gun/grip/black, /obj/item/part/gun/grip/wood)
	resultvars = list(/obj/item/gun/projectile/boltgun, /obj/item/gun/projectile/boltgun/sa)
	mechanismvar = /obj/item/part/gun/mechanism/boltgun
	barrelvars = list(/obj/item/part/gun/barrel/lrifle, /obj/item/part/gun/barrel/lrifle/steel) // Novakovic is cheap, Mosin is good barrel
