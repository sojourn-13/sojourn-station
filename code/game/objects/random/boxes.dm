/obj/random/boxes
	name = "random box"
	icon_state = "box-blue"
	item_to_spawn()
		return pickweight(list(/obj/random/pack/rare = 1,
					/obj/item/storage/box/beakers = 3,
					/obj/item/storage/box/bloodpacks = 2,
					/obj/item/storage/box/autoinjectors = 2,
					/obj/item/storage/box/matches = 2,
					/obj/item/storage/box/donkpockets = 2,
					/obj/item/storage/box/data_disk/basic = 2,
					/obj/item/storage/box/data_disk = 1,
					/obj/item/storage/box/cups = 1,
					/obj/item/storage/box/drinkingglasses = 2,
					/obj/item/storage/box/fingerprints = 1,
					/obj/item/storage/box/handcuffs = 2,
					/obj/item/storage/box/holobadge = 1,
					/obj/item/storage/box/ids = 1,
					/obj/item/storage/box/injectors = 1,
					/obj/item/storage/box/lights = 1,
					/obj/item/storage/box/monkeycubes = 1,
					/obj/item/storage/box/mousetraps = 1,
					/obj/item/storage/box/pillbottles = 1,
					/obj/item/storage/box/rxglasses = 1,
					/obj/item/storage/box/samplebags = 1,
					/obj/item/storage/box/smokes = 1,
					/obj/item/ammo_magazine/ammobox/antim_small = 1,
					/obj/item/storage/box/solution_trays = 1,
					/obj/item/storage/box/survival = 1,
					/obj/item/storage/box/swabs = 1,
					/obj/item/storage/briefcase/crimekit = 1))

/obj/random/boxes/low_chance
	name = "low chance box"
	icon_state = "box-blue-low"
	spawn_nothing_percentage = 60
