/obj/item/gun/projectile/revolver
	name = "\"Minotaur\" magnum revolver"
	desc = "The \"H&S\" \"Minotaur\" is a revolver of choice when you absolutely positively need to make sure a fist-sized hole has someone dead, but can't afford to do it in style. Uses .40 Magnum bullets... always wanting more."
	icon = 'icons/obj/guns/projectile/revolver.dmi'
	icon_state = "revolver"
	item_state = "revolver"
	caliber = CAL_MAGNUM
	force = WEAPON_FORCE_NORMAL
	can_dual = TRUE
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	ammo_type = /obj/item/ammo_casing/magnum_40
	unload_sound 	= 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/rev_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/revolver_fire.ogg'
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 650
	fire_delay = 3 //all revolvers can fire faster, but have huge recoil
	damage_multiplier = 1.2
	armor_divisor = -0.35 // Insanely powerful handcannon, but worthless against heavy armor
	init_recoil = HANDGUN_RECOIL(1.3)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)
	var/drawChargeMeter = TRUE
	var/chamber_offset = 0 //how many empty chambers in the cylinder until you hit a round
	fire_animatio = TRUE
	allow_racking = FALSE
	serial_type = "H&S"

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.4 // 40 vig

	gun_parts = list(/obj/item/part/gun/frame/minotaur = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/revolver = 1, /obj/item/part/gun/barrel/magnum = 1)

/obj/item/part/gun/frame/minotaur
	name = "Minotaur frame"
	desc = "A Minotaur revolver frame. The officer's choice."
	icon_state = "frame_revolver"
	result = /obj/item/gun/projectile/revolver
	resultvars = list(/obj/item/gun/projectile/revolver)
	gripvars = list(/obj/item/part/gun/grip/black)
	mechanismvar = /obj/item/part/gun/mechanism/revolver
	barrelvars = list(/obj/item/part/gun/barrel/magnum)

/obj/item/gun/projectile/revolver/verb/spin_cylinder()
	set name = "Spin revolver"
	set desc = "Fun when you're bored out of your skull."
	set category = "Object"

	chamber_offset = 0
	visible_message(SPAN_WARNING("\The [usr] spins \the [src]!"), \
	SPAN_NOTICE("You hear something metallic spin and click."))
	playsound(src.loc, 'sound/weapons/revolver_spin.ogg', 100, 1)
	loaded = shuffle(loaded)
	if(rand(1,max_shells) > loaded.len)
		chamber_offset = rand(0,max_shells - loaded.len)
	icon_state = "[icon_state]_spin"
	spawn(10)
		icon_state = "[initial(icon_state)]"

/obj/item/gun/projectile/revolver/consume_next_projectile()
	if(chamber_offset)
		chamber_offset--
		return
	return ..()

/obj/item/gun/projectile/revolver/load_ammo(var/obj/item/A, mob/user)
	chamber_offset = 0
	return ..()

/obj/item/gun/projectile/revolver/proc/update_charge()
	if(!drawChargeMeter)
		return
	cut_overlays()
	if(loaded.len==0)
		add_overlay("[icon_state]_off")
	else
		add_overlay("[icon_state]_on")


/obj/item/gun/projectile/revolver/update_icon()
	update_charge()
