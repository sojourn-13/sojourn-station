/obj/item/reagent_containers/food/snacks/donut
	name = "donut"
	desc = "Goes great with Robust Coffee."
	icon_state = "donut1"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	filling_color = "#D9C386"
	var/overlay_state = "box-donut1"
	center_of_mass = list("x"=13, "y"=16)
	nutriment_desc = list("sweetness" = 2, "donut" = 3)

/obj/item/reagent_containers/food/snacks/donut/normal
	name = "donut"
	desc = "Goes great with Robust Coffee."
	icon_state = "donut1"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	bitesize = 3
	nutriment_amt = 1
	preloaded_reagents = list("sprinkles" = 1, "preservatives" = 2)

/obj/item/reagent_containers/food/snacks/donut/normal/Initialize(mapload)
	. = ..()
	if(prob(30))
		icon_state = "donut2"
		overlay_state = "box-donut2"
		name = "frosted donut"
		reagents.add_reagent("sprinkles", 2)
		center_of_mass = list("x"=19, "y"=16)

/obj/item/reagent_containers/food/snacks/donut/chaos
	name = "chaos donut"
	desc = "Like life, it never quite tastes the same."
	icon_state = "donut1"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	filling_color = "#ED11E6"
	nutriment_amt = 1
	bitesize = 10
	preloaded_reagents = list("sprinkles" = 1, "preservatives" = 2)
	matter = list(MATERIAL_BIOMATTER = 12)

/obj/item/reagent_containers/food/snacks/donut/chaos/Initialize(mapload)
	. = ..()
	var/chaosselect = pick(1,2,3,4,5,6,7,8,9,10)
	switch(chaosselect)
		if(1)
			reagents.add_reagent("nutriment", 3)
		if(2)
			reagents.add_reagent("capsaicin", 3)
		if(3)
			reagents.add_reagent("frostoil", 3)
		if(4)
			reagents.add_reagent("sprinkles", 3)
		if(5)
			reagents.add_reagent("plasma", 3)
		if(6)
			reagents.add_reagent("coco", 3)
		if(7)
			reagents.add_reagent("slimejelly", 3)
		if(8)
			reagents.add_reagent("banana", 3)
		if(9)
			reagents.add_reagent("berryjuice", 3)
		if(10)
			reagents.add_reagent("tricordrazine", 3)
	if(prob(30))
		icon_state = "donut2"
		overlay_state = "box-donut2"
		name = "Frosted Chaos Donut"
		reagents.add_reagent("sprinkles", 2)


/obj/item/reagent_containers/food/snacks/donut/jelly
	name = "jelly donut"
	desc = "You jelly?"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	icon_state = "jdonut1"
	filling_color = "#ED1169"
	center_of_mass = list("x"=16, "y"=11)
	nutriment_amt = 1
	bitesize = 5
	preloaded_reagents = list("sprinkles" = 1, "berryjuice" = 5, "preservatives" = 2)
	matter = list(MATERIAL_BIOMATTER = 4)

/obj/item/reagent_containers/food/snacks/donut/slimejelly/Initialize(mapload)
	. = ..()
	if(prob(30))
		icon_state = "jdonut2"
		overlay_state = "box-donut2"
		name = "Frosted Jelly Donut"
		reagents.add_reagent("sprinkles", 2)

/obj/item/reagent_containers/food/snacks/donut/slimejelly
	name = "jelly donut"
	desc = "You jelly?"
	icon_state = "jdonut1"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	filling_color = "#ED1169"
	center_of_mass = list("x"=16, "y"=11)
	nutriment_amt = 1
	bitesize = 5
	preloaded_reagents = list("sprinkles" = 1, "slimejelly" = 5, "preservatives" = 2)
	matter = list(MATERIAL_BIOMATTER = 4)

/obj/item/reagent_containers/food/snacks/donut/slimejelly/Initialize(mapload)
	. = ..()
	if(prob(30))
		icon_state = "jdonut2"
		overlay_state = "box-donut2"
		name = "Frosted Jelly Donut"
		reagents.add_reagent("sprinkles", 2)

/obj/item/reagent_containers/food/snacks/donut/cherryjelly
	name = "jelly donut"
	desc = "You jelly?"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	icon_state = "jdonut1"
	filling_color = "#ED1169"
	bitesize = 5
	center_of_mass = list("x"=16, "y"=11)
	nutriment_amt = 1
	preloaded_reagents = list("sprinkles" = 1, "cherryjelly" = 5, "preservatives" = 2)
	matter = list(MATERIAL_BIOMATTER = 4)

/obj/item/reagent_containers/food/snacks/donut/cherryjelly/Initialize(mapload)
	. = ..()
	if(prob(30))
		icon_state = "jdonut2"
		overlay_state = "box-donut2"
		name = "Frosted Jelly Donut"
		reagents.add_reagent("sprinkles", 2)


/obj/item/reagent_containers/food/snacks/donut/stat_buff
	name = "Masterpiece Donut"
	desc = "The taste you will never forget."
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	filling_color = "#ED1169"
	bitesize = 5
	center_of_mass = list("x"=16, "y"=11)
	var/list/stats_buff = list()
	var/buff_power = 12 //Viable to use
	price_tag = 500
	var/buff_time = 20 MINUTES
	nutriment_amt = 1
	preloaded_reagents = list("sprinkles" = 2, "preservatives" = 2)
	matter = list(MATERIAL_BIOMATTER = 10)

/obj/item/reagent_containers/food/snacks/donut/stat_buff/On_Consume(var/mob/eater, var/mob/feeder = null)
	..()
	if(eater.stats)
		for(var/stat in stats_buff)
			if(eater.stats.getTempStat(stat, "donut"))
				eater.stats.removeTempStat(stat, "donut")
				eater.stats.addTempStat(stat, buff_power, buff_time, "donut")
				to_chat(eater, SPAN_NOTICE("Your knowledge of [stat] feels renewed."))
			eater.stats.addTempStat(stat, buff_power, buff_time, "donut")
			to_chat(eater, SPAN_NOTICE("Your knowledge of [stat] is increased for a short period of time. Make use of it."))

/obj/item/reagent_containers/food/snacks/donut/stat_buff/mec
	name = "Yellow Masterpiece Donut"
	desc = "The sour citrus flavor you will never forget. A choice sweet of mechanics."
	icon_state = "donut_mec"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	overlay_state = "donut_mec_c"
	stats_buff = list(STAT_MEC)
	preloaded_reagents = list("sprinkles" = 1, "lemonjuice" = 1, "preservatives" = 2)

/obj/item/reagent_containers/food/snacks/donut/stat_buff/cog
	name = "Purple Masterpiece Donut"
	desc = "The too-sweet artificial grape taste you will never forget. An intellectual's favorite."
	icon_state = "donut_cog"
	overlay_state = "donut_cog_c"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	stats_buff = list(STAT_COG)
	preloaded_reagents = list("sprinkles" = 1, "grapejuice" = 1, "preservatives" = 2)

/obj/item/reagent_containers/food/snacks/donut/stat_buff/bio
	name = "Green Masterpiece Donut"
	desc = "The fresh spearmint flavor you will never forget. Perfect for an immaculate doctor."
	icon_state = "donut_bio"
	overlay_state = "donut_bio_c"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	stats_buff = list(STAT_BIO)
	preloaded_reagents = list("sprinkles" = 1, "mint" = 1, "preservatives" = 2)

/obj/item/reagent_containers/food/snacks/donut/stat_buff/rob
	name = "Brown Masterpiece Donut"
	desc = "A near-chocolate taste you will never forget. A robust flavor for the strong."
	icon_state = "donut_rob"
	overlay_state = "donut_rob_c"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	stats_buff = list(STAT_ROB)
	preloaded_reagents = list("sprinkles" = 1, "coco" = 1, "preservatives" = 2)

/obj/item/reagent_containers/food/snacks/donut/stat_buff/tgh
	name = "Cream Masterpiece Donut"
	desc = "The classic donut flavor you will never forget. Specially panders to tough people."
	icon_state = "donut_tgh"
	overlay_state = "donut_tgh_c"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	stats_buff = list(STAT_TGH)

/obj/item/reagent_containers/food/snacks/donut/stat_buff/vig
	name = "Blue Masterpiece Donut"
	desc = "A tart blueberry taste you will never forget. A go-to choice for the vigilant watchman."
	icon_state = "donut_vig"
	overlay_state = "donut_vig_c"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	stats_buff = list(STAT_VIG)
	preloaded_reagents = list("sprinkles" = 1, "berryjuice" = 1, "preservatives" = 2)
