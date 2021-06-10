/mob/living/simple_animal/hostile/roomba
	name = "Greyson Positronic RMB-A unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. This one seems pretty harmless."
	icon = 'icons/mob/battle_roomba.dmi'
	icon_state = "roomba"
	faction = "onestar"
	attacktext = "bonked"
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	move_to_delay = 2
	turns_per_move = 5
	minbodytemp = 0
	speed = 4
	light_range = 3
	light_color = COLOR_LIGHTING_BLUE_BRIGHT
	mob_classification = CLASSIFICATION_SYNTHETIC
	projectiletype = /obj/item/projectile/beam/drone
	move_to_delay = 9
	health = 25
	maxHealth = 25
	melee_damage_lower = 5
	melee_damage_upper = 10
	leather_amount = 0
	bones_amount = 0
	cleaning = TRUE

	//Drops
	var/drop1 = /obj/item/weapon/scrap_lump
	var/drop2 = null
	var/cell_drop = null

/mob/living/simple_animal/hostile/roomba/death()
	..()
	visible_message("<b>[src]</b> blows apart!")
	new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	if(drop1)
		new drop1 (src.loc)
		drop1 = null
	if(drop2)
		new drop2 (src.loc)
		drop2 = null
	if(cell_drop)
		new cell_drop (src.loc)
		cell_drop = null
	qdel(src)
	return

/mob/living/simple_animal/hostile/roomba/emp_act(severity)
	..()
	if(rapid)
		rapid = FALSE
	if(prob(95) && ranged)
		ranged = FALSE

/mob/living/simple_animal/hostile/roomba/slayer
	name = "Greyson Positronic RMB-A unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. This one seems to have a knife taped to it..?"
	icon_state = "roomba_knife"
	health = 35
	maxHealth = 35
	speed = 2
	melee_damage_lower = 12
	melee_damage_upper = 17
	drop2 = /obj/item/weapon/tool/knife

/mob/living/simple_animal/hostile/roomba/trip
	name = "Greyson Positronic RMB-A unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. This one has a baton attached to it..."
	icon_state = "roomba_batton"
	health = 35
	maxHealth = 35
	speed = 3 //speedy boy!
	melee_damage_lower = 7
	melee_damage_upper = 12
	var/trip_odds = 15 //So admins can edit this
	drop2 = /obj/item/weapon/melee/telebaton

/mob/living/simple_animal/hostile/roomba/trip/AttackTarget(var/atom/A, var/proximity)
	if(isliving(A))
		var/mob/living/L = A

		if(istype(L) && !L.weakened && prob(trip_odds))
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			L.Weaken(3)
			L.visible_message(SPAN_DANGER("\the [src] knocks down \the [L]!"))

	. = ..()

/mob/living/simple_animal/hostile/roomba/trip/armored
	name = "Greyson Positronic RMB-SEC unit"
	desc = "A small blue round drone, usually tasked with carrying out menial tasks. This one has a baton attached to it and seems to have added armor..."
	icon_state = "roomba_IH_batton"
	health = 90
	maxHealth = 90
	speed = 2 //speedy boy!
	melee_damage_lower = 7
	melee_damage_upper = 12

/mob/living/simple_animal/hostile/roomba/boomba
	name = "Greyson Positronic RMB-A unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. Is that a fucking anti-personel mine?!"
	icon_state = "boomba"
	health = 15
	maxHealth = 15
	speed = 0
	melee_damage_lower = 10
	melee_damage_upper = 10

/mob/living/simple_animal/hostile/roomba/boomba/AttackTarget()
	. = ..()
	if(.) // If we succeeded in hitting.
		src.visible_message(SPAN_DANGER("\The [src] makes an odd warbling noise, fizzles, and explodes!"))
		explosion(get_turf(loc), 0, 0, 2, 3)
		death()

/mob/living/simple_animal/hostile/roomba/gun_ba
	name = "Greyson Positronic RMB-A unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. And this one has a gun."
	icon_state = "roomba_lmg"
	health = 30
	maxHealth = 30
	speed = 3
	melee_damage_lower = 5
	melee_damage_upper = 10
	ranged = 1

/mob/living/simple_animal/hostile/roomba/gun_ba/New()
	..()
	if(prob(10))
		drop2 = /obj/item/weapon/gun/energy/retro
	if(prob(10))
		cell_drop = /obj/item/weapon/cell/medium

/mob/living/simple_animal/hostile/roomba/gun_ba/plasma
	name = "Greyson Positronic RMB-SEC unit"
	desc = "A small blue round drone, usually tasked with carrying out menial tasks. And this one has a overclocked gun."
	icon_state = "roomba_lmg"
	health = 50
	maxHealth = 50
	speed = 3
	melee_damage_lower = 5
	melee_damage_upper = 10
	ranged = 1
	projectiletype = /obj/item/projectile/plasma/light

/mob/living/simple_animal/hostile/roomba/gun_ba/armored
	name = "Greyson Positronic RMB-SEC unit"
	desc = "A small blue round drone, usually tasked with carrying out menial tasks. And this one has a gun and seems to have added armor."
	icon_state = "roomba_IH_lmg"
	health = 70
	maxHealth = 70
	speed = 3
	melee_damage_lower = 5
	melee_damage_upper = 10
	ranged = 1

/mob/living/simple_animal/hostile/roomba/chemical
	name = "Greyson Positronic RMB-MED unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. This one has a hypo on the top of it..."
	icon_state = "roomba_drugs"
	health = 20
	maxHealth = 20
	speed = 3
	melee_damage_lower = 7
	melee_damage_upper = 12
	var/injection_per_hit = 2
	var/injection_type = "toxin"

/mob/living/simple_animal/hostile/roomba/chemical/AttackTarget(var/atom/A, var/proximity)
	. = ..()

	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && L.reagents)
			L.reagents.add_reagent(injection_type, injection_per_hit)

/mob/living/simple_animal/hostile/roomba/chemical/med
	name = "Greyson Positronic RMB-MED unit"
	desc = "A small white round drone, usually tasked with carrying out menial tasks. This one has a hypo on the top of it..."
	icon_state = "roomba_medical_drugs"
	health = 20
	maxHealth = 20
	speed = 3
	melee_damage_lower = 2
	melee_damage_upper = 3
	injection_per_hit = 1
	injection_type = "chloralhydrate"

/mob/living/simple_animal/hostile/roomba/chemical/med/healer
	name = "Greyson Positronic RMB-MED unit"
	desc = "A small white round drone, usually tasked with carrying out menial tasks. This one has a hypo on the top of it..."
	icon_state = "roomba_medical_drugs"
	health = 20
	maxHealth = 20
	speed = 3
	melee_damage_lower = 2
	melee_damage_upper = 3
	injection_per_hit = 3
	injection_type = "tricordrazine"

/mob/living/simple_animal/hostile/roomba/synthetic
	name = "Greyson Positronic FBP-Utility unit"
	desc = "A full body positronic, tasked with carrying out a variety of duties. This one is unarmed."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "nanotrasen"
	attacktext = "punched"
	move_to_delay = 2
	turns_per_move = 7
	speed = 6
	health = 125
	maxHealth = 125
	cleaning = FALSE

/mob/living/simple_animal/hostile/roomba/synthetic/epistol
	name = "Greyson Positronic FBP-SEC Mark I unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. This one is has an old style energy pistol built into its arm."
	icon_state = "nanotrasenranged"
	ranged = 1

/mob/living/simple_animal/hostile/roomba/synthetic/epistol/New()
	..()
	if(prob(20))
		drop2 = /obj/item/weapon/gun/energy/retro
	if(prob(30))
		cell_drop = /obj/item/weapon/cell/medium

/mob/living/simple_animal/hostile/roomba/synthetic/epistol/esmg
	name = "Greyson Positronic FBP-SEC Mark II unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. This one is has a modified burst fire cog laser rifle built into its arm."
	icon_state = "nanotrasenrangedsmg"
	rapid = 1
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/beam/pulse/drone

/mob/living/simple_animal/hostile/roomba/synthetic/epistol/rifle
	name = "Greyson Positronic FBP-SEC Mark III unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. This one is has a modified heavy duty cog carbine built into its arm."
	icon_state = "nanotrasenrangedassault"
	projectiletype = /obj/item/projectile/beam/midlaser

/mob/living/simple_animal/hostile/roomba/synthetic/epistol/heavy
	name = "Greyson Positronic FBP-SEC Heavy unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. This one is has an overclocked super cog laser rifle built in his arm."
	icon_state = "nanotrasen_ert"
	projectiletype = /obj/item/projectile/beam/heavylaser

//spawners
/obj/random/mob/roomba
	name = "random greyson bot"
	icon_state = "hostilemob-black"
	has_postspawn = TRUE
	alpha = 128

/obj/random/mob/roomba/item_to_spawn()
	return pickweight(list(/mob/living/simple_animal/hostile/roomba = 17,
				/mob/living/simple_animal/hostile/roomba/slayer = 15,
				/mob/living/simple_animal/hostile/roomba/trip = 10,
				/mob/living/simple_animal/hostile/roomba/trip/armored = 3,
				/mob/living/simple_animal/hostile/roomba/boomba = 7,
				/mob/living/simple_animal/hostile/roomba/gun_ba/armored = 5,
				/mob/living/simple_animal/hostile/roomba/gun_ba = 10,
				/mob/living/simple_animal/hostile/roomba/gun_ba/plasma = 4,
				/mob/living/simple_animal/hostile/roomba/chemical = 5,
				/mob/living/simple_animal/hostile/roomba/chemical/med = 3,
				/mob/living/simple_animal/hostile/roomba/chemical/med/healer = 3,
				/mob/living/simple_animal/hostile/onestar_custodian = 25,
				/mob/living/simple_animal/hostile/onestar_custodian/chef = 10,
				/mob/living/simple_animal/hostile/onestar_custodian/engineer = 15,
				/mob/living/simple_animal/hostile/roomba/synthetic = 10,
				/mob/living/simple_animal/hostile/roomba/synthetic/epistol = 15,
				/mob/living/simple_animal/hostile/roomba/synthetic/epistol/esmg = 12,
				/mob/living/simple_animal/hostile/roomba/synthetic/epistol/rifle = 9,
				/mob/living/simple_animal/hostile/roomba/synthetic/epistol/heavy = 4,
				))

/obj/random/mob/roomba/post_spawn(var/list/spawns)
	for(var/mob/living/simple_animal/A in spawns)
		A.stasis = TRUE

//Non-hostile to regular colonists.
//Roomba
/mob/living/simple_animal/hostile/roomba/allied
	name = "SI Combat Roomba"
	desc = "A small round soteria branded research drone, usually tasked with menial work. For whatever reason, this one has been tasked for combat."
	faction = "neutral"
	icon_state = "roomba_SI"
	melee_damage_lower = 10
	melee_damage_upper = 15
	colony_friend = TRUE
	friendly_to_colony = TRUE

/mob/living/simple_animal/hostile/roomba/trip/armored/allied
	name = "SI Armored Roomba"
	desc = "A small round soteria branded research drone, usually tasked with menial work. For whatever reason, this one has been tasked for combat and given additional armor."
	faction = "neutral"
	icon_state = "roomba_SI_armor"
	melee_damage_lower = 12
	melee_damage_upper = 17
	colony_friend = TRUE
	friendly_to_colony = TRUE

//Robots
/mob/living/simple_animal/hostile/roomba/synthetic/allied
	name = "SI Sword Drone"
	desc = "A soteria branded sword drone, fully robotic and carrying out its combat duty by slaying animals and non-colony humanoids on sight."
	faction = "neutral"
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "soteria"
	attacktext = "slashed"
	move_to_delay = 1
	turns_per_move = 7
	speed = 2
	health = 250
	maxHealth = 250
	melee_damage_lower = 20
	melee_damage_upper = 30
	stop_automated_movement_when_pulled = TRUE
	wander = FALSE
	colony_friend = TRUE
	friendly_to_colony = TRUE

/mob/living/simple_animal/hostile/roomba/synthetic/allied/FindTarget()
	. = ..()
	if(.)
		visible_emote("lets out a buzz as it detects a target!")
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, 1, -3)

/mob/living/simple_animal/hostile/roomba/synthetic/allied/advanced
	name = "SI Mantis Drone"
	desc = "A soteria branded heavily armored mantis drone, fully robotic and carrying out its combat duty by slaying animals and non-colony humanoids on sight."
	icon_state = "soteria_mantis"
	health = 350
	maxHealth = 350
	melee_damage_lower = 30
	melee_damage_upper = 40
	colony_friend = TRUE
	friendly_to_colony = TRUE

/mob/living/simple_animal/hostile/roomba/synthetic/allied/junkbot
	name = "Prospector Junkbot"
	desc = "A prospector forged robot, its made from spare parts, love, and duct tape. Using designs 'borrowed' from the Soteria the prospector salvagers made these bots to function as disposable shields or \
	to gaurd specific locations since they do not wander. While lightweight, fast, and capable of a wickedly damaging slash with its armblade, they are not that durable."
	icon_state = "junkbot"
	health = 125
	maxHealth = 125
	melee_damage_lower = 15
	melee_damage_upper = 25
	colony_friend = TRUE
	friendly_to_colony = TRUE

/mob/living/simple_animal/hostile/roomba/synthetic/allied/rook
	name = "Rook Golem"
	desc = "A massive gold gilded robotic golem made designed by Brown to help protect the Absolutism and guard areas of portents form local wildlife." //Todo: Have kaz rewrite this and better lore, maybe Greyson AI helped make it?
	faction = "neutral"
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "rook"
	attacktext = "pumbles"
	move_to_delay = 2
	turns_per_move = 2
	speed = 2
	health = 550
	maxHealth = 550
	melee_damage_lower = 20 //Big slow things dont deal a lot do to bullet sponges
	melee_damage_upper = 20
	drop1 = /obj/item/stack/material/gold/random
	drop2 = /obj/item/weapon/book/ritual/cruciform