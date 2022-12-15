//////////////////////////////
//			Psionic Melee Weapons
//////////////////////////////
/obj/item/tool/sword/cult
	name = "non-euclidean blade"
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


/obj/item/tool/sword/cult/deepmaints
	name = "deepblue blade"
	desc = "What looks like a psionically materialized blade, but is much more than that. From every angle, its dark glaze reflects back light as if the whole thing would represent the very concept of sharpness itself. For some reason, small pulsing sparks of lightning fly out if its tip at certain intervals."
	sharp = TRUE
	edge = TRUE
	force = WEAPON_FORCE_ROBUST
	throwforce = WEAPON_FORCE_ROBUST
	damtype = BURN
	tool_qualities = list(QUALITY_PULSING = 10, QUALITY_SCREW_DRIVING = 5)

/obj/item/tool/hammer/homewrecker/cult
	name = "soulcrusher"
	desc = "An extremely heavy sledgehammer that looks like twisted forged iron still glowing with the remnants of the psionic power that shaped it. The head of it burns with a subtle heat, the core \
	filled with the fires of ambition to create and destroy."
	icon = 'icons/obj/psionic/occhammer.dmi'
	icon_state = "soulcrusher"
	item_state = "soulcrusher0"
	wielded_icon = "soulcrusher1"
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	force_unwielded = WEAPON_FORCE_ROBUST
	slot_flags = SLOT_BELT|SLOT_BACK
	tool_qualities = list(QUALITY_SHOVELING = 1, QUALITY_DIGGING = 1, QUALITY_HAMMERING = 50, QUALITY_WELDING = 21)
	origin_tech = list()
	matter = list()

/obj/item/tool/hammer/homewrecker/cult/deepmaints
	name = "mindcrusher"
	desc = "What looks at first glance like a sledgehammer, until the feeling of its light weight in your hands reveals that its more of a branding iron with a heavy hammerhead end, its perpetually scalding hot tip an excellent bludgeoning weapon that could also meld even metal if pressed long enough against it."
	damtype = BURN
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	force_unwielded = WEAPON_FORCE_BRUTAL
	slot_flags = SLOT_BELT|SLOT_BACK
	tool_qualities = list(QUALITY_SHOVELING = 5, QUALITY_DIGGING = 5, QUALITY_HAMMERING = 60, QUALITY_WELDING = 25, QUALITY_CAUTERIZING = 15)

/obj/item/tool/saw/chain/cult
	name = "chainripper"
	desc = "A chainsaw forged from the mind of a psion, the blades glowing with the energy and heat of its psychic power. Though a saw, it cuts cleanly and leaves charring in its wake."
	icon = 'icons/obj/psionic/occchain.dmi'
	icon_state = "chainripper"
	force = WEAPON_FORCE_DANGEROUS
	origin_tech = list()
	matter = list()
	tool_qualities = list(QUALITY_LASER_CUTTING = 42, QUALITY_SAWING = 23, QUALITY_CLAMPING = 6, QUALITY_CAUTERIZING = 8, QUALITY_RETRACTING = 22, QUALITY_BONE_SETTING = 19) //It's a surgical chainsaw
	max_fuel = 123

/obj/item/tool/saw/chain/cult/deepmaints
	name = "mindripper"
	desc = "What looks to be a chainsaw for someone that only has seen the horror movies version of them. This one's teeth rather than being hard, glow with eerie psionic power, cauterizing even the cuts it causes through sheer burns."
	icon = 'icons/obj/psionic/occchain.dmi'
	icon_state = "chainripper"
	force = WEAPON_FORCE_BRUTAL
	damtype = BURN
	tool_qualities = list(QUALITY_LASER_CUTTING = 50, QUALITY_SAWING = 45, QUALITY_CLAMPING = 10, QUALITY_CAUTERIZING = 10, QUALITY_RETRACTING = 25, QUALITY_BONE_SETTING = 20) //It's a surgical chainsaw
	max_fuel = 246

/obj/item/tool/sword/machete/cult
	name = "scorch sword"
	desc = "A blade quite common in the jungle crafted from the mind of a psion using an oddity. When you hold it, the blade's edge glows with heat."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "psi_machete"
	item_state = "psi_machete"
	origin_tech = list()
	matter = list()
	tool_qualities = list(QUALITY_LASER_CUTTING = 21, QUALITY_CUTTING = 10,  QUALITY_SAWING = 20, QUALITY_CAUTERIZING = 12) //So we can cut down trees

/obj/item/tool/sword/machete/cult/deepmaints
	name = "scorching machete"
	desc = "A long machete made of pitch black psionic energy, just looking at how it bends the light around it you can grasp an idea of how hot the blade actually is."
	damtype = BURN
	force = WEAPON_FORCE_BRUTAL
	tool_qualities = list(QUALITY_LASER_CUTTING = 25, QUALITY_CUTTING = 15,  QUALITY_SAWING = 25, QUALITY_CAUTERIZING = 15) //So we can cut down trees

/obj/item/tool/sword/cleaver/cult
	name = "moon cleaver"
	desc = "A black bladed mockery of the lodge's tools for hunting tengolos and their twisted evolution. This weapon, forged from a psion, hunts what few consider anything but archetypes \
	of primal fears. Fit for the culling of spiders."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "psi_cleaver"
	item_state = "psi_cleaver"
	tool_qualities = list(QUALITY_SAWING = 3, QUALITY_CLAMPING = 6, QUALITY_CAUTERIZING = 8, QUALITY_RETRACTING = 2, QUALITY_BONE_SETTING = 12)
	effective_faction = list("spider") // Which faction the cleaver is effective against.
	origin_tech = list()
	matter = list()

/obj/item/tool/sword/cleaver/cult/deepmaints
	name = "solar eclipse" //Easiest name ever
	desc = "A bizarre cleaving weapon found only within the deep maintenance tunnels, this curved blade is ironically efficient against the monsters that inhabit it, dealing much more harm to its psionic monstruosities than the average xenofauna.\
	Looking at the blades edge its safe to say its dull to skin, but burns the mind..."
	tool_qualities = list(QUALITY_SAWING = 5, QUALITY_CLAMPING = 10, QUALITY_CAUTERIZING = 20, QUALITY_RETRACTING = 10, QUALITY_BONE_SETTING = 15)
	effective_faction = list("psi_monster") // Which faction the cleaver is effective against.
	damtype = BURN

/obj/item/tool/power_fist/cult
	name = "mind rocker"
	desc = "A hydraulic combat gauntlet forged from the mind of a psion. When all else fails, you still have your fists."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "psi_powerfist"
	item_state = "psi_powerfist"
	suitable_cell = /obj/item/cell/medium/psion
	origin_tech = list()
	matter = list()
	switched_on_qualities = list(QUALITY_HAMMERING = 13, QUALITY_SHOVELING = 13, QUALITY_DIGGING = 13)
	switched_off_qualities = list(QUALITY_HAMMERING = 3, QUALITY_SHOVELING = 3, QUALITY_DIGGING = 3)

/obj/item/tool/power_fist/cult/deepmaints
	name = "mind repeater"
	desc = "Mysteriously fitting any hand perfectly despite being always the same size, this gauntlet makes you able to attack twice as fast with its burning psionic dark pistons."
	damtype = BURN
	switched_on_qualities = list(QUALITY_HAMMERING = 15, QUALITY_SHOVELING = 15, QUALITY_DIGGING = 15)
	switched_off_qualities = list(QUALITY_HAMMERING = 5, QUALITY_SHOVELING = 5, QUALITY_DIGGING = 5)

/obj/item/tool/power_fist/cult/deepmaints/attack()
	..()
	usr.setClickCooldown(DEFAULT_QUICK_COOLDOWN)

/obj/item/tool/spear/hunter_halberd/deepmaints
	name = "wild intuition"
	desc = "A two-handed halberd decorated with bronze and the idea of pursuit. Drive them all the way to the woods, into your trap. The spirit of the hunt is calling."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "psi_halberd"
	item_state = "psi_halberd"
	wielded_icon = "psi_halberd_wielded"
	origin_tech = list()
	matter = list()
	flags = CONDUCT
	sharp = TRUE
	edge = TRUE
	embed_mult = 80
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	tool_qualities = list(QUALITY_SAWING = 5, QUALITY_CLAMPING = 10, QUALITY_CAUTERIZING = 20, QUALITY_RETRACTING = 10, QUALITY_BONE_SETTING = 15)
	effective_faction = list("psi_monster") // Which faction the halberd is effective against.
	damtype = BURN
	throwforce = WEAPON_FORCE_LETHAL


/obj/item/tool/hammer/powered_hammer/cult
	name = "unexpected memory"
	desc = "This is a large hammer forged from obsidian under the guidance of the psion's thought about the gravity of what is happening around. A piece of steel at its working part distorts the air, allowing you to look at the world through the eyes of a fading mind."
	icon_state = "psipowered_hammer"
	item_state = "psipowered_hammer"
	wielded_icon = "psipowered_hammer_on"
	damtype = BURN
	switched_on_force = WEAPON_FORCE_BRUTAL
	structure_damage_factor = STRUCTURE_DAMAGE_BREACHING
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BELT|SLOT_BACK
	origin_tech = list()
	matter = list()
	price_tag = 0
	switched_on_qualities = list(QUALITY_HAMMERING = 45)
	switched_off_qualities = list(QUALITY_HAMMERING = 30)
	toggleable = TRUE
	armor_penetration = ARMOR_PEN_EXTREME
	degradation = 3.5
	use_power_cost = 8
	suitable_cell = /obj/item/cell/medium/psion
	max_upgrades = 4
	item_icons = list(
		slot_back_str = 'icons/obj/tools.dmi')
	item_state_slots = list(
		slot_back_str = "psionehammer_back"
		)

/obj/item/tool/hammer/powered_hammer/cult/turn_on(mob/user)

	if (cell && cell.charge > 0)
		item_state = "[initial(item_state)]_on"
		to_chat(user, SPAN_NOTICE("You switch [src] on."))
		playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
		..()
	else
		item_state = initial(item_state)
		to_chat(user, SPAN_WARNING("[src] has no power!"))

/obj/item/tool/hammer/powered_hammer/cult/turn_off(mob/user)
	item_state = initial(item_state)
	playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
	to_chat(user, SPAN_NOTICE("You switch [src] off."))
	..()

/obj/item/tool/hammer/powered_hammer/cult/deepmaints
	name = "the destroyer of reason"
	desc = "How pleasantly her bones crunched. Time after time, you remember thoughts that are not your own, touching the handle of this beautiful instrument. Their skulls were being torn apart, and their minds were being released from their shells, splashing on the walls. Primordial rage seizes you, from just looking at this titanic hammer."
	icon_state = "psipowered_hammer"
	item_state = "psipowered_hammer"
	wielded_icon = "psipowered_hammer_on"
	structure_damage_factor = STRUCTURE_DAMAGE_DESTRUCTIVE
	switched_on_force = WEAPON_FORCE_LETHAL
	switched_on_qualities = list(QUALITY_HAMMERING = 60)
	switched_off_qualities = list(QUALITY_HAMMERING = 35)
	workspeed = 1.5
	max_upgrades = 2
	use_power_cost = 4

/obj/item/melee/telebaton/cult/deepmaints
	name = "hidden thoughts"
	desc = "You could use it for personal protection, but you could never stop, you pursue her day after day, do not give her the opportunity to exhale without your presence. Ah, how beautiful her blood was. The tip of this object pulsates with heat. Touching the handle of this baton, a real sadist wakes up in you."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "psytelebaton_0"
	item_state = "psytelebaton_0"
	slot_flags = SLOT_BELT
	w_class = ITEM_SIZE_SMALL
	force = 3
	structure_damage_factor = STRUCTURE_DAMAGE_BLUNT
	origin_tech = list()
	matter = list()

/obj/item/melee/telebaton/cult/deepmaints/attack_self(mob/user as mob)
	on = !on
	if(on)
		user.visible_message(
			SPAN_WARNING("\The [user] reveals his thoughts!"),
			SPAN_WARNING("You He reveals his thoughts!"),
			"You hear an ominous click."
		)
		icon_state = "psytelebaton_1"
		item_state = "psytelebaton_1"
		update_wear_icon()
		w_class = ITEM_SIZE_NORMAL
		force = WEAPON_FORCE_PAINFUL//quite robust
			damtype = BURN
		attack_verb = list("smacked", "struck", "slapped")
	else
		user.visible_message(
			SPAN_NOTICE("\The [user] collapses their thoughts. For now..."),
			SPAN_NOTICE("You desire, and your thoughts are destroyed, plunging you into an empty madness."),
			"You hear a click."
		)
		icon_state = "psytelebaton_0"
		item_state = "psytelebaton_0"
		update_wear_icon()
		w_class = ITEM_SIZE_SMALL
		force = 3//not so robust now
		attack_verb = list("hit", "punched")

	playsound(src.loc, 'sound/weapons/energy/pulse.ogg', 50, 1)
	add_fingerprint(user)

	if(blood_overlay && blood_DNA && (blood_DNA.len >= 0)) //updates blood overlay, if any
		cut_overlays()//this might delete other item over-lays as well but eeeeeeeh

		var/icon/I = new /icon(src.icon, src.icon_state)
		I.Blend(new /icon('icons/effects/blood.dmi', rgb(255,255,255)),ICON_ADD)
		I.Blend(new /icon('icons/effects/blood.dmi', "itemblood"),ICON_MULTIPLY)
		blood_overlay = I

		add_overlay(blood_overlay)

	return

/obj/item/melee/telebaton/cult/deepmaints/attack(mob/target as mob, mob/living/user as mob)
	if(on)
		if(user.a_intent == I_HELP)
			damtype = HALLOSS
			force = WEAPON_FORCE_PAINFUL
			armor_penetration = ARMOR_PEN_MODERATE

		if(user.a_intent == I_DISARM)
			damtype = HALLOSS
			force = 18 //3 more then help but not as good as a wooden classic
			armor_penetration = ARMOR_PEN_SHALLOW

		if(user.a_intent == I_HURT)
			damtype = BURN
			force = WEAPON_FORCE_DANGEROUS

		if ((CLUMSY in user.mutations) && prob(10))
			to_chat(user, SPAN_WARNING("You club yourself over the head."))
			user.Weaken(0.1 * force)
			if(ishuman(user))
				var/mob/living/carbon/human/H = user
				H.damage_through_armor(2 * force, BRUTE, BP_HEAD, ARMOR_MELEE)
			else
				user.take_organ_damage(2*force)
			return
		if(..())
			playsound(src.loc, 'sound/effects/woodhit.ogg', 50, 1, -1)
			return
	else
		return ..()

/obj/item/melee/energy/sword/sabre/dagger/cult/deepmaints
	name = "psagger"
	desc = "an amazingly shaped blade made of hard light that does not obey the surrounding reality. His disregard for the postulates of this world can only be compared with its terrible instability."
	icon_state = "psidagger0"
	blade_color = null
	damtype = BURN
	armor_penetration = ARMOR_PEN_EXTREME
	active_force =  WEAPON_FORCE_DANGEROUS
	active_throwforce =  WEAPON_FORCE_DANGEROUS
	origin_tech = list()
	matter = list()

/obj/item/melee/energy/sword/sabre/dagger/cult/deepmaints/activate(mob/living/user)
	if(!active)
		to_chat(user, SPAN_NOTICE("\The [src] is now energized."))
	..()
	icon_state = "psidagger"
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "strikes", "cut")
	tool_qualities = list(QUALITY_CUTTING = 25,  QUALITY_WIRE_CUTTING = 15, QUALITY_LASER_CUTTING = 1, QUALITY_WELDING = 10, QUALITY_CAUTERIZING = 10)

/obj/item/tool/fireaxe/militia_tomahawk/cult/deepmaints
	name = "black ideals"
	desc = "This is the faithful tomahawk of the guard, distorted by the dead mind of the commander of the black shield. Just once it was enough for him to take this tool in his hands to deprive all his subordinates of sleep. Blood flowed like a river."
	icon_state = "psi_tomahawk"
	wielded_icon = "psi_tomahawk2"
	effective_faction = list("roach")
	damtype = BURN
	force = WEAPON_FORCE_BRUTAL
	throwforce = WEAPON_FORCE_BRUTAL
	slot_flags = SLOT_BELT|SLOT_BACK
	tool_qualities = list(QUALITY_CUTTING = 30, QUALITY_SAWING = 25, QUALITY_PRYING = 15, QUALITY_CLAMPING = 10, QUALITY_CAUTERIZING = 20, QUALITY_RETRACTING = 10, QUALITY_BONE_SETTING = 15)
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list()
	matter = list()
	price_tag = 0

/obj/item/shield/hardsuit/cult/deepmaints
	name = "deep principles"
	desc = "The world around you is extremely unstable. This is the only thing that makes any sense in the empty and dark endless tunnels. His eye sees the truth, even though the shell is cracked, but the direct path to deliverance has already been paved."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "psishield"
	item_state = "psishield"
	flags = CONDUCT
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	throw_speed = 1
	throw_range = 1
	w_class = ITEM_SIZE_HUGE
	origin_tech = list()
	matter = list()
	price_tag = 0
	base_block_chance = 70
	attack_verb = list("smashed", "bashed")
	armor_list = list(melee = 10, bullet = 10, energy = 10, bomb = 10, bio = 0, rad = 0)
	max_durability = 250 //So we can brake and need healing time to time
	durability = 150
	picked_by_human = TRUE
	cleanup = FALSE
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "psishield"
		)

//////////////////////////////
//			Psionic Firearms
//////////////////////////////
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
	serial_shown = FALSE

/obj/item/gun/energy/laser/cult/deepmaints
	name = "\"Moonset\" psi-laser rifle"
	desc = "A perfected copy of the Lightfall laser rifle at first glance, this empty husk of a weapon is willed into reality to fire condensed projectiles of sheer willpower from the psyche of its mindsmith, rather than relying on any internal components to do it for them."
	damage_multiplier = 1
	penetration_multiplier = 1
	projectile_color = "#BF40BF"

/obj/item/gun/energy/plasma/cassad/cult
	name = "\"Unseen Sun\" psi-plasma rifle"
	desc = "A plasma weapon formed from the mind of a psion who shaped an oddity into a weapon. A psychic copy of the cassad, a widely known weapon for being one of the few examples of plasma tech \
	outside the Soteria or Church. Perhaps its popularity is what imprinted it in the memory of the psion that made it?"
	icon = 'icons/obj/psionic/occcassad.dmi'
	icon_state = "manumission"
	origin_tech = list()
	matter = list()
	price_tag = 0
	charge_cost = 50
	fire_sound = 'sound/weapons/energy/pulse.ogg'
	damage_multiplier = 0.9
	penetration_multiplier = 0.9
	init_firemodes = list(
		list(mode_name="rapid fire", projectile_type=/obj/item/projectile/plasma/light, fire_sound='sound/weapons/energy/Taser.ogg', fire_delay=8, icon="stun", projectile_color = "#8d25cc"),
		list(mode_name="armor penetrating", projectile_type=/obj/item/projectile/plasma, fire_sound='sound/weapons/energy/Laser.ogg', fire_delay=12, icon="kill", projectile_color = "#461266"),
	)
	serial_shown = FALSE

/obj/item/gun/energy/plasma/cassad/cult/deepmaints
	name = "\"Blue Moon\" psi-plasma rifle"
	desc = "A Cassad-sytle plasma rifle ready to take on any battle, this one crafted out of base violent thought alone has more unique ways of holding a cell's charge known only to the person that had thought of it."
	charge_cost = 25
	damage_multiplier = 1
	penetration_multiplier = 1

/obj/item/gun/energy/gun/martin/cult
    name = "\"Star\" psi-laser pistol"
    desc = "A laser weapon formed from the mind of a psion who shaped an oddity into a weapon. A psionic copy of a martin, an oft overlooked and ignored weapon. Perhaps this is formed from the \
    small thoughts that make all the difference?"
    icon = 'icons/obj/guns/energy/psi_pdw.dmi'
    origin_tech = list()
    matter = list()
    price_tag = 0
    serial_shown = FALSE

/obj/item/gun/energy/gun/martin/cult/deepmaints
    name = "\"Blue Star\" psi-laser pistol"
    desc = "A Martin made of the mind of someone wishing to have a real firearm, whether this was out of desperation or frustration is unknown, but it does seem to have failed its creator..."
    icon = 'icons/obj/guns/energy/psi_pdw.dmi'
    charge_cost = 25
    damage_multiplier = 1.1
    penetration_multiplier = 1.1

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
	serial_shown = FALSE

/obj/item/gun/energy/plasma/auretian/cult/deepmaints
	name = "\"Tektite\" psi-energy pistol"
	desc = "An energy-styled handgun willed into reality from the mind of someone looking to improve just about everything about it. Whether they meant to or not, they made a perfected copy of the SI Auretian."
	icon = 'icons/obj/guns/energy/psi_brigador.dmi'
	icon_state = "brigador"
	origin_tech = list()
	matter = list()
	price_tag = 0
	damage_multiplier = 1
	penetration_multiplier = 1
	serial_shown = FALSE

/obj/item/gun/projectile/automatic/greasegun/cult
	name = "\"Super Nova\" psi-submachine gun"
	desc = "A ballistic weapon forged from the mind of a psion who shaped an oddity into a weapon. One wonders how and why this weapon came to be. Perhaps that is the point?"
	icon = 'icons/obj/guns/projectile/greasegun_psi.dmi'
	origin_tech = list()
	matter = list()
	price_tag = 0
	damage_multiplier = 0.9
	penetration_multiplier = 1
	serial_shown = FALSE

/obj/item/gun/projectile/automatic/greasegun/cult/deepmaints
	name = "\"Star Pepper\" psi-submachine gun"
	desc = "A grease-gun mind-copy willed into reality with the concept of spraying and praying to hope kill whatever threat happens to be around you. In a sense, a reloadable Slaught-o-Matic conjured out of one's mind."
	icon = 'icons/obj/guns/projectile/greasegun_psi.dmi'
	damage_multiplier = 1
	penetration_multiplier = 1.2

/obj/item/gun/energy/cog/cult/deepmaints
	name = "\"Shaky ideals\" psi-energy rifle"
	icon = 'icons/obj/guns/energy/psicog.dmi'
	icon_state = "psicog"
	item_state = "psicog"
	item_charge_meter = TRUE
	desc = "A massive idea put into service in this careless world.  The nightmare of sleep reeks like a ray of light in the impenetrable darkness."
	fire_sound = 'sound/weapons/wave.ogg'
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_BULKY
	origin_tech = list()
	matter = list()
	projectile_color = "#53377A"
	projectile_type = /obj/item/projectile/beam/midlaser
	fire_delay = 12
	charge_cost = 60
	price_tag = 0
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	init_firemodes = list(
		WEAPON_NORMAL
	)
	twohanded = TRUE
	max_upgrades = 4
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "psicog"
		)

/obj/item/gun/projectile/automatic/sts/rifle/cult/deepmaints
	name = "\"Eclipse\" psi-rifle"
	desc = "A ballistic weapon forged from the mind of a psion who shaped an oddity into a weapon. One wonders how and why this weapon came to be. Perhaps that is the point?"
	icon = 'icons/obj/psionic/occgun.dmi'
	icon_state = "eclipse"
	item_state = "eclipse"
	origin_tech = list()
	matter = list()
	price_tag = 0
	damage_multiplier = 0.8
	penetration_multiplier = 0.9
	origin_tech = list()
	matter = list()
	price_tag = 0
	max_upgrades = 3
	damage_multiplier = 1.1 //the uncheap
	saw_off = FALSE

//////////////////////////////
//			Psionic Tools
//////////////////////////////

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
	suitable_cell = /obj/item/cell/medium/psion

/obj/item/tool/multitool/advanced/cult/deepmaints
	name = "multi-mind"
	desc = "A multitool made up by someone that wanted to link their mind to whatever they were debugging. It works shockingly well even if it can't connect you to the cyberspace."
	icon_state = "psitool"
	tool_qualities = list(QUALITY_PULSING = 45, QUALITY_CAUTERIZING = 30, QUALITY_RETRACTING = 20)
	matter = list()
	origin_tech = list()
	price_tag = 0
	use_power_cost = 0.25
	workspeed = 1.3
	max_upgrades = 4
	suitable_cell = /obj/item/cell/medium/psion

/obj/item/tool/shovel/power/cult
	name = "pit delver"
	desc = "A tool made from the mind of a psion using an oddity. Do you not fear what lies beneath? Or is what you think you'll gain worth it?"
	icon_state = "psipowershovel"
	item_state = "shovel"
	matter = list()
	origin_tech = list()
	price_tag = 0
	tool_qualities = list(QUALITY_SHOVELING = 53, QUALITY_DIGGING = 42, QUALITY_EXCAVATION = 34, QUALITY_HAMMERING = 6)
	suitable_cell = /obj/item/cell/medium/psion

/obj/item/tool/shovel/power/cult/deepmaints
	name = "hollow labour"
	desc = "A tool made from lackadaisical thoughts while doing manual laboring tasks, such as digging and plowing earth."
	tool_qualities = list(QUALITY_SHOVELING = 60, QUALITY_DIGGING = 50, QUALITY_EXCAVATION = 70, QUALITY_HAMMERING = 10)

/obj/item/tool/screwdriver/combi_driver/cult
	name = "rotary spanner"
	desc = "A tool crafted from the thoughts of a psion after shaping an oddity. A mind is an adapative thing, so why wouldn't it make an adaptive tool?"
	icon_state = "psi_driver"
	matter = list()
	origin_tech = list()
	price_tag = 0
	tool_qualities = list(QUALITY_SCREW_DRIVING = 42, QUALITY_BOLT_TURNING = 42, QUALITY_DRILLING = 36, QUALITY_RETRACTING = 22)
	suitable_cell = /obj/item/cell/small/psion

/obj/item/tool/screwdriver/combi_driver/cult/deepmaints
	name = "mind-driver"
	desc = "A screwdriver and wrench combo willed into reality from the thoughts of an engineering mind wishing for a tool that could make them able to turn even the most rusted and stripped screw or loosen the tightest, rustiest bolt."
	icon_state = "psi_driver"
	tool_qualities = list(QUALITY_SCREW_DRIVING = 70, QUALITY_BOLT_TURNING = 70, QUALITY_DRILLING = 60, QUALITY_RETRACTING = 25)

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

/obj/item/tool/weldingtool/advanced/cult/deepmaints
	name = "mind candle"
	desc = "A welder that has expanded tanks for deep thinking, and fuel. Its stable light and flickering flame makes it easy to forget just how hot this thing is. As the flames are stricken out of pure thought alone while welding, they're safer for your eyes as they're instead perceived through the mind."
	switched_on_qualities = list(QUALITY_WELDING = 45, QUALITY_CAUTERIZING = 25, QUALITY_WIRE_CUTTING = 15, QUALITY_PULSING = 10, QUALITY_SCREW_DRIVING = 5)
	max_fuel = 80
	sparks_on_use = FALSE
	eye_hazard = FALSE

/obj/item/tool/shovel/combat/cult
	name = "cognitive pry-cutter"
	desc = "A tool forged from the mind of a psion using an oddity. We use tools. We cut. We dig. We pry. What is it we hope to find?"
	icon_state = "crovel"
	matter = list()
	origin_tech = list()
	price_tag = 0
	tool_qualities = list(QUALITY_SHOVELING = 37, QUALITY_DIGGING = 40, QUALITY_PRYING = 37, QUALITY_HAMMERING = 13, QUALITY_CUTTING = 7, QUALITY_SAWING = 3)
	workspeed = 1.15

/obj/item/tool/shovel/combat/cult/deepmaints
	name = "mental digger"
	desc = "A shovel, a crowbar and a saw... all these concepts melding in a single object willed into reality. Ready to cut into anyone's mind either through physical or psionic force."
	icon_state = "crovel"
	tool_qualities = list(QUALITY_SHOVELING = 40, QUALITY_DIGGING = 50, QUALITY_PRYING = 40, QUALITY_HAMMERING = 15, QUALITY_CUTTING = 15, QUALITY_SAWING = 15)
	workspeed = 1.35

/obj/item/tool/wrench/big_wrench/cult
	name = "twist cutter"
	desc = "A tool crafted from the mind of a psion using an oddity. Cut things loose, bolt them together, will it make a difference?"
	icon_state = "psi_wrench"
	tool_qualities = list(QUALITY_BOLT_TURNING = 42, QUALITY_HAMMERING = 37, QUALITY_WIRE_CUTTING = 34)
	matter = list()
	origin_tech = list()
	price_tag = 0

/obj/item/tool/wrench/big_wrench/cult/deepmaints
	name = "thought spanner"
	desc = "A large wrench with sharp teeth for cutting wires and bolting large plates together. Its hammering weight is reminiscent of the mental pressure exercised upon someone trying to get a project done in time."
	tool_qualities = list(QUALITY_BOLT_TURNING = 60, QUALITY_HAMMERING = 60, QUALITY_WIRE_CUTTING = 20)
