#define BASE_REGEN -1
#define MAX_STOMACH_CONTENTS 10

//R&D meat weakling
/mob/living/carbon/superior_animal/genetics/fratellis
	name = "fratellis"
	desc = "A beast tortured by its own immortality. It hungers, but cannot be sated. It bleeds, but cannot run dry."
	icon = 'icons/mob/genetics/fratellis.dmi'
	icon_state = "fratellis"
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
	size_pixel_offset_x = -16
	
	//meat_type = /obj/item/reagent_containers/food/snacks/meat
	attack_sound = 'sound/xenomorph/alien_bite1.ogg'

	anchored = TRUE //Can't be pulled.
	var/list/potential_mutations = list(
		MUTATION_HYPERION = 10
	)

	var/stomach_retracted = FALSE

	var/stomach_open = TRUE

	var/gnawing_state = 0
	var/hunger = 0
	
	var/list/stomach_contents = list()

//Strictly speaking, we can and often do force_feed the Fratellis food in order to regenerate it. 
//However, this proc is set so we can override the Snack's attack script with our own feeding prompt.
/mob/living/carbon/superior_animal/genetics/fratellis/can_force_feed()
	return FALSE

//Cannot be gibbed
/mob/living/carbon/superior_animal/genetics/fratellis/gib()
	return FALSE

//Cannot be dusted
/mob/living/carbon/superior_animal/genetics/fratellis/dust()
	return FALSE

/mob/living/carbon/superior_animal/genetics/fratellis/Life()

	//Handle Regeneration (Works while dead)
	if(health < (maxHealth-4))
		var/hunger_factor = 1
		if(hunger < 100)
			hunger_factor = 4
		else if(hunger < 250)
			hunger_factor = 3
		else if(hunger < 500)
			hunger_factor = 2
		else if(hunger < 750)
			hunger_factor = 1.5
		else if(hunger < 1000)
			hunger_factor = 1
		else if(hunger < 1500)
			hunger_factor = 0.5
		else
			hunger_factor = 0.1

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

	
	if(prob(25))
		//Go into calculating hungie
		//Fratellis takes less hunger passively as time goes on.
		if(hunger < 1000)
			hunger+=10
		if(hunger < 2000)
			hunger+=5
		if(hunger < 3000)
			hunger+=2

	//Drip blood if stomach is open
	if(stomach_open)
		if(!stomach_retracted && prob(80))
			blood_splatter(src)
			adjustBruteLoss(50)
		else if(stomach_retracted && prob(30))
			blood_splatter(src)
			adjustBruteLoss(20)
	

/mob/living/carbon/superior_animal/genetics/fratellis/attackby(obj/item/used_item, mob/user)

	if(user.a_intent == I_HELP)
		var/list/usable_qualities = list()
		if(user.targeted_organ == BP_GROIN)
			if(!stomach_open)
				usable_qualities.Add(QUALITY_CUTTING)
			if(stomach_open)
				usable_qualities.Add(QUALITY_CAUTERIZING)
				if(!stomach_retracted)
					usable_qualities.Add(QUALITY_RETRACTING)
				usable_qualities.Add(QUALITY_CLAMPING)
		else
			usable_qualities.Add(QUALITY_CUTTING)
		var/tool_type = used_item.get_tool_type(user, usable_qualities, src)

		switch(tool_type)
			if(QUALITY_CUTTING)
				//Open their belly.
				if(user.targeted_organ == BP_GROIN)
					user.visible_message("[user] begins slicing open the distended belly of \the [src] with the [I]", "You begin slicing open the distended belly of \the [src] with the [I]")
					var/success = used_item.use_tool_extended(
						user, src,
						80, QUALITY_CUTTING,
						FAILCHANCE_NORMAL, required_stat = STAT_BIO
					)
					if(success == TOOL_USE_SUCCESS)
						src.visible_message("The belly of \the [src] is sliced open!")
						stomach_open = TRUE
					else if(success == TOOL_USE_FAIL)
						src.embed(used_item)
					else if(success == TOOL_USE_CANCEL)
						to_chat(user, SPAN_WARNING("You stop slicing open \the [src]."))
				//Cut a slab of meat
				else
					user.visible_message("[user] begins carving flesh away from \the [src] with the [I]", "You begin carving flesh away from \the [src] with the [I]")
					var/success = used_item.use_tool_extended(
						user, src,
						80, QUALITY_CUTTING,
						FAILCHANCE_EASY, required_stat = STAT_BIO
					)
					if(success == TOOL_USE_SUCCESS)
						user.visible_message("[user] cuts a slab of meat from \the [src].", "You begin harvest a slab of meat from \the [src].")
						src.adjustBruteLoss(150)
					else if(success == TOOL_USE_FAIL)
						src.visible_message("\the [src] moans in pain from the [used_item] embedded in its flesh.")
						src.embed(used_item)
						src.adjustBruteLoss(100)

						var/obj/item/reagent_containers/food/snacks/meat/butchered_meat = new /obj/item/reagent_containers/food/snacks/meat(get_turf(src))
						butchered_meat.name = "[src.name] [butchered_meat.name]"
						butchered_meat.initialize_genetics(src)

					else if(success == TOOL_USE_CANCEL)
						to_chat(user, SPAN_WARNING("You stop slicing open \the [src], but blood pours from the wound made."))
						src.adjustBruteLoss(20)
			if(QUALITY_RETRACTING)
				user.visible_message("[user] begins exposing the contents of \the [src]'s stomach with the [I]", "You begin exposing the contents of \the [src]'s stomach with the [I]")
				var/success = used_item.use_tool_extended(
					user, src,
					80, QUALITY_RETRACTING,
					FAILCHANCE_NORMAL, required_stat = STAT_BIO
				)
				if(success == TOOL_USE_SUCCESS)
					to_chat(user, SPAN_WARNING("The stomach of \the [src] is retracted."))
					stomach_open = TRUE
				else if(success == TOOL_USE_FAIL)
					src.embed(used_item)
				else if(success == TOOL_USE_CANCEL)
					to_chat(user, SPAN_WARNING("You stop slicing open \the [src]."))
			if(QUALITY_CLAMPING)
				//Super not finished
				for(var/option in option_list)
				if(count_list[option] > 0)
					updated_option_list["[option]"] = option_list[option]
				var/obj/item/choice = input("Select something to extract", "Stomach contents:") in stomach_contents


			update_description()


/mob/living/carbon/superior_animal/genetics/fratellis/proc/update_description()
	desc = initial(desc)
	if(stomach_open)
		if(stomach_retracted)
			desc += "\n<span class='danger'>Its stomach has been cut open.</span>"
		else
			desc += "\n<span class='danger'>Its stomach has been cut open and is bleeding profusely!.</span>"
	for(var/obj/item in embedded)
		desc += "\n<span class='danger'>\A [item] is embedded in its flesh!.</span>"
	
	if(stomach_contents.len >= MAX_STOMACH_CONTENTS)
		desc += "\n<span class='danger'>It looks about to burst.</span>"
	else if(stomach_contents.len >= MAX_STOMACH_CONTENTS * 0.8)
		desc += "\n<span class='danger'>Its belly is distended.</span>"
		

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
#undef MAX_STOMACH_CONTENTS