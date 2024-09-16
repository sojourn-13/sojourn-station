
/obj/item/reagent_containers/food/snacks/candy
	name = "candy bar"
	desc = "An unbranded nougat candy bar. Sugary."
	icon_state = "candy"
	taste_tag = list(SWEET_FOOD)
	trash = /obj/item/trash/candy
	filling_color = "#7D5F46"
	bitesize = 2
	center_of_mass = list("x"=15, "y"=15)
	nutriment_amt = 1
	nutriment_desc = list("candy" = 1)
	preloaded_reagents = list("sugar" = 3, "preservatives" = 2)
	matter = list(MATERIAL_BIOMATTER = 3)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/chocolatebar
	name = "chocolate bar"
	desc = "Such sweet, fattening food."
	icon_state = "chocolatebar"
	taste_tag = list(SWEET_FOOD)
	filling_color = "#7D5F46"
	bitesize = 2
	center_of_mass = list("x"=15, "y"=15)
	nutriment_amt = 1
	nutriment_desc = list("chocolate" = 5)
	preloaded_reagents = list("sugar" = 2, "coco" = 2, "preservatives" = 2)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/candy/donor
	name = "donor candy"
	desc = "A little treat for blood donors."
	taste_tag = list(SWEET_FOOD)
	bitesize = 5
	trash = /obj/item/trash/candy
	nutriment_desc = list("candy" = 10)
	preloaded_reagents = list("nutriment" = 6, "sugar" = 6, "preservatives" = 4)
	matter = list(MATERIAL_BIOMATTER = 2)

/obj/item/reagent_containers/food/snacks/candy/proteinbar
	name = "protein bar"
	desc = "SwoleMAX brand protein bars, guaranteed to get you feeling perfectly overconfident."
	icon_state = "proteinbar"
	taste_tag = list(SWEET_FOOD)
	trash = /obj/item/trash/candy/proteinbar
	nutriment_amt = 5
	nutriment_desc = list("nutriment" = 7, "protein" = 8, "preservatives" = 4)
	matter = list(MATERIAL_BIOMATTER = 3)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/candy/pistachios_pack
	name = "pistachios pack"
	desc = "A packet of pistachios with added salt. A somewhat healthy light snack."
	icon_state = "pistachios_pack"
	taste_tag = list(SALTY_FOOD)
	trash = /obj/item/trash/pistachios
	nutriment_amt = 1
	nutriment_desc = list("pistachios" = 3, "protein" = 2, "sodiumchloride" = 2)
	preloaded_reagents = list("nutriment" = 1, "sodiumchloride" = 6, "preservatives" = 3)
	matter = list(MATERIAL_BIOMATTER = 3)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/candy/sunflowerseeds
	name = "sunflower fried seed pack"
	desc = "Bag of sunflower seeds that have been fried and salted for people that like to chew their food for way to long."
	icon_state = "semki_pack"
	taste_tag = list(SALTY_FOOD)
	trash = /obj/item/trash/semki
	nutriment_amt = 1
	nutriment_desc = list("nutriment" = 2, "protein" = 1, "preservatives" = 2)
	matter = list(MATERIAL_BIOMATTER = 3)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/candy/energybar
	name = "energy bar"
	desc = "A chewy candy bar that has many warnings about its surgar contents for quick energy."
	icon_state = "energybar"
	taste_tag = list(SWEET_FOOD)
	trash = /obj/item/trash/energybar
	nutriment_amt = 1
	nutriment_desc = list("nutriment" = 1, "sugar" = 29)
	preloaded_reagents = list("nutriment" = 1, "sugar" = 19, "preservatives" = 10)
	matter = list(MATERIAL_BIOMATTER = 1)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/candy_corn
	name = "candy corn"
	desc = "It's a handful of candy corn. Cannot be stored in a detective's hat, alas."
	icon_state = "candy_corn"
	taste_tag = list(SWEET_FOOD)
	filling_color = "#FFFCB0"
	bitesize = 2
	center_of_mass = list("x"=14, "y"=10)
	nutriment_amt = 2
	nutriment_desc = list("candy corn" = 4)
	preloaded_reagents = list("nutriment" = 4, "sugar" = 2, "preservatives" = 2)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/candy_drop_blue
	name = "\improper red gum stick"
	desc = "A small slab of gum for chewing."
	icon_state = "gumdrop_blue"
	taste_tag = list(SWEET_FOOD)
	filling_color = "#FC44A0"
	bitesize = 1
	nutriment_desc = list("chalk" = 3, "sweetness" = 3)
	nutriment_amt = 0
	preloaded_reagents = list("gum drops" = 3, "preservatives" = 1)
	matter = list(MATERIAL_BIOMATTER = 2)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/candy_drop_red
	name = "\improper blue gum stick"
	desc = "A small slab of gum for chewing. Wait, they come in blue now?"
	icon_state = "gumdrop_red"
	taste_tag = list(SWEET_FOOD)
	filling_color = "#2B00FF"
	bitesize = 1
	nutriment_desc = list("chalk" = 3, "sweetness" = 3)
	nutriment_amt = 0
	preloaded_reagents = list("gum drops" = 5, "hacker" = 15, "preservatives" = 5)
	matter = list(MATERIAL_BIOMATTER = 12)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/sosjerky
	name = "Scaredy's Beef Jerky"
	icon_state = "sosjerky"
	taste_tag = list(SALTY_FOOD)
	desc = "Packaged protein sourced from a massive private reserve."
	trash = /obj/item/trash/sosjerky
	filling_color = "#631212"
	bitesize = 2
	center_of_mass = list("x"=15, "y"=9)
	preloaded_reagents = list("protein" = 4, "preservatives" = 3)
	matter = list(MATERIAL_BIOMATTER = 6)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/cheesiehonkers
	name = "Cheesie Honkers"
	icon_state = "cheesie_honkers"
	taste_tag = list(CHEESE_FOOD)
	desc = "Bite-sized cheesie snacks that will honk all over your mouth."
	trash = /obj/item/trash/cheesie
	filling_color = "#FFA305"
	bitesize = 2
	center_of_mass = list("x"=15, "y"=9)
	nutriment_desc = list("cheese" = 5, "chips" = 2)
	preloaded_reagents = list("preservatives" = 2)
	nutriment_amt = 2
	matter = list(MATERIAL_BIOMATTER = 4)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/dogtreats
	name = "\improper Kriosan treats"
	desc = "A biscuit imported directly from Krios, well loved for their long shelf life and nutrition density, all in a fun and convenient shape!"
	icon_state = "dogtreat_single"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	filling_color = "#E8DCA5"
	bitesize = 2
	center_of_mass = list("x"=15, "y"=15)
	nutriment_amt = 6
	nutriment_desc = list("honey" = 2, "dry biscuits" = 1)
	matter = list(MATERIAL_BIOMATTER = 3)
	preloaded_reagents = list("preservatives" = 2, "honey" = 1, "protein" = 2)
	junk_food = TRUE


////////////////////////////////////////////////Openable

/obj/item/reagent_containers/food/snacks/openable/chips
	name = "chips packet"
	desc = "An unbranded packet of crisps. Salty."
	icon_state = "lays_green"
	taste_tag = list(SALTY_FOOD)
	trash = /obj/item/trash/chips
	filling_color = "#E8C31E"
	bitesize = 1
	center_of_mass = list("x"=15, "y"=15)
	nutriment_amt = 1
	nutriment_desc = list("salt" = 1, "chips" = 2, "preservatives" = 3)
	matter = list(MATERIAL_BIOMATTER = 2)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/openable/gamerchips
	name = "boritos crips packet"
	desc = "An branded packet of crisps. Its marketing for people that like to play competitive arcade games."
	icon_state = "boritos"
	taste_tag = list(SALTY_FOOD)
	trash = /obj/item/trash/gamerchips
	filling_color = "#E8C31E"
	bitesize = 1
	center_of_mass = list("x"=15, "y"=15)
	nutriment_amt = 1
	nutriment_desc = list("cool ranch" = 2, "corn" = 1)
	matter = list(MATERIAL_BIOMATTER = 3)
	preloaded_reagents = list("preservatives" = 2)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/openable/syndicake
	name = "syndi-cakes"
	icon_state = "syndi_cakes" //Sprite by Michiyamenotehifunana
	taste_tag = list(SWEET_FOOD)
	desc = "An extremely moist snack cake that tastes just as good after being nuked."
	alt_desc = "An open packet of extremely moist snack cake that tastes just as good after being nuked."
	filling_color = "#FF5D05"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("sweetness" = 3, "cake" = 1)
	nutriment_amt = 2
	trash = /obj/item/trash/syndi_cakes
	preloaded_reagents = list("doctorsdelight" = 5, "preservatives" = 5)
	matter = list(MATERIAL_BIOMATTER = 12)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/openable/no_raisin
	name = "4No Raisins"
	icon_state = "4no_raisins" //Sprite by Michiyamenotehifunana
	desc = "A brand of boxed raisins. Dry but tasty."
	taste_tag = list(VEGAN_FOOD, SWEET_FOOD)
	alt_desc = "A opend brand of boxed raisins. Dry but tasty."
	trash = /obj/item/trash/raisins
	filling_color = "#343834"
	center_of_mass = list("x"=15, "y"=4)
	nutriment_desc = list("dried raisins" = 6)
	nutriment_amt = 6
	matter = list(MATERIAL_BIOMATTER = 6)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/openable/spacetwinkie
	name = "Space Twinkie"
	icon_state = "space_twinkie" //Sprite by Michiyamenotehifunana
	desc = "A golden sponge cake with a creamy filling."
	taste_tag = list(SWEET_FOOD)
	alt_desc = "A opend golden sponge cake with a creamy filling."
	filling_color = "#FFE591"
	bitesize = 2
	center_of_mass = list("x"=15, "y"=11)
	trash = /obj/item/trash/spacetwinkie
	nutriment_desc = list("sweetness" = 3, "cake" = 1)
	preloaded_reagents = list("sugar" = 4, "preservatives" = 5)
	matter = list(MATERIAL_BIOMATTER = 2)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/openable/liquidfood
	name = "\improper liquidfood ration"
	desc = "A prepackaged grey slurry of all the essential nutrients for a spacefarer on the go. Should this be crunchy?"
	alt_desc = "A prepackaged grey slurry of all the essential nutrients for a spacefarer on the go. Looking inside tends to loose your apatite."
	taste_tag = list(BLAND_FOOD)
	icon_state = "liquidfood" //Sprite by Michiyamenotehifunana
	trash = /obj/item/trash/liquidfood
	filling_color = "#A8A8A8"
	bitesize = 4
	center_of_mass = list("x"=16, "y"=15)
	nutriment_desc = list("chalk" = 6)
	nutriment_amt = 20
	preloaded_reagents = list("iron" = 3, "preservatives" = 5)
	matter = list(MATERIAL_BIOMATTER = 8)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/openable/tastybread
	name = "bread tube"
	desc = "Bread in a tube. Chewy...and surprisingly tasty."
	alt_desc = "Bread halfway in a tube. Chewy...and surprisingly tasty."
	taste_tag = list(SWEET_FOOD)
	icon_state = "tastybread" //Sprite by Michiyamenotehifunana
	trash = /obj/item/trash/tastybread
	filling_color = "#A66829"
	bitesize = 2
	center_of_mass = list("x"=17, "y"=16)
	nutriment_desc = list("bread" = 2, "sweetness" = 3)
	nutriment_amt = 4
	preloaded_reagents = list("preservatives" = 5)
	matter = list(MATERIAL_BIOMATTER = 3)
	junk_food = TRUE

////////////////////////////////////////////////Donks

/obj/item/reagent_containers/food/snacks/donkpocket
	name = "donk-pocket"
	desc = "Researches suggest that you might want to put a banging donk on it."
	icon_state = "donkpocket"
	taste_tag = list(MEAT_FOOD)
	filling_color = "#DEDEAB"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("heartiness" = 1, "dough" = 2)
	nutriment_amt = 2
	preloaded_reagents = list("protein" = 2, "preservatives" = 2)
	matter = list(MATERIAL_BIOMATTER = 2)
	junk_food = TRUE

	var/warm = 0
	var/list/heated_reagents = list("tricordrazine" = 5)
	proc/heat()
		warm = 1
		for(var/reagent in heated_reagents)
			reagents?.add_reagent(reagent, heated_reagents[reagent])
		bitesize = 6
		name = "Warm " + name
		cooltime()

	proc/cooltime()
		if (src.warm)
			spawn(4200)
				if(src)
					src.warm = 0
					src.name = initial(name)
					if(src.reagents)
						for(var/reagent in heated_reagents)
							src.reagents.del_reagent(reagent)

/obj/item/reagent_containers/food/snacks/donkpocket/sinpocket
	name = "\improper sin-pocket"
	desc = "The food of choice for the veteran. Do <B>NOT</B> overconsume."
	taste_tag = list(UMAMI_FOOD)
	filling_color = "#6D6D00"
	heated_reagents = list("doctorsdelight" = 5, "hyperzine" = 1, "preservatives" = 5)
	var/has_been_heated = 0
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/donkpocket/sinpocket/attack_self(mob/user)
	if(has_been_heated)
		to_chat(user, SPAN_NOTICE("The heating chemicals have already been spent."))
		return
	has_been_heated = 1
	user.visible_message(
		SPAN_NOTICE("[user] squeezes \the [src]."),
		"You crush \the [src] and feel a comfortable heat build up."
	)
	spawn(200)
		to_chat(user, "You think \the [src] is ready to eat about now.")
		heat()

