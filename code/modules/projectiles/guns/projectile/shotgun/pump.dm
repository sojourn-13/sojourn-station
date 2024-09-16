/obj/item/gun/projectile/shotgun/pump
	name = "\"Grizzly\" shotgun"
	desc = "A common open-source pump-action shotgun, a bastard child of the three primary pump shotguns on the market, all rolled together once their patents expired. Can hold up to 4+1 20mm shells in its tube magazine."
	icon = 'icons/obj/guns/projectile/shotgun.dmi'
	icon_state = "shotgun"
	item_state = "shotgun"
	max_shells = 4
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	flags = CONDUCT
	slot_flags = SLOT_BACK
	caliber = CAL_SHOTGUN
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = SINGLE_CASING|SPEEDLOADER
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	handle_casings = HOLD_CASINGS
	fire_sound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/shotgun_insert.ogg'
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 10)
	price_tag = 600
	damage_multiplier = 1 //Baseline shotgun
	init_recoil = RIFLE_RECOIL(1.1)
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/shotgun/pump/sawn
	allow_racking = FALSE
	serial_type = "H&S"

	wield_delay = 0.6 SECOND
	wield_delay_factor = 0.3 // 30 vig
	gun_parts = list(/obj/item/part/gun/frame/grizzly = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/shotgun = 1, /obj/item/part/gun/barrel/shotgun = 1)
	alt_plus_one_loading = TRUE //sideload edit

/obj/item/part/gun/frame/grizzly
	name = "Grizzly frame"
	desc = "A Grizzly shotgun frame. A militiaman's favorite."
	icon_state = "frame_shotgun"
	result = /obj/item/gun/projectile/shotgun/pump
	resultvars = list(/obj/item/gun/projectile/shotgun/pump)
	gripvars = list(/obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/shotgun
	barrelvars = list(/obj/item/part/gun/barrel/shotgun)

/obj/item/gun/projectile/shotgun/pump/consume_next_projectile()
	if(chambered)
		return chambered.BB
	return null

/obj/item/gun/projectile/shotgun/pump/attack_self(mob/living/user as mob)
	if(world.time >= recentpumpmsg + 10)
		pump(user)
		recentpumpmsg = world.time

/obj/item/gun/projectile/shotgun/pump/proc/pump(mob/M as mob)
	var/turf/newloc = get_turf(src)
	playsound(M, pumpshotgun_sound, 60, 1)

	if(chambered)//We have a shell in the chamber
		chambered.forceMove(newloc) //Eject casing
		chambered = null

	side_loading(M)

	if(loaded.len)
		var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
		loaded -= AC //Remove casing from loaded list.
		chambered = AC

	update_icon()

/obj/item/gun/projectile/shotgun/pump/sawn
	name = "sawn-down \"Grizzly\" shotgun"
	desc = "A common open-source pump-action shotgun, a bastard child of the three primary pump shotguns on the market, all rolled together once their patents expired. This one has been slightly cut down."
	icon = 'icons/obj/guns/projectile/sawnoff/shotgun.dmi'
	icon_state = "shotgun"
	item_state = "shotgun"
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BACK|SLOT_BELT
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_WOOD = 10)
	price_tag = 450
	damage_multiplier = 1
	penetration_multiplier = 0.9
	init_recoil = RIFLE_RECOIL(1.2)
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/shotgun/pump/obrez
	gun_parts = list(/obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/shotgun = 1, /obj/item/stack/material/plasteel = 2)
	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.3 // 30 vig

/obj/item/gun/projectile/shotgun/pump/obrez
	name = "obrez \"Grizzly\" shotgun"
	desc = "A common open-source pump-action shotgun, hacked up, sawn down, and ready to rob a liquor store."
	icon = 'icons/obj/guns/projectile/sawnoff/shotgunobrez.dmi'
	icon_state = "obrez"
	item_state = "obrez"
	max_shells = 3
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_PAINFUL
	slot_flags = SLOT_BACK|SLOT_BELT|SLOT_HOLSTER
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_WOOD = 5)
	price_tag = 350
	damage_multiplier = 0.8
	penetration_multiplier = 0.8
	init_recoil = RIFLE_RECOIL(1.3)
	saw_off = FALSE
	gun_parts = list(/obj/item/stack/material/wood = 2, /obj/item/part/gun/mechanism/shotgun = 1, /obj/item/stack/material/plasteel = 2)
	wield_delay = 0.2 SECOND
	wield_delay_factor = 0.2 // 20 vig
