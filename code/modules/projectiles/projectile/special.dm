/obj/item/projectile/ion
	name = "ion bolt"
	icon_state = "ion"
	damage_types = list(BURN = 0)
	nodamage = TRUE
	check_armor = ARMOR_ENERGY
	recoil = 5

/obj/item/projectile/ion/on_impact(atom/target)
	if (!testing)
		empulse(target, 1, 1)
	return TRUE

/obj/item/projectile/ion/heavy
	name = "heavy ion bolt"

/obj/item/projectile/ion/heavy/on_impact(atom/target)
	if (!testing)
		empulse(target, 2, 3)
	return TRUE

/obj/item/projectile/bullet/gyro
	name = "explosive microjet"
	icon_state = "bolter"
	damage_types = list(BRUTE = 50)
	check_armor = ARMOR_BULLET
	sharp = TRUE
	edge = TRUE
	recoil = 35

/obj/item/projectile/bullet/gyro/on_impact(atom/target)
	if (!testing)
		explosion(target, 0, 1, 2)
	return TRUE

/obj/item/projectile/bullet/rocket
	name = "high explosive rocket"
	icon_state = "rocket"
	damage_types = list(BRUTE = 70)
	armor_divisor = 10
	check_armor = ARMOR_BULLET
	recoil = 75

/obj/item/projectile/bullet/rocket/spear
	name = "SPEAR anti-armor rocket"
	icon_state = "rocket_spear"
	damage_types = list(BRUTE = 150)
	armor_divisor = 15
	check_armor = ARMOR_BULLET
	recoil = 75

/obj/item/projectile/bullet/rocket/spear/launch(atom/target, target_zone, x_offset, y_offset, angle_offset, firer_arg)
	if (!testing)
		set_light(3.5, 1.0, "#ff4400")
	..(target, target_zone, x_offset, y_offset, angle_offset)

/obj/item/projectile/bullet/rocket/spear/on_impact(atom/target)
	if (!testing)
		explosion(loc, 1, 2, 3, 5)
		set_light(0)
	return TRUE

/obj/item/projectile/bullet/rocket/sabul
	name = "high explosive mini-rocket"
	icon_state = "grenade"
	damage_types = list(BRUTE = 70)
	armor_divisor = 10
	check_armor = ARMOR_BULLET
	recoil = 75

/obj/item/projectile/bullet/rocket/shrapnel
	name = "shrapnel rocket"
	icon_state = "rocket_shrapnel"
	damage_types = list(BRUTE = 45)
	armor_divisor = 5
	check_armor = ARMOR_BULLET
	recoil = 75

/obj/item/projectile/bullet/rocket/shrapnel/on_impact(atom/target)
	if (!testing)
		explosion(loc, 0, 2, 4, 6)
		// Create shrapnel fragments
		for(var/i = 1 to 8)
			var/obj/item/projectile/bullet/pellet/fragment/F = new(loc)
			F.launch(get_edge_target_turf(loc, pick(alldirs)), null, 0, 0, 0)
		set_light(0)
	return TRUE

/obj/item/projectile/bullet/rocket/heat
	name = "HEAT rocket"
	icon_state = "rocket_heat"
	damage_types = list(BRUTE = 85)
	armor_divisor = 20
	check_armor = ARMOR_BULLET
	recoil = 75

/obj/item/projectile/bullet/rocket/heat/on_impact(atom/target)
	if (!testing)
		explosion(loc, 1, 1, 2, 3)
		set_light(0)
	return TRUE

/obj/item/projectile/bullet/rocket/railgun
	name = "chemical shunted power cell"
	icon_state = "emitter"
	recoil = 60

/obj/item/projectile/bullet/rocket/launch(atom/target, target_zone, x_offset, y_offset, angle_offset, firer_arg)
	if (!testing)
		set_light(2.5, 0.5, "#dddd00")
	..(target, target_zone, x_offset, y_offset, angle_offset)

/obj/item/projectile/bullet/rocket/on_impact(atom/target)
	if (!testing)
		explosion(loc, 0, 1, 2, 4)
		set_light(0)
	return TRUE

/obj/item/projectile/bullet/rocket/sabul/on_impact(atom/target)
	if (!testing)
		explosion(loc, 0, 1, 2, 2)
		set_light(0)
	return TRUE

/obj/item/projectile/bullet/rocket/scrap
	damage_types = list(BRUTE = 30)

/obj/item/projectile/bullet/rocket/scrap/on_impact(atom/target)
	if(!testing)
		explosion(target, 0, 0, 2, 3)

/obj/item/projectile/temp
	name = "freeze beam"
	icon_state = "ice_2"
	damage_types = list(BURN = 0)
	nodamage = 1
	check_armor = ARMOR_ENERGY
	var/temperature = 300

/obj/item/projectile/temp/on_impact(atom/target)//These two could likely check temp protection on the mob
	if (!testing)
		if(isliving(target))
			var/mob/M = target
			M.bodytemperature = temperature
	return TRUE

/obj/item/projectile/temp/cold
	temperature = 200

/obj/item/projectile/temp/ice
	temperature = 10 //balance wise this will be 10 rather then 0

/obj/item/projectile/temp/hot
	temperature = 400

/obj/item/projectile/temp/boil
	temperature = 500


/obj/item/projectile/slime_death
	name = "core stopper beam"
	icon_state = "ice_2"
	damage_types = list(BURN = 0)
	nodamage = TRUE
	check_armor = ARMOR_ENERGY
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	hitscan = FALSE

/obj/item/projectile/meteor
	name = "meteor"
	icon = 'icons/obj/meteor.dmi'
	icon_state = "smallf"
	damage_types = list(BRUTE = 0)
	nodamage = TRUE
	check_armor = ARMOR_BULLET

/obj/item/projectile/meteor/Bump(atom/A as mob|obj|turf|area, forced)
	if(A == firer)
		loc = A.loc
		return

	sleep(-1) //Might not be important enough for a sleep(-1) but the sleep/spawn itself is necessary thanks to explosions and metoerhits

	if(src)//Do not add to this if() statement, otherwise the meteor won't delete them
		if(A)

			if (!testing)

				A.ex_act(2)
				playsound(src.loc, 'sound/effects/meteorimpact.ogg', 40, 1)

				for(var/mob/M in range(10, src))
					if(!M.stat && !isAI(M))
						shake_camera(M, 3, 1)
			if (testing)
				impact_atom = A
			qdel(src)
			return 1
	else
		return 0

/obj/item/projectile/energy/floramut
	name = "alpha somatoray"
	icon_state = "energy"
	damage_types = list(TOX = 0)
	nodamage = TRUE
	check_armor = ARMOR_ENERGY

/obj/item/projectile/energy/floramut/on_impact(atom/target)
	if (!testing)
		var/mob/living/M = target
		if(ishuman(target))
			var/mob/living/carbon/human/H = M
			if((H.species.flags & IS_PLANT) && (H.nutrition < 500))
				if(prob(15))
					H.apply_effect((rand(30,80)),IRRADIATE)
					H.Weaken(5)
					for (var/mob/V in viewers(src))
						V.show_message("\red [M] writhes in pain as \his vacuoles boil.", 3, "\red You hear the crunching of leaves.", 2)
				if(prob(35))
					if(prob(80))
						randmutb(M)
						domutcheck(M,null)
					else
						randmutg(M)
						domutcheck(M,null)
				else
					M.adjustFireLoss(rand(5,15))
					M.show_message("\red The radiation beam singes you!")
		else if(istype(target, /mob/living/carbon/))
			M.show_message("\blue The radiation beam dissipates harmlessly through your body.")
	else
		return 1

/obj/item/projectile/energy/florayield
	name = "beta somatoray"
	icon_state = "energy2"
	damage_types = list(TOX = 0)
	nodamage = TRUE
	check_armor = ARMOR_ENERGY

/obj/item/projectile/energy/florayield/on_impact(atom/target)
	if (!testing)
		var/mob/M = target
		if(ishuman(target)) //These rays make plantmen fat.
			var/mob/living/carbon/human/H = M
			if((H.species.flags & IS_PLANT) && (H.nutrition < 500))
				H.nutrition += 30
		else if (istype(target, /mob/living/carbon/))
			M.show_message("\blue The radiation beam dissipates harmlessly through your body.")
		else
			return 1

/obj/item/projectile/energy/floraevolve
	name = "gamma somatoray"
	icon_state = "plasma"
	damage_types = list(TOX = 0)
	nodamage = TRUE
	check_armor = ARMOR_ENERGY

/obj/item/projectile/energy/floraevolve/on_impact(atom/target)
	if (!testing)
		var/mob/M = target
		if(ishuman(target)) //These rays make plantmen fat.
			var/mob/living/carbon/human/H = M
			if((H.species.flags & IS_PLANT) && (H.nutrition < 500))
				H.nutrition += 30
		else if (istype(target, /mob/living/carbon/))
			M.show_message("\blue The evolution beam dissipates harmlessly through your body.")
		else
			return 1


/obj/item/projectile/beam/mindflayer
	name = "flayer ray"

/obj/item/projectile/beam/mindflayer/on_impact(atom/target)
	if(ishuman(target))
		if (!testing)
			var/mob/living/carbon/human/M = target
			M.confused += rand(5,8)
			M.sanity_damage = 8

/obj/item/projectile/IRKdebilitate //Marking for future use
	name = "debilitator bolt"
	damage_types = list(BRUTE = 12) //Intended to be brute
	agony = 20
	icon_state = "declone"
	armor_divisor = 10
	recoil = 2

/obj/item/projectile/IRKdebilitate/on_impact(atom/target)
	if(ishuman(target))
		if (!testing)
			var/mob/living/carbon/human/M = target
			M.confused += rand(1,2)
			M.sanity_damage = 3 //Somehow these bolts mess with your head, must be some really weird scifi bullshit

/obj/item/projectile/chameleon
	name = "bullet"
	icon_state = "bullet"
	damage_types = list(HALLOSS = 1)
	embed = 0 // nope
	nodamage = TRUE
	muzzle_type = /obj/effect/projectile/bullet/muzzle
	ignition_source = FALSE


/obj/item/projectile/flamer_lob
	name = "blob of fuel"
	icon_state = "fireball"
	damage_types = list(BURN = 16)
	check_armor = ARMOR_MELEE
	kill_count = 3
	fire_stacks = 3

/obj/item/projectile/flamer_lob/Move(atom/A)
	..()
	if (!testing)
		var/turf/T = get_turf(src)
		if(T)
			new/obj/effect/decal/cleanable/liquid_fuel(T, 1 , 1)
			T.hotspot_expose((T20C*2) + 380,500)

/obj/item/projectile/flamer_lob/flamethrower
	kill_count = 5

/obj/item/projectile/bullet/flare
	name = "flare"
	icon_state = "flare"
	damage_types = list(BURN = 12) //Legit deadlyest gun that you get in mass
	kill_count = 12
	armor_divisor = 1
	step_delay = 3
	eyeblur = 2 // bright light slightly blurs your vision
	luminosity_range = 5
	luminosity_power = 1
	luminosity_color = COLOR_LIGHTING_RED_MACHINERY //Makes it not as blindingly red
	luminosity_ttl = 1
	fire_stacks = 1
	var/flash_range = 1
	var/light_duration = 1800
	var/brightness = 10
	knockback = FALSE
	can_ricochet = FALSE
	sharp = FALSE
	embed = FALSE
	var/chaos = FALSE
	var/chaose_number
	recoil = 1

/obj/item/projectile/bullet/flare/New()
	if(chaos)
		if (!testing)
			chaose_number = RANDOM_RGB
			luminosity_color = chaose_number

	..()

/obj/item/projectile/bullet/flare/on_impact(var/atom/A)
	var/turf/T = flash_range? src.loc : get_turf(A)
	if(!istype(T))
		return

	if (!testing)

		//blind adjacent people with enhanced vision
		for (var/mob/living/carbon/M in viewers(T, flash_range))
			if(M.eyecheck() < FLASH_PROTECTION_NONE)
				flash(0, FALSE,FALSE,FALSE)

		src.visible_message(SPAN_WARNING("\The [src] explodes in a bright light!"))
		new /obj/effect/decal/cleanable/ash(src.loc)
		playsound(src, 'sound/effects/Custom_flare.ogg', 100, 1)
		new /obj/effect/effect/smoke/illumination(T, brightness=max(flash_range*3, brightness), lifetime=light_duration, color=luminosity_color)

/obj/item/projectile/bullet/flare/blue
	luminosity_color = COLOR_SKY_BLUE //softer on the eyes

/obj/item/projectile/bullet/flare/green
	luminosity_color = PIPE_COLOR_GREEN //Bit better then normal green

/obj/item/projectile/bullet/flare/chaos //MEWHEHEHE, can be any colour
	chaos = TRUE

//Used for bluecross only atm
/obj/item/projectile/bullet/flare/yellow
	luminosity_color = COLOR_WHEAT //softer on the eyes
	flash_range = 2
	brightness = 12
	luminosity_range = 7
	luminosity_power = 3

/obj/item/projectile/bullet/flare/white
	luminosity_color = COLOR_SILVER //Not perfect white to help with rounding out shadows
	flash_range = 2
	brightness = 12
	luminosity_range = 7
	luminosity_power = 3

// Special projectile that one-shot ameridian-related stuff
/obj/item/projectile/sonic_bolt
	name = "sonic bolt"
	icon_state = "energy2"
	damage_types = list(BRUTE = 10)
	armor_divisor = 3 // It is a sound-wave liquifing organs I guess
	kill_count = 7
	check_armor = ARMOR_ENERGY
	var/golem_damage_bonus = 20 // Damage multiplier against ameridians.
	recoil = 7

/obj/item/projectile/sonic_bolt/heavy
	damage_types = list(BRUTE = 30)
	kill_count = 14
	recoil = 10

/obj/item/projectile/tether
	name = "tether grappler"
	icon_state = "invisible"
	nodamage = 1
	damage_types = list(BRUTE = 0)
	kill_count = 10
	step_delay = 0.2
	muzzle_type = null
	tracer_type = /obj/effect/projectile/line/tracer
	impact_type = /obj/effect/projectile/line/impact
	var/list/our_tracers
	recoil = 2

/obj/item/projectile/tether/lash
	name = "fleshy tentral"
	damage_types = list(BRUTE = 5)
	nodamage = FALSE
	stun = 2 //Horrors
	weaken = 2 //Unspeakable

/obj/item/projectile/tether/tail
	name = "tail lash"
	damage_types = list(BRUTE = 13)
	armor_divisor = 2
	nodamage = FALSE
	stun = 2 //Horrors
	weaken = 2 //Unspeakable


/obj/item/projectile/tether/Initialize()
	..()
	our_tracers = list()

/obj/item/projectile/tether/on_impact(target)
	for(var/obj/effect/tokill in our_tracers)
		qdel(tokill)
	..()
	var/atom/movable/AM
	var/reel_in_self = FALSE
	if (!testing)
		if(isturf(target))
			reel_in_self = TRUE
		if(ismovable(target))
			AM = target
			reel_in_self = AM.anchored

		if(reel_in_self)
			original_firer.throw_at(target, 10, 2, original_firer)
			visible_message(SPAN_WARNING("[src] begins reeling in, pulling [original_firer] towards [target]!"))
			return

		visible_message(SPAN_WARNING("[src] begins reeling in, pulling [target] towards [original_firer]!"))
		AM.throw_at(original_firer, 10, 1, original_firer) //GET OVER HERE

/obj/item/projectile/tether/muzzle_effect(var/matrix/T)
	if (!testing)
		//This can happen when firing inside a wall, safety check
		if (!location)
			return

		if(silenced)
			return

		if(ispath(muzzle_type))
			var/obj/effect/projectile/M = new muzzle_type(get_turf(src))

			if(istype(M))
				if(proj_color)
					var/icon/I = new(M.icon, M.icon_state)
					I.Blend(proj_color)
					M.icon = I
				M.set_transform(T)
				M.pixel_x = location.pixel_x
				M.pixel_y = location.pixel_y
				M.activate()
				our_tracers.Add(M)

/obj/item/projectile/tether/tracer_effect(var/matrix/M) //Special tracer handling, since we only want them to disappear after it hits something

	if (!testing)

		if (!location)
			return

		if(ispath(tracer_type))
			var/obj/effect/projectile/P = new tracer_type(location.loc)

			if(istype(P))
				if(proj_color)
					var/icon/I = new(P.icon, P.icon_state)
					I.Blend(proj_color)
					P.icon = I
				P.set_transform(M)
				P.pixel_x = location.pixel_x
				P.pixel_y = location.pixel_y
				P.activate()
				our_tracers.Add(P) //this should be more performant than += since we don't need to be creating a bunch of new lists


//OS Portable turret projectiles

/obj/item/projectile/bullet/os_trurret_gauss
	name = "ferrous slug"
	damage_types = list(BRUTE = 15)
	armor_divisor = 2
	penetrating = 2
	recoil = 30
	step_delay = 0.4
	sharp = TRUE	// Until all bullets are turned sharp by default

/obj/item/projectile/beam/os_turret
	name = "pulsed beam"
	icon_state = "beam_blue"
	damage_types = list(BURN = 15)
	stutter = 3
	recoil = 10

	muzzle_type = /obj/effect/projectile/laser_blue/muzzle
	tracer_type = /obj/effect/projectile/laser_blue/tracer
	impact_type = /obj/effect/projectile/laser_blue/impact

//PPC
/obj/item/projectile/ppc
	name = "plasma discharge bolt"
	icon_state = "ice_1"
	damage_types = list(BURN = 47)
	armor_divisor = 2.5
	check_armor = ARMOR_ENERGY
	recoil = 8

	muzzle_type = /obj/effect/projectile/tesla/muzzle
	tracer_type = /obj/effect/projectile/tesla/tracer
	impact_type = /obj/effect/projectile/tesla/impact

/obj/item/projectile/ppc/on_impact(atom/target)
	if (!testing)
		empulse(target, 0, 1)
		electrocute_mob(target, 1)
		new/obj/effect/sparks(target.loc)
	return TRUE
