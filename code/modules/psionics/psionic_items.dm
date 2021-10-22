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
		STOP_PROCESSING(SSobj, src)
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
	origin_tech = list()
	matter = list()
	price_tag = 0
	max_durability = 100 //Can be made on mass and is meant to to be a light weak shield
	durability = 100
	slowdown_time = 0 //Were crappy and mass made by the mind
	armor = list(melee = 10, bullet = 10, energy = 5, bomb = 10, bio = 0, rad = 0)
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

// Oddity to melee weapons
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
	tool_qualities = list(QUALITY_LASER_CUTTING = 42, QUALITY_SAWING = 23, QUALITY_CLAMPING = 6, QUALITY_CAUTERIZING = 8, QUALITY_RETRACTING = 22, QUALITY_BONE_SETTING = 19) //It's a surgical chainsaw
	max_fuel = 123

/obj/item/tool/sword/machete/cult
	name = "Scorch Sword"
	desc = "A blade quite common in the jungle crafted from the mind of a psion using an oddity. When you hold it, the blade's edge glows with heat."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "psi_machete"
	item_state = "psi_machete"
	origin_tech = list()
	matter = list()
	tool_qualities = list(QUALITY_LASER_CUTTING = 21, QUALITY_CUTTING = 10,  QUALITY_SAWING = 20, QUALITY_CAUTERIZING = 12) //So we can cut down trees

/obj/item/tool/sword/cleaver/cult
	name = "Moon Cleaver"
	desc = "A black bladed mockery of the lodge's tools for hunting tengolos and their twisted evolution. This weapon, forged from a psion, hunts what few consider anything but archetypes \
	of primal fears. Fit for the culling of spiders."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "psi_cleaver"
	item_state = "psi_cleaver"
	tool_qualities = list(QUALITY_SAWING = 3, QUALITY_CLAMPING = 6, QUALITY_CAUTERIZING = 8, QUALITY_RETRACTING = 2, QUALITY_BONE_SETTING = 12)
	effective_faction = list("spider") // Which faction the cleaver is effective against.
	origin_tech = list()
	matter = list()

/obj/item/tool/power_fist/cult
	name = "Mind Rocker"
	desc = "A hydraulic combat gauntlet forged from the mind of a psion. When all else fails, you still have your fists."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "psi_powerfist"
	item_state = "psi_powerfist"
	origin_tech = list()
	matter = list()
	switched_on_qualities = list(QUALITY_HAMMERING = 13, QUALITY_SHOVELING = 13, QUALITY_DIGGING = 13)
	switched_off_qualities = list(QUALITY_HAMMERING = 3, QUALITY_SHOVELING = 3, QUALITY_DIGGING = 3)

// Oddity to guns
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
	charge_cost = 50
	fire_sound = 'sound/weapons/pulse.ogg'
	damage_multiplier = 0.9
	penetration_multiplier = 0.9
	init_firemodes = list(
		list(mode_name="rapid fire", projectile_type=/obj/item/projectile/plasma/light, fire_sound='sound/weapons/Taser.ogg', fire_delay=8, icon="stun", projectile_color = "#8d25cc"),
		list(mode_name="armor penetrating", projectile_type=/obj/item/projectile/plasma, fire_sound='sound/weapons/Laser.ogg', fire_delay=12, icon="kill", projectile_color = "#461266"),
	)

/obj/item/gun/energy/gun/martin/cult
	name = "\"Star\" psi-laser pistol"
	desc = "A laser weapon formed from the mind of a psion who shaped an oddity into a weapon. A psionic copy of a martin, an oft overlooked and ignored weapon. Perhaps this is formed from the \
	small thoughts that make all the difference?"
	icon = 'icons/obj/guns/energy/psi_pdw.dmi'
	origin_tech = list()
	matter = list()
	price_tag = 0

/obj/item/gun/energy/plasma/auretian/cult
	name = "\"Meteoroid\" psi-energy pistol"
	desc = "An energy weapon forged from the mind of a psion who shaped an oddity into a weapon. The iconic auretian is a weapon that the Soteria employs often and frequently among its staff, \
	yet this copy isn't anywhere near what machine lathes can produce. Is it a cheap imitation? A copy of what yearned to be greater? Perhaps it is but flattery."
	icon = 'icons/obj/guns/energy/psi_brigador.dmi'
	icon_state = "brigador"
	origin_tech = list()
	matter = list()
	price_tag = 0
	damage_multiplier = 0.8
	penetration_multiplier = 0.8

/obj/item/gun/projectile/automatic/greasegun/cult
	name = "\"Super Nova\" psi-submachine gun"
	desc = "A ballistic weapon forged from the mind of a psion who shaped an oddity into a weapon. One wonders how and why this weapon came to be. Perhaps that is the point?"
	icon = 'icons/obj/guns/projectile/greasegun_psi.dmi'
	origin_tech = list()
	matter = list()
	price_tag = 0
	damage_multiplier = 0.9
	penetration_multiplier = 1

// Oddity to Tools list
/obj/item/tool/multitool/advanced/cult
	name = "synapse reader"
	desc = "A strange device shaped by a psion for an unknown purpose. Curiosity is the core of humanity, to delve into secrets is the desire of many, even if said secrets are better left forgotten."
	icon_state = "psitool"
	tool_qualities = list(QUALITY_PULSING = 42, QUALITY_CAUTERIZING = 22, QUALITY_RETRACTING = 18)
	matter = list()
	origin_tech = list()
	price_tag = 0
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
	price_tag = 0
	tool_qualities = list(QUALITY_SHOVELING = 53, QUALITY_DIGGING = 42, QUALITY_EXCAVATION = 34, QUALITY_HAMMERING = 6)

/obj/item/tool/screwdriver/combi_driver/cult
	name = "rotary spanner"
	desc = "A tool crafted from the thoughts of a psion after shaping an oddity. A mind is an adapative thing, so why wouldn't it make an adaptive tool?"
	icon_state = "psi_driver"
	matter = list()
	origin_tech = list()
	price_tag = 0
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
	price_tag = 0

/obj/item/tool/shovel/combat/cult
	name = "cognitive pry-cutter"
	desc = "A tool forged from the mind of a psion using an oddity. We use tools. We cut. We dig. We pry. What is it we hope to find?"
	icon_state = "crovel"
	matter = list()
	origin_tech = list()
	price_tag = 0
	tool_qualities = list(QUALITY_SHOVELING = 37, QUALITY_DIGGING = 40, QUALITY_PRYING = 37, QUALITY_HAMMERING = 13, QUALITY_CUTTING = 7, QUALITY_SAWING = 3)
	workspeed = 1.15

/obj/item/tool/wrench/big_wrench/cult
	name = "twist cutter"
	desc = "A tool crafted from the mind of a psion using an oddity. Cut things loose, bolt them together, will it make a difference?"
	icon_state = "psi_wrench"
	tool_qualities = list(QUALITY_BOLT_TURNING = 42, QUALITY_HAMMERING = 37, QUALITY_WIRE_CUTTING = 34)
	matter = list()
	origin_tech = list()
	price_tag = 0

// Psionic Inhaler, give a certain amount of psi-points a certain amount of time.
/obj/item/psi_injector
	name = "cerebrix inhaler"
	desc = "A modified inhaler which delivers over-saturated cerebrix diluted in water before being aerosolized. Unlike a direct injection or drinking, this method prevents overdosing or nasty side \
	side effects at the cost of spending more cerebrix for what it returns in essence."
	icon = 'icons/obj/syringe.dmi'
	icon_state = "psi_inhaler"
	force = WEAPON_FORCE_HARMLESS
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1)
	var/use = 4 // Number of times it can be used.
	var/point_per_use = 1 // Amount of points it give to a psion each use.

/obj/item/psi_injector/update_icon()
	if(use <= 0)
		icon_state = "psi_inhaler_used"


/obj/item/psi_injector/examine(mob/user)
	..()
	to_chat(user, "It has [use] uses left.")
	to_chat(user, "It can give [point_per_use] essence per use to a psion.")

/obj/item/psi_injector/attack(atom/target, mob/user)
	update_icon()
	if(ishuman(target)) // Check if it's an actual mob and not a wall
		var/mob/living/carbon/human/T = target
		var/obj/item/organ/internal/psionic_tumor/PT = T.random_organ_by_process(BP_PSION)
		if(PT) // Is the target a psion
			if(PT.max_psi_points - PT.psi_points >= point_per_use) // Is there space to give the psion the points?
				if(use) // Do we have uses left?
					user.visible_message("[user] injects [target] with [T.name].", "You inject [target] with [T.name]!")
					PT.psi_points += point_per_use
					use--
					update_icon()
					return
				else
					to_chat(user, "The [src.name] has no doses left.")
					update_icon()
					return
			else
				to_chat(user, "[T.name] already has the maximum amount of essence \his body can hold.")
				update_icon()
				return
		else
			to_chat(user, "You can't inject this into a non-psion.")
			return
	..()

// Armor
/obj/item/clothing/suit/space/occultist //In line with the syndicate spacesuit except not able to be taken off. Maybe give it some other bonuses too?
	name = "psion robes"
	icon_state = "armor"
	item_state = "armor"
	icon = 'icons/obj/psionic/occicon.dmi'
	icon_override = 'icons/obj/psionic/occmob.dmi'
	desc = "A black fabric robe inset with hardened bronze plates, shaped from the mind of a psion. Wearing the complete set is said to enhance the cognitive powers of a psion. \
	It is durable, capable of surviving space and protecting one from many of the things that would do one harm. \
	Is it durable because the mind is the last thing to die? Why must it appear so, if it is but a reflection of our thoughts?"
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_OCLOTHING
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL
	matter = list()
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS //It has gloves, hood, and shoes for the rest of them
	slowdown = 0.3 //Slightly faster than the red suit. Maybe do it at 0.2?
	armor = list(
		melee = 35,
		bullet = 35,
		energy = 35,
		bomb = 30,
		bio = 100,
		rad = 50
	) //These are the same stats as the blood red hardsuit.
	siemens_coefficient = 0.4
	can_breach = FALSE //This can't be taken off so we don't want it breaching.
	supporting_limbs = list()
	flags_inv = HIDEJUMPSUIT|HIDETAIL //Removed hide shoes and gloves because we want this so that you can see the shoes and stuff while keeping the spacesuit tags. Yes this is terrible, no there isn't a better way.
	//var/list/supporting_limbs = list(
	var/mob/living/carbon/human/occultist //This is so we know who is wearing it.
	var/pointgranted = 0 //Did we give you your cog?

/obj/item/clothing/suit/space/occultist/dropped()
	..()
	occultist.stats.changeStat(STAT_COG, -5)
	spawn(5)
	qdel(src)

/obj/item/clothing/suit/space/occultist/equipped(var/mob/M)
	.=..()
	occultist = M
	if(!pointgranted)
		occultist.stats.changeStat(STAT_COG, 5)
		pointgranted = 1

/obj/item/clothing/head/space/occulthood
	name = "psion hood"
	icon_state = "hood"
	item_state = "hood"
	icon = 'icons/obj/psionic/occicon.dmi'
	icon_override = 'icons/obj/psionic/occmob.dmi'
	desc = "A black fabric hood inset with hardened bronze plates, shaped from the mind of a psion. It is durable, capable of surviving space and protecting one from many of the things that would do one harm. \
	Strange, it seems to have far more room on the inside than one would think."
	slot_flags = SLOT_HEAD
	matter = list()
	armor = list(
		melee = 35,
		bullet = 35,
		energy = 35,
		bomb = 30,
		bio = 100,
		rad = 50
	)
	siemens_coefficient = 0.4
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT
	brightness_on = 8
	on = 0
	light_applied = 0
	var/mob/living/carbon/human/occultist
	var/pointgranted = 0 //Did we give you your cog?

	action_button_name = "Toggle Witchlight" //reflavor this so I can make it purple to go in line with the guns - Sigma
	light_overlay = "helmet_light_occult" //Sadly this has to go in icons/obj/light_overlays because I can't figure out how to point it to a different one.
										  //Currently it's located in the icons/obj/light_overlays folder, proc is at /obj/item/clothing/head/on_update_icon(mob/user) -Sigma

/obj/item/clothing/head/space/occulthood/dropped()
	..()
	occultist.stats.changeStat(STAT_COG, -5)
	spawn(5)
	qdel(src)

/obj/item/clothing/head/space/occulthood/attack_self(mob/user) //Reflavoring because this is light from a place that does not know it.
	if(brightness_on)
		if(!isturf(user.loc))
			to_chat(user, "Your cannot hear your thoughts while in this [user.loc]")
			return
		on = !on
		to_chat(user, "With a single thought and urging of your psychic power, you [on ? "enkindle" : "extinguish"] the hood's unnatural light.")
		update_occult_flashlight(user)
	else
		return ..(user)

/obj/item/clothing/head/space/occulthood/proc/update_occult_flashlight(mob/user = null)
	if(on && !light_applied)
		set_light(brightness_on, l_color = "#5B0E4F")
		light_applied = 1
	else if(!on && light_applied)
		set_light(0)
		light_applied = 0
	update_icon(user)
	user.update_action_buttons()

/obj/item/clothing/head/space/occulthood/equipped(var/mob/M)
	.=..()
	occultist = M
	if(!pointgranted)
		occultist.stats.changeStat(STAT_COG, 5)
		pointgranted = 1

/obj/item/clothing/gloves/occultgloves //We want them to not be snippable. Maybe make it some kind of rigsuit?
	name = "psion gloves"
	desc = "A black fabric pair of gloves inset with hardened bronze plates, shaped from the mind of a psion. It is durable, capable of surviving space and protecting one from many of the things that \
	would do one harm. It does one well to protect their hands."
	icon = 'icons/obj/psionic//occicon.dmi'
	item_state = "gloves"
	icon_state = "gloves"
	icon_override = 'icons/obj/psionic/occmob.dmi'
	slot_flags = SLOT_GLOVES
	siemens_coefficient = 1 //Insulated!
	matter = list()
	armor = list(
		melee = 35,
		bullet = 35,
		energy = 35,
		bomb = 30,
		bio = 100,
		rad = 50
	)
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT //make these like spacesuit so it can be a real spacesuit
	var/mob/living/carbon/human/occultist
	var/pointgranted = 0 //Did we give you your cog?

/obj/item/clothing/gloves/occultgloves/dropped()
	..()
	occultist.stats.changeStat(STAT_COG, -5)
	spawn(5)
	qdel(src)

/obj/item/clothing/gloves/occultgloves/equipped(var/mob/M)
	.=..()
	occultist = M
	if(!pointgranted)
		occultist.stats.changeStat(STAT_COG, 5)
		pointgranted = 1

/obj/item/clothing/gloves/occultgloves/attackby(obj/item/W, mob/user) //Overwrite the gloves clip proc because we don't want these clipped off at all.
	if(istype(W, /obj/item/tool/wirecutters) || istype(W, /obj/item/tool/scalpel)) //Same check as normal gloves.
		to_chat(user, SPAN_NOTICE("Your tool bends away from the [src] impossibly.")) //These are made of something that shouldn't exist, no snip for you. Using [src] for later modularness.

/obj/item/clothing/shoes/occultgreaves
	name = "psion greaves"
	desc = "A black fabric set of greaves inset with hardened bronze plates, shaped from the mind of a psion. It is durable, capable of surviving space and protecting one from many of the things that would do one harm. \
	Is it durable because the mind is the last thing to die? Why must it appear so, if it is but a reflection of our thoughts?"
	icon = 'icons/obj/psionic/occicon.dmi'
	item_state = "shoes"
	icon_state = "shoes"
	icon_override = 'icons/obj/psionic/occmob.dmi'
	slot_flags = SLOT_FEET
	matter = list()
	armor = list(
		melee = 35,
		bullet = 35,
		energy = 35,
		bomb = 30,
		bio = 100,
		rad = 50
	)
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT|NOSLIP //make these like spacesuit so it can be a real spacesuit
	siemens_coefficient = 1 //Insulated!
	var/mob/living/carbon/human/occultist
	var/pointgranted = 0 //Did we give you your cog?

/obj/item/clothing/shoes/occultgreaves/dropped()
	..()
	occultist.stats.changeStat(STAT_COG, -5)
	spawn(5)
	qdel(src)

/obj/item/clothing/shoes/occultgreaves/equipped(var/mob/M)
	.=..()
	occultist = M
	if(!pointgranted)
		occultist.stats.changeStat(STAT_COG, 5)
		pointgranted = 1

// Special items.
/obj/item/clothing/mask/gas/bonedog
	name = "Mask of the Bone Dog"
	desc = "The ivory bleached skull of some kind of canine. Was this a trophy of a wolf slain in battle or a token of a lost pet taken and remembered by its master? Perhaps it is the skull of a kriosan, \
	the result of a rivalry remembered in blood. Oddly, this non-conductive bone mask is quite durable and protects from radiation, sickness, and harmful gases. Even to the untrained, this item \
	has obvious psionic potential."
	icon_state = "bonedog"
	siemens_coefficient = 1 // Non-conductive
	matter = list(MATERIAL_BONE = 5, MATERIAL_BIOMATTER = 2)
	armor = list(
		melee = 40,
		bullet = 20,
		energy = 5,
		bomb = 5,
		bio = 100,
		rad = 100
	) // Thematic with the lodge bone armor in terms of defense, has bio/rad because theme but without a suit it doesn't do much. Not that great compared to most helmets, you want it for the stats. -Kaz
	price_tag = 0
	var/mask_cooldown_time = 25 MINUTES
	var/last_invoke = -16000

// If you renew it every 25 minutes (in the 5 minute window before it ends), you effectively have +30 cog/+15 vig with some upkeep. Great for a psion and thematic with the kriosan skull. -Kaz
// Thematically, the dead must be remembered periodically, lest they and the things they offer be forgotten.
/obj/item/clothing/mask/gas/bonedog/verb/invoke_spirit(var/mob/living/carbon/human/M)
	set name = "Invoke Mask"
	set desc = "Invoke the psionic potential left in this skull."
	set category = "Object"

	if(!usr.stats.getPerk(PERK_PSION))
		to_chat(usr, "<span class='notice'>You lack the psionic potential to invoke this.</span>")
		return

	if((last_invoke + mask_cooldown_time) >= world.time)
		to_chat(usr, "<span class='notice'>[name] needs more time to regenerate.</span>")
		return

	last_invoke = world.time

	playsound(src.loc, 'sound/hallucinations/ghosty_wind.ogg', 25, 1) // Faintly spooky wind
	to_chat(usr, "You invoke the hidden potential from this long forgotten mask, your mind becomes cunning, your eyes sharp, you hear the wind howling. The effect is temporary, but powerful.")
	M.stats.addTempStat(STAT_COG, 30, 30 MINUTES, "bonedog_mask")
	M.stats.addTempStat(STAT_VIG, 15, 30 MINUTES, "bonedog_mask")