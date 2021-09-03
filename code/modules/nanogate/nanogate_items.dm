// Here is where we store the items made by the nanogate organ.

/obj/item/tool/nanite_omnitool
	name = "nanite omnitool"
	desc = "A tool created from nanites, it is capable of doing anything any other tool can but cannot do it quite as well unfortunately. The more skill you have in whatever action, \
	you're performing, the more valuable this tool becomes."
	icon_state = "psi_omni"
	force = WEAPON_FORCE_DANGEROUS
	worksound = WORKSOUND_DRIVER_TOOL
	w_class = ITEM_SIZE_BULKY
	flags = CONDUCT
	tool_qualities = list(QUALITY_SCREW_DRIVING = 25, QUALITY_BOLT_TURNING = 25, QUALITY_WELDING = 25, QUALITY_PRYING = 25, QUALITY_DIGGING = 25, QUALITY_PULSING = 25, QUALITY_WIRE_CUTTING = 25, QUALITY_HAMMERING = 25, QUALITY_SHOVELING = 25, QUALITY_EXCAVATION = 25, QUALITY_SAWING = 25, QUALITY_CUTTING = 25)
	degradation = 0 // Can't degrade
	workspeed = 0.8
	use_power_cost = 0 // Don't use power
	max_upgrades = 0 // Can't upgrade it
	price_tag = 0
	var/mob/living/carbon/holder // The one that prevent the tool from fading

/obj/item/tool/nanite_omnitool/New(var/loc, var/mob/living/carbon/Maker)
	..()
	holder = Maker
	START_PROCESSING(SSobj, src)

/obj/item/tool/nanite_omnitool/Process()
	..()
	if(loc != holder) // We're no longer in the holder.
		visible_message("The [src.name] turn into useless nanite goo.")
		qdel(src)
		return

/obj/item/tool/knife/nanite_blade
	name = "nanite blade"
	desc = "A blade made from the mind of a psion. Though it is a mental projection, the maker's physical strength accounts for how deadly the edge is. The stronger the body, the better the blade. \
	Deceptively harmless, unless you're robust."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "psi_knife"
	item_state = "psi_knife"
	force = WEAPON_FORCE_HARMLESS
	w_class = ITEM_SIZE_BULKY
	tool_qualities = list(QUALITY_CUTTING = 30)
	origin_tech = list()
	matter = list()
	degradation = 0 // Can't degrade
	workspeed = 0.8
	use_power_cost = 0 // Don't use power
	max_upgrades = 0 // Can't upgrade it
	price_tag = 0
	var/mob/living/carbon/holder // The one that prevent the blade from fading

/obj/item/tool/knife/nanite_blade/New(var/loc, var/mob/living/carbon/Maker)
	..()
	holder = Maker
	START_PROCESSING(SSobj, src)

/obj/item/tool/knife/nanite_blade/attack(atom/target, mob/user)
	if(user.stats.getStat(STAT_ROB) <= 0)
		force = WEAPON_FORCE_HARMLESS
	else if(user.stats.getStat(STAT_ROB) <= 15)
		force = WEAPON_FORCE_NORMAL // As strong as a kitchen knife
	else if(user.stats.getStat(STAT_ROB) <= 25)
		force = WEAPON_FORCE_DANGEROUS // As strong as a butcher cleaver
	else if(user.stats.getStat(STAT_ROB) <= 35)
		force = WEAPON_FORCE_ROBUST // As strong as a machete
	else if(user.stats.getStat(STAT_ROB) > 35)
		force = WEAPON_FORCE_BRUTAL
	if(user.stats.getPerk(PERK_PSI_MANIA))
		force = WEAPON_FORCE_BRUTAL
	..()
	force = initial(force) // Reset the damage just in case

/obj/item/tool/knife/nanite_blade/Process()
	..()
	if(loc != holder) // We're no longer in the holder.
		visible_message("The [src.name] turn into useless nanite goo.")
		qdel(src)
		return
