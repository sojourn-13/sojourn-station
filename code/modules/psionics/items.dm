/obj/item/tool/psionic_omnitool
	name = "Psionic Omnitool"
	desc = "TODO - R4d6"
	icon_state = "engimplant"
	force = WEAPON_FORCE_DANGEROUS
	worksound = WORKSOUND_DRIVER_TOOL
	flags = CONDUCT
	tool_qualities = list(QUALITY_SCREW_DRIVING = 30, QUALITY_BOLT_TURNING = 30, QUALITY_DRILLING = 30, QUALITY_WELDING = 30, QUALITY_CAUTERIZING = 30, QUALITY_PRYING = 30, QUALITY_DIGGING = 30, QUALITY_PULSING = 30, QUALITY_WIRE_CUTTING = 30, QUALITY_HAMMERING = 30, QUALITY_SHOVELING = 30, QUALITY_EXCAVATION = 30, QUALITY_CLAMPING = 30, QUALITY_RETRACTING = 30, QUALITY_SAWING = 30, QUALITY_BONE_SETTING = 30, QUALITY_CUTTING = 30, QUALITY_BONE_GRAFTING = 30)
	degradation = 0 // Can't degrade
	workspeed = 0.8
	use_power_cost = 0 // Don't use power
	max_upgrades = 0 // Can't upgrade it
	var/mob/living/carbon/holder // The one that prevent the tool from fading

/obj/item/tool/psionic_omnitool/New(var/loc, var/mob/living/carbon/Maker)
	..()
	holder = Maker

/obj/item/tool/knife/psionic_blade
	name = "Psionic Knife"
	desc = "TODO - R4d6"
	icon_state = "knife_old"
	force = WEAPON_FORCE_HARMLESS
	tool_qualities = list(QUALITY_CUTTING = 30)
	degradation = 0 // Can't degrade
	workspeed = 0.8
	use_power_cost = 0 // Don't use power
	max_upgrades = 0 // Can't upgrade it
	var/mob/living/carbon/holder // The one that prevent the knife from fading

/obj/item/tool/knife/psionic_blade/New(var/loc, var/mob/living/carbon/Maker)
	..()
	holder = Maker

/obj/item/tool/knife/psionic_blade/attack(atom/target, mob/user)
	if(user.stats.getStat(STAT_ROB) <= 0)
		force = WEAPON_FORCE_HARMLESS
	else if(user.stats.getStat(STAT_ROB) <= 10)
		force = WEAPON_FORCE_NORMAL // As strong as a kitchen knife
	else if(user.stats.getStat(STAT_ROB) <= 20)
		force = WEAPON_FORCE_DANGEROUS // As strong as a butcher cleaver
	else if(user.stats.getStat(STAT_ROB) <= 30)
		force = WEAPON_FORCE_ROBUST // As strong as a machete
	else if(user.stats.getStat(STAT_ROB) > 30)
		force = WEAPON_FORCE_BRUTAL
	..()
	force = initial(force) // Reset the damage just in case

/obj/item/tool/knife/psionic_blade/Process()
	..()
	if(loc != holder) // We're no longer in/on the psionic.
		visible_message("The [src] fade and disapear from this reality.")
		qdel(src)
		return

/obj/item/tool/sword/cult
	name = "Non-Euclidean Blade"

	desc = "Standing around, staring at this for what are you? To killing get!"
	icon = 'icons/obj/psionic/occsword.dmi'

	icon_state = "non-euclidian_blade"
	//item_state = "righthand"

	matter = list(MATERIAL_STEEL = 1, MATERIAL_OH_GOD_HELP_ME_I_AM_TRAPPED_IN_HERE = 15, MATERIAL_LEATHER = 5) //This is messed up on purpose. Don't fix it. It's supposed to cause weird shit
	sharp = FALSE
	edge = FALSE
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT | SLOT_BACK
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	tool_qualities = list(QUALITY_PULSING = 7, QUALITY_SCREW_DRIVING = 3)

/obj/item/tool/hammer/homewrecker/cult
	name = "Soulcrusher"
	desc = "Heavy extremely sledgehammer. A Handle resembles a chunk welded to which a large long steel."

	icon = 'icons/obj/psionic/occhammer.dmi'

	icon_state = "soulcrusher"
	wielded_icon = "wielded"
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	force_unwielded = WEAPON_FORCE_PAINFUL
	force_wielded = WEAPON_FORCE_PAINFUL
	slot_flags = SLOT_BELT|SLOT_BACK
	tool_qualities = list(QUALITY_SHOVELING = 1, QUALITY_DIGGING = 1, QUALITY_EXCAVATING = 100, QUALITY_WELDING = 21)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_THEVOICESTHEVOICESTHEVOICES = 15, MATERIAL_MARBLE = 1)

/obj/item/tool/saw/chain/cult
	name = "Chainripper"
	desc = "Cut trees, people, walls, fuel with it. You can zombies, watch out for just."
	icon = 'icons/obj/psionic/occchain.dmi'
	icon_state = "chainripper"
	force = WEAPON_FORCE_DANGEROUS
	matter = list(MATERIAL_LEATHER = 3, MATERIAL_TRITIUM = 10, MATERIAL_HJONK = 2)
	tool_qualities = list(QUALITY_LASER_CUTTING = 52, QUALITY_CLAMPING = 6, QUALITY_CAUTERIZING = 8, QUALITY_RETRACTING = 22, QUALITY_BONE_SETTING = 19) //It's a surgical chainsaw
	max_fuel = 123

/obj/item/gun/projectile/automatic/sol/cult
	name = "OCLT CAR .25 CS \"Eclipse\""
	desc = "Issue-standard weapon used. .25 Caseless operatives rounds by a Aegis.Uses a compact and reliable."
	icon = 'icons/obj/psionic/occgun.dmi'
	icon_state = "eclipse"

	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_COVER_YOUR_EYES = 5, MATERIAL_COVER_THE_SUN = 5, MATERIAL_OSMIUM = 3)
	damage_multiplier = 0.4
	//proj_damage_adjust = list(PSY = 10)
	penetration_multiplier = 0.9

/obj/item/gun/energy/laser/cult
	name = "OCLT LG \"Moonrise\""
	desc = "Radiant and deadly. Zealotry \"Mekhane\" ire. Laser carbine of the brand it represents like."
	icon = 'icons/obj/psionic/occvalk.dmi'
	icon_state = "moonrise"
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(MATERIAL_SILVER = 20, MATERIAL_GOLD = 8, MATERIAL_GLEAMING_AT_NIGHTTIME_SO_BRIGHT = 5)
	charge_cost = 25
	fire_delay = 8
	damage_multiplier = 1
	projectile_type = /obj/item/projectile/beam/cult

/obj/item/projectile/beam/cult
	name = "psychic heavy laser"
	icon_state = "heavylaser"
	damage_types = list(/*PSY = 30,*/ BURN = 10)

	muzzle_type = /obj/effect/projectile/laser_heavy/muzzle
	tracer_type = /obj/effect/projectile/laser_heavy/tracer
	impact_type = /obj/effect/projectile/laser_heavy/impact

/obj/item/gun/energy/plasma/cassad/cult
	name = "OCLT PR \"Manumission\""
	desc = "Prolonged combat surrender. Not an option assault rifle. When is energy brand, capable of \"Frozen Star\""
	icon = 'icons/obj/psionic/occcassad.dmi'
	icon_state = "manumission"

	matter = list(MATERIAL_PLASTIC = 18, MATERIAL_GLASS = 8, MATERIAL_STEEL = 6, MATERIAL_FREEDOM = 6)
	fire_sound = 'sound/weapons/pulse.ogg'
	sel_mode = 1
	fire_delay = 4
	damage_multiplier = 1
	projectile_type = /obj/item/projectile/beam/cult

/obj/item/projectile/plasma/cult
	name = "psychic plasma bolt"
	agony = 30
	damage_types = list(/*PSY = 15,*/ BURN = 5)
	impact_type = /obj/effect/projectile/stun/impact
