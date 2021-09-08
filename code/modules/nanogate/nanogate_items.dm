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

/obj/item/rig/nanite
	name = "nanite suit control module"
	desc = "A lighter, less armoured rig suit made from nanites and attached to someone's spine."
	icon_state = "ihs_rig_old"
	suit_type = "nanite suit"
	armor = list(
		melee = 25,
		bullet = 20,
		energy = 20,
		bomb = 25,
		bio = 100,
		rad = 25
	)
	emp_protection = 10
	slowdown = 0
	item_flags = STOPPRESSUREDAMAGE | THICKMATERIAL | DRAG_AND_DROP_UNEQUIP | EQUIP_SOUNDS
	offline_slowdown = 0
	offline_vision_restriction = 0
	drain = 2
	canremove = FALSE // It is attached to your back

	chest_type = /obj/item/clothing/suit/space/rig/nanite
	helm_type =  /obj/item/clothing/head/helmet/space/rig/nanite
	boot_type =  /obj/item/clothing/shoes/magboots/rig/nanite
	glove_type = /obj/item/clothing/gloves/rig/nanite
	cell_type =  /obj/item/cell/large/moebius/super

	var/charge_tick = 10
	var/recharge_time = 10

/obj/item/rig/nanite/New()
	..()
	Initialize()

/obj/item/rig/nanite/Process()
	..()
	charge_tick++
	if(charge_tick < recharge_time) return 0
		charge_tick = 0

	if(!cell || cell.charge >= cell.maxcharge)
		return FALSE // check if we actually need to recharge

	if(drain_apc(drain)) //Take power from the APC...
		cell.give(drain) //... to recharge the shot
	return TRUE

/obj/item/rig/nanite/proc/drain_apc(var/power_usage)
	var/area/A = get_area(src)
	if(!istype(A) || !A.powered(STATIC_EQUIP))
		return FALSE

	A.use_power(power_usage, STATIC_EQUIP)
	return TRUE

/obj/item/clothing/suit/space/rig/nanite
	name = "suit"

/obj/item/clothing/gloves/rig/nanite
	name = "gloves"

/obj/item/clothing/shoes/magboots/rig/nanite
	name = "shoes"

/obj/item/clothing/head/helmet/space/rig/nanite
	name = "hood"
