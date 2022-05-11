/obj/item/gun/projectile/other/compensator
	name = "Artificer's Guild 'Compensator' Elephant Rifle"
	desc = "A beast of a gun, for when you need something deader than dead- or have some confidence issues."
	icon = 'icons/obj/guns/projectile/compensator.dmi'
	icon_state = "compensator"
	item_state = "compensator"
	//SPEEDLOADER because rapid unloading.
	//In principle someone could make a speedloader for it, so it makes sense.
	load_method = SINGLE_CASING
	handle_casings = HOLD_CASINGS
	max_shells = 1
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	slot_flags = SLOT_BACK
	caliber = CAL_ELEPH
	slowdown_hold = 2.5 //death to those who can't hit their shots for shit
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 3, TECH_ILLEGAL = 2)
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	bulletinsert_sound 	= 'sound/weapons/guns/interact/shotgun_insert.ogg'
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 10)
	price_tag = 650
	one_hand_penalty = 99 
	var/bolt_open = 0
	burst_delay = 0
	saw_off = FALSE
	serial_type = "SA"
    brace_penalty = 80 //-15 (fired without table)

/obj/item/gun/projectile/other/compensator/update_icon()
	..()

	var/iconstring = initial(icon_state)

	if (bolt_open)
		iconstring += "_broke"

	icon_state = iconstring

/obj/item/gun/projectile/other/compensator/attack_self(mob/user) //Someone overrode attackself for this class, soooo.
	if(zoom)
		toggle_scope(user)
		return
	bolt_act(user)

/obj/item/gun/projectile/other/compensator/proc/bolt_act(mob/living/user)
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

/obj/item/gun/projectile/other/compensator/special_check(mob/user)
	if(bolt_open)
		to_chat(user, SPAN_WARNING("You can't fire [src] while the barrel is open!"))
		return 0
	return ..()

/obj/item/gun/projectile/other/compensator/load_ammo(var/obj/item/A, mob/user)
	if(!bolt_open)
		to_chat(user, SPAN_WARNING("You can't load [src] while the barrel is closed!"))
		return
	..()

/obj/item/gun/projectile/other/compensator/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		return
	..()