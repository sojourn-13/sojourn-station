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
	var/food_quality = 1
	var/cooking_description_modifier
	var/sanity_gain = 0.2 //Per bite
	var/cooked = FALSE
	var/appraised = 0 //Has this piece of food been appraised? We can only do that once.
	var/chef_buff_type = 0 //What type of buff does this have to it?

	var/junk_food = FALSE //if TRUE, sanity gain per nutriment will be zero
	var/list/taste_tag = list()

/obj/item/reagent_containers/food/snacks/Initialize()
	. = ..()
	if(nutriment_amt)
		reagents.add_reagent("nutriment", nutriment_amt, nutriment_desc)

/obj/item/reagent_containers/food/snacks/proc/get_sanity_gain(mob/living/carbon/eater) //sanity_gain per bite
	var/current_nutriment = reagents.get_reagent_amount("nutriment")
	var/nutriment_percent = 0
	if(reagents.total_volume && current_nutriment)
		nutriment_percent = current_nutriment/reagents.total_volume
	var/nutriment_eaten = min(reagents.total_volume, bitesize) * nutriment_percent
	var/base_sanity_gain_per_bite = nutriment_eaten * sanity_gain
	var/message
	if(!iscarbon(eater))
		return  list(0, message)
	if(eater.nutrition > eater.max_nutrition*0.95)
		message = "You are satisfied and don't need to eat any more."
		return  list(0, SPAN_WARNING(message))
	if(!base_sanity_gain_per_bite)
		message = "This food does not help calm your nerves."
		return  list(0, SPAN_WARNING(message))
	var/sanity_gain_per_bite = base_sanity_gain_per_bite
	message = "This food helps you relax."
	if(cooked)
		sanity_gain_per_bite += base_sanity_gain_per_bite * 0.2
	if(junk_food || !cooked)
		message += " However, only healthy food will help you rest."
		return  list(sanity_gain_per_bite, SPAN_NOTICE(message))
	var/table = FALSE
	var/companions = FALSE
	var/view_death = FALSE
	for(var/carbon in circleview(eater, 3))
		if(istype(carbon, /obj/structure/table))
			if(!in_range(carbon, eater) || table)
				continue
			table = TRUE
			message += " Eating is more comfortable using a table."
			sanity_gain_per_bite += base_sanity_gain_per_bite * 0.1

		else if(ishuman(carbon))
			var/mob/living/carbon/human/human = carbon
			if(human == eater)
				continue
			if(is_dead(human))
				view_death = TRUE
			companions = TRUE
	if(companions)
		sanity_gain_per_bite += base_sanity_gain_per_bite * 0.3
		message += " The food tastes much better in the company of others."
		if(view_death && !eater.stats.getPerk(PERK_NIHILIST))
			message = "Your gaze falls on the cadaver. Your food doesn't taste so good anymore."
			sanity_gain_per_bite = 0
			return list(sanity_gain_per_bite, SPAN_WARNING(message))

	return list(sanity_gain_per_bite, SPAN_NOTICE(message))

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

/obj/item/reagent_containers/food/snacks/attack(mob/mob as mob, mob/user as mob, def_zone)
	if(!reagents.total_volume)
		to_chat(user, SPAN_DANGER("None of [src] left!"))
		user.drop_from_inventory(src)
		qdel(src)
		return 0

	if(iscarbon(mob))
		//TODO: replace with standard_feed_mob() call.
		var/mob/living/carbon/carbon = mob
		var/mob/living/carbon/human/human = mob
		var/fullness_modifier = 1
		if(istype(human))
			fullness_modifier = 100 / human.get_organ_efficiency(OP_STOMACH)
		var/fullness = (carbon.nutrition + (carbon.reagents.get_reagent_amount("nutriment") * 25)) * fullness_modifier
		if(carbon == user)								//If you're eating it yourself
			if(istype(human))
				var/obj/item/blocked = human.check_mouth_coverage()
				if(blocked)
					to_chat(user, SPAN_WARNING("\The [blocked] is in the way!"))
					return

			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //puts a limit on how fast people can eat/drink things
			if (fullness <= 50)
				to_chat(carbon, SPAN_DANGER("You hungrily devour a piece of [src]."))
			if (fullness > 50 && fullness <= 150)
				to_chat(carbon, SPAN_NOTICE("You hungrily begin to eat [src]."))
			if (fullness > 150 && fullness <= 350)
				to_chat(carbon, SPAN_NOTICE("You take a bite of [src]."))
			if (fullness > 350 && fullness <= 550)
				to_chat(carbon, SPAN_NOTICE("You unwillingly chew a bit of [src]."))
			if (fullness > 550)
				to_chat(carbon, SPAN_DANGER("You cannot force any more of [src] to go down your throat."))
				return 0
		else
			if(!mob.can_force_feed(user, src))
				return

			if (fullness <= 550)
				user.visible_message(SPAN_DANGER("[user] attempts to feed [mob] [src]."))
			else
				user.visible_message(SPAN_DANGER("[user] cannot force anymore of [src] down [mob]'s throat."))
				return 0

			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			if(!do_mob(user, mob)) return

			mob.attack_log += text("\[[time_stamp()]\] <font color='orange'>Has been fed [src.name] by [user.name] ([user.ckey]) Reagents: [reagents.log_list()]</font>")
			user.attack_log += text("\[[time_stamp()]\] <font color='red'>Fed [src.name] by [mob.name] ([mob.ckey]) Reagents: [reagents.log_list()]</font>")
			msg_admin_attack("[key_name(user)] fed [key_name(mob)] with [src.name] Reagents: [reagents.log_list()] (INTENT: [uppertext(user.a_intent)])")

			user.visible_message(SPAN_DANGER("[user] feeds [mob] [src]."))

		if(reagents)	//Handle ingestion of the reagent.
			playsound(mob.loc,pick(mob.eat_sounds), rand(10,50), 1)
			if(reagents.total_volume)
				var/amount_eaten = min(reagents.total_volume, bitesize)
				reagents.trans_to_mob(mob, amount_eaten, CHEM_INGEST)
				if(istype(human))
					human.sanity.onEat(src, amount_eaten)
				bitecount++
				On_Consume(mob, user)
			return 1

	else if (isanimal(mob))
		var/mob/living/simple_animal/SA = mob
		SA.scan_interval = SA.min_scan_interval//Feeding an animal will make it suddenly care about food

		var/m_bitesize = bitesize * SA.bite_factor//Modified bitesize based on creature size
		var/amount_eaten = m_bitesize

		if(reagents && SA.reagents)
			m_bitesize = min(m_bitesize, reagents.total_volume)
			//If the creature can't even stomach half a bite, then it eats nothing
			//if (!SA.eat_from_hand)
			//	to_chat(user, SPAN_WARNING("[mob] doesn't accept hand-feeding."))
			//	return 0
			if (!SA.can_eat() || ((user.reagents.maximum_volume - user.reagents.total_volume) < m_bitesize * 0.5))
				amount_eaten = 0
			else
				amount_eaten = reagents.trans_to_mob(SA, m_bitesize, CHEM_INGEST)
		else
			return 0//The target creature can't eat

		if (amount_eaten)
			playsound(mob.loc,pick(mob.eat_sounds), rand(10,30), 1)
			bitecount++
			if (amount_eaten >= m_bitesize)
				user.visible_message(SPAN_NOTICE("[user] feeds [src] to [mob]."))
			else
				user.visible_message(SPAN_NOTICE("[user] feeds [mob] a tiny bit of [src]. <b>It looks full.</b>"))
				if (!istype(mob.loc, /turf))
					to_chat(mob, SPAN_NOTICE("[user] feeds you a tiny bit of [src]. <b>You feel pretty full!</b>"))
			On_Consume(mob, user)
			return 1
		else
			to_chat(user, SPAN_WARNING("[mob.name] can't stomach anymore food!"))

	return 0


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
				if(istype(slice, /obj/item/reagent_containers/food/snacks))
					slice?:food_quality = src.food_quality
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
/obj/item/reagent_containers/food/snacks/attack_generic(mob/user, damage, attack_message, damagetype = BRUTE, attack_flag = ARMOR_MELEE, sharp = FALSE, edge = FALSE)
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

/obj/item/reagent_containers/food/snacks/sliceable/get_item_cost(export)
	. = ..() + SStrade.get_import_cost(slice_path) * slices_num

/obj/item/pizzabox/get_item_cost() //Lets not make a loops
	. = pizza?.get_item_cost()

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
	taste_tag = list(VEGAN_FOOD)
	trash = /obj/item/trash/snack_bowl
	filling_color = "#468C00"
	center_of_mass = list("x"=17, "y"=11)
	nutriment_amt = 8
	nutriment_desc = list("apples" = 3,"salad" = 5)
	preloaded_reagents = list("doctorsdelight" = 8, "tricordrazine" = 8)
	matter = list(MATERIAL_BIOMATTER = 13)
	bitesize = 3
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/cookie
	name = "cookie"
	desc = "COOKIE!!!"
	icon_state = "COOKIE!!!"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	filling_color = "#DBC94F"
	bitesize = 1
	center_of_mass = list("x"=17, "y"=18)
	nutriment_amt = 1
	nutriment_desc = list("sweetness" = 3, "cookie" = 2)
	preloaded_reagents = list("preservatives" = 1)

/obj/item/reagent_containers/food/snacks/chocolateegg
	name = "chocolate egg"
	desc = "Such sweet, fattening food."
	icon_state = "chocolateegg"
	taste_tag = list(COCO_FOOD, SWEET_FOOD)
	filling_color = "#7D5F46"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	nutriment_amt = 1
	nutriment_desc = list("chocolate" = 5)
	preloaded_reagents = list("sugar" = 2, "coco" = 2, "preservatives" = 2)

/obj/item/reagent_containers/food/snacks/chocolatecoin
	name = "chocolate coin"
	desc = "Chocolate pressed into a coin shape, could pass for a coin if wrapped in gold foil."
	icon_state = "chococoin-wrapped"
	taste_tag = list(COCO_FOOD, SWEET_FOOD)
	filling_color = "#7D5F46"
	bitesize = 1
	center_of_mass = list("x"=15, "y"=15)
	nutriment_amt = 1
	nutriment_desc = list("chocolate" = 5)
	preloaded_reagents = list("sugar" = 2, "coco" = 2, "preservatives" = 2)
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

/obj/item/reagent_containers/food/snacks/friedegg
	name = "fried egg"
	desc = "A fried egg, with a touch of salt and pepper."
	icon_state = "friedegg"
	taste_tag = list(UMAMI_FOOD, SALTY_FOOD)
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
	taste_tag = list(UMAMI_FOOD)
	filling_color = "#FFFFFF"
	preloaded_reagents = list("protein" = 2)
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/food/snacks/tofu
	name = "tofu"
	icon_state = "tofu"
	desc = "We all love tofu."
	taste_tag = list(BLAND_FOOD)
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
	taste_tag = list(UMAMI_FOOD, SPICY_FOOD)
	preloaded_reagents = list("stoxin" = 3)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 20)

/obj/item/reagent_containers/food/snacks/stuffing
	name = "stuffing"
	desc = "Moist, peppery breadcrumbs for filling the body cavities of dead birds. Dig in!"
	icon_state = "stuffing"
	taste_tag = list(SPICY_FOOD, FLOURY_FOOD)
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
	taste_tag = list(MEAT_FOOD)
	filling_color = "#FFDEFE"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("protein" = 8)
	matter = list(MATERIAL_BIOMATTER = 8)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/sashimi
	name = "sashimi"
	desc = "Raw cuts of carp fillet with a side of soy sauce, apparently an eastern earth delicacy."
	icon_state = "sashimi"
	taste_tag = list(MEAT_FOOD)
	trash = /obj/item/trash/grease
	bitesize = 2
	nutriment_amt = 4
	preloaded_reagents = list("protein" = 4)
	nutriment_desc = list("raw fish" = 2, "soy sauce" = 2)

/obj/item/reagent_containers/food/snacks/hugemushroomslice
	name = "huge mushroom slice"
	desc = "A slice from a huge mushroom."
	icon_state = "hugemushroomslice"
	taste_tag = list(UMAMI_FOOD)
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
	taste_tag = list(UMAMI_FOOD)
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
	taste_tag = list(MEAT_FOOD)
	filling_color = "#DB0000"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=16)
	preloaded_reagents = list("protein" = 3)
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/sausage
	name = "sausage"
	desc = "A piece of mixed, long meat."
	icon_state = "sausage"
	taste_tag = list(MEAT_FOOD)
	filling_color = "#DB0000"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=16)
	preloaded_reagents = list("protein" = 6)
	matter = list(MATERIAL_BIOMATTER = 7)

/obj/item/reagent_containers/food/snacks/omelette
	name = "omelette du fromage"
	desc = "That's all you can say!"
	taste_tag = list(CHEESE_FOOD, UMAMI_FOOD)
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
	taste_tag = list(FLOURY_FOOD, SWEET_FOOD)
	filling_color = "#E0CF9B"
	bitesize = 2
	center_of_mass = list("x"=17, "y"=4)
	nutriment_desc = list("sweetness" = 3, "muffin" = 3)
	nutriment_amt = 6
	matter = list(MATERIAL_BIOMATTER = 5)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/waffles
	name = "waffles"
	desc = "Mmm, waffles"
	icon_state = "waffles"
	taste_tag = list(FLOURY_FOOD)
	trash = /obj/item/trash/waffles
	filling_color = "#E6DEB5"
	center_of_mass = list("x"=15, "y"=11)
	nutriment_desc = list("waffle" = 8)
	nutriment_amt = 8
	bitesize = 2
	matter = list(MATERIAL_BIOMATTER = 6)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/frenchtoast
	name = "french toast"
	desc =  "A slice of bread soaked in a beaten egg mixture. Tastes like home"
	icon_state = "frenchtoast"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#fab82a"
	nutriment_desc = list("sweetness" = 4, "egg" = 3, "home" = 1)
	nutriment_amt = 8
	bitesize = 3
	matter = list(MATERIAL_BIOMATTER = 7)

/obj/item/reagent_containers/food/snacks/eggplantparm
	name = "eggplant parmigiana"
	desc = "The only good recipe for eggplant."
	icon_state = "eggplantparm"
	taste_tag = list(UMAMI_FOOD)
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
	taste_tag = list(MEAT_FOOD)
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
	taste_tag = list(VEGAN_FOOD)
	trash = /obj/item/trash/waffles
	filling_color = "#E6FA61"
	bitesize = 2
	center_of_mass = list("x"=15, "y"=11)
	nutriment_desc = list("some sort of protein" = 10) //seasoned VERY well.
	nutriment_amt = 10
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 10)


/obj/item/reagent_containers/food/snacks/wingfangchu
	name = "wing fang chu"
	desc = "A savory dish of alien wing wang in soy."
	icon_state = "wingfangchu"
	taste_tag = list(MEAT_FOOD, SALTY_FOOD)
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
	taste_tag = list(MEAT_FOOD)
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
	taste_tag = list(MEAT_FOOD)
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
	taste_tag = list(VEGAN_FOOD)
	trash = /obj/item/stack/rods
	filling_color = "#FFFEE0"
	bitesize = 2
	center_of_mass = list("x"=17, "y"=15)
	nutriment_desc = list("tofu" = 3, "metal" = 1)
	nutriment_amt = 8
	matter = list(MATERIAL_BIOMATTER = 12)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/popcorn
	name = "popcorn"
	desc = "Now let's find some cinema."
	icon_state = "popcorn"
	taste_tag = list(SALTY_FOOD)
	trash = /obj/item/trash/popcorn
	var/unpopped = 0
	filling_color = "#FFFAD4"
	center_of_mass = list("x"=16, "y"=8)
	nutriment_desc = list("popcorn" = 3)
	nutriment_amt = 2
	matter = list(MATERIAL_BIOMATTER = 2)
	bitesize = 0.1 //this snack is supposed to be eating during looooong time. And this it not dinner food! --rastaf0

/obj/item/reagent_containers/food/snacks/popcorn/Initialize(mapload)
	. = ..()
	unpopped = rand(1,10)

/obj/item/reagent_containers/food/snacks/popcorn/On_Consume()
	if(prob(unpopped))	//lol ...what's the point?
		to_chat(usr, SPAN_WARNING("You bite down on an un-popped kernel!"))
		unpopped = max(0, unpopped-1)
	..()

/obj/item/reagent_containers/food/snacks/loadedbakedpotato
	name = "loaded baked potato"
	desc = "Totally baked."
	taste_tag = list(UMAMI_FOOD)
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
	name = "fries"
	desc = "The golden standard in side dishes"
	icon_state = "fries"
	taste_tag = list(VEGAN_FOOD)
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
	taste_tag = list(BLAND_FOOD)
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
	taste_tag = list(BLAND_FOOD)
	filling_color = "#EDDD00"
	bitesize = 1
	center_of_mass = list("x"=16, "y"=16)
	nutriment_desc = list("noodles" = 2)
	nutriment_amt = 1
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/cheesyfries
	name = "cheesy fries"
	desc = "Fries sticking in gooey melted cheese"
	icon_state = "cheesyfries"
	taste_tag = list(CHEESE_FOOD, VEGETARIAN_FOOD)
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
	taste_tag = list(FLOURY_FOOD)
	filling_color = "#E8E79E"
	bitesize = 2
	center_of_mass = list("x"=15, "y"=14)
	nutriment_desc = list("fortune cookie" = 2)
	nutriment_amt = 3

/obj/item/reagent_containers/food/snacks/badrecipe
	name = "burned mess"
	desc = "Someone should be demoted from chef for this."
	icon_state = "badrecipe"
	taste_tag = list(BLAND_FOOD)
	filling_color = "#211F02"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=12)
	preloaded_reagents = list("toxin" = 1, "carbon" = 3)

/obj/item/reagent_containers/food/snacks/meatsteak
	name = "meat steak"
	desc = "A piece of hot meat, lightly seasoned with salt and pepper."
	icon_state = "meatsteak"
	taste_tag = list(MEAT_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#7A3D11"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("protein" = 9, "sodiumchloride" = 1, "blackpepper" = 1)
	matter = list(MATERIAL_BIOMATTER = 11)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/chickensteak
	name = "chicken steak"
	desc = "Poultry breasts, cooked juicy and tender, lightly seasoned with salt and pepper." // Don't ask how they get grill marks on a microwave tho - Seb
	icon_state = "chickenbreast_cooked"
	taste_tag = list(MEAT_FOOD, SALTY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#7A3D11"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("protein" = 8, "sodiumchloride" = 1, "blackpepper" = 1)
	nutriment_desc = list("juicy poultry" = 10, "salt" = 2, "pepper" = 2)
	matter = list(MATERIAL_BIOMATTER = 11)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/roastchicken
	name = "chicken roast"
	desc = "A wonderful roast of an entire poultry. While you can't tell if it's exactly chicken, it certainlly will end up tasting like it."
	icon_state = "chimken"
	taste_tag = list(MEAT_FOOD)
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
	taste_tag = list(MEAT_FOOD, SPICY_FOOD)
	bitesize = 3
	preloaded_reagents = list("protein" = 8, "cornoil" = 5)
	nutriment_desc = list("fried poultry" = 10, "spicy fried batter" = 3)
	matter = list(MATERIAL_BIOMATTER = 11)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/bacon
	name = "fried bacon" // Now has a raw state.
	desc = "When it comes to bacon, always be prepared." // Time to find 38 spots on the colony to hide it
	icon = 'icons/obj/food_ingredients.dmi' // Refactored into here for consistency.
	taste_tag = list(MEAT_FOOD, SALTY_FOOD)
	icon_state = "bacon"
	bitesize = 2
	preloaded_reagents = list("protein" = 3, "cornoil" = 5)
	nutriment_desc = list("artery clogging freedom" = 10, "bacon fat" = 3)

/obj/item/reagent_containers/food/snacks/porkchops
	name = "glazed pork chops"
	desc = "Perfectly grilled pork chops that are still a shade of pink on the inside, slathered generously with barbecue sauce."
	icon_state = "porkchop"
	taste_tag = list(MEAT_FOOD)
	bitesize = 3
	trash = /obj/item/trash/plate
	filling_color = "#7A3D11"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("protein" = 8, "sodiumchloride" = 1, "blackpepper" = 1, "bbqsauce" = 5)
	matter = list(MATERIAL_BIOMATTER = 11)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/baconeggs
	name = "eggs and bacon"
	desc = "A classic breakfast combo of fried, sunny-side eggs, with bacon strips on the side." // Wakey wakey.
	icon_state = "baconegg"
	taste_tag = list(SALTY_FOOD)
	bitesize = 4
	preloaded_reagents = list("protein" = 6, "cornoil" = 3)
	nutriment_desc = list("bacon" = 5, "fried eggs" = 5)

/obj/item/reagent_containers/food/snacks/benedict
	name = "eggs benedict"
	desc = "A perfectly poached runny egg sitting atop a bedding of Nadezhdian bacon and muffin, with hollandaise sauce generously spread on top. The best breakfast you'll ever have."
	icon_state = "benedict"
	taste_tag = list(SALTY_FOOD, SPICY_FOOD)
	bitesize = 5
	preloaded_reagents = list("protein" = 15, "sodiumchloride" = 1, "blackpepper" = 1)
	nutriment_desc = list("ham" = 5, "poached egg" = 5, "hollandaise sauce" = 3)

/obj/item/reagent_containers/food/snacks/tonkatsu
	name = "tonkatsu"
	desc = "Salted cutlets covered in breadcrumbs and deep fried, presented into thick slices. Crispy outside, juicy and tender inside."
	icon_state = "katsu"
	taste_tag = list(MEAT_FOOD)
	bitesize = 2
	preloaded_reagents = list("protein" = 10, "sodiumchloride" = 1)
	nutriment_desc = list("fried pork" = 5, "panko breadcrumb" = 2)

/obj/item/reagent_containers/food/snacks/spacylibertyduff
	name = "spacy liberty duff"
	desc = "Jello gelatin, from Alfred Hubbard's cookbook"
	icon_state = "spacylibertyduff"
	taste_tag = list(UMAMI_FOOD, SWEET_FOOD)
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
	taste_tag = list(SWEET_FOOD, UMAMI_FOOD)
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
	taste_tag = list(FLOURY_FOOD)
	bitesize = 2
	filling_color = "#916E36"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("poppy seeds" = 2, "pretzel" = 3)
	nutriment_amt = 4 //As much as one slice of pizza
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/food/snacks/poppypretzel/holy
	name = "omni-poppy pretzel"
	desc = "A pretzal sprinkled with the seeds and spices of custom tailored plants grown by the church. Contains quite a few healing properties."
	bitesize = 3
	preloaded_reagents = list("bicaridine" = 6, "anti_toxin" = 6, "dexalinp" = 6, "dermaline" = 6, "laudanum" = 6)

/obj/item/reagent_containers/food/snacks/enchiladas
	name = "enchiladas"
	desc = "Viva La Mexico!"
	icon_state = "enchiladas"
	taste_tag = list(MEAT_FOOD, SPICY_FOOD)
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
	taste_tag = list(MEAT_FOOD)
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
	taste_tag = list(FLOURY_FOOD)
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
	taste_tag = list(MEAT_FOOD)
	filling_color = "#E3D796"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=16)
	nutriment_desc = list("salt" = 1, "chips" = 3)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 10)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/rofflewaffles
	name = "roffle waffles"
	desc = "Waffles from Roffle. Co."
	icon_state = "rofflewaffles"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/waffles
	filling_color = "#FF00F7"
	bitesize = 4
	center_of_mass = list("x"=15, "y"=11)
	nutriment_desc = list("waffle" = 7, "sweetness" = 1)
	nutriment_amt = 8
	preloaded_reagents = list("psilocybin" = 8)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/jelliedtoast
	name = "jellied toast"
	desc = "A slice of bread covered with delicious jam."
	icon_state = "jellytoast"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
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

/obj/item/reagent_containers/food/snacks/stewedsoymeat
	name = "stewed soy meat"
	desc = "Even non-vegetarians will LOVE this!"
	icon_state = "stewedsoymeat"
	taste_tag = list(SPICY_FOOD, VEGAN_FOOD)
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
	taste_tag = list(BLAND_FOOD)
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
	taste_tag = list(BLAND_FOOD)
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
	taste_tag = list(SWEET_FOOD)
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
	taste_tag = list(SPICY_FOOD, MEAT_FOOD)
	trash = /obj/item/trash/snack_bowl
	bitesize = 4
	preloaded_reagents = list("protein" = 8, "capsaicin" = 2)
	nutriment_desc = list("beef" = 5, "curry" = 5, "spicyness" = 2)

/obj/item/reagent_containers/food/snacks/chickencurry
	name = "poultry curry"
	desc = "A piping hot plate of spicy poultry curry atop fluffy, steamed white rice."
	icon_state = "chickencurry"
	taste_tag = list(MEAT_FOOD, SPICY_FOOD)
	trash = /obj/item/trash/snack_bowl
	bitesize = 4
	preloaded_reagents = list("protein" = 8, "capsaicin" = 2)
	nutriment_desc = list("chicken" = 5, "curry" = 5, "spicyness" = 2)

/obj/item/reagent_containers/food/snacks/mashpotatoes
	name = "mashed potatoes"
	desc = "Soft and fluffy mashed potatoes, the perfect side dish for a variety of meats."
	icon_state = "mashpotatoes"
	taste_tag = list(VEGETARIAN_FOOD)
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
	taste_tag = list(MEAT_FOOD)
	trash = /obj/item/trash/snack_bowl
	filling_color = "#FFFBDB"
	bitesize = 5
	nutriment_desc = list("a mother's cooking" = 10, "rice" = 5, "katsu sauce" = 2)
	nutriment_amt = 10
	preloaded_reagents = list("protein" = 12, "soysauce" =5, "egg" = 3)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 20)

/obj/item/reagent_containers/food/snacks/pastatomato
	name = "spaghetti"
	desc = "Spaghetti and crushed tomatoes. Just like your abusive father used to make!"
	icon_state = "pastatomato"
	taste_tag = list(FLOURY_FOOD, VEGAN_FOOD)
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
	taste_tag = list(MEAT_FOOD, FLOURY_FOOD)
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
	taste_tag = list(VEGAN_FOOD)
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

/obj/item/reagent_containers/food/snacks/candiedapple
	name = "candied apple"
	desc = "An apple coated in sugary sweetness."
	icon_state = "candiedapple"
	taste_tag = list(SWEET_FOOD)
	filling_color = "#F21873"
	bitesize = 3
	center_of_mass = list("x"=15, "y"=13)
	nutriment_desc = list("apple" = 3, "caramel" = 3, "sweetness" = 2)
	nutriment_amt = 3
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

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
	preloaded_reagents = list("mint" = 2, "preservatives" = 1)
	matter = list(MATERIAL_BIOMATTER = 2)

/obj/item/reagent_containers/food/snacks/plumphelmetbiscuit
	name = "plump helmet biscuit"
	desc = "This is a finely-prepared plump helmet biscuit. The ingredients are exceptionally minced plump helmet, and well-minced dwarven wheat flour."
	icon_state = "phelmbiscuit"
	taste_tag = list(FLOURY_FOOD, UMAMI_FOOD)
	filling_color = "#CFB4C4"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	nutriment_desc = list("mushroom" = 4)
	nutriment_amt = 5
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/food/snacks/plumphelmetbiscuit/Initialize(mapload)
	. = ..()
	if(prob(10))
		name = "exceptional plump helmet biscuit"
	//	desc = "Microwave is taken by a fey mood! It has cooked an exceptional plump helmet biscuit!"
		reagents.add_reagent("nutriment", 3)
		reagents.add_reagent("tricordrazine", 5)

/obj/item/reagent_containers/food/snacks/chawanmushi
	name = "chawanmushi"
	desc = "A legendary egg custard that makes friends out of enemies. Probably too hot for a cat to eat."
	icon_state = "chawanmushi"
	taste_tag = list(FLOURY_FOOD, UMAMI_FOOD)
	trash = /obj/item/trash/snack_bowl
	filling_color = "#F0F2E4"
	bitesize = 1
	center_of_mass = list("x"=17, "y"=10)
	preloaded_reagents = list("protein" = 5)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/tossedsalad
	name = "tossed salad"
	desc = "A proper salad, basic and simple, with little bits of carrot, tomato and apple intermingled. Vegan!"
	icon_state = "herbsalad"
	taste_tag = list(VEGAN_FOOD)
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
	taste_tag = list(VEGETARIAN_FOOD, MEAT_FOOD)
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
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
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
	desc = "A tasty dessert that is made with honey and cocoa powder for a delightful pudding." // IT'S CHOCOLATE NOT COCAINE! - Seb
	icon_state = "pudding"
	taste_tag = list(SWEET_FOOD)
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
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
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
	taste_tag = list(SWEET_FOOD)
	trash = /obj/item/trash/icecreambowl
	filling_color = "#FFFF00"
	center_of_mass = list("x"=16, "y"=18)
	nutriment_desc = list("cream" = 3, "honey" = 2)
	nutriment_amt = 12
	bitesize = 3
	preloaded_reagents = list("cream" = 5, "honey" = 5)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 12)

/////////////////////////////////////////////////Sliceable////////////////////////////////////////
// All the food items that can be sliced into smaller bits like Meatbread and Cheesewheels

// sliceable is just an organization type path, it doesn't have any additional code or variables tied to it.

/obj/item/reagent_containers/food/snacks/sliceable
	w_class = ITEM_SIZE_NORMAL //Whole pizzas and cakes shouldn't fit in a pocket, you can slice them if you want to do that.

/obj/item/reagent_containers/food/snacks/sliceable/tofubread
	name = "tofubread"
	icon_state = "Like meatbread but for vegetarians. Not guaranteed to give superpowers."
	icon_state = "tofubread"
	taste_tag = list(BLAND_FOOD, FLOURY_FOOD)
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
	taste_tag = list(BLAND_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#F7FFE0"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	nutriment_amt = 6
	nutriment_desc = list("tofu" = 2)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/icecream
	name = "icecream"
	desc = "A luxurious yet simple iced cream, the most refreshing dessert after a trip through the humid Amethian forest."
	icon_state = "vanillaicecream"
	taste_tag = list(SWEET_FOOD)
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
	taste_tag = list(SWEET_FOOD, COCO_FOOD)
	trash = /obj/item/trash/icecreambowl
	bitesize = 3
	nutriment_amt = 8
	nutriment_desc = list("velvety chocolate" = 10, "sweetness" = 5, "refreshing cold" = 5)
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/food/snacks/strawberryicecream
	name = "strawberry icecream"
	desc = "Classic strawberry flavored icecream, a delicious treat for ladies and lovers of berries all around the universe."
	icon_state = "strawberryicecream"
	taste_tag = list(SWEET_FOOD)
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

/obj/item/reagent_containers/food/snacks/chocolatepiece
	name = "chocolate piece"
	desc = "A luscious milk chocolate piece filled with gooey dulce de leche."
	icon_state =  "chocolatepiece"
	taste_tag = list(SWEET_FOOD, COCO_FOOD)
	filling_color = "#7D5F46"
	nutriment_amt = 1
	nutriment_desc = list("chocolate" = 3, "dulce de leche" = 2, "lusciousness" = 1)
	bitesize = 2
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/chocolatepiece/white
	name = "white chocolate piece"
	desc = "A creamy white chocolate piece drizzled in milk chocolate."
	icon_state = "chocolatepiece_white"
	taste_tag = list(SWEET_FOOD, COCO_FOOD)
	filling_color = "#E2DAD3"
	nutriment_desc = list("white chocolate" = 3, "creaminess" = 1)
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/chocolatepiece/truffle
	name = "chocolate truffle"
	desc = "A bite-sized milk chocolate truffle that could buy anyone's love."
	icon_state = "chocolatepiece_truffle"
	taste_tag = list(SWEET_FOOD, COCO_FOOD)
	nutriment_desc = list("chocolate" = 3, "undying devotion" = 3)
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/sliceable/cheesewheel
	name = "cheese wheel"
	desc = "A big wheel of delicious cheese."
	icon_state = "cheesewheel"
	taste_tag = list(CHEESE_FOOD)
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
	taste_tag = list(CHEESE_FOOD)
	filling_color = "#FFF700"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=10)
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/watermelonslice
	name = "watermelon slice"
	desc = "A slice of watery goodness."
	icon_state = "watermelonslice"
	taste_tag = list(SWEET_FOOD)
	filling_color = "#FF3867"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=10)
	preloaded_reagents = list("watermelonjuice" = 1)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/cracker
	name = "cracker"
	desc = "It's a salted cracker."
	icon_state = "cracker"
	taste_tag = list(FLOURY_FOOD, SALTY_FOOD)
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
	taste_tag = list(FLOURY_FOOD)
	bitesize = 3
	nutriment_amt = 6
	nutriment_desc = list("cinnamon" = 10, "buttery goodness" = 5, "cream cheese" = 3)
	preloaded_reagents = list("cinnamonpowder" = 5, "sugar" = 10)


///////////////////////////////////////////
// new old food stuff from bs12
///////////////////////////////////////////
/obj/item/reagent_containers/food/snacks/dough
	name = "dough"
	desc = "A piece of dough."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "dough"
	taste_tag = list(BLAND_FOOD)
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

// Dough slice + rolling pin = flat dough slice
/obj/item/reagent_containers/food/snacks/doughslice/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/material/kitchen/rollingpin))
		new /obj/item/reagent_containers/food/snacks/flatdoughslice(src)
		to_chat(user, "You flatten the dough slice.")
		qdel(src)

// slicable into 3xdoughslices
/obj/item/reagent_containers/food/snacks/sliceable/flatdough
	name = "flat dough"
	desc = "A flattened dough."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "flat dough"
	taste_tag = list(BLAND_FOOD)
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
	taste_tag = list(BLAND_FOOD)
	slice_path = /obj/item/reagent_containers/food/snacks/spagetti
	slices_num = 1
	bitesize = 2
	center_of_mass = list("x"=17, "y"=19)
	nutriment_desc = list("dough" = 1)
	nutriment_amt = 1
	matter = list(MATERIAL_BIOMATTER = 2)

/obj/item/reagent_containers/food/snacks/flatdoughslice
	name = "flat dough slice"
	desc = "A flattened building block of an impressive dish."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "flatdoughslice"
	taste_tag = list(BLAND_FOOD)
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
	taste_tag = list(FLOURY_FOOD)
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
	taste_tag = list(FLOURY_FOOD, SWEET_FOOD)
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

/obj/item/reagent_containers/food/snacks/tortilla
	name = "tortilla"
	desc = "The foldable possiblites are endless, as long as it's less than seven folds."
	icon_state = "tortilla"
	taste_tag = list(VEGAN_FOOD)
	bitesize = 2
	center_of_mass = list("x"=21, "y"=12)
	nutriment_desc = list("taco shell" = 2)
	nutriment_amt = 2
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/taco
	name = "taco"
	desc = "Take a bite!"
	icon_state = "taco"
	taste_tag = list(MEAT_FOOD)
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
	taste_tag = list(MEAT_FOOD)
	bitesize = 1
	center_of_mass = list("x"=17, "y"=20)
	preloaded_reagents = list("protein" = 1)
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/cutlet
	name = "cutlet"
	desc = "A tasty meat slice."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "cutlet"
	taste_tag = list(MEAT_FOOD)
	bitesize = 2
	center_of_mass = list("x"=17, "y"=20)
	preloaded_reagents = list("protein" = 3)
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/rawcutlet/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/material/kitchen/rollingpin))
		new /obj/item/reagent_containers/food/snacks/patty_raw(src)
		to_chat(user, "You pound the meat into a patty.") // You can finally pound your own meat.
		qdel(src)

/obj/item/reagent_containers/food/snacks/rawbacon
	name = "raw bacon strip"
	desc = "Tasty strips of raw porcine back meat. Uncured, unsalted, and ready to be turned into delicious bacon."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "rawbacon"
	taste_tag = list(MEAT_FOOD)
	bitesize = 2
	preloaded_reagents = list("protein" = 2)
	matter = list(MATERIAL_BIOMATTER = 2)

/obj/item/reagent_containers/food/snacks/patty_raw
	name = "raw patty"
	desc = "A raw patty ready to be grilled into a juicy and delicious burger."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "patty_raw"
	taste_tag = list(MEAT_FOOD)
	bitesize = 3
	center_of_mass = list("x"=17, "y"=20)
	preloaded_reagents = list("protein" = 2)
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/patty
	name = "patty"
	desc = "A juicy cooked patty, ready to be slapped between two buns."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "patty"
	taste_tag = list(MEAT_FOOD)
	bitesize = 3
	center_of_mass = list("x"=17, "y"=20)
	preloaded_reagents = list("protein" = 3) // It's cooked
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/chickenbreast
	name = "poultry breast"
	desc = "The breast meat of an avian species, chicken or otherwise."
	icon_state = "chickenbreast"
	taste_tag = list(MEAT_FOOD)
	bitesize = 3
	preloaded_reagents = list("protein" = 2)
	matter = list(MATERIAL_BIOMATTER = 3)

/obj/item/reagent_containers/food/snacks/rawmeatball
	name = "raw meatball"
	desc = "A raw meatball."
	taste_tag = list(MEAT_FOOD)
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "rawmeatball"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=15)
	preloaded_reagents = list("protein" = 2)
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/hotdog
	name = "hotdog"
	desc = "Unrelated to dogs, maybe."
	taste_tag = list(MEAT_FOOD)
	icon_state = "hotdog"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=17)
	preloaded_reagents = list("protein" = 6)
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/flatbread
	name = "flatbread"
	desc = "Bland but filling."
	taste_tag = list(FLOURY_FOOD)
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
	taste_tag = list(VEGAN_FOOD)
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "rawsticks"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=12)
	nutriment_desc = list("raw potato" = 3)
	nutriment_amt = 3
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/organ
	name = "organ"
	desc = "Technically qualifies as organic."
	icon = 'icons/obj/surgery.dmi'
	taste_tag = list(MEAT_FOOD)
	icon_state = "appendix"
	filling_color = "#E00D34"
	bitesize = 3
	nutriment_amt = 5
	matter = list(MATERIAL_BIOMATTER = 15)

//Tisanes

/obj/item/reagent_containers/food/snacks/poppy_tisane
	name = "poppy flower tisane"
	desc = "A somewhat concentrated decoction of poppy flower. Not entirely pleasant tasting, but it is more effective at aiding the healing of trauma than simply eating raw poppyflower."
	icon_state = "poppy_tisane"
	taste_tag = list(TASTE_BITTER)
	nutriment_desc = list("bitter tea" = 1)
	nutriment_amt = 1 //a lil bit from the leaves and plant solids.
	bitesize = 5
	preloaded_reagents = list("p_tea" = 10, "water" = 10)
	matter = list(MATERIAL_BIOMATTER = 5)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/tear_tisane
	name = "sun tear tisane"
	desc = "A somewhat concentrated decoction of sun tears. A pleasantly sweet tea, it does a better job at aiding the healing of burns than simply chewing the tears raw."
	icon_state = "tear_tisane"
	taste_tag = list(TASTE_SWEET)
	nutriment_desc = list("honeyed tea" = 1)
	nutriment_amt = 3 //honey
	bitesize = 5
	preloaded_reagents = list("st_tea" = 10, "water" = 10)
	matter = list(MATERIAL_BIOMATTER = 5)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/mercy_tisane
	name = "mercys hand tisane"
	desc = "A somewhat concentrated decoction of mercy hand. Not entirely pleasant tasting, but it does a better job of purging toxins than eating mercy hand raw."
	icon_state = "mercy_tisane"
	taste_tag = list(TASTE_LIGHT)
	nutriment_desc = list("tart tea" = 1)
	nutriment_amt = 1
	bitesize = 5
	preloaded_reagents = list("mh_tea" = 10, "water" = 10)
	matter = list(MATERIAL_BIOMATTER = 5)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/vale_tisane
	name = "vale bush tisane"
	desc = "A somewhat concentrated decoction of poppy flower. Not entirely pleasant tasting, and it leaves your mouth tingling. Still, it functions as a more effective analgesic and vasodilator than simply chewing the tears themselves."
	icon_state = "vale_tisane"
	taste_tag = list(TASTE_SOUR)
	nutriment_desc = list("acetic tea" = 1)
	nutriment_amt = 1
	bitesize = 5
	preloaded_reagents = list("vb_tea" = 10, "water" = 10)
	matter = list(MATERIAL_BIOMATTER = 5)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/helmet_tisane
	name = "plump helmet tisane"
	desc = "A somewhat concentrated decoction of poppy flower. Horribly bitter, but if you can choke back the tea you'll find that it's a far more effective antibiotic than raw plump helmets."
	icon_state = "helmet_tisane"
	taste_tag = list(TASTE_BITTER)
	nutriment_desc = list("bitter tea" = 1)
	nutriment_amt = 1
	bitesize = 5
	preloaded_reagents = list("ph_tea" = 10, "water" = 10)
	matter = list(MATERIAL_BIOMATTER = 5)
	cooked = TRUE
