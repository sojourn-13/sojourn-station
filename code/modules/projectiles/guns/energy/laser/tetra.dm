/obj/item/gun/energy/tetra
	name = "\"Tetra\" laser SMG"
	desc = "A overengineered, complex laser SMG. Mounts both a visible-light laser emitter and a near-infrared laser emitter, allowing it to fire both regular, moderate-power beams and quieter, lower-power invisible beams.\
	This variant has a basic optic fitted."
	icon = 'icons/obj/guns/energy/tetra.dmi'
	icon_state = "tetra"
	w_class = ITEM_SIZE_BULKY
	fire_sound = 'sound/weapons/energy/Laser2.ogg'
	fire_sound_silenced = 'sound/weapons/energy/quietlaser2.ogg'
	suitable_cell = /obj/item/cell/medium
	can_dual = TRUE
	charge_meter = TRUE
	origin_tech = list(TECH_COMBAT = 5, TECH_POWER = 6)
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_PLASTEEL = 18, MATERIAL_STEEL = 8, MATERIAL_PLASTIC = 8, MATERIAL_SILVER = 12, MATERIAL_GOLD = 2)
	price_tag = 1500
	fire_delay = 7.5
	silenced = FALSE
	damage_multiplier = 0.6
	init_recoil = CARBINE_RECOIL(1.2)
	zoom_factors = list(0.2)
	projectile_type = /obj/item/projectile/beam
	suitable_cell = /obj/item/cell/medium
	charge_cost = 40
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	init_firemodes = list(
		list(mode_name = "focused",     mode_desc = "Fire a focused, higher damage beam", burst = 1, fire_delay = 7.5, damage_mult_add = 0.4, move_delay=null, icon="semi", projectile_type = /obj/item/projectile/beam, silenced = FALSE),
		list(mode_name = "slow auto",    mode_desc = "A more controllable automatic firerate",   mode_type = /datum/firemode/automatic, fire_delay = 4, icon="burst", projectile_type = /obj/item/projectile/beam, silenced = FALSE),
		list(mode_name = "full auto",    mode_desc = "Higher volume automatic fire",   mode_type = /datum/firemode/automatic, fire_delay = 1.5, icon="auto", projectile_type = /obj/item/projectile/beam, silenced = FALSE),
		list(mode_name = "IR focused",     mode_desc = "Fire invisible, quieter focused IR beams", burst = 1, fire_delay = 7.5, damage_mult_add = 0.4, move_delay=null, icon="semi", projectile_type = /obj/item/projectile/beam/infrared, silenced = TRUE),
		list(mode_name = "IR slow auto",    mode_desc = "Invisible, quieter IR beams at a more controllable automatic firerate",   mode_type = /datum/firemode/automatic, fire_delay = 4, icon="burst", projectile_type = /obj/item/projectile/beam/infrared, silenced = TRUE),
		list(mode_name = "bake",    mode_desc = "Bake targets in infrared radiation",   mode_type = /datum/firemode/automatic, fire_delay = 1.5, icon="fuller", projectile_type = /obj/item/projectile/beam/infrared, silenced = TRUE)
		)
	serial_type = "AG"

/obj/item/gun/energy/tetra/examine(mob/user)
	..()
	to_chat(user, SPAN_NOTICE("Control-Shift click to switch to the previous firemode."))

/obj/item/gun/energy/tetra/CtrlShiftClick(mob/user)
	if(currently_firing) // CHEATERS!
		return
	var/datum/firemode/new_mode = switch_firemodes_reverse()
	if(new_mode)
		playsound(src.loc, 'sound/weapons/guns/interact/selector.ogg', 100, 1)
		to_chat(user, SPAN_NOTICE("\The [src] is now set to [new_mode.name]."))
