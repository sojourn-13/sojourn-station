//----------------------------------------------
//-----------------RANDOMISED-------------------
//----------------------------------------------

/datum/supply_pack/randomised
	name = "Contraband Crate"
	var/num_contained = 5
	contains = list(/obj/item/seeds/bloodtomatoseed,
					/obj/item/weapon/storage/pill_bottle/zoom,
					/obj/item/seeds/kudzuseed,
					/obj/item/weapon/storage/pill_bottle/happy,
					/obj/item/weapon/contraband/poster,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/pwine)
	cost = 2400
	containertype = /obj/structure/closet/crate
	crate_name = "unlabelled crate"
	contraband = TRUE
	group = "Operations"

/datum/supply_pack/randomised/costume
	name = "Actor Costumes Crate"
	num_contained = 2
	contains = list(/obj/item/clothing/suit/costume/history/pirate,
					/obj/item/clothing/suit/costume/job/judge,
					/obj/item/clothing/suit/storage/wcoat/black,
					/obj/item/clothing/suit/costume/job/nun,
					/obj/item/clothing/under/rank/first_officer/suit,
					/obj/item/clothing/suit/costume/history/plaguedoctor,
					/obj/item/clothing/under/plaid/properblue,
					/obj/item/clothing/under/costume/animal/owl,
					/obj/item/clothing/under/costume/job/waiter,
					/obj/item/clothing/under/costume/history/gladiator,
					/obj/item/clothing/under/costume/history/soviet,
					/obj/item/clothing/under/bride_white,
					/obj/item/clothing/suit/rank/chef,
					/obj/item/clothing/under/plaid/kilt)
	cost = 800
	crate_name = "actor costumes crate"
	containertype = /obj/structure/closet/crate/secure
	access = access_theatre
	group = "Clothing"

/datum/supply_pack/randomised/guns
	num_contained = 4
	contains = list(/obj/random/gun_cheap,
                /obj/random/gun_normal,
                /obj/random/gun_energy_cheap,
                /obj/random/gun_shotgun)
	name = "Surplus Weapons Crate"
	cost = 4000
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
	cost = 1200
	crate_name = "surplus ammo crate"
	containertype = /obj/structure/closet/crate/secure/weapon
	group = "Security"

/datum/supply_pack/randomised/holsters
	num_contained = 4
	contains = list(/obj/random/cloth/holster,
					/obj/random/cloth/holster,
					/obj/random/cloth/holster,
					/obj/random/cloth/holster)
	name = "Surplus Uniform Holsters"
	cost = 800
	crate_name = "Surplus Uniform Holsters Crate"
	containertype = /obj/structure/closet/crate
	group = "Operations"

/datum/supply_pack/randomised/pouches
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
	group = "Operations"

datum/supply_pack/randomised/voidsuit
	num_contained = 1
	contains = list(/obj/random/voidsuit,
					/obj/random/voidsuit/damaged)
	name = "Surplus Voidsuit Crate"
	cost = 1200
	crate_name = "surplus voidsuit crate"
	containertype = /obj/structure/closet/crate
	group = "Operations"

datum/supply_pack/randomised/rig
	num_contained = 1
	contains = list(/obj/random/rig,
					/obj/random/rig/damaged)
	name = "Surplus Rig Crate"
	cost = 4000
	crate_name = "surplus rig crate"
	containertype = /obj/structure/closet/crate
	group = "Operations"

datum/supply_pack/randomised/rigmods
	name = "Surplus Rig Modules Crate"
	num_contained = 2
	contains = list(/obj/random/rig_module,
				/obj/random/rig_module)
	cost = 2000
	crate_name = "surplus rig modules crate"
	containertype = /obj/structure/closet/crate
	group = "Operations"