/obj/item/tool/weldingtool
	name = "welding tool"
	icon_state = "welder"
	item_state = "welder"
	flags = CONDUCT
	force = WEAPON_FORCE_WEAK
	switched_on_force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_WEAK
	worksound = WORKSOUND_WELDING
	matter = list(MATERIAL_STEEL = 5)
	origin_tech = list(TECH_ENGINEERING = 1)
	switched_on_qualities = list(QUALITY_WELDING = 35, QUALITY_CAUTERIZING = 10, QUALITY_WIRE_CUTTING = 10)

	sparks_on_use = TRUE
	eye_hazard = TRUE

	use_fuel_cost = 0.1
	max_fuel = 25

	toggleable = TRUE
	create_hot_spot = TRUE
	glow_color = COLOR_ORANGE
	price_tag = 25

	heat = 2250


/obj/item/tool/weldingtool/turn_on(mob/user)
	.=..()
	if(.)
		playsound(loc, 'sound/items/welderactivate.ogg', 50, 1)
		damtype = BURN
		START_PROCESSING(SSobj, src)
	//Todo: Add a better hit sound for a turned_on welder

/obj/item/tool/weldingtool/turn_off(mob/user)
	item_state = initial(item_state)
	playsound(loc, 'sound/items/welderdeactivate.ogg', 50, 1)
	..()
	damtype = initial(damtype)


/obj/item/tool/weldingtool/is_hot()
	if (damtype == BURN)
		return heat


/obj/item/tool/weldingtool/improvised
	name = "jury-rigged torch"
	desc = "An assembly of pipes attached to a little gas tank. Serves capably as a welder, though a bit risky. Can be improved greatly with a large amount of tool mods."
	icon_state = "ghettowelder"
	item_state = "ghettowelder"
	switched_on_force = WEAPON_FORCE_PAINFUL * 0.8
	max_fuel = 15
	switched_on_qualities = list(QUALITY_WELDING = 15, QUALITY_CAUTERIZING = 10, QUALITY_WIRE_CUTTING = 10)
	degradation = 1.5
	max_upgrades = 5 //all makeshift tools get more mods to make them actually viable for mid-late game
	price_tag = 12

//The improvised welding tool is created with a full tank of fuel.
//It's implied that it's burning the oxygen in the emergency tank that was used to create it
/obj/item/tool/weldingtool/improvised/Created()
	return


/obj/item/tool/weldingtool/advanced
	name = "advanced welding tool"
	icon_state = "adv_welder"
	item_state = "adv_welder"
	glow_color = COLOR_BLUE_LIGHT
	switched_on_qualities = list(QUALITY_WELDING = 45, QUALITY_CAUTERIZING = 15, QUALITY_WIRE_CUTTING = 15)
	max_fuel = 40
	matter = list(MATERIAL_PLASTEEL = 5)
	switched_on_force = WEAPON_FORCE_PAINFUL * 1.15 //Slightly more powerful, not much more so
	heat = 3773
	degradation = 0.7
	max_upgrades = 4
	price_tag = 200

/obj/item/tool/weldingtool/bs
	name = "bluespace welding tool"
	icon_state = "bs_welder"
	item_state = "bs_welder"
	max_fuel = 2500
	glow_color = COLOR_BLUE_LIGHT
	switched_on_qualities = list(QUALITY_WELDING = 100, QUALITY_CAUTERIZING = 100, QUALITY_WIRE_CUTTING = 100)

/obj/item/tool/weldingtool/onestar
	name = "\improper Greyson Positronic welding tool"
	desc = "An old and legendary Greyson Positronic welding tool. Very powerful and reliable, but its compact design causes it to suffer from a lack of both fuel storage and efficiency."
	icon_state = "one_star_welder"
	item_state = "welder"
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLATINUM = 2)
	origin_tech = list(TECH_ENGINEERING = 2, TECH_MATERIAL = 3)
	switched_on_qualities = list(QUALITY_WELDING = 60, QUALITY_CAUTERIZING = 25, QUALITY_WIRE_CUTTING = 25)
	glow_color = COLOR_RED_LIGHT
	use_fuel_cost = 0.15
	max_fuel = 20
	degradation = 0.6
	heat = 2750
	max_upgrades = 2
	workspeed = 1.5
	price_tag = 900
