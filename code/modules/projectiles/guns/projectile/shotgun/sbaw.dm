/obj/item/gun/projectile/automatic/sbaw
	name = "\"Mjolnir\" payload rifle"
	desc = "A 20mm Smooth Bore Assault Weapon(SBAW), the distant relative of the Omnirifle series taking the big-bore utility platform to its logical conclusion. \
	Taking the role of both assault shotgun and grenade launcher, it's a terrifying implement often used by shock troops to crack light vehicles, mechs, power armor, and infantry in defilade."
	icon = 'icons/obj/guns/projectile/sbaw.dmi'
	icon_state = "sbaw"
	item_state = "sbaw"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_SHOTGUN
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE|MAG_WELL_DRUM // Pre-existing sprites say otherwise.
	origin_tech = list(TECH_COMBAT = 20, TECH_MATERIAL = 3) //So rnd has a use to get their hands on one
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 3000
	penetration_multiplier = 1.5 //50% more ap
	damage_multiplier = 1.1 //Payload "rifle" has a scope so fair enough
	zoom_factors = list(0.4)
	fire_delay = 12
	init_recoil = RIFLE_RECOIL(1.8)
	fire_sound = 'sound/weapons/guns/fire/sbaw.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/sfrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/sfrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/batrifle_cock.ogg'
	max_upgrades = 5 // Already too good, let's not get out of hand
	blacklist_upgrades = list( // Speaking of, no barrel upgrades (that aren't helpers or smaller bore), and no fire delay ones for grenade launcher balance.
							  /obj/item/tool_upgrade/productivity/ergonomic_grip = TRUE,
							  /obj/item/tool_upgrade/productivity/red_paint = TRUE,
							  /obj/item/gun_upgrade/trigger/dangerzone = TRUE,
							  /obj/item/tool_upgrade/refinement/ported_barrel = TRUE,
							  /obj/item/tool_upgrade/refinement/compensatedbarrel = TRUE,
							  /obj/item/gun_upgrade/barrel/forged = TRUE,)

	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL, GUN_SIGHT)
	var/obj/item/gun/projectile/underslung/built_in/launcher // Internal grenade launcher magazine
	init_firemodes = list(
	SEMI_AUTO_NODELAY,
	list(mode_name="fire grenades", mode_desc="Shoot the stored grenades", burst=null, fire_delay=15, move_delay=null, icon="grenade", use_launcher=1)
	)
	serial_type = "Sol Fed"


/obj/item/gun/projectile/automatic/sbaw/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(ammo_magazine)
		add_overlay("_mag[ammo_magazine.max_ammo]")
	else
		cut_overlays()
		return

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/sbaw/Initialize()
	. = ..()
	launcher = new(src)
	update_icon()

/obj/item/gun/projectile/automatic/sbaw/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/ammo_casing/grenade)))
		launcher.load_ammo(I, user)
	else
		..()

/obj/item/gun/projectile/automatic/sbaw/attack_hand(mob/user)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(user.get_inactive_hand() == src && cur_mode.settings["use_launcher"])
		launcher.unload_ammo(user)
	else
		..()

/obj/item/gun/projectile/automatic/sbaw/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(cur_mode.settings["use_launcher"])
		launcher.Fire(target, user, params, pointblank, reflex) // We don't change back to shotgun rounds immediately as it has more than one round on the internal mag.
	else
		..()

/obj/item/gun/projectile/automatic/sbaw/examine(mob/user)
	..()
	if(launcher.loaded.len)
		to_chat(user, "\The [src] has [launcher.loaded.len] grenade\s left.") // More than one grenade means we ask the amount of ammo stored
	else
		to_chat(user, "\The [src] has no grenades loaded.")

/obj/item/gun/projectile/automatic/sbaw/admin
	name = "\"Gloryhammer\" payload rifle"
	desc = "An obscene tool of destruction forged by ancient gods of warfare, sowing horror when you weild this Thunder Striking Wizard Thrasher."
	icon = 'icons/obj/guns/projectile/sbaw.dmi'
	icon_state = "sbaw"
	penetration_multiplier = 1.5
	damage_multiplier = 1.5
	init_recoil = RIFLE_RECOIL(1.1)
	fire_delay = 0.5
	init_firemodes = list(
	SEMI_AUTO_NODELAY,
	FULL_AUTO_300,
	)
	serial_type = "BlueCross"
