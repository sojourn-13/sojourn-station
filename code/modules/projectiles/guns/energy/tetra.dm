/obj/item/gun/energy/tetra
	name = "\"Tetra\" laser SMG"
	desc = "A overengineered, complex laser SMG. Mounts both a visible-light laser emitter and a near-infrared laser emitter, allowing it to fire both regular, moderate-power beams and quieter, lower-power invisible beams.\
	This variant has a basic optic fitted."
	icon = 'icons/obj/guns/energy/tetra.dmi'
	icon_state = "tetra"
	w_class = ITEM_SIZE_BULKY
	fire_sound = 'sound/weapons/Laser2.ogg'
	fire_sound_silenced = 'sound/weapons/quietlaser2.ogg'
	suitable_cell = /obj/item/cell/medium
	can_dual = TRUE
	charge_meter = TRUE
	origin_tech = list(TECH_COMBAT = 5, TECH_POWER = 6)
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_PLASTEEL = 18, MATERIAL_STEEL = 8, MATERIAL_PLASTIC = 8, MATERIAL_SILVER = 12, MATERIAL_GOLD = 2)
	price_tag = 1500
	silenced = FALSE
	damage_multiplier = 1.0
	recoil_buildup = 1
	one_hand_penalty = 5
	zoom_factor = 0.2
	projectile_type = /obj/item/projectile/beam
	suitable_cell = /obj/item/cell/medium
	charge_cost = 40
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	init_firemodes = list(
		WEAPON_NORMAL,
		BURST_3_ROUND,
		FULL_AUTO_600,
		list(mode_name = "Infared overclock",    mode_desc = "Invisible, quieter IR beams that bake the target from the inside.",   mode_type = /datum/firemode/automatic, charge_cost = 80, fire_delay = 4, icon="burst", projectile_type = /obj/item/projectile/beam/infrared, silenced = TRUE)
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
