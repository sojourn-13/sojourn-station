/obj/item/gun/projectile/revolver/lemant
	name = "\"Pilgrim\" magnum revolver"
	desc = "Designed by the Old Testament to have good utility and plenty of shots at the cost of requiring each spent shell to individually be removed, and can't be speed loaded. \
	This signature weapon from New Byzantine holds nine .40 rounds and one single action underslung 20mm shell."
	icon = 'icons/obj/guns/projectile/lemant.dmi'
	icon_state = "lemant"
	item_state = "lemant"
	caliber = CAL_MAGNUM
	load_method = SINGLE_CASING
	drawChargeMeter = FALSE
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	max_shells = 9
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 450
	gun_parts = null
	damage_multiplier = 1.2
	penetration_multiplier = 1.1
	init_recoil = HANDGUN_RECOIL(0.8)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		list(mode_name="fire 20mm shell", mode_desc="Shoot the underbarrel shotgun shell",  burst=null, fire_delay=null, move_delay=null,  icon="grenade", use_launcher=1)
		)
	serial_type = "Absolute"

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.4 // 40 vig

	var/obj/item/gun/projectile/underslung_shotgun/shotgun
	var/reload_delay = 5 // Delay between bullets when reloading from a box.

/obj/item/gun/projectile/revolver/lemant/belt
	name = "\"Pilgrim Devout\" magnum revolver"
	desc = "Artificer Guild's revamped design of the Pilgrim to have even more shots before requiring to reload. \
	Even with the belt design this revolver requires each spent shell to individually be removed, and can't be speed loaded. \
	Holds seventeen .40 rounds and one single action underslung 20mm shell."
	icon = 'icons/obj/guns/projectile/lemant_way.dmi'
	icon_state = "lemant_way"
	item_state = "lemant_way"
	max_shells = 17
	price_tag = 550

	init_firemodes = list(
		SEMI_AUTO_SOMEDELAY,
		list(mode_name="fire 20mm shell", mode_desc="Shoot the underbarrel shotgun shell",  burst=null, fire_delay=null, move_delay=null,  icon="grenade", use_launcher=1)
		)

	init_recoil = HANDGUN_RECOIL(0.5)
	wield_delay = 0.6 SECOND
	wield_delay_factor = 0.6 // 60 vig

//Removed do to gun bloat and balance
/*
/obj/item/gun/projectile/revolver/lemant/claw
	name = "\"Pilgrim Claw\" magnum revolver"
	desc = "Once a legendary frontier weapon on old earth, hailing from its second greatest empire, this signature weapon holds nine .40 rounds and one single action underslung 20mm shell. \
	This particular model is crafted by the New Testament, having good utility and plenty of shots, but is painstakingly slow to reload since it requires removing each spent shell individually. \
	Someone added a spike to the grip, allowing it to function as a rather deadly knife when pistol whipping, handy given how long it takes to reload."
	icon = 'icons/obj/guns/projectile/lemant_claw.dmi'
	icon_state = "lemant_claw"
	item_state = "lemant_claw"
	force = WEAPON_FORCE_PAINFUL // Up from 10, essentially a knife but harder to mod. -Kaz
	init_recoil = HANDGUN_RECOIL(0.6)//Addded weight, better control. -Kaz
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_BAYONET)
	price_tag = 475 // Still an upgrade.

/obj/item/gun/projectile/revolver/lemant/uppercut
	name = "\"Pilgrim Hero\" kurz revolver"
	desc = "Once a legendary frontier weapon on old earth, hailing from its second greatest empire, this signature weapon holds six .50 Kurz rounds and one single action underslung 20mm shell. \
	This particular model is crafted by the New Testament, having good utility and plenty of shots, but is painstakingly slow to reload since it requires removing each spent shell individually. \
	This model is a conversion, known as the pilgrim hero, its caliber is converted to .50 Kurz but it loses ammo capacity due to the larger shells and lacks the \
	physical weight to give it better recoil control compared to other revolvers in its weight class. Underslung still works at least."
	icon = 'icons/obj/guns/projectile/lemant_hero.dmi'
	icon_state = "lemant_hero"
	item_state = "lemant_hero"
	caliber = CAL_50
	fire_sound = 'sound/weapons/guns/fire/12mm_revolver.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_CALIBRE_50)
	max_shells = 6
	price_tag = 500
	init_recoil = HANDGUN_RECOIL(1.3)// Massive recoil due to being a kurz revolver without the weight to compensate for the blast. -Kaz
	wield_delay = 0.6 SECOND
	wield_delay_factor = 0.6 // 60 vig
*/
//Defined here, may be used elsewhere but for now its only used here. -Kaz
/obj/item/gun/projectile/underslung_shotgun
	name = "underslung shotgun"
	desc = "Not much more than a tube and a firing mechanism, this shotgun is designed to be fitted to another gun."
	fire_sound = 'sound/weapons/guns/fire/shotgun_fire.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/shotgun_insert.ogg'
	w_class = ITEM_SIZE_NORMAL
	matter = null
	force = 5
	max_shells = 1
	safety = FALSE
	twohanded = FALSE
	caliber = CAL_SHOTGUN
	handle_casings = EJECT_CASINGS

/obj/item/gun/projectile/underslung_shotgun/attack_self()
	return

/obj/item/gun/projectile/revolver/lemant/Initialize()
	. = ..()
	shotgun = new(src)

/obj/item/gun/projectile/revolver/lemant/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/ammo_casing/shotgun)))
		shotgun.load_ammo(I, user)
	else
		..()

/obj/item/gun/projectile/revolver/lemant/attack_hand(mob/user)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(user.get_inactive_hand() == src && cur_mode.settings["use_launcher"])
		shotgun.unload_ammo(user)
	else
		..()

/obj/item/gun/projectile/revolver/lemant/load_ammo(var/obj/item/A, mob/user)
	if(istype(A, /obj/item/ammo_magazine))
		var/obj/item/ammo_magazine/AM = A
		var/count = 0
		if(AM.reload_delay)
			to_chat(user, SPAN_NOTICE("It takes some time to reload [src] with [AM]..."))

		if(do_after(user, AM.reload_delay, user)) // Initial delay before the loading start
			loading_gun:
				while(do_after(user, reload_delay, user))
					for(var/obj/item/ammo_casing/C in AM.stored_ammo)
						if(loaded.len >= max_shells) // The gun is full or the box is empty
							break loading_gun // Stop loading at all
						if(C.caliber == caliber)
							C.forceMove(src)
							loaded += C
							AM.stored_ammo -= C //should probably go inside an ammo_magazine proc, but I guess less proc calls this way...
							count++
							AM.update_icon()
							break

					if(AM.stored_ammo.len <= 0) // The packet is out of bullets
						break loading_gun // Stop loading at all

		if(count)
			user.visible_message("[user] reloads [src].", SPAN_NOTICE("You load [count] round\s into [src]."))
			if(reload_sound) playsound(src.loc, reload_sound, 75, 1)
			cock_gun(user)
			update_firemode()
	else
		..()

/obj/item/gun/projectile/revolver/lemant/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(cur_mode.settings["use_launcher"])
		shotgun.Fire(target, user, params, pointblank, reflex)
		if(!shotgun.chambered)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/gun/projectile/revolver/lemant/examine(mob/user)
	..()
	if(shotgun.loaded.len)
		to_chat(user, "\The [shotgun] has \a [shotgun.chambered] loaded.")
	else
		to_chat(user, "\The [shotgun] is empty.")

/obj/item/gun/projectile/revolver/deacon
	name = "\"Deacon\" heavy revolver"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	Some pilgrims find what they are looking for..."
	icon = 'icons/obj/guns/projectile/lemant_blue.dmi'
	icon_state = "lemant_blue"
	item_state = "lemant_blue"
	fire_sound = 'sound/weapons/guns/fire/12mm_revolver.ogg'
	caliber = CAL_50
	drawChargeMeter = FALSE
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	max_shells = 9
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 700
	gun_parts = null
	damage_multiplier = 1.3
	penetration_multiplier = 1.2
	init_recoil = HANDGUN_RECOIL(1.1)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_CALIBRE_50)
	var/obj/item/gun/projectile/underslung/launcher
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		list(mode_name="fire grenades", mode_desc="Shoot the underbarrel grenade shell",  burst=null, fire_delay=null, move_delay=null,  icon="grenade", use_launcher=1)
		)
	serial_type = "BlueCross"

/obj/item/gun/projectile/revolver/deacon/Initialize()
	. = ..()
	launcher = new(src)

/obj/item/gun/projectile/revolver/deacon/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/ammo_casing/grenade)))
		launcher.load_ammo(I, user)
	else
		..()

/obj/item/gun/projectile/revolver/deacon/attack_hand(mob/user)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(user.get_inactive_hand() == src && cur_mode.settings["use_launcher"])
		launcher.unload_ammo(user)
	else
		..()

/obj/item/gun/projectile/revolver/deacon/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(cur_mode.settings["use_launcher"])
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/gun/projectile/revolver/deacon/examine(mob/user)
	..()
	if(launcher.loaded.len)
		to_chat(user, "\The [launcher] has \a [launcher.chambered] loaded.")
	else
		to_chat(user, "\The [launcher] is empty.")
