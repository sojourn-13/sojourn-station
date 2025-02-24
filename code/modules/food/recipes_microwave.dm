
// see code/datums/recipe.dm


/* No telebacon. just no...
/datum/recipe/telebacon
	items = list(
		/obj/item/reagent_containers/snacks/meat,
		/obj/item/device/assembly/signaler
	)
	result = /obj/item/reagent_containers/snacks/telebacon

I said no!
/datum/recipe/syntitelebacon
	items = list(
		/obj/item/reagent_containers/snacks/meat/syntiflesh,
		/obj/item/device/assembly/signaler
	)
	result = /obj/item/reagent_containers/snacks/telebacon
*/

/datum/recipe/friedegg
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1, "cornoil" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/egg
	)
	result = /obj/item/reagent_containers/snacks/friedegg

/datum/recipe/boiledegg
	reagents = list("water" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/egg
	)
	result = /obj/item/reagent_containers/snacks/boiledegg

/datum/recipe/jellydonut
	reagents = list("berryjuice" = 5, "sugar" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/dough
	)
	result = /obj/item/reagent_containers/snacks/donut/jelly

/datum/recipe/jellydonut/slime
	reagents = list("slimejelly" = 5, "sugar" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/dough
	)
	result = /obj/item/reagent_containers/snacks/donut/slimejelly

/datum/recipe/jellydonut/cherry
	reagents = list("cherryjelly" = 5, "sugar" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/dough
	)
	result = /obj/item/reagent_containers/snacks/donut/cherryjelly

/datum/recipe/donut
	reagents = list("sugar" = 5, "cornoil" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/dough
	)
	result = /obj/item/reagent_containers/snacks/donut/normal

/datum/recipe/medialuna
	reagents = list("sugar" = 5, "milk" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/doughslice,
		/obj/item/reagent_containers/snacks/butterslice,
	)
	result = /obj/item/reagent_containers/snacks/medialuna

/datum/recipe/dumplings
	fruit = list("cabbage" = 1) // A recipe that ACTUALLY uses cabbage.
	reagents = list("soysauce" = 5, "sodiumchloride" = 1, "blackpepper" = 1, "cornoil" = 1) // No sesame oil, corn will have to do.
	items = list(
		/obj/item/reagent_containers/snacks/rawbacon,
		/obj/item/reagent_containers/snacks/rawbacon, // Substitute for minced pork.
		/obj/item/reagent_containers/snacks/doughslice,
	)
	result = /obj/item/reagent_containers/snacks/dumplings

/datum/recipe/frenchtoast
	reagents = list("egg" = 3, "milk" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/breadslice
	)
	result = /obj/item/reagent_containers/snacks/frenchtoast

/datum/recipe/humanburger
	items = list(
		/obj/item/reagent_containers/snacks/meat/human,
		/obj/item/reagent_containers/snacks/bun
	)
	result = /obj/item/reagent_containers/snacks/human/burger

/datum/recipe/plainburger
	items = list(
		/obj/item/reagent_containers/snacks/bun,
		/obj/item/reagent_containers/snacks/patty, // Should no longer conflict with every other quirky burger recipe. - Seb
	)
	result = /obj/item/reagent_containers/snacks/monkeyburger

/datum/recipe/syntiburger
	items = list(
		/obj/item/reagent_containers/snacks/bun,
		/obj/item/reagent_containers/snacks/meat/syntiflesh
	)
	result = /obj/item/reagent_containers/snacks/monkeyburger

/datum/recipe/brainburger
	items = list(
		/obj/item/reagent_containers/snacks/bun,
		/obj/item/organ/internal/vital/brain
	)
	result = /obj/item/reagent_containers/snacks/brainburger

/datum/recipe/roburger
	items = list(
		/obj/item/reagent_containers/snacks/bun,
		/obj/item/robot_parts/head
	)
	result = /obj/item/reagent_containers/snacks/roburger

/datum/recipe/xenoburger
	items = list(
		/obj/item/reagent_containers/snacks/bun,
		/obj/item/reagent_containers/snacks/meat/xenomeat
	)
	result = /obj/item/reagent_containers/snacks/xenoburger

/datum/recipe/fishburger
	items = list(
		/obj/item/reagent_containers/snacks/bun,
		/obj/item/reagent_containers/snacks/meat/carp
	)
	result = /obj/item/reagent_containers/snacks/fishburger

/datum/recipe/tofuburger
	items = list(
		/obj/item/reagent_containers/snacks/bun,
		/obj/item/reagent_containers/snacks/tofu
	)
	result = /obj/item/reagent_containers/snacks/tofuburger

/datum/recipe/clownburger
	items = list(
		/obj/item/reagent_containers/snacks/bun,
		/obj/item/clothing/mask/costume/job/clown
	)
	result = /obj/item/reagent_containers/snacks/clownburger

/datum/recipe/mimeburger
	items = list(
		/obj/item/reagent_containers/snacks/bun,
		/obj/item/clothing/head/beret
	)
	result = /obj/item/reagent_containers/snacks/mimeburger

/datum/recipe/muffinegg
	items = list(
		/obj/item/reagent_containers/snacks/bun,
		/obj/item/reagent_containers/snacks/friedegg,
		/obj/item/reagent_containers/snacks/bacon,
	)
	result = /obj/item/reagent_containers/snacks/muffinegg

/datum/recipe/baconburger
	items = list(
		/obj/item/reagent_containers/snacks/bun,
		/obj/item/reagent_containers/snacks/patty,
		/obj/item/reagent_containers/snacks/bacon,
	)
	result = /obj/item/reagent_containers/snacks/baconburger

/datum/recipe/chickenburger
	items = list(
		/obj/item/reagent_containers/snacks/bun,
		/obj/item/reagent_containers/snacks/friedchikin,
	)
	result = /obj/item/reagent_containers/snacks/chickenburger

/datum/recipe/kampferburger
	items = list(
		/obj/item/reagent_containers/snacks/meat/roachmeat,
		/obj/item/reagent_containers/snacks/bun
	)
	result = /obj/item/reagent_containers/snacks/kampferburger

/datum/recipe/panzerburger
	items = list(
		/obj/item/reagent_containers/snacks/meat/roachmeat/panzer,
		/obj/item/reagent_containers/snacks/bun
	)
	result = /obj/item/reagent_containers/snacks/panzerburger

/datum/recipe/jagerburger
	items = list(
		/obj/item/reagent_containers/snacks/meat/roachmeat/jager,
		/obj/item/reagent_containers/snacks/bun
	)
	result = /obj/item/reagent_containers/snacks/jagerburger

/datum/recipe/seucheburger
	items = list(
		/obj/item/reagent_containers/snacks/meat/roachmeat/seuche,
		/obj/item/reagent_containers/snacks/bun
	)
	result = /obj/item/reagent_containers/snacks/seucheburger

/datum/recipe/bigroachburger
	items = list(
		/obj/item/reagent_containers/snacks/meat/roachmeat,
		/obj/item/reagent_containers/snacks/meat/roachmeat/seuche,
		/obj/item/reagent_containers/snacks/meat/roachmeat/panzer,
		/obj/item/reagent_containers/snacks/meat/roachmeat/jager,
		/obj/item/reagent_containers/snacks/bun,
		/obj/item/reagent_containers/snacks/egg
	)
	result = /obj/item/reagent_containers/snacks/bigroachburger

/datum/recipe/fuhrerburger
	items = list(
		/obj/item/reagent_containers/snacks/meat/roachmeat/fuhrer,
		/obj/item/reagent_containers/snacks/meat/roachmeat/fuhrer,
		/obj/item/reagent_containers/snacks/bun,
		/obj/item/reagent_containers/snacks/egg
	)
	result = /obj/item/reagent_containers/snacks/fuhrerburger

/datum/recipe/kaiserburger
	items = list(
		/obj/item/reagent_containers/snacks/meat/roachmeat/kaiser,
		/obj/item/reagent_containers/snacks/meat/roachmeat/kaiser,
		/obj/item/reagent_containers/snacks/bun,
		/obj/item/reagent_containers/snacks/egg
	)
	result = /obj/item/reagent_containers/snacks/kaiserburger

/datum/recipe/hotdog
	items = list(
		/obj/item/reagent_containers/snacks/bun,
		/obj/item/reagent_containers/snacks/sausage
	)
	result = /obj/item/reagent_containers/snacks/hotdog

/datum/recipe/waffles
	reagents = list("sugar" = 5, "milk" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/doughslice,
	)
	result = /obj/item/reagent_containers/snacks/waffles

/datum/recipe/pancakes
	reagents = list("sugar" = 10, "milk" = 5, "flour" = 5) // More sugar for the syrup
	items = list(/obj/item/reagent_containers/snacks/butterslice)
	result = /obj/item/reagent_containers/snacks/pancakes

/datum/recipe/donkpocket
	items = list(
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/meatball
	)
	result = /obj/item/reagent_containers/snacks/donkpocket //SPECIAL
	proc/warm_up(var/obj/item/reagent_containers/snacks/donkpocket/being_cooked)
		being_cooked.heat()
	make_food(var/obj/container as obj)
		var/obj/item/reagent_containers/snacks/donkpocket/being_cooked = ..(container)
		warm_up(being_cooked)
		return being_cooked

/datum/recipe/donkpocket/warm
	reagents = list() //This is necessary since this is a child object of the above recipe and we don't want donk pockets to need flour
	items = list(
		/obj/item/reagent_containers/snacks/donkpocket
	)
	result = /obj/item/reagent_containers/snacks/donkpocket //SPECIAL
	make_food(var/obj/container as obj)
		var/obj/item/reagent_containers/snacks/donkpocket/being_cooked = locate() in container
		if(being_cooked && !being_cooked.warm)
			warm_up(being_cooked)
		return being_cooked

/datum/recipe/meatbread
	items = list(
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/meat,
		/obj/item/reagent_containers/snacks/meat,
		/obj/item/reagent_containers/snacks/meat,
		/obj/item/reagent_containers/snacks/cheesewedge,
		/obj/item/reagent_containers/snacks/cheesewedge,
		/obj/item/reagent_containers/snacks/cheesewedge,
	)
	result = /obj/item/reagent_containers/snacks/meatbread

/datum/recipe/syntibread
	items = list(
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/meat/syntiflesh,
		/obj/item/reagent_containers/snacks/meat/syntiflesh,
		/obj/item/reagent_containers/snacks/meat/syntiflesh,
		/obj/item/reagent_containers/snacks/cheesewedge,
		/obj/item/reagent_containers/snacks/cheesewedge,
		/obj/item/reagent_containers/snacks/cheesewedge,
	)
	result = /obj/item/reagent_containers/snacks/meatbread

/datum/recipe/xenomeatbread
	items = list(
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/meat/xenomeat,
		/obj/item/reagent_containers/snacks/meat/xenomeat,
		/obj/item/reagent_containers/snacks/meat/xenomeat,
		/obj/item/reagent_containers/snacks/cheesewedge,
		/obj/item/reagent_containers/snacks/cheesewedge,
		/obj/item/reagent_containers/snacks/cheesewedge,
	)
	result = /obj/item/reagent_containers/snacks/xenomeatbread

/datum/recipe/bananabread
	fruit = list("banana" = 1)
	reagents = list("milk" = 5, "sugar" = 15)
	items = list(
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/dough
	)
	result = /obj/item/reagent_containers/snacks/bananabread

/datum/recipe/cinnamonroll
	reagents = list("cinnamonpowder" = 5, "sugar" = 10, "milk" = 5, "egg" = 3) // We have cinnamon now! Updating this recipe, thank you MikieRPG - Seb
	items = list(
		/obj/item/reagent_containers/snacks/doughslice,
		/obj/item/reagent_containers/snacks/butterslice,
		/obj/item/reagent_containers/snacks/cheesewedge, // For the frosting, same as 5u more of sugar
	)
	result = /obj/item/reagent_containers/snacks/cinnamonroll

/datum/recipe/omelette
	reagents = list("cornoil" = 2)
	items = list(
		/obj/item/reagent_containers/snacks/egg,
		/obj/item/reagent_containers/snacks/egg,
		/obj/item/reagent_containers/snacks/cheesewedge,
		/obj/item/reagent_containers/snacks/cheesewedge,
		/obj/item/reagent_containers/snacks/butterslice,
	)
	result = /obj/item/reagent_containers/snacks/omelette

/datum/recipe/muffin
	reagents = list("milk" = 5, "sugar" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/dough,
	)
	result = /obj/item/reagent_containers/snacks/muffin

/datum/recipe/eggplantparm
	fruit = list("eggplant" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/cheesewedge,
		/obj/item/reagent_containers/snacks/cheesewedge
		)
	result = /obj/item/reagent_containers/snacks/eggplantparm

/datum/recipe/soylenviridians
	fruit = list("soybeans" = 1)
	reagents = list("flour" = 10)
	result = /obj/item/reagent_containers/snacks/soylenviridians

/datum/recipe/soylentgreen
	reagents = list("flour" = 10)
	items = list(
		/obj/item/reagent_containers/snacks/meat/human,
		/obj/item/reagent_containers/snacks/meat/human
	)
	result = /obj/item/reagent_containers/snacks/soylentgreen

/datum/recipe/meatpie
	items = list(
		/obj/item/reagent_containers/snacks/flatdough,
		/obj/item/reagent_containers/snacks/meat,
	)
	result = /obj/item/reagent_containers/snacks/meatpie

/datum/recipe/tofupie
	items = list(
		/obj/item/reagent_containers/snacks/flatdough,
		/obj/item/reagent_containers/snacks/tofu,
	)
	result = /obj/item/reagent_containers/snacks/tofupie

/datum/recipe/xemeatpie
	items = list(
		/obj/item/reagent_containers/snacks/flatdough,
		/obj/item/reagent_containers/snacks/meat/xenomeat,
	)
	result = /obj/item/reagent_containers/snacks/xemeatpie

/datum/recipe/pie
	fruit = list("banana" = 1)
	reagents = list("sugar" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/flatdough,
		/obj/item/reagent_containers/snacks/butterslice,
		)
	result = /obj/item/reagent_containers/snacks/pie

/datum/recipe/cherrypie
	fruit = list("cherries" = 1)
	reagents = list("sugar" = 10)
	items = list(
		/obj/item/reagent_containers/snacks/flatdough,
		/obj/item/reagent_containers/snacks/butterslice,
	)
	result = /obj/item/reagent_containers/snacks/cherrypie

/datum/recipe/berryclafoutis
	fruit = list("berries" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/flatdough,
		/obj/item/reagent_containers/snacks/butterslice,
	)
	result = /obj/item/reagent_containers/snacks/berryclafoutis

/datum/recipe/wingfangchu
	reagents = list("soysauce" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/meat/xenomeat,
	)
	result = /obj/item/reagent_containers/snacks/wingfangchu

/datum/recipe/chaosdonut
	reagents = list("frostoil" = 5, "capsaicin" = 5, "sugar" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/dough
	)
	result = /obj/item/reagent_containers/snacks/donut/chaos

/datum/recipe/humankabob
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/snacks/meat/human,
		/obj/item/reagent_containers/snacks/meat/human,
	)
	result = /obj/item/reagent_containers/snacks/human/kabob

/datum/recipe/monkeykabob
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/snacks/meat/monkey,
		/obj/item/reagent_containers/snacks/meat/monkey,
	)
	result = /obj/item/reagent_containers/snacks/monkeykabob

/datum/recipe/syntikabob
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/snacks/meat/syntiflesh,
		/obj/item/reagent_containers/snacks/meat/syntiflesh,
	)
	result = /obj/item/reagent_containers/snacks/monkeykabob

/datum/recipe/tofukabob
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/snacks/tofu,
		/obj/item/reagent_containers/snacks/tofu,
	)
	result = /obj/item/reagent_containers/snacks/tofukabob

/datum/recipe/tofubread
	items = list(
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/tofu,
		/obj/item/reagent_containers/snacks/tofu,
		/obj/item/reagent_containers/snacks/tofu,
		/obj/item/reagent_containers/snacks/cheesewedge,
		/obj/item/reagent_containers/snacks/cheesewedge,
		/obj/item/reagent_containers/snacks/cheesewedge,
	)
	result = /obj/item/reagent_containers/snacks/tofubread

/datum/recipe/loadedbakedpotato
	fruit = list("potato" = 1)
	items = list(/obj/item/reagent_containers/snacks/cheesewedge)
	result = /obj/item/reagent_containers/snacks/loadedbakedpotato

/datum/recipe/cheesyfries
	items = list(
		/obj/item/reagent_containers/snacks/fries,
		/obj/item/reagent_containers/snacks/cheesewedge,
	)
	result = /obj/item/reagent_containers/snacks/cheesyfries

/datum/recipe/cubancarp
	fruit = list("chili" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/meat/carp
	)
	result = /obj/item/reagent_containers/snacks/cubancarp

/datum/recipe/popcorn
	reagents = list("cornoil" = 2)
	fruit = list("corn" = 1)
	items = list(/obj/item/reagent_containers/snacks/butterslice)
	result = /obj/item/reagent_containers/snacks/popcorn

/datum/recipe/cookie
	reagents = list("milk" = 5, "sugar" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/chocolatebar,
		/obj/item/reagent_containers/snacks/butterslice,
	)
	result = /obj/item/reagent_containers/snacks/cookie

/datum/recipe/fortunecookie
	reagents = list("sugar" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/doughslice,
		/obj/item/paper,
	)
	result = /obj/item/reagent_containers/snacks/fortunecookie
	make_food(var/obj/container as obj)
		var/obj/item/paper/paper = locate() in container
		paper.loc = null //prevent deletion
		var/obj/item/reagent_containers/snacks/fortunecookie/being_cooked = ..(container)
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

/datum/recipe/meatsteak
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1)
	items = list(/obj/item/reagent_containers/snacks/meat)
	result = /obj/item/reagent_containers/snacks/meatsteak

/datum/recipe/chickensteak
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1)
	items = list(/obj/item/reagent_containers/snacks/chickenbreast)
	result = /obj/item/reagent_containers/snacks/chickensteak

/datum/recipe/roastchicken
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1)
	items = list(/obj/item/reagent_containers/snacks/meat/chicken)
	result = /obj/item/reagent_containers/snacks/roastchicken

/datum/recipe/friedchicken
	reagents = list("cornoil" = 5, "sodiumchloride" = 1, "blackpepper" = 1, "flour" = 5)
	items = list(/obj/item/reagent_containers/snacks/chickenbreast)
	result = /obj/item/reagent_containers/snacks/friedchikin

/datum/recipe/porkchops
	reagents = list("bbqsauce" = 5, "sodiumchloride" = 1, "blackpepper" = 1)
	items = list(/obj/item/reagent_containers/snacks/meat/pork)
	result = /obj/item/reagent_containers/snacks/porkchops

/datum/recipe/patty
	items = list(/obj/item/reagent_containers/snacks/patty_raw)
	result = /obj/item/reagent_containers/snacks/patty

/datum/recipe/bacon // BACON? BACON.
	reagents = list("sodiumchloride" = 1, "cornoil" = 1)
	items = list(/obj/item/reagent_containers/snacks/rawbacon)
	result = /obj/item/reagent_containers/snacks/bacon

/datum/recipe/baconegg
	items = list(
		/obj/item/reagent_containers/snacks/bacon,
		/obj/item/reagent_containers/snacks/friedegg,
	)
	result = /obj/item/reagent_containers/snacks/baconeggs

/datum/recipe/benedict
	reagents = list("egg" = 3, "sodiumchloride" = 1, "blackpepper" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/butterslice,
		/obj/item/reagent_containers/snacks/breadslice,
		/obj/item/reagent_containers/snacks/bacon,
		/obj/item/reagent_containers/snacks/boiledegg
	)
	result = /obj/item/reagent_containers/snacks/benedict

/datum/recipe/syntisteak
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1)
	items = list(/obj/item/reagent_containers/snacks/meat/syntiflesh)
	result = /obj/item/reagent_containers/snacks/meatsteak

/datum/recipe/tonkatsu
	reagents = list("sodiumchloride" = 1, "flour" = 5, "egg" = 3, "cornoil" = 2)
	items = list(
		/obj/item/reagent_containers/snacks/meat/pork,
	)
	result = /obj/item/reagent_containers/snacks/tonkatsu

/datum/recipe/pizzamargherita
	fruit = list("tomato" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/flatdough,
		/obj/item/reagent_containers/snacks/cheesewedge,
		/obj/item/reagent_containers/snacks/cheesewedge,
		/obj/item/reagent_containers/snacks/cheesewedge,
		/obj/item/reagent_containers/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/snacks/pizza/margherita

/datum/recipe/meatpizza
	fruit = list("tomato" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/flatdough,
		/obj/item/reagent_containers/snacks/meat,
		/obj/item/reagent_containers/snacks/meat,
		/obj/item/reagent_containers/snacks/meat,
		/obj/item/reagent_containers/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/snacks/pizza/meatpizza

/datum/recipe/syntipizza
	fruit = list("tomato" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/flatdough,
		/obj/item/reagent_containers/snacks/meat/syntiflesh,
		/obj/item/reagent_containers/snacks/meat/syntiflesh,
		/obj/item/reagent_containers/snacks/meat/syntiflesh,
		/obj/item/reagent_containers/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/snacks/pizza/meatpizza

/datum/recipe/mushroompizza
	fruit = list("plumphelmet" = 5, "tomato" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/flatdough,
		/obj/item/reagent_containers/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/snacks/pizza/mushroompizza

/datum/recipe/vegetablepizza
	fruit = list("eggplant" = 1, "carrot" = 1, "corn" = 1, "tomato" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/flatdough,
		/obj/item/reagent_containers/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/snacks/pizza/vegetablepizza

/datum/recipe/hawaiianpizza
	fruit = list("pineapples" = 1, "tomato" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/flatdough,
		/obj/item/reagent_containers/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/snacks/pizza/hawaiianpizza

/datum/recipe/spacylibertyduff
	reagents = list("water" = 5, "vodka" = 5, "psilocybin" = 5)
	result = /obj/item/reagent_containers/snacks/spacylibertyduff

/datum/recipe/amanitajelly
	reagents = list("water" = 5, "vodka" = 5, "amatoxin" = 5)
	result = /obj/item/reagent_containers/snacks/amanitajelly
	make_food(var/obj/container as obj)
		var/obj/item/reagent_containers/snacks/amanitajelly/being_cooked = ..(container)
		being_cooked.reagents.del_reagent("amatoxin")
		return being_cooked

/datum/recipe/meatballsoup
	fruit = list("carrot" = 1, "potato" = 1)
	reagents = list("water" = 10)
	items = list(/obj/item/reagent_containers/snacks/meatball)
	result = /obj/item/reagent_containers/snacks/meatballsoup

/datum/recipe/vegetablesoup
	fruit = list("carrot" = 1, "potato" = 1, "corn" = 1, "eggplant" = 1)
	reagents = list("water" = 10)
	result = /obj/item/reagent_containers/snacks/vegetablesoup

/datum/recipe/nettlesoup
	fruit = list("nettle" = 1, "potato" = 1)
	reagents = list("water" = 10)
	items = list(
		/obj/item/reagent_containers/snacks/egg
	)
	result = /obj/item/reagent_containers/snacks/nettlesoup

/datum/recipe/wishsoup
	reagents = list("water" = 20)
	result= /obj/item/reagent_containers/snacks/wishsoup

/datum/recipe/candy_corn
	reagents = list("sugar" = 5, "cornoil" = 5)
	result= /obj/item/reagent_containers/snacks/candy_corn

/datum/recipe/hotchili
	fruit = list("chili" = 1, "tomato" = 1)
	items = list(/obj/item/reagent_containers/snacks/meat)
	result = /obj/item/reagent_containers/snacks/hotchili

/datum/recipe/coldchili
	fruit = list("icechili" = 1, "tomato" = 1)
	items = list(/obj/item/reagent_containers/snacks/meat)
	result = /obj/item/reagent_containers/snacks/coldchili

/datum/recipe/bearchili
	fruit = list("chili" = 1, "tomato" = 1)
	items = list(/obj/item/reagent_containers/snacks/meat/bearmeat)
	result = /obj/item/reagent_containers/snacks/bearchili

/datum/recipe/amanita_pie
	reagents = list("amatoxin" = 5)
	items = list(/obj/item/reagent_containers/snacks/flatdough)
	result = /obj/item/reagent_containers/snacks/amanita_pie

/datum/recipe/plump_pie
	fruit = list("plumphelmet" = 1)
	items = list(/obj/item/reagent_containers/snacks/flatdough)
	result = /obj/item/reagent_containers/snacks/plump_pie

/datum/recipe/bigbiteburger
	items = list(
		/obj/item/reagent_containers/snacks/monkeyburger,
		/obj/item/reagent_containers/snacks/patty,
		/obj/item/reagent_containers/snacks/patty,
		/obj/item/reagent_containers/snacks/friedegg,
	)
	result = /obj/item/reagent_containers/snacks/bigbiteburger

/datum/recipe/enchiladas
	fruit = list("chili" = 2, "corn" = 1)
	items = list(/obj/item/reagent_containers/snacks/cutlet)
	result = /obj/item/reagent_containers/snacks/enchiladas

/datum/recipe/creamcheesebread
	items = list(
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/cheesewedge,
		/obj/item/reagent_containers/snacks/cheesewedge,
	)
	result = /obj/item/reagent_containers/snacks/creamcheesebread

/datum/recipe/monkeysdelight
	fruit = list("banana" = 1)
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1, "flour" = 10)
	items = list(
		/obj/item/reagent_containers/snacks/monkeycube
	)
	result = /obj/item/reagent_containers/snacks/monkeysdelight

/datum/recipe/baguette
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/dough,
	)
	result = /obj/item/reagent_containers/snacks/baguette

/datum/recipe/fishandchips
	items = list(
		/obj/item/reagent_containers/snacks/fries,
		/obj/item/reagent_containers/snacks/fishfingers,
	)
	result = /obj/item/reagent_containers/snacks/fishandchips

/datum/recipe/sashimi // Ironically, this doesn't get cooked since it's raw fish
	reagents = list("soysauce" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/meat/carp,
		/obj/item/reagent_containers/snacks/meat/carp,
	)
	result = /obj/item/reagent_containers/snacks/sashimi

/datum/recipe/bread
	items = list(
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/egg
	)
	result = /obj/item/reagent_containers/snacks/bread

/datum/recipe/sandwich
	items = list(
		/obj/item/reagent_containers/snacks/meatsteak,
		/obj/item/reagent_containers/snacks/breadslice,
		/obj/item/reagent_containers/snacks/breadslice,
		/obj/item/reagent_containers/snacks/cheesewedge,
	)
	result = /obj/item/reagent_containers/snacks/sandwich

/datum/recipe/toastedsandwich
	items = list(
		/obj/item/reagent_containers/snacks/sandwich,
		/obj/item/reagent_containers/snacks/butterslice,
	)
	result = /obj/item/reagent_containers/snacks/toastedsandwich

/datum/recipe/grilledcheese
	items = list(
		/obj/item/reagent_containers/snacks/breadslice,
		/obj/item/reagent_containers/snacks/breadslice,
		/obj/item/reagent_containers/snacks/butterslice,
		/obj/item/reagent_containers/snacks/cheesewedge,
	)
	result = /obj/item/reagent_containers/snacks/grilledcheese

/datum/recipe/blt
	fruit = list("cabbage" = 1, "tomato" = 1) // As close as lettuce as it gets...
	items = list(
		/obj/item/reagent_containers/snacks/breadslice,
		/obj/item/reagent_containers/snacks/breadslice,
		/obj/item/reagent_containers/snacks/bacon,
	)
	result = /obj/item/reagent_containers/snacks/blt

/datum/recipe/tomatosoup
	fruit = list("tomato" = 2)
	reagents = list("water" = 10)
	result = /obj/item/reagent_containers/snacks/tomatosoup

/datum/recipe/rofflewaffles
	reagents = list("psilocybin" = 5, "sugar" = 10)
	items = list(
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/dough,
	)
	result = /obj/item/reagent_containers/snacks/rofflewaffles

/datum/recipe/stew
	fruit = list("potato" = 1, "tomato" = 1, "carrot" = 1, "plumphelmet" = 1) // No eggplant! Terrible!
	reagents = list("water" = 10)
	items = list(/obj/item/reagent_containers/snacks/meat)
	result = /obj/item/reagent_containers/snacks/stew

/datum/recipe/slimetoast
	reagents = list("slimejelly" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/breadslice,
	)
	result = /obj/item/reagent_containers/snacks/jelliedtoast/slime

/datum/recipe/jelliedtoast
	reagents = list("cherryjelly" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/breadslice,
	)
	result = /obj/item/reagent_containers/snacks/jelliedtoast/cherry

/datum/recipe/milosoup
	reagents = list("water" = 10)
	items = list(
		/obj/item/reagent_containers/snacks/soydope,
		/obj/item/reagent_containers/snacks/soydope,
		/obj/item/reagent_containers/snacks/tofu,
		/obj/item/reagent_containers/snacks/tofu,
	)
	result = /obj/item/reagent_containers/snacks/milosoup

/datum/recipe/stewedsoymeat
	fruit = list("carrot" = 1, "tomato" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/soydope,
		/obj/item/reagent_containers/snacks/soydope
	)
	result = /obj/item/reagent_containers/snacks/stewedsoymeat

/*/datum/recipe/spagetti We have the processor now
	items = list(
		/obj/item/reagent_containers/snacks/doughslice
	)
	result= /obj/item/reagent_containers/snacks/spagetti*/

/datum/recipe/boiledspagetti
	reagents = list("water" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/spagetti,
	)
	result = /obj/item/reagent_containers/snacks/boiledspagetti

/datum/recipe/boiledrice
	reagents = list("water" = 5, "rice" = 10)
	result = /obj/item/reagent_containers/snacks/boiledrice

/datum/recipe/ricepudding
	reagents = list("milk" = 5, "rice" = 10)
	result = /obj/item/reagent_containers/snacks/ricepudding

/datum/recipe/beefcurry
	fruit = list("chili" = 1, "carrot" = 1, "tomato" = 1)
	reagents = list("flour" = 5, "soysauce" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/meat,
		/obj/item/reagent_containers/snacks/butterslice,
		/obj/item/reagent_containers/snacks/boiledrice,
	)
	result = /obj/item/reagent_containers/snacks/beefcurry

/datum/recipe/chickencurry
	fruit = list("chili" = 1, "carrot" = 1, "tomato" = 1)
	reagents = list("flour" = 5, "soysauce" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/chickenbreast,
		/obj/item/reagent_containers/snacks/butterslice,
		/obj/item/reagent_containers/snacks/boiledrice,
	)
	result = /obj/item/reagent_containers/snacks/chickencurry

/datum/recipe/mashpotato
	reagents = list("milk" = 5)
	fruit = list("potato" = 2)
	items = list(/obj/item/reagent_containers/snacks/butterslice)
	result = /obj/item/reagent_containers/snacks/mashpotatoes

/datum/recipe/katsudon
	reagents = list("egg" = 3, "soysauce" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/boiledrice,
		/obj/item/reagent_containers/snacks/tonkatsu,
		)
	result = /obj/item/reagent_containers/snacks/katsudon

/datum/recipe/pastatomato
	fruit = list("tomato" = 2)
	reagents = list("water" = 5)
	items = list(/obj/item/reagent_containers/snacks/spagetti)
	result = /obj/item/reagent_containers/snacks/pastatomato

/datum/recipe/poppypretzel
	fruit = list("poppy" = 1)
	items = list(/obj/item/reagent_containers/snacks/dough)
	result = /obj/item/reagent_containers/snacks/poppypretzel

/datum/recipe/meatballspagetti
	reagents = list("water" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/spagetti,
		/obj/item/reagent_containers/snacks/meatball,
		/obj/item/reagent_containers/snacks/meatball,
	)
	result = /obj/item/reagent_containers/snacks/meatballspagetti

/datum/recipe/spesslaw
	reagents = list("water" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/spagetti,
		/obj/item/reagent_containers/snacks/meatball,
		/obj/item/reagent_containers/snacks/meatball,
		/obj/item/reagent_containers/snacks/meatball,
		/obj/item/reagent_containers/snacks/meatball,
	)
	result = /obj/item/reagent_containers/snacks/spesslaw

/datum/recipe/superbiteburger
	fruit = list("tomato" = 1)
	reagents = list("sodiumchloride" = 5, "blackpepper" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/bigbiteburger,
		/obj/item/reagent_containers/snacks/bun,
		/obj/item/reagent_containers/snacks/patty,
		/obj/item/reagent_containers/snacks/patty,
		/obj/item/reagent_containers/snacks/cheesewedge,
		/obj/item/reagent_containers/snacks/bacon,
	)
	result = /obj/item/reagent_containers/snacks/superbiteburger

/datum/recipe/candiedapple
	fruit = list("apple" = 1)
	reagents = list("water" = 5, "sugar" = 5)
	result = /obj/item/reagent_containers/snacks/candiedapple

/datum/recipe/applepie
	fruit = list("apple" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/flatdough,
		/obj/item/reagent_containers/snacks/butterslice,
	)
	result = /obj/item/reagent_containers/snacks/applepie

/datum/recipe/slimeburger
	reagents = list("slimejelly" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/bun
	)
	result = /obj/item/reagent_containers/snacks/jellyburger/slime

/datum/recipe/jellyburger
	reagents = list("cherryjelly" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/bun
	)
	result = /obj/item/reagent_containers/snacks/jellyburger/cherry

/datum/recipe/twobread
	reagents = list("wine" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/breadslice,
		/obj/item/reagent_containers/snacks/breadslice,
	)
	result = /obj/item/reagent_containers/snacks/twobread

/datum/recipe/slimesandwich
	reagents = list("slimejelly" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/breadslice,
		/obj/item/reagent_containers/snacks/breadslice,
	)
	result = /obj/item/reagent_containers/snacks/jellysandwich/slime

/datum/recipe/cherrysandwich
	reagents = list("cherryjelly" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/breadslice,
		/obj/item/reagent_containers/snacks/breadslice,
	)
	result = /obj/item/reagent_containers/snacks/jellysandwich/cherry

/datum/recipe/bloodsoup
	reagents = list("blood" = 30)
	result = /obj/item/reagent_containers/snacks/bloodsoup

/datum/recipe/slimesoup
	reagents = list("water" = 10, "slimejelly" = 5)
	items = list()
	result = /obj/item/reagent_containers/snacks/slimesoup

/datum/recipe/boiledslimeextract
	reagents = list("water" = 5)
	items = list(
		/obj/item/slime_extract,
	)
	result = /obj/item/reagent_containers/snacks/boiledslimecore

/datum/recipe/chocolateegg
	items = list(
		/obj/item/reagent_containers/snacks/egg,
		/obj/item/reagent_containers/snacks/chocolatebar,
	)
	result = /obj/item/reagent_containers/snacks/chocolateegg

/datum/recipe/sausage
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/rawmeatball,
		/obj/item/reagent_containers/snacks/rawbacon,
	)
	result = /obj/item/reagent_containers/snacks/sausage

/datum/recipe/fishfingers
	reagents = list("flour" = 5, "egg" = 3, "cornoil" = 2)
	items = list(
		/obj/item/reagent_containers/snacks/meat/carp,
	)
	result = /obj/item/reagent_containers/snacks/fishfingers

/datum/recipe/mysterysoup
	reagents = list("water" = 10)
	items = list(
		/obj/item/reagent_containers/snacks/badrecipe,
		/obj/item/reagent_containers/snacks/tofu,
		/obj/item/reagent_containers/snacks/egg,
		/obj/item/reagent_containers/snacks/cheesewedge,
	)
	result = /obj/item/reagent_containers/snacks/mysterysoup

/datum/recipe/pumpkinpie
	fruit = list("pumpkin" = 1)
	reagents = list("milk" = 5, "sugar" = 5, "egg" = 3, "flour" = 10)
	result = /obj/item/reagent_containers/snacks/pumpkinpie

/datum/recipe/plumphelmetbiscuit
	fruit = list("plumphelmet" = 1)
	reagents = list("water" = 5, "flour" = 5)
	items = list(/obj/item/reagent_containers/snacks/butterslice)
	result = /obj/item/reagent_containers/snacks/plumphelmetbiscuit

/datum/recipe/mushroomsoup
	fruit = list("plumphelmet" = 1)
	reagents = list("milk" = 5, "cream" = 5, "sodiumchloride" = 1, "blackpepper" = 1)
	result = /obj/item/reagent_containers/snacks/mushroomsoup

/datum/recipe/chawanmushi
	fruit = list("plumphelmet" = 1)
	reagents = list("water" = 5, "soysauce" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/egg,
		/obj/item/reagent_containers/snacks/egg
	)
	result = /obj/item/reagent_containers/snacks/chawanmushi

/datum/recipe/beetsoup
	fruit = list("whitebeet" = 1, "cabbage" = 1)
	reagents = list("water" = 10)
	result = /obj/item/reagent_containers/snacks/beetsoup

/datum/recipe/appletart
	fruit = list("goldapple" = 1)
	reagents = list("sugar" = 5, "milk" = 5, "flour" = 10, "egg" = 3)
	items = list(/obj/item/reagent_containers/snacks/butterslice)
	result = /obj/item/reagent_containers/snacks/appletart

/datum/recipe/tossedsalad
	fruit = list("cabbage" = 2, "tomato" = 1, "carrot" = 1, "apple" = 1)
	result = /obj/item/reagent_containers/snacks/tossedsalad

/datum/recipe/aesirsalad
	fruit = list("goldapple" = 1, "ambrosiadeus" = 1)
	result = /obj/item/reagent_containers/snacks/aesirsalad

/datum/recipe/validsalad
	fruit = list("potato" = 1, "ambrosia" = 3)
	items = list(/obj/item/reagent_containers/snacks/meatball)
	result = /obj/item/reagent_containers/snacks/validsalad
	make_food(var/obj/container as obj)
		var/obj/item/reagent_containers/snacks/validsalad/being_cooked = ..(container)
		being_cooked.reagents.del_reagent("toxin")
		return being_cooked

/datum/recipe/cracker
	reagents = list("sodiumchloride" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/doughslice
	)
	result = /obj/item/reagent_containers/snacks/cracker

/datum/recipe/stuffing
	reagents = list("water" = 5, "sodiumchloride" = 1, "blackpepper" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/bread,
	)
	result = /obj/item/reagent_containers/snacks/stuffing

/datum/recipe/tofurkey
	items = list(
		/obj/item/reagent_containers/snacks/tofu,
		/obj/item/reagent_containers/snacks/tofu,
		/obj/item/reagent_containers/snacks/stuffing,
	)
	result = /obj/item/reagent_containers/snacks/tofurkey

/datum/recipe/honey_bun
	reagents = list("sugar" = 3, "honey" = 5, "cream" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/dough,
		/obj/item/reagent_containers/snacks/butterslice,
	)
	result = /obj/item/reagent_containers/snacks/honeybuns

/datum/recipe/honey_pudding
	reagents = list("sugar" = 3, "honey" = 15, "cream" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/chocolatebar,
	)
	result = /obj/item/reagent_containers/snacks/honeypudding

//////////////////////////////////////////
// bs12 food port stuff
//////////////////////////////////////////

/datum/recipe/taco
	reagents = list("flour" = 5)
	fruit = list("corn" = 1, "cabbage" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/cutlet,
		/obj/item/reagent_containers/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/snacks/taco

/datum/recipe/bun
	items = list(
		/obj/item/reagent_containers/snacks/dough
	)
	result = /obj/item/reagent_containers/snacks/bun

/datum/recipe/flatbread
	items = list(
		/obj/item/reagent_containers/snacks/flatdough
	)
	result = /obj/item/reagent_containers/snacks/flatbread

/datum/recipe/meatball
	items = list(
		/obj/item/reagent_containers/snacks/rawmeatball
	)
	result = /obj/item/reagent_containers/snacks/meatball

/datum/recipe/cutlet
	items = list(
		/obj/item/reagent_containers/snacks/rawcutlet
	)
	result = /obj/item/reagent_containers/snacks/cutlet

/datum/recipe/fries
	reagents = list("cornoil" = 1)
	items = list(
		/obj/item/reagent_containers/snacks/rawsticks
	)
	result = /obj/item/reagent_containers/snacks/fries

/datum/recipe/mint
	reagents = list("sugar" = 5, "frostoil" = 5)
	result = /obj/item/reagent_containers/snacks/mint


// Cakes.
/datum/recipe/cake
	reagents = list("milk" = 5, "flour" = 15, "sugar" = 15, "egg" = 9)
	items = list(/obj/item/reagent_containers/snacks/butterstick)
	result = /obj/item/reagent_containers/snacks/plaincake

/datum/recipe/cake/carrot
	fruit = list("carrot" = 3)
	result = /obj/item/reagent_containers/snacks/carrotcake

/datum/recipe/cake/cheese
	items = list(
		/obj/item/reagent_containers/snacks/cheesewedge,
		/obj/item/reagent_containers/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/snacks/cheesecake

/datum/recipe/cake/orange
	fruit = list("orange" = 1)
	reagents = list("milk" = 5, "flour" = 15, "egg" = 9, "orangejuice" = 3, "sugar" = 5)
	result = /obj/item/reagent_containers/snacks/orangecake

/datum/recipe/cake/lime
	fruit = list("lime" = 1)
	reagents = list("milk" = 5, "flour" = 15, "egg" = 9, "limejuice" = 3, "sugar" = 5)
	result = /obj/item/reagent_containers/snacks/limecake

/datum/recipe/cake/lemon
	fruit = list("lemon" = 1)
	reagents = list("milk" = 5, "flour" = 15, "egg" = 9, "lemonjuice" = 3, "sugar" = 5)
	result = /obj/item/reagent_containers/snacks/lemoncake

/datum/recipe/cake/chocolate
	items = list(/obj/item/reagent_containers/snacks/chocolatebar)
	reagents = list("milk" = 5, "flour" = 15, "egg" = 9, "coco" = 5, "sugar" = 5)
	result = /obj/item/reagent_containers/snacks/chocolatecake

/datum/recipe/cake/birthday
	items = list(
		/obj/item/clothing/head/costume/misc/cake,
		/obj/item/reagent_containers/snacks/butterstick,
		)
	result = /obj/item/reagent_containers/snacks/birthdaycake

/datum/recipe/cake/apple
	fruit = list("apple" = 2)
	result = /obj/item/reagent_containers/snacks/applecake

/datum/recipe/cake/brain
	items = list(
		/obj/item/organ/internal/vital/brain,
		/obj/item/reagent_containers/snacks/butterstick,
		)
	result = /obj/item/reagent_containers/snacks/braincake

/datum/recipe/brownies
	reagents = list("coco" = 10, "flour" = 15, "egg" = 3, "sugar" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/butterstick,
	)
	result = /obj/item/reagent_containers/snacks/brownie

//Roach cubes

/datum/recipe/cube/
	fruit = list("potato" = 1)
	reagents = list("protein" = 15, "egg" = 3)
	items = list(/obj/item/reagent_containers/snacks/meat/roachmeat)
	result = /obj/item/reagent_containers/snacks/cube/roach

/datum/recipe/cube/fuhrer
	fruit = list("potato" = 2)
	reagents = list("protein" = 25, "fuhrerole" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/meat/roachmeat/fuhrer,
		/obj/item/reagent_containers/snacks/meat/roachmeat/fuhrer,
	)
	result = /obj/item/reagent_containers/snacks/cube/roach/fuhrer

/datum/recipe/cube/jager
	fruit = list("potato" = 1)
	reagents = list("protein" = 10, "blattedin" = 5)
	items = list(/obj/item/reagent_containers/snacks/meat/roachmeat/jager)
	result = /obj/item/reagent_containers/snacks/cube/roach/jager

/datum/recipe/cube/kraftwerk
	fruit = list("potato" = 1)
	reagents = list("protein" = 10, "gewaltine" = 5)
	items = list(/obj/item/reagent_containers/snacks/meat/roachmeat/kraftwerk)
	result = /obj/item/reagent_containers/snacks/cube/roach/kraftwerk

/datum/recipe/cube/elektromagnetisch
	fruit = list("potato" = 1)
	reagents = list("protein" = 10, "iron" = 5)
	items = list(/obj/item/reagent_containers/snacks/meat/roachmeat/elektromagnetisch)
	result = /obj/item/reagent_containers/snacks/cube/roach/elektromagnetisch

/datum/recipe/cube/glowing
	fruit = list("potato" = 1)
	reagents = list("protein" = 10, MATERIAL_URANIUM = 5)
	items = list(/obj/item/reagent_containers/snacks/meat/roachmeat/glowing)
	result = /obj/item/reagent_containers/snacks/meat/roachmeat/glowing

/datum/recipe/cube/roachling
	fruit = list("potato" = 1)
	reagents = list("protein" = 5, "seligitillin" = 1)
	items = list(/obj/item/reagent_containers/snacks/meat/roachmeat)
	result = /obj/item/reagent_containers/snacks/cube/roach/roachling

/datum/recipe/cube/seuche
	fruit = list("potato" = 1)
	reagents = list("protein" = 10, "diplopterum" = 5)
	items = list(/obj/item/reagent_containers/snacks/meat/roachmeat/seuche)
	result = /obj/item/reagent_containers/snacks/cube/roach/seuche

/datum/recipe/cube/panzer
	fruit = list("potato" = 1)
	reagents = list("protein" = 20, "starkellin" = 5)
	items = list(
		/obj/item/reagent_containers/snacks/meat/roachmeat/panzer,
		/obj/item/reagent_containers/snacks/meat/roachmeat/panzer,
	)
	result = /obj/item/reagent_containers/snacks/cube/roach/panzer

/datum/recipe/cube/gestrahlte
	fruit = list("potato" = 1)
	reagents = list("protein" = 10, "toxin" = 5)
	items = list(/obj/item/reagent_containers/snacks/meat/roachmeat)
	result = /obj/item/reagent_containers/snacks/cube/roach/grestrahlte
