/obj/item/gun/projectile/shotgun/slidebarrel
	name = "slide barrel shotgun"
	desc = "Held together by duct tape and murderous intent, this makeshift shotgun holds a single shot in its sliding barrel. \
			The crude mechanism forces you to manually eject each fired round, but at least it fits in a holster for a quickdraw surprise."
	icon = 'icons/obj/guns/projectile/slideshotgun.dmi'
	icon_state = "abeinator"
	item_state = "abeinator"
	max_shells = 1
	handle_casings = HOLD_CASINGS
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	can_dual = TRUE
	fire_sound = 'sound/weapons/guns/fire/max_sawn_off.ogg'
	matter = list(MATERIAL_STEEL = 20, MATERIAL_WOOD = 10)
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_PAINFUL
	damage_multiplier = 0.8
	init_recoil = RIFLE_RECOIL(1.6)
	price_tag = 250 //cheap as they get
	serial_type = "INDEX"
	serial_shown = FALSE
	var/bolt_open = 0
	wield_delay = 0.2 SECOND // It shouldn't be slower to dual than an actual non-sawn double barrel. It's way smaller.
	wield_delay_factor = 0.2 // 20 vig, not gonna make it instant like a sawn off despite being the same size for balance reasons.
	gun_parts = list(/obj/item/part/gun/frame/slideshot = 1, /obj/item/part/gun/grip/wood = 1 , /obj/item/part/gun/mechanism/shotgun/steel = 1, /obj/item/part/gun/barrel/shotgun/steel = 1)

/obj/item/gun/projectile/shotgun/slidebarrel/update_icon()
	..()
	var/iconstring = initial(icon_state)
	if (bolt_open)
		iconstring += "_open"
	icon_state = iconstring

// We basically operate like a double barrel does. Except single shot.
/obj/item/gun/projectile/shotgun/slidebarrel/attack_self(mob/user)
	if(zoom)
		toggle_scope(user)
		return
	bolt_act(user)

/obj/item/gun/projectile/shotgun/slidebarrel/proc/bolt_act(mob/living/user)
	bolt_open = !bolt_open
	if(bolt_open)
		playsound(src.loc, 'sound/weapons/guns/interact/batrifle_magout.ogg', 75, 1)
		to_chat(user, SPAN_NOTICE("You pull the barrel open."))
		unload_ammo(user, allow_dump=1)
		side_loading(user)
	else
		playsound(src.loc, 'sound/weapons/guns/interact/lmg_cock.ogg', 75, 1)
		to_chat(user, SPAN_NOTICE("You slide the barrel closed."))
		bolt_open = 0
	add_fingerprint(user)
	update_icon()

/obj/item/part/gun/frame/slideshot
	name = "Homemade shotgun frame"
	desc = "A homemade slide shotgun frame. Cobbled together from scrap metal and wood, it can take either shotgun or .50 Kurz cheap barrels."
	icon_state = "frame_slideshot"
	matter = list(MATERIAL_STEEL = 8)
	resultvars = list(/obj/item/gun/projectile/shotgun/slidebarrel)
	gripvars = list(/obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/shotgun/steel
	barrelvars = list(/obj/item/part/gun/barrel/shotgun/steel, /obj/item/part/gun/barrel/kurz/steel)	//shotgun or .50 Kurz.
	nra = FALSE		//This controls if the weapon checks for barrels or not. If you want a gun to have MULTIPLE calibers that it can be chambered in, put FALSE.
