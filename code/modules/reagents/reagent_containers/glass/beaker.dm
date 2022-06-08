/obj/item/reagent_containers/glass/beaker
	name = "beaker"
	desc = "A beaker."
	icon_state = "beaker"
	item_state = "beaker"
	filling_states = "-10;10;25;50;75;80;100"

/obj/item/reagent_containers/glass/beaker/Initialize()
	. = ..()
	desc += " Can hold up to [volume] units."

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

	if(reagents.total_volume)
		var/mutable_appearance/filling = mutable_appearance('icons/obj/reagentfillings.dmi', "[icon_state][get_filling_state()]")
		filling.color = reagents.get_color()
		add_overlay(filling)

	if(label_text)
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
	matter = list(MATERIAL_GLASS = 1)
	volume = 30
	w_class = ITEM_SIZE_TINY
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,15,25)

/obj/item/reagent_containers/glass/beaker/vial/nanites
	preloaded_reagents = list("nanites" = 30)

/obj/item/reagent_containers/glass/beaker/vial/uncapnanites
	preloaded_reagents = list("uncap nanites" = 30)

/obj/item/reagent_containers/glass/beaker/cryoxadone
	preloaded_reagents = list("cryoxadone" = 30)

/obj/item/reagent_containers/glass/beaker/sulphuric
	preloaded_reagents = list("sacid" = 60)

/obj/item/reagent_containers/glass/beaker/vial/vape
	name = "vape vial"
	desc = "A small plastic vial."
	icon_state = "vial_plastic"
	matter = list(MATERIAL_PLASTIC = 1)


/obj/item/reagent_containers/glass/beaker/vial/vape/berry
	name = "berry vape vial"
	preloaded_reagents = list("nicotine" = 20, "berryjuice" = 10)

/obj/item/reagent_containers/glass/beaker/vial/vape/lemon
	name = "lemon vape vial"
	preloaded_reagents = list("nicotine" = 20, "lemonjuice" = 10)

/obj/item/reagent_containers/glass/beaker/vial/vape/banana
	name= "banana vape vial"
	preloaded_reagents = list("nicotine" = 20, "banana" = 10)

/obj/item/reagent_containers/glass/beaker/vial/vape/nicotine
	name = "nicotine vape vial"
	preloaded_reagents = list("nicotine" = 30)

/obj/item/reagent_containers/glass/bucket
	desc = "It's a bucket."
	name = "bucket"
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

/obj/item/reagent_containers/glass/urn
	name = "Urn"
	desc = "A tall, rounded vase with a base, with a short stem, used for storing the ashes of a cremated person."
	icon_state = "urn"
	amount_per_transfer_from_this = 1 //No
	possible_transfer_amounts = list(1) //No
	volume = 30
	can_be_placed_into = null

/obj/item/reagent_containers/glass/urn/veteran
	name = "Veteran Saint Urn"
	desc = "Here lies the unnamed or unknown warriors of the church that sacrificed themselves for the greater good and protection of their brothers and sisters during the exodus. The low quantity of bodies recovered after the infight - mostly gathered during risk, sneaky attempts to recover the dead to be properly buried under SolFed's gaze, is enough to make any vector's compassionate heart throb in pain, but the ones that was recovered has been cremated and kept on this urn, for everyone to pray for their soul. \
	Until someone not that compassionate attempts to remove the lid and tip it over. What a terrible fate! Just don't expect the church to take it kindly for the ones who disrespects the dead - worse fate may come to the ones that disrespects their cultural heroes. Do you feel lucky, punk?"
	icon_state = "saint_urn"
	preloaded_reagents = list("carbon" = 30)
