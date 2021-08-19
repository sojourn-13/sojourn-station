// Tools
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
		qdel(src)
		return

// Temporary psionic items/weapons.
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

	if(user.stats.getPerk(PERK_PSI_MANIA))
		force = WEAPON_FORCE_BRUTAL
		whack_speed = 6

	var/throwdir = get_dir(user,target)
	target.throw_at(get_edge_target_turf(target, throwdir),whack_speed,whack_speed)
	..()
	force = initial(force) // Reset the damage just in case
	qdel(src)

/obj/item/tool/hammer/telekinetic_fist/Process()
	..()
	if(loc != holder) // We're no longer in the psionic's hand.
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
	else if(user.stats.getStat(STAT_ROB) <= 10)
		force = WEAPON_FORCE_NORMAL // As strong as a kitchen knife
	else if(user.stats.getStat(STAT_ROB) <= 20)
		force = WEAPON_FORCE_DANGEROUS // As strong as a butcher cleaver
	else if(user.stats.getStat(STAT_ROB) <= 30)
		force = WEAPON_FORCE_ROBUST // As strong as a machete
	else if(user.stats.getStat(STAT_ROB) > 30)
		force = WEAPON_FORCE_BRUTAL
	if(user.stats.getPerk(PERK_PSI_MANIA))
		force = WEAPON_FORCE_BRUTAL
	..()
	force = initial(force) // Reset the damage just in case

/obj/item/tool/knife/psionic_blade/Process()
	..()
	if(loc != holder) // We're no longer in the psionic's hand.
		visible_message("The [src.name] fades into nothingness.")
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
	origin_tech = list()
	matter = list()
	price_tag = 0
	var/mob/living/carbon/holder // The one that prevent the blade from fading

/obj/item/shield/riot/crusader/psionic/New(var/loc, var/mob/living/carbon/Maker)
	..()
	holder = Maker
	set_light(1.5, 1.5, COLOR_LIGHTING_PURPLE_BRIGHT)
	START_PROCESSING(SSobj, src)

/obj/item/shield/riot/crusader/psionic/Process()
	if(loc != holder) // We're no longer in the psionic's hand.
		visible_message("The [src.name] fades into nothingness.")
		qdel(src)
		return


// Oddity to Weapons list
/obj/item/tool/sword/cult
	name = "Non-Euclidean Blade"
	desc = "A blade forged from the mind of a psion using an oddity. An odd but deadly sword, yet holding it makes you feel... strange."
	icon = 'icons/obj/psionic/occsword.dmi'
	icon_state = "non-euclidian_blade"

	origin_tech = list()
	matter = list()
	sharp = FALSE
	edge = FALSE
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT | SLOT_BACK
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_DANGEROUS
	tool_qualities = list(QUALITY_PULSING = 7, QUALITY_SCREW_DRIVING = 3)

/obj/item/tool/hammer/homewrecker/cult
	name = "Soulcrusher"
	desc = "An extremely heavy sledgehammer that looks like twisted forged iron still glowing with the remnants of the psionic power that shaped it. The head of it burns with a subtle heat, the core \
	filled with the fires of ambition to create and destroy."
	icon = 'icons/obj/psionic/occhammer.dmi'
	icon_state = "soulcrusher"
	wielded_icon = "soulcrusher_wielded"
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	force_unwielded = WEAPON_FORCE_ROBUST
	force_wielded = WEAPON_FORCE_ROBUST
	slot_flags = SLOT_BELT|SLOT_BACK
	tool_qualities = list(QUALITY_SHOVELING = 1, QUALITY_DIGGING = 1, QUALITY_HAMMERING = 50, QUALITY_WELDING = 21)
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
	price_tag = 0
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
	damage_multiplier = 0.9
	penetration_multiplier = 0.9
	price_tag = 0

/obj/item/gun/energy/plasma/cassad/cult
	name = "\"Black Sun\" psi-plasma rifle"
	desc = "A plasma weapon formed from the mind of a psion who shaped an oddity into a weapon. A psychic copy of the cassad, a widely known weapon for being one of the few examples of plasma tech \
	outside the Soteria or Church. Perhaps its popularity is what imprinted it in the memory of the psion that made it?"
	icon = 'icons/obj/psionic/occcassad.dmi'
	icon_state = "manumission"
	origin_tech = list()
	matter = list()
	price_tag = 0
	fire_sound = 'sound/weapons/pulse.ogg'
	damage_multiplier = 0.9
	penetration_multiplier = 0.9
	init_firemodes = list(
		list(mode_name="rapid fire", projectile_type=/obj/item/projectile/plasma/light, fire_sound='sound/weapons/Taser.ogg', fire_delay=8, icon="stun", projectile_color = "#8d25cc"),
		list(mode_name="armor penetrating", projectile_type=/obj/item/projectile/plasma, fire_sound='sound/weapons/Laser.ogg', fire_delay=12, icon="kill", projectile_color = "#461266"),
	)

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
	origin_tech = list()
	tool_qualities = list(QUALITY_SHOVELING = 53, QUALITY_DIGGING = 42, QUALITY_EXCAVATION = 34, QUALITY_HAMMERING = 6)

/obj/item/tool/screwdriver/combi_driver/cult
	name = "rotary spanner"
	desc = "A tool crafted from the thoughts of a psion after shaping an oddity. A mind is an adapative thing, so why wouldn't it make an adaptive tool?"
	icon_state = "psi_driver"
	matter = list()
	origin_tech = list()
	tool_qualities = list(QUALITY_SCREW_DRIVING = 42, QUALITY_BOLT_TURNING = 42, QUALITY_DRILLING = 36, QUALITY_RETRACTING = 22)

/obj/item/tool/weldingtool/advanced/cult
	name = "thought scorcher"
	desc = "A tool crafted from the thoughts of a psion after shaping an oddity. What is our ire, if not the embers of our thoughts left to burn?"
	icon_state = "psi_welder"
	item_state = "psi_welder"
	glow_color = COLOR_PURPLE
	switched_on_qualities = list(QUALITY_WELDING = 42, QUALITY_CAUTERIZING = 24, QUALITY_WIRE_CUTTING = 12, QUALITY_PULSING = 7, QUALITY_SCREW_DRIVING = 3)
	max_fuel = 29
	matter = list()
	origin_tech = list()

// Psionic Inhaler, give a certain amount of psi-points a certain amount of time.
/obj/item/psi_injector
	name = "cerebrix inhaler"
	desc = "A modified inhaler which delivers over-saturated cerebrix diluted in water before being aerosolized. Unlike a direct injection or drinking, this method prevents overdosing or nasty side \
	side effects at the cost of spending more cerebrix for what it returns."
	icon = 'icons/obj/syringe.dmi'
	icon_state = "psi_inhaler"
	force = WEAPON_FORCE_HARMLESS
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1)
	var/use = 1 // Number of times it can be used.
	var/point_per_use = 1 // Amount of points it give to a psion each use.

/obj/item/psi_injector/examine(mob/user)
	..()
	to_chat(user, "It has [use] uses left.")
	to_chat(user, "It can give [point_per_use] essence per use to a psion.")

/obj/item/psi_injector/attack(atom/target, mob/user)
	if(ishuman(target)) // Check if it's an actual mob and not a wall
		var/mob/living/carbon/human/T = target
		var/obj/item/organ/internal/psionic_tumor/PT = T.random_organ_by_process(BP_PSION)
		if(PT) // Is the target a psion
			if(PT.max_psi_points - PT.psi_points >= point_per_use) // Is there space to give the psion the points?
				if(use) // Do we have uses left?
					user.visible_message("You inject [point_per_use] dose into [T.name]'s body.",
										"[user.name] injects [point_per_use] dose into [T.name]'s body.")
					PT.psi_points += point_per_use
					use--
					return
				else
					to_chat(user, "The [src.name] has no doses left.")
					return
			else
				to_chat(user, "[T.name] already has the maximum amount of essence \his body can hold.")
				return
		else
			to_chat(user, "You can't inject this into a non-psion.")
			return
	..()
