/obj/item/grenade/spawnergrenade
	desc = "It is set to detonate in 5 seconds. It will unleash unleash an unspecified anomaly into the vicinity."
	name = "delivery grenade"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "delivery"
	item_state = "flashbang"
	origin_tech = list(TECH_MATERIAL = 3, TECH_MAGNET = 4)
	var/banglet = 0
	var/spawner_type = null // must be an object path
	var/deliveryamt = 1 // amount of type to deliver
	var/will_flash = TRUE

/obj/item/grenade/spawnergrenade/prime()	// Prime now just handles the two loops that query for people in lockers and people who can see it.

	if(spawner_type && deliveryamt)
		// Make a quick flash
		var/turf/T = get_turf(src)
		playsound(T, 'sound/effects/phasein.ogg', 100, 1)
		for(var/mob/living/carbon/human/M in viewers(T, null))
			if(M.eyecheck() < FLASH_PROTECTION_MINOR && will_flash == TRUE)
				M.flash(0, FALSE , FALSE , FALSE , 0)

		for(var/i=1, i<=deliveryamt, i++)
			var/atom/movable/x = new spawner_type
			x.loc = T
			if(prob(50))
				for(var/j = 1, j <= rand(1, 3), j++)
					step(x, pick(NORTH,SOUTH,EAST,WEST))

			// Spawn some hostile syndicate critters

	qdel(src)
	return

/obj/item/grenade/spawnergrenade/manhacks
	name = "manhack delivery grenade"
	desc = "Deploys a swarm of floating robots that will attack anything nearby."
	spawner_type = /mob/living/simple_animal/hostile/viscerator
	deliveryamt = 5
	origin_tech = list(TECH_MATERIAL = 3, TECH_MAGNET = 4, TECH_ILLEGAL = 4)

//Opifex spawner
/obj/item/grenade/spawnergrenade/manhacks/opifex
	name = "opifex manhack grenade"
	desc = "Deploys a swarm of floating robots that will attack animals and non-colony humanoids nearby. "
	spawner_type = /mob/living/simple_animal/hostile/viscerator/opifex

/obj/item/grenade/spawnergrenade/manhacks/colony
	name = "colony-locked manhack grenade"
	desc = "Deploys a swarm of floating robots that will attack animals and non-colony humanoids nearby. "
	spawner_type = /mob/living/simple_animal/hostile/viscerator/colony

//Troll grenade
/obj/item/grenade/spawnergrenade/blob
	name = "bioweapon sample"
	desc = "Contains an absurdly dangerous bioweapon in suspended animation. It will expand rapidly upon release. Once deployed, run like hell."
	spawner_type = /obj/effect/blob/core
	deliveryamt = 1
	origin_tech = list(TECH_MATERIAL = 3, TECH_MAGNET = 4, TECH_ILLEGAL = 4)

/obj/item/grenade/spawnergrenade/manhacks/junkbot
	name = "\improper Prospie 'Eat-shit m8' lobber"
	desc = "A shitty rapid 'build-a-bot' grenade produced by prospector salvagers using designs 'borrowed' from the Soteria, handy for a build-a-bot guard or as a disposable decoy."
	deliveryamt = 1
	icon_state = "screamer"
	spawner_type = /mob/living/carbon/superior_animal/robot/greyson/synthetic/allied/junkbot
	matter = list(MATERIAL_STEEL = 5)
	will_flash = FALSE

//Greyson spawner grenades
/obj/item/grenade/spawnergrenade/manhacks/roomba
	name = "\improper GP-SI roomba grenade"
	desc = "Deploys a roomba that will attack animals and non-colony humanoids nearby."
	deliveryamt = 1
	icon_state = "greyson_nade_small"
	spawner_type = /mob/living/carbon/superior_animal/robot/greyson/roomba/allied
	matter = list(MATERIAL_STEEL = 5, MATERIAL_SILVER = 2, MATERIAL_GOLD = 1)
	will_flash = FALSE

/obj/item/grenade/spawnergrenade/manhacks/roomba/trippers
	name = "\improper GP-SI armored roomba grenade"
	desc = "Deploys an armored roomba that will attack animals and non-colony humanoids nearby."
	deliveryamt = 1
	icon_state = "greyson_nade_small"
	spawner_type = /mob/living/carbon/superior_animal/robot/greyson/roomba/trip/armored/allied
	matter = list(MATERIAL_STEEL = 10, MATERIAL_SILVER = 2, MATERIAL_GOLD = 1, MATERIAL_PLASTEEL = 6) //3 plasteel per baton

/obj/item/grenade/spawnergrenade/manhacks/roomba/sword
	name = "\improper GP-SI sword drone grenade"
	desc = "Deploys a sword-bearing robot enhanced with incredible speed and augments that will attack animals and non-colony humanoids on sight."
	deliveryamt = 1
	icon_state = "greyson_nade_medium"
	spawner_type = /mob/living/carbon/superior_animal/robot/greyson/synthetic/allied
	matter = list(MATERIAL_STEEL = 15, MATERIAL_SILVER = 6, MATERIAL_GOLD = 5, MATERIAL_PLASTEEL = 5)

/obj/item/grenade/spawnergrenade/manhacks/roomba/mantis
	name = "\improper GP-SI mantis drone grenade"
	desc = "Deploys a mantis blade-bearing robot enhanced with incredible speed and augments that will attack animals and non-colony humanoids on sight."
	deliveryamt = 1
	icon_state = "greyson_nade_large"
	spawner_type = /mob/living/carbon/superior_animal/robot/greyson/synthetic/allied/advanced
	matter = list(MATERIAL_STEEL = 25, MATERIAL_SILVER = 8, MATERIAL_GOLD = 5, MATERIAL_PLASTEEL = 9)
