//////////////////////////////
//			Psionic Temporary Items
//////////////////////////////
// These are all items that vanish if they leave a psions hands or person. -Kaz

/obj/item/tool/psionic_omnitool
	name = "psionic omnitool"
	desc = "A tool created from the mind of a psion, it is capable of doing anything any other tool can but cannot do it quite as well unfortunately. The more skill you have in whatever action, \
	you're performing, the more valuable this tool becomes."
	icon_state = "psi_omni"
	force = WEAPON_FORCE_DANGEROUS
	worksound = WORKSOUND_DRIVER_TOOL
	w_class = ITEM_SIZE_BULKY
	flags = CONDUCT
	tool_qualities = list(QUALITY_SCREW_DRIVING = 25, QUALITY_BOLT_TURNING = 25, QUALITY_DRILLING = 25, QUALITY_WELDING = 25, QUALITY_CAUTERIZING = 25, QUALITY_PRYING = 25, QUALITY_DIGGING = 25, QUALITY_PULSING = 25, QUALITY_WIRE_CUTTING = 25, QUALITY_HAMMERING = 25, QUALITY_SHOVELING = 25, QUALITY_EXCAVATION = 25, QUALITY_CLAMPING = 25, QUALITY_RETRACTING = 25, QUALITY_SAWING = 25, QUALITY_BONE_SETTING = 25, QUALITY_CUTTING = 25, QUALITY_BONE_GRAFTING = 25)
	degradation = 0 // Can't degrade
	workspeed = 0.8
	use_power_cost = 0 // Don't use power
	max_upgrades = 0 // Can't upgrade it
	price_tag = 0
	var/mob/living/carbon/holder // The one that prevent the tool from fading

/obj/item/tool/psionic_omnitool/New(var/loc, var/mob/living/carbon/Maker)
	..()
	holder = Maker
	START_PROCESSING(SSobj, src)

/obj/item/tool/psionic_omnitool/Process()
	..()
	if(loc != holder) // We're no longer in the psionic's hand.
		visible_message("The [src.name] fades into nothingness.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return


/obj/item/tool/hammer/telekinetic_fist
	name = "telekinetic fist"
	desc = "A one time use fist made from a psion. It has a limited life span, better use it soon unless you plan to hold it for awhile."
	icon_state = "psyfist"
	item_state = "psyfist"
	flags = CONDUCT
	force = WEAPON_FORCE_PAINFUL
	worksound = WORKSOUND_HAMMER
	w_class = ITEM_SIZE_BULKY
	origin_tech = list()
	matter = list()
	attack_verb = list("attacked", "bashed", "battered", "bludgeoned", "whacked","flattened","pulped")
	tool_qualities = list()
	effective_faction = list("spider") // Spiders are weak to crushing.
	damage_mult = 2
	degradation = 0 // Can't degrade
	workspeed = 0.8
	max_upgrades = 0 // Can't upgrade it
	price_tag = 0
	var/mob/living/carbon/holder // The one that prevent the fist from fading

/obj/item/tool/hammer/telekinetic_fist/New(var/loc, var/mob/living/carbon/Maker)
	..()
	holder = Maker
	START_PROCESSING(SSobj, src)

/obj/item/tool/hammer/telekinetic_fist/attack(atom/movable/target, mob/user)
	var/whack_speed = 0

	if(user.stats.getStat(STAT_ROB) <= 0)
		force = WEAPON_FORCE_HARMLESS
		whack_speed = 2
	else if(user.stats.getStat(STAT_ROB) <= 15)
		force = WEAPON_FORCE_NORMAL // As strong as a kitchen knife
		whack_speed = 4
	else if(user.stats.getStat(STAT_ROB) <= 25)
		force = WEAPON_FORCE_DANGEROUS // As strong as a butcher cleaver
		whack_speed = 6
	else if(user.stats.getStat(STAT_ROB) <= 35)
		force = WEAPON_FORCE_ROBUST // As strong as a machete
		whack_speed = 6
	else if(user.stats.getStat(STAT_ROB) > 35)
		force = WEAPON_FORCE_BRUTAL
		whack_speed = 6

	if(user.stats.getPerk(PERK_PSI_MANIA))
		force = WEAPON_FORCE_BRUTAL
		whack_speed = 6

	var/throwdir = get_dir(user,target)
	target.throw_at(get_edge_target_turf(target, throwdir),whack_speed,whack_speed)
	..()
	force = initial(force) // Reset the damage just in case
	STOP_PROCESSING(SSobj, src)
	qdel(src)

/obj/item/tool/hammer/telekinetic_fist/Process()
	..()
	if(loc != holder) // We're no longer in the psionic's hand.
		visible_message("The [src.name] fades into nothingness.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return

/obj/item/tool/knife/psionic_blade
	name = "psychic blade"
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

/obj/item/tool/knife/psionic_blade/New(var/loc, var/mob/living/carbon/Maker)
	..()
	holder = Maker
	START_PROCESSING(SSobj, src)

/obj/item/tool/knife/psionic_blade/attack(atom/target, mob/user)
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

/obj/item/tool/knife/psionic_blade/Process()
	..()
	if(loc != holder) // We're no longer in the psionic's hand.
		visible_message("The [src.name] fades into nothingness.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return

/obj/item/shield/riot/crusader/psionic
	name = "psychic combat shield"
	desc = "A shield projected by the mind of a psion, it's speed and skill depend on the toughness of the psionic that created it. Useful for blocking energy beams, bullets, and melee attacks. \
	A simple thought can deploy or shrink the shield at will."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "psishield1"
	item_state = "psishield1"
	w_class = ITEM_SIZE_BULKY
	slot_flags = null
	origin_tech = list()
	matter = list()
	price_tag = 0
	max_durability = 100 //Can be made on mass and is meant to to be a light weak shield
	durability = 100
	slowdown_time = 0 //Were crappy and mass made by the mind
	armor_list = list(melee = 10, bullet = 10, energy = 5, bomb = 10, bio = 0, rad = 0)
	base_block_chance = 40
	var/mob/living/carbon/holder // The one that prevent the blade from fading

/obj/item/shield/riot/crusader/psionic/New(var/loc, var/mob/living/carbon/Maker)
	..()
	holder = Maker
	set_light(1.5, 1.5, COLOR_LIGHTING_PURPLE_BRIGHT)
	START_PROCESSING(SSobj, src)

/obj/item/shield/riot/crusader/psionic/Process()
	if(loc != holder) // We're no longer in the psionic's hand.
		visible_message("The [src.name] fades into nothingness.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return