/obj/item/gun/energy/plasma
	name = "\"Dominion\" plasma rifle"
	desc = "One of the last designs produced by the Old Testament, the \"Dominion\" uses advanced plasma generation technology to emit powerful blasts of energized matter or large, consuming fireballs. Due to its complexity and cost, it is usually reserved for specialists and elites."
	icon = 'icons/obj/guns/energy/pulse.dmi'
	icon_state = "pulse"
	item_state = null	//so the human update icon uses the icon_state instead.
	item_charge_meter = TRUE
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	matter = list(MATERIAL_PLASTEEL = 17, MATERIAL_WOOD = 8, MATERIAL_SILVER = 6, MATERIAL_URANIUM = 4)
	price_tag = 2000
	origin_tech = list(TECH_COMBAT = 3, TECH_PLASMA = 2)
	fire_sound = 'sound/weapons/energy/pulse.ogg'
	projectile_type = /obj/item/projectile/beam
	cell_type = /obj/item/cell/medium
	sel_mode = 2
	charge_cost = 100 //6 shots out of a 600M
	init_recoil = HANDGUN_RECOIL(1)
	twohanded = TRUE
	can_dual = FALSE
	damage_multiplier = 1.2
	init_firemodes = list(
		list(mode_name="destroy", mode_desc="An armor-stripping plasma round", projectile_type=/obj/item/projectile/plasma/heavy, fire_sound='sound/weapons/energy/pulse.ogg', fire_delay=14, icon="destroy", projectile_color = "#FFFFFF"),
		list(mode_name="incinerate", mode_desc="A relatively heavy shot of super-heated plasma that creates a fireball on impact", projectile_type=/obj/item/projectile/plasma/aoe/heat, fire_sound='sound/effects/supermatter.ogg', charge_cost=160, fire_delay=25, icon="kill", projectile_color = "#FF0000"),
	)
	gun_tags = list(GUN_ENERGY, GUN_SCOPE)
	serial_type = "Absolute"

/obj/item/gun/energy/plasma/mounted
	self_recharge = TRUE
	use_external_power = TRUE
	safety = FALSE
	twohanded = FALSE
	init_recoil = HANDGUN_RECOIL(0.1)


/obj/item/gun/energy/plasma/mounted/blitz
	name = "SDF PR \"Sprengen\""
	desc = "A miniaturized plasma rifle, remounted for robotic use only. Also has the ablity to have a Master Unmaker integrated into it."
	icon_state = "plasma_turret"
	charge_meter = FALSE
	serial_type = "GP"
	gun_tags = list(GUN_ENERGY, GUN_SCOPE)
	allow_greyson_mods = TRUE

/obj/item/gun/energy/plasma/destroyer
	name = "\"Purger\" plasma rifle"
	desc = "An older \"Old Testament\" brand plasma rifle, developed in direct response to compete against the highly successful \"Cassad\" design. Reliable and capable of firing suppressive bursts of lower-temperature plasma."
	icon = 'icons/obj/guns/energy/destroyer.dmi'
	fire_sound = 'sound/weapons/energy/pulse.ogg'
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 8, MATERIAL_SILVER = 10, MATERIAL_URANIUM = 7)
	sel_mode = 1
	projectile_type = /obj/item/projectile/beam/pulse
	charge_cost = 150 //4 shots out of a 600M
	fire_delay = 15
	origin_tech = list(TECH_COMBAT = 4, TECH_PLASMA = 3)
	damage_multiplier = 1.3
	init_firemodes = list(
		list(mode_name="armor penetrating", mode_desc="An armor-stripping plasma round", projectile_type=/obj/item/projectile/plasma/heavy, fire_sound='sound/weapons/energy/pulse.ogg', fire_delay=15, icon="kill", projectile_color = "#FFFF00"),
		list(mode_name="rapid fire", mode_desc="Quick firing normal plasma bolts", projectile_type=/obj/item/projectile/plasma, fire_sound='sound/weapons/energy/pulse.ogg', fire_delay=5, icon="destroy", projectile_color = "#FF0000", recoil_buildup=3),
	)

/obj/item/gun/energy/plasma/martyr // or should it be  Zealot
	name = "\"Martyr\" holdout pistol"
	desc = "An \"New Testament\" weapon that uses advanced biomass-converted blasts of energized matter. It is a disposable holdout side arm, good enough to save you and be recycled."
	icon = 'icons/obj/guns/energy/martyr.dmi'
	icon_state = "martyr"
	suitable_cell = /obj/item/cell/small    //so if people manage to get the cell out. shouldn't be a huge deal
	item_state = null	//so the human update icon uses the icon_state instead.
	item_charge_meter = TRUE
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_POCKET|SLOT_HOLSTER
	force = WEAPON_FORCE_PAINFUL
	matter = list(MATERIAL_STEEL = 2, "biomatter" = 20)
	disposable = TRUE
	origin_tech = list(TECH_COMBAT = 1, TECH_PLASMA = 1)
	price_tag = 250
	fire_sound = 'sound/weapons/energy/laser_pistol.ogg'
	cell_type = /obj/item/cell/small //can't recharge this one
	sel_mode = 2
	charge_cost = 10 // for 10 shots
	init_recoil = HANDGUN_RECOIL(0.1)
	twohanded = FALSE
	can_dual = TRUE
	gun_tags = list(GUN_ENERGY)
	damage_multiplier = 0.6 		//no holdout belt strats anymore
	penetration_multiplier = 1

	init_firemodes = list(
		list(mode_name="Stun", mode_desc="A weakening bolt of plasma that disables people", projectile_type=/obj/item/projectile/plasma/stun, fire_sound='sound/weapons/energy/marauder.ogg', fire_delay=2, icon="stun", projectile_color = "#0000FF"),
		list(mode_name="Melt", mode_desc="A heavier plasma bolt designed to melt through armor and flesh alike", projectile_type=/obj/item/projectile/plasma/heavy, fire_sound='sound/weapons/energy/pulse.ogg', fire_delay=14, icon="destroy", projectile_color = "#FFFFFF"),
	)

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // 20 vig

/obj/item/gun/energy/plasma/super_heavy
	name = "\"Ragefire\" Experimental Plasma Gun"
	desc = "A \"Soteria\" brand experimental weapon that uses coolant to fire deadly plasma projectiles without needing to cool down between shots, however the gun is extremely unstable without cooling."
	icon = 'icons/obj/guns/energy/plasma.dmi'
	icon_state = "plasma"
	fire_sound = 'sound/weapons/energy/lasercannonfire.ogg'
	projectile_type = /obj/item/projectile/plasma/heavy/super_heavy
	cell_type = /obj/item/cell/medium
	charge_cost = 150
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_STEEL = 20, MATERIAL_SILVER = 5, MATERIAL_PLASMA = 10)
	damage_multiplier = 1
	twohanded = FALSE
	can_dual = TRUE
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_HOLSTER
	serial_type = "SI"

	var/explode_chance // the % of chance the gun has to explode each time it is fired without coolant. It is random between each gun.
	var/explode_chance_min = 5 // The mininum of explode_chance
	var/explode_chance_max = 30 // The maximum of explode_chance
	var/coolant_used_per_shot = 10 // Amount of coolant used per shot.

	var/obj/item/reagent_containers/container //Beaker inserted.

	// Value used for the explosion, same as a normal mine.
	var/explosion_d_size = 0
	var/explosion_h_size = 0
	var/explosion_l_size = 3
	var/explosion_f_size = 5

	init_firemodes = list(
		list(mode_name="Super-heavy Plasma", mode_desc="A massive plasma bolt to melt even plasteel", projectile_type=/obj/item/projectile/plasma/heavy/super_heavy, fire_sound='sound/weapons/energy/pulse.ogg', fire_delay=5, icon="kill", projectile_color = "#FFFF00"),
	)

/obj/item/gun/energy/plasma/super_heavy/examine(mob/user)
	..()
	if(container)
		to_chat(user, SPAN_NOTICE("The [src.name] currently contain [container.reagents.total_volume] of chemicals."))

// We want that every gun got a random chance of exploding.
/obj/item/gun/energy/plasma/super_heavy/New()
	..()
	explode_chance = rand(explode_chance_min, explode_chance_max) // If there's no coolant, it got a random chance to explode, the chance itself is random.

/obj/item/gun/energy/plasma/super_heavy/attackby(obj/item/W, mob/user)

	if(istype(W, /obj/item/tool)) // Is it a tool?
		var/obj/item/tool/T = W // To use tool-only checks
		if(QUALITY_BOLT_TURNING in T.tool_qualities) // Can we turn bolts with the tool?
			if(container) // Do we have something to remove?
				if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_BOLT_TURNING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC)) // Skill check.
					to_chat(user, "You remove the [container.name] from the [src.name].")
					container.forceMove(user.loc) //Move the container to the floor of the user.
					container = null // We no longer have a container.
					return
			to_chat(user, "[src.name] doesn't have a container.")

	if(istype(W, /obj/item/reagent_containers)) // Is it something that hold chems ?

		// Do we already have one inside?
		if(container)
			to_chat(user, "The [src.name] already got a beaker.")
			return
		else
			var/obj/item/reagent_containers/C = W

			// Remove the container from the user and put it in the gun
			user.remove_from_mob(C) // Remove from the mob's hand before moving it.
			C.forceMove(src) // Moving the container into the gun.
			container = C // Assiging a reference variable
			to_chat(user, "You add the [W.name] to the [src].")
			return
	..()
	return

/obj/item/gun/energy/plasma/super_heavy/handle_post_fire(mob/user)
	..() // We shoot the gun before using the coolant.
	if(!(container) || !(container.reagents.remove_reagent("coolant", coolant_used_per_shot))) // First check if we have a container, if we do, then try to remove the coolant, if it can't, we continue.
		to_chat(user, SPAN_WARNING("Your [src.name] starts to overheat.")) // Warn the user that they ran out.

		if(prob(explode_chance)) // This roll the dice to see if the gun explode.
			usr.visible_message(SPAN_DANGER("[usr]'s [src.name] overheat and explode !")) // Obvious Message
			explosion(user, explosion_d_size * damage_multiplier, explosion_h_size * damage_multiplier, explosion_l_size * damage_multiplier, explosion_f_size * damage_multiplier) // EXPLOSION !
			qdel(src) // The gun blew up, it is no more.
			return
	return
