//----------------------------------------------
//-----------------RANDOMISED-------------------
//----------------------------------------------

/datum/supply_pack/randomised
	var/num_contained = 5
	contains = list(/obj/item/seeds/bloodtomatoseed,
					/obj/item/weapon/storage/pill_bottle/zoom,
					/obj/item/seeds/kudzuseed,
					/obj/item/weapon/storage/pill_bottle/happy,
					/obj/item/weapon/contraband/poster,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/pwine)
	name = "Contraband crate"
	cost = 3000
	containertype = /obj/structure/closet/crate
	crate_name = "Unlabeled crate"
	contraband = TRUE
	group = "Operations"

/datum/supply_pack/randomised/costume
	num_contained = 2
	contains = list(/obj/item/clothing/suit/costume/history/pirate,
					/obj/item/clothing/suit/costume/job/judge,
					/obj/item/clothing/accessory/wcoat/black,
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
	name = "Costumes crate"
	cost = 1000
	containertype = /obj/structure/closet/crate/secure
	crate_name = "Actor Costumes"
	access = access_theatre
	group = "Miscellaneous"

/datum/supply_pack/randomised/guns
	num_contained = 4
	contains = list(/obj/random/gun_cheap,
                /obj/random/gun_normal,
                /obj/random/gun_energy_cheap,
                /obj/random/gun_shotgun)
	name = "Surplus Weaponry"
	cost = 2000
	crate_name = "Surplus Weapons Crate"
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
	name = "Surplus Ammo"
	cost = 1500
	crate_name = "Surplus Ammo Crate"
	containertype = /obj/structure/closet/crate/secure/weapon
	group = "Security"

/datum/supply_pack/randomised/pouches
	num_contained = 5
	contains = list(/obj/random/pouch,
				/obj/random/pouch,
				/obj/random/pouch,
				/obj/random/pouch,
				/obj/random/pouch)
	name = "Surplus Storage Pouches"
	cost = 1500
	crate_name = "Surplus Pouches Crate"
	containertype = /obj/structure/closet/crate
	group = "Operations"



datum/supply_pack/randomised/voidsuit
	num_contained = 1
	contains = list(/obj/random/voidsuit,
					/obj/random/voidsuit/damaged)
	name = "Surplus Voidsuit"
	cost = 1500
	crate_name = "Surplus Voidsuit Crate"
	containertype = /obj/structure/closet/crate
	group = "Operations"

datum/supply_pack/randomised/rig
	num_contained = 1
	contains = list(/obj/random/rig,
					/obj/random/rig/damaged)
	name = "Surplus Rig Suit"
	cost = 5000
	crate_name = "Surplus Rig Crate"
	containertype = /obj/structure/closet/crate
	group = "Operations"

datum/supply_pack/randomised/rigmods
	num_contained = 2
	contains = list(/obj/random/rig_module,
				/obj/random/rig_module)
	name = "Surplus Rig Modules"
	cost = 2500
	crate_name = "Surplus Rig Modules"
	containertype = /obj/structure/closet/crate
	group = "Operations"

/datum/supply_pack/nanites
	name = "Raw Nanites"
	contains = list(
		/obj/item/weapon/reagent_containers/glass/beaker/vial/nanites
	)
	cost = 1500
	crate_name = "Raw Nanites Container"
	group = "Medical / Science"
	containertype = /obj/structure/closet/crate/medical

/datum/supply_pack/uncapnanites
	name = "Raw Uncapped Nanites"
	contains = list(
		/obj/item/weapon/reagent_containers/glass/beaker/vial/uncapnanites
	)
	cost = 2000
	crate_name = "Raw Nanites Container"
	group = "Medical / Science"
	contraband = TRUE
	containertype = /obj/structure/closet/crate/medical