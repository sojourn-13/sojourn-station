/obj/item/gun/projectile/automatic/motherfucker
	name = "\"Punch Hole\" motherfucker"
	desc = "A six barrel, pump action carbine, shakes like the devil but will turn anything you aim at into swiss cheese."
	icon = 'icons/obj/guns/projectile/motherfucker.dmi'
	icon_state = "motherfucker"
	item_state = "motherfucker"
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_ROBUST
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	caliber = CAL_PISTOL
	load_method = SINGLE_CASING
	handle_casings = EJECT_CASINGS
	max_shells = 54
	penetration_multiplier = 1.3 // and good AP
	proj_step_multiplier = 0.8 // faster than non-shotgun bullets, slower than non-shotgun bullets with an accelerator
	matter = list(MATERIAL_STEEL = 20, MATERIAL_WOOD = 15)
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_9MM)
	price_tag = 300
	init_recoil = LMG_RECOIL(2)
	burst_delay = 0
	burst = 6
	init_offset = 7 //awful accuracy
	init_firemodes = list(
		list(mode_name="6-round bursts", mode_desc="Shoot every barrel at once", burst=6, fire_delay=null, move_delay=7, icon="burst"),
		)
	var/recentpumpmsg = 0
	var/pumped = FALSE
	serial_type = "INDEX"
	serial_shown = FALSE

	wield_delay = 1 SECOND
	wield_delay_factor = 0.4 // 40 vig to insta wield
	gun_parts = list(/obj/item/part/gun/frame/motherfucker = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/shotgun = 1, /obj/item/part/gun/barrel/pistol = 1)

/obj/item/part/gun/frame/motherfucker
	name = "Motherfucker frame"
	desc = "The Motherfucker. You just know someone is about to have a bad day."
	icon_state = "frame_motherfucker"
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTEEL = 10, MATERIAL_WOOD = 10, MATERIAL_PLASTIC = 10)
	resultvars = list(/obj/item/gun/projectile/automatic/motherfucker)
	gripvars = list(/obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/shotgun // its effectively a shotgun // 5 plasteel into the mechanism
	barrelvars = list(/obj/item/part/gun/barrel/pistol/steel) // Handmade gun, 2 steel barrel on a 20 steel crafting recipe

/obj/item/gun/projectile/automatic/motherfucker/attack_self(mob/living/user)
	if(world.time >= recentpumpmsg + 10)
		recentpumpmsg = world.time
		playsound(user, 'sound/weapons/guns/interact/shotgun_pump.ogg', 60, 1)
		pumped = TRUE

/obj/item/gun/projectile/automatic/motherfucker/special_check(mob/user)
	if(!pumped)
		to_chat(user, SPAN_WARNING("You can't fire [src] without pumping it "))
		return FALSE
	return ..()

/obj/item/gun/projectile/automatic/motherfucker/handle_post_fire(mob/user)
	..()
	pumped = FALSE
