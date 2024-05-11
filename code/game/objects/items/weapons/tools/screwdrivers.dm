/obj/item/tool/screwdriver
	name = "screwdriver"
	desc = "You can use this to open panels, screw stuff and such things."
	icon_state = "screwdriver"
	flags = CONDUCT
	worksound = WORKSOUND_SCREW_DRIVING
	slot_flags = SLOT_BELT | SLOT_EARS
	w_class = ITEM_SIZE_TINY
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 1)
	attack_verb = list("stabbed")
	tool_qualities = list(QUALITY_SCREW_DRIVING = 35, QUALITY_BONE_SETTING = 10)
	price_tag = 9

/obj/item/tool/screwdriver/bs
	name = "bluespace screwdriver"
	icon_state = "bs_screwdriver"
	tool_qualities = list(QUALITY_SCREW_DRIVING = 100, QUALITY_BONE_SETTING = 100)

/obj/item/tool/screwdriver/improvised
	name = "screw pusher"
	desc = "A little metal rod wrapped in a tape handle. This can be fixed with enough tool mods, for which it has ample capacity."
	icon_state = "impro_screwdriver"
	tool_qualities = list(QUALITY_SCREW_DRIVING = 15)
	degradation = 2
	max_upgrades = 5 //all makeshift tools get more mods to make them actually viable for mid-late game
	price_tag = 2

/obj/item/tool/screwdriver/electric
	name = "electric screwdriver"
	desc = "An electrical screwdriver, powered by an S class cell. Can be used as a drilling tool if necessary, though it is badly suited to do so."
	icon_state = "e-screwdriver"
	worksound = WORKSOUND_DRIVER_TOOL
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 1)
	tool_qualities = list(QUALITY_SCREW_DRIVING = 50, QUALITY_DRILLING = 10, QUALITY_BONE_SETTING = 10)
	degradation = 0.7
	max_upgrades = 4
	use_power_cost = 0.18
	suitable_cell = /obj/item/cell/small
	price_tag = 300

/obj/item/tool/screwdriver/combi_driver
	name = "combination drill"
	desc = "Turn screws, turn bolts, drill bones - you can do everything with it! But it drains power cells quickly."
	icon_state = "combi_driver"
	w_class = ITEM_SIZE_NORMAL
	worksound = WORKSOUND_DRIVER_TOOL
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_STEEL = 6, MATERIAL_PLASTEEL = 2, MATERIAL_PLASTIC = 2)
	tool_qualities = list(QUALITY_SCREW_DRIVING = 40, QUALITY_BOLT_TURNING = 40, QUALITY_DRILLING = 20)
	degradation = 1.5
	use_power_cost = 0.54
	suitable_cell = /obj/item/cell/small
	max_upgrades = 4
	price_tag = 325 // Highly prized (BUT, no longer an economic powerhouse. Also affordable.)

/obj/item/tool/screwdriver/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!istype(M) || user.a_intent == "help")
		return ..()
	if(user.targeted_organ != BP_EYES)
		return ..()
	if((CLUMSY in user.mutations) && prob(15))
		M = user
	return eyestab(M,user)


/obj/item/tool/screwdriver/combi_driver/onestar
	name = "Greyson Positronic combination drill"
	desc = "Does better than the standard combination drivers on the market, but has less slots for tool mods."
	icon_state = "one_star_combidriver"
	matter = list(MATERIAL_STEEL = 6, MATERIAL_PLATINUM = 3)
	tool_qualities = list(QUALITY_SCREW_DRIVING = 60, QUALITY_BOLT_TURNING = 60, QUALITY_DRILLING = 25)
	origin_tech = list(TECH_ENGINEERING = 3, TECH_MATERIAL = 2)
	degradation = 2.5
	workspeed = 1.7
	use_power_cost = 0.3
	suitable_cell = /obj/item/cell/small
	max_upgrades = 2
	price_tag = 1200 // Very prized.
	allow_greyson_mods = TRUE
