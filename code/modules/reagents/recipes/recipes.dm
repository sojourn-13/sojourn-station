/* Common reactions */

/datum/chemical_reaction/inaprovaline
	result = "inaprovaline"
	required_reagents = list("acetone" = 1, "carbon" = 1, "sugar" = 1)
	//byproducts = list("water" = 1)
	result_amount = 3

/datum/chemical_reaction/dylovene
	result = "anti_toxin"
	required_reagents = list("silicon" = 1, "potassium" = 1, "ammonia" = 1)
	result_amount = 3

/datum/chemical_reaction/carthatoline
	result = "carthatoline"
	required_reagents = list("anti_toxin" = 1, "carbon" = 2, "toxin" = 0.1)
	catalysts = list("plasma" = 5)
	result_amount = 3

/datum/chemical_reaction/cordradaxon
	result = "cordradaxon"
	required_reagents = list("potassium_chloride" = 1, "blattedin" = 1, "cronexidone" = 0.1)
	catalysts = list("plasma" = 5)
	result_amount = 2

/datum/chemical_reaction/tramadol
	result = "tramadol"
	required_reagents = list("paracetamol" = 1, "sugar" = 1, "water" = 1)
	result_amount = 3

/datum/chemical_reaction/paracetamol
	result = "paracetamol"
	required_reagents = list("inaprovaline" = 1, "ethanol" = 1, "acetone" = 1)
	result_amount = 3

/datum/chemical_reaction/oxycodone
	result = "oxycodone"
	required_reagents = list("ethanol" = 1, "tramadol" = 1)
	catalysts = list("plasma" = 5)
	result_amount = 1

/datum/chemical_reaction/toxin
	result = "toxin"
	required_reagents = list("ammonia" = 1, "mercury" = 1, "ethanol" = 1)
	catalysts = list("plasma" = 5)
	result_amount = 3

/datum/chemical_reaction/sterilizine
	result = "sterilizine"
	required_reagents = list("ethanol" = 1, "anti_toxin" = 1, "hclacid" = 1)
	result_amount = 3

/datum/chemical_reaction/silicate
	result = "silicate"
	required_reagents = list("aluminum" = 1, "silicon" = 1, "acetone" = 1)
	result_amount = 3

/datum/chemical_reaction/mutagen
	result = "mutagen"
	required_reagents = list("radium" = 1, "phosphorus" = 1, "hclacid" = 1)
	result_amount = 3

/datum/chemical_reaction/thermite
	result = "thermite"
	required_reagents = list("aluminum" = 1, "iron" = 1, "acetone" = 1)
	result_amount = 3

/datum/chemical_reaction/space_drugs
	result = "space_drugs"
	required_reagents = list("mercury" = 1, "sugar" = 1, "lithium" = 1)
	result_amount = 3

/datum/chemical_reaction/nicotine
    result = "nicotine"
    required_reagents = list("toxin" = 1, "carbon" = 1, "capsaicin" = 1, "mercury" = 1)
    result_amount = 4

/datum/chemical_reaction/lube
	result = "lube"
	required_reagents = list("water" = 1, "silicon" = 1, "acetone" = 1)
	result_amount = 4

/datum/chemical_reaction/pacid
	result = "pacid"
	required_reagents = list("sacid" = 1, "hclacid" = 1, "potassium" = 1)
	result_amount = 3

/datum/chemical_reaction/synaptizine
	result = "synaptizine"
	required_reagents = list("sugar" = 1, "lithium" = 1, "water" = 1)
	result_amount = 3

/datum/chemical_reaction/hyronalin
	result = "hyronalin"
	required_reagents = list("radium" = 1, "anti_toxin" = 1)
	result_amount = 2

/datum/chemical_reaction/arithrazine
	result = "arithrazine"
	required_reagents = list("hyronalin" = 1, "hydrazine" = 1)
	result_amount = 2

/datum/chemical_reaction/impedrezene
	result = "impedrezene"
	required_reagents = list("mercury" = 1, "acetone" = 1, "sugar" = 1)
	result_amount = 2

/datum/chemical_reaction/kelotane
	result = "kelotane"
	required_reagents = list("silicon" = 1, "carbon" = 1)
	result_amount = 2
	log_is_important = 1

/datum/chemical_reaction/peridaxon
	result = "peridaxon"
	required_reagents = list("bicaridine" = 2, "cronexidone" = 0.1)
	catalysts = list("plasma" = 5)
	result_amount = 2

/datum/chemical_reaction/trypsin
	result = "trypsin"
	required_reagents = list("carbon" = 1, "sacid" = 1, "dermaline" = 1)
	result_amount = 1

/datum/chemical_reaction/leporazine
	result = "leporazine"
	required_reagents = list("silicon" = 1, "copper" = 1)
	catalysts = list("plasma" = 5)
	result_amount = 2

/datum/chemical_reaction/cryptobiolin
	result = "cryptobiolin"
	required_reagents = list("potassium" = 1, "acetone" = 1, "sugar" = 1)
	result_amount = 3

/datum/chemical_reaction/tricordrazine
	result = "tricordrazine"
	required_reagents = list("inaprovaline" = 1, "anti_toxin" = 1)
	result_amount = 2

/datum/chemical_reaction/alkysine
	result = "alkysine"
	required_reagents = list("hclacid" = 1, "ammonia" = 1, "anti_toxin" = 1)
	result_amount = 2

/datum/chemical_reaction/dexalin
	result = "dexalin"
	required_reagents = list("acetone" = 2, "iron" = 0.1)
	catalysts = list("plasma" = 5)
	inhibitors = list("water" = 1) // Messes with cryox
	result_amount = 1

/datum/chemical_reaction/dermaline
	result = "dermaline"
	required_reagents = list("acetone" = 1, "phosphorus" = 1, "kelotane" = 1)
	result_amount = 3

/datum/chemical_reaction/dermahypnodol
	result = "dermahypnodol"
	required_reagents = list("dermaline" = 1, "tramadol" = 1, "sodium" = 1)
	result_amount = 1
	catalysts = list("water" = 15)
	inhibitors = list("kelotane" = 1)
	byproducts = list("sodiumchloride" = 0.1)

/datum/chemical_reaction/dexalinp
	result = "dexalinp"
	required_reagents = list("dexalin" = 1, "iron" = 1, "acetone" = 1)
	catalysts = list("plasma" = 5)
	result_amount = 3

/datum/chemical_reaction/respirodaxon
	result = "respirodaxon"
	required_reagents = list("dexalinp" = 1, "blattedin" = 1, "cronexidone" = 0.1)
	catalysts = list("plasma" = 5)
	result_amount = 2

/datum/chemical_reaction/bicaridine
	result = "bicaridine"
	required_reagents = list("inaprovaline" = 1, "carbon" = 1)
	inhibitors = list("sugar" = 1) // Messes up with inaprovaline
	result_amount = 2

/datum/chemical_reaction/somnadine
	result = "somnadine"
	required_reagents = list("bicaridine" = 1, "tramadol" = 1, "carbon" = 1)
	result_amount = 1
	catalysts = list("water" = 15)
	inhibitors = list("bicaridine" = 1)
	byproducts = list("sodiumchloride" = 0.1)

/datum/chemical_reaction/vermicetol
	result = "vermicetol"
	required_reagents = list("kelotane" = 1, "dermaline" = 1, "blattedin" = 1, "cryoxadone" = 0.5, "cronexidone" = 0.5)
	catalysts = list("plasma" = 5)
	result_amount = 2

/datum/chemical_reaction/varceptol
	result = "varceptol"
	required_reagents = list("carthatoline" = 1, "bicaridine" = 1, "blattedin" = 1)
	catalysts = list("plasma" = 5)
	result_amount = 3

/datum/chemical_reaction/meralyne
	result = "meralyne"
	required_reagents = list("hyperzine" = 1, "blattedin" = 2, "tramadol" = 1)
	result_amount = 2

/datum/chemical_reaction/nanoblood
	result = "nanoblood"
	required_reagents = list("blood" = 3, "uncap nanites" = 5, "sanguinum" = 2)
	maximum_temperature = 314 //within about 5 degrees of bloods natural temp in the body
	catalysts = list("plasma" = 5)
	result_amount = 5

/datum/chemical_reaction/nanobad
	result = "nanobad"
	required_reagents = list("nanoblood" = 1)
	minimum_temperature = 323 // aprox the temp at which blood breaks down, gotta be careful when making it!
	result_amount = 4 //a little bit of it breaks down in to biofilm and other gross gunk

/datum/chemical_reaction/hyperzine
	result = "hyperzine"
	required_reagents = list("sugar" = 1, "blattedin" = 1, "sulfur" = 1)
	result_amount = 3

/datum/chemical_reaction/psi_juice
	result = "psi_juice"
	required_reagents = list("psilocybin" = 1, "synaptizine" = 1, "cryptobiolin" = 1)
	result_amount = 3

/datum/chemical_reaction/psi_juice_inhaler
	result = null
	required_reagents = list("psi_juice" = 30, "water" = 30, "silicon" = 30)
	result_amount = 1
	blacklist_containers = list(/mob, /obj/machinery/microwave)
	mix_message = "The solution solidifies into a cerebrix inhaler!"

/datum/chemical_reaction/psi_juice_inhaler/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= created_volume, i++)
		new /obj/item/psi_injector(location)

/datum/chemical_reaction/ryetalyn
	result = "ryetalyn"
	required_reagents = list("arithrazine" = 1, "carbon" = 1)
	result_amount = 2

/datum/chemical_reaction/negative_ling
	result = "negativeling"
	required_reagents = list("ryetalyn" = 1, "carbon" = 1)
	result_amount = 1
	maximum_temperature = INFINITY
	minimum_temperature = 400

/datum/chemical_reaction/positive_ling
	result = "positiveling"
	required_reagents = list("negativeling" = 1, "blood" = 1)
	result_amount = 1
	maximum_temperature = INFINITY
	minimum_temperature = 700

/datum/chemical_reaction/positive_ling/can_happen(datum/reagents/holder)
	if(..())
		var/list/blood_data = holder.get_data("blood")
		if(blood_data["carrion"])
			return TRUE

	return FALSE

/datum/chemical_reaction/cryoxadone
	result = "cryoxadone"
	required_reagents = list("dexalinp" = 1, "water" = 1, "acetone" = 1)
	result_amount = 3
	maximum_temperature = 90
	minimum_temperature = 45

/datum/chemical_reaction/cronexidone
	result = "cronexidone"
	required_reagents = list("cryoxadone" = 1, "sodium" = 1, "radium" = 0.1)
	maximum_temperature = 45
	minimum_temperature = 22.5
	catalysts = list("plasma" = 5)
	result_amount = 2

/datum/chemical_reaction/nanitefluid
	result = "nanofluid"
	required_reagents = list("cronexidone" = 1, "aluminum" = 1, "iron" = 1, "uncap nanites" = 0.1) // Raw nanites mess up with Aluminum.
	catalysts = list("plasma" = 5)
	maximum_temperature = 98
	minimum_temperature = 73
	result_amount = 3

/datum/chemical_reaction/spaceacillin
	result = "spaceacillin"
	required_reagents = list("cryptobiolin" = 1, "inaprovaline" = 1)
	result_amount = 2

/datum/chemical_reaction/imidazoline
	result = "imidazoline"
	required_reagents = list("carbon" = 1, "hydrazine" = 1, "anti_toxin" = 1)
	result_amount = 2

/datum/chemical_reaction/ethylredoxrazine
	result = "ethylredoxrazine"
	required_reagents = list("acetone" = 1, "anti_toxin" = 1, "carbon" = 1)
	result_amount = 3

/datum/chemical_reaction/soporific
	result = "stoxin"
	required_reagents = list("chloralhydrate" = 1, "sugar" = 4)
	inhibitors = list("phosphorus") // Messes with the smoke
	result_amount = 5

/datum/chemical_reaction/chloralhydrate
	result = "chloralhydrate"
	required_reagents = list("ethanol" = 1, "hclacid" = 3, "water" = 1)
	result_amount = 1

/datum/chemical_reaction/potassium_chloride
	result = "potassium_chloride"
	required_reagents = list("sodiumchloride" = 1, "potassium" = 1)
	result_amount = 2

/datum/chemical_reaction/potassium_chlorophoride
	result = "potassium_chlorophoride"
	required_reagents = list("potassium_chloride" = 1, "toxin" = 1, "chloralhydrate" = 1)
	result_amount = 4

/datum/chemical_reaction/zombiepowder
	result = "zombiepowder"
	required_reagents = list("carpotoxin" = 5, "stoxin" = 5, "copper" = 5)
	result_amount = 2

/datum/chemical_reaction/mindbreaker
	result = "mindbreaker"
	required_reagents = list("silicon" = 1, "hydrazine" = 1, "anti_toxin" = 1)
	result_amount = 3

/datum/chemical_reaction/lipozine
	result = "lipozine"
	required_reagents = list("sodiumchloride" = 1, "ethanol" = 1, "radium" = 1)
	result_amount = 3

/datum/chemical_reaction/surfactant
	result = "surfactant"
	required_reagents = list("hydrazine" = 2, "carbon" = 2, "sacid" = 1)
	result_amount = 5

/datum/chemical_reaction/diethylamine
	result = "diethylamine"
	required_reagents = list ("ammonia" = 1, "ethanol" = 1)
	result_amount = 2

/datum/chemical_reaction/space_cleaner
	result = "cleaner"
	required_reagents = list("ammonia" = 1, "water" = 1)
	result_amount = 3

/datum/chemical_reaction/space_cleanest
	result = "cleaner"
	required_reagents = list("cleaner" = 1, "water" = 1)
	catalysts = list("cleaner" = 60) //need to actually have enough cleaner to mix.
	result_amount = 3


/datum/chemical_reaction/plantbgone
	result = "plantbgone"
	required_reagents = list("toxin" = 1, "water" = 4)
	result_amount = 5

/datum/chemical_reaction/foaming_agent
	result = "foaming_agent"
	required_reagents = list("lithium" = 1, "hydrazine" = 1)
	result_amount = 1

/datum/chemical_reaction/condensedcapsaicin
	result = "condensedcapsaicin"
	required_reagents = list("capsaicin" = 3)
	result_amount = 1
	maximum_temperature = INFINITY
	minimum_temperature = 373

/datum/chemical_reaction/coolant
	result = "coolant"
	required_reagents = list("tungsten" = 1, "acetone" = 1, "water" = 1)
	result_amount = 3

/datum/chemical_reaction/refrigerant
	result = "refrigerant"
	required_reagents = list("carbon" = 1, "acetone" = 1, "water" = 1)
	result_amount = 3

/datum/chemical_reaction/rezadone
	result = "rezadone"
	required_reagents = list("cronexidone" = 1, "cryptobiolin" = 1, "copper" = 1)
	result_amount = 3

/datum/chemical_reaction/lexorin
	result = "lexorin"
	required_reagents = list("plasma" = 1, "hydrazine" = 1, "ammonia" = 1)
	result_amount = 3

/datum/chemical_reaction/methylphenidate
	result = "methylphenidate"
	required_reagents = list("mindbreaker" = 1, "hydrazine" = 1)
	result_amount = 3

/datum/chemical_reaction/citalopram
	result = "citalopram"
	required_reagents = list("mindbreaker" = 1, "carbon" = 1)
	result_amount = 3

/datum/chemical_reaction/paroxetine
	result = "paroxetine"
	required_reagents = list("mindbreaker" = 1, "acetone" = 1, "inaprovaline" = 1)
	result_amount = 3

/datum/chemical_reaction/lean
	result = "lean"
	required_reagents = list("tramadol" = 1, "chloralhydrate" = 1, "stoxin" = 1, "sodawater" = 1)
	byproducts= list("redcandyliquor" = 1) //Its called old fastion sleeping agent
	result_amount = 1

/datum/chemical_reaction/compressedjelly
	result = null
	required_reagents = list("slimejelly" = 100)
	result_amount = 1
	blacklist_containers = list(/mob, /obj/machinery/microwave)
	mix_message = "The solution coalesces into a compressed jelly jar!"

/datum/chemical_reaction/compressedjelly/on_reaction(var/datum/reagents/holder, var/created_volume)
	var /obj/item/slime_potion/slimes_reviver/R = new /obj/item/slime_potion/slimes_reviver
	R.loc = get_turf(holder.my_atom)

/* Solidification */

/datum/chemical_reaction/plasmasolidification
	result = null
	required_reagents = list("iron" = 5, "frostoil" = 5, "plasma" = 20)
	result_amount = 1
	mix_message = "The solution coalesces into solid sheets of plasma!"

/datum/chemical_reaction/plasmasolidification/on_reaction(var/datum/reagents/holder, var/created_volume)
	new /obj/item/stack/material/plasma(get_turf(holder.my_atom), created_volume)
	return

/datum/chemical_reaction/plastication
	result = null
	required_reagents = list("pacid" = 1, "plasticide" = 2)
	result_amount = 1
	mix_message = "The solution coalesces into solid sheets of plastic!"

/datum/chemical_reaction/plastication/on_reaction(var/datum/reagents/holder, var/created_volume)
	new /obj/item/stack/material/plastic(get_turf(holder.my_atom), created_volume)
	return


/datum/chemical_reaction/goldsolidification
	result = null
	required_reagents = list("iron" = 5, "frostoil" = 5, MATERIAL_GOLD = 20)
	result_amount = 1
	mix_message = "The solution coalesces into solid sheets of gold! Alchemy is real!"

/datum/chemical_reaction/goldsolidification/on_reaction(var/datum/reagents/holder, var/created_volume)
	new /obj/item/stack/material/gold(get_turf(holder.my_atom), created_volume)
	return

/datum/chemical_reaction/uraniumsolidification
	result = null
	required_reagents = list("phosphorus" = 5, "frostoil" = 5, MATERIAL_URANIUM = 20)
	result_amount = 1
	mix_message = "The solution dangerously coalesces into solid sheets of stable uranium!"

/datum/chemical_reaction/uraniumsolidification/on_reaction(var/datum/reagents/holder, var/created_volume)
	new /obj/item/stack/material/uranium(get_turf(holder.my_atom), created_volume)
	return

/datum/chemical_reaction/silversolidification
	result = null
	required_reagents = list("iron" =5, "frostoil" =5, "silver" =20)
	result_amount =1
	mix_message = "The solution coalesces into solid sheets of silver!"

/datum/chemical_reaction/silversolidification/on_reaction(var/datum/reagents/holder, var/created_volume)
	new /obj/item/stack/material/silver(get_turf(holder.my_atom), created_volume)
	return

/datum/chemical_reaction/cardboardification
	result = null
	required_reagents = list("woodpulp" = 5, "water" = 5)
	result_amount = 1
	mix_message = "The mixture dries up and becomes sheets of pliable cardboard."

/datum/chemical_reaction/cardboardification/on_reaction(var/datum/reagents/holder, var/created_volume)
	new /obj/item/stack/material/cardboard(get_turf(holder.my_atom), created_volume)
	return

/* Grenade reactions */

/datum/chemical_reaction/explosion_potassium
	result = null
	required_reagents = list("water" = 1, "potassium" = 1)
	result_amount = 2
	mix_message = null
	blacklist_containers = list(/mob, /obj/machinery/microwave)

/datum/chemical_reaction/explosion_potassium/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/datum/effect/effect/system/reagents_explosion/e = new()
	e.set_up(round (created_volume/45, 1), holder.my_atom, 0, 0) // 600/45 = 13.3 , 13/3 = 4-3 light-range , slightly weaker than a cracker.
	e.start()
	holder.clear_reagents()
	return

/datum/chemical_reaction/flash_powder
	result = null
	required_reagents = list("aluminum" = 1, "potassium" = 1, "sulfur" = 1 )
	result_amount = null
	blacklist_containers = list(/mob, /obj/machinery/microwave)

/datum/chemical_reaction/flash_powder/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/location = get_turf(holder.my_atom)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(2, 1, location)
	s.start()
	for(var/mob/living/carbon/M in viewers(world.view, location))
		switch(get_dist(M, location))
			if(0 to 3)
				if(M.eyecheck() <= FLASH_PROTECTION_MODERATE)
					M.flash(15, FALSE , FALSE , FALSE)

			if(4 to 5)
				if(M.eyecheck() <= FLASH_PROTECTION_MODERATE)
					M.flash(0, FALSE , FALSE , FALSE)

/datum/chemical_reaction/emp_pulse
	result = null
	required_reagents = list(MATERIAL_URANIUM = 1, "iron" = 1) // Yes, laugh, it's the best recipe I could think of that makes a little bit of sense
	result_amount = 2
	blacklist_containers = list(/mob, /obj/machinery/microwave)

/datum/chemical_reaction/emp_pulse/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/location = get_turf(holder.my_atom)
	// 100 created volume = 4 heavy range & 7 light range. A few tiles smaller than contractor EMP grandes.
	// 200 created volume = 8 heavy range & 14 light range. 4 tiles larger than contractor EMP grenades.
	empulse(location, round(created_volume / 24), round(created_volume / 14), 1)
	holder.clear_reagents()
	return

/datum/chemical_reaction/nitroglycerin
	result = "nitroglycerin"
	required_reagents = list("glycerol" = 1, "pacid" = 1, "sacid" = 1)
	result_amount = 2
	log_is_important = 1
	blacklist_containers = list(/mob, /obj/machinery/microwave)

/datum/chemical_reaction/nitroglycerin/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/datum/effect/effect/system/reagents_explosion/e = new()
	e.set_up(round (created_volume/10, 1), holder.my_atom, 0, 0)
	//None of this account for BS beakers or 2 buckets... - Same as old water + poss but hey this takes more effert even tho it still has no counter
	//at created_volume/10, doble 240 beaker bomb is 24,
	//at created_volume/6,  doble 240 beaker bomb is 40,
	//at created_volume/4,  doble 240 beaker bomb is 60,
	//at created_volume/2,  doble 240 beaker bomb is 120,
	//Given the effort it takes and hydr needed for this 10 is fine, it requires BS beakers to make a max cap.
	e.start()

	holder.clear_reagents()
	return

/datum/chemical_reaction/napalm
	result = null
	required_reagents = list("aluminum" = 1, "plasma" = 1, "sacid" = 1 )
	result_amount = 1
	blacklist_containers = list(/mob, /obj/machinery/microwave)

/datum/chemical_reaction/napalm/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/turf/location = get_turf(holder.my_atom.loc)
	for(var/turf/simulated/floor/target_tile in range(0,location))
		target_tile.assume_gas("plasma", created_volume, 400+T0C)
		spawn (0) target_tile.hotspot_expose(700, 400)
	holder.del_reagent("napalm")
	return

/datum/chemical_reaction/chemsmoke
	result = null
	required_reagents = list("potassium" = 1, "sugar" = 1, "phosphorus" = 1)
	result_amount = 0.4
	blacklist_containers = list(/mob, /obj/machinery/microwave)

/datum/chemical_reaction/chemsmoke/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/location = get_turf(holder.my_atom)
	var/datum/effect/effect/system/smoke_spread/chem/S = new /datum/effect/effect/system/smoke_spread/chem
	S.attach(location)
	S.set_up(holder, created_volume, 0, location)
	playsound(location, 'sound/effects/smoke.ogg', 50, 1, -3)
	spawn(0)
		S.start()
	holder.clear_reagents()
	return

/datum/chemical_reaction/foam
	result = null
	required_reagents = list("surfactant" = 1, "water" = 1)
	result_amount = 2
	mix_message = "The solution violently bubbles!"
	blacklist_containers = list(/mob, /obj/machinery/microwave)

/datum/chemical_reaction/foam/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/location = get_turf(holder.my_atom)

	for(var/mob/M in viewers(5, location))
		to_chat(M, SPAN_WARNING("The solution spews out foam!"))

	var/datum/effect/effect/system/foam_spread/s = new()
	s.set_up(created_volume, location, holder, 0)
	s.start()
	holder.clear_reagents()
	return

/datum/chemical_reaction/metalfoam
	result = null
	required_reagents = list("aluminum" = 3, "foaming_agent" = 1, "pacid" = 1)
	result_amount = 5
	blacklist_containers = list(/mob, /obj/machinery/microwave)

/datum/chemical_reaction/metalfoam/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/location = get_turf(holder.my_atom)

	for(var/mob/M in viewers(5, location))
		to_chat(M, SPAN_WARNING("The solution spews out a metalic foam!"))

	var/datum/effect/effect/system/foam_spread/s = new()
	s.set_up(created_volume, location, holder, 1)
	s.start()
	return

/datum/chemical_reaction/ironfoam
	result = null
	required_reagents = list("iron" = 3, "foaming_agent" = 1, "pacid" = 1)
	result_amount = 5
	blacklist_containers = list(/mob, /obj/machinery/microwave)

/datum/chemical_reaction/ironfoam/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/location = get_turf(holder.my_atom)

	for(var/mob/M in viewers(5, location))
		to_chat(M, SPAN_WARNING("The solution spews out a metalic foam!"))

	var/datum/effect/effect/system/foam_spread/s = new()
	s.set_up(created_volume, location, holder, 2)
	s.start()
	return

/datum/chemical_reaction/luminol
	result = "luminol"
	required_reagents = list("hydrazine" = 2, "carbon" = 2, "ammonia" = 2)
	result_amount = 6

/datum/chemical_reaction/greaser
	result = "greaser"
	required_reagents = list("coffee" = 2, "diplopterum" = 1, "sugar" = 1, "ethanol" = 1)
	result_amount = 5
	maximum_temperature = 343
	minimum_temperature = 323

/datum/chemical_reaction/lard
	result = "greasy lard"
	required_reagents = list("greaser" = 1, "tramadol" = 1, "blattedin" = 1)
	result_amount = 3
	maximum_temperature = 318
	minimum_temperature = 308

/datum/chemical_reaction/party_drops
	result = "party drops"
	required_reagents = list("grape drops" = 1, "greasy lard" = 1, "ultrasurgeon" = 1)
	catalysts = list("honey" = 1)
	result_amount = 3

/datum/chemical_reaction/cherry_drops
	result = "cherry drops"
	required_reagents = list("iron" = 1, "psilocybin" = 1, "plantbgone" = 1)
	result_amount = 3
	maximum_temperature = 333
	minimum_temperature = 303

/datum/chemical_reaction/grape_drops
	result = "grape drops"
	required_reagents = list("honey" = 1, "cherry drops" = 2, "ethanol" = 2)
	result_amount = 5
	maximum_temperature = 343
	minimum_temperature = 338

/datum/chemical_reaction/pro_surgeon
	result = "prosurgeon"
	required_reagents = list("nicotine" = 1, "sugar" = 2, "tungsten" = 2)
	result_amount = 4

/datum/chemical_reaction/ultra_surgeon
	result = "ultrasurgeon"
	required_reagents = list("prosurgeon" = 3, "noexcutite" = 1)
	result_amount = 4
	maximum_temperature = 263
	minimum_temperature = 243

/datum/chemical_reaction/noexcutite
	result = "noexcutite"
	required_reagents = list("oxycodone" = 1, "anti_toxin" = 1)
	result_amount = 2

/datum/chemical_reaction/violence
	result = "violence"
	required_reagents = list("blood" = 3, "ammonia" = 1, "gewaltine" = 1)
	result_amount = 5
	maximum_temperature = 423
	minimum_temperature = 393

/datum/chemical_reaction/violence_ultra
	result = "violence ultra"
	required_reagents = list("violence" = 1, "fuhrerole" = 1, "hyperzine" = 1)
	result_amount = 3
	maximum_temperature = 258
	minimum_temperature = 243

/datum/chemical_reaction/bouncer
	result = "bouncer"
	required_reagents = list("violence" = 1, "fuhrerole" = 1, "hyperzine" = 1)
	result_amount = 3
	maximum_temperature = 333
	minimum_temperature = 303

/datum/chemical_reaction/boxer
	result = "boxer"
	required_reagents = list("bouncer" = 2, "plasma" = 1, "amatoxin" = 2)
	result_amount = 5
	maximum_temperature = 328
	minimum_temperature = 323

/datum/chemical_reaction/steady
	result = "steady"
	required_reagents = list("pararein" = 1, "carpotoxin" = 1, "copper" = 1, "hydrazine" = 1)
	result_amount = 4
	maximum_temperature = 338
	minimum_temperature = 323

/datum/chemical_reaction/turbo
	result = "turbo"
	required_reagents = list("steady" = 1, "adrenaline" = 1, "synaptizine" = 1)
	result_amount = 3
	maximum_temperature = 293
	minimum_temperature = 288

/datum/chemical_reaction/menace
	result = "menace"
	required_reagents = list("turbo" = 1, "boxer" = 1, "violence ultra" = 1)
	result_amount = 3
	maximum_temperature = 363
	minimum_temperature = 358

/datum/chemical_reaction/sanguinum
	result = "sanguinum"
	required_reagents = list("bicaridine" = 1, "spaceacillin" = 1, "mercury" = 1)
	result_amount = 3

/datum/chemical_reaction/nosfernium // yes I'm aware of the cancer that the mix is. Its meant to be annoying for reasons.
	result = "nosfernium" // reagent/drug
	required_reagents = list("sanguinum" = 27, "bicaridine" = 34, "milk" = 1, "iron" = 29, "lithium" = 16, "sugar" = 8)
	catalysts = list("plasma" = 21)
	result_amount = 1
	byproducts= list("viroputine" = 1) // reagent/other
	minimum_temperature = 358
	maximum_temperature = 373

/datum/chemical_reaction/nosfernium2
	result = "nosfernium" // reagent/drug
	required_reagents = list("viroputine" = 1, "nosfernium" = 1, "milk" = 5, "blood" = 5)
	result_amount = 2
	byproducts= list("viroputine" = 1) // reagent/other
	minimum_temperature = 358
	maximum_temperature = 373

/datum/chemical_reaction/kyphotorin
	result = "kyphotorin"
	required_reagents = list("peridaxon" = 1, "mutagen" = 1, "cronexidone" = 1)
	result_amount = 3

/*
/datum/chemical_reaction/vomitol
	result = "vomitol"
	required_reagents = list("carbon" = 1, "sugar" = 1, "acetone" = 1)
	result_amount = 3
*/

/datum/chemical_reaction/arectine
	result = "arectine"
	required_reagents = list("ethanol" = 1, "anti_toxin" = 1, "fuel" = 1)
	result_amount = 3

/datum/chemical_reaction/quickclot
	result = "quickclot"
	required_reagents = list("kelotane" = 1, "cronexidone" = 1)
	result_amount = 2
	catalysts = list("plasma" = 1)

/datum/chemical_reaction/ossisine
	result = "ossisine"
	required_reagents = list("stoxin" = 1, "cronexidone" = 1, "bicaridine" = 1)
	result_amount = 3

/datum/chemical_reaction/instant_ice
	result = "instant_ice"
	required_reagents = list("hydrazine" = 1, "acetone" = 1, "sodiumchloride" = 1)
	result_amount = 3

/datum/chemical_reaction/instant_ice_with_water
	result = "water"
	supports_decomposition_by_electrolysis = FALSE
	required_reagents = list("instant_ice" = 3, "water" = 3)
	result_amount = 4

/datum/chemical_reaction/instant_ice_with_water/on_reaction(datum/reagents/holder, var/created_volume)
	..()
	holder.chem_temp = max(223, holder.chem_temp - abs(holder.chem_temp - 223) * created_volume/holder.total_volume) // if someone actually wants to do some physics here they are welcome
	return 0

/datum/chemical_reaction/detox
	result = "detox"
	required_reagents = list("serotrotium" = 1, "inaprovaline" = 3)
	result_amount = 4
	maximum_temperature = INFINITY
	minimum_temperature = 363

/datum/chemical_reaction/polystem
	result = "polystem"
	required_reagents = list("pacid" = 1, "iron" = 1, "potassium" = 3)
	result_amount = 5
	maximum_temperature = 168
	minimum_temperature = 124

/datum/chemical_reaction/purger
	result = "purger"
	required_reagents = list("mindbreaker" = 1, "anti_toxin" = 3)
	result_amount = 4
	maximum_temperature = INFINITY
	minimum_temperature = 363

/datum/chemical_reaction/addictol
	result = "addictol"
	required_reagents = list("mercury" = 2, "purger" = 2, "impedrezene" = 2)
	result_amount = 3

/datum/chemical_reaction/aminazine
	result = "aminazine"
	required_reagents = list("purger" = 1, "alkysine" = 1)
	result_amount = 2

/datum/chemical_reaction/haloperidol
	result = "haloperidol"
	required_reagents = list("anti_toxin" = 2, "leporazine" = 1)
	result_amount = 3
	maximum_temperature = 340
	minimum_temperature = 290

/datum/chemical_reaction/ethanol
	result = "ethanol"
	required_reagents = list("water" = 3, "sugar" = 1)
	result_amount = 4
	catalysts = list("enzyme" = 5)
	maximum_temperature = INFINITY
	minimum_temperature = 363

/datum/chemical_reaction/adrenaline
	result = "adrenaline"
	required_reagents = list("blood" = 3, "dexalin" = 1)
	result_amount = 4
	maximum_temperature = INFINITY
	minimum_temperature = 373

/datum/chemical_reaction/carbon
	result = "carbon"
	required_reagents = list("woodpulp" = 3)
	inhibitors = list("water" = 1) // So that we can make ghetto cardboard
	result_amount = 2
	maximum_temperature = INFINITY
	minimum_temperature = 373

/datum/chemical_reaction/cyanide
	result = "cyanide"
	required_reagents = list("toxin" = 5, "mindbreaker" = 3, "fuhrerole" = 2)
	result_amount = 2
	maximum_temperature = 33
	minimum_temperature = 10

/datum/chemical_reaction/serotrotium
	result = "serotrotium"
	required_reagents = list("blood" = 5, "psilocybin" = 1)
	catalysts = list("nutriment" = 5)
	result_amount = 4
	maximum_temperature = 273
	minimum_temperature = 203

/datum/chemical_reaction/oil
	result = "oil"
	required_reagents = list("fuel" = 1, "carbon" = 1, "ethanol" = 1)
	result_amount = 3
	maximum_temperature = INFINITY
	minimum_temperature = 480

/datum/chemical_reaction/plasticide
	result = "plasticide"
	required_reagents = list("oil" = 1, "ethanol" = 1, "silicon" = 1)
	result_amount = 3
	maximum_temperature = 270
	minimum_temperature = 0

/datum/chemical_reaction/rejuvenating_agent
	result = "rejuvenating_agent"
	required_reagents = list("cleaner" = 2, "pacid" = 1, "sulfur" = 1)
	result_amount = 2

/datum/chemical_reaction/glue
	result = "glue"
	required_reagents = list("plasticide" = 1, "ethanol" = 1, "carbon" = 1)
	result_amount = 3
	maximum_temperature = INFINITY
	minimum_temperature = 363

/datum/chemical_reaction/combat
	result = "chemweapon1"
	required_reagents = list("hydrazine" = 1, "cyanide" = 1, "potassium_chloride" = 1, "lexorin" = 1)
	result_amount = 2

/datum/chemical_reaction/sterilizer
	result = "sterilizer"
	required_reagents = list("dermaline" = 1, "sodium" = 1, "sterilizine" = 1)
	result_amount = 3
	catalysts = list("cronexidone" = 5)

/datum/chemical_reaction/sterilizer_crystal
	result = null
	required_reagents = list("sterilizer" = 20, "sulfur" = 20, "tungsten" = 20)
	result_amount = 1
	maximum_temperature = 40
	minimum_temperature = 0
	blacklist_containers = list(/mob, /obj/machinery/microwave)

/datum/chemical_reaction/sterilizer_crystal/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= created_volume, i++)
		new /obj/item/stack/sterilizer_crystal(location)

/datum/chemical_reaction/reviver
	result = "reviver"
	required_reagents = list("dermaline" = 1, "cronexidone" = 1, "sterilizine" = 1, "aminazine" = 1, "serotrotium" = 1, "polystem" = 1, "paroxetine" = 1,"rezadone" = 1,"spaceacillin" = 1,"rejuvenating_agent" = 1,"cordradaxon" = 1,"carthatoline" = 1,"dexalinp" = 1)
	result_amount = 1
	catalysts = list("honey" = 5)

/datum/chemical_reaction/suppressital
	result = "suppressital"
	required_reagents = list("blood" = 1, "citalopram" = 1)
	result_amount = 2
	maximum_temperature = 12.7
	minimum_temperature = 7.7

/datum/chemical_reaction/mindwipe
	result = "mindwipe"
	required_reagents = list("mindbreaker" = 1, "psilocybin" = 1, "sanguinum" = 1 , "anti_toxin" = 1, "ethanol" = 1)
	result_amount = 5

/datum/chemical_reaction/ctincture
	result = "ctincture"
	required_reagents = list("vodka" = 10, "concentrated-carpotoxin" = 1)
	result_amount = 10

/datum/chemical_reaction/nutriment_1
	result = "nutriment"
	required_reagents = list("bicaridine" = 1, "monocaridine" = 1)
	result_amount = 2

/datum/chemical_reaction/nutriment_2
	result = "nutriment"
	required_reagents = list("dexalin" = 1, "quintalin" = 1)
	result_amount = 2

/datum/chemical_reaction/nutriment_3
	result = "nutriment"
	required_reagents = list("dexalinp" = 1, "quintalin" = 1)
	result_amount = 2

/datum/chemical_reaction/nutriment_4
	result = "nutriment"
	required_reagents = list("moon water" = 1, "kelotane" = 1)
	result_amount = 2

/datum/chemical_reaction/nutriment_5
	result = "nutriment"
	required_reagents = list("moon water" = 1, "dermaline" = 1)
	result_amount = 2

/datum/chemical_reaction/nutriment_6
	result = "nutriment"
	required_reagents = list("anti_toxin" = 1, "lg_anti_toxin" = 1)
	result_amount = 2

/* FBP "medicine" */

/datum/chemical_reaction/fbp_repair
	result = "fbp_repair"
	required_reagents = list("nanites" = 1, "silicon" = 1)
	result_amount = 2

/* Uncomment when CE_MECH_REPLENISH has a use
/datum/chemical_reaction/fbp_replenish
	result = "fbp_replenish"
	required_reagents = list("nanites" = 1, "oil" = 1)
	result_amount = 2
*/

