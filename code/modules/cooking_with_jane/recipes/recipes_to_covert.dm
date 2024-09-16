

/datum/recipe/dumplings
	fruit = list("cabbage" = 1) // A recipe that ACTUALLY uses cabbage.
	reagents = list("soysauce" = 5, "sodiumchloride" = 1, "blackpepper" = 1, "cornoil" = 1) // No sesame oil, corn will have to do.
	items = list(
		/obj/item/reagent_containers/food/snacks/rawbacon,
		/obj/item/reagent_containers/food/snacks/rawbacon, // Substitute for minced pork.
		/obj/item/reagent_containers/food/snacks/doughslice,
	)
	result = /obj/item/reagent_containers/food/snacks/dumplings

/datum/recipe/humanburger
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/human,
		/obj/item/reagent_containers/food/snacks/bun
	)
	result = /obj/item/reagent_containers/food/snacks/human/burger

/datum/recipe/syntiburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh
	)
	result = /obj/item/reagent_containers/food/snacks/monkeyburger

/datum/recipe/brainburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/organ/internal/vital/brain
	)
	result = /obj/item/reagent_containers/food/snacks/brainburger

/datum/recipe/roburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/robot_parts/head
	)
	result = /obj/item/reagent_containers/food/snacks/roburger

/datum/recipe/xenoburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/meat/xenomeat
	)
	result = /obj/item/reagent_containers/food/snacks/xenoburger

/datum/recipe/fishburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/meat/carp
	)
	result = /obj/item/reagent_containers/food/snacks/fishburger

/datum/recipe/tofuburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/tofu
	)
	result = /obj/item/reagent_containers/food/snacks/tofuburger

/datum/recipe/clownburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/clothing/mask/costume/job/clown
	)
	result = /obj/item/reagent_containers/food/snacks/clownburger

/datum/recipe/mimeburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/clothing/head/beret
	)
	result = /obj/item/reagent_containers/food/snacks/mimeburger

/datum/recipe/muffinegg
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/friedegg,
		/obj/item/reagent_containers/food/snacks/bacon,
	)
	result = /obj/item/reagent_containers/food/snacks/muffinegg

/datum/recipe/baconburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/patty,
		/obj/item/reagent_containers/food/snacks/bacon,
	)
	result = /obj/item/reagent_containers/food/snacks/baconburger

/datum/recipe/chickenburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/friedchikin,
	)
	result = /obj/item/reagent_containers/food/snacks/chickenburger

/datum/recipe/kampferburger
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/roachmeat,
		/obj/item/reagent_containers/food/snacks/bun
	)
	result = /obj/item/reagent_containers/food/snacks/kampferburger

/datum/recipe/panzerburger
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/panzer,
		/obj/item/reagent_containers/food/snacks/bun
	)
	result = /obj/item/reagent_containers/food/snacks/panzerburger

/datum/recipe/jagerburger
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/jager,
		/obj/item/reagent_containers/food/snacks/bun
	)
	result = /obj/item/reagent_containers/food/snacks/jagerburger

/datum/recipe/seucheburger
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/seuche,
		/obj/item/reagent_containers/food/snacks/bun
	)
	result = /obj/item/reagent_containers/food/snacks/seucheburger

/datum/recipe/bigroachburger
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/roachmeat,
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/seuche,
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/panzer,
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/jager,
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/egg
	)
	result = /obj/item/reagent_containers/food/snacks/bigroachburger

/datum/recipe/fuhrerburger
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/fuhrer,
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/fuhrer,
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/egg
	)
	result = /obj/item/reagent_containers/food/snacks/fuhrerburger

/datum/recipe/kaiserburger
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/kaiser,
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/kaiser,
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/egg
	)
	result = /obj/item/reagent_containers/food/snacks/kaiserburger

/datum/recipe/donkpocket
	items = list(
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/meatball
	)
	result = /obj/item/reagent_containers/food/snacks/donkpocket //SPECIAL
	proc/warm_up(var/obj/item/reagent_containers/food/snacks/donkpocket/being_cooked)
		being_cooked.heat()
	make_food(var/obj/container as obj)
		var/obj/item/reagent_containers/food/snacks/donkpocket/being_cooked = ..(container)
		warm_up(being_cooked)
		return being_cooked

/datum/recipe/donkpocket/warm
	reagents = list() //This is necessary since this is a child object of the above recipe and we don't want donk pockets to need flour
	items = list(
		/obj/item/reagent_containers/food/snacks/donkpocket
	)
	result = /obj/item/reagent_containers/food/snacks/donkpocket //SPECIAL
	make_food(var/obj/container as obj)
		var/obj/item/reagent_containers/food/snacks/donkpocket/being_cooked = locate() in container
		if(being_cooked && !being_cooked.warm)
			warm_up(being_cooked)
		return being_cooked

/datum/recipe/syntibread
	items = list(
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh,
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh,
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/meatbread

/datum/recipe/xenomeatbread
	items = list(
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/meat/xenomeat,
		/obj/item/reagent_containers/food/snacks/meat/xenomeat,
		/obj/item/reagent_containers/food/snacks/meat/xenomeat,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/xenomeatbread

/datum/recipe/soylenviridians
	fruit = list("soybeans" = 1)
	reagents = list("flour" = 10)
	result = /obj/item/reagent_containers/food/snacks/soylenviridians

/datum/recipe/soylentgreen
	reagents = list("flour" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/human,
		/obj/item/reagent_containers/food/snacks/meat/human
	)
	result = /obj/item/reagent_containers/food/snacks/soylentgreen

/datum/recipe/humankabob
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/food/snacks/meat/human,
		/obj/item/reagent_containers/food/snacks/meat/human,
	)
	result = /obj/item/reagent_containers/food/snacks/human/kabob

/datum/recipe/monkeykabob
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/food/snacks/meat/monkey,
		/obj/item/reagent_containers/food/snacks/meat/monkey,
	)
	result = /obj/item/reagent_containers/food/snacks/monkeykabob

/datum/recipe/syntikabob
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh,
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh,
	)
	result = /obj/item/reagent_containers/food/snacks/monkeykabob

/datum/recipe/tofukabob
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/food/snacks/tofu,
		/obj/item/reagent_containers/food/snacks/tofu,
	)
	result = /obj/item/reagent_containers/food/snacks/tofukabob

/datum/recipe/tofubread
	items = list(
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/tofu,
		/obj/item/reagent_containers/food/snacks/tofu,
		/obj/item/reagent_containers/food/snacks/tofu,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/tofubread



/datum/recipe/cubancarp
	fruit = list("chili" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/meat/carp
	)
	result = /obj/item/reagent_containers/food/snacks/cubancarp

/datum/recipe/fortunecookie
	reagents = list("sugar" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice,
		/obj/item/paper,
	)
	result = /obj/item/reagent_containers/food/snacks/fortunecookie
	make_food(var/obj/container as obj)
		var/obj/item/paper/paper = locate() in container
		paper.loc = null //prevent deletion
		var/obj/item/reagent_containers/food/snacks/fortunecookie/being_cooked = ..(container)
		paper.loc = being_cooked
		being_cooked.trash = paper //so the paper is left behind as trash without special-snowflake(TM Nodrak) code ~carn
		return being_cooked
	check_items(var/obj/container as obj)
		. = ..()
		if (.)
			var/obj/item/paper/paper = locate() in container
			if (!paper || !paper.info)
				return 0
		return .


/datum/recipe/syntisteak
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/meat/syntiflesh)
	result = /obj/item/reagent_containers/food/snacks/meatsteak

/datum/recipe/tonkatsu
	reagents = list("sodiumchloride" = 1, "flour" = 5, "egg" = 3, "cornoil" = 2)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/pork,
	)
	result = /obj/item/reagent_containers/food/snacks/tonkatsu

/datum/recipe/spacylibertyduff
	reagents = list("water" = 5, "vodka" = 5, "psilocybin" = 5)
	result = /obj/item/reagent_containers/food/snacks/spacylibertyduff

/datum/recipe/amanitajelly
	reagents = list("water" = 5, "vodka" = 5, "amatoxin" = 5)
	result = /obj/item/reagent_containers/food/snacks/amanitajelly
	make_food(var/obj/container as obj)
		var/obj/item/reagent_containers/food/snacks/amanitajelly/being_cooked = ..(container)
		being_cooked.reagents.del_reagent("amatoxin")
		return being_cooked

/datum/recipe/candy_corn
	reagents = list("sugar" = 5, "cornoil" = 5)
	result= /obj/item/reagent_containers/food/snacks/candy_corn

/datum/recipe/bigbiteburger
	items = list(
		/obj/item/reagent_containers/food/snacks/monkeyburger,
		/obj/item/reagent_containers/food/snacks/patty,
		/obj/item/reagent_containers/food/snacks/patty,
		/obj/item/reagent_containers/food/snacks/friedegg,
	)
	result = /obj/item/reagent_containers/food/snacks/bigbiteburger

/datum/recipe/enchiladas
	fruit = list("chili" = 2, "corn" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/cutlet)
	result = /obj/item/reagent_containers/food/snacks/enchiladas

/datum/recipe/creamcheesebread
	items = list(
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/creamcheesebread

/datum/recipe/monkeysdelight
	fruit = list("banana" = 1)
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1, "flour" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/monkeycube
	)
	result = /obj/item/reagent_containers/food/snacks/monkeysdelight

/datum/recipe/fishandchips
	items = list(
		/obj/item/reagent_containers/food/snacks/fries,
		/obj/item/reagent_containers/food/snacks/fishfingers,
	)
	result = /obj/item/reagent_containers/food/snacks/fishandchips

/datum/recipe/katsudon
	reagents = list("egg" = 3, "soysauce" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/boiledrice,
		/obj/item/reagent_containers/food/snacks/tonkatsu,
		)
	result = /obj/item/reagent_containers/food/snacks/katsudon

/datum/recipe/superbiteburger
	fruit = list("tomato" = 1)
	reagents = list("sodiumchloride" = 5, "blackpepper" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bigbiteburger,
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/patty,
		/obj/item/reagent_containers/food/snacks/patty,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/bacon,
	)
	result = /obj/item/reagent_containers/food/snacks/superbiteburger

/datum/recipe/slimeburger
	reagents = list("slimejelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bun
	)
	result = /obj/item/reagent_containers/food/snacks/jellyburger/slime

/datum/recipe/jellyburger
	reagents = list("cherryjelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bun
	)
	result = /obj/item/reagent_containers/food/snacks/jellyburger/cherry

/datum/recipe/sausage
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/rawmeatball,
		/obj/item/reagent_containers/food/snacks/rawbacon,
	)
	result = /obj/item/reagent_containers/food/snacks/sausage

/datum/recipe/fishfingers
	reagents = list("flour" = 5, "egg" = 3, "cornoil" = 2)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/carp,
	)
	result = /obj/item/reagent_containers/food/snacks/fishfingers

/datum/recipe/tofurkey
	items = list(
		/obj/item/reagent_containers/food/snacks/tofu,
		/obj/item/reagent_containers/food/snacks/tofu,
		/obj/item/reagent_containers/food/snacks/stuffing,
	)
	result = /obj/item/reagent_containers/food/snacks/tofurkey

/datum/recipe/honey_bun
	reagents = list("sugar" = 3, "honey" = 5, "cream" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/butterslice,
	)
	result = /obj/item/reagent_containers/food/snacks/honeybuns

/datum/recipe/honey_pudding
	reagents = list("sugar" = 3, "honey" = 15, "cream" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/chocolatebar,
	)
	result = /obj/item/reagent_containers/food/snacks/honeypudding

//////////////////////////////////////////
// bs12 food port stuff
//////////////////////////////////////////

/datum/recipe/mint
	reagents = list("sugar" = 5, "frostoil" = 5)
	result = /obj/item/reagent_containers/food/snacks/mint

//Roach cubes

/datum/recipe/cube/
	fruit = list("potato" = 1)
	reagents = list("protein" = 15, "egg" = 3)
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat)
	result = /obj/item/reagent_containers/food/snacks/cube/roach

/datum/recipe/cube/fuhrer
	fruit = list("potato" = 2)
	reagents = list("protein" = 25, "fuhrerole" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/fuhrer,
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/fuhrer,
	)
	result = /obj/item/reagent_containers/food/snacks/cube/roach/fuhrer

/datum/recipe/cube/jager
	fruit = list("potato" = 1)
	reagents = list("protein" = 10, "blattedin" = 5)
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat/jager)
	result = /obj/item/reagent_containers/food/snacks/cube/roach/jager

/datum/recipe/cube/kraftwerk
	fruit = list("potato" = 1)
	reagents = list("protein" = 10, "gewaltine" = 5)
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat/kraftwerk)
	result = /obj/item/reagent_containers/food/snacks/cube/roach/kraftwerk

/datum/recipe/cube/elektromagnetisch
	fruit = list("potato" = 1)
	reagents = list("protein" = 10, "iron" = 5)
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat/elektromagnetisch)
	result = /obj/item/reagent_containers/food/snacks/cube/roach/elektromagnetisch

/datum/recipe/cube/glowing
	fruit = list("potato" = 1)
	reagents = list("protein" = 10, MATERIAL_URANIUM = 5)
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat/glowing)
	result = /obj/item/reagent_containers/food/snacks/meat/roachmeat/glowing

/datum/recipe/cube/roachling
	fruit = list("potato" = 1)
	reagents = list("protein" = 5, "seligitillin" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat)
	result = /obj/item/reagent_containers/food/snacks/cube/roach/roachling

/datum/recipe/cube/seuche
	fruit = list("potato" = 1)
	reagents = list("protein" = 10, "diplopterum" = 5)
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat/seuche)
	result = /obj/item/reagent_containers/food/snacks/cube/roach/seuche

/datum/recipe/cube/panzer
	fruit = list("potato" = 1)
	reagents = list("protein" = 20, "starkellin" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/panzer,
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/panzer,
	)
	result = /obj/item/reagent_containers/food/snacks/cube/roach/panzer

/datum/recipe/cube/gestrahlte
	fruit = list("potato" = 1)
	reagents = list("protein" = 10, "toxin" = 5)
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat)
	result = /obj/item/reagent_containers/food/snacks/cube/roach/grestrahlte
