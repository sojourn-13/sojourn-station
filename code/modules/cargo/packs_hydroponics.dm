//----------------------------------------------
//-----------------HYDROPONICS------------------
//----------------------------------------------

/datum/supply_pack/monkey
	name = "Monkey crate"
	contains = list (/obj/item/weapon/storage/box/monkeycubes)
	cost = 1500
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "Monkey crate"
	group = "Hydroponics"

/datum/supply_pack/hydroponics // -- Skie
	name = "Hydroponics Supply Crate"
	contains = list(/obj/item/weapon/reagent_containers/spray/plantbgone,
					/obj/item/weapon/reagent_containers/spray/plantbgone,
					/obj/item/weapon/reagent_containers/glass/bottle/ammonia,
					/obj/item/weapon/reagent_containers/glass/bottle/ammonia,
					/obj/item/weapon/material/hatchet,
					/obj/item/weapon/material/minihoe,
					/obj/item/device/scanner/plant,
					/obj/item/clothing/gloves/botanic_leather,
					/obj/item/clothing/suit/rank/botanist) // Updated with new things
	cost = 900
	containertype = /obj/structure/closet/crate/hydroponics
	crate_name = "Hydroponics crate"
	group = "Hydroponics"

//farm animals - useless and annoying, but potentially a good source of food
/datum/supply_pack/cow
	name = "Cow crate"
	cost = 3000
	containertype = /obj/structure/largecrate/animal/cow
	crate_name = "Cow crate"
	group = "Hydroponics"

/datum/supply_pack/goat
	name = "Goat crate"
	cost = 2500
	containertype = /obj/structure/largecrate/animal/goat
	crate_name = "Goat crate"
	group = "Hydroponics"

/datum/supply_pack/chicken
	name = "Chicken crate"
	cost = 1500
	containertype = /obj/structure/largecrate/animal/chick
	crate_name = "Chicken crate"
	group = "Hydroponics"

/datum/supply_pack/corgi
	name = "Corgi crate"
	cost = 4000
	containertype = /obj/structure/largecrate/animal/corgi
	crate_name = "Corgi crate"
	group = "Hydroponics"

/datum/supply_pack/cat
	name = "Cat crate"
	cost = 3000
	containertype = /obj/structure/largecrate/animal/cat
	crate_name = "Cat crate"
	group = "Hydroponics"

/datum/supply_pack/seeds
	name = "Seeds crate"
	contains = list(/obj/item/seeds/chiliseed,
					/obj/item/seeds/berryseed,
					/obj/item/seeds/cornseed,
					/obj/item/seeds/eggplantseed,
					/obj/item/seeds/tomatoseed,
					/obj/item/seeds/appleseed,
					/obj/item/seeds/soyaseed,
					/obj/item/seeds/wheatseed,
					/obj/item/seeds/carrotseed,
					/obj/item/seeds/harebell,
					/obj/item/seeds/lemonseed,
					/obj/item/seeds/orangeseed,
					/obj/item/seeds/grassseed,
					/obj/item/seeds/sunflowerseed,
					/obj/item/seeds/chantermycelium,
					/obj/item/seeds/potatoseed,
					/obj/item/seeds/sugarcaneseed)
	cost = 800
	containertype = /obj/structure/closet/crate/hydroponics
	crate_name = "Seeds crate"
	group = "Hydroponics"

/datum/supply_pack/weedcontrol
	name = "Weed control crate"
	contains = list(/obj/item/clothing/mask/gas,
					/obj/item/weapon/grenade/chem_grenade/antiweed,
					/obj/item/weapon/grenade/chem_grenade/antiweed,
					/obj/item/weapon/grenade/chem_grenade/antiweed,
					/obj/item/weapon/grenade/chem_grenade/antiweed)
	cost = 1000
	containertype = /obj/structure/closet/crate/secure/hydrosec
	crate_name = "Weed control crate"
	group = "Hydroponics"

/datum/supply_pack/exoticseeds
	name = "Exotic seeds crate"
	contains = list(/obj/item/seeds/libertymycelium,
					/obj/item/seeds/reishimycelium,
					/obj/item/seeds/random,
					/obj/item/seeds/random,
					/obj/item/seeds/random,
					/obj/item/seeds/random,
					/obj/item/seeds/random,
					/obj/item/seeds/random,
					/obj/item/seeds/kudzuseed)
	cost = 1500
	containertype = /obj/structure/closet/crate/hydroponics
	crate_name = "Exotic Seeds crate"
	group = "Hydroponics"

/datum/supply_pack/watertank
	name = "Water tank crate"
	contains = list(/obj/structure/reagent_dispensers/watertank)
	cost = 800
	containertype = /obj/structure/largecrate
	crate_name = "Water tank crate"
	group = "Hydroponics"