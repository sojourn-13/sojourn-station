/obj/item/gun/energy/tetra
	name = "\"Tetra\" laser SMG"
	desc = "A overengineered, complex laser SMG. Mounts both a visible-light laser emitter and a near-infrared laser emitter, allowing it to fire both regular, moderate-power beams and quieter, lower-power invisible beams.\
	Due to the increased internal space used, the cell has to be mounted on the exterior of the weapon which renders it more susceptible to knocks. Has a basic optic fitted."
	icon = 'icons/obj/guns/energy/tetra.dmi'
	icon_state = "tetra"
	w_class = ITEM_SIZE_BULKY
	fire_sound = 'sound/weapons/Laser2.ogg'
	fire_sound_silenced = 'sound/weapons/quietlaser2.ogg'
	suitable_cell = /obj/item/cell/medium
	can_dual = FALSE
	charge_meter = FALSE //we have our own charge handling
	origin_tech = list(TECH_COMBAT = 5, TECH_POWER = 6)
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_PLASTEEL = 18, MATERIAL_STEEL = 8, MATERIAL_PLASTIC = 8, MATERIAL_SILVER = 12, MATERIAL_GOLD = 2)
	price_tag = 1500
	silenced = FALSE
	damage_multiplier = 0.6
	recoil_buildup = 1
	one_hand_penalty = 5
	zoom_factor = 0.2
	projectile_type = /obj/item/projectile/beam
	suitable_cell = /obj/item/cell/medium
	charge_cost = 25
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	init_firemodes = list(
		list(mode_name = "focused",     mode_desc = "Fire a focused, higher damage beam", burst = 1, fire_delay = 5, damage_mult_add = 0.75, move_delay=null, icon="semi", projectile_type = /obj/item/projectile/beam, silenced = FALSE),
		list(mode_name = "slow auto",    mode_desc = "A more controllable automatic firerate",   mode_type = /datum/firemode/automatic, fire_delay = 3.33, icon="burst", projectile_type = /obj/item/projectile/beam, silenced = FALSE),
		list(mode_name = "full auto",    mode_desc = "Higher volume automatic fire",   mode_type = /datum/firemode/automatic, fire_delay = 1.5, icon="auto", projectile_type = /obj/item/projectile/beam, silenced = FALSE),
		list(mode_name = "IR focused",     mode_desc = "Fire invisible, quieter focused IR beams", burst = 1, fire_delay = 5, damage_mult_add = 0.75, move_delay=null, icon="semi", projectile_type = /obj/item/projectile/beam/infrared, silenced = TRUE),
		list(mode_name = "IR slow auto",    mode_desc = "Invisible, quieter IR beams at a more controllable automatic firerate",   mode_type = /datum/firemode/automatic, fire_delay = 3.33  , icon="burst", projectile_type = /obj/item/projectile/beam/infrared, silenced = TRUE),
		list(mode_name = "bake",    mode_desc = "Bake targets in infrared radiation",   mode_type = /datum/firemode/automatic, fire_delay = 1.5, icon="auto", projectile_type = /obj/item/projectile/beam/infrared, silenced = TRUE)
		)

/obj/item/gun/energy/tetra/dropped(mob/user)
	..()
	if(prob(5) && cell)
		visible_message(SPAN_DANGER("The cell falls out of [src]!"))
		playsound(src.loc, 'sound/weapons/guns/interact/pistol_magout.ogg', 75, 1)
		cell.forceMove(get_turf(src))
		cell = null

/obj/item/gun/energy/tetra/examine(mob/user)
	..()
	to_chat(user, SPAN_NOTICE("Control-Shift click to switch to the previous firemode."))

/obj/item/gun/energy/tetra/update_icon()
	cut_overlays()
	var/ratio = 0
	if(cell)
		item_modifystate = "loaded"
		add_overlay("[cell.icon_state]")
		if(cell.charge >= charge_cost)
			ratio = cell.charge / cell.maxcharge
			ratio = min(max(round(ratio, 0.25) * 100, 25), 100)

		add_overlay("[cell.icon_state]_[ratio]")
	else
		item_modifystate = null
	..()

/obj/item/gun/energy/tetra/CtrlShiftClick(mob/user)
	if(currently_firing) // CHEATERS!
		return
	var/datum/firemode/new_mode = switch_firemodes_reverse()
	if(new_mode)
		playsound(src.loc, 'sound/weapons/guns/interact/selector.ogg', 100, 1)
		to_chat(user, SPAN_NOTICE("\The [src] is now set to [new_mode.name]."))
