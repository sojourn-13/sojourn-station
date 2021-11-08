//Food items that are eaten normally and don't leave anything behind.
#define COGBUFF 1
#define MECBUFF 2
#define BIOBUFF 3
#define ROBBUFF 4
#define TGHBUFF 5
#define VIGBUFF 6
#define MONEYBUFF 7
#define NUTBUFF 8
#define HEALBUFF 9
/obj/item/reagent_containers/food/snacks
	name = "snack"
	desc = "yummy"
	icon = 'icons/obj/food.dmi'
	icon_state = null
	var/bitesize = 1
	var/bitecount = 0
	var/trash = null
	var/slice_path
	var/slices_num
	var/dried_type = null
	var/dry = 0
	var/dryness = 0 //Used by drying rack. Represents progress towards Dry state
	var/nutriment_amt = 0
	var/list/nutriment_desc = list("food" = 1)
	center_of_mass = list("x"=16, "y"=16)
	w_class = ITEM_SIZE_SMALL

	var/sanity_gain = 0.2 //Per bite
	var/cooked = FALSE
	var/appraised = 0 //Has this piece of food been appraised? We can only do that once.
	var/chef_buff_type = 0 //What type of buff does this have to it?

/obj/item/reagent_containers/food/snacks/Initialize()
	. = ..()
	if(nutriment_amt)
		reagents.add_reagent("nutriment", nutriment_amt, nutriment_desc)

	//Placeholder for effect that trigger on eating that aren't tied to reagents.
/obj/item/reagent_containers/food/snacks/proc/On_Consume(var/mob/eater, var/mob/feeder = null)
	if(!reagents.total_volume)
		eater.visible_message(
			SPAN_NOTICE("[eater] finishes eating \the [src]."),
			SPAN_NOTICE("You finish eating \the [src].")
		)
		if (!feeder)
			feeder = eater

		if(appraised == 1)
			var/cheftimer = 30 MINUTES
			switch(chef_buff_type)
				if(1)
					if(eater.stats)
						if(eater.stats.getTempStat(stat,"spicyfood"))
							eater.stats.removeTempStat(stat, "spicyfood")
							eater.stats.addTempStat(STAT_COG, 15, cheftimer, "spicyfood")
							to_chat(eater, SPAN_NOTICE("Your knowledge of Cognition feels renewed after eating something this delicious!"))
					eater.stats.addTempStat(STAT_COG, 15, cheftimer, "spicyfood")
					to_chat(eater, SPAN_NOTICE("Your knowledge of Cognition is increased for a short period of time after eating something delicious. Make use of it."))
				if(2)
					if(eater.stats)
						if(eater.stats.getTempStat(stat,"spicyfood"))
							eater.stats.removeTempStat(stat, "spicyfood")
							eater.stats.addTempStat(STAT_MEC, 15, cheftimer, "spicyfood")
							to_chat(eater, SPAN_NOTICE("Your knowledge of Cognition feels renewed after eating something this delicious!"))
					eater.stats.addTempStat(STAT_MEC, 15, cheftimer, "spicyfood")
					to_chat(eater, SPAN_NOTICE("Your knowledge of Mechanical is increased for a short period of time after eating something delicious. Make use of it."))
				if(3)
					if(eater.stats)
						if(eater.stats.getTempStat(stat,"spicyfood"))
							eater.stats.removeTempStat(stat, "spicyfood")
							eater.stats.addTempStat(STAT_BIO, 15, cheftimer, "spicyfood")
							to_chat(eater, SPAN_NOTICE("Your knowledge of Cognition feels renewed after eating something this delicious!"))
					eater.stats.addTempStat(STAT_BIO, 15, cheftimer, "spicyfood")
					to_chat(eater, SPAN_NOTICE("Your knowledge of Biology is increased for a short period of time after eating something delicious. Make use of it."))
				if(4)
					if(eater.stats)
						if(eater.stats.getTempStat(stat,"spicyfood"))
							eater.stats.removeTempStat(stat, "spicyfood")
							eater.stats.addTempStat(STAT_ROB, 15, cheftimer, "spicyfood")
							to_chat(eater, SPAN_NOTICE("Your knowledge of Robustness feels renewed after eating something this delicious!"))
					eater.stats.addTempStat(STAT_ROB, 15, cheftimer, "spicyfood")
					to_chat(eater, SPAN_NOTICE("Your knowledge of Robustness is increased for a short period of time after eating something delicious. Make use of it."))
				if(5)
					if(eater.stats)
						if(eater.stats.getTempStat(stat,"spicyfood"))
							eater.stats.removeTempStat(stat, "spicyfood")
							eater.stats.addTempStat(STAT_TGH, 15, cheftimer, "spicyfood")
							to_chat(eater, SPAN_NOTICE("Your knowledge of Toughness feels renewed after eating something this delicious!"))
					eater.stats.addTempStat(STAT_TGH, 15, cheftimer, "spicyfood")
					to_chat(eater, SPAN_NOTICE("Your knowledge of Toughness is increased for a short period of time after eating something delicious. Make use of it."))
				if(6)
					if(eater.stats)
						if(eater.stats.getTempStat(stat,"spicyfood"))
							eater.stats.removeTempStat(stat, "spicyfood")
							eater.stats.addTempStat(STAT_VIG, 15, cheftimer, "spicyfood")
							to_chat(eater, SPAN_NOTICE("Your knowledge of Vigilance feels renewed after eating something this delicious!"))
					eater.stats.addTempStat(STAT_VIG, 15, cheftimer, "spicyfood")
					to_chat(eater, SPAN_NOTICE("Your knowledge of Vigilance is increased for a short period of time after eating something delicious. Make use of it."))
				if(9)
					if(eater.stats)
						var/mob/living/carbon/M = eater
						M.adjustToxLoss(-((8 + (M.getToxLoss() * 0.1)) * 1))
						M.heal_organ_damage(14, 14)


		feeder.drop_from_inventory(src)	//so icons update :[

		if(trash)
			if(ispath(trash,/obj/item))
				var/obj/item/TrashItem = new trash(feeder)
				if(isanimal(feeder))
					TrashItem.forceMove(loc)
				else
					feeder.put_in_hands(TrashItem)
			else if(istype(trash,/obj/item))
				feeder.put_in_hands(trash)
		qdel(src)

/obj/item/reagent_containers/food/snacks/attack_self(mob/user as mob)
	return

/obj/item/reagent_containers/food/snacks/attack(mob/M as mob, mob/user as mob, def_zone)
	if(!reagents.total_volume)
		to_chat(user, SPAN_DANGER("None of [src] left!"))
		user.drop_from_inventory(src)
		qdel(src)
		return 0

	if(iscarbon(M))
		//TODO: replace with standard_feed_mob() call.
		var/mob/living/carbon/C = M
		var/mob/living/carbon/human/H = M
		var/fullness_modifier = 1
		if(istype(H))
			fullness_modifier = 100 / H.get_organ_efficiency(OP_STOMACH)
		var/fullness = (C.nutrition + (C.reagents.get_reagent_amount("nutriment") * 25)) * fullness_modifier
		if(C == user)								//If you're eating it yourself
			if(istype(H))
				if(!H.check_has_mouth())
					to_chat(user, "Where do you intend to put \the [src]? You don't have a mouth!")
					return
				var/obj/item/blocked = H.check_mouth_coverage()
				if(blocked)
					to_chat(user, SPAN_WARNING("\The [blocked] is in the way!"))
					return

			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //puts a limit on how fast people can eat/drink things
			if (fullness <= 50)
				to_chat(C, SPAN_DANGER("You hungrily chew out a piece of [src] and gobble it!"))
			if (fullness > 50 && fullness <= 150)
				to_chat(C, SPAN_NOTICE("You hungrily begin to eat [src]."))
			if (fullness > 150 && fullness <= 350)
				to_chat(C, SPAN_NOTICE("You take a bite of [src]."))
			if (fullness > 350 && fullness <= 550)
				to_chat(C, SPAN_NOTICE("You unwillingly chew a bit of [src]."))
			if (fullness > 550)
				to_chat(C, SPAN_DANGER("You cannot force any more of [src] to go down your throat."))
				return 0
		else
			if(!M.can_force_feed(user, src))
				return

			if (fullness <= 550)
				user.visible_message(SPAN_DANGER("[user] attempts to feed [M] [src]."))
			else
				user.visible_message(SPAN_DANGER("[user] cannot force anymore of [src] down [M]'s throat."))
				return 0

			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			if(!do_mob(user, M)) return

			M.attack_log += text("\[[time_stamp()]\] <font color='orange'>Has been fed [src.name] by [user.name] ([user.ckey]) Reagents: [reagents.log_list()]</font>")
			user.attack_log += text("\[[time_stamp()]\] <font color='red'>Fed [src.name] by [M.name] ([M.ckey]) Reagents: [reagents.log_list()]</font>")
			msg_admin_attack("[key_name(user)] fed [key_name(M)] with [src.name] Reagents: [reagents.log_list()] (INTENT: [uppertext(user.a_intent)])")

			user.visible_message(SPAN_DANGER("[user] feeds [M] [src]."))

		if(reagents)			//Handle ingestion of the reagent.
			playsound(M.loc,pick(M.eat_sounds), rand(10,50), 1)
			if(reagents.total_volume)
				var/amount_eaten = min(reagents.total_volume, bitesize)
				reagents.trans_to_mob(M, amount_eaten, CHEM_INGEST)
				if(istype(H))
					H.sanity.onEat(src, amount_eaten)
				bitecount++
				On_Consume(M, user)
			return 1

	else if (isanimal(M))
		var/mob/living/simple_animal/SA = M
		SA.scan_interval = SA.min_scan_interval//Feeding an animal will make it suddenly care about food

		var/m_bitesize = bitesize * SA.bite_factor//Modified bitesize based on creature size
		var/amount_eaten = m_bitesize

		if(reagents && SA.reagents)
			m_bitesize = min(m_bitesize, reagents.total_volume)
			//If the creature can't even stomach half a bite, then it eats nothing
			if (!SA.can_eat() || ((user.reagents.maximum_volume - user.reagents.total_volume) < m_bitesize * 0.5))
				amount_eaten = 0
			else
				amount_eaten = reagents.trans_to_mob(SA, m_bitesize, CHEM_INGEST)
		else
			return 0//The target creature can't eat

		if (amount_eaten)
			playsound(M.loc,pick(M.eat_sounds), rand(10,30), 1)
			bitecount++
			if (amount_eaten >= m_bitesize)
				user.visible_message(SPAN_NOTICE("[user] feeds [src] to [M]."))
			else
				user.visible_message(SPAN_NOTICE("[user] feeds [M] a tiny bit of [src]. <b>It looks full.</b>"))
				if (!istype(M.loc, /turf))
					to_chat(M, SPAN_NOTICE("[user] feeds you a tiny bit of [src]. <b>You feel pretty full!</b>"))
			On_Consume(M, user)
			return 1
		else
			to_chat(user, SPAN_WARNING("[M.name] can't stomach anymore food!"))

	return 0

/obj/item/reagent_containers/food/snacks/examine(mob/user)
	if(!..(user, 1))
		return
	if (bitecount==0)
		return
	else if (bitecount==1)
		to_chat(user, SPAN_NOTICE("\The [src] was bitten by someone!"))
	else if (bitecount<=3)
		to_chat(user, SPAN_NOTICE("\The [src] was bitten [bitecount] time\s!"))
	else
		to_chat(user, SPAN_NOTICE("\The [src] was bitten multiple times!"))

/obj/item/reagent_containers/food/snacks/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/storage))
		..() // -> item/attackby()
		return

	// Eating with forks
	if(istype(W,/obj/item/material/kitchen/utensil))
		var/obj/item/material/kitchen/utensil/U = W
		if(U.scoop_food)
			if(!U.reagents)
				U.create_reagents(5)

			if (U.reagents.total_volume > 0)
				to_chat(user, SPAN_WARNING("You already have something on your [U]."))
				return

			user.visible_message( \
				"\The [user] scoops up some [src] with \the [U]!", \
				SPAN_NOTICE("You scoop up some [src] with \the [U]!") \
			)

			src.bitecount++
			U.cut_overlays()
			U.loaded = "[src]"
			var/image/I = new(U.icon, "loadedfood")
			I.color = src.filling_color
			U.add_overlay(I)

			reagents.trans_to_obj(U, min(reagents.total_volume,5))

			if (reagents.total_volume <= 0)
				qdel(src)
			return

	if (is_sliceable())
		//these are used to allow hiding edge items in food that is not on a table/tray
		var/can_slice_here = isturf(src.loc) && ((locate(/obj/structure/table) in src.loc) || (locate(/obj/machinery/optable) in src.loc) || (locate(/obj/item/tray) in src.loc))

		if (has_edge(W) || (QUALITY_CUTTING in W.tool_qualities))
			if (!can_slice_here)
				to_chat(user, SPAN_WARNING("You cannot slice \the [src] here! You need a table or at least a tray to do it."))
				return

			var/slices_lost = 0
			if (W.w_class > ITEM_SIZE_NORMAL)
				user.visible_message(SPAN_NOTICE("\The [user] crudely slices \the [src] with [W]!"), SPAN_NOTICE("You crudely slice \the [src] with your [W]!"))
				slices_lost = rand(1,min(1,round(slices_num/2)))
			else
				user.visible_message(SPAN_NOTICE("\The [user] slices \the [src]!"), SPAN_NOTICE("You slice \the [src]!"))

			var/reagents_per_slice = reagents.total_volume/slices_num
			for(var/i=1 to (slices_num-slices_lost))
				var/obj/slice = new slice_path (src.loc)
				reagents.trans_to_obj(slice, reagents_per_slice)
			qdel(src)
			return

/obj/item/reagent_containers/food/snacks/proc/is_sliceable()
	return (slices_num && slice_path && slices_num > 0)

/obj/item/reagent_containers/food/snacks/Destroy()
	if(contents)
		for(var/atom/movable/something in contents)
			something.forceMove(get_turf(src))
	. = ..()

////////////////////////////////////////////////////////////////////////////////
/// FOOD END
////////////////////////////////////////////////////////////////////////////////
/obj/item/reagent_containers/food/snacks/attack_generic(var/mob/living/user)
	if(!isanimal(user) && !isalien(user))
		return

	var/amount_eaten = bitesize
	var/m_bitesize = bitesize

	if (isanimal(user))
		var/mob/living/simple_animal/SA = user
		m_bitesize = bitesize * SA.bite_factor//Modified bitesize based on creature size
		amount_eaten = m_bitesize
		if (!SA.can_eat())
			to_chat(user, "<span class='danger'>You're too full to eat anymore!</span>")
			return

	if(reagents && user.reagents)
		reagents.trans_to_mob(user, bitesize, CHEM_INGEST)
		m_bitesize = min(m_bitesize, reagents.total_volume)
		//If the creature can't even stomach half a bite, then it eats nothing
		if (((user.reagents.maximum_volume - user.reagents.total_volume) < m_bitesize * 0.5))
			amount_eaten = 0
		else
			amount_eaten = reagents.trans_to_mob(user, m_bitesize, CHEM_INGEST)
	if (amount_eaten)
		playsound(user.loc,pick(user.eat_sounds), rand(10,30), 1)
		shake_animation(5)
		bitecount++
		if (amount_eaten < m_bitesize)
			to_chat(user, SPAN_NOTICE("You reluctantly nibble a tiny part of \the [src]. <b>You can't stomach much more!</b>."))
		else
			to_chat(user, SPAN_NOTICE("You nibble away at \the [src]."))
	else
		to_chat(user, "<span class='danger'>You're too full to eat anymore!</span>")

	spawn(5)
		if(!src && !user.client)
			user.custom_emote(1,"[pick("burps", "cries for more", "burps twice", "looks at the area where the food was")]")
			qdel(src)
	On_Consume(user)

//////////////////////////////////////////////////
////////////////////////////////////////////Snacks
//////////////////////////////////////////////////
//Items in the "Snacks" subcategory are food items that people actually eat. The key points are that they are created
//	already filled with reagents and are destroyed when empty. Additionally, they make a "munching" noise when eaten.

//Notes by Darem: Food in the "snacks" subtype can hold a maximum of 50 units Generally speaking, you don't want to go over 40
//	total for the item because you want to leave space for extra condiments. If you want effect besides healing, add a reagent for
//	it. Try to stick to existing reagents when possible (so if you want a stronger healing effect, just use Tricordrazine). On use
//	effect (such as the old officer eating a donut code) requires a unique reagent (unless you can figure out a better way).

//The nutriment reagent and bitesize variable replace the old heal_amt and amount variables. Each unit of nutriment is equal to
//	2 of the old heal_amt variable. Bitesize is the rate at which the reagents are consumed. So if you have 6 nutriment and a
//	bitesize of 2, then it'll take 3 bites to eat. Unlike the old system, the contained reagents are evenly spread among all
//	the bites. No more contained reagents = no more bites.

//Here is an example of the new formatting for anyone who wants to add more food items.
///obj/item/reagent_containers/food/snacks/xenoburger		//Identification path for the object.
//	name = "Xenoburger"												//Name that displays in the UI.
//	desc = "Smells caustic. Tastes like heresy."					//Duh
//	icon_state = "xburger"											//Refers to an icon in food.dmi
//	bitesize = 3													//This is the amount each bite consumes.
//	preloaded_reagents = list("xenomicrobes" = 10, "nutriment" = 2)			//This is what is in the food item.




/obj/item/reagent_containers/food/snacks/aesirsalad
	name = "aesir salad"
	desc = "Probably too incredible for mortal men to fully enjoy."
	icon_state = "aesirsalad"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#468C00"
	center_of_mass = list("x"=17, "y"=11)
	nutriment_amt = 8
	nutriment_desc = list("apples" = 3,"salad" = 5)
	preloaded_reagents = list("doctorsdelight" = 8, "tricordrazine" = 8)
	matter = list(MATERIAL_BIOMATTER = 13)
	bitesize = 3
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/candy
	name = "candy bar"
	desc = "An unbranded nougat candy bar. Sugary."
	icon_state = "candy"
	trash = /obj/item/trash/candy
	filling_color = "#7D5F46"
	bitesize = 2
	center_of_mass = list("x"=15, "y"=15)
	nutriment_amt = 1
	nutriment_desc = list("candy" = 1)
	preloaded_reagents = list("sugar" = 3)
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/candy/donor
	name = "donor candy"
	desc = "A little treat for blood donors."
	bitesize = 5
	trash = /obj/item/trash/candy
	nutriment_desc = list("candy" = 10)
	preloaded_reagents = list("nutriment" = 10, "sugar" = 6)
	matter = list(MATERIAL_BIOMATTER = 2)

/obj/item/reagent_containers/food/snacks/candy/proteinbar
	name = "protein bar"
	desc = "SwoleMAX brand protein bars, guaranteed to get you feeling perfectly overconfident."
	icon_state = "proteinbar"
	trash = /obj/item/trash/candy/proteinbar
	nutriment_amt = 9
	nutriment_desc = list("nutriment" = 7, "protein" = 8)
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/candy/pistachios_pack
	name = "pistachios pack"
	desc = "A packet of pistachios with added salt. A somewhat healthy light snack."
	icon_state = "pistachios_pack"
	trash = /obj/item/trash/pistachios
	nutriment_amt = 4
	nutriment_desc = list("pistachios" = 3, "protein" = 2, "sodiumchloride" = 2)
	preloaded_reagents = list("nutriment" = 1, "sodiumchloride" = 6)
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/candy/sunflowerseeds
	name = "sunflower fried seed pack"
	desc = "Bag of sunflower seeds that have been fried and salted for people that like to chew their food for way to long."
	icon_state = "semki_pack"
	trash = /obj/item/trash/semki
	nutriment_amt = 3
	nutriment_desc = list("nutriment" = 2, "protein" = 1)
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/candy/energybar
	name = "energy bar"
	desc = "A chewy candy bar that has many warnings about its surgar contents for quick energy."
	icon_state = "energybar"
	trash = /obj/item/trash/energybar
	nutriment_amt = 1
	nutriment_desc = list("nutriment" = 1, "sugar" = 29)
	preloaded_reagents = list("nutriment" = 1, "sugar" = 29)
	matter = list(MATERIAL_BIOMATTER = 1)

/obj/item/reagent_containers/food/snacks/candy_corn
	name = "candy corn"
	desc = "It's a handful of candy corn. Cannot be stored in a detective's hat, alas."
	icon_state = "candy_corn"
	filling_color = "#FFFCB0"
	bitesize = 2
	center_of_mass = list("x"=14, "y"=10)
	nutriment_amt = 4
	nutriment_desc = list("candy corn" = 4)
	preloaded_reagents = list("nutriment" = 4, "sugar" = 2)

/obj/item/reagent_containers/food/snacks/chips
	name = "chips packet"
	desc = "An unbranded packet of crisps. Salty."
	icon_state = "chips"
	trash = /obj/item/trash/chips
	filling_color = "#E8C31E"
	bitesize = 1
	center_of_mass = list("x"=15, "y"=15)
	nutriment_amt = 3
	nutriment_desc = list("salt" = 1, "chips" = 2)
	matter = list(MATERIAL_BIOMATTER = 2)

/obj/item/reagent_containers/food/snacks/gamerchips
	name = "boritos crips packet"
	desc = "An branded packet of crisps. Its marketing for people that like to play competitive arcade games."
	icon_state = "boritos"
	trash = /obj/item/trash/gamerchips
	filling_color = "#E8C31E"
	bitesize = 1
	center_of_mass = list("x"=15, "y"=15)
	nutriment_amt = 3
	nutriment_desc = list("cool ranch" = 2, "corn" = 1)
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/cookie
	name = "cookie"
	desc = "COOKIE!!!"
	icon_state = "COOKIE!!!"
	filling_color = "#DBC94F"
	bitesize = 1
	center_of_mass = list("x"=17, "y"=18)
	nutriment_amt = 5
	nutriment_desc = list("sweetness" = 3, "cookie" = 2)

/obj/item/reagent_containers/food/snacks/chocolatebar
	name = "chocolate bar"
	desc = "Such sweet, fattening food."
	icon_state = "chocolatebar"
	filling_color = "#7D5F46"
	bitesize = 2
	center_of_mass = list("x"=15, "y"=15)
	nutriment_amt = 2
	nutriment_desc = list("chocolate" = 5)
	preloaded_reagents = list("sugar" = 2, "coco" = 2)

/obj/item/reagent_containers/food/snacks/chocolateegg
	name = "chocolate egg"
	desc = "Such sweet, fattening food."
	icon_state = "chocolateegg"
	filling_color = "#7D5F46"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	nutriment_amt = 3
	nutriment_desc = list("chocolate" = 5)
	preloaded_reagents = list("sugar" = 2, "coco" = 2)

/obj/item/reagent_containers/food/snacks/chocolatecoin
	name = "chocolate coin"
	desc = "Chocolate pressed into a coin shape, could pass for a coin if wrapped in gold foil."
	icon_state = "chococoin-wrapped"
	filling_color = "#7D5F46"
	bitesize = 1
	center_of_mass = list("x"=15, "y"=15)
	nutriment_amt = 3
	nutriment_desc = list("chocolate" = 5)
	preloaded_reagents = list("sugar" = 2, "coco" = 2)
	var/open = FALSE

/obj/item/reagent_containers/food/snacks/chocolatecoin/attack_self(mob/user)
	if(!open)
		open()
		to_chat(user, SPAN_NOTICE("You tear \the [src] open."))
		return

/obj/item/reagent_containers/food/snacks/chocolatecoin/attack(mob/M as mob, mob/user as mob, def_zone)
	. = ..()
	if(!open)
		open()
		to_chat(user, SPAN_WARNING("You viciously rip \the [src] open with your teeth, swallowing some plastic in the process, you animal."))

/obj/item/reagent_containers/food/snacks/chocolatecoin/proc/open(mob/user)
	icon_state = "chococoin"
	open = TRUE


/obj/item/reagent_containers/food/snacks/donut
	name = "donut"
	desc = "Goes great with Robust Coffee."
	icon_state = "donut1"
	filling_color = "#D9C386"
	var/overlay_state = "box-donut1"
	center_of_mass = list("x"=13, "y"=16)
	nutriment_desc = list("sweetness" = 2, "donut" = 3)

/obj/item/reagent_containers/food/snacks/donut/normal
	name = "donut"
	desc = "Goes great with Robust Coffee."
	icon_state = "donut1"
	bitesize = 3
	nutriment_amt = 3
	preloaded_reagents = list("sprinkles" = 1)
	New()
		..()
		if(prob(30))
			src.icon_state = "donut2"
			src.overlay_state = "box-donut2"
			src.name = "frosted donut"
			reagents.add_reagent("sprinkles", 2)
			center_of_mass = list("x"=19, "y"=16)

/obj/item/reagent_containers/food/snacks/donut/chaos
	name = "chaos donut"
	desc = "Like life, it never quite tastes the same."
	icon_state = "donut1"
	filling_color = "#ED11E6"
	nutriment_amt = 2
	bitesize = 10
	preloaded_reagents = list("sprinkles" = 1)
	matter = list(MATERIAL_BIOMATTER = 12)
	New()
		..()
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
			src.icon_state = "donut2"
			src.overlay_state = "box-donut2"
			src.name = "Frosted Chaos Donut"
			reagents.add_reagent("sprinkles", 2)


/obj/item/reagent_containers/food/snacks/donut/jelly
	name = "jelly donut"
	desc = "You jelly?"
	icon_state = "jdonut1"
	filling_color = "#ED1169"
	center_of_mass = list("x"=16, "y"=11)
	nutriment_amt = 3
	bitesize = 5
	preloaded_reagents = list("sprinkles" = 1, "berryjuice" = 5)
	matter = list(MATERIAL_BIOMATTER = 4)
	New()
		..()
		if(prob(30))
			src.icon_state = "jdonut2"
			src.overlay_state = "box-donut2"
			src.name = "Frosted Jelly Donut"
			reagents.add_reagent("sprinkles", 2)

/obj/item/reagent_containers/food/snacks/donut/slimejelly
	name = "jelly donut"
	desc = "You jelly?"
	icon_state = "jdonut1"
	filling_color = "#ED1169"
	center_of_mass = list("x"=16, "y"=11)
	nutriment_amt = 3
	bitesize = 5
	preloaded_reagents = list("sprinkles" = 1, "slimejelly" = 5)
	matter = list(MATERIAL_BIOMATTER = 4)
	New()
		..()
		if(prob(30))
			src.icon_state = "jdonut2"
			src.overlay_state = "box-donut2"
			src.name = "Frosted Jelly Donut"
			reagents.add_reagent("sprinkles", 2)

/obj/item/reagent_containers/food/snacks/donut/cherryjelly
	name = "jelly donut"
	desc = "You jelly?"
	icon_state = "jdonut1"
	filling_color = "#ED1169"
	bitesize = 5
	center_of_mass = list("x"=16, "y"=11)
	nutriment_amt = 3
	preloaded_reagents = list("sprinkles" = 1, "cherryjelly" = 5)
	matter = list(MATERIAL_BIOMATTER = 4)
	New()
		..()
		if(prob(30))
			src.icon_state = "jdonut2"
			src.overlay_state = "box-donut2"
			src.name = "Frosted Jelly Donut"
			reagents.add_reagent("sprinkles", 2)

/obj/item/reagent_containers/food/snacks/dumplings
	name = "dumplings" // They're technically gyoza but let's not go full weeb. - Seb
	desc = "Minced meat and cabbage rolled inside small, steamed buns. A good pocket meal that pairs well with beer!"
	icon_state = "dumplings"
	trash = /obj/item/trash/waffles
	bitesize = 5 // Five on the tray
	preloaded_reagents = list("protein" = 10)
	nutriment_desc = list("soft minced meat" = 5, "cabbage" = 2, "moist steamed buns" = 3)
	matter = list(MATERIAL_BIOMATTER = 10)

/obj/item/reagent_containers/food/snacks/egg
	name = "egg"
	desc = "An egg!"
	icon_state = "egg"
	filling_color = "#FDFFD1"
	volume = 10
	price_tag = 3
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("egg" = 3)
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/food/snacks/egg/afterattack(obj/O as obj, mob/user as mob, proximity)
	if(istype(O,/obj/machinery/microwave))
		return ..()
	if(!proximity || !O.is_refillable())
		return
	to_chat(user, "You crack \the [src] into \the [O].")
	reagents.trans_to(O, reagents.total_volume)
	user.drop_from_inventory(src)
	qdel(src)

/obj/item/reagent_containers/food/snacks/egg/throw_impact(atom/hit_atom)
	..()
	new/obj/effect/decal/cleanable/egg_smudge(src.loc)
	src.reagents.splash(hit_atom, reagents.total_volume)
	src.visible_message(
		SPAN_WARNING("\The [src] has been squashed!"),
		SPAN_WARNING("You hear a smack.")
	)
	qdel(src)

/obj/item/reagent_containers/food/snacks/egg/attackby(obj/item/W as obj, mob/user as mob)
	if(istype( W, /obj/item/pen/crayon ))
		var/obj/item/pen/crayon/C = W
		var/clr = C.colourName
		if(!(clr in list("blue","green","mime","orange","purple","rainbow","red","yellow")))
			to_chat(usr, SPAN_NOTICE("The egg refuses to take on this color!"))
			return
		to_chat(user, SPAN_NOTICE("You color \the [src] [clr]"))
		icon_state = "egg-[clr]"
	else
		..()

/obj/item/reagent_containers/food/snacks/egg/clucker
	name = "cluckeregg"
	desc = "A clucker egg!"
	icon_state = "egg"
	filling_color = "#ffe6d1"
	matter = list(MATERIAL_BIOMATTER = 12)

/obj/item/reagent_containers/food/snacks/egg/blue
	icon_state = "egg-blue"

/obj/item/reagent_containers/food/snacks/egg/green
	icon_state = "egg-green"

/obj/item/reagent_containers/food/snacks/egg/mime
	icon_state = "egg-mime"

/obj/item/reagent_containers/food/snacks/egg/orange
	icon_state = "egg-orange"

/obj/item/reagent_containers/food/snacks/egg/purple
	icon_state = "egg-purple"

/obj/item/reagent_containers/food/snacks/egg/rainbow
	icon_state = "egg-rainbow"

/obj/item/reagent_containers/food/snacks/egg/red
	icon_state = "egg-red"

/obj/item/reagent_containers/food/snacks/egg/yellow
	icon_state = "egg-yellow"

/obj/item/reagent_containers/food/snacks/donut/stat_buff
	name = "Masterpiece Donut"
	desc = "The taste you will never forget."
	filling_color = "#ED1169"
	bitesize = 5
	center_of_mass = list("x"=16, "y"=11)
	var/list/stats_buff = list()
	var/buff_power = 6
	price_tag = 500
	var/buff_time = 20 MINUTES
	nutriment_amt = 3
	preloaded_reagents = list("sprinkles" = 2)
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
	overlay_state = "donut_mec_c"
	stats_buff = list(STAT_MEC)
	preloaded_reagents = list("sprinkles" = 1, "lemonjuice" = 1)

/obj/item/reagent_containers/food/snacks/donut/stat_buff/cog
	name = "Purple Masterpiece Donut"
	desc = "The too-sweet artificial grape taste you will never forget. An intellectual's favorite."
	icon_state = "donut_cog"
	overlay_state = "donut_cog_c"
	stats_buff = list(STAT_COG)
	preloaded_reagents = list("sprinkles" = 1, "grapejuice" = 1)

/obj/item/reagent_containers/food/snacks/donut/stat_buff/bio
	name = "Green Masterpiece Donut"
	desc = "The fresh spearmint flavor you will never forget. Perfect for an immaculate doctor."
	icon_state = "donut_bio"
	overlay_state = "donut_bio_c"
	stats_buff = list(STAT_BIO)
	preloaded_reagents = list("sprinkles" = 1, "mint" = 1)

/obj/item/reagent_containers/food/snacks/donut/stat_buff/rob
	name = "Brown Masterpiece Donut"
	desc = "A near-chocolate taste you will never forget. A robust flavor for the strong."
	icon_state = "donut_rob"
	overlay_state = "donut_rob_c"
	stats_buff = list(STAT_ROB)
	preloaded_reagents = list("sprinkles" = 1, "coco" = 1)

/obj/item/reagent_containers/food/snacks/donut/stat_buff/tgh
	name = "Cream Masterpiece Donut"
	desc = "The classic donut flavor you will never forget. Specially panders to tough people."
	icon_state = "donut_tgh"
	overlay_state = "donut_tgh_c"
	stats_buff = list(STAT_TGH)

/obj/item/reagent_containers/food/snacks/donut/stat_buff/vig
	name = "Blue Masterpiece Donut"
	desc = "A tart blueberry taste you will never forget. A go-to choice for the vigilant watchman."
	icon_state = "donut_vig"
	overlay_state = "donut_vig_c"
	stats_buff = list(STAT_VIG)
	preloaded_reagents = list("sprinkles" = 1, "berryjuice" = 1)

/obj/item/reagent_containers/food/snacks/friedegg
	name = "fried egg"
	desc = "A fried egg, with a touch of salt and pepper."
	icon_state = "friedegg"
	filling_color = "#FFDF78"
	bitesize = 1
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 3, "sodiumchloride" = 1, "blackpepper" = 1, "cornoil" = 1)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 10)

/obj/item/reagent_containers/food/snacks/boiledegg
	name = "boiled egg"
	desc = "A hard boiled egg."
	icon_state = "egg"
	filling_color = "#FFFFFF"
	preloaded_reagents = list("protein" = 2)
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/food/snacks/tofu
	name = "tofu"
	icon_state = "tofu"
	desc = "We all love tofu."
	filling_color = "#FFFEE0"
	bitesize = 3
	center_of_mass = list("x"=17, "y"=10)
	nutriment_amt = 3
	nutriment_desc = list("tofu" = 3, "goeyness" = 3)
	matter = list(MATERIAL_BIOMATTER = 12)

/obj/item/reagent_containers/food/snacks/tofurkey
	name = "tofurkey"
	desc = "A fake turkey made from tofu."
	icon_state = "tofurkey"
	filling_color = "#FFFEE0"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=8)
	nutriment_amt = 12
	nutriment_desc = list("turkey" = 3, "tofu" = 5, "goeyness" = 4)
	preloaded_reagents = list("stoxin" = 3)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 20)

/obj/item/reagent_containers/food/snacks/stuffing
	name = "stuffing"
	desc = "Moist, peppery breadcrumbs for filling the body cavities of dead birds. Dig in!"
	icon_state = "stuffing"
	filling_color = "#C9AC83"
	bitesize = 1
	center_of_mass = list("x"=16, "y"=10)
	nutriment_amt = 3
	nutriment_desc = list("dryness" = 2, "bread" = 2)
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/fishfingers
	name = "fish fingers"
	desc = "Fish slabs battered and fried. Please do not consume with custard."
	icon_state = "fishfingers"
	filling_color = "#FFDEFE"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("protein" = 6)
	matter = list(MATERIAL_BIOMATTER = 8)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/sashimi
	name = "sashimi"
	desc = "Raw cuts of carp fillet with a side of soy sauce, apparently an eastern earth delicacy."
	icon_state = "sashimi"
	trash = /obj/item/trash/grease
	bitesize = 2
	nutriment_amt = 4
	preloaded_reagents = list("protein" = 4)
	nutriment_desc = list("raw fish" = 2, "soy sauce" = 2)

/obj/item/reagent_containers/food/snacks/hugemushroomslice
	name = "huge mushroom slice"
	desc = "A slice from a huge mushroom."
	icon_state = "hugemushroomslice"
	filling_color = "#E0D7C5"
	bitesize = 6
	center_of_mass = list("x"=17, "y"=16)
	nutriment_amt = 3
	nutriment_desc = list("raw" = 2, "mushroom" = 2)
	preloaded_reagents = list("psilocybin" = 3)
	matter = list(MATERIAL_BIOMATTER = 11)

/obj/item/reagent_containers/food/snacks/tomatomeat
	name = "tomato slice"
	desc = "A slice from a huge tomato"
	icon_state = "tomatomeat"
	filling_color = "#DB0000"
	bitesize = 6
	center_of_mass = list("x"=17, "y"=16)
	nutriment_amt = 3
	nutriment_desc = list("raw" = 2, "tomato" = 3)
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/food/snacks/meatball
	name = "meatball"
	desc = "Contrary to popular belief, this one's not spicy."
	icon_state = "meatball"
	filling_color = "#DB0000"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=16)
	preloaded_reagents = list("protein" = 3)
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/sausage
	name = "sausage"
	desc = "A piece of mixed, long meat."
	icon_state = "sausage"
	filling_color = "#DB0000"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=16)
	preloaded_reagents = list("protein" = 6)
	matter = list(MATERIAL_BIOMATTER = 7)

/obj/item/reagent_containers/food/snacks/donkpocket
	name = "donk-pocket"
	desc = "Researches suggest that you might want to put a banging donk on it."
	icon_state = "donkpocket"
	filling_color = "#DEDEAB"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("heartiness" = 1, "dough" = 2)
	nutriment_amt = 2
	preloaded_reagents = list("protein" = 2)
	matter = list(MATERIAL_BIOMATTER = 2)

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
	filling_color = "#6D6D00"
	heated_reagents = list("doctorsdelight" = 5, "hyperzine" = 1)
	var/has_been_heated = 0

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

/obj/item/reagent_containers/food/snacks/brainburger
	name = "brainburger"
	desc = "A strange looking burger. It looks almost sentient."
	icon_state = "brainburger"
	filling_color = "#F2B6EA"
	center_of_mass = list("x"=15, "y"=11)
	preloaded_reagents = list("protein" = 6, "alkysine" = 6)
	bitesize = 2
	matter = list(MATERIAL_BIOMATTER = 30)

/obj/item/reagent_containers/food/snacks/human
	var/hname = ""
	var/job = null
	filling_color = "#D63C3C"

/obj/item/reagent_containers/food/snacks/human/burger
	name = "-burger"
	desc = "A bloody burger."
	icon_state = "hburger"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	preloaded_reagents = list("protein" = 6)
	matter = list(MATERIAL_BIOMATTER = 16)

/obj/item/reagent_containers/food/snacks/cheeseburger
	name = "cheeseburger"
	desc = "The cheese adds a good flavor."
	icon_state = "cheeseburger"
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("cheese" = 2, "bun" = 2)
	nutriment_amt = 2
	preloaded_reagents = list("protein" = 2)
	matter = list(MATERIAL_BIOMATTER = 12)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/monkeyburger
	name = "burger"
	desc = "Meatkind come together, united between fluffy buns." // Pax hamburgana.
	icon_state = "hburger"
	filling_color = "#D63C3C"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 3)
	matter = list(MATERIAL_BIOMATTER = 13)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/fishburger
	name = "fillet-o-carp sandwich"
	desc = "Almost like a carp is yelling somewhere... Give me back that fillet-o-carp, give me that carp."
	icon_state = "fishburger"
	filling_color = "#FFDEFE"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=10)
	preloaded_reagents = list("protein" = 6)
	matter = list(MATERIAL_BIOMATTER = 14)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/baconburger
	name = "bacon burger"
	desc = "What makes a burger even more perfect? The addition of bacon, of course."
	icon_state = "baconburger"
	bitesize = 3
	preloaded_reagents = list("protein" = 6)
	nutriment_desc = list("meaty perfection" = 10, "bun" = 2)
	matter = list(MATERIAL_BIOMATTER = 14)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/chickenburger
	name = "poultry fried steak sandwich"
	desc =	"A burger consisting of crispy fried poultry instead of a patty, a classic alternative for those who prefer chicken or whatever tastes closest to it."
	icon_state = "chickenburger"
	bitesize = 3
	preloaded_reagents = list("protein" = 6)
	nutriment_desc = list("crispy fried poultry" = 10, "bun" = 2)
	matter = list(MATERIAL_BIOMATTER = 14)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/tofuburger
	name = "tofu burger"
	desc = "What.. is that meat?"
	icon_state = "tofuburger"
	filling_color = "#FFFEE0"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("bun" = 2, "pseudo-soy meat" = 3)
	nutriment_amt = 6
	matter = list(MATERIAL_BIOMATTER = 12)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/roburger
	name = "roburger"
	desc = "The lettuce is the only organic component. Beep."
	icon_state = "roburger"
	filling_color = "#CCCCCC"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2, "metal" = 3)
	nutriment_amt = 2
	matter = list(MATERIAL_BIOMATTER = 6)
	New()
		..()
		if(prob(5))
			reagents.add_reagent("nanites", 2)

/obj/item/reagent_containers/food/snacks/roburgerbig
	name = "roburger"
	desc = "This massive patty looks like poison. Beep."
	icon_state = "roburger"
	filling_color = "#CCCCCC"
	bitesize = 0.1
	volume = 100
	center_of_mass = list("x"=16, "y"=11)
	matter = list(MATERIAL_BIOMATTER = 2)

	New()
		..()
		reagents.add_reagent("nanites", 100)
		bitesize = 0.1

/obj/item/reagent_containers/food/snacks/xenoburger
	name = "xenoburger"
	desc = "Smells caustic. Tastes like heresy."
	icon_state = "xburger"
	filling_color = "#43DE18"
	center_of_mass = list("x"=16, "y"=11)
	matter = list(MATERIAL_BIOMATTER = 13)
	New()
		..()
		reagents.add_reagent("protein", 8)
		bitesize = 2

/obj/item/reagent_containers/food/snacks/clownburger
	name = "clown burger"
	desc = "This tastes funny..."
	icon_state = "clownburger"
	filling_color = "#FF00FF"
	bitesize = 2
	center_of_mass = list("x"=17, "y"=12)
	nutriment_desc = list("bun" = 2, "clown shoe" = 3)
	nutriment_amt = 6
	matter = list(MATERIAL_BIOMATTER = 10)

/obj/item/reagent_containers/food/snacks/mimeburger
	name = "mime burger"
	desc = "Its taste defies language."
	icon_state = "mimeburger"
	filling_color = "#FFFFFF"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2, "mime paint" = 3)
	nutriment_amt = 6
	matter = list(MATERIAL_BIOMATTER = 10)

/obj/item/reagent_containers/food/snacks/muffinegg
	name = "muffin egg sandwich"
	desc = "A muffin sandwich consisting of fried egg and nadezhdian bacon, a good breakfast takeaway choice."
	icon_state = "muffinegg"
	bitesize = 2
	nutriment_desc = list("bacon" = 5, "runny fried egg" = 5, "muffin" = 2)
	nutriment_amt = 6

/obj/item/reagent_containers/food/snacks/kampferburger
	name = "kampfer burger"
	desc = "A burger made out of a kampfer roach. Tasty but chewy."
	icon_state = "kampferburger"
	bitesize = 1
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 2
	preloaded_reagents = list("protein" = 4)
	matter = list(MATERIAL_BIOMATTER = 15)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/panzerburger
	name = "panzer burger"
	desc = "A burger made out of a panzer roach. Surprisingly heavy."
	icon_state = "panzerburger"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 1
	preloaded_reagents = list("protein" = 8)
	matter = list(MATERIAL_BIOMATTER = 17)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/jagerburger
	name = "jager burger"
	desc = "A burger made out of a jager roach. The hunter becomes the hunted."
	icon_state = "jagerburger"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 6)
	matter = list(MATERIAL_BIOMATTER = 16)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/seucheburger
	name = "seuche burger"
	desc = "A burger made out of a seuche roach. This can't be healthy."
	icon_state = "seucheburger"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 2
	preloaded_reagents = list("protein" = 4)
	matter = list(MATERIAL_BIOMATTER = 16)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/bigroachburger
	name = "big roach burger"
	desc = "A burger made out of many different roaches. A gourmet meal."
	icon_state = "bigroachburger"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 8)
	matter = list(MATERIAL_BIOMATTER = 35)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/fuhrerburger
	name = "fuhrer burger"
	desc = "A burger made out of a fuhrer roach. Consume the king of bugs."
	icon_state = "fuhrerburger"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 8, "Fuhrole" = 3)
	matter = list(MATERIAL_BIOMATTER = 20)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/kaiserburger
	name = "kaiser Burger"
	desc = "The rarest experience for your taste buds"
	icon_state = "kaiserburger"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 10)
	matter = list(MATERIAL_BIOMATTER = 50)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/omelette
	name = "omelette du fromage"
	desc = "That's all you can say!"
	icon_state = "omelette"
	trash = /obj/item/trash/plate
	filling_color = "#FFF9A8"
	bitesize = 1
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("protein" = 8, "cornoil" = 2)
	matter = list(MATERIAL_BIOMATTER = 15)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/muffin
	name = "muffin"
	desc = "A delicious and spongy little cake"
	icon_state = "muffin"
	filling_color = "#E0CF9B"
	bitesize = 2
	center_of_mass = list("x"=17, "y"=4)
	nutriment_desc = list("sweetness" = 3, "muffin" = 3)
	nutriment_amt = 6
	matter = list(MATERIAL_BIOMATTER = 5)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/pie
	name = "banana cream pie"
	desc = "Just like back home, on clown planet! HONK!"
	icon_state = "pie"
	trash = /obj/item/trash/plate
	filling_color = "#FBFFB8"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=13)
	nutriment_desc = list("pie" = 3, "cream" = 2)
	nutriment_amt = 4
	preloaded_reagents = list("banana" = 5)
	matter = list(MATERIAL_BIOMATTER = 15)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/pie/throw_impact(atom/hit_atom)
	..()
	new/obj/effect/decal/cleanable/pie_smudge(src.loc)
	src.visible_message(
		SPAN_DANGER("\The [src.name] splats."),
		SPAN_DANGER("You hear a splat.")
	)
	qdel(src)

/obj/item/reagent_containers/food/snacks/berryclafoutis
	name = "berry clafoutis"
	desc = "No black birds, this is a good sign."
	icon_state = "berryclafoutis"
	bitesize = 3
	trash = /obj/item/trash/plate
	center_of_mass = list("x"=16, "y"=13)
	nutriment_desc = list("sweetness" = 2, "pie" = 3)
	nutriment_amt = 4
	preloaded_reagents = list("berryjuice" = 5)
	matter = list(MATERIAL_BIOMATTER = 12)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/waffles
	name = "waffles"
	desc = "Mmm, waffles"
	icon_state = "waffles"
	trash = /obj/item/trash/waffles
	filling_color = "#E6DEB5"
	center_of_mass = list("x"=15, "y"=11)
	nutriment_desc = list("waffle" = 8)
	nutriment_amt = 8
	bitesize = 2
	matter = list(MATERIAL_BIOMATTER = 6)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/eggplantparm
	name = "eggplant parmigiana"
	desc = "The only good recipe for eggplant."
	icon_state = "eggplantparm"
	trash = /obj/item/trash/plate
	filling_color = "#4D2F5E"
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("cheese" = 3, "eggplant" = 3)
	nutriment_amt = 6
	bitesize = 2
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 12)

/obj/item/reagent_containers/food/snacks/soylentgreen
	name = "soylent green"
	desc = "Not made of people. Honest." //Totally people.
	icon_state = "soylent_green"
	trash = /obj/item/trash/waffles
	filling_color = "#B8E6B5"
	bitesize = 2
	center_of_mass = list("x"=15, "y"=11)
	preloaded_reagents = list("protein" = 10)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 25)

/obj/item/reagent_containers/food/snacks/soylenviridians
	name = "soylen virdians"
	desc = "Not made of people. Honest." //Actually honest for once.
	icon_state = "soylent_yellow"
	trash = /obj/item/trash/waffles
	filling_color = "#E6FA61"
	bitesize = 2
	center_of_mass = list("x"=15, "y"=11)
	nutriment_desc = list("some sort of protein" = 10) //seasoned VERY well.
	nutriment_amt = 10
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 10)

/obj/item/reagent_containers/food/snacks/meatpie
	name = "meat pie"
	icon_state = "meatpie"
	desc = "An old barber recipe, very delicious!"
	trash = /obj/item/trash/plate
	filling_color = "#948051"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("protein" = 10)
	matter = list(MATERIAL_BIOMATTER = 22)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/tofupie
	name = "tofu-pie"
	icon_state = "meatpie"
	desc = "A delicious tofu pie."
	trash = /obj/item/trash/plate
	filling_color = "#FFFEE0"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	nutriment_desc = list("tofu" = 2, "pie" = 8)
	nutriment_amt = 10
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 12)

/obj/item/reagent_containers/food/snacks/amanita_pie
	name = "amanita pie"
	desc = "Sweet and tasty poison pie."
	icon_state = "amanita_pie"
	filling_color = "#FFCCCC"
	bitesize = 3
	center_of_mass = list("x"=17, "y"=9)
	nutriment_desc = list("sweetness" = 3, "mushroom" = 3, "pie" = 2)
	nutriment_amt = 5
	preloaded_reagents = list("amatoxin" = 3, "psilocybin" = 1)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 12)

/obj/item/reagent_containers/food/snacks/plump_pie
	name = "plump pie"
	desc = "I bet you love stuff made out of plump helmets!"
	icon_state = "plump_pie"
	filling_color = "#B8279B"
	bitesize = 2
	center_of_mass = list("x"=17, "y"=9)
	nutriment_desc = list("heartiness" = 2, "mushroom" = 3, "pie" = 3)
	nutriment_amt = 8
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 12)
	New()
		..()
		if(prob(10))
			name = "exceptional plump pie"
			desc = "Microwave is taken by a fey mood! It has cooked an exceptional plump pie!"
			reagents.add_reagent("tricordrazine", 5)
			matter = list(MATERIAL_BIOMATTER = 18)

/obj/item/reagent_containers/food/snacks/xemeatpie
	name = "xeno-pie"
	icon_state = "xenomeatpie"
	desc = "A delicious meatpie. Probably heretical."
	trash = /obj/item/trash/plate
	filling_color = "#43DE18"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("protein" = 10)
	matter = list(MATERIAL_BIOMATTER = 18)

/obj/item/reagent_containers/food/snacks/wingfangchu
	name = "wing fang chu"
	desc = "A savory dish of alien wing wang in soy."
	icon_state = "wingfangchu"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#43DE18"
	bitesize = 2
	center_of_mass = list("x"=17, "y"=9)
	preloaded_reagents = list("protein" = 6)
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/human/kabob
	name = "-kabob"
	icon_state = "kabob"
	desc = "A human meat, on a stick."
	trash = /obj/item/stack/rods
	filling_color = "#A85340"
	bitesize = 2
	center_of_mass = list("x"=17, "y"=15)
	preloaded_reagents = list("protein" = 8)
	matter = list(MATERIAL_BIOMATTER = 18)

/obj/item/reagent_containers/food/snacks/monkeykabob
	name = "meat-kabob"
	icon_state = "kabob"
	desc = "Delicious meat, on a stick."
	trash = /obj/item/stack/rods
	filling_color = "#A85340"
	bitesize = 2
	center_of_mass = list("x"=17, "y"=15)
	preloaded_reagents = list("protein" = 8)
	matter = list(MATERIAL_BIOMATTER = 16)

/obj/item/reagent_containers/food/snacks/tofukabob
	name = "tofu-kabob"
	icon_state = "kabob"
	desc = "Vegan meat, on a stick."
	trash = /obj/item/stack/rods
	filling_color = "#FFFEE0"
	bitesize = 2
	center_of_mass = list("x"=17, "y"=15)
	nutriment_desc = list("tofu" = 3, "metal" = 1)
	nutriment_amt = 8
	matter = list(MATERIAL_BIOMATTER = 12)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/cubancarp
	name = "cuban carp"
	desc = "A sandwich that burns your tongue and then leaves it numb!"
	icon_state = "cubancarp"
	trash = /obj/item/trash/plate
	filling_color = "#E9ADFF"
	bitesize = 3
	center_of_mass = list("x"=12, "y"=5)
	nutriment_desc = list("toasted bread" = 3)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 3, "capsaicin" = 3)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/popcorn
	name = "popcorn"
	desc = "Now let's find some cinema."
	icon_state = "popcorn"
	trash = /obj/item/trash/popcorn
	var/unpopped = 0
	filling_color = "#FFFAD4"
	center_of_mass = list("x"=16, "y"=8)
	nutriment_desc = list("popcorn" = 3)
	nutriment_amt = 2
	matter = list(MATERIAL_BIOMATTER = 2)
	bitesize = 0.1 //this snack is supposed to be eating during looooong time. And this it not dinner food! --rastaf0
	New()
		..()
		unpopped = rand(1,10)
	On_Consume()
		if(prob(unpopped))	//lol ...what's the point?
			to_chat(usr, SPAN_WARNING("You bite down on an un-popped kernel!"))
			unpopped = max(0, unpopped-1)
		..()

/obj/item/reagent_containers/food/snacks/sosjerky
	name = "Scaredy's Beef Jerky"
	icon_state = "sosjerky"
	desc = "Packaged protein sourced from a massive private reserve."
	trash = /obj/item/trash/sosjerky
	filling_color = "#631212"
	bitesize = 2
	center_of_mass = list("x"=15, "y"=9)
	preloaded_reagents = list("protein" = 4)
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/food/snacks/no_raisin
	name = "4No Raisins"
	icon_state = "4no_raisins"
	desc = "A brand of boxed raisins. Dry but tasty."
	trash = /obj/item/trash/raisins
	filling_color = "#343834"
	center_of_mass = list("x"=15, "y"=4)
	nutriment_desc = list("dried raisins" = 6)
	nutriment_amt = 6
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/food/snacks/spacetwinkie
	name = "Space Twinkie"
	icon_state = "space_twinkie"
	desc = "A golden sponge cake with a creamy filling."
	filling_color = "#FFE591"
	bitesize = 2
	center_of_mass = list("x"=15, "y"=11)
	preloaded_reagents = list("sugar" = 4)
	matter = list(MATERIAL_BIOMATTER = 2)

/obj/item/reagent_containers/food/snacks/cheesiehonkers
	name = "Cheesie Honkers"
	icon_state = "cheesie_honkers"
	desc = "Bite-sized cheesie snacks that will honk all over your mouth."
	trash = /obj/item/trash/cheesie
	filling_color = "#FFA305"
	bitesize = 2
	center_of_mass = list("x"=15, "y"=9)
	nutriment_desc = list("cheese" = 5, "chips" = 2)
	nutriment_amt = 4
	matter = list(MATERIAL_BIOMATTER = 4)

/obj/item/reagent_containers/food/snacks/syndicake
	name = "syndi-cakes"
	icon_state = "syndi_cakes"
	desc = "An extremely moist snack cake that tastes just as good after being nuked."
	filling_color = "#FF5D05"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("sweetness" = 3, "cake" = 1)
	nutriment_amt = 4
	trash = /obj/item/trash/syndi_cakes
	preloaded_reagents = list("doctorsdelight" = 5)
	matter = list(MATERIAL_BIOMATTER = 12)

/obj/item/reagent_containers/food/snacks/loadedbakedpotato
	name = "loaded baked potato"
	desc = "Totally baked."
	icon_state = "loadedbakedpotato"
	filling_color = "#9C7A68"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("baked potato" = 3)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 3)
	matter = list(MATERIAL_BIOMATTER = 12)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/fries
	name = "space fries"
	desc = "AKA: French Fries, Freedom Fries, etc."
	icon_state = "fries"
	trash = /obj/item/trash/plate
	filling_color = "#EDDD00"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("fresh fries" = 4)
	nutriment_amt = 4
	matter = list(MATERIAL_BIOMATTER = 4)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/soydope
	name = "soy dope"
	desc = "Dope from a soy."
	icon_state = "soydope"
	trash = /obj/item/trash/plate
	filling_color = "#C4BF76"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("slime" = 2, "soy" = 2)
	nutriment_amt = 2
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/food/snacks/spagetti
	name = "spaghetti"
	desc = "A bundle of raw spaghetti."
	icon_state = "spagetti"
	filling_color = "#EDDD00"
	bitesize = 1
	center_of_mass = list("x"=16, "y"=16)
	nutriment_desc = list("noodles" = 2)
	nutriment_amt = 1
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/cheesyfries
	name = "cheesy fries"
	desc = "Fries. Covered in cheese. Duh."
	icon_state = "cheesyfries"
	trash = /obj/item/trash/plate
	filling_color = "#EDDD00"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("fresh fries" = 3, "cheese" = 3)
	nutriment_amt = 4
	preloaded_reagents = list("protein" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 7)

/obj/item/reagent_containers/food/snacks/fortunecookie
	name = "fortune cookie"
	desc = "A true prophecy in each cookie!"
	icon_state = "fortune_cookie"
	filling_color = "#E8E79E"
	bitesize = 2
	center_of_mass = list("x"=15, "y"=14)
	nutriment_desc = list("fortune cookie" = 2)
	nutriment_amt = 3

/obj/item/reagent_containers/food/snacks/badrecipe
	name = "burned mess"
	desc = "Someone should be demoted from chef for this."
	icon_state = "badrecipe"
	filling_color = "#211F02"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=12)
	preloaded_reagents = list("toxin" = 1, "carbon" = 3)

/obj/item/reagent_containers/food/snacks/meatsteak
	name = "meat steak"
	desc = "A piece of hot meat, lightly seasoned with salt and pepper."
	icon_state = "meatsteak"
	trash = /obj/item/trash/plate
	filling_color = "#7A3D11"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("protein" = 4, "sodiumchloride" = 1, "blackpepper" = 1)
	matter = list(MATERIAL_BIOMATTER = 11)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/chickensteak
	name = "chicken steak"
	desc = "Poultry breasts, cooked juicy and tender, lightly seasoned with salt and pepper." // Don't ask how they get grill marks on a microwave tho - Seb
	icon_state = "chickenbreast_cooked"
	trash = /obj/item/trash/plate
	filling_color = "#7A3D11"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("protein" = 6, "sodiumchloride" = 1, "blackpepper" = 1)
	nutriment_desc = list("juicy poultry" = 10, "salt" = 2, "pepper" = 2)
	matter = list(MATERIAL_BIOMATTER = 11)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/roastchicken
	name = "chicken roast"
	desc = "A wonderful roast of an entire poultry. While you can't tell if it's exactly chicken, it certainlly will end up tasting like it."
	icon_state = "chimken"
	trash = /obj/item/trash/tray
	bitesize = 6
	preloaded_reagents = list("protein" = 10, "sodiumchloride" = 1, "blackpepper" = 1)
	nutriment_desc = list("juicy roasted poultry" = 10, "salt" = 2, "pepper" = 2)
	matter = list(MATERIAL_BIOMATTER = 12)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/friedchikin
	name = "fried poultry"
	desc = "Crunchy on the exterior but juicy and soft on the inside, a piece of poultry that has been fried to mouthwatering perfection."
	icon_state = "friedchicken"
	bitesize = 3
	preloaded_reagents = list("protein" = 6, "cornoil" = 5)
	nutriment_desc = list("fried poultry" = 10, "spicy fried batter" = 3)
	matter = list(MATERIAL_BIOMATTER = 11)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/bacon
	name = "fried bacon" // My spritework might look uncooked but doing two states given our cooking system is cluttering IMO. - Seb
	desc = "When it comes to bacon, always be prepared." // Time to find 38 spots on the colony to hide it
	icon_state = "bacon"
	bitesize = 2
	preloaded_reagents = list("protein" = 3, "cornoil" = 5)
	nutriment_desc = list("freedom" = 10, "bacon fat" = 3)

/obj/item/reagent_containers/food/snacks/baconeggs
	name = "eggs and bacon"
	desc = "A classic breakfast combo of fried, sunny-side eggs, with bacon strips on the side." // Wakey wakey.
	icon_state = "baconegg"
	bitesize = 4
	preloaded_reagents = list("protein" = 6, "cornoil" = 3)
	nutriment_desc = list("bacon" = 5, "fried eggs" = 5)

/obj/item/reagent_containers/food/snacks/benedict
	name = "eggs benedict"
	desc = "A perfectly poached runny egg sitting atop a bedding of Nadezhdian bacon and muffin, with hollandaise sauce generously spread on top. The best breakfast you'll ever have."
	icon_state = "benedict"
	bitesize = 5
	preloaded_reagents = list("protein" = 15, "sodiumchloride" = 1, "blackpepper" = 1)
	nutriment_desc = list("ham" = 5, "poached egg" = 5, "hollandaise sauce" = 3)

/obj/item/reagent_containers/food/snacks/tonkatsu
	name = "tonkatsu"
	desc = "Salted cutlets covered in breadcrumbs and deep fried, presented into thick slices. Crispy outside, juicy and tender inside."
	icon_state = "katsu"
	bitesize = 2
	preloaded_reagents = list("protein" = 8, "sodiumchloride" = 1)
	nutriment_desc = list("fried pork" = 5, "panko breadcrumb" = 2)

/obj/item/reagent_containers/food/snacks/spacylibertyduff
	name = "spacy liberty duff"
	desc = "Jello gelatin, from Alfred Hubbard's cookbook"
	icon_state = "spacylibertyduff"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#42B873"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=8)
	nutriment_desc = list("mushroom" = 6)
	nutriment_amt = 6
	preloaded_reagents = list("psilocybin" = 6)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/food/snacks/amanitajelly
	name = "amanita jelly"
	desc = "Looks curiously toxic"
	icon_state = "amanitajelly"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#ED0758"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=5)
	nutriment_desc = list("jelly" = 3, "mushroom" = 3)
	nutriment_amt = 6
	preloaded_reagents = list("amatoxin" = 6, "psilocybin" = 3)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/food/snacks/poppypretzel
	name = "poppy pretzel"
	desc = "It's all twisted up!"
	icon_state = "poppypretzel"
	bitesize = 2
	filling_color = "#916E36"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("poppy seeds" = 2, "pretzel" = 3)
	nutriment_amt = 5
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/food/snacks/meatballsoup
	name = "meatball soup"
	desc = "You've got balls kid, BALLS!"
	icon_state = "meatballsoup"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#785210"
	bitesize = 5
	center_of_mass = list("x"=16, "y"=8)
	preloaded_reagents = list("protein" = 8, "water" = 5)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/slimesoup
	name = "slime soup"
	desc = "If no water is available, you may substitute tears."
	icon_state = "rorosoup" //nonexistant?
	filling_color = "#C4DBA0"
	bitesize = 5
	preloaded_reagents = list("slimejelly" = 5, "water" = 10)
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/food/snacks/bloodsoup
	name = "tomato soup"
	desc = "Smells like copper."
	icon_state = "tomatosoup"
	filling_color = "#FF0000"
	bitesize = 5
	center_of_mass = list("x"=16, "y"=7)
	preloaded_reagents = list("protein" = 2, "blood" = 10, "water" = 5)
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/clownstears
	name = "clown's tears"
	desc = "Not very funny."
	icon_state = "clownstears"
	filling_color = "#C4FBFF"
	center_of_mass = list("x"=16, "y"=7)
	nutriment_desc = list("salt" = 1, "the worst joke" = 3)
	nutriment_amt = 4
	bitesize = 5
	preloaded_reagents = list("banana" = 5, "water" = 10)
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/vegetablesoup
	name = "vegetable soup"
	desc = "A true vegan meal" //TODO
	icon_state = "vegetablesoup"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#AFC4B5"
	center_of_mass = list("x"=16, "y"=8)
	nutriment_desc = list("carot" = 2, "corn" = 2, "eggplant" = 2, "potato" = 2)
	nutriment_amt = 8
	bitesize = 5
	preloaded_reagents = list("water" = 5)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/nettlesoup
	name = "nettle soup"
	desc = "To think, the gardener would've beat you to death with one of these."
	icon_state = "nettlesoup"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#AFC4B5"
	center_of_mass = list("x"=16, "y"=7)
	nutriment_desc = list("salad" = 4, "egg" = 2, "potato" = 2)
	nutriment_amt = 8
	bitesize = 5
	preloaded_reagents = list("water" = 5, "tricordrazine" = 5)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 18)

/obj/item/reagent_containers/food/snacks/mysterysoup
	name = "mystery soup"
	desc = "The mystery is, why aren't you eating it?"
	icon_state = "mysterysoup"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#F082FF"
	center_of_mass = list("x"=16, "y"=6)
	nutriment_desc = list("backwash" = 1)
	nutriment_amt = 1
	bitesize = 5
	New()
		..()
		var/mysteryselect = pick(1,2,3,4,5,6,7,8,9,10)
		switch(mysteryselect)
			if(1)
				reagents.add_reagent("nutriment", 6)
				reagents.add_reagent("capsaicin", 3)
				reagents.add_reagent("tomatojuice", 2)
				matter = list(MATERIAL_BIOMATTER = 17)
			if(2)
				reagents.add_reagent("nutriment", 6)
				reagents.add_reagent("frostoil", 3)
				reagents.add_reagent("tomatojuice", 2)
				matter = list(MATERIAL_BIOMATTER = 19)
			if(3)
				reagents.add_reagent("nutriment", 5)
				reagents.add_reagent("water", 5)
				reagents.add_reagent("tricordrazine", 5)
				matter = list(MATERIAL_BIOMATTER = 13)
			if(4)
				reagents.add_reagent("nutriment", 5)
				reagents.add_reagent("water", 10)
				matter = list(MATERIAL_BIOMATTER = 3)
			if(5)
				reagents.add_reagent("nutriment", 2)
				reagents.add_reagent("banana", 10)
				matter = list(MATERIAL_BIOMATTER = 19)
			if(6)
				reagents.add_reagent("nutriment", 6)
				reagents.add_reagent("blood", 10)
				matter = list(MATERIAL_BIOMATTER = 23)
			if(7)
				reagents.add_reagent("slimejelly", 10)
				reagents.add_reagent("water", 10)
				matter = list(MATERIAL_BIOMATTER = 18)
			if(8)
				reagents.add_reagent("carbon", 10)
				reagents.add_reagent("toxin", 10)
				matter = list(MATERIAL_BIOMATTER = 3)
			if(9)
				reagents.add_reagent("nutriment", 5)
				reagents.add_reagent("tomatojuice", 10)
				matter = list(MATERIAL_BIOMATTER = 20)
			if(10)
				reagents.add_reagent("nutriment", 6)
				reagents.add_reagent("tomatojuice", 5)
				reagents.add_reagent("imidazoline", 5)
				matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/wishsoup
	name = "wish Soup"
	desc = "I wish this was soup."
	icon_state = "wishsoup"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#D1F4FF"
	center_of_mass = list("x"=16, "y"=11)
	bitesize = 5
	preloaded_reagents = list("water" = 10)
	matter = null
	New()
		..()
		if(prob(25))
			src.desc = "A wish come true!"
			reagents.add_reagent("nutriment", 8, list("something good" = 8))
			matter = list(MATERIAL_BIOMATTER = 1)

/obj/item/reagent_containers/food/snacks/hotchili
	name = "hot chili"
	desc = "A five alarm Texan Chili!"
	icon_state = "hotchili"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#FF3C00"
	center_of_mass = list("x"=15, "y"=9)
	nutriment_desc = list("chilli peppers" = 3)
	nutriment_amt = 3
	bitesize = 5
	preloaded_reagents = list("protein" = 3, "capsaicin" = 3, "tomatojuice" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/coldchili
	name = "cold chili"
	desc = "This slush is barely a liquid!"
	icon_state = "coldchili"
	filling_color = "#2B00FF"
	center_of_mass = list("x"=15, "y"=9)
	nutriment_desc = list("ice peppers" = 3)
	nutriment_amt = 3
	trash = /obj/item/trash/snack_bowl
	bitesize = 5
	preloaded_reagents = list("protein" = 3, "frostoil" = 3, "tomatojuice" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 15)

/obj/item/reagent_containers/food/snacks/bearchili
	name = "bear meat chili"
	desc = "A chili so manly you'll end up growing hair on your chest and wrestling Renders with your bare hands."
	icon_state = "bearchili"
	nutriment_desc = list("manliest meat" = 10, "hot chili peppers" = 3)
	nutriment_amt = 3
	trash = /obj/item/trash/snack_bowl
	bitesize = 5
	preloaded_reagents = list("protein" = 12, "capsaicin" = 3, "hyperzine" = 5) // Inherits from bear meat

/obj/item/reagent_containers/food/snacks/monkeycube
	name = "monkey cube"
	desc = "Just add water!"
	reagent_flags = REFILLABLE
	icon_state = "monkeycube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	matter = list(MATERIAL_BIOMATTER = 20)
	var/wrapped = FALSE
	var/monkey_type = "Monkey"
	preloaded_reagents = list("protein" = 10)

/obj/item/reagent_containers/food/snacks/monkeycube/attack_self(mob/user as mob)
	if(wrapped)
		Unwrap(user)

/obj/item/reagent_containers/food/snacks/monkeycube/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	if(istype(T))
		new /mob/living/carbon/human/monkey(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/monkeycube/proc/Unwrap(mob/user as mob)
	icon_state = "monkeycube"
	desc = "Just add water!"
	to_chat(user, "You unwrap the cube.")
	wrapped = FALSE
	reagent_flags |= REFILLABLE
	matter = list(MATERIAL_BIOMATTER = 21)

/obj/item/reagent_containers/food/snacks/monkeycube/on_reagent_change()
	if(reagents.has_reagent("water"))
		Expand()

/obj/item/reagent_containers/food/snacks/monkeycube/wrapped
	desc = "Still wrapped in some paper."
	icon_state = "monkeycubewrap"
	reagent_flags = NONE
	wrapped = TRUE

/obj/item/reagent_containers/food/snacks/cube
	matter = list(MATERIAL_BIOMATTER = 20)

/obj/item/reagent_containers/food/snacks/cube/gun
	name = "Grow-A-Gun Cube"
	desc = "Just add Water!"
	reagent_flags = REFILLABLE
	icon_state = "guncube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("plasticide" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/gun/New()
	..()
	color = pick("#EE204D", "#FCE883", "#1F75FE", "#B5674D", "#FF7538", "#1CAC78", "#926EAE", "#232323")

/obj/item/reagent_containers/food/snacks/cube/gun/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/obj/item/gun/projectile/automatic/slaught_o_matic(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/gun/on_reagent_change()
	if(reagents.has_reagent("water"))
		Expand()


/obj/item/reagent_containers/food/snacks/cube/roach
	name = "Roach Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "roachcube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/roach/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/roach/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/food/snacks/cube/fuhrer
	name = "Fuhrer Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "fuhrercube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/fuhrer/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach/fuhrer(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/fuhrer/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/food/snacks/cube/jager
	name = "Jager Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "jagercube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/jager/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach/hunter(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/jager/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/food/snacks/cube/kraftwerk
	name = "Kraftwerk Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "kraftwerkcube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/kraftwerk/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach/nanite(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/kraftwerk/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/food/snacks/cube/roachling
	name = "Roachling Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "babycube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/roachling/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach/roachling(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/roachling/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/food/snacks/cube/seuche
	name = "Seuche Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "seuchecube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/seuche/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach/support(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/seuche/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/food/snacks/cube/panzer
	name = "Panzer Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "panzercube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/panzer/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach/tank(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/panzer/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/food/snacks/cube/elektromagnetisch
	name = "Elektromagnetisch Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "elektromagnetischrcube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/elektromagnetisch/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach/elektromagnetisch(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/elektromagnetisch/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/food/snacks/cube/glowing
	name = "Gluhend Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "glowingcube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/glowing/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach/glowing(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/glowing/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/food/snacks/cube/grestrahlte
	name = "Grestrahlte Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "gestrahltecube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/grestrahlte/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach/toxic(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/grestrahlte/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/food/snacks/spellburger
	name = "spell burger"
	desc = "This is absolutely Ei Nath."
	icon_state = "spellburger"
	filling_color = "#D505FF"
	bitesize = 2
	nutriment_desc = list("magic" = 3, "buns" = 3)
	nutriment_amt = 6
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/bigbiteburger
	name = "big bite burger"
	desc = "Forget the Big Mac. THIS is the future! It has big \"R\" stamped on it's bun."
	icon_state = "bigbiteburger"
	filling_color = "#E3D681"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("buns" = 4)
	nutriment_amt = 4
	preloaded_reagents = list("protein" = 10)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 60)

/obj/item/reagent_containers/food/snacks/enchiladas
	name = "enchiladas"
	desc = "Viva La Mexico!"
	icon_state = "enchiladas"
	trash = /obj/item/trash/tray
	filling_color = "#A36A1F"
	bitesize = 4
	center_of_mass = list("x"=16, "y"=13)
	nutriment_desc = list("tortilla" = 3, "corn" = 3)
	nutriment_amt = 2
	preloaded_reagents = list("protein" = 6, "capsaicin" = 6)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 15)

/obj/item/reagent_containers/food/snacks/monkeysdelight
	name = "monkey's delight"
	desc = "Eeee Eee!"
	icon_state = "monkeysdelight"
	trash = /obj/item/trash/tray
	filling_color = "#5C3C11"
	bitesize = 6
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("protein" = 10, "banana" = 5, "blackpepper" = 1, "sodiumchloride" = 1)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 33)

/obj/item/reagent_containers/food/snacks/baguette
	name = "baguette"
	desc = "Bon appetit!"
	icon_state = "baguette"
	filling_color = "#E3D796"
	bitesize = 3
	center_of_mass = list("x"=18, "y"=12)
	nutriment_desc = list("french bread" = 6)
	nutriment_amt = 6
	preloaded_reagents = list("blackpepper" = 1, "sodiumchloride" = 1)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/fishandchips
	name = "fish and chips"
	desc = "You got a loicense for eatin' these?"
	icon_state = "fishandchips"
	filling_color = "#E3D796"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=16)
	nutriment_desc = list("salt" = 1, "chips" = 3)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 6)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/sandwich
	name = "sandwich"
	desc = "A grand creation of meat, cheese, bread, and several leaves of lettuce! Arthur Dent would be proud."
	icon_state = "sandwich"
	filling_color = "#D9BE29"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=4)
	nutriment_desc = list("bread" = 3, "cheese" = 3)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 3)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/toastedsandwich
	name = "toasted sandwich"
	desc = "Your classic sandwich, grilled with butter to amp up its deliciousness factor tenfold."
	icon_state = "toastedsandwich"
	filling_color = "#D9BE29"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=4)
	nutriment_desc = list("toasted bread" = 3, "cheese" = 3)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 6) // Who thought putting carbon on a FOOD was a good idea?!
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 17)

/obj/item/reagent_containers/food/snacks/toasted_guild_sandwich
	name = "delux toasted sandwich"
	desc = "A perfectly toasted sandwich with all the works."
	icon_state = "toastedsandwich"
	filling_color = "#D9BE29"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=4)
	nutriment_desc = list("toasted bread" = 3, "cheese" = 3, "delux toasted sandwich" = 5)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 3, "machine binding ritual" = 3, "glucose" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 23)

/obj/item/reagent_containers/food/snacks/grilledcheese
	name = "grilled cheese sandwich"
	desc = "Goes great with Tomato soup!"
	icon_state = "toastedsandwich"
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
	bitesize = 2
	nutriment_desc = list("toasted bread" = 3, "bacon" = 3, "tomato" = 2)
	nutriment_amt = 3

/obj/item/reagent_containers/food/snacks/tomatosoup
	name = "tomato soup"
	desc = "Drinking this feels like being a vampire! A tomato vampire..."
	icon_state = "tomatosoup"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#D92929"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=7)
	nutriment_desc = list("soup" = 5)
	nutriment_amt = 5
	preloaded_reagents = list("tomatojuice" = 10)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/food/snacks/rofflewaffles
	name = "roffle waffles"
	desc = "Waffles from Roffle. Co."
	icon_state = "rofflewaffles"
	trash = /obj/item/trash/waffles
	filling_color = "#FF00F7"
	bitesize = 4
	center_of_mass = list("x"=15, "y"=11)
	nutriment_desc = list("waffle" = 7, "sweetness" = 1)
	nutriment_amt = 8
	preloaded_reagents = list("psilocybin" = 8)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/stew
	name = "stew"
	desc = "A nice and warm stew. Healthy and strong."
	icon_state = "stew"
	filling_color = "#9E673A"
	bitesize = 10
	center_of_mass = list("x"=16, "y"=5)
	nutriment_desc = list("tomato" = 2, "potato" = 2, "carrot" = 2, "mushroom" = 2) // I said no eggplant!!!
	nutriment_amt = 6
	preloaded_reagents = list("protein" = 4, "tomatojuice" = 5, "imidazoline" = 5, "water" = 5)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 17)

/obj/item/reagent_containers/food/snacks/jelliedtoast
	name = "jellied toast"
	desc = "A slice of bread covered with delicious jam."
	icon_state = "jellytoast"
	trash = /obj/item/trash/plate
	filling_color = "#B572AB"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=8)
	nutriment_desc = list("toasted bread" = 2)
	nutriment_amt = 1
	matter = list(MATERIAL_BIOMATTER = 4)

/obj/item/reagent_containers/food/snacks/jelliedtoast/cherry
	preloaded_reagents = list("cherryjelly" = 5)

/obj/item/reagent_containers/food/snacks/jelliedtoast/slime
	preloaded_reagents = list("slimejelly" = 5)

/obj/item/reagent_containers/food/snacks/jellyburger
	name = "jelly burger"
	desc = "Culinary delight..?"
	icon_state = "jellyburger"
	filling_color = "#B572AB"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("buns" = 5)
	nutriment_amt = 5
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/jellyburger/slime
	preloaded_reagents = list("slimejelly" = 5)

/obj/item/reagent_containers/food/snacks/jellyburger/cherry
	preloaded_reagents = list("cherryjelly" = 5)

/obj/item/reagent_containers/food/snacks/milosoup
	name = "milo soup"
	desc = "The universes best soup! Yum!!!"
	icon_state = "milosoup"
	trash = /obj/item/trash/snack_bowl
	bitesize = 4
	center_of_mass = list("x"=16, "y"=7)
	nutriment_desc = list("soy" = 8)
	nutriment_amt = 8
	preloaded_reagents = list("water" = 5)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/stewedsoymeat
	name = "stewed soy meat"
	desc = "Even non-vegetarians will LOVE this!"
	icon_state = "stewedsoymeat"
	trash = /obj/item/trash/plate
	bitesize = 2
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("soy" = 4, "tomato" = 4)
	nutriment_amt = 8
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/boiledspagetti
	name = "boiled spaghetti"
	desc = "A plain dish of noodles, this sucks."
	icon_state = "spagettiboiled"
	trash = /obj/item/trash/plate
	filling_color = "#FCEE81"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("noodles" = 2)
	nutriment_amt = 2
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/food/snacks/boiledrice
	name = "boiled rice"
	desc = "A boring dish of boring rice."
	icon_state = "boiledrice"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#FFFBDB"
	bitesize = 2
	center_of_mass = list("x"=17, "y"=11)
	nutriment_desc = list("rice" = 2)
	nutriment_amt = 2
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/food/snacks/ricepudding
	name = "rice pudding"
	desc = "Where's the jam?"
	icon_state = "rpudding"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#FFFBDB"
	bitesize = 2
	center_of_mass = list("x"=17, "y"=11)
	nutriment_desc = list("rice" = 2)
	nutriment_amt = 4
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 12)

/obj/item/reagent_containers/food/snacks/beefcurry
	name = "beef curry"
	desc = "A piping hot plate of spicy beef curry atop fluffy, steamed white rice."
	icon_state = "beefcurry"
	trash = /obj/item/trash/snack_bowl
	bitesize = 4
	preloaded_reagents = list("protein" = 8, "capsaicin" = 2)
	nutriment_desc = list("beef" = 5, "curry" = 5, "spicyness" = 2)

/obj/item/reagent_containers/food/snacks/chickencurry
	name = "poultry curry"
	desc = "A piping hot plate of spicy poultry curry atop fluffy, steamed white rice."
	icon_state = "chickencurry"
	trash = /obj/item/trash/snack_bowl
	bitesize = 4
	preloaded_reagents = list("protein" = 8, "capsaicin" = 2)
	nutriment_desc = list("chicken" = 5, "curry" = 5, "spicyness" = 2)

/obj/item/reagent_containers/food/snacks/mashpotatoes
	name = "mashed potatoes"
	desc = "Soft and fluffy mashed potatoes, the perfect side dish for a variety of meats."
	icon_state = "mashpotatoes"
	trash = /obj/item/trash/plate
	bitesize = 4
	nutriment_amt = 8
	nutriment_desc = list("mashed potatoes" = 5, "butter" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/katsudon
	name = "katsudon"
	desc = "Fried cutlets of meat on top of fluffy white rice with its own special sauce. A dish perfect for a night before an exam or getting a confession out of a criminal."
	icon_state = "katsudon"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#FFFBDB"
	bitesize = 5
	nutriment_desc = list("a mother's cooking" = 10, "rice" = 5, "katsu sauce" = 2)
	nutriment_amt = 10
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 20)

/obj/item/reagent_containers/food/snacks/pastatomato
	name = "spaghetti"
	desc = "Spaghetti and crushed tomatoes. Just like your abusive father used to make!"
	icon_state = "pastatomato"
	trash = /obj/item/trash/plate
	filling_color = "#DE4545"
	bitesize = 4
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("tomato" = 3, "noodles" = 3)
	nutriment_amt = 6
	preloaded_reagents = list("tomatojuice" = 10)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/meatballspagetti
	name = "spaghetti & meatballs"
	desc = "Now thats a nic'e meatball!"
	icon_state = "meatballspagetti"
	trash = /obj/item/trash/plate
	filling_color = "#DE4545"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("noodles" = 4)
	nutriment_amt = 4
	preloaded_reagents = list("protein" = 4)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 18)

/obj/item/reagent_containers/food/snacks/spesslaw
	name = "spesslaw"
	desc = "A lawyers favourite."
	icon_state = "spesslaw"
	filling_color = "#DE4545"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("noodles" = 4)
	nutriment_amt = 4
	preloaded_reagents = list("protein" = 4)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 28)

/obj/item/reagent_containers/food/snacks/carrotfries
	name = "carrot fries"
	desc = "Tasty fries from fresh Carrots."
	icon_state = "carrotfries"
	trash = /obj/item/trash/plate
	filling_color = "#FAA005"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("carrot" = 3, "salt" = 1)
	nutriment_amt = 3
	preloaded_reagents = list("imidazoline" = 3)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/superbiteburger
	name = "super bite burger"
	desc = "This is a mountain of a burger. FOOD!"
	icon_state = "superbiteburger"
	filling_color = "#CCA26A"
	bitesize = 10
	center_of_mass = list("x"=16, "y"=3)
	nutriment_desc = list("buns" = 25)
	nutriment_amt = 25
	preloaded_reagents = list("protein" = 40) // CALORIES GALORE! Changing to reflect the materials used and complexity of the recipe - Seb
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 40)

/obj/item/reagent_containers/food/snacks/candiedapple
	name = "candied apple"
	desc = "An apple coated in sugary sweetness."
	icon_state = "candiedapple"
	filling_color = "#F21873"
	bitesize = 3
	center_of_mass = list("x"=15, "y"=13)
	nutriment_desc = list("apple" = 3, "caramel" = 3, "sweetness" = 2)
	nutriment_amt = 3
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/applepie
	name = "apple pie"
	desc = "A pie containing sweet sweet love... or apple."
	icon_state = "applepie"
	filling_color = "#E0EDC5"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=13)
	nutriment_desc = list("sweetness" = 2, "apple" = 2, "pie" = 2)
	nutriment_amt = 4
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/food/snacks/cherrypie
	name = "cherry pie"
	desc = "Taste so good, make a grown man cry."
	icon_state = "cherrypie"
	filling_color = "#FF525A"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("sweetness" = 2, "cherry" = 2, "pie" = 2)
	nutriment_amt = 4
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/food/snacks/twobread
	name = "two bread"
	desc = "It is very bitter and winy."
	icon_state = "twobread"
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

/obj/item/reagent_containers/food/snacks/boiledslimecore
	name = "boiled slime core"
	desc = "A boiled red thing."
	icon_state = "boiledrorocore" // Fix'd
	bitesize = 3
	preloaded_reagents = list("slimejelly" = 5)
	matter = list(MATERIAL_BIOMATTER = 33)

/obj/item/reagent_containers/food/snacks/mint
	name = "mint"
	desc = "it is only wafer thin."
	icon_state = "mint"
	filling_color = "#F2F2F2"
	bitesize = 1
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("mint" = 1)
	matter = list(MATERIAL_BIOMATTER = 2)

/obj/item/reagent_containers/food/snacks/mushroomsoup
	name = "chantrelle soup"
	desc = "A delicious and hearty mushroom soup."
	icon_state = "mushroomsoup"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#E386BF"
	bitesize = 3
	center_of_mass = list("x"=17, "y"=10)
	nutriment_desc = list("mushroom" = 8, "milk" = 2)
	nutriment_amt = 8
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/food/snacks/plumphelmetbiscuit
	name = "plump helmet biscuit"
	desc = "This is a finely-prepared plump helmet biscuit. The ingredients are exceptionally minced plump helmet, and well-minced dwarven wheat flour."
	icon_state = "phelmbiscuit"
	filling_color = "#CFB4C4"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	nutriment_desc = list("mushroom" = 4)
	nutriment_amt = 5
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 9)
	New()
		..()
		if(prob(10))
			name = "exceptional plump helmet biscuit"
			desc = "Microwave is taken by a fey mood! It has cooked an exceptional plump helmet biscuit!"
			reagents.add_reagent("nutriment", 3)
			reagents.add_reagent("tricordrazine", 5)

/obj/item/reagent_containers/food/snacks/chawanmushi
	name = "chawanmushi"
	desc = "A legendary egg custard that makes friends out of enemies. Probably too hot for a cat to eat."
	icon_state = "chawanmushi"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#F0F2E4"
	bitesize = 1
	center_of_mass = list("x"=17, "y"=10)
	preloaded_reagents = list("protein" = 5)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/beetsoup
	name = "beet soup"
	desc = "Wait, how do you spell it again..?"
	icon_state = "beetsoup"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#FAC9FF"
	bitesize = 2
	center_of_mass = list("x"=15, "y"=8)
	nutriment_desc = list("tomato" = 4, "beet" = 4)
	nutriment_amt = 8
	matter = list(MATERIAL_BIOMATTER = 11)
	cooked = TRUE
	New()
		..()
		name = pick(list("borsch","bortsch","borstch","borsh","borshch","borscht"))

/obj/item/reagent_containers/food/snacks/tossedsalad
	name = "tossed salad"
	desc = "A proper salad, basic and simple, with little bits of carrot, tomato and apple intermingled. Vegan!"
	icon_state = "herbsalad"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#76B87F"
	center_of_mass = list("x"=17, "y"=11)
	nutriment_desc = list("salad" = 2, "tomato" = 2, "carrot" = 2, "apple" = 2)
	nutriment_amt = 8
	bitesize = 3
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/food/snacks/validsalad
	name = "valid salad"
	desc = "It's just a salad of questionable 'herbs' with meatballs and fried potato slices. Nothing suspicious about it."
	icon_state = "validsalad"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#76B87F"
	center_of_mass = list("x"=17, "y"=11)
	nutriment_desc = list("100% real salad" = 2)
	nutriment_amt = 6
	bitesize = 3
	preloaded_reagents = list("protein" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 19)

/obj/item/reagent_containers/food/snacks/appletart
	name = "golden apple streusel tart"
	desc = "A tasty dessert that won't make it through a metal detector."
	icon_state = "gappletart"
	trash = /obj/item/trash/plate
	filling_color = "#FFFF00"
	center_of_mass = list("x"=16, "y"=18)
	nutriment_desc = list("apple" = 8)
	nutriment_amt = 8
	bitesize = 3
	preloaded_reagents = list("gold" = 5)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 20)

/obj/item/reagent_containers/food/snacks/honeypudding
	name = "honey pudding"
	desc = "A tasty dessert that is made with honey and cocoa powerder for a delightful pudding." // IT'S CHOCOLATE NOT COCAINE! - Seb
	icon_state = "pudding"
	filling_color = "#FFFF00"
	center_of_mass = list("x"=16, "y"=18)
	nutriment_desc = list("bitter cocoa powder" = 1, "sweet gooey honey" = 2)
	nutriment_amt = 8
	bitesize = 3
	preloaded_reagents = list("honey" = 5)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 25)

/obj/item/reagent_containers/food/snacks/honeybuns
	name = "iced honey buns"
	desc = "A pastry that was iced with sugar and filled with honey."
	icon_state = "honeybuns"
	filling_color = "#FFFF00"
	center_of_mass = list("x"=16, "y"=18)
	nutriment_desc = list("honey" = 8, "pastry" = 3)
	nutriment_amt = 8
	bitesize = 3
	preloaded_reagents = list("sugar" = 5, "honey" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 22)

/obj/item/reagent_containers/food/snacks/honey_icecream
	name = "honey icecream"
	desc = "A cool dessert that is a mix of ice, cream, and honey."
	icon_state = "honey_icecream"
	trash = /obj/item/trash/icecreambowl
	filling_color = "#FFFF00"
	center_of_mass = list("x"=16, "y"=18)
	nutriment_desc = list("cream" = 3, "honey" = 2)
	nutriment_amt = 12
	bitesize = 3
	preloaded_reagents = list("cream" = 5, "honey" = 5)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 12)

//mre food
/obj/item/reagent_containers/food/snacks/mre
	name = "mre"
	desc = "A closed mre, ready to be opened."
	icon_state = "mre"
	trash = /obj/item/trash/mre
	filling_color = "#948051"
	nutriment_desc = list("heartiness" = 1, "beans" = 3)
	nutriment_amt = 6
	preloaded_reagents = list("protein" = 3, "sodiumchloride" = 5)
	cooked = TRUE
	reagent_flags = NONE
	var/warm = FALSE
	var/open = FALSE
	var/list/heated_reagents = list("tricordrazine" = 5)
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/food/snacks/mre/attack_self(mob/user)
	if(!open)
		open()
		to_chat(user, SPAN_NOTICE("You tear \the [src] open."))
		return
	if(warm)
		to_chat(user, SPAN_NOTICE("You already crushed \the [src] and it's still heating up, be patient."))
		return
	user.visible_message(
		SPAN_NOTICE("[user] crushes \the [src] package."),
		"You crush \the [src] package and feel a comfortable heat build up.",
	)
	warm = TRUE
	spawn(300)
		to_chat(user, "You think \the [src] is ready to eat about now.")
		heat()

/obj/item/reagent_containers/food/snacks/mre/attack(mob/M as mob, mob/user as mob, def_zone)
	. = ..()
	if(!open)
		open()
		to_chat(user, SPAN_WARNING("You viciously open \the [src] with your teeth, you animal."))

/obj/item/reagent_containers/food/snacks/mre/proc/heat()
	for(var/reagent in heated_reagents)
		reagents.add_reagent(reagent, heated_reagents[reagent])
	bitesize = 6
	icon_state = "mre_hot"

/obj/item/reagent_containers/food/snacks/mre/proc/open(mob/user)
	icon_state = "mre_open"
	desc = "A plethora of steaming beans mixed with meat, ready for consumption."
	open = TRUE
	reagent_flags |= REFILLABLE

/obj/item/reagent_containers/food/snacks/mre/can
	name = "ration can"
	desc = "Can of stew meat, tab right on top for easy opening."
	icon_state = "ration_can"
	trash = /obj/item/trash/mre_can
	filling_color = "#948051"
	nutriment_desc = list("heartiness" = 1, "meat" = 3)
	nutriment_amt = 5
	preloaded_reagents = list("protein" = 6, "iron" = 2)
	heated_reagents = list("bicaridine" = 5, "kelotane" = 5)
	matter = list(MATERIAL_BIOMATTER = 12)

/obj/item/reagent_containers/food/snacks/mre/can/open(mob/user)
	desc = "An opened can of stewed meat, ready for consumption."
	icon_state = "ration_can_open"
	open = TRUE
	reagent_flags |= REFILLABLE

/obj/item/reagent_containers/food/snacks/mre/can/heat()
	for(var/reagent in heated_reagents)
		reagents.add_reagent(reagent, heated_reagents[reagent])
	bitesize = 6
	icon_state = "ration_can_hot"

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

/obj/item/reagent_containers/food/snacks/candy/mre
	name = "morale bar"
	desc = "Some brand of non-melting military chocolate."
	icon_state = "mre_candy"
	trash = /obj/item/trash/mre_candy
	preloaded_reagents = list("sugar" = 3, "coco" = 2)
	var/open = FALSE

/obj/item/reagent_containers/food/snacks/candy/mre/attack_self(mob/user)
	if(!open)
		open()
		to_chat(user, SPAN_NOTICE("You tear \the [src] open."))
		return

/obj/item/reagent_containers/food/snacks/candy/mre/attack(mob/M as mob, mob/user as mob, def_zone)
	. = ..()
	if(!open)
		open()
		to_chat(user, SPAN_WARNING("You viciously rip \the [src] open with your teeth, swallowing some plastic in the process, you animal."))

/obj/item/reagent_containers/food/snacks/candy/mre/proc/open(mob/user)
	icon_state = "mre_candy_open"
	open = TRUE


/////////////////////////////////////////////////Sliceable////////////////////////////////////////
// All the food items that can be sliced into smaller bits like Meatbread and Cheesewheels

// sliceable is just an organization type path, it doesn't have any additional code or variables tied to it.

/obj/item/reagent_containers/food/snacks/sliceable
	w_class = ITEM_SIZE_NORMAL //Whole pizzas and cakes shouldn't fit in a pocket, you can slice them if you want to do that.

/obj/item/reagent_containers/food/snacks/sliceable/meatbread
	name = "meatbread loaf"
	desc = "The culinary base of every self-respecting eloquen/tg/entleman."
	icon_state = "meatbread"
	slice_path = /obj/item/reagent_containers/food/snacks/meatbreadslice
	slices_num = 5
	filling_color = "#FF7575"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=9)
	nutriment_desc = list("bread" = 10)
	nutriment_amt = 10
	preloaded_reagents = list("protein" = 20)
	matter = list(MATERIAL_BIOMATTER = 20)

/obj/item/reagent_containers/food/snacks/meatbreadslice
	name = "meatbread slice"
	desc = "A slice of delicious meatbread."
	icon_state = "meatbreadslice"
	trash = /obj/item/trash/plate
	filling_color = "#FF7575"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("protein" = 4, "nutriment" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 4)

/obj/item/reagent_containers/food/snacks/sliceable/xenomeatbread
	name = "xenomeatbread loaf"
	desc = "The culinary base of every self-respecting eloquent gentleman. Extra Heretical."
	icon_state = "xenomeatbread"
	slice_path = /obj/item/reagent_containers/food/snacks/xenomeatbreadslice
	slices_num = 5
	filling_color = "#8AFF75"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=9)
	nutriment_desc = list("bread" = 10)
	nutriment_amt = 10
	preloaded_reagents = list("protein" = 20)
	matter = list(MATERIAL_BIOMATTER = 20)

/obj/item/reagent_containers/food/snacks/xenomeatbreadslice
	name = "xenomeatbread slice"
	desc = "A slice of delicious meatbread. Extra Heretical."
	icon_state = "xenobreadslice"
	trash = /obj/item/trash/plate
	filling_color = "#8AFF75"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	nutriment_amt = 2
	nutriment_desc = list("bread" = 2)
	preloaded_reagents = list("protein" = 4)
	matter = list(MATERIAL_BIOMATTER = 4)

/obj/item/reagent_containers/food/snacks/sliceable/bananabread
	name = "banana-nut bread"
	desc = "A heavenly and filling treat."
	icon_state = "bananabread"
	slice_path = /obj/item/reagent_containers/food/snacks/bananabreadslice
	slices_num = 5
	filling_color = "#EDE5AD"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=9)
	nutriment_desc = list("bread" = 10)
	nutriment_amt = 10
	preloaded_reagents = list("banana" = 20)
	matter = list(MATERIAL_BIOMATTER = 10)

/obj/item/reagent_containers/food/snacks/bananabreadslice
	name = "banana-nut bread slice"
	desc = "A slice of delicious banana bread."
	icon_state = "bananabreadslice"
	trash = /obj/item/trash/plate
	filling_color = "#EDE5AD"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=8)
	preloaded_reagents = list("banana" = 4, "nutriment" = 4)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 2)

/obj/item/reagent_containers/food/snacks/sliceable/tofubread
	name = "tofubread"
	icon_state = "Like meatbread but for vegetarians. Not guaranteed to give superpowers."
	icon_state = "tofubread"
	slice_path = /obj/item/reagent_containers/food/snacks/tofubreadslice
	slices_num = 5
	filling_color = "#F7FFE0"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=9)
	nutriment_desc = list("tofu" = 10)
	nutriment_amt = 30
	matter = list(MATERIAL_BIOMATTER = 10)

/obj/item/reagent_containers/food/snacks/tofubreadslice
	name = "tofubread slice"
	desc = "A slice of delicious tofubread."
	icon_state = "tofubreadslice"
	trash = /obj/item/trash/plate
	filling_color = "#F7FFE0"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	nutriment_amt = 6
	nutriment_desc = list("tofu" = 2)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/sliceable/carrotcake
	name = "carrot cake"
	desc = "A favorite dessert of a certain wascally wabbit. Not a lie."
	icon_state = "carrotcake"
	slice_path = /obj/item/reagent_containers/food/snacks/carrotcakeslice
	slices_num = 5
	filling_color = "#FFD675"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10, "carrot" = 15)
	nutriment_amt = 25
	preloaded_reagents = list("imidazoline" = 10)
	matter = list(MATERIAL_BIOMATTER = 25)

/obj/item/reagent_containers/food/snacks/carrotcakeslice
	name = "carrot cake slice"
	desc = "Carrotty slice of Carrot Cake, carrots are good for your eyes! Also not a lie."
	icon_state = "carrotcake_slice"
	trash = /obj/item/trash/plate
	filling_color = "#FFD675"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=14)
	nutriment_amt = 5
	nutriment_desc = list("cake" = 2, "sweetness" = 2, "carrot" = 3)
	preloaded_reagents = list("imidazoline" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/sliceable/braincake
	name = "brain cake"
	desc = "A squishy cake-thing."
	icon_state = "braincake"
	slice_path = /obj/item/reagent_containers/food/snacks/braincakeslice
	slices_num = 5
	filling_color = "#E6AEDB"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10, "slime" = 15)
	nutriment_amt = 5
	bitesize = 2
	preloaded_reagents = list("protein" = 25, "alkysine" = 10)
	matter = list(MATERIAL_BIOMATTER = 60)

/obj/item/reagent_containers/food/snacks/braincakeslice
	name = "brain cake slice"
	desc = "Lemme tell you something about prions. THEY'RE DELICIOUS."
	icon_state = "braincakeslice"
	trash = /obj/item/trash/plate
	filling_color = "#E6AEDB"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=12)
	preloaded_reagents = list("protein" = 5, "nutriment" = 1, "alkysine" = 2)
	matter = list(MATERIAL_BIOMATTER = 12)

/obj/item/reagent_containers/food/snacks/sliceable/cheesecake
	name = "cheese cake"
	desc = "DANGEROUSLY cheesy."
	icon_state = "cheesecake"
	slice_path = /obj/item/reagent_containers/food/snacks/cheesecakeslice
	slices_num = 5
	filling_color = "#FAF7AF"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "cream" = 10, "cheese" = 15)
	nutriment_amt = 10
	bitesize = 2
	preloaded_reagents = list("protein" = 15)
	matter = list(MATERIAL_BIOMATTER = 25)

/obj/item/reagent_containers/food/snacks/cheesecakeslice
	name = "cheese cake slice"
	desc = "Slice of pure cheestisfaction"
	icon_state = "cheesecake_slice"
	trash = /obj/item/trash/plate
	filling_color = "#FAF7AF"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 3, "nutriment" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/sliceable/plaincake
	name = "vanilla cake"
	desc = "A plain cake, not a lie."
	icon_state = "plaincake"
	slice_path = /obj/item/reagent_containers/food/snacks/plaincakeslice
	slices_num = 5
	filling_color = "#F7EDD5"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10, "vanilla" = 15)
	nutriment_amt = 20
	matter = list(MATERIAL_BIOMATTER = 20)

/obj/item/reagent_containers/food/snacks/plaincakeslice
	name = "vanilla cake slice"
	desc = "Just a slice of cake, it is enough for everyone."
	icon_state = "plaincake_slice"
	trash = /obj/item/trash/plate
	filling_color = "#F7EDD5"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("nutriment" = 4)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 4)

/obj/item/reagent_containers/food/snacks/sliceable/orangecake
	name = "orange cake"
	desc = "A cake with added orange."
	icon_state = "orangecake"
	slice_path = /obj/item/reagent_containers/food/snacks/orangecakeslice
	slices_num = 5
	filling_color = "#FADA8E"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10, "orange" = 15)
	nutriment_amt = 20
	matter = list(MATERIAL_BIOMATTER = 25)

/obj/item/reagent_containers/food/snacks/orangecakeslice
	name = "orange cake slice"
	desc = "Just a slice of cake, it is enough for everyone."
	icon_state = "orangecake_slice"
	trash = /obj/item/trash/plate
	filling_color = "#FADA8E"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("nutriment" = 4)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/sliceable/limecake
	name = "lime cake"
	desc = "A cake with added lime."
	icon_state = "limecake"
	slice_path = /obj/item/reagent_containers/food/snacks/limecakeslice
	slices_num = 5
	filling_color = "#CBFA8E"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10, "lime" = 15)
	nutriment_amt = 20
	matter = list(MATERIAL_BIOMATTER = 25)

/obj/item/reagent_containers/food/snacks/limecakeslice
	name = "lime cake slice"
	desc = "Just a slice of cake, it is enough for everyone."
	icon_state = "limecake_slice"
	trash = /obj/item/trash/plate
	filling_color = "#CBFA8E"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("nutriment" = 4)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/sliceable/lemoncake
	name = "lemon cake"
	desc = "A cake with added lemon."
	icon_state = "lemoncake"
	slice_path = /obj/item/reagent_containers/food/snacks/lemoncakeslice
	slices_num = 5
	filling_color = "#FAFA8E"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10, "lemon" = 15)
	nutriment_amt = 20
	matter = list(MATERIAL_BIOMATTER = 25)

/obj/item/reagent_containers/food/snacks/lemoncakeslice
	name = "lemon cake slice"
	desc = "Just a slice of cake, it is enough for everyone."
	icon_state = "lemoncake_slice"
	trash = /obj/item/trash/plate
	filling_color = "#FAFA8E"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("nutriment" = 4)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/sliceable/chocolatecake
	name = "chocolate cake"
	desc = "A cake with added chocolate"
	icon_state = "chocolatecake"
	slice_path = /obj/item/reagent_containers/food/snacks/chocolatecakeslice
	slices_num = 5
	filling_color = "#805930"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10, "chocolate" = 15)
	nutriment_amt = 20
	matter = list(MATERIAL_BIOMATTER = 30)

/obj/item/reagent_containers/food/snacks/chocolatecakeslice
	name = "chocolate cake slice"
	desc = "Just a slice of cake, it is enough for everyone."
	icon_state = "chocolatecake_slice"
	trash = /obj/item/trash/plate
	filling_color = "#805930"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("nutriment" = 4)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/food/snacks/sliceable/brownie
	name = "brownies"
	desc = "A huge rectangular brownie ready to be sliced and shared."
	icon_state = "brownies"
	trash = /obj/item/trash/waffles
	filling_color = "#362008"
	slice_path = /obj/item/reagent_containers/food/snacks/brownieslice
	slices_num = 5
	nutriment_amt = 20
	nutriment_desc = list("buttery goodness" = 10, "sweetness" = 10, "chocolate" = 15)
	matter = list(MATERIAL_BIOMATTER = 30)

/obj/item/reagent_containers/food/snacks/brownieslice
	name = "brownie slice"
	desc = "A delicious and buttery chocolate brownie, pairs perfect with icecream!"
	icon_state = "brownieslice"
	filling_color = "#362008"
	trash = /obj/item/trash/plate
	bitesize = 2
	nutriment_amt = 4
	nutriment_desc = list("buttery goodness" = 5, "sweetness" = 5, "chocolate" = 10)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/food/snacks/icecream
	name = "icecream"
	desc = "A luxurious yet simple iced cream, the most refreshing dessert after a trip through the humid Amethian jungle."
	icon_state = "vanillaicecream"
	trash = /obj/item/trash/icecreambowl
	bitesize = 3
	nutriment_amt = 6
	nutriment_desc = list("vanilla" = 10, "sweetness" = 5, "refreshing cold" = 5)
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/food/snacks/icecream/attackby(obj/item/W as obj, mob/user as mob) // No way we're microwaving two cookies to make an ICECREAM sandwich. - Seb
	if(istype(W,/obj/item/reagent_containers/food/snacks/brownieslice)) // Fits better than a cookie for the sandwich
		new /obj/item/reagent_containers/food/snacks/icecreamsandwich(src)
		to_chat(user, "You sandwich the icecream between the brownies.")
		qdel(W)
		qdel(src)

/obj/item/reagent_containers/food/snacks/chocoicecream
	name = "chocolate icecream"
	desc = "A sweet and intense velvety chocolate icecream, for those who love bitter yet sweet tones."
	icon_state = "chocolateicecream"
	trash = /obj/item/trash/icecreambowl
	bitesize = 3
	nutriment_amt = 8
	nutriment_desc = list("velvety chocolate" = 10, "sweetness" = 5, "refreshing cold" = 5)
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/food/snacks/strawberryicecream
	name = "strawberry icecream"
	desc = "Classic strawberry flavored icecream, a delicious treat for ladies and lovers of berries all around the universe."
	icon_state = "strawberryicecream"
	trash = /obj/item/trash/icecreambowl
	bitesize = 3
	nutriment_amt = 8
	nutriment_desc = list("strawberry" = 10, "sweetness" = 5, "refreshing cold" = 5)
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/food/snacks/strawberryicecream/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/reagent_containers/food/snacks/cookie))
		new /obj/item/reagent_containers/food/snacks/strawberrysandwich(src)
		to_chat(user, "You sandwich the icecream between the cookies.")
		qdel(W)
		qdel(src)

/obj/item/reagent_containers/food/snacks/icecreamsandwich
	name = "icecream sandwich"
	desc = "A classic icecream sandwiched between two chocolate cookies, an essential dessert to have by the dozen."
	icon_state = "icecreamsandwich"
	bitesize = 4
	nutriment_amt = 8
	nutriment_desc = list("icecream" = 10, "cookies" = 5, "perfection" = 15)
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/strawberrysandwich
	name = "strawberry icecream sandwich"
	desc = "A classic strawberry icecream sandwiched between two vanilla cookies, an essential treat to have by the dozen."
	icon_state = "icecreamsandwich_sb"
	bitesize = 4
	nutriment_amt = 8
	nutriment_desc = list("strawberry icecream" = 10, "cookies" = 5, "perfection" = 15)
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/chocolatepiece
	name = "chocolate piece"
	desc = "A luscious milk chocolate piece filled with gooey dulce de leche."
	icon_state =  "chocolatepiece"
	filling_color = "#7D5F46"
	nutriment_amt = 1
	nutriment_desc = list("chocolate" = 3, "dulce de leche" = 2, "lusciousness" = 1)
	bitesize = 2
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/chocolatepiece/white
	name = "white chocolate piece"
	desc = "A creamy white chocolate piece drizzled in milk chocolate."
	icon_state = "chocolatepiece_white"
	filling_color = "#E2DAD3"
	nutriment_desc = list("white chocolate" = 3, "creaminess" = 1)
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/chocolatepiece/truffle
	name = "chocolate truffle"
	desc = "A bite-sized milk chocolate truffle that could buy anyone's love."
	icon_state = "chocolatepiece_truffle"
	nutriment_desc = list("chocolate" = 3, "undying devotion" = 3)
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/sliceable/cheesewheel
	name = "cheese wheel"
	desc = "A big wheel of delicious cheese."
	icon_state = "cheesewheel"
	slice_path = /obj/item/reagent_containers/food/snacks/cheesewedge
	slices_num = 5
	filling_color = "#FFF700"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cheese" = 10)
	nutriment_amt = 10
	preloaded_reagents = list("protein" = 10)
	matter = list(MATERIAL_BIOMATTER = 15)

/obj/item/reagent_containers/food/snacks/cheesewedge
	name = "cheese wedge"
	desc = "A wedge of delicious cheese. The cheese wheel it was cut from can't have gone far."
	icon_state = "cheesewedge"
	filling_color = "#FFF700"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=10)
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/sliceable/birthdaycake
	name = "birthday cake"
	desc = "Happy Birthday to you..."
	icon_state = "birthdaycake"
	slice_path = /obj/item/reagent_containers/food/snacks/birthdaycakeslice
	slices_num = 5
	filling_color = "#FFD6D6"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10)
	nutriment_amt = 20
	preloaded_reagents = list("sprinkles" = 10)
	matter = list(MATERIAL_BIOMATTER = 45)

/obj/item/reagent_containers/food/snacks/birthdaycakeslice
	name = "birthday cake slice"
	desc = "A slice of your birthday."
	icon_state = "birthdaycakeslice"
	trash = /obj/item/trash/plate
	filling_color = "#FFD6D6"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("nutriment" = 4, "sprinkles" = 2)
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/food/snacks/sliceable/bread
	name = "bread"
	icon_state = "Some plain old Earthen bread."
	icon_state = "bread"
	slice_path = /obj/item/reagent_containers/food/snacks/breadslice
	slices_num = 5
	filling_color = "#FFE396"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=9)
	nutriment_desc = list("bread" = 6)
	nutriment_amt = 6
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/breadslice
	name = "bread slice"
	desc = "A slice of home."
	icon_state = "breadslice"
	trash = /obj/item/trash/plate
	filling_color = "#D27332"
	nutriment_amt = 1
	bitesize = 2
	center_of_mass = list("x"=16, "y"=4)

/obj/item/reagent_containers/food/snacks/breadslice/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/reagent_containers/food/snacks/butterslice))
		new /obj/item/reagent_containers/food/snacks/butterbread(src)
		to_chat(user, "You spread the butter on the toast.")
		qdel(W)
		qdel(src)

/obj/item/reagent_containers/food/snacks/butterbread
	name = "buttered toast"
	desc = "A freshly toasted slice of bread with melting butter on top, the humblest of meals for the simple man."
	icon_state = "buttertoast"
	bitesize = 3
	nutriment_amt = 3
	nutriment_desc = list("bread" = 6, "butter" = 3)

/obj/item/reagent_containers/food/snacks/sliceable/creamcheesebread
	name = "cream cheese bread"
	desc = "Yum yum yum!"
	icon_state = "creamcheesebread"
	slice_path = /obj/item/reagent_containers/food/snacks/creamcheesebreadslice
	slices_num = 5
	filling_color = "#FFF896"
	center_of_mass = list("x"=16, "y"=9)
	nutriment_desc = list("bread" = 6, "cream" = 3, "cheese" = 3)
	nutriment_amt = 5
	bitesize = 2
	preloaded_reagents = list("protein" = 15)
	matter = list(MATERIAL_BIOMATTER = 10)

/obj/item/reagent_containers/food/snacks/creamcheesebreadslice
	name = "cream cheese bread slice"
	desc = "A slice of yum!"
	icon_state = "creamcheesebreadslice"
	trash = /obj/item/trash/plate
	filling_color = "#FFF896"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("protein" = 3)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 2)

/obj/item/reagent_containers/food/snacks/watermelonslice
	name = "watermelon slice"
	desc = "A slice of watery goodness."
	icon_state = "watermelonslice"
	filling_color = "#FF3867"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=10)
	preloaded_reagents = list("watermelonjuice" = 1)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/sliceable/applecake
	name = "apple cake"
	desc = "A cake centred with Apple"
	icon_state = "applecake"
	slice_path = /obj/item/reagent_containers/food/snacks/applecakeslice
	slices_num = 5
	filling_color = "#EBF5B8"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10, "apple" = 15)
	nutriment_amt = 15
	matter = list(MATERIAL_BIOMATTER = 25)

/obj/item/reagent_containers/food/snacks/applecakeslice
	name = "apple cake slice"
	desc = "A slice of heavenly cake."
	icon_state = "applecakeslice"
	trash = /obj/item/trash/plate
	filling_color = "#EBF5B8"
	bitesize = 2
	nutriment_amt = 3
	center_of_mass = list("x"=16, "y"=14)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/sliceable/pumpkinpie
	name = "pumpkin pie"
	desc = "A delicious treat for the autumn months."
	icon_state = "pumpkinpie"
	slice_path = /obj/item/reagent_containers/food/snacks/pumpkinpieslice
	slices_num = 5
	filling_color = "#F5B951"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("pie" = 5, "cream" = 5, "pumpkin" = 5)
	nutriment_amt = 15
	matter = list(MATERIAL_BIOMATTER = 25)

/obj/item/reagent_containers/food/snacks/pumpkinpieslice
	name = "pumpkin pie slice"
	desc = "A slice of pumpkin pie, with whipped cream on top. Perfection."
	icon_state = "pumpkinpieslice"
	trash = /obj/item/trash/plate
	filling_color = "#F5B951"
	bitesize = 2
	nutriment_amt = 3
	center_of_mass = list("x"=16, "y"=12)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/cracker
	name = "cracker"
	desc = "It's a salted cracker."
	icon_state = "cracker"
	filling_color = "#F5DEB8"
	center_of_mass = list("x"=17, "y"=6)
	nutriment_desc = list("salt" = 1, "cracker" = 2)
	nutriment_amt = 1

/obj/item/reagent_containers/food/snacks/sliceable/butterstick
	name = "stick of butter"
	desc = "A whole stick of butter, an excellent flavor booster or spread."
	icon_state = "butter"
	slice_path = /obj/item/reagent_containers/food/snacks/butterslice
	slices_num = 5
	nutriment_amt = 10
	nutriment_desc = list("your arteries clogging themselves" = 10)
	matter = list(MATERIAL_BIOMATTER = 10)

/obj/item/reagent_containers/food/snacks/butterslice // I'm so sorry for this. Wasting an entire stick of butter on a toast is a no.
	name = "slice of butter"
	desc = "A slice of butter ready to be spread over toast or used on recipes."
	icon_state = "butterslice"
	bitesize = 2
	nutriment_amt = 2
	nutriment_desc = list("butter" = 5)

/obj/item/reagent_containers/food/snacks/cinnamonroll
	name = "cinnamon roll"
	desc = "A rolled up pastry with cream cheese frosting and cinnamon sugar filling."
	icon_state = "cinnamonroll"
	bitesize = 3
	nutriment_amt = 6
	nutriment_desc = list("cinnamon" = 10, "buttery goodness" = 5, "cream cheese" = 3)

/////////////////////////////////////////////////PIZZA////////////////////////////////////////

/obj/item/reagent_containers/food/snacks/sliceable/pizza
	slices_num = 6
	filling_color = "#BAA14C"
	matter = list(MATERIAL_BIOMATTER = 25)

/obj/item/reagent_containers/food/snacks/sliceable/pizza/margherita
	name = "margherita"
	desc = "The golden standard of pizzas."
	icon_state = "pizzamargherita"
	slice_path = /obj/item/reagent_containers/food/snacks/margheritaslice
	slices_num = 6
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("pizza crust" = 10, "tomato" = 10, "cheese" = 15)
	nutriment_amt = 35
	preloaded_reagents = list("protein" = 5, "tomatojuice" = 6)

/obj/item/reagent_containers/food/snacks/margheritaslice
	name = "margherita slice"
	desc = "A slice of classic margherita pizza."
	icon_state = "pizzamargheritaslice"
	filling_color = "#BAA14C"
	bitesize = 2
	center_of_mass = list("x"=18, "y"=13)
	preloaded_reagents = list("nutriment" = 5, "protein" = 1, "tomatojuice" = 1)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/sliceable/pizza/meatpizza
	name = "meat pizza"
	desc = "A pizza with meat toppings."
	icon_state = "meatpizza"
	slice_path = /obj/item/reagent_containers/food/snacks/meatpizzaslice
	slices_num = 6
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("pizza crust" = 10, "tomato" = 10, "cheese" = 15)
	nutriment_amt = 10
	bitesize = 2
	preloaded_reagents = list("protein" = 34, "tomatojuice" = 6)

/obj/item/reagent_containers/food/snacks/meatpizzaslice
	name = "meat pizza slice"
	desc = "A slice of meaty pizza."
	icon_state = "meatpizzaslice"
	filling_color = "#BAA14C"
	bitesize = 2
	center_of_mass = list("x"=18, "y"=13)
	preloaded_reagents = list("protein" = 7, "tomatojuice" = 1)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/sliceable/pizza/mushroompizza
	name = "mushroom pizza"
	desc = "Pizza with a hefty topping of mushrooms."
	icon_state = "mushroompizza"
	slice_path = /obj/item/reagent_containers/food/snacks/mushroompizzaslice
	slices_num = 6
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("pizza crust" = 10, "tomato" = 10, "cheese" = 5, "mushroom" = 10)
	nutriment_amt = 35
	bitesize = 2
	preloaded_reagents = list("protein" = 5)

/obj/item/reagent_containers/food/snacks/mushroompizzaslice
	name = "mushroom pizza slice"
	desc = "A slice of mushroom topped pizza."
	icon_state = "mushroompizzaslice"
	filling_color = "#BAA14C"
	bitesize = 2
	center_of_mass = list("x"=18, "y"=13)
	preloaded_reagents = list("nutriment" = 5, "protein" = 1)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/sliceable/pizza/vegetablepizza
	name = "vegetable pizza"
	desc = "No Tomato Sapiens were harmed during the baking of this pizza."
	icon_state = "vegetablepizza"
	slice_path = /obj/item/reagent_containers/food/snacks/vegetablepizzaslice
	slices_num = 6
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("pizza crust" = 10, "tomato" = 10, "cheese" = 5, "eggplant" = 5, "carrot" = 5, "corn" = 5)
	nutriment_amt = 25
	bitesize = 2
	preloaded_reagents = list("protein" = 5, "tomatojuice" = 6, "imidazoline" = 12)

/obj/item/reagent_containers/food/snacks/vegetablepizzaslice
	name = "vegetable pizza slice"
	desc = "A slice of the most green pizza of all pizzas not containing green ingredients."
	icon_state = "vegetablepizzaslice"
	filling_color = "#BAA14C"
	bitesize = 2
	center_of_mass = list("x"=18, "y"=13)
	preloaded_reagents = list("nutriment" = 4, "protein" = 1, "tomatojuice" = 1, "imidazoline" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/sliceable/pizza/hawaiianpizza
	name = "hawaiian pizza pizza"
	desc = "A pizza with added cooked pineapple slices, some swear by it, others hate it."
	icon_state = "hawaiianpizza"
	slice_path = /obj/item/reagent_containers/food/snacks/hawaiianpizzaslice
	slices_num = 6
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("pizza crust" = 10, "tomato" = 10, "cheese" = 5, "pineapple" = 5)
	nutriment_amt = 25
	bitesize = 2
	preloaded_reagents = list("protein" = 5, "tomatojuice" = 6)

/obj/item/reagent_containers/food/snacks/hawaiianpizzaslice
	name = "hawaiian pizza slice"
	desc = "A slice of hawaiian pizza with bits of cooked pineapple atop it."
	icon_state = "hawaiianpizzaslice"
	filling_color = "#BAA14C"
	bitesize = 2
	center_of_mass = list("x"=18, "y"=13)
	preloaded_reagents = list("nutriment" = 4, "protein" = 1, "tomatojuice" = 1)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/pizzabox
	name = "pizza box"
	desc = "A box suited for pizzas."
	icon = 'icons/obj/food.dmi'
	icon_state = "pizzabox1"

	var/open = 0 // Is the box open?
	var/ismessy = 0 // Fancy mess on the lid
	var/obj/item/reagent_containers/food/snacks/sliceable/pizza/pizza // Content pizza
	var/list/boxes = list() // If the boxes are stacked, they come here
	var/boxtag = ""

/obj/item/pizzabox/update_icon()

	cut_overlays()

	// Set appropriate description
	if( open && pizza )
		desc = "A box suited for pizzas. It appears to have a [pizza.name] inside."
	else if( boxes.len > 0 )
		desc = "A pile of boxes suited for pizzas. There appears to be [boxes.len + 1] boxes in the pile."

		var/obj/item/pizzabox/topbox = boxes[boxes.len]
		var/toptag = topbox.boxtag
		if( toptag != "" )
			desc = "[desc] The box on top has a tag, it reads: '[toptag]'."
	else
		desc = "A box suited for pizzas."

		if( boxtag != "" )
			desc = "[desc] The box has a tag, it reads: '[boxtag]'."

	// Icon states and over-lays
	if( open )
		if( ismessy )
			icon_state = "pizzabox_messy"
		else
			icon_state = "pizzabox_open"

		if( pizza )
			var/image/pizzaimg = image("food.dmi", icon_state = pizza.icon_state)
			pizzaimg.pixel_y = -3
			add_overlay(pizzaimg)

		return
	else
		// Stupid code because byondcode sucks
		var/doimgtag = 0
		if( boxes.len > 0 )
			var/obj/item/pizzabox/topbox = boxes[boxes.len]
			if( topbox.boxtag != "" )
				doimgtag = 1
		else
			if( boxtag != "" )
				doimgtag = 1

		if( doimgtag )
			var/image/tagimg = image("food.dmi", icon_state = "pizzabox_tag")
			tagimg.pixel_y = boxes.len * 3
			add_overlay(tagimg)

	icon_state = "pizzabox[boxes.len+1]"

/obj/item/pizzabox/attack_hand( mob/user as mob )

	if( open && pizza )
		user.put_in_hands( pizza )

		to_chat(user, SPAN_WARNING("You take \the [src.pizza] out of \the [src]."))
		src.pizza = null
		update_icon()
		return

	if( boxes.len > 0 )
		if( user.get_inactive_hand() != src )
			..()
			return

		var/obj/item/pizzabox/box = boxes[boxes.len]
		boxes -= box

		user.put_in_hands( box )
		to_chat(user, SPAN_WARNING("You remove the topmost [src] from your hand."))
		box.update_icon()
		update_icon()
		return
	..()

/obj/item/pizzabox/attack_self( mob/user as mob )

	if( boxes.len > 0 )
		return

	open = !open

	if( open && pizza )
		ismessy = 1

	update_icon()

/obj/item/pizzabox/attackby( obj/item/I as obj, mob/user as mob )
	if( istype(I, /obj/item/pizzabox/) )
		var/obj/item/pizzabox/box = I

		if( !box.open && !src.open )
			// Make a list of all boxes to be added
			var/list/boxestoadd = list()
			boxestoadd += box
			for(var/obj/item/pizzabox/i in box.boxes)
				boxestoadd += i

			if( (boxes.len+1) + boxestoadd.len <= 5 )
				user.drop_from_inventory(box, src)
				box.boxes = list() // Clear the box boxes so we don't have boxes inside boxes. - Xzibit
				src.boxes.Add( boxestoadd )

				box.update_icon()
				update_icon()

				to_chat(user, SPAN_WARNING("You put \the [box] ontop of \the [src]!"))
			else
				to_chat(user, SPAN_WARNING("The stack is too high!"))
		else
			to_chat(user, SPAN_WARNING("Close \the [box] first!"))

		return

	if( istype(I, /obj/item/reagent_containers/food/snacks/sliceable/pizza/) ) // Long ass fucking object name

		if( src.open )
			user.drop_from_inventory(I, src)
			src.pizza = I

			update_icon()

			to_chat(user, SPAN_WARNING("You put \the [I] in \the [src]!"))
		else
			to_chat(user, SPAN_WARNING("You try to push \the [I] through the lid but it doesn't work!"))
		return

	if( istype(I, /obj/item/pen/) )

		if( src.open )
			return

		var/t = sanitize(input("Enter what you want to add to the tag:", "Write", null, null) as text, 30)

		var/obj/item/pizzabox/boxtotagto = src
		if( boxes.len > 0 )
			boxtotagto = boxes[boxes.len]

		boxtotagto.boxtag = copytext("[boxtotagto.boxtag][t]", 1, 30)

		update_icon()
		return
	..()

/obj/item/pizzabox/margherita/New()
	pizza = new /obj/item/reagent_containers/food/snacks/sliceable/pizza/margherita(src)
	boxtag = "Margherita Deluxe"

/obj/item/pizzabox/vegetable/New()
	pizza = new /obj/item/reagent_containers/food/snacks/sliceable/pizza/vegetablepizza(src)
	boxtag = "Gourmet Vegetable"

/obj/item/pizzabox/mushroom/New()
	pizza = new /obj/item/reagent_containers/food/snacks/sliceable/pizza/mushroompizza(src)
	boxtag = "Mushroom Special"

/obj/item/pizzabox/meat/New()
	pizza = new /obj/item/reagent_containers/food/snacks/sliceable/pizza/meatpizza(src)
	boxtag = "Meatlover's Supreme"

/obj/item/pizzabox/hawaiianpizza/New()
	pizza = new /obj/item/reagent_containers/food/snacks/sliceable/pizza/hawaiianpizza(src)
	boxtag = "Controversial Pizza"

///////////////////////////////////////////
// new old food stuff from bs12
///////////////////////////////////////////
/obj/item/reagent_containers/food/snacks/dough
	name = "dough"
	desc = "A piece of dough."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "dough"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	nutriment_desc = list("dough" = 3)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 1)
	matter = list(MATERIAL_BIOMATTER = 5)

// Dough + rolling pin = flat dough
/obj/item/reagent_containers/food/snacks/dough/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/material/kitchen/rollingpin))
		new /obj/item/reagent_containers/food/snacks/sliceable/flatdough(src)
		to_chat(user, "You flatten the dough.")
		qdel(src)

// slicable into 3xdoughslices
/obj/item/reagent_containers/food/snacks/sliceable/flatdough
	name = "flat dough"
	desc = "A flattened dough."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "flat dough"
	slice_path = /obj/item/reagent_containers/food/snacks/doughslice
	slices_num = 3
	center_of_mass = list("x"=16, "y"=16)
	preloaded_reagents = list("protein" = 1, "nutriment" = 3)
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/doughslice
	name = "dough slice"
	desc = "A building block of an impressive dish."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "doughslice"
	slice_path = /obj/item/reagent_containers/food/snacks/spagetti
	slices_num = 1
	bitesize = 2
	center_of_mass = list("x"=17, "y"=19)
	nutriment_desc = list("dough" = 1)
	nutriment_amt = 1
	matter = list(MATERIAL_BIOMATTER = 2)

/obj/item/reagent_containers/food/snacks/bun
	name = "bun"
	desc = "A base for any self-respecting burger."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "bun"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=12)
	nutriment_desc = list("bun" = 4)
	nutriment_amt = 4
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/bun/attackby(obj/item/W as obj, mob/user as mob)
	/*
	// Bun + meatball = burger
	if(istype(W,/obj/item/reagent_containers/food/snacks/meatball))
		new /obj/item/reagent_containers/food/snacks/monkeyburger(src)
		to_chat(user, "You make a burger.")
		qdel(W)
		qdel(src)
	*/
	// Bun + patty = hamburger
	if(istype(W,/obj/item/reagent_containers/food/snacks/patty))
		new /obj/item/reagent_containers/food/snacks/monkeyburger(src)
		to_chat(user, "You make a burger.")
		qdel(W)
		qdel(src)

	// Bun + sausage = hotdog
	else if(istype(W,/obj/item/reagent_containers/food/snacks/sausage))
		new /obj/item/reagent_containers/food/snacks/hotdog(src)
		to_chat(user, "You make a hotdog.")
		qdel(W)
		qdel(src)

// Burger + cheese wedge = cheeseburger
/obj/item/reagent_containers/food/snacks/monkeyburger/attackby(obj/item/reagent_containers/food/snacks/cheesewedge/W as obj, mob/user as mob)
	if(istype(W))// && !istype(src,/obj/item/reagent_containers/food/snacks/cheesewedge))
		new /obj/item/reagent_containers/food/snacks/cheeseburger(src)
		to_chat(user, "You make a cheeseburger.")
		qdel(W)
		qdel(src)
		return
	else
		..()

// Human Burger + cheese wedge = cheeseburger
/obj/item/reagent_containers/food/snacks/human/burger/attackby(obj/item/reagent_containers/food/snacks/cheesewedge/W as obj, mob/user as mob)
	if(istype(W))
		new /obj/item/reagent_containers/food/snacks/cheeseburger(src)
		to_chat(user, "You make a cheeseburger.")
		qdel(W)
		qdel(src)
		return
	else
		..()

/obj/item/reagent_containers/food/snacks/pancakes
	name = "pancakes"
	desc = "A stack of fluffy pancakes, topped with melting butter and syrup flowing down. A heavensent to pair with coffee in the morning, or bacon strips."
	icon_state = "pancakes"
	bitesize = 4
	nutriment_amt = 8
	trash = /obj/item/trash/plate
	center_of_mass = list("x"=21, "y"=12)
	nutriment_desc = list("moist and buttery pancakes" = 6, "sweet syrup" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/medialuna
	name = "croissant"
	desc = "A flakey, buttery pastry shaped like a crescent moon. Soft and fluffy on the inside, crunchy on the outside, makes a perfect pair with a good cup of espresso."
	icon_state = "medialuna"
	bitesize = 3
	nutriment_amt = 6
	nutriment_desc = list("crunchy pastry" = 5, "buttery goodness" = 5)

/obj/item/reagent_containers/food/snacks/taco
	name = "taco"
	desc = "Take a bite!"
	icon_state = "taco"
	bitesize = 3
	center_of_mass = list("x"=21, "y"=12)
	nutriment_desc = list("cheese" = 2, "taco shell" = 2)
	nutriment_amt = 4
	preloaded_reagents = list("protein" = 3)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 12)

/obj/item/reagent_containers/food/snacks/rawcutlet
	name = "raw cutlet"
	desc = "A thin piece of raw meat."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "rawcutlet"
	bitesize = 1
	center_of_mass = list("x"=17, "y"=20)
	preloaded_reagents = list("protein" = 1)
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/cutlet
	name = "cutlet"
	desc = "A tasty meat slice."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "cutlet"
	bitesize = 2
	center_of_mass = list("x"=17, "y"=20)
	preloaded_reagents = list("protein" = 3)
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/rawcutlet/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/material/kitchen/rollingpin))
		new /obj/item/reagent_containers/food/snacks/patty_raw(src)
		to_chat(user, "You pound the meat into a patty.") // You can finally pound your own meat.
		qdel(src)

/obj/item/reagent_containers/food/snacks/patty_raw
	name = "raw patty"
	desc = "A raw patty ready to be grilled into a juicy and delicious burger."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "patty_raw"
	bitesize = 3
	center_of_mass = list("x"=17, "y"=20)
	preloaded_reagents = list("protein" = 2)
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/patty
	name = "patty"
	desc = "A juicy cooked patty, ready to be slapped between two buns."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "patty"
	bitesize = 3
	center_of_mass = list("x"=17, "y"=20)
	preloaded_reagents = list("protein" = 3) // It's cooked
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/chickenbreast
	name = "poultry breast"
	desc = "The breast meat of an avian species, chicken or otherwise."
	icon_state = "chickenbreast"
	bitesize = 3
	preloaded_reagents = list("protein" = 2)
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/rawmeatball
	name = "raw meatball"
	desc = "A raw meatball."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "rawmeatball"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=15)
	preloaded_reagents = list("protein" = 2)
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/hotdog
	name = "hotdog"
	desc = "Unrelated to dogs, maybe."
	icon_state = "hotdog"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=17)
	preloaded_reagents = list("protein" = 6)
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/flatbread
	name = "flatbread"
	desc = "Bland but filling."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "flatbread"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=16)
	nutriment_desc = list("bread" = 3)
	nutriment_amt = 3
	matter = list(MATERIAL_BIOMATTER = 5)

// potato + knife = raw sticks
/obj/item/reagent_containers/food/snacks/grown/potato/attackby(obj/item/I, mob/user)
	if(QUALITY_CUTTING in I.tool_qualities)
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, QUALITY_CUTTING, FAILCHANCE_ZERO, required_stat = STAT_BIO))
			new /obj/item/reagent_containers/food/snacks/rawsticks(src)
			to_chat(user, "You cut the potato.")
			qdel(src)
	else
		..()

/obj/item/reagent_containers/food/snacks/rawsticks
	name = "raw potato sticks"
	desc = "Raw fries, not very tasty."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "rawsticks"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=12)
	nutriment_desc = list("raw potato" = 3)
	nutriment_amt = 3
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/liquidfood
	name = "\improper liquidfood ration"
	desc = "A prepackaged grey slurry of all the essential nutrients for a spacefarer on the go. Should this be crunchy?"
	icon_state = "liquidfood"
	trash = /obj/item/trash/liquidfood
	filling_color = "#A8A8A8"
	bitesize = 4
	center_of_mass = list("x"=16, "y"=15)
	nutriment_desc = list("chalk" = 6)
	nutriment_amt = 20
	preloaded_reagents = list("iron" = 3)
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/tastybread
	name = "bread tube"
	desc = "Bread in a tube. Chewy...and surprisingly tasty."
	icon_state = "tastybread"
	trash = /obj/item/trash/tastybread
	filling_color = "#A66829"
	bitesize = 2
	center_of_mass = list("x"=17, "y"=16)
	nutriment_desc = list("bread" = 2, "sweetness" = 3)
	nutriment_amt = 6
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/organ
	name = "organ"
	desc = "Technically qualifies as organic."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "appendix"
	filling_color = "#E00D34"
	bitesize = 3
	nutriment_amt = 5
	matter = list(MATERIAL_BIOMATTER = 15)

/obj/item/reagent_containers/food/snacks/candy_drop_blue
	name = "\improper red gum stick"
	desc = "A small slab of gum for chewing."
	icon_state = "gumdrop_blue"
	filling_color = "#FC44A0"
	bitesize = 1
	nutriment_desc = list("chalk" = 3, "sweetness" = 3)
	nutriment_amt = 0
	preloaded_reagents = list("gum drops" = 3)
	matter = list(MATERIAL_BIOMATTER = 2)

/obj/item/reagent_containers/food/snacks/candy_drop_red
	name = "\improper blue gum stick"
	desc = "A small slab of gum for chewing. Wait, they come in blue now?"
	icon_state = "gumdrop_red"
	filling_color = "#2B00FF"
	bitesize = 1
	nutriment_desc = list("chalk" = 3, "sweetness" = 3)
	nutriment_amt = 0
	preloaded_reagents = list("gum drops" = 5, "hacker" = 15)
	matter = list(MATERIAL_BIOMATTER = 12)

