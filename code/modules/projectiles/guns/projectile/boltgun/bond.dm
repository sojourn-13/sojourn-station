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
	mag_well =  MAG_WELL_RIFLE
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
	if(wielded_item_state)
		if(icon_contained)//If it has it own icon file then we want to pull from that.
			if(wielded)
				item_state_slots[slot_l_hand_str] = "lefthand"  + wielded_item_state
				item_state_slots[slot_r_hand_str] = "righthand" + wielded_item_state
			else
				item_state_slots[slot_l_hand_str] = "lefthand"
				item_state_slots[slot_r_hand_str] = "righthand"
		else//Otherwise we can just pull from the generic left and right hand icons.
			if(wielded)
				item_state_slots[slot_l_hand_str] = wielded_item_state
				item_state_slots[slot_r_hand_str] = wielded_item_state
			else
				item_state_slots[slot_l_hand_str] = initial(item_state)
				item_state_slots[slot_r_hand_str] = initial(item_state)

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (bolt_open)
		iconstring += "_open"
	else
		iconstring += "_closed"

	if (silenced)
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

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


/obj/item/gun/projectile/boltgun/survivalrifle/refresh_upgrades() //Special proc is needed to compensate for zoom level
	//First of all, lets reset any var that could possibly be altered by an upgrade
	damage_multiplier = initial(damage_multiplier)
	penetration_multiplier = initial(penetration_multiplier)
	pierce_multiplier = initial(pierce_multiplier)
	proj_step_multiplier = initial(proj_step_multiplier)
	proj_agony_multiplier = initial(proj_agony_multiplier)
	fire_delay = initial(fire_delay)
	move_delay = initial(move_delay)
	recoil_buildup = initial(recoil_buildup)
	muzzle_flash = initial(muzzle_flash)
	silenced = initial(silenced)
	restrict_safety = initial(restrict_safety)
	init_offset = initial(init_offset)
	proj_damage_adjust = list()
	fire_sound = initial(fire_sound)
	restrict_safety = initial(restrict_safety)
	dna_compare_samples = initial(dna_compare_samples)
	rigged = initial(rigged)
	darkness_view = initial(darkness_view)
	vision_flags = initial(vision_flags)
	see_invisible_gun = initial(see_invisible_gun)
	force = initial(force)
	armor_penetration = initial(armor_penetration)
	sharp = initial(sharp)
	attack_verb = list()
	one_hand_penalty = initial(one_hand_penalty)
	auto_eject = initial(auto_eject) //SoJ edit
	initialize_scope()
	initialize_firemodes()
	//Lets get are prefixes and name fresh
	name = initial(name)
	max_upgrades = initial(max_upgrades)
	color = initial(color)
	prefixes = list()
	item_flags = initial(item_flags)
	extra_bulk = initial(extra_bulk)

	//Now lets have each upgrade reapply its modifications
	SEND_SIGNAL(src, COMSIG_ADDVAL, src)
	SEND_SIGNAL(src, COMSIG_APPVAL, src)

	if(firemodes.len)
		very_unsafe_set_firemode(sel_mode) // Reset the firemode so it gets the new changes

	for (var/prefix in prefixes)
		name = "[prefix] [name]"

	if(folding_stock)// TODO: make this somehow modular - (it prob will be a massive line if var/stock_name_of_change
		if(!folded) //Exstended! This means are stock is out
			extra_bulk += 6 //Simular to 6 plates, your getting a lot out of this tho
			//Not modular *yet* as it dosnt need to be for what is basiclly just 10% more damage and 50% less recoil
			recoil_buildup *= 0.5 //50% less recoil
			one_hand_penalty *= 0.5 //50% less recoil
			damage_multiplier += 0.1 //10% more damage
			proj_step_multiplier  -= 0.4 //40% more sped on the bullet
			penetration_multiplier += 0.2 //Makes the gun have more AP when shooting
			extra_damage_mult_scoped += 0.2 //Gives 20% more damage when its scoped. Makes folding stock snipers more viable


	update_icon()
	//then update any UIs with the new stats
	SSnano.update_uis(src)
