/obj/item/gun/projectile/shotgun/bull
	name = "\"Bull\" shotgun"
	desc = "A \"Holland & Sullivan\" double-barreled pump-action shotgun. A nightmare of engineering, this gun is often regarded as one of the worst firearms ever produced. \
			Due to shorter than usual barrels, damages are somewhat lower and recoil suffers as a result. The ability to fire both barrels at once seems more of a gimmick than a feature. \
			A number of scratches marr the finish by the ejection ports."
	icon = 'icons/obj/guns/projectile/PeaceWalker.dmi'
	icon_state = "PeaceWalker"
	item_state = "PW"
	load_method = SINGLE_CASING|SPEEDLOADER
	handle_casings = HOLD_CASINGS
	max_shells = 7
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	flags = CONDUCT
	slot_flags = SLOT_BACK
	caliber = CAL_SHOTGUN
	var/reload = 1
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 4)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 6)
	price_tag = 1000
	damage_multiplier = 0.75
	penetration_multiplier = 0.75
	init_recoil = RIFLE_RECOIL(1.8)
	burst_delay = null
	fire_delay = null
	bulletinsert_sound = 'sound/weapons/guns/interact/shotgun_insert.ogg'
	fire_sound = 'sound/weapons/guns/fire/max_sawn_off.ogg' // It's a double barrel, gets a double barrel sound
	move_delay = null
	init_firemodes = list(
		list(mode_name="Single barrel", mode_desc="Shoots one barrel", burst=1, icon="semi"),
		list(mode_name="Double barrel", mode_desc="Shoots both barrels at once", burst=2, icon="burst"),
		)
	serial_type = "H&S"

	wield_delay = 0.9 SECOND
	wield_delay_factor = 0.2 // 40 vig
	gun_parts = list(/obj/item/part/gun/frame/bull = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/shotgun = 1, /obj/item/part/gun/barrel/shotgun = 1)

/obj/item/part/gun/frame/bull
	name = "Bull frame"
	desc = "A Bull shotgun frame. Double-barrel and pump action, through a miracle of engineering."
	icon_state = "frame_bull"
	result = /obj/item/gun/projectile/shotgun/bull
	resultvars = list(/obj/item/gun/projectile/shotgun/bull)
	gripvars = list(/obj/item/part/gun/grip/rubber)
	mechanismvar = /obj/item/part/gun/mechanism/shotgun
	barrelvars = list(/obj/item/part/gun/barrel/shotgun)

/obj/item/gun/projectile/shotgun/bull/bison
	name = "\"Bison\" shotgun"
	desc = "A \"Holland & Sullivan\" double-barreled pump-action shotgun. A nightmare of engineering turned sleek room-clearer by the Artificers guild. Its snub barrel reinforced and lengthened, \
			 a proper stock affixed and even the poorly machined lower given a bit of TLC. A work of true artifice."
	icon = 'icons/obj/guns/projectile/bigpeacewalker.dmi'
	icon_state = "bigpeacewalker"
	item_state = "PW"
	w_class = ITEM_SIZE_HUGE
	max_shells = 8
	matter = list(MATERIAL_PLASTEEL = 25, MATERIAL_PLASTIC = 10)
	price_tag = 1500
	damage_multiplier = 0.9
	penetration_multiplier = 0.9
	init_recoil = RIFLE_RECOIL(1.6)
	serial_type = "AG"


/obj/item/gun/projectile/shotgun/bull/proc/pump(mob/M as mob)
	var/turf/newloc = get_turf(src)
	playsound(M, 'sound/weapons/shotgunpump.ogg', 60, 1)
	if(chambered)
		if(!chambered.BB)
			chambered.forceMove(newloc) //Eject casing
			chambered = null
	if(!chambered)
		if(loaded.len)
			var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
			loaded -= AC //Remove casing from loaded list.
			chambered = AC
			if(chambered.BB != null)
				reload = 0
	update_icon()

/obj/item/gun/projectile/shotgun/bull/consume_next_projectile()
	if (chambered)
		return chambered.BB
	return null

/obj/item/gun/projectile/shotgun/bull/handle_post_fire()
	..()
	var/turf/newloc = get_turf(src)
	if(chambered)
		chambered.forceMove(newloc) //Eject casing
		chambered = null
		if(!reload)
			if(loaded.len)
				var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
				loaded -= AC //Remove casing from loaded list.
				chambered = AC
	reload = 1

/obj/item/gun/projectile/shotgun/bull/unload_ammo(user, allow_dump)
	var/turf/newloc = get_turf(src)
	if(chambered)
		chambered.forceMove(newloc) //Eject casing
		chambered = null
		reload = 1
	..(user, allow_dump=1)

/obj/item/gun/projectile/shotgun/bull/attack_self(mob/user as mob)
	if(reload)
		if(wielded)
			pump(user)
		else if (world.time >= recentpumpmsg + 5)
			to_chat(user, SPAN_WARNING("You need to wield this gun to pump it!"))
			recentpumpmsg = world.time
	else
		if(firemodes.len > 1)
			..()
		else
			unload_ammo(user)

/obj/item/gun/projectile/shotgun/bull/bison/attack_self(mob/user as mob)
	if(reload)
		if(world.time >= recentpumpmsg + 10)
			pump(user)
			recentpumpmsg = world.time

	else
		if(firemodes.len > 1)
			..()
		else
			unload_ammo(user)


/obj/item/gun/projectile/shotgun/bull/proc/update_charge()
	var/ratio = get_ammo() / (max_shells + 1)//1 in the chamber
	ratio = round(ratio, 0.25) * 100
	add_overlay("[ratio]_PW")


/obj/item/gun/projectile/shotgun/bull/update_icon()
	..()
	cut_overlays()
	update_charge()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(wielded)
		itemstring += "_doble"

	icon_state = iconstring
	set_item_state(itemstring)
