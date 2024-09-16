#define BASE_REGEN -2
#define MAX_STOMACH_CONTENTS 10
#define DISTENDED_STOMACH_CONTENTS 8

//R&D meat weakling
/mob/living/carbon/superior_animal/genetics/fratellis
	name = "fratellis"
	desc = "A beast tortured by its own immortality. It hungers, but cannot be sated. It bleeds, but cannot run dry."
	icon = 'icons/mob/genetics/fratellis.dmi'
	icon_state = "fratellis_0"
	icon_dead = "fratellis_6"
	faction = "neutral"
	speak_emote = list("pants","warbles somberly")
	emote_see = list("wheezes.","snuffles.","attempts to stand, but fails to.")
	speak_chance = 1
	move_to_delay = 1000 //SLOOOOOOOOW
	pass_flags = PASSTABLE
	wander = FALSE
	stop_automated_movement_when_pulled = TRUE
	colony_friend = TRUE
	friendly_to_colony = TRUE
	obey_friends = FALSE

	//Big chungus
	maxHealth = 1200
	health = 1200
	pixel_x = -16

	//meat_type = /obj/item/reagent_containers/food/snacks/meat
	attack_sound = 'sound/xenomorph/alien_bite1.ogg'

	var/list/potential_mutations = list(
		MUTATION_HYPERION = 10
	)

	var/stomach_retracted = FALSE

	var/stomach_open = FALSE

	var/gnawing_state = 0 //How willing the fratellis is to eat itself

	var/self_cannibalism = 0

	var/hunger = 0

	var/mutation_display = FALSE
	var/mutation_display_time = 10 SECONDS
	var/mutation_display_start =  null

	var/list/stomach_contents = list()

	var/digestion_progress = 0
	var/obj/item/reagent_containers/food/snacks/digestion_target

//Strictly speaking, we can and often do force_feed the Fratellis food in order to regenerate it.
//However, this proc is set so we can override the Snack's attack script with our own feeding prompt.
/mob/living/carbon/superior_animal/genetics/fratellis/can_force_feed()
	return FALSE

//Cannot be gibbed, but will have a huge shower of blood!
/mob/living/carbon/superior_animal/genetics/fratellis/gib()
	var/on_turf = istype(loc, /turf)
	if(on_turf)
		src.visible_message("<span class='danger'>The stomach of \the [src] explodes in a shower of gore!</span>")
		for(var/obj/item/content in stomach_contents)
			content.loc=src.loc
			content.throw_at(get_edge_target_turf(src,pick(alldirs)),rand(1,5),30)
		stomach_contents = list()
		new /obj/effect/gibspawner(src.loc)
	stomach_open = TRUE
	stomach_retracted = FALSE
	return FALSE

//Cannot be dusted
/mob/living/carbon/superior_animal/genetics/fratellis/dust()
	return FALSE

/mob/living/carbon/superior_animal/genetics/fratellis/Life()

	//Handle Regeneration (Works while dead)
	if(health < (maxHealth-4))
		var/hunger_factor = 10
		switch(hunger)
			if(0 to 100)
				hunger_factor = 40
			if(101 to 250)
				hunger_factor = 30
			if(251 to 500)
				hunger_factor = 20
			if(501 to 750)
				hunger_factor = 15
			if(751 to 1000)
				hunger_factor = 10
			if(1001 to 1500)
				hunger_factor = 5
			else
				hunger_factor = 1

		var/regen_amount = BASE_REGEN * hunger_factor //Well fed Fratellis eat more food.
		hunger += (5*hunger_factor) //More Healing means More Hungies

		if(getBruteLoss())
			adjustBruteLoss(regen_amount)
		else if(getFireLoss())
			adjustFireLoss(regen_amount)
		else if(getOxyLoss())
			adjustOxyLoss(regen_amount)
		else if(getToxLoss())
			adjustToxLoss(regen_amount)
		else if(getCloneLoss())
			adjustCloneLoss(regen_amount)
		else if(getHalLoss())
			adjustHalLoss(regen_amount)
		updatehealth()
		if(health > 1 && stat == DEAD)
			rise_again()

	//Handle the typical mob processing
	. = ..()
	if(!.)
		return

	//Calculate hunger gain
	//Fratellis gains less hunger, the more hungry it is.
	if(prob(20))
		switch(hunger)
			if(0 to 1000)
				hunger+=10
			if(1001 to 2000)
				hunger+=5
			if(2001 to 3000)
				hunger+=2

	//Drip blood if stomach is open
	if(stomach_open)
		if(!stomach_retracted && prob(80))
			blood_splatter(src)
			adjustBruteLoss(50)
		else if(!stomach_retracted && prob(30))
			blood_splatter(src)
			adjustBruteLoss(20)

	//Handle theft
	var/steal_prob = 0
	switch(hunger)
		if(0 to 500)
			steal_prob = 0
		if(501 to 1000)
			steal_prob = 1
		if(1001 to 2000)
			steal_prob = 5
		else
			steal_prob = 10

	if(prob(steal_prob) && (stomach_contents.len < MAX_STOMACH_CONTENTS))
		src.steal_from_mob()

	//Handle Digestion
	if(!digestion_target && !self_cannibalism)
		if(digestion_progress > 10) //Only check for this so often
			digestion_progress = 0
			for(var/obj/item/reagent_containers/food/snacks/target in stomach_contents)
				digestion_target = target
				stomach_contents.Remove(target)
				if(istype(digestion_target, /obj/item/reagent_containers/food/snacks/meat) && !gnawing_state && (hunger > 500))
					var/obj/item/reagent_containers/food/snacks/meat/ourMeat = digestion_target
					if(ispath(ourMeat.source_mob, /mob/living/carbon/superior_animal/genetics/fratellis))
						gnawing_state = 1
				break
			if(!digestion_target && gnawing_state)
				var/mutation_chance = 0
				if(gnawing_state == 1 && (hunger > 1000))
					self_cannibalism = TRUE
					mutation_chance = 10
				if(gnawing_state == 2 && (hunger > 500))
					self_cannibalism = TRUE
					mutation_chance = 50
				if(self_cannibalism)
					src.adjustBruteLoss(50)
					if(prob(mutation_chance))
						src.visible_message("<span class='danger'>\The [src] begins gnawing on its flank. The wound begins regenerating strangely!</span>")
						var/mut_length = inherent_mutations.len
						inherent_mutations |= pickweight(potential_mutations)
						if(mut_length != inherent_mutations.len)
							mutation_display_start = world.time
					else
						src.visible_message("<span class='danger'>\The [src] begins gnawing on its flank!</span>")
		else
			digestion_progress += 1
	//Digest a piece of food.
	else
		if(digestion_progress > 10)
			if(digestion_target)
				QDEL_NULL(digestion_target)
		else
			if(prob(30))
				digestion_progress += 1
			hunger = max((hunger - 25), 0)

	update_icon()



/mob/living/carbon/superior_animal/genetics/fratellis/update_icon()
	if(stat == DEAD)
		icon_state = "fratellis_6"
	else if(mutation_display_start + mutation_display_time < world.time)
		icon_state = "fratellis_tail"
	else if(health < maxHealth * 0.1)
		icon_state = "fratellis_5"
	else if(health < maxHealth * 0.3)
		icon_state = "fratellis_4"
	else if(health < maxHealth * 0.5)
		icon_state = "fratellis_3"
	else if(health < maxHealth * 0.7)
		icon_state = "fratellis_2"
	else if(health < maxHealth * 0.9)
		icon_state = "fratellis_1"
	else
		icon_state = "fratellis_0"




/mob/living/carbon/superior_animal/genetics/fratellis/proc/steal_from_mob()
	if(stat)
		return -1

	for(var/mob/living/carbon/C in view(1,src))
		var/obj/item/stolen_item = null
		if(C.l_hand && C.l_hand.w_class <= ITEM_SIZE_SMALL)
			stolen_item = C.l_hand

		else if(C.r_hand && C.r_hand.w_class <= ITEM_SIZE_SMALL)
			stolen_item = C.r_hand

		if(stolen_item)
			C.remove_from_mob(stolen_item)
			stomach_contents += stolen_item
			stolen_item.loc = src
			visible_message(
				"<span class='danger'>\The [src] grabs the [stolen_item] out of [C]'s hand and scarfs it down!</span>",
			)
			return



/mob/living/carbon/superior_animal/genetics/fratellis/attackby(obj/item/used_item, mob/user)
	if(user.a_intent == I_HELP)
		if(istype(used_item, /mob))
			to_chat(user, SPAN_WARNING("\the [src] really isn't into vore."))
		var/list/usable_qualities = list()

		if(stomach_open)
			usable_qualities.Add(QUALITY_CAUTERIZING)
			if(!stomach_retracted)
				usable_qualities.Add(QUALITY_RETRACTING)
			usable_qualities.Add(QUALITY_CLAMPING)
		usable_qualities.Add(QUALITY_CUTTING)
		var/tool_type = used_item.get_tool_type(user, usable_qualities, src)
		#ifdef JANEDEBUG
		log_debug("fratellis/attackby() used_item: [used_item]")
		log_debug("fratellis/attackby() usable_qualities: [usable_qualities]")
		log_debug("fratellis/attackby() usable_qualities: [tool_type]")
		#endif

		switch(tool_type)
			if(QUALITY_CUTTING)
				//Open their belly.
				if(user.targeted_organ == BP_GROIN && !stomach_open)
					user.visible_message("[user] begins slicing open the distended belly of \the [src] with the [used_item]", "You begin slicing open the distended belly of \the [src] with the [used_item]")
					var/success = used_item.use_tool_extended(
						user, src,
						160, QUALITY_CUTTING,
						FAILCHANCE_NORMAL, required_stat = STAT_BIO
					)
					switch(success)
						if(TOOL_USE_SUCCESS)
							src.visible_message("The belly of \the [src] is sliced open!")
							stomach_open = TRUE
						if(TOOL_USE_FAIL)
							src.embed(used_item)
						if(TOOL_USE_CANCEL)
							to_chat(user, SPAN_WARNING("You stop slicing open \the [src]."))
				//Cut a slab of meat
				else
					user.visible_message("[user] begins carving flesh away from \the [src] with the [used_item]", "You begin carving flesh away from \the [src] with the [used_item]")
					var/success = used_item.use_tool_extended(
						user, src,
						160, QUALITY_CUTTING,
						FAILCHANCE_NORMAL, required_stat = STAT_BIO
					)
					switch(success)
						if(TOOL_USE_SUCCESS)
							user.visible_message("[user] cuts a slab of meat from \the [src].", "You begin harvest a slab of meat from \the [src].")
							var/obj/item/reagent_containers/food/snacks/meat/butchered_meat = new /obj/item/reagent_containers/food/snacks/meat(get_turf(src))
							butchered_meat.name = "[src.name] [butchered_meat.name]"
							butchered_meat.initialize_genetics(src)
							src.adjustBruteLoss(150)
						if(TOOL_USE_FAIL)
							src.visible_message("\the [src] moans in pain from the [used_item] embedded in its flesh.")
							src.embed(used_item)
							src.adjustBruteLoss(100)
						if(TOOL_USE_CANCEL)
							to_chat(user, SPAN_WARNING("You stop slicing open \the [src], but blood pours from the wound made."))
							src.adjustFireLoss(20)
				return
			if(QUALITY_RETRACTING)
				user.visible_message("[user] begins exposing the contents of \the [src]'s stomach with the [used_item]", "You begin exposing the contents of \the [src]'s stomach with the [used_item]")
				var/success = used_item.use_tool_extended(
					user, src,
					160, QUALITY_RETRACTING,
					FAILCHANCE_NORMAL, required_stat = STAT_BIO
				)
				switch(success)
					if(TOOL_USE_SUCCESS)
						to_chat(user, SPAN_WARNING("The stomach of \the [src] is retracted."))
						stomach_open = TRUE
					if(TOOL_USE_FAIL)
						if(prob(20))
							to_chat(user, SPAN_WARNING("Your [used_item] embeds in \the [src]!"))
							src.embed(used_item)
					if(TOOL_USE_CANCEL)
						to_chat(user, SPAN_WARNING("You stop retracting the stomach of \the [src]."))
				return
			if(QUALITY_CLAMPING)
				user.visible_message("[user] begins extracting objects from \the [src]'s stomach with the [used_item]", "You begin extracting objects from \the [src]'s stomach with the [used_item]")
				var/success = used_item.use_tool_extended(
					user, src,
					160, QUALITY_CLAMPING,
					FAILCHANCE_NORMAL, required_stat = STAT_BIO
				)
				switch(success)
					if(TOOL_USE_SUCCESS)
						if(!stomach_contents.len)
							to_chat(user, SPAN_WARNING("The stomach of \the [src] is empty."))
						else
							var/list/option_list = list()
							for(var/option in stomach_contents)
								if(!option_list["[option]"])
									option_list["[option]"] = option_list[option]
							var/obj/item/choice = input("Select something to extract", "Stomach contents:") in option_list
							if(choice)
								user.visible_message("[user] extracts \a [choice] from \the [src].", "You extract \a [choice] from \the [src].")
								user.put_in_hands(choice)
								stomach_contents.Remove(choice)
					if(TOOL_USE_FAIL)
						if(prob(30))
							user.visible_message("[user] accidently drops their [used_item] into the stomach of \the [src].", "You accidently drop your [used_item] into the stomach of \the [src].")
							used_item.forceMove(src)
					if(TOOL_USE_CANCEL)
						to_chat(user, SPAN_WARNING("You stop slicing open \the [src]."))
				return
			if(QUALITY_CAUTERIZING)
				user.visible_message("[user] begins sealing the flesh and organs of \the [src] shut with the [used_item]", "You begin sealing the flesh and organs of \the [src] shut with the [used_item]")
				var/success = used_item.use_tool_extended(
					user, src,
					160, QUALITY_CAUTERIZING,
					FAILCHANCE_NORMAL, required_stat = STAT_BIO
				)
				switch(success)
					if(TOOL_USE_SUCCESS)
						user.visible_message("[user] seals shut the stomach of \the [src].", "You seal shut the stomach of \the [src].")
						stomach_open = FALSE
						stomach_retracted = FALSE
						src.adjustFireLoss(10)
					if(TOOL_USE_FAIL)
						user.visible_message("[user] burns \the [src] haphazardly!", "You burn \the [src] haphazardly!")
						src.adjustFireLoss(50)
					if(TOOL_USE_CANCEL)
						to_chat(user, SPAN_WARNING("You stop cauterizing \the [src]'s wounds, but a small burn remains."))
						src.adjustFireLoss(5)
				return


		//if the item had no tool qualities, continue to feeding process
		if(stomach_contents.len != MAX_STOMACH_CONTENTS + 2)
			user.drop_from_inventory(used_item, src)
			stomach_contents += used_item

		if(stomach_contents.len > MAX_STOMACH_CONTENTS)
			src.visible_message("[src] forces \the [used_item] down it's throat... A fleshy, tearing sound can be heard.")
			spawn(50)
				src.gib()
		else
			switch(hunger)
				if(0 to 250)
					src.visible_message("[src] forces the [used_item] down its throat.")
				if(251 to 500)
					src.visible_message("[src] reluctantly eats [used_item] as since it is there.")
				if(501 to 1000)
					src.visible_message("[src] cranes its head over to eat the [used_item] as it comes within eating distance.")
				if(1001 to 2000)
					src.visible_message("[src] snatches the [used_item] as soon as it is offered.")
				if(2001 to 3000)
					src.visible_message("[src] despirately snatches the [used_item] as soon as it is offered.")

	update_description()
	update_icon()
	..()



/mob/living/carbon/superior_animal/genetics/fratellis/proc/update_description()
	desc = initial(desc)
	if(stomach_open)
		if(stomach_retracted)
			desc += "\n<span class='danger'>Its stomach has been cut open.</span>"
		else
			desc += "\n<span class='danger'>Its stomach has been cut open and is bleeding profusely!.</span>"
	for(var/obj/item in embedded)
		desc += "\n<span class='danger'>\A [item] is embedded in its flesh!.</span>"



	if(stomach_contents.len == MAX_STOMACH_CONTENTS)
		desc += "\n<span class='danger'>It looks about to burst.</span>"
	else if(stomach_contents.len > MAX_STOMACH_CONTENTS)
		desc += "\n<span class='danger'>It is going to explode!</span>"
	else if(stomach_contents.len >= DISTENDED_STOMACH_CONTENTS)
		desc += "\n<span class='notice'>The belly of the creature is distended.</span>"

	switch(hunger)
		if(0 to 250)
			desc += "\n<span class='notice'>It looks like it is full.</span>"
		if(251 to 500)
			desc += "\n<span class='notice'>It doesn't look particularly hungry.</span>"
		if(501 to 1000)
			desc += "\n<span class='notice'>It looks hungry.</span>"
		if(1001 to 2000)
			desc += "\n<span class='danger'>It looks like it is starving.</span>"
		if(2001 to 3000)
			desc += "\n<span class='danger'>It looks like it is malnourished.</span>"
		else
			desc += "\n<span class='danger'>Only skin and bones, how the creature remains alive is a wonder.</span>"

	if(gnawing_state && hunger > 1000)
		if(gnawing_state == 1 )
			desc += "\n<span class='notice'>It stares at its own flank hungrily.</span>"
		else if(gnawing_state == 2 && hunger > 500)
			desc += "\n<span class='notice'>It stares at its own flank ravenously.</span>"
	#ifdef JANEDEBUG
	desc += "\n<span class='notice'>Hunger: [hunger]</span>"
	#endif

/mob/living/carbon/superior_animal/genetics/fratellis/proc/rise_again()
	if(stat != DEAD)
		return

	visible_message("With a mornful howl, <b>\The [src]</b> twitches as it comes back to life!")

	if (reagents)
		reagents.clear_reagents()

	// shut down various types of badness
	SetParalysis(0)
	SetStunned(0)
	SetWeakened(0)
	setHalLoss(0)

	// shut down ongoing problems
	radiation = 0
	bodytemperature = T20C
	sdisabilities = 0
	disabilities = 0

	// fix blindness and deafness
	blinded = 0
	eye_blind = 0
	eye_blurry = 0
	ear_deaf = 0
	ear_damage = 0

	// remove the character from the list of the dead
	GLOB.dead_mob_list -= src
	GLOB.living_mob_list += src
	tod = null
	timeofdeath = 0

	// restore us to conciousness
	stat = CONSCIOUS

	// make the icons look correct
	regenerate_icons()

	BITSET(hud_updateflag, HEALTH_HUD)
	BITSET(hud_updateflag, STATUS_HUD)
	BITSET(hud_updateflag, LIFE_HUD)

	failed_last_breath = 0 //So mobs that died of oxyloss don't revive and have perpetual out of breath.

#undef BASE_REGEN
#undef DISTENDED_STOMACH_CONTENTS
#undef MAX_STOMACH_CONTENTS