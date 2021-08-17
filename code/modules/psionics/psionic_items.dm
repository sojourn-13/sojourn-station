// Tools
/obj/item/tool/psionic_omnitool
	name = "psionic omnitool"
	desc = "A tool created from the mind of a psion, it is capable of doing anything any other tool can but cannot do it quite as well unfortunately. The more mechanically inclined one is, the better \
	this tool becomes."
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
	var/process_delay = 10 // How much time, in deciseconds (1/10th of a second) between Process() calls

/obj/item/tool/psionic_omnitool/New(var/loc, var/mob/living/carbon/Maker)
	..()
	holder = Maker
	START_PROCESSING(SSobj, src)

/obj/item/tool/psionic_omnitool/Process()
	..()
	if(loc != holder && loc.loc != holder) // We're no longer in/on the psionic.
		visible_message("The [src.name] fades into nothingness.")
		qdel(src)
		return

// Temporary psionic items/weapons.
/obj/item/tool/hammer/telekinetic_fist
	name = "telekinetic fist"
	desc = "A one time use fist made from a psion. It has a limited life span, better use it soon unless you plan to hold it for awhile."
	icon_state = "hammer"
	item_state = "hammer"
	flags = CONDUCT
	force = WEAPON_FORCE_PAINFUL
	worksound = WORKSOUND_HAMMER
	w_class = ITEM_SIZE_SMALL
	origin_tech = list()
	matter = list()
	attack_verb = list("attacked", "bashed", "battered", "bludgeoned", "whacked","flattened","pulped")
	tool_qualities = list(QUALITY_HAMMERING = 35, QUALITY_PRYING = 10)
	effective_faction = list("spider") // Spiders are weak to crushing.
	damage_mult = 2
	degradation = 0 // Can't degrade
	workspeed = 0.8
	max_upgrades = 0 // Can't upgrade it
	var/mob/living/carbon/holder // The one that prevent the fist from fading
	var/process_delay = 10 // How much time, in deciseconds (1/10th of a second) between Process() calls

/obj/item/tool/hammer/telekinetic_fist/New(var/loc, var/mob/living/carbon/Maker)
	..()
	holder = Maker
	START_PROCESSING(SSobj, src)

/obj/item/tool/hammer/telekinetic_fist/attack(atom/movable/target, mob/user)
	var/atom/movable/throw_target = get_edge_target_turf(target, user.dir)
	var/whack_speed = 0

	if(user.stats.getStat(STAT_ROB) <= 0)
		force = WEAPON_FORCE_HARMLESS
		whack_speed = 2
	else if(user.stats.getStat(STAT_ROB) <= 10)
		force = WEAPON_FORCE_NORMAL // As strong as a kitchen knife
		whack_speed = 4
	else if(user.stats.getStat(STAT_ROB) <= 20)
		force = WEAPON_FORCE_DANGEROUS // As strong as a butcher cleaver
		whack_speed = 6
	else if(user.stats.getStat(STAT_ROB) <= 30)
		force = WEAPON_FORCE_ROBUST // As strong as a machete
		whack_speed = 6
	else if(user.stats.getStat(STAT_ROB) > 30)
		force = WEAPON_FORCE_BRUTAL
		whack_speed = 6
	target.throw_at(throw_target, whack_speed, whack_speed, user, gentle = TRUE)
	..()
	force = initial(force) // Reset the damage just in case
	qdel(src)

/obj/item/tool/hammer/telekinetic_fist/Process()
	..()
	if(loc != holder && loc.loc != holder) // We're no longer in/on the psionic.
		visible_message("The [src.name] fades into nothingness.")
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
	tool_qualities = list(QUALITY_CUTTING = 30)
	origin_tech = list()
	matter = list()
	degradation = 0 // Can't degrade
	workspeed = 0.8
	use_power_cost = 0 // Don't use power
	max_upgrades = 0 // Can't upgrade it
	var/mob/living/carbon/holder // The one that prevent the blade from fading
	var/process_delay = 10 // How much time, in deciseconds (1/10th of a second) between Process() calls

/obj/item/tool/knife/psionic_blade/New(var/loc, var/mob/living/carbon/Maker)
	..()
	holder = Maker
	START_PROCESSING(SSobj, src)

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
	if(loc != holder && loc.loc != holder) // We're no longer in/on the psionic.
		visible_message("The [src.name] fades into nothingness.")
		qdel(src)
		return


// Oddity to Weapons list
/obj/item/tool/sword/cult
	name = "Non-Euclidean Blade"
	desc = "A blade forged from the mind of a psion using an oddity. An odd but deadly sword, yet holding it makes you feel... odd."
	icon = 'icons/obj/psionic/occsword.dmi'
	icon_state = "non-euclidian_blade"

	origin_tech = list()
	matter = list()
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
	desc = "An extremely heavy sledgehammer that looks like twisted forged iron still glowing with the remnants of the psionic power that shaped it. The head of it burns with a subtle heat, the core \
	filled with the fires of ambition to create and destroy."
	icon = 'icons/obj/psionic/occhammer.dmi'
	icon_state = "soulcrusher"
	wielded_icon = "wielded"
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	force_unwielded = WEAPON_FORCE_PAINFUL
	force_wielded = WEAPON_FORCE_PAINFUL
	slot_flags = SLOT_BELT|SLOT_BACK
	tool_qualities = list(QUALITY_SHOVELING = 1, QUALITY_DIGGING = 1, QUALITY_HAMMER = 50, QUALITY_WELDING = 21)
	origin_tech = list()
	matter = list()

/obj/item/tool/saw/chain/cult
	name = "Chainripper"
	desc = "A chainsaw forged from the mind of a psion, the blades glowing with the energy and heat of its psychic power. Though a saw, it cuts cleanly and leaves charring in its wake."
	icon = 'icons/obj/psionic/occchain.dmi'
	icon_state = "chainripper"
	force = WEAPON_FORCE_DANGEROUS
	origin_tech = list()
	matter = list()
	tool_qualities = list(QUALITY_LASER_CUTTING = 42, QUALITY_CLAMPING = 6, QUALITY_CAUTERIZING = 8, QUALITY_RETRACTING = 22, QUALITY_BONE_SETTING = 19) //It's a surgical chainsaw
	max_fuel = 123

/obj/item/gun/projectile/automatic/sts/rifle/cult
	name = "\"Eclipse\" psi-rifle"
	desc = "An STS conjured from the minds of a psion who shaped an oddity into a weapon. It is nearly identical to a normal STS-30 battle rifle, save for lacking as much penetration or stopping power."
	icon = 'icons/obj/psionic/occgun.dmi'
	icon_state = "eclipse"
	origin_tech = list()
	matter = list()
	damage_multiplier = 0.9
	penetration_multiplier = 0.9

/obj/item/gun/energy/laser/cult
	name = "\"Moonrise\" psi-laser rifle"
	desc = "Radiant and deadly, a weapon forged from the mind of a psion who shaped an oddity into a weapon. Perhaps the twisted reimagination of the zealotry often attributed to the local cult. \
	Was it a joke, an insult, or a yearning for something lost? Whatever the case, this weapon is slightly less deadly than the one it mocks."
	icon = 'icons/obj/psionic/occvalk.dmi'
	icon_state = "moonrise"
	origin_tech = list()
	matter = list()
	projectile_type = /obj/item/projectile/beam/cult
	damage_multiplier = 0.9
	penetration_multiplier = 0.9

/obj/item/projectile/beam/cult
	name = "psychic heavy laser"
	icon_state = "heavylaser"
	damage_types = list(BURN = 20)
	armor_penetration = 0

	muzzle_type = /obj/effect/projectile/laser_heavy/muzzle
	tracer_type = /obj/effect/projectile/laser_heavy/tracer
	impact_type = /obj/effect/projectile/laser_heavy/impact

/obj/item/gun/energy/plasma/cassad/cult
	name = "\"Black Sun\" psi-plasma rifle"
	desc = "A plasma weapon formed from the mind of a psion who shaped an oddity into a weapon. A psychic copy of the cassad, a widely known weapon for being one of the few examples of plasma tech \
	outside the Soteria or Church. Perhaps its popularity is what imprinted it in the memory of the psion that made it?"
	icon = 'icons/obj/psionic/occcassad.dmi'
	icon_state = "manumission"

	origin_tech = list()
	matter = list()
	fire_sound = 'sound/weapons/pulse.ogg'
	projectile_type = /obj/item/projectile/plasma/cult
	damage_multiplier = 0.9
	penetration_multiplier = 0.9

/obj/item/projectile/plasma/cult
	name = "psychic plasma bolt"
	damage_types = list(BURN = 28)
	armor_penetration = 0
	impact_type = /obj/effect/projectile/stun/impact

// Oddity to Tools list
/obj/item/tool/multitool/advanced/cult
	name = "synapse reader"
	desc = "A strange device shaped by a psion for an unknown purpose. Curiosity is the core of humanity, to delve into secrets is the desire of many, even if said secrets are better left forgotten."
	icon_state = "psitool"
	tool_qualities = list(QUALITY_PULSING = 42, QUALITY_CAUTERIZING = 22, QUALITY_RETRACTING = 18)
	matter = list()
	origin_tech = list()
	use_power_cost = 0.50
	workspeed = 1.2
	max_upgrades = 4
	suitable_cell = /obj/item/cell/medium

/obj/item/tool/shovel/power/cult
	name = "pit delver"
	desc = "A tool made from the mind of a psion using an oddity. Do you not fear what lies beneath? Or is what you think you'll gain worth it?"
	icon_state = "psipowershovel"
	item_state = "shovel"
	matter = list()
	tool_qualities = list(QUALITY_SHOVELING = 53, QUALITY_DIGGING = 42, QUALITY_EXCAVATION = 34, QUALITY_HAMMERING = 6)

/obj/item/tool/screwdriver/combi_driver/cult
	name = "rotary spanner"
	desc = "A tool crafted from the thoughts of a psion after shaping an oddity. A mind is an adapative thing, so why wouldn't it make an adaptive tool?"
	icon_state = "psi_driver"
	matter = list()
	tool_qualities = list(QUALITY_SCREW_DRIVING = 42, QUALITY_BOLT_TURNING = 42, QUALITY_DRILLING = 42, QUALITY_RETRACTING = 22)

/obj/item/tool/weldingtool/advanced/cult
	name = "thought scorcher"
	desc = "A tool crafted from the thoughts of a psion after shaping an oddity. A mind is an adapative thing, so why wouldn't it make an adaptive tool?"
	icon_state = "psi_welder"
	item_state = "psi_welder"
	glow_color = COLOR_BLUE_LIGHT
	switched_on_qualities = list(QUALITY_WELDING = 39, QUALITY_CAUTERIZING = 24, QUALITY_WIRE_CUTTING = 12, QUALITY_PULSING = 7, QUALITY_SCREW_DRIVING = 3)
	max_fuel = 29
	matter = list()
