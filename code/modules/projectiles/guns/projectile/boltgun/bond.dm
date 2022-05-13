/obj/item/gun/projectile/boltgun/survivalrifle
	name = "\"Bond\" survival rifle"
	desc = "A \"Bond\" survival rifle manufactured by Hunters Inc, with a fixed adjustable scope. Compact, lightweight, with high velocity and high penetration. Fires lightweight caseless ammunition using a robust bolt-action mechanism. A true modern frontiersman's rifle."
	icon = 'icons/obj/guns/projectile/survivalrifle.dmi'
	icon_state = "survivalrifle"
	item_state = "survivalrifle"
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	ammo_type =  /obj/item/ammo_casing/c10x24
	caliber = "10x24"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PULSE
	auto_eject = FALSE
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 5)
	price_tag = 750
	penetration_multiplier = 1.3
	damage_multiplier = 1.1
	extra_damage_mult_scoped = 0.5
	fire_sound = 'sound/weapons/guns/fire/m41_shoot.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/m41_reload.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/m41_cocked.ogg'
	zoom_factor = 0.6
	recoil_buildup = 12
	one_hand_penalty = 20
	serial_type = "Hunt Inc"

	gun_tags = list(GUN_PROJECTILE, GUN_SIGHT, GUN_MAGWELL, GUN_SILENCABLE)

	init_firemodes = list(
		SEMI_AUTO_NODELAY)

/obj/item/gun/projectile/boltgun/survivalrifle/Initialize()
	. = ..()
	update_icon()


/obj/item/gun/projectile/boltgun/survivalrifle/update_icon()
	cut_overlays()
	if(silenced)
		add_overlay("silencer")
	if(ammo_magazine)
		add_overlay("ammo-[ammo_magazine.max_ammo]")

/obj/item/gun/projectile/boltgun/survivalrifle/CtrlClick(mob/user)
	..()//COMSIG sending
	if(zoom)
		zoom()
		to_chat(user, SPAN_NOTICE("You look up from the scope to adjust it."))
	if(!can_interact(user) && !do_after(user, 10))
		return
	switch(zoom_factor)
		if(0.6)
			zoom_factor = 1.4
			to_chat(user, SPAN_NOTICE("You adjust the scope to moderate zoom."))
		if(1.4)
			zoom_factor = 2
			to_chat(user, SPAN_NOTICE("You adjust the scope to high zoom."))
		if(2)
			zoom_factor = 0.6
			to_chat(user, SPAN_NOTICE("You adjust the scope to low zoom."))
