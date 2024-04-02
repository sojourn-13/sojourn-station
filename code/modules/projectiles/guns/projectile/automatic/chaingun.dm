// ====================================================== //
//SOLFED GPMG NOT FOR TYPICAL ROUND USE. SERIOUSLY. IT'S OP AND MEANT FOR EVENTS, SPECIAL LOOT, AND ANTAGS.
// ====================================================== //

/obj/item/gun/projectile/automatic/chaingun
	name = "\"Fenrir\" heavy chaingun"
	desc = "A massive single-barrel chaingun originally intended as a vehicle mounted weapon. Refitted for and commonly seen with SolFed powered infantry, it's a devastating tool for removing those stubborn stains on the universe. \
	It is chambered in 8.6x70mm and has feeding systems for both drums and linked ammunition boxes. This one is fitted with a tactical sight and a gyrostabilizer. A weapon fit to slay even the hordes of Hell."
	icon = 'icons/obj/guns/projectile/chaingun.dmi'
	var/icon_base
	icon_base = "gpmg"
	icon_state = "gpmg_closed"
	item_state = "gpmg"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	slot_flags = 0
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_LINKED_BOX|MAG_WELL_DRUM
	caliber = CAL_HRIFLE
	tac_reloads = FALSE
	penetration_multiplier = 0.85
	damage_multiplier = 1.2
	slowdown = 0.15
	matter = list(MATERIAL_PLASTEEL = 50, MATERIAL_PLASTIC = 20)
	price_tag = 2500
	unload_sound 	= 'sound/weapons/guns/interact/chaingun_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/chaingun_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/chaingun_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/chaingun_fire.ogg'
	twohanded = TRUE
	zoom_factors = list(0.4)
	slowdown_hold = 1 //Heavy massive gun, slow down
	init_recoil = HMG_RECOIL(0.9)
	blacklist_upgrades = list(/obj/item/tool_upgrade/refinement/stabilized_grip = TRUE,
							  /obj/item/tool_upgrade/refinement/laserguide = TRUE) // Can't upgrade what it already has built in.
	init_firemodes = list(
		FULL_AUTO_600,
		list(mode_name="hyper-burst", mode_desc = "Short, rapid shot 3 round burst to stop any unarmed target", burst=3,    burst_delay=0.3, move_delay=2,  icon="burst"),
		)
	serial_type = "Sol Fed"

	var/cover_open = 0

	wield_delay = 2.5 SECOND
	wield_delay_factor = 0.6 // 60 vig , holy shit big gun
	gun_parts = list(/obj/item/part/gun = 4, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/machinegun = 1, /obj/item/part/gun/barrel/hrifle = 1)

/obj/item/gun/projectile/automatic/chaingun/special_check(mob/user)
	if(cover_open)
		to_chat(user, SPAN_WARNING("[src]'s mechanism is open! Close it before firing!"))
		return 0
	return ..()

/obj/item/gun/projectile/automatic/chaingun/proc/toggle_cover(mob/user)
	cover_open = !cover_open
	to_chat(user, SPAN_NOTICE("You [cover_open ? "open" : "close"] [src]'s mechanism."))
	update_icon()

/obj/item/gun/projectile/automatic/chaingun/attack_self(mob/user as mob)
	if(cover_open)
		toggle_cover(user) //close the cover
		playsound(src.loc, 'sound/weapons/guns/interact/chaingun_close.ogg', 100, 1)
	else
		return ..() //once closed, behave like normal

/obj/item/gun/projectile/automatic/chaingun/attack_hand(mob/user as mob)
	if(!cover_open && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		playsound(src.loc, 'sound/weapons/guns/interact/chaingun_open.ogg', 100, 1)
	else
		return ..() //once open, behave like normal

/obj/item/gun/projectile/automatic/chaingun/equipped(var/mob/user, var/slot)
	.=..()
	update_icon()

/obj/item/gun/projectile/automatic/chaingun/load_ammo(var/obj/item/A, mob/user)
	if(!cover_open)
		to_chat(user, SPAN_WARNING("You need to open the mechanism to load [src]."))
		return
	..()

/obj/item/gun/projectile/automatic/lmg/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_open)
		to_chat(user, SPAN_WARNING("You need to open the mechanism to unload [src]."))
		return
	..()

/obj/item/gun/projectile/automatic/chaingun/update_icon()
	icon_state = "[icon_base][cover_open ? "_open" : "_closed"]"
	if(ammo_magazine)
		add_overlay("_mag[ammo_magazine.max_ammo]")
	else
		cut_overlays()
		return
	..()
