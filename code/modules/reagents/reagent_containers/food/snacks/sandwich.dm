/obj/item/reagent_containers/food/snacks/breadslice/attackby(obj/item/W as obj, mob/user as mob)

	if(istype(W,/obj/item/reagent_containers/food/snacks/butterslice))
		new /obj/item/reagent_containers/food/snacks/butterbread(src)
		to_chat(user, "You spread the butter on the toast.")
		qdel(W)
		qdel(src)

	if(istype(W,/obj/item/material/shard) || istype(W,/obj/item/reagent_containers/food/snacks))
		var/obj/item/reagent_containers/food/snacks/csandwich/S = new(get_turf(src))
		S.attackby(W,user)
		qdel(src)

	..()

/obj/item/reagent_containers/food/snacks/csandwich
	name = "sandwich"
	desc = "The best thing since sliced bread."
	icon_state = "breadslice"
	trash = /obj/item/trash/plate
	bitesize = 2

	var/list/ingredients = list()

/obj/item/reagent_containers/food/snacks/csandwich/attackby(obj/item/W as obj, mob/user as mob)

	var/sandwich_limit = 4
	for(var/obj/item/O in ingredients)
		if(istype(O,/obj/item/reagent_containers/food/snacks/breadslice))
			sandwich_limit += 4

	if(src.contents.len > sandwich_limit)
		to_chat(user, "\red If you put anything else on \the [src] it's going to collapse.")
		return
	else if(istype(W,/obj/item/material/shard))
		to_chat(user, SPAN_NOTICE("You hide [W] in \the [src]."))
		user.drop_from_inventory(W, src)
		update()
		return
	else if(istype(W,/obj/item/reagent_containers/food/snacks))
		to_chat(user, SPAN_NOTICE("You layer [W] over \the [src]."))
		var/obj/item/reagent_containers/F = W
		F.reagents.trans_to_obj(src, F.reagents.total_volume)
		user.drop_from_inventory(W, src)
		ingredients += W
		update()
		return
	..()

/obj/item/reagent_containers/food/snacks/csandwich/proc/update()
	var/fullname = "" //We need to build this from the contents of the var.
	var/i = 0

	cut_overlays()

	for(var/obj/item/reagent_containers/food/snacks/O in ingredients)

		i++
		if(i == 1)
			fullname += "[O.name]"
		else if(i == ingredients.len)
			fullname += " and [O.name]"
		else
			fullname += ", [O.name]"

		var/image/I = new(src.icon, "sandwich_filling")
		I.color = O.filling_color
		I.pixel_x = pick(list(-1,0,1))
		I.pixel_y = (i*2)+1
		add_overlay(I)

	var/image/T = new(src.icon, "sandwich_top")
	T.pixel_x = pick(list(-1,0,1))
	T.pixel_y = (ingredients.len * 2)+1
	add_overlay(T)

	name = lowertext("[fullname] sandwich")
	if(length(name) > 80) name = "[pick(list("absurd","colossal","enormous","ridiculous"))] sandwich"
	w_class = n_ceil(CLAMP((ingredients.len/2),2,4))

/obj/item/reagent_containers/food/snacks/csandwich/Destroy()
	for(var/obj/item/O in ingredients)
		qdel(O)
	. = ..()

/obj/item/reagent_containers/food/snacks/csandwich/examine(mob/user)
	..(user)
	var/obj/item/O = pick(contents)
	to_chat(user, SPAN_NOTICE("You think you can see [O.name] in there."))

/obj/item/reagent_containers/food/snacks/csandwich/attack(mob/M as mob, mob/user as mob, def_zone)
	var/obj/item/shard
	for(var/obj/item/O in contents)
		if(istype(O,/obj/item/material/shard))
			shard = O
			break

	var/mob/living/H
	if(isliving(M))
		H = M

	if(H && shard && M == user) //This needs a check for feeding the food to other people, but that could be abusable.
		to_chat(H, SPAN_WARNING("You lacerate your mouth on a [shard.name] in the sandwich!"))
		H.adjustBruteLoss(5) //TODO: Target head if human.
	..()

//None custom sandwiches

/obj/item/reagent_containers/food/snacks/muffinegg
	name = "muffin egg sandwich"
	desc = "A muffin sandwich consisting of fried egg and nadezhdian bacon, a good breakfast takeaway choice."
	icon_state = "muffinegg"
	taste_tag = list(FLOURY_FOOD, SALTY_FOOD)
	bitesize = 2
	nutriment_desc = list("bacon" = 5, "runny fried egg" = 5, "muffin" = 2)
	nutriment_amt = 6

/obj/item/reagent_containers/food/snacks/sandwich
	name = "sandwich"
	desc = "A grand creation of meat, cheese, bread, and several leaves of lettuce! Arthur Dent would be proud."
	icon_state = "sandwich"
	taste_tag = list(MEAT_FOOD, CHEESE_FOOD)
	filling_color = "#D9BE29"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=4)
	nutriment_desc = list("bread" = 3, "cheese" = 3)
	nutriment_amt = 8 //As much as two slices of pizza
	preloaded_reagents = list("protein" = 3)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/toastedsandwich
	name = "toasted sandwich"
	desc = "Your classic sandwich, grilled with butter to amp up its deliciousness factor tenfold."
	icon_state = "toastedsandwich"
	taste_tag = list(FLOURY_FOOD)
	filling_color = "#D9BE29"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=4)
	nutriment_desc = list("toasted bread" = 3, "cheese" = 3)
	nutriment_amt = 8
	preloaded_reagents = list("protein" = 6) // Who thought putting carbon on a FOOD was a good idea?!
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 17)

/obj/item/reagent_containers/food/snacks/toasted_guild_sandwich
	name = "deluxe toasted sandwich"
	desc = "A perfectly toasted sandwich with all the works."
	icon_state = "toastedsandwich"
	taste_tag = list(MEAT_FOOD, CHEESE_FOOD)
	filling_color = "#D9BE29"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=4)
	nutriment_desc = list("toasted bread" = 3, "cheese" = 3, "delux toasted sandwich" = 5)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 3, "greaser" = 3, "glucose" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 23)

/obj/item/reagent_containers/food/snacks/toastedsandwich/holy
	name = "precept sandwich"
	desc = "A classic sandwich grilled in butter and toasted perfectly. Comes packed with protein-rich meat made from mukwahs and cheese derived from tangu milk."
	preloaded_reagents = list("protein" = 10, "tangu_milk" = 10)

/obj/item/reagent_containers/food/snacks/grilledcheese
	name = "grilled cheese sandwich"
	desc = "Goes great with Tomato soup!"
	icon_state = "toastedsandwich"
	taste_tag = list(CHEESE_FOOD)
	filling_color = "#D9BE29"
	bitesize = 2
	nutriment_desc = list("toasted bread" = 3, "cheese" = 3)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 4)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 20)

/obj/item/reagent_containers/food/snacks/blt
	name = "BLT"
	desc = "A classic sandwich composed of nothing more than bacon, lettuce and tomato."
	icon_state = "blt"
	taste_tag = list(MEAT_FOOD, CHEESE_FOOD, UMAMI_FOOD)
	bitesize = 2
	nutriment_desc = list("toasted bread" = 3, "bacon" = 3, "tomato" = 2)
	nutriment_amt = 3

/obj/item/reagent_containers/food/snacks/twobread
	name = "two bread"
	desc = "It is very bitter and winy."
	icon_state = "twobread"
	taste_tag = list(FLOURY_FOOD)
	filling_color = "#DBCC9A"
	bitesize = 3
	center_of_mass = list("x"=15, "y"=12)
	nutriment_desc = list("sourness" = 2, "bread" = 2)
	nutriment_amt = 2
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/jellysandwich
	name = "jelly sandwich"
	desc = "You wish you had some peanut butter to go with this..."
	icon_state = "jellysandwich"
	taste_tag = list(FLOURY_FOOD, SWEET_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#9E3A78"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=8)
	nutriment_desc = list("bread" = 2)
	nutriment_amt = 2
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/food/snacks/jellysandwich/slime
	preloaded_reagents = list("slimejelly" = 5)

/obj/item/reagent_containers/food/snacks/jellysandwich/cherry
	preloaded_reagents = list("cherryjelly" = 5)

/obj/item/reagent_containers/food/snacks/cubancarp
	name = "cuban carp"
	desc = "A sandwich that burns your tongue and then leaves it numb!"
	icon_state = "cubancarp"
	taste_tag = list(SPICY_FOOD, MEAT_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#E9ADFF"
	bitesize = 3
	center_of_mass = list("x"=12, "y"=5)
	nutriment_desc = list("toasted bread" = 3)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 3, "capsaicin" = 3)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/icecreamsandwich
	name = "icecream sandwich"
	desc = "A classic icecream sandwiched between two chocolate cookies, an essential dessert to have by the dozen."
	icon_state = "icecreamsandwich"
	taste_tag = list(SWEET_FOOD)
	bitesize = 4
	nutriment_amt = 8
	nutriment_desc = list("icecream" = 10, "cookies" = 5, "perfection" = 15)
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/strawberrysandwich
	name = "strawberry icecream sandwich"
	desc = "A classic strawberry icecream sandwiched between two vanilla cookies, an essential treat to have by the dozen."
	icon_state = "icecreamsandwich_sb"
	taste_tag = list(SWEET_FOOD)
	bitesize = 4
	nutriment_amt = 8
	nutriment_desc = list("strawberry icecream" = 10, "cookies" = 5, "perfection" = 15)
	matter = list(MATERIAL_BIOMATTER = 8)
