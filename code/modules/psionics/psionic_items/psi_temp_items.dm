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
	w_class = ITEM_SIZE_HUGE
	slot_flags = null
	flags = CONDUCT
	tool_qualities = list(QUALITY_SCREW_DRIVING = 25, QUALITY_BOLT_TURNING = 25, QUALITY_DRILLING = 25, QUALITY_WELDING = 25, QUALITY_CAUTERIZING = 25, QUALITY_PRYING = 25, QUALITY_DIGGING = 25, QUALITY_PULSING = 25, QUALITY_WIRE_CUTTING = 25, QUALITY_HAMMERING = 25, QUALITY_SHOVELING = 25, QUALITY_EXCAVATION = 25, QUALITY_CLAMPING = 25, QUALITY_RETRACTING = 25, QUALITY_SAWING = 25, QUALITY_BONE_SETTING = 25, QUALITY_CUTTING = 25, QUALITY_BONE_GRAFTING = 25)
	no_double_tact = TRUE
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

/obj/item/flame/pyrokinetic_spark
	name = "pyrokinetic flame"
	desc = "A flickering psionic induced flame."
	icon = 'icons/obj/psionic/occpyrospark.dmi'
	icon_state = "pyrospark"
	item_state = "pyrospark"
	var/burntime = 120
	w_class = ITEM_SIZE_HUGE
	slot_flags = null
	tool_qualities = list(QUALITY_WELDING = 0)
	attack_verb = list("burnt", "singed")
	lit = 1
	var/mob/living/carbon/holder

/obj/item/flame/pyrokinetic_spark/Process()
	if(isliving(loc))
		var/mob/living/M = loc
		M.IgniteMob()
	var/turf/location = get_turf(src)
	burntime--
	if(burntime < 1)
		burn_out()
		return
	if(location)
		location.hotspot_expose(700, 5)
		return

/obj/item/flame/pyrokinetic_spark/proc/burn_out()
		visible_message("The [src.name] shudders away from your hand like it was nothing.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return

/obj/item/flame/pyrokinetic_spark/New(var/loc, var/mob/living/carbon/Maker)
	..()
	holder = Maker
	set_light(3)
	START_PROCESSING(SSobj, src)

/obj/item/flame/pyrokinetic_spark/Process()
	..()
	if(loc != holder) // We're no longer in the psionic's hand.
		sleep(4)
		visible_message("The [src.name] flickers away as the fire fades into nothingness")
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
	slot_flags = null
	origin_tech = list()
	matter = list()
	attack_verb = list("attacked", "bashed", "battered", "bludgeoned", "whacked","flattened","pulped")
	tool_qualities = list()
	effective_faction = list("spider") // Spiders are weak to crushing.
	damage_mult = 2
	degradation = 0 // Can't degrade
	workspeed = 1.2
	max_upgrades = 0 // Can't upgrade it
	price_tag = 0
	var/mob/living/carbon/holder // The one that prevent the fist from fading

/obj/item/tool/hammer/telekinetic_fist/New(var/loc, var/mob/living/carbon/Maker)
	..()
	holder = Maker
	START_PROCESSING(SSobj, src)

/obj/item/tool/hammer/telekinetic_fist/attack(atom/movable/target, mob/user)
	var/whack_speed = 0

	switch(user.stats.getStat(STAT_ROB))
		if(1 to 14)
			force = WEAPON_FORCE_NORMAL // As strong as a kitchen knife
			whack_speed = 4
		if(15 to 24)
			force = WEAPON_FORCE_DANGEROUS // As strong as a butcher cleaver
			whack_speed = 6
		if(25 to 34)
			force = WEAPON_FORCE_ROBUST // As strong as a machete
			whack_speed = 6
		if(35 to INFINITY)
			force = WEAPON_FORCE_BRUTAL
			whack_speed = 6
		else
			force = WEAPON_FORCE_HARMLESS
			whack_speed = 2

	if(user.stats.getPerk(PERK_PSI_MANIA))
		force = WEAPON_FORCE_BRUTAL
		whack_speed = 6
		armor_divisor = ARMOR_PEN_HALF

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
	embed_mult = 0 //Shouldn't embed, it's not real.
	workspeed = 1.2
	use_power_cost = 0 // Don't use power
	max_upgrades = 0 // Can't upgrade it
	price_tag = 0
	slot_flags = null
	var/mob/living/carbon/holder // The one that prevent the blade from fading

/obj/item/tool/knife/psionic_blade/New(var/loc, var/mob/living/carbon/Maker)
	..()
	holder = Maker
	START_PROCESSING(SSobj, src)

/obj/item/tool/knife/psionic_blade/attack(atom/target, mob/user)
	switch(user.stats.getStat(STAT_ROB))
		if(1 to 14)
			force = WEAPON_FORCE_NORMAL // As strong as a kitchen knife
		if(15 to 24)
			force = WEAPON_FORCE_DANGEROUS // As strong as a butcher cleaver
		if(25 to 34)
			force = WEAPON_FORCE_ROBUST // As strong as a machete
		if(35 to INFINITY)
			force = WEAPON_FORCE_BRUTAL
		else
			force = WEAPON_FORCE_HARMLESS

	if(user.stats.getPerk(PERK_PSI_MANIA))
		force = WEAPON_FORCE_BRUTAL
		armor_divisor = ARMOR_PEN_HALF

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
	desc = "A shield projected by the mind of a psion, it's speed and skill depend on the toughness of the psionic that created it. Useful for blocking melee attacks. \
	A simple thought can deploy or shrink the shield at will."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "psishield1"
	item_state = "psishield1"
	w_class = ITEM_SIZE_BULKY
	slot_flags = null
	origin_tech = list()
	matter = list()
	price_tag = 0
	max_durability = 80 //Can be made on mass and is meant to to be a light weak shield
	durability = 80
	slowdown_time = 0 //Were crappy and mass made by the mind
	armor_list = list(melee = 3, bullet = 3, energy = 2, bomb = 15, bio = 0, rad = 0)
	base_block_chance = 40
	var/mob/living/carbon/holder // The one that prevent the blade from fading
	//Got to do a little more effort to make this block proj (min cost of 2 points)
	can_block_proj = FALSE

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

/obj/item/shield/riot/crusader/psionic/layered
	name = "layered psychic combat shield"
	desc = "Unlike the idea of a shield this one is made of many thin layers allowing it to block projectiles and attacks easier \
	Due to this process of layering it can not be enhanced or modified without destroying itself."
	max_durability = 120
	durability = 120
	base_block_chance = 50
	armor_list = list(melee = 1, bullet = 5, energy = 2, bomb = 25, bio = 0, rad = 0)
	can_block_proj = TRUE

// Psionic gun.
/obj/item/gun/kinetic_blaster
	name = "psychokinetic orb"
	desc = "A kinetic orb, a roiling ball of force that is a projection of a psion's will. It disappears if dropped and uses a single point of essence per shot to fire a \
	bolt of pure force that harms anything it hits. It's strength scales with the user's cognition."
	icon = 'icons/obj/guns/energy/kinetic_blaster.dmi'
	icon_state = "kinetic"
	item_state = "kinetic"
	origin_tech = list()
	fire_sound = 'sound/weapons/wave.ogg'
	fire_sound_text = "kinetic blast"
	max_upgrades = 0
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	var/projectile_type = /obj/item/projectile/kinetic_blast // What does it shoot
	var/use_amount = 1 // How many psi-points is used per shot
	var/mob/living/carbon/holder // The one that prevent the fist from fading
	var/obj/item/organ/internal/psionic_tumor/PT // The psionic organ of the holder.
	var/changes_projectile = TRUE
	serial_shown = FALSE

/obj/item/gun/kinetic_blaster/New(var/loc, var/mob/living/carbon/maker, var/obj/item/organ/internal/psionic_tumor/tumor)
	..()
	holder = maker
	PT = tumor
	var/force
	var/cog = holder.stats.getStat(STAT_COG)
	if(changes_projectile)
		switch(cog)
			if(1 to 14)
				force = /obj/item/projectile/kinetic_blast/normal // As strong as a kitchen knife
			if(15 to 24)
				force = /obj/item/projectile/kinetic_blast/dangerous // As strong as a butcher cleaver
			if(25 to 34)
				force = /obj/item/projectile/kinetic_blast/robust // As strong as a machete
			if(35 to INFINITY)
				force = /obj/item/projectile/kinetic_blast/brutal
			else
				force = /obj/item/projectile/kinetic_blast

		if(holder.stats.getPerk(PERK_PSI_MANIA))
			force = /obj/item/projectile/kinetic_blast/brutal
			armor_divisor = ARMOR_PEN_HALF

		projectile_type = force

	START_PROCESSING(SSobj, src)

/obj/item/gun/kinetic_blaster/consume_next_projectile()
	if(!ispath(projectile_type)) // Do we actually shoot something?
		return null
	if(!PT.pay_power_cost(use_amount)) // Do we have enough psi-points?
		return null
	return new projectile_type(src)

/obj/item/gun/kinetic_blaster/Process()
	if(loc != holder) // We're no longer in the psionic's hand.
		visible_message("[src] fades into nothingness.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return

/obj/item/gun/kinetic_blaster/cryo
	name = "cryo-kinetic orb"
	desc = "A cryo-kinetic orb, a roiling ball of frost that is a projection of a psion's will. It disappears if dropped and uses four points of essence per shot to fire a \
	bolt of pure ice that stuns whoever it hits. Deals no damage on its own."
	icon_state = "cryo"
	item_state = "cryo"
	projectile_type = /obj/item/projectile/kinetic_blast_cryo
	use_amount = 4
	changes_projectile = FALSE

/obj/item/gun/kinetic_blaster/pyro
	name = "pyro-kinetic orb"
	desc = "A pyro-kinetic orb, a roiling ball of flames that is a projection of a psion's will. It disappears if dropped and uses three points of essence per shot to fire a \
	destructive ball of fire. The impact happens too fast to let anything catch fire, but the sudden expansion of heat causes an explosion like a rocket propelled grenade."
	icon_state = "pryo"
	item_state = "pryo"
	projectile_type = /obj/item/projectile/kinetic_blast_pyro
	use_amount = 3
	changes_projectile = FALSE

/obj/item/gun/kinetic_blaster/electro
	name = "electro-kinetic orb"
	desc = "An electro-kinetic orb, a roiling ball of lightning that is a projection of a psion's will. It disappears if dropped and uses two points of essence per shot to fire a \
	bolt of pure lightning at unmeasurable speed. Scales in power with the user's cognition."
	icon_state = "electro"
	item_state = "electro"
	fire_sound = 'sound/effects/lightningshock.ogg'
	projectile_type = /obj/item/projectile/kinetic_blast_electro
	use_amount = 2

/obj/item/gun/kinetic_blaster/electro/New(var/loc, var/mob/living/carbon/maker, var/obj/item/organ/internal/psionic_tumor/tumor)
	..()
	holder = maker
	PT = tumor
	var/force
	var/cog = holder.stats.getStat(STAT_COG)
	if(changes_projectile)
		switch(cog)
			if(1 to 14)
				force = /obj/item/projectile/kinetic_blast_electro/normal // As strong as a kitchen knife
			if(15 to 24)
				force = /obj/item/projectile/kinetic_blast_electro/dangerous // As strong as a butcher cleaver
			if(25 to 34)
				force = /obj/item/projectile/kinetic_blast_electro/robust // As strong as a machete
			if(35 to INFINITY)
				force = /obj/item/projectile/kinetic_blast_electro/brutal
			else
				force = /obj/item/projectile/kinetic_blast_electro

		if(holder.stats.getPerk(PERK_PSI_MANIA))
			force = /obj/item/projectile/kinetic_blast_electro/brutal
			armor_divisor = ARMOR_PEN_HALF

		projectile_type = force

	START_PROCESSING(SSobj, src)

// Psionic Projectiles
/obj/item/projectile/kinetic_blast
	name = "kinetic blast"
	icon_state = "magicm"
	damage_types = list(BRUTE = WEAPON_FORCE_HARMLESS)

/obj/item/projectile/kinetic_blast/normal
	damage_types = list(BRUTE = WEAPON_FORCE_NORMAL)

/obj/item/projectile/kinetic_blast/dangerous
	damage_types = list(BRUTE = WEAPON_FORCE_DANGEROUS)

/obj/item/projectile/kinetic_blast/robust
	damage_types = list(BRUTE = WEAPON_FORCE_ROBUST)

/obj/item/projectile/kinetic_blast/brutal
	damage_types = list(BRUTE = WEAPON_FORCE_BRUTAL)

/obj/item/projectile/kinetic_blast_cryo
	name = "cryo-kinetic blast"
	icon_state = "ice_1"
	nodamage = TRUE //Determines if the projectile will skip any damage inflictions
	taser_effect = TRUE //If set then the projectile will apply it's agony damage using stun_effect_act() to mobs it hits, and other damage will be ignored

/obj/item/projectile/kinetic_blast_pyro
	name = "pyro-kinetic blast"
	icon_state = "fireball"
	var/list/explosion_values = list(0, 1, 2, 4) // Explosions strengths, same value as a regular missile.

/obj/item/projectile/kinetic_blast_pyro/on_impact(atom/target)
	if (!testing)
		explosion(loc, explosion_values[1], explosion_values[2], explosion_values[3], explosion_values[4])
	return TRUE

/obj/item/projectile/kinetic_blast_electro
	name = "electro-kinetic blast"
	icon_state = "invisible"
	hitscan = TRUE
	damage_types = list(BRUTE = WEAPON_FORCE_HARMLESS * 1.5)
	invisibility = 101	//beam projectiles are invisible as they are rendered by the effect engine

	muzzle_type = /obj/effect/projectile/tesla/muzzle
	tracer_type = /obj/effect/projectile/tesla/tracer
	impact_type = /obj/effect/projectile/tesla/impact

/obj/item/projectile/kinetic_blast_electro/normal
	damage_types = list(BURN = WEAPON_FORCE_NORMAL * 1.5)

/obj/item/projectile/kinetic_blast_electro/dangerous
	damage_types = list(BURN = WEAPON_FORCE_DANGEROUS * 1.5)

/obj/item/projectile/kinetic_blast_electro/robust
	damage_types = list(BURN = WEAPON_FORCE_ROBUST * 1.5)

/obj/item/projectile/kinetic_blast_electro/brutal
	damage_types = list(BURN = WEAPON_FORCE_BRUTAL * 1.5)

/obj/item/device/lighting/toggleable/lantern/psionics
	name = "lantern"
	icon_state = "lantern"
	item_state = "lantern"
	desc = "A psionic lantern."
	brightness_on = 4            // luminosity when on
	var/mob/living/carbon/holder

/obj/item/device/lighting/toggleable/lantern/psionics/New(var/loc, var/mob/living/carbon/Maker)
	..()
	holder = Maker
	START_PROCESSING(SSobj, src)

/obj/item/device/lighting/toggleable/lantern/psionics/Process()
	if(loc != holder) // We're no longer in the psionic's hand.
		visible_message("The [src.name] fades into nothingness.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return
