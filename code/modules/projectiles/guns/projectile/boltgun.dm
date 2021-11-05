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
	recoil_buildup = 40 //same as AMR
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|SPEEDLOADER
	max_shells = 10
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'
	reload_sound = 'sound/weapons/guns/interact/rifle_load.ogg'
	fire_sound_silenced = 'sound/weapons/guns/fire/hpistol_fire.ogg' //It makes it more quite but still a high caliber
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 500
	one_hand_penalty = 15 //full sized rifle with bayonet is hard to keep on target
	var/bolt_open = 0
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut") // Considering attached bayonet
	sharp = TRUE //We have a knife!
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_BAYONET, GUN_SCOPE, GUN_SILENCABLE)
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/boltgun/sawn/true
	var/bolt_training = TRUE
	eject_animatio = TRUE //we infact have bullet animations

/obj/item/gun/projectile/boltgun/sawn //subtype for code
	name = "\"obrez\" boltgun"
	desc = "A crudly mangled and sawn-down 7.5mm bolt action rifle. Rifle was fine."
	icon = 'icons/obj/guns/projectile/sawnoff/boltgun.dmi'
	icon_state = "obrez"
	item_state = "obrez"
	force = WEAPON_FORCE_NORMAL
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	price_tag = 75
	sharp = 0
	recoil_buildup = 50
	penetration_multiplier = 0.5
	damage_multiplier = 0.9
	fire_delay = 4
	one_hand_penalty = 10
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SILENCABLE)
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 4)
	saw_off = FALSE
	bolt_training = FALSE //Trainning didnt cover obrez

/obj/item/gun/projectile/boltgun/sawn/true //used for the Kardashev-Mosin, so we dont cheat crafting menus

/obj/item/gun/projectile/boltgun/update_icon()
	..()

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
		if(contents.len || loaded.len)
			if(chambered)
				if(eject_animatio && loaded.len) //Are bullet amination check
					if(silenced)
						flick("bullet_eject_s", src)
					else
						flick("bullet_eject", src)
				to_chat(user, SPAN_NOTICE("You work the bolt open, ejecting [chambered]!"))
				chambered.forceMove(get_turf(src))
				loaded -= chambered
				chambered = null
			else
				if(eject_animatio && loaded.len) //Are bullet amination check
					if(silenced)
						flick("bullet_eject_s", src)
					else
						flick("bullet_eject", src)
				var/obj/item/ammo_casing/B = loaded[loaded.len]
				to_chat(user, SPAN_NOTICE("You work the bolt open, ejecting [B]!"))
				B.forceMove(get_turf(src))
				loaded -= B
		else
			to_chat(user, SPAN_NOTICE("You work the bolt open."))
	else
		to_chat(user, SPAN_NOTICE("You work the bolt closed."))
		playsound(src.loc, 'sound/weapons/guns/interact/rifle_boltforward.ogg', 75, 1)
		bolt_open = 0
	if(user)
		add_fingerprint(user)
	update_icon()

/obj/item/gun/projectile/boltgun/special_check(mob/user)
	if(bolt_open)
		to_chat(user, SPAN_WARNING("You can't fire [src] while the bolt is open!"))
		return 0
	return ..()

/obj/item/gun/projectile/boltgun/load_ammo(var/obj/item/A, mob/user)
	if(!bolt_open)
		return
	..()

/obj/item/gun/projectile/boltgun/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		return
	..()
