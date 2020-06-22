/obj/random/medical
	name = "random medicine"
	icon_state = "meds-green"
	spawn_nothing_percentage = 60

/obj/random/medical/item_to_spawn()
	return pickweight(list(/obj/item/stack/medical/bruise_pack = 4,\
				/obj/item/stack/medical/ointment = 4,\
				/obj/item/stack/medical/advanced/bruise_pack = 1,\
				/obj/item/stack/medical/advanced/ointment = 1,\
				/obj/item/stack/medical/splint = 1,\
				/obj/item/bodybag = 2,\
				/obj/item/bodybag/cryobag = 1,\
				/obj/item/weapon/storage/pill_bottle/kelotane = 1,\
				/obj/item/weapon/storage/pill_bottle/antitox = 2,\
				/obj/item/weapon/storage/pill_bottle/tramadol = 2,\
				/obj/item/weapon/storage/pill_bottle/prosurgeon = 1,
				/obj/item/weapon/reagent_containers/syringe/antitoxin = 2,\
				/obj/item/weapon/reagent_containers/syringe/inaprovaline = 2,\
				/obj/item/weapon/reagent_containers/syringe/tricordrazine = 1,\
				/obj/item/weapon/reagent_containers/syringe/spaceacillin = 1,\
				/obj/item/weapon/reagent_containers/glass/beaker/vial/nanites = 0.5,\
				/obj/item/stack/nanopaste = 0.5))

/obj/random/medical/low_chance
	name = "low chance random medicine"
	icon_state = "meds-green-low"
	spawn_nothing_percentage = 80

/obj/random/medical_lowcost
	name = "random low tier medicine"
	icon_state = "meds-grey"
	spawn_nothing_percentage = 60

/obj/random/medical_lowcost/item_to_spawn()
	return pickweight(list(/obj/item/stack/medical/bruise_pack = 4,\
				/obj/item/stack/medical/ointment = 4,\
				/obj/item/weapon/reagent_containers/syringe/antitoxin = 2,\
				/obj/item/weapon/reagent_containers/syringe/inaprovaline = 2,\
				/obj/item/weapon/reagent_containers/syringe/tricordrazine = 1))

/obj/random/medical_lowcost/low_chance
	name = "low chance random low tier medicine"
	icon_state = "meds-grey-low"
	spawn_nothing_percentage = 80

/obj/random/firstaid
	name = "random first aid kit"
	icon_state = "meds-red"
	spawn_nothing_percentage = 60

/obj/random/firstaid/item_to_spawn()
	return pickweight(list(/obj/item/weapon/storage/firstaid/regular = 3,\
				/obj/item/weapon/storage/firstaid/toxin = 1,\
				/obj/item/weapon/storage/firstaid/o2 = 1,\
				/obj/item/weapon/storage/firstaid/adv = 0.5,\
				/obj/item/weapon/storage/firstaid/fire = 1))

/obj/random/firstaid/low_chance
	name = "low chance random first aid kit"
	icon_state = "meds-red-low"
	spawn_nothing_percentage = 80
