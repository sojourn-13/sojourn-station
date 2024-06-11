/obj/item/reagent_containers/glass/beaker
	name = "beaker"
	desc = "A beaker."
	icon_state = "beaker"
	item_state = "beaker"
	filling_states = "-10;10;25;50;75;80;100"

/obj/item/reagent_containers/glass/beaker/Initialize()
	. = ..()
	desc += " Can hold up to [volume] units."
	if(preloaded_reagents)
		if(!has_lid())
			toggle_lid()

/obj/item/reagent_containers/glass/beaker/pickup(mob/user)
	..()
	playsound(src,'sound/items/Glass_Fragment_take.ogg',50,1)

/obj/item/reagent_containers/glass/beaker/dropped(mob/user)
	..()
	playsound(src,'sound/items/Glass_Fragment_drop.ogg',50,1)

/obj/item/reagent_containers/glass/beaker/update_icon()
	cut_overlays()

	if(has_lid())
		var/lid_icon = lid_icon_state ? lid_icon_state : "lid_[icon_state]"
		var/mutable_appearance/lid = mutable_appearance(icon, lid_icon)
		add_overlay(lid)

	if(reagents?.total_volume)
		var/mutable_appearance/filling = mutable_appearance('icons/obj/reagentfillings.dmi', "[icon_state][get_filling_state()]")
		filling.color = reagents.get_color()
		add_overlay(filling)

	if(label_text || (preloaded_reagents && display_label))
		var/label_icon = label_icon_state ? label_icon_state : "label_[icon_state]"
		var/mutable_appearance/label = mutable_appearance(icon, label_icon)
		add_overlay(label)

//// Subtypes ////

/obj/item/reagent_containers/glass/beaker/large
	name = "large beaker"
	desc = "A large beaker."
	icon_state = "beakerlarge"
	matter = list(MATERIAL_GLASS = 2)
	volume = 120
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,15,25,30,60,100,120)

/obj/item/reagent_containers/glass/beaker/noreact
	name = "cryostasis beaker"
	desc = "A cryostasis beaker that allows for chemical storage without reactions."
	icon_state = "beakernoreact"
	matter = list(MATERIAL_GLASS = 1, MATERIAL_STEEL = 2)
	volume = 60
	amount_per_transfer_from_this = 10
	reagent_flags = OPENCONTAINER | NO_REACT

/obj/item/reagent_containers/glass/beaker/bluespace
	name = "bluespace beaker"
	desc = "A bluespace beaker, powered by experimental bluespace technology."
	icon_state = "beakerbluespace"
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASMA = 1)
	volume = 300
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,15,25,30,60,100,120,300)
	lid_icon_state = "lid_beakerlarge"

/obj/item/reagent_containers/glass/beaker/bluespace/New()
	..()
	item_flags |= BLUESPACE
	bluespace_entropy(1, get_turf(src))

/obj/item/reagent_containers/glass/beaker/vial
	name = "vial"
	desc = "A small glass vial."
	icon_state = "vial"
	lid_icon_state = "lid_vial"
	matter = list(MATERIAL_GLASS = 1)
	volume = 30
	w_class = ITEM_SIZE_TINY
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,15,25)

//// Preloaded beakers ////

/obj/item/reagent_containers/glass/beaker/hivemind
	preloaded_reagents = list("nanites" = 30, "uncap nanites" = 30)
	desc = "A beaker. Contains a mix of nanites."

/obj/item/reagent_containers/glass/beaker/cryoxadone
	preloaded_reagents = list("cryoxadone" = 30)
	desc = "A beaker. Contains pure cryoxadone, meant to be used in cryo cells."

/obj/item/reagent_containers/glass/beaker/sulphuric
	desc = "A beaker. Contains dangerous sulphuric acid."
	preloaded_reagents = list("sacid" = 60)

//// Prelabled beakers ////

/obj/item/reagent_containers/glass/beaker/large/rig_hyperzine
	label_text = "hyperzine"

/obj/item/reagent_containers/glass/beaker/large/rig_tramadol
	label_text = "tramadol"

/obj/item/reagent_containers/glass/beaker/large/rig_nutriment
	label_text = "nutriment"

/obj/item/reagent_containers/glass/beaker/large/rig_tricordrazine
	label_text = "tricordrazine"

//// Vial(s) ////

/obj/item/reagent_containers/glass/beaker/vial/nanites
	preloaded_reagents = list("nanites" = 30)
	desc = "A small glass vial. Contains raw industrial nanobots."

/obj/item/reagent_containers/glass/beaker/vial/uncapnanites
	preloaded_reagents = list("uncap nanites" = 30)
	display_label = FALSE

/obj/item/reagent_containers/glass/beaker/vial/rig_inaprovaline
	label_text = "inaprovaline"

/obj/item/reagent_containers/glass/beaker/vial/rig_dexalinp
	label_text = "dexalinp"

/obj/item/reagent_containers/glass/beaker/vial/rig_tramadol
	label_text = "tramadol"

/obj/item/reagent_containers/glass/beaker/vial/rig_bicaridine
	label_text = "bicaridine"

/obj/item/reagent_containers/glass/beaker/vial/rig_kelotane
	label_text = "kelotane"

/obj/item/reagent_containers/glass/beaker/vial/rig_anti_toxin
	label_text = "anti_toxin"

/obj/item/reagent_containers/glass/beaker/vial/rig_spaceacillin
	label_text = "spaceacillin"

/obj/item/reagent_containers/glass/beaker/vial/vape
	name = "vape vial"
	matter = list(MATERIAL_PLASTIC = 1)

/obj/item/reagent_containers/glass/beaker/vial/vape/berry
	preloaded_reagents = list("nicotine" = 20, "berryjuice" = 10)
	label_text = "berry"

/obj/item/reagent_containers/glass/beaker/vial/vape/lemon
	preloaded_reagents = list("nicotine" = 20, "lemonjuice" = 10)
	label_text = "lemon"

/obj/item/reagent_containers/glass/beaker/vial/vape/banana
	preloaded_reagents = list("nicotine" = 20, "banana" = 10)
	label_text = "banana"

/obj/item/reagent_containers/glass/beaker/vial/vape/mint
	preloaded_reagents = list("nicotine" = 20, "mint" = 10)
	label_text = "mint"

/obj/item/reagent_containers/glass/beaker/vial/vape/nicotine
	preloaded_reagents = list("nicotine" = 30)
	label_text = "nicotine"

/obj/item/reagent_containers/glass/beaker/vial/random
	var/list/random_reagent_list = list(list("water" = 15) = 1, list("cleaner" = 15) = 1)

/obj/item/reagent_containers/glass/beaker/vial/random/toxin
	random_reagent_list = list(
		list("mindbreaker" = 10, "space_drugs" = 20)	= 3,
		list("carpotoxin" = 15)							= 2,
		list("impedrezene" = 15)						= 2,
		list("zombiepowder" = 10)						= 1)

/obj/item/reagent_containers/glass/beaker/vial/random/Initialize()
	. = ..()

	var/list/picked_reagents = pickweight(random_reagent_list)
	for(var/reagent in picked_reagents)
		reagents.add_reagent(reagent, picked_reagents[reagent])

	var/list/names = new
	for(var/datum/reagent/R in reagents.reagent_list)
		names += R.name

	if(!has_lid())
		toggle_lid()


//// Other ////

/obj/item/reagent_containers/glass/bucket
	name = "bucket"
	desc = "A bucket."
	icon = 'icons/obj/janitor.dmi'
	icon_state = "bucket"
	item_state = "bucket"
	matter = list(MATERIAL_PLASTIC = 2)
	w_class = ITEM_SIZE_NORMAL
	amount_per_transfer_from_this = 20
	possible_transfer_amounts = list(10,20,30,60,100,120,200)
	volume = 200
	unacidable = 0

/obj/item/reagent_containers/glass/bucket/attackby(var/obj/D, mob/user as mob)

	if(is_proximity_sensor(D))
		to_chat(user, "You add [D] to [src].")
		qdel(D)
		user.put_in_hands(new /obj/item/bucket_sensor)
		user.drop_from_inventory(src)
		qdel(src)
		return
	else if(istype(D, /obj/item/mop))
		return
	else
		return ..()

/obj/item/reagent_containers/glass/bucket/update_icon()
	cut_overlays()
	if(reagents.total_volume >= 1)
		add_overlay("water_bucket")
	if(has_lid())
		var/image/lid = image(icon, src, "lid_[initial(icon_state)]")
		add_overlay(lid)

/obj/item/reagent_containers/glass/plastic_jug
	name = "plastic jug"
	desc = "It's a plastic jug, made of polyethylene and other compounds. Robust enough to carry a lot of liquid." // Jesse we have to cook
	item_state = "plastic_jug"
	icon_state = "plastic_jug"
	matter = list(MATERIAL_PLASTIC = 3)
	w_class = ITEM_SIZE_BULKY
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(10,20,30,60,100,120,300)
	volume = 300 // Bigger than a bucket
	unacidable = 1

/obj/item/reagent_containers/glass/plastic_jug/update_icon() // Necessary as it has no filling states.
	cut_overlays()

	if(has_lid())
		var/image/lid = image(icon, src, "lid_[initial(icon_state)]")
		add_overlay(lid)

/obj/item/reagent_containers/glass/urn
	name = "Urn"
	desc = "A tall, rounded vase with a base, with a short stem, used for storing the ashes of a cremated person."
	icon_state = "urn"
	amount_per_transfer_from_this = 1 //No
	possible_transfer_amounts = list(1) //No
	volume = 30
	can_be_placed_into = null

/obj/item/reagent_containers/glass/urn/veteran
	name = "Martyr's Urn"
	desc = "An urn filled with mixed ashes from the faithful defenders of New Byzantine. Only a very small number of bodies could be retrieved from the planet after its occupation by SolFed forces, each one coming at terrible risk. Augustine has declared the ashes a relic of all those who died in defense of the faith. Do not spill."
	icon_state = "saint_urn"
	preloaded_reagents = list("carbon" = 30)
