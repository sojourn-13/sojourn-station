/obj/item/gun/energy/taser
	name = "\"Counselor\" stun gun"
	desc = "The OT \"Counselor\" is a taser gun used for non-lethal takedowns. Originally developed by the Seinemetall Defense GmbH, the blueprints were obtained by an Absolutist and transferred to the incipient Old Testament as a nonlethal option for the new Church."
	icon = 'icons/obj/guns/energy/taser.dmi'
	icon_state = "taser"
	item_state = null	//so the human update icon uses the icon_state instead.
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6, MATERIAL_SILVER = 3)
	price_tag = 1000
	charge_cost = 50
	fire_sound = 'sound/weapons/energy/Taser.ogg'
	can_dual = TRUE
	projectile_type = /obj/item/projectile/beam/stun

	init_firemodes = list(
		STUNBOLT,
		list(mode_name="stunbolt", mode_desc="Fires a ball of condensed energy to disable people", projectile_type=/obj/item/projectile/energy/electrode, fire_delay=25, charge_cost = 300, icon="destroy"),
		list(mode_name="stunshot", mode_desc="Fires a ball of highly condensed energy to disable people almost instantly", projectile_type=/obj/item/projectile/energy/electrode/stunshot, fire_delay=35, charge_cost = 600, icon="vaporize"), //Takes 1 full level 1 M cell
	)
	serial_type = "Absolute"

/obj/item/gun/energy/taser/make_old()
	. = ..()
	desc += " This one seems to predate the Church acquisition."
	serial_type = "SD GmbH"

/obj/item/gun/energy/taser/mounted
	name = "mounted taser gun"
	self_recharge = 1
	use_external_power = 1
	safety = FALSE
	restrict_safety = TRUE
	damage_multiplier = 0.6

	init_firemodes = list(
		STUNBOLT,
		list(mode_name="stunbolt", mode_desc="Fires a ball of condensed energy to disable people", projectile_type=/obj/item/projectile/energy/electrode, fire_delay=20, charge_cost = 300),
		list(mode_name="stunshot", projectile_type=/obj/item/projectile/energy/electrode/stunshot, fire_delay=40, charge_cost = 600),
	)

/obj/item/gun/energy/taser/mounted/cyborg
	name = "taser gun"
	recharge_time = 10 //Time it takes for shots to recharge (in ticks)
	damage_multiplier = 0.9
	init_firemodes = list(
		STUNBOLT,
		list(mode_name="stunbolt", mode_desc="Fires a ball of condensed energy to disable people", projectile_type=/obj/item/projectile/energy/electrode, fire_delay=20, charge_cost = 300),
		list(mode_name="stunshot", mode_desc="Fires a ball of highly condensed energy to disable people almost instantly", projectile_type=/obj/item/projectile/energy/electrode/stunshot, fire_delay=30, charge_cost = 600),
	)

/obj/item/gun/energy/stunrevolver
	name = "\"Zeus\" stun revolver"
	desc = "Also know as stun revolver. Seinemetall Defense GmbH with Soteria Institute solution for non-lethal takedowns, its rather simple deisign has a smaller capacity in exchange for S-cells use. \
			The now outdated design was the base for the much more successfull \"Counselor\"."
	icon = 'icons/obj/guns/energy/stunrevolver.dmi'
	icon_state = "stunrevolver"
	item_state = "stunrevolver"
	fire_sound = 'sound/weapons/Gunshot.ogg'
	can_dual = TRUE
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3, TECH_POWER = 2)
	charge_cost = 50
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_STEEL = 6, MATERIAL_SILVER = 2, MATERIAL_PLASTIC = 5)
	price_tag = 750
	suitable_cell = /obj/item/cell/small
	cell_type = /obj/item/cell/small
	projectile_type = /obj/item/projectile/energy/electrode

/obj/item/gun/energy/stunrevolver/sci
	name = "\"Hera\" stun revolver"
	desc = "Also know as stun revolver. Seinemetall Defense GmbH with Soteria Institute solution for non-lethal takedowns, its rather simple deisign has a smaller capacity in exchange for S-cells use. \
			The now outdated design was the base for the much more successful \"Counselor\". This verson is almost identical to the \"Zeus\" only being repainted after Seinemetall Defense GmbH moved to ballistics based manufacturing."
	icon = 'icons/obj/guns/energy/si_stunrevolver.dmi'
	serial_type = "SI"

/obj/item/gun/energy/stunrevolver/sci/preloaded //For soteria lifeline techs

/obj/item/gun/energy/stunrevolver/sci/preloaded/New()
	cell = new /obj/item/cell/small/moebius/high(src)
	. = ..()
	update_icon()

/obj/item/gun/energy/taser/blackshield

/obj/item/gun/energy/taser/blackshield/New()
	cell = new /obj/item/cell/medium/hyper(src)
	. =..()
