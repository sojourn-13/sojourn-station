/obj/random/medical
	name = "random medicine"
	icon_state = "meds-green"
	spawn_nothing_percentage = 60

/obj/random/medical/always_spawn
	name = "random always spawn medicine"
	spawn_nothing_percentage = 0

/obj/random/medical/item_to_spawn()
	return pickweight(list(/obj/item/stack/medical/bruise_pack = 4,\
				/obj/item/stack/medical/ointment = 4,\
				/obj/item/stack/medical/splint = 1,\
				/obj/item/bodybag = 2,\
				/obj/item/bodybag/cryobag = 1,\
				/obj/item/storage/pill_bottle/kelotane = 1,\
				/obj/item/storage/pill_bottle/antitox = 2,\
				/obj/item/storage/pill_bottle/tramadol = 2,\
				/obj/item/storage/pill_bottle/prosurgeon = 1,
				/obj/item/reagent_containers/syringe/antitoxin = 2,\
				/obj/item/reagent_containers/syringe/inaprovaline = 2,\
				/obj/item/reagent_containers/syringe/tricordrazine = 1,\
				/obj/item/reagent_containers/syringe/spaceacillin = 1,\
				/obj/item/reagent_containers/glass/beaker/vial/nanites = 0.5,\
				/obj/item/reagent_containers/hypospray/autoinjector/spaceacillin = 2,\
				/obj/item/reagent_containers/hypospray/autoinjector/antitoxin = 3,\
				/obj/item/reagent_containers/hypospray/autoinjector/tricordrazine = 3,\
				/obj/item/reagent_containers/hypospray/autoinjector/quickclot = 3,\
				/obj/item/stack/nanopaste = 0.5,\
				/obj/item/reagent_containers/syringe/stim/greaser = 0.5,\
				/obj/item/reagent_containers/syringe/stim/cherrydrops = 0.5,\
				/obj/item/reagent_containers/syringe/stim/pro_surgeon = 0.5,\
				/obj/item/reagent_containers/syringe/stim/violence = 0.5,\
				/obj/item/reagent_containers/syringe/stim/bouncer = 0.5,\
				/obj/item/reagent_containers/syringe/stim/steady = 0.5,\
				/obj/item/reagent_containers/syringe/stim/greasy_lard = 0.1,\
				/obj/item/reagent_containers/syringe/stim/grape_drops = 0.1,\
				/obj/item/reagent_containers/syringe/stim/ultra_surgeon = 0.1,\
				/obj/item/reagent_containers/syringe/stim/violence_ultra = 0.1,\
				/obj/item/reagent_containers/syringe/stim/boxer = 0.1,\
				/obj/item/reagent_containers/syringe/stim/turbo = 0.1,\
				/obj/item/reagent_containers/syringe/stim/party_drops = 0.05,\
				/obj/item/reagent_containers/syringe/stim/menace = 0.05,\
				/obj/item/psi_injector = 0.05))

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
				/obj/item/reagent_containers/syringe/antitoxin = 2,\
				/obj/item/reagent_containers/syringe/inaprovaline = 2,\
				/obj/item/reagent_containers/syringe/tricordrazine = 1,\
				/obj/item/reagent_containers/hypospray/autoinjector/quickclot = 2))

/obj/random/medical_lowcost/low_chance
	name = "low chance random low tier medicine"
	icon_state = "meds-grey-low"
	spawn_nothing_percentage = 80

/obj/random/firstaid
	name = "random first aid kit"
	icon_state = "meds-red"
	spawn_nothing_percentage = 60

/obj/random/firstaid/item_to_spawn()
	return pickweight(list(/obj/item/storage/firstaid/regular = 3,\
				/obj/item/storage/firstaid/toxin = 1,\
				/obj/item/storage/firstaid/o2 = 1,\
				/obj/item/storage/firstaid/fire = 1))

/obj/random/firstaid/low_chance
	name = "low chance random first aid kit"
	icon_state = "meds-red-low"
	spawn_nothing_percentage = 80

//Handmade stuff
/obj/random/medical_lowcost_handmade
	name = "random low tier handmade medicine"
	icon_state = "meds-grey"
	spawn_nothing_percentage = 30

/obj/random/medical_lowcost_handmade/item_to_spawn()
	return pickweight(list(/obj/item/stack/medical/bruise_pack/handmade = 4,\
				/obj/item/stack/medical/ointment/handmade = 4,\
				/obj/item/reagent_containers/hypospray/autoinjector/spaceacillin = 2,\
				/obj/item/reagent_containers/hypospray/autoinjector/antitoxin = 1,\
				/obj/item/reagent_containers/hypospray/autoinjector/tricordrazine = 3,
				/obj/item/reagent_containers/hypospray/autoinjector/quickclot = 2,\
				/obj/item/stack/medical/splint/improvised = 1))
