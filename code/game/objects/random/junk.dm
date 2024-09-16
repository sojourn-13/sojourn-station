/obj/random/junk //Broken items, or stuff that could be picked up
	has_postspawn = TRUE
	name = "random junk"
	icon_state = "junk-black"
	var/list/exclusions = list()
	var/list/items = list(
		/obj/item/device/radio/headset = 0.01, //So we are not ALWAYS an uplink
		/obj/item/device/radio/headset/uplink = 0.001, //Idea is that someone had to discard this into a trash pile
		/obj/item/material/shard = 5,
		/obj/item/material/shard/shrapnel = 8,
		/obj/item/scrap_lump = 1,
		/obj/item/reagent_containers/pill/floorpill = 8,
		/obj/item/stack/material/cardboard = 3,
		/obj/item/storage/box/lights/mixed = 3,
		/obj/item/storage/box/matches = 4,
		/obj/item/folder = 2,
		/obj/item/folder/blue = 2,
		/obj/item/folder/red = 2,
		/obj/item/folder/yellow = 2,
		/obj/item/folder/cyan = 2,
		/obj/item/circuitboard/broken = 3,
		/obj/item/trash/material/metal = 9,
		/obj/item/trash/material/circuit = 6,
		/obj/item/trash/material/device = 5,
		/obj/item/tool/tape_roll = 3,
		/obj/item/phone = 2,
		/obj/item/trash/gamerchips = 2,
		/obj/item/trash/energybar = 2,
		/obj/item/trash/candle = 1,
		/obj/item/trash/candy = 1,
		/obj/item/trash/candy/proteinbar = 1,
		/obj/item/trash/cheesie = 1,
		/obj/item/trash/chips = 1,
		/obj/item/trash/liquidfood = 1,
		/obj/item/trash/pistachios = 1,
		/obj/item/trash/plate = 1,
		/obj/item/trash/raisins = 1,
		/obj/item/trash/semki = 1,
		/obj/item/trash/snack_bowl = 1,
		/obj/item/trash/sosjerky = 1,
		/obj/item/trash/syndi_cakes = 1,
		/obj/item/trash/tastybread = 1,
		/obj/item/trash/tray = 1,
		/obj/item/trash/waffles = 1,
		/obj/item/caution = 3,
		/obj/item/caution/cone = 3,
		/obj/item/c_tube = 2,
		/obj/item/wrapping_paper = 2,
		/obj/item/implanter = 3,
		/obj/item/newspaper = 5,
		/obj/item/stack/ore/glass = 3,
		/obj/item/pen = 3,
		/obj/item/reagent_containers/glass/beaker = 1,
		/obj/item/reagent_containers/glass/bucket = 1,
		/obj/item/reagent_containers/glass/rag = 1,
		/obj/item/reagent_containers/food/drinks/jar = 1,
		/obj/item/reagent_containers/food/drinks/flask/barflask = 1,
		/obj/item/reagent_containers/food/drinks/drinkingglass = 1,
		/obj/item/reagent_containers/blood/empty = 1,
		/obj/item/reagent_containers/dropper = 1,
		/obj/item/stack/rods = 4,
		/obj/item/paper = 3,
		/obj/item/remains/robot = 1,
		/obj/random/junk/cigbutt = 3,
		/obj/effect/decal/cleanable/blood/gibs/robot = 1,
		/obj/effect/decal/cleanable/blood/oil = 1,
		/obj/effect/decal/cleanable/blood/oil/streak = 1,
		/obj/effect/decal/cleanable/molten_item = 1,
		/obj/effect/decal/cleanable/spiderling_remains = 1,
		/obj/effect/decal/cleanable/vomit = 1,
		/obj/effect/decal/cleanable/blood/splatter = 1,
		/obj/effect/spider/stickyweb = 2, //These are useful for tape crafting
	)

/obj/random/junk/post_spawn(var/list/stuff)
	for (var/atom/thing in stuff)
		if (prob(30))
			thing.make_old()

/obj/random/junk/item_to_spawn()
	return pickweight(items - exclusions)

/obj/random/junk/nondense
	exclusions = list(/obj/random/scrap/moderate_weighted, /obj/item/remains/robot)

/obj/random/junk/low_chance
	name = "low chance random junk"
	icon_state = "junk-black-low"
	spawn_nothing_percentage = 60

/obj/random/junk/cigbutt
	name = "random cigarette butt"
	icon_state = "junk-black"

/obj/random/junk/cigbutt/item_to_spawn()
	return pick(/obj/item/trash/cigbutt,\
		/obj/item/trash/cigbutt/brouzouf,\
		/obj/item/trash/cigbutt/cigarbutt,\
		/obj/item/trash/cigbutt/fortress,\
		/obj/item/trash/cigbutt/fortressblue,\
		/obj/item/trash/cigbutt/fortressred,\
		/obj/item/trash/cigbutt/frozen,\
		/obj/item/trash/cigbutt/ishimura,\
		/obj/item/trash/cigbutt/shodan,\
		/obj/item/trash/cigbutt/tannhauser,\
		/obj/item/trash/cigbutt/toha)