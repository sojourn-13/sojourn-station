//----------------------------------------------
//-----------------RANDOMISED-------------------
//----------------------------------------------

/datum/supply_pack/randomised
	name = "Contraband Crate"
	var/num_contained = 5
	contains = list(/obj/item/seeds/bloodtomatoseed,
					/obj/item/storage/pill_bottle/zoom,
					/obj/item/seeds/kudzuseed,
					/obj/item/storage/pill_bottle/happy,
					/obj/item/contraband/poster,
					/obj/item/reagent_containers/food/drinks/bottle/pwine)
	cost = 1200
	containertype = /obj/structure/closet/crate
	crate_name = "unlabelled crate"
	contraband = TRUE
	group = "Operations"

/datum/supply_pack/randomised/guns
	num_contained = 4
	contains = list(/obj/random/gun_cheap,
                /obj/random/gun_normal,
                /obj/random/gun_energy_cheap,
                /obj/random/gun_shotgun)
	name = "Surplus Weapons Crate"
	cost = 800
	crate_name = "surplus weapons crate"
	containertype = /obj/structure/closet/crate/secure/weapon
	group = "Security"

/datum/supply_pack/randomised/ammo
	num_contained = 8
	contains = list(/obj/random/ammo,
				/obj/random/ammo,
				/obj/random/ammo,
				/obj/random/ammo,
				/obj/random/ammo,
				/obj/random/ammo,
				/obj/random/ammo,
				/obj/random/ammo)
	name = "Surplus Ammo Crate"
	cost = 600
	crate_name = "surplus ammo crate"
	containertype = /obj/structure/closet/crate/secure/weapon
	group = "Security"

/datum/supply_pack/randomised/holsters
	contraband = FALSE
	num_contained = 4
	contains = list(/obj/random/cloth/holster,
					/obj/random/cloth/holster,
					/obj/random/cloth/holster,
					/obj/random/cloth/holster)
	name = "Surplus Uniform Holsters"
	cost = 400
	crate_name = "Surplus Uniform Holsters Crate"
	containertype = /obj/structure/closet/crate
	group = "Clothing"

/datum/supply_pack/randomised/pouches
	contraband = FALSE
	num_contained = 5
	contains = list(/obj/random/pouch,
				/obj/random/pouch,
				/obj/random/pouch,
				/obj/random/pouch,
				/obj/random/pouch)
	name = "Surplus Pouches Crate"
	cost = 1200
	crate_name = "surplus pouches crate"
	containertype = /obj/structure/closet/crate
	group = "Clothing"

/datum/supply_pack/randomised/voidsuit
	contraband = FALSE
	num_contained = 1
	contains = list(/obj/random/voidsuit,
					/obj/random/voidsuit/damaged)
	name = "Surplus Voidsuit Crate"
	cost = 600
	crate_name = "surplus voidsuit crate"
	containertype = /obj/structure/closet/crate
	group = "Clothing"

/datum/supply_pack/randomised/rig
	contraband = FALSE
	num_contained = 1
	contains = list(/obj/random/rig,
					/obj/random/rig/damaged)
	name = "Surplus Rig Crate"
	cost = 750
	crate_name = "surplus rig crate"
	containertype = /obj/structure/closet/crate
	group = "Clothing"

/datum/supply_pack/randomised/rigmods
	name = "Surplus Rig Modules Crate"
	num_contained = 2
	contains = list(/obj/random/rig_module,
				/obj/random/rig_module)
	cost = 500
	crate_name = "surplus rig modules crate"
	containertype = /obj/structure/closet/crate
	group = "Clothing"