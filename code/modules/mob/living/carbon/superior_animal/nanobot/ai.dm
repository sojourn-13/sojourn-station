#define AUTODOC_MODE 1 // To act like a medibot
#define RADIO_MODE 2 // To act like a radio
#define FOOD_MODE 4 // To give food.
#define CONSOLE_MODE 8 // To act as a console

/mob/living/carbon/superior_animal/nanobot/doTargetMessage()
	. = ..()

	visible_emote("lets out a buzz as it detects a target!")
	playsound(src, 'sound/machines/buzz-sigh.ogg', 50, 1, -3)

/mob/living/carbon/superior_animal/nanobot/hear_say(var/message, var/verb = "says", var/datum/language/language = null, var/alt_name = "", var/italics = 0, var/mob/speaker = null, var/sound/speech_sound, var/sound_vol, speech_volume)
	..()

/mob/living/carbon/superior_animal/nanobot/UnarmedAttack(var/mob/living/carbon/human/H, var/proximity)
	if(medbot) // Are we in healing mode?
		if(H == patient && ishuman(H)) // Are we "attacking" our patient?
			var/t = valid_healing_target(H)
			if(!t)
				visible_emote("state, \"Patient healed.\"")
				playsound(loc, "robot_talk_light", 100, 0, 0)
				patient = null
				return

			visible_emote("state, \"Injecting [t].\"")
			visible_message(SPAN_WARNING("[src] is trying to inject [H]!"))
			currently_healing = TRUE
			if(do_mob(src, H, 30, TRUE, FALSE)) // Wait 3 seconds, can't break and doesn't spawn a progress bar for the bot that can't see it anyway.
				H.reagents.add_reagent(t, injection_amount)
				visible_message(SPAN_WARNING("[src] injects [H] with the syringe!"))
			currently_healing = FALSE
			return // Leave early before we hit them in the face,

	..() // Hit them in the face

/mob/living/carbon/superior_animal/nanobot/proc/valid_healing_target(var/mob/living/carbon/human/H)
	if(H.stat == DEAD) // He's dead, Jim
		return null

	if((H.getBruteLoss() >= heal_threshold) && (!H.reagents.has_reagent(treatment_brute)))
		return treatment_brute //If they're already medicated don't bother!

	if((H.getOxyLoss() >= (15 + heal_threshold)) && (!H.reagents.has_reagent(treatment_oxy)))
		return treatment_oxy

	if((H.getFireLoss() >= heal_threshold) && (!H.reagents.has_reagent(treatment_fire)))
		return treatment_fire

	if((H.getToxLoss() >= heal_threshold) && (!H.reagents.has_reagent(treatment_tox)))
		return treatment_tox

/mob/living/carbon/superior_animal/nanobot/MouseDrop(atom/over_object)
	if(holder_type && !anchored) // We need a defined holder type in order for picking up to work, and the bot need to not be anchored.
		var/mob/living/carbon/H = over_object
		if(!istype(H) || !Adjacent(H))
			return ..()
		get_scooped(H, usr)
		return
	return ..()

/mob/living/carbon/superior_animal/nanobot/interact(mob/user as mob)
	if((get_dist(src, user) > 1) || (stat & (BROKEN|NOPOWER)))
		if(!isAI(user))
			user.unset_machine()
			user << browse(null, "window=Nanobot")
			return

	user.set_machine(src)

	user << browse(handle_ui(), "window=Nanobot")
	onclose(user, "Nanobot")
	return

/mob/living/carbon/superior_animal/nanobot/proc/handle_ui()
	var/dat = ""
	dat += "<head><title>[name]</title></head>"
	dat += "[name]<BR>"
	dat += "<A href='?src=\ref[src];close=1'>Close</A><BR>"
	dat += "<A href='?src=\ref[src];refresh=1'>Refresh</A><BR><BR>"

	dat += "Status: <BR>"
	dat += "- Following : <A href='?src=\ref[src];setfollow=1'>[following ? "[following]" : "None"]</A><BR>"
	dat += "- - <A href='?src=\ref[src];adduser=1'>Add User</A> | <A href='?src=\ref[src];removeuser=1'>Remove User</A><BR>"
	if(ai_flag & AUTODOC_MODE) // Is Autodoc Mode installed?
		dat += "- Autodoc Mode : <A href='?src=\ref[src];autodoc=1'>[medbot ? "Active" : "Inactive"]</A><BR>"

	if(ai_flag & RADIO_MODE) // Is Radio Mode installed?
		dat += "- Radio Mode : <A href='?src=\ref[src];radio=1'>[Radio.broadcasting ? "Active" : "Inactive"]</A><BR>"

	if(ai_flag & CONSOLE_MODE)
		dat += "- Console : "
		if(Console)
			dat += "<A href='?src=\ref[src];console=1'>[Console.loc != src ? "Deployed" : "Retracted"]</A><BR>"
		else
			dat += "- ERROR : No Console Detected.<BR>"

	if(ai_flag & FOOD_MODE) // Is Food Mode installed?
		dat += "- Food Mode : <A href='?src=\ref[src];food=1'>Dispense Food</A><BR>"

	return dat

/mob/living/carbon/superior_animal/nanobot/Topic(href, href_list)
	..()

	if(href_list["close"])
		usr << browse(null, "window=Nanobot")
		usr.unset_machine()
		return

	if(href_list["autodoc"])
		if(creator_check())
			medbot = !medbot
		else
			visible_emote("state, \"Error, User doesn't have permission to perform this action.\"")

	if(href_list["radio"])
		if(creator_check())
			Radio.broadcasting = !Radio.broadcasting
		else
			visible_emote("state, \"Error, User doesn't have permission to perform this action.\"")

	if(href_list["console"])
		if(creator_check())
			if(Console.loc != src) // Console is deployed
				anchored = FALSE // We can move
				Console.forceMove(src) // Store the console
			else
				anchored = TRUE // The bot can't move
				following = null
				Console.forceMove(src.loc) // Deploy the console
		else
			visible_emote("state, \"Error, User doesn't have permission to perform this action.\"")

	if(href_list["food"])
		if(creator_check())
			spawn_food() // The food-spawning and the visible emote is handled in the proc.
		else
			visible_emote("state, \"Error, User doesn't have permission to perform this action.\"")

	if(href_list["setfollow"])
		if(usr in friends)
			if(following)
				following = null
			else
				following = input(usr, "Choose who [src] should follow : ", "Set Following", null) as mob in oview(viewRange, src)
				last_followed = following //not really sure if this works
		else
			visible_emote("state, \"Error, User doesn't have permission to perform this action.\"")

	if(href_list["adduser"])
		if(creator_check())
			var/list/Possible_Choice = oviewers(viewRange, src)

			// We remove mobs that are already allowed
			for(var/mob/M in Possible_Choice)
				if(friends.Find(M))
					Possible_Choice -= M

			friends += input(usr, "Add a user : ", "Add user", null) as null|mob in Possible_Choice
		else
			visible_emote("state, \"Error, User doesn't have permission to perform this action.\"")

	if(href_list["removeuser"])
		if(creator_check())
			friends -= input(usr, "Remove a user : ", "Remove user", null) as null|mob in friends
		else
			visible_emote("state, \"Error, User doesn't have permission to perform this action.\"")

	updateDialog()
	return

/mob/living/carbon/superior_animal/nanobot/proc/creator_check(var/mob/M)
	if(usr in creator)
		return TRUE
	else
		return FALSE
