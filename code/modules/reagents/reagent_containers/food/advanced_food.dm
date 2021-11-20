//mre food


/obj/item/reagent_containers/food/snacks/openable
	name = "chips"
	desc = "A closed bag of chips, ready to be opened."
	icon_state = "lays"
	trash = /obj/item/trash/chips
	filling_color = "#948051"
	nutriment_desc = list("heartiness" = 1, "beans" = 3)
	nutriment_amt = 6
	preloaded_reagents = list("protein" = 3, "sodiumchloride" = 5)
	cooked = TRUE
	reagent_flags = NONE
	var/alt_desc = "A now opend bag of chips."
	var/can_warm = FALSE
	var/warm = FALSE
	var/open = FALSE
	var/list/heated_reagents = list("tricordrazine" = 5)
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/food/snacks/openable/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (open)
		itemstring += "_full"

	if (warm)
		itemstring += "_hot"

	icon_state = iconstring

/obj/item/reagent_containers/food/snacks/openable/attack(mob/M as mob, mob/user as mob, def_zone)
	. = ..()
	if(!open)
		open()
		to_chat(user, SPAN_WARNING("You viciously open \the [src] with your teeth, you animal."))

/obj/item/reagent_containers/food/snacks/openable/proc/heat()
	for(var/reagent in heated_reagents)
		reagents.add_reagent(reagent, heated_reagents[reagent])
	bitesize = 6
	update_icon()

/obj/item/reagent_containers/food/snacks/openable/proc/open(mob/user)
	desc = alt_desc
	open = TRUE
	reagent_flags |= REFILLABLE
	update_icon()

/obj/item/reagent_containers/food/snacks/openable/attack_self(mob/user)
	if(!open)
		open()
		to_chat(user, SPAN_NOTICE("You tear \the [src] open."))
		return
	if(warm)
		to_chat(user, SPAN_NOTICE("You already crushed \the [src] and it's still heating up, be patient."))
		return
	if(can_warm)
		user.visible_message(
			SPAN_NOTICE("[user] crushes \the [src] package."),
			"You crush \the [src] package and feel a comfortable heat build up.",
		)
		warm = TRUE
		spawn(300)
			to_chat(user, "You think \the [src] is ready to eat about now.")
			heat()

/obj/item/reagent_containers/food/snacks/openable/chips_alt
	name = "chips"
	desc = "A closed bag of chips, ready to be opened."
	icon_state = "lays_green"
	trash = /obj/item/trash/chips_green

/obj/item/reagent_containers/food/snacks/openable/mre
	name = "mre"
	desc = "A closed mre, ready to be opened."
	alt_desc = "A plethora of steaming beans mixed with meat, ready for consumption."
	icon_state = "mre"
	trash = /obj/item/trash/mre
	filling_color = "#948051"
	nutriment_desc = list("heartiness" = 1, "beans" = 3)
	nutriment_amt = 6
	preloaded_reagents = list("protein" = 3, "sodiumchloride" = 5)
	cooked = TRUE
	reagent_flags = NONE
	warm = FALSE
	open = FALSE
	heated_reagents = list("tricordrazine" = 5)
	matter = list(MATERIAL_BIOMATTER = 6)
	can_warm = TRUE

/obj/item/reagent_containers/food/snacks/openable/mre/alt
	desc = "A closed mre, ready to be opened. This one is a wok mre mix."
	alt_desc = "A nice mix of noodles and herbs all waiting to be eaten."
	icon_state = "wok"
	trash = /obj/item/trash/mre/alt

/obj/item/reagent_containers/food/snacks/openable/can
	name = "ration can"
	desc = "Can of stew meat, tab right on top for easy opening."
	alt_desc = "An opened can of stewed meat, ready for consumption."
	icon_state = "ration_can"
	trash = /obj/item/trash/mre_can
	filling_color = "#948051"
	nutriment_desc = list("heartiness" = 1, "meat" = 3)
	nutriment_amt = 5
	preloaded_reagents = list("protein" = 6, "iron" = 2)
	heated_reagents = list("bicaridine" = 5, "kelotane" = 5)
	matter = list(MATERIAL_BIOMATTER = 12)
	can_warm = TRUE

/obj/item/reagent_containers/food/snacks/openable/candy
	name = "morale bar"
	desc = "Some brand of non-melting military chocolate."
	alt_desc = "Some brand of non-melting military chocolate. This one is open, and still unmelted."
	icon_state = "mre_candy"
	trash = /obj/item/trash/mre_candy
	preloaded_reagents = list("sugar" = 3, "coco" = 2)


/obj/item/reagent_containers/food/snacks/openable/candy/shokoladka
	desc = "Shokoladka branded non-melting military chocolate."
	alt_desc = "Shokoladka branded non-melting military chocolate. This one is open, and still unmelted."
	icon_state = "shokoladka"
	trash = /obj/item/trash/mre_shokoladka

/obj/item/reagent_containers/food/snacks/openable/candy/dalococh
	desc = "Dalococh branded non-melting military chocolate."
	alt_desc = "Dalococh branded non-melting military chocolate. This one is open, and still unmelted."
	icon_state = "dalococh"
	trash = /obj/item/trash/mre_dalococh

//Other mre food items


/obj/item/reagent_containers/food/snacks/mre_paste
	name = "nutrient paste"
	desc = "A peachy looking paste."
	icon_state = "paste"
	trash = /obj/item/trash/mre_paste
	filling_color = "#DEDEAB"
	nutriment_desc = list("acrid peaches" = 2)
	bitesize = 2
	nutriment_amt = 3
	preloaded_reagents = list("hyperzine" = 2, "paracetamol" = 3)
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/canned_peaches
	name = "canned peaches"
	desc = "A can of peaches."
	icon_state = "peachcan"
	trash = /obj/item/trash/peachcan
	filling_color = "#DEDEAB"
	nutriment_desc = list("acrid peaches" = 2)
	bitesize = 2
	nutriment_amt = 3
	preloaded_reagents = list("sugar" = 2)
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/food/snacks/mre_cracker
	name = "enriched cracker"
	desc = "It's a salted cracker, the surface looks saturated with oil."
	icon_state = "mre_cracker"
	filling_color = "#F5DEB8"
	center_of_mass = list("x"=17, "y"=6)
	nutriment_desc = list("salt" = 1, "cracker" = 2)
	bitesize = 2
	nutriment_amt = 1
	preloaded_reagents = list("dexalinp" = 1, "nicotine" = 1)
	matter = list(MATERIAL_BIOMATTER = 2)


