/obj/item/reagent_containers/snacks/applecake
	name = "apple cake"
	desc = "A cake centred with apple."
	icon_state = "applecake"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/snacks/applecakeslice
	slices_num = 5
	filling_color = "#EBF5B8"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10, "apple" = 15)
	nutriment_amt = 15
	matter = list(MATERIAL_BIOMATTER = 25)

/obj/item/reagent_containers/snacks/applecakeslice
	name = "apple cake slice"
	desc = "A slice of apple cake."
	icon_state = "applecakeslice"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#EBF5B8"
	bitesize = 2
	nutriment_amt = 3
	center_of_mass = list("x"=16, "y"=14)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/snacks/birthdaycake
	name = "birthday cake"
	desc = "A cake noting the date of birth, typically the candle is not eaten."
	icon_state = "birthdaycake"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/snacks/birthdaycakeslice
	slices_num = 5
	filling_color = "#FFD6D6"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10)
	nutriment_amt = 20
	preloaded_reagents = list("sprinkles" = 10)
	matter = list(MATERIAL_BIOMATTER = 45)

/obj/item/reagent_containers/snacks/birthdaycakeslice
	name = "birthday cake slice"
	desc = "A slice of birthday cake."
	icon_state = "birthdaycakeslice"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#FFD6D6"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("nutriment" = 4, "sprinkles" = 2)
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/snacks/warcake
	name = "warcake"
	desc = "A note done in cream and frosting says: 'In memoriam to the sweetest Warcakey.' The candles on the cake never seem to burn out."
	icon_state = "birthdaycake"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/snacks/birthdaycakeslice
	slices_num = 5
	filling_color = "#FFB6C1"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("sweet memories" = 10, "unending sadness" = 10, "sour sweetness" = 5)
	nutriment_amt = 20
	preloaded_reagents = list("warcakesm" = 10, "warcakeus" = 10)
	matter = list(MATERIAL_BIOMATTER = 45)

/obj/item/reagent_containers/snacks/warcakeslice
	name = "warcake slice"
	desc = "A slice of bittersweet happiness."
	icon_state = "birthdaycakeslice"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "##FFB6C1"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("warcakesm" = 4, "warcakeus" = 4)
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/snacks/carrotcake
	name = "carrot cake"
	desc = "A cake made with carrots."
	icon_state = "carrotcake"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/snacks/carrotcakeslice
	slices_num = 5
	filling_color = "#FFD675"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10, "carrot" = 15)
	nutriment_amt = 25
	preloaded_reagents = list("imidazoline" = 10)
	matter = list(MATERIAL_BIOMATTER = 25)

/obj/item/reagent_containers/snacks/carrotcakeslice
	name = "carrot cake slice"
	desc = "Carrotty slice of carrot cake."
	icon_state = "carrotcake_slice"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#FFD675"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=14)
	nutriment_amt = 5
	nutriment_desc = list("cake" = 2, "sweetness" = 2, "carrot" = 3)
	preloaded_reagents = list("imidazoline" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/snacks/braincake
	name = "brain cake"
	desc = "A squishy cake-thing."
	icon_state = "braincake"
	taste_tag = list(MEAT_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/snacks/braincakeslice
	slices_num = 5
	filling_color = "#E6AEDB"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10, "slime" = 15)
	nutriment_amt = 5
	bitesize = 2
	preloaded_reagents = list("protein" = 25, "alkysine" = 10)
	matter = list(MATERIAL_BIOMATTER = 60)

/obj/item/reagent_containers/snacks/braincakeslice
	name = "brain cake slice"
	desc = "A slice of squishy cake-thing" //Lemme tell you something about prions. THEY'RE DELICIOUS
	icon_state = "braincakeslice"
	taste_tag = list(MEAT_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#E6AEDB"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=12)
	preloaded_reagents = list("protein" = 5, "nutriment" = 1, "alkysine" = 2)
	matter = list(MATERIAL_BIOMATTER = 12)

/obj/item/reagent_containers/snacks/cheesecake
	name = "cheese cake"
	desc = "A heavy cake made with cheese."
	icon_state = "cheesecake"
	taste_tag = list(CHEESE_FOOD, SWEET_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/snacks/cheesecakeslice
	slices_num = 5
	filling_color = "#FAF7AF"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "cream" = 10, "cheese" = 15)
	nutriment_amt = 10
	bitesize = 2
	preloaded_reagents = list("protein" = 15)
	matter = list(MATERIAL_BIOMATTER = 25)

/obj/item/reagent_containers/snacks/cheesecakeslice
	name = "cheese cake slice"
	desc = "A slice of cheese cake."
	icon_state = "cheesecake_slice"
	taste_tag = list(CHEESE_FOOD, SWEET_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#FAF7AF"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 3, "nutriment" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/snacks/plaincake
	name = "vanilla cake"
	desc = "A plain cake."
	icon_state = "plaincake"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/snacks/plaincakeslice
	slices_num = 5
	filling_color = "#F7EDD5"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10, "vanilla" = 15)
	nutriment_amt = 20
	matter = list(MATERIAL_BIOMATTER = 20)

/obj/item/reagent_containers/snacks/plaincakeslice
	name = "vanilla cake slice"
	desc = "A slice of cake."
	icon_state = "plaincake_slice"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#F7EDD5"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("nutriment" = 4)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 4)

/obj/item/reagent_containers/snacks/orangecake
	name = "orange cake"
	desc = "A cake with added orange."
	icon_state = "orangecake"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/snacks/orangecakeslice
	slices_num = 5
	filling_color = "#FADA8E"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10, "orange" = 15)
	nutriment_amt = 20
	matter = list(MATERIAL_BIOMATTER = 25)

/obj/item/reagent_containers/snacks/orangecakeslice
	name = "orange cake slice"
	desc = "A slice of orange cake."
	icon_state = "orangecake_slice"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#FADA8E"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("nutriment" = 4)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/snacks/limecake
	name = "lime cake"
	desc = "A cake with added lime."
	icon_state = "limecake"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/snacks/limecakeslice
	slices_num = 5
	filling_color = "#CBFA8E"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10, "lime" = 15)
	nutriment_amt = 20
	matter = list(MATERIAL_BIOMATTER = 25)

/obj/item/reagent_containers/snacks/limecakeslice
	name = "lime cake slice"
	desc = "A slice of lime cake."
	icon_state = "limecake_slice"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#CBFA8E"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("nutriment" = 4)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/snacks/lemoncake
	name = "lemon cake"
	desc = "A cake with added lemon."
	icon_state = "lemoncake"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/snacks/lemoncakeslice
	slices_num = 5
	filling_color = "#FAFA8E"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10, "lemon" = 15)
	nutriment_amt = 20
	matter = list(MATERIAL_BIOMATTER = 25)

/obj/item/reagent_containers/snacks/lemoncakeslice
	name = "lemon cake slice"
	desc = "A slice of lemon cake."
	icon_state = "lemoncake_slice"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#FAFA8E"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("nutriment" = 4)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/snacks/chocolatecake
	name = "chocolate cake"
	desc = "A cake with added chocolate."
	icon_state = "chocolatecake"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD, COCO_FOOD)
	slice_path = /obj/item/reagent_containers/snacks/chocolatecakeslice
	slices_num = 5
	filling_color = "#805930"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10, "chocolate" = 15)
	nutriment_amt = 20
	matter = list(MATERIAL_BIOMATTER = 30)

/obj/item/reagent_containers/snacks/chocolatecakeslice
	name = "chocolate cake slice"
	desc = "A slice of chocolate cake."
	icon_state = "chocolatecake_slice"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD, COCO_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#805930"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("nutriment" = 4)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/snacks/brownie
	name = "brownies"
	desc = "A huge rectangular brownie ready to be sliced and shared."
	icon_state = "brownies"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD, COCO_FOOD)
	trash = /obj/item/trash/waffles
	filling_color = "#362008"
	slice_path = /obj/item/reagent_containers/snacks/brownieslice
	slices_num = 5
	nutriment_amt = 20
	nutriment_desc = list("buttery goodness" = 10, "sweetness" = 10, "chocolate" = 15)
	matter = list(MATERIAL_BIOMATTER = 30)

/obj/item/reagent_containers/snacks/brownieslice
	name = "brownie slice"
	desc = "A buttery chocolate brownie."
	icon_state = "brownieslice"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD, COCO_FOOD)
	filling_color = "#362008"
	trash = /obj/item/trash/plate
	bitesize = 2
	nutriment_amt = 4
	nutriment_desc = list("buttery goodness" = 5, "sweetness" = 5, "chocolate" = 10)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 6)

///////////////Pies//////////////

/obj/item/reagent_containers/snacks/pumpkinpie
	name = "pumpkin pie"
	desc = "A seasonal treat for the autumn months."
	icon_state = "pumpkinpie"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/snacks/pumpkinpieslice
	slices_num = 5
	filling_color = "#F5B951"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("pie" = 5, "cream" = 5, "pumpkin" = 5)
	nutriment_amt = 15
	matter = list(MATERIAL_BIOMATTER = 25)

/obj/item/reagent_containers/snacks/pumpkinpieslice
	name = "pumpkin pie slice"
	desc = "A slice of pumpkin pie, with whipped cream on top."
	icon_state = "pumpkinpieslice"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#F5B951"
	bitesize = 2
	nutriment_amt = 3
	center_of_mass = list("x"=16, "y"=12)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)


/obj/item/reagent_containers/snacks/pie
	name = "banana cream pie"
	desc = "A banana cream pie ready for an afternoon snack or to be used as a prop for an act."
	icon_state = "pie"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#FBFFB8"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=13)
	nutriment_desc = list("pie" = 3, "cream" = 2)
	nutriment_amt = 4
	preloaded_reagents = list("banana" = 5)
	matter = list(MATERIAL_BIOMATTER = 15)
	cooked = TRUE

/obj/item/reagent_containers/snacks/pie/throw_impact(atom/hit_atom)
	..()
	new/obj/effect/decal/cleanable/pie_smudge(src.loc)
	src.visible_message(
		SPAN_DANGER("\The [src.name] splats."),
		SPAN_DANGER("You hear a splat.")
	)
	qdel(src)

/obj/item/reagent_containers/snacks/berryclafoutis
	name = "berry clafoutis"
	desc = "A pie made with berries."
	icon_state = "berryclafoutis"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	bitesize = 3
	trash = /obj/item/trash/plate
	center_of_mass = list("x"=16, "y"=13)
	nutriment_desc = list("sweetness" = 2, "pie" = 3)
	nutriment_amt = 4
	preloaded_reagents = list("berryjuice" = 5)
	matter = list(MATERIAL_BIOMATTER = 12)
	cooked = TRUE

/obj/item/reagent_containers/snacks/applepie
	name = "apple pie"
	desc = "A pie containing apple."
	icon_state = "applepie"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	filling_color = "#E0EDC5"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=13)
	nutriment_desc = list("sweetness" = 2, "apple" = 2, "pie" = 2)
	nutriment_amt = 4
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/snacks/cherrypie
	name = "cherry pie"
	desc = "A pie containing cherries."
	icon_state = "cherrypie"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	filling_color = "#FF525A"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("sweetness" = 2, "cherry" = 2, "pie" = 2)
	nutriment_amt = 4
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/snacks/meatpie
	name = "meat pie"
	icon_state = "meatpie"
	taste_tag = list(MEAT_FOOD, FLOURY_FOOD)
	desc = "A pie stuffed with meats rather than fruits or vegetables."
	trash = /obj/item/trash/plate
	filling_color = "#948051"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("protein" = 10)
	matter = list(MATERIAL_BIOMATTER = 22)
	cooked = TRUE

/obj/item/reagent_containers/snacks/tofupie
	name = "tofu-pie"
	icon_state = "meatpie"
	taste_tag = list(BLAND_FOOD, FLOURY_FOOD)
	desc = "A tofu pie."
	trash = /obj/item/trash/plate
	filling_color = "#FFFEE0"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	nutriment_desc = list("tofu" = 2, "pie" = 8)
	nutriment_amt = 10
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 12)

/obj/item/reagent_containers/snacks/amanita_pie
	name = "amanita pie"
	desc = "A pie made with amanita fungi."
	icon_state = "amanita_pie"
	taste_tag = list(UMAMI_FOOD, FLOURY_FOOD)
	filling_color = "#FFCCCC"
	bitesize = 3
	center_of_mass = list("x"=17, "y"=9)
	nutriment_desc = list("sweetness" = 3, "mushroom" = 3, "pie" = 2)
	nutriment_amt = 5
	preloaded_reagents = list("amatoxin" = 3, "psilocybin" = 1)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 12)

/obj/item/reagent_containers/snacks/plump_pie
	name = "plump pie"
	desc = "A heavy pie made with plump helmets mushrooms"
	icon_state = "plump_pie"
	taste_tag = list(UMAMI_FOOD, FLOURY_FOOD)
	filling_color = "#B8279B"
	bitesize = 2
	center_of_mass = list("x"=17, "y"=9)
	nutriment_desc = list("heartiness" = 2, "mushroom" = 3, "pie" = 3)
	nutriment_amt = 8
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 12)

/obj/item/reagent_containers/snacks/plump_pie/Initialize(mapload)
	. = ..()
	if(prob(10))
		name = "exceptional plump pie"
		//desc = "Microwave is taken by a fey mood! It has cooked an exceptional plump pie!"
		reagents.add_reagent("tricordrazine", 5)
		matter = list(MATERIAL_BIOMATTER = 18)

/obj/item/reagent_containers/snacks/xemeatpie
	name = "xeno-pie"
	icon_state = "xenomeatpie"
	taste_tag = list(MEAT_FOOD, FLOURY_FOOD)
	desc = "A meatpie, using exotic xenomorph meat."
	trash = /obj/item/trash/plate
	filling_color = "#43DE18"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("protein" = 10)
	matter = list(MATERIAL_BIOMATTER = 18)
