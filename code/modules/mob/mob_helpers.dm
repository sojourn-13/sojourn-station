// fun if you want to typecast humans/monkeys/etc without writing long path-filled lines.
/*
/proc/isxenomorph(A)
	if(ishuman(A))
		var/mob/living/carbon/human/H = A
		return istype(H.species, /datum/species/xenos)
	return 0
*/
/proc/issmall(A)
	if(A && isliving(A))
		var/mob/living/L = A
		return L.mob_size <= MOB_SMALL
	return 0

/mob/living/proc/isSynthetic()
	return 0

/mob/living/carbon/human/isSynthetic()
	// If they are 100% robotic, they count as synthetic.
	for(var/obj/item/organ/external/E in organs)
		if(!BP_IS_ROBOTIC(E))
			return FALSE
	return TRUE

/mob/living/silicon/isSynthetic()
	return 1

/mob/proc/isMonkey()
	return 0

/mob/living/carbon/human/isMonkey()
	return istype(species, /datum/species/monkey)

/proc/isdeaf(A)
	if(isliving(A))
		var/mob/living/M = A
		return (M.sdisabilities & DEAF) || M.ear_deaf
	return 0

/proc/hasorgans(A) // Fucking really??
	return ishuman(A)

/proc/iscuffed(A)
	if(iscarbon(A))
		var/mob/living/carbon/C = A
		if(C.handcuffed)
			return 1
	return 0

/proc/hassensorlevel(A, var/level)
	var/mob/living/carbon/human/H = A
	if(istype(H) && istype(H.w_uniform, /obj/item/clothing/under))
		var/obj/item/clothing/under/U = H.w_uniform
		return U.sensor_mode >= level
	return 0

/proc/getsensorlevel(A)
	var/mob/living/carbon/human/H = A
	if(istype(H) && istype(H.w_uniform, /obj/item/clothing/under))
		var/obj/item/clothing/under/U = H.w_uniform
		return U.sensor_mode
	return SUIT_SENSOR_OFF


/proc/is_admin(var/mob/user)
	return check_rights(R_ADMIN, 0, user) != 0


/proc/hsl2rgb(h, s, l)
	return //TODO: Implement

/*
	Miss Chance
*/

//TODO: Integrate defence zones and targeting body parts with the actual organ system, move these into organ definitions.

//The base miss chance for the different defence zones
var/list/global/base_miss_chance = list(
	BP_HEAD = 45,
	BP_CHEST = 10,
	BP_GROIN = 20,
	BP_L_LEG  = 20,
	BP_R_LEG = 20,
	BP_L_ARM = 20,
	BP_R_ARM = 20
	)

//Used to weight organs when an organ is hit randomly (i.e. not a directed, aimed attack).
//Also used to weight the protection value that armour provides for covering that body part when calculating protection from full-body effects.
var/list/global/organ_rel_size = list(
	BP_HEAD = 20,
	BP_CHEST = 70,
	BP_GROIN = 30,
	BP_L_LEG  = 25,
	BP_R_LEG = 25,
	BP_L_ARM = 25,
	BP_R_ARM = 25
)

/proc/check_zone(zone)
	if(!zone)	return BP_CHEST
	switch(zone)
		if(BP_EYES)
			zone = BP_HEAD
		if(BP_MOUTH)
			zone = BP_HEAD
	return zone

// Returns zone with a certain probability. If the probability fails, or no zone is specified, then a random body part is chosen.
// Do not use this if someone is intentionally trying to hit a specific body part.
// Use get_zone_with_miss_chance() for that.
/proc/ran_zone(zone, probability)
	if (zone)
		zone = check_zone(zone)
		if (prob(probability))
			return zone

	var/ran_zone = zone
	while (ran_zone == zone)
		ran_zone = pick (
			organ_rel_size[BP_HEAD]; BP_HEAD,
			organ_rel_size[BP_CHEST]; BP_CHEST,
			organ_rel_size[BP_GROIN]; BP_GROIN,
			organ_rel_size[BP_L_ARM]; BP_L_ARM,
			organ_rel_size[BP_R_ARM]; BP_R_ARM,
			organ_rel_size[BP_L_LEG ]; BP_L_LEG ,
			organ_rel_size[BP_R_LEG]; BP_R_LEG,
		)

	return ran_zone

// Emulates targetting a specific body part, and miss chances
// May return null if missed
// miss_chance_mod may be negative.
/proc/get_zone_with_miss_chance(zone, var/mob/target, var/miss_chance_mod = 0, var/ranged_attack=0)
	zone = check_zone(zone)

	if(!ranged_attack)
		// you cannot miss if your target is prone or restrained
		if(target.buckled || target.lying)
			return zone
		// if your target is being grabbed aggressively by someone you cannot miss either
		for(var/obj/item/grab/G in target.grabbed_by)
			if(G.state >= GRAB_AGGRESSIVE)
				return zone

	var/miss_chance = 10
	if (zone in base_miss_chance)
		miss_chance = base_miss_chance[zone]

	//See-through people are harder to hit
	if(CLOAKING in target.mutations)
		miss_chance += 15

	miss_chance = clamp(miss_chance + miss_chance_mod, 0, 90)
	if(prob(miss_chance))
		if(prob(70))
			return null
		return pick(base_miss_chance)
	return zone



//Replaces some of the characters with *, used in whispers. pr = probability of no star.
//Will try to preserve HTML formatting. re_encode controls whether the returned text is HTML encoded outside tags.
/proc/stars(n, pr = 25, re_encode = 1)
	if (pr < 0)
		return null
	else if (pr >= 100)
		return n

	var/intag = 0
	var/block = list()
	. = list()
	for(var/i = 1, i <= length(n), i++)
		var/char = copytext(n, i, i+1)
		if(!intag && (char == "<"))
			intag = 1
			. += stars_no_html(JOINTEXT(block), pr, re_encode) //stars added here
			block = list()
		block += char
		if(intag && (char == ">"))
			intag = 0
			. += block //We don't mess up html tags with stars
			block = list()
	. += (intag ? block : stars_no_html(JOINTEXT(block), pr, re_encode))
	. = JOINTEXT(.)


//Ingnores the possibility of breaking tags.
/proc/stars_no_html(text, pr, re_encode)
	text = html_decode(text) //We don't want to screw up escaped characters
	. = list()
	for(var/i = 1, i <= length(text), i++)
		var/char = copytext(text, i, i+1)
		if(char == " " || prob(pr))
			. += char
		else
			. += "*"
	. = JOINTEXT(.)
	if(re_encode)
		. = html_encode(.)

/proc/slur(phrase)
	phrase = html_decode(phrase)
	var/leng=length(phrase)
	var/counter=length(phrase)
	var/newphrase=""
	var/newletter=""
	while(counter>=1)
		newletter=copytext(phrase,(leng-counter)+1,(leng-counter)+2)
		if(rand(1,3)==3)
			if(lowertext(newletter)=="o")	newletter="u"
			if(lowertext(newletter)=="s")	newletter="ch"
			if(lowertext(newletter)=="a")	newletter="ah"
			if(lowertext(newletter)=="c")	newletter="k"
		switch(rand(1,7))
			if(1,3,5)	newletter="[lowertext(newletter)]"
			if(2,4,6)	newletter="[uppertext(newletter)]"
			if(7)	newletter+="'"
			//if(9,10)	newletter="<b>[newletter]</b>"
			//if(11,12)	newletter="<big>[newletter]</big>"
			//if(13)	newletter="<small>[newletter]</small>"
		newphrase+="[newletter]";counter-=1
	return html_encode(newphrase)

/proc/stutter(phrase)
	phrase = html_decode(phrase)

	var/list/split_phrase = splittext(phrase," ") //Split it up into words.

	var/list/unstuttered_words = split_phrase.Copy()
	var/i = rand(1,3)
	for(,i > 0,i--) //Pick a few words to stutter on.

		if (!unstuttered_words.len)
			break
		var/word = pick(unstuttered_words)
		unstuttered_words -= word //Remove from unstuttered words so we don't stutter it again.
		var/index = split_phrase.Find(word) //Find the word in the split phrase so we can replace it.

		//Search for dipthongs (two letters that make one sound.)
		var/first_sound = copytext(word,1,3)
		var/first_letter = copytext(word,1,2)
		if(lowertext(first_sound) in list("ch","th","sh"))
			first_letter = first_sound

		//Repeat the first letter to create a stutter.
		var/rnum = rand(1,3)
		switch(rnum)
			if(1)
				word = "[first_letter]-[word]"
			if(2)
				word = "[first_letter]-[first_letter]-[word]"
			if(3)
				word = "[first_letter]-[word]"

		split_phrase[index] = word

	return sanitize(jointext(split_phrase," "))


/proc/Gibberish(t, p)//t is the inputted message, and any value higher than 70 for p will cause letters to be replaced instead of added
	/* Turn text into complete gibberish! */
	var/returntext = ""
	for(var/i = 1, i <= length(t), i++)

		var/letter = copytext(t, i, i+1)
		if(prob(50))
			if(p >= 70)
				letter = ""

			for(var/j = 1, j <= rand(0, 2), j++)
				letter += pick("#","@","*","&","%","$","/", "<", ">", ";","*","*","*","*","*","*","*")

		returntext += letter

	return returntext


/proc/ninjaspeak(n)
/*
The difference with stutter is that this proc can stutter more than 1 letter
The issue here is that anything that does not have a space is treated as one word (in many instances). For instance, "LOOKING," is a word, including the comma.
It's fairly easy to fix if dealing with single letters but not so much with compounds of letters./N
*/
	var/t = ""
	n = length(n)
	var/p = 1
	while(p <= n)
		var/n_letter
		var/n_mod = rand(1,4)
		if(p+n_mod>n+1)
			n_letter = copytext(n, p, n+1)
		else
			n_letter = copytext(n, p, p+n_mod)
		if (prob(50))
			if (prob(30))
				n_letter = text("[n_letter]-[n_letter]-[n_letter]")
			else
				n_letter = text("[n_letter]-[n_letter]")
		else
			n_letter = text("[n_letter]")
		t = text("[t][n_letter]")
		p=p+n_mod
	return sanitize(t)





/proc/findname(msg)
	for(var/mob/M in SSmobs.mob_list)
		if (M.real_name == text("[msg]"))
			return 1
	return 0


/mob/proc/abiotic(var/full_body = 0)
	if(full_body && ((src.l_hand && !( src.l_hand.abstract )) || (src.r_hand && !( src.r_hand.abstract )) || (src.back || src.wear_mask)))
		return 1

	if((src.l_hand && !( src.l_hand.abstract )) || (src.r_hand && !( src.r_hand.abstract )))
		return 1

	return 0

//converts intent-strings into numbers and back
var/list/intents = list(I_HELP,I_DISARM,I_GRAB,I_HURT)
/proc/intent_numeric(argument)
	if(istext(argument))
		switch(argument)
			if(I_HELP)		return 0
			if(I_DISARM)	return 1
			if(I_GRAB)		return 2
			else			return 3
	else
		switch(argument)
			if(0)			return I_HELP
			if(1)			return I_DISARM
			if(2)			return I_GRAB
			else			return I_HURT

//change a mob's act-intent. Input the intent as a string such as "help" or use "right"/"left
/mob/verb/a_intent_change(input as text)
	set name = "a-intent"
	set hidden = 1

	if(ishuman(src) || isbrain(src) || isslime(src))
		switch(input)
			if(I_HELP,I_DISARM,I_GRAB,I_HURT)
				a_intent = input
			if("right")
				a_intent = intent_numeric((intent_numeric(a_intent)+1) % 4)
			if("left")
				a_intent = intent_numeric((intent_numeric(a_intent)+3) % 4)

	else if(isrobot(src))
		if(a_intent == I_HELP)
			a_intent = I_HURT
		else
			a_intent = I_HELP

	if (HUDneed.Find("intent"))
		var/obj/screen/intent/I = HUDneed["intent"]
		I.update_icon()


proc/is_blind(A)
	if(iscarbon(A))
		var/mob/living/carbon/C = A
		if(C.sdisabilities & BLIND || C.blinded)
			return 1
	return 0

/proc/broadcast_security_hud_message(var/message, var/broadcast_source)
	broadcast_hud_message(message, broadcast_source, sec_hud_users, /obj/item/clothing/glasses/hud/security)

/proc/broadcast_medical_hud_message(var/message, var/broadcast_source)
	broadcast_hud_message(message, broadcast_source, med_hud_users, /obj/item/clothing/glasses/hud/health)

/proc/broadcast_hud_message(var/message, var/broadcast_source, var/list/targets, var/icon)
	var/turf/sourceturf = get_turf(broadcast_source)
	for(var/mob/M in targets)
		var/turf/targetturf = get_turf(M)
		if((targetturf.z == sourceturf.z))
			M.show_message("<span class='info'>\icon[icon] [message]</span>", 1)

/proc/mobs_in_area(var/area/A)
	var/list/mobs = new
	for(var/mob/living/M in SSmobs.mob_list)
		if(get_area(M) == A)
			mobs += M
	return mobs

//Direct dead say used both by emote and say
//It is somewhat messy. I don't know what to do.
//I know you can't see the change, but I rewrote the name code. It is significantly less messy now
/proc/say_dead_direct(var/message, var/mob/subject = null)
	var/name
	var/keyname
	if(subject && subject.client)
		var/client/C = subject.client
		keyname = (C.holder && C.holder.fakekey) ? C.holder.fakekey : C.key
		if(C.mob) //Most of the time this is the dead/observer mob; we can totally use him if there is no better name
			var/mindname
			var/realname = C.mob.real_name
			if(C.mob.mind)
				mindname = C.mob.mind.name
				if(C.mob.mind.original && C.mob.mind.original.real_name)
					realname = C.mob.mind.original.real_name
			if(mindname && mindname != realname)
				name = "[realname] died as [mindname]"
			else
				name = realname

	for(var/mob/M in GLOB.player_list)
		if(M.client && (isghost(M) || (M.client.holder && !is_mentor(M.client))) && M.get_preference_value(/datum/client_preference/show_dsay) == GLOB.PREF_SHOW)
			var/follow
			var/lname
			if(subject)
				if(subject != M)
					follow = "([ghost_follow_link(subject, M)]) "
				if(M.stat != DEAD && M.client.holder)
					follow = "([admin_jump_link(subject, M.client.holder)]) "
				var/mob/observer/ghost/DM
				if(isghost(subject))
					DM = subject
				if(M.client.holder) 							// What admins see
					lname = "[keyname][(DM && DM.anonsay) ? "*" : (DM ? "" : "^")] ([name])"
				else
					if(DM && DM.anonsay)						// If the person is actually observer they have the option to be anonymous
						lname = "Ghost of [name]"
					else if(DM)									// Non-anons
						lname = "[keyname] ([name])"
					else										// Everyone else (dead people who didn't ghost yet, etc.)
						lname = name
				lname = "<span class='name'>[lname]</span> "
			to_chat(M, "<span class='deadsay'>" + create_text_tag("dead", "DEAD:", M.client) + " [lname][follow][message]</span>")

//Announces that a ghost has joined/left, mainly for use with wizards
/proc/announce_ghost_joinleave(O, var/joined_ghosts = 1, var/message = "")
	var/client/C
	//Accept any type, sort what we want here
	if(ismob(O))
		var/mob/M = O
		if(M.client)
			C = M.client
	else if(istype(O, /client))
		C = O
	else if(istype(O, /datum/mind))
		var/datum/mind/M = O
		if(M.current && M.current.client)
			C = M.current.client
		else if(M.original && M.original.client)
			C = M.original.client

	if(C)
		var/name
		if(C.mob)
			var/mob/M = C.mob
			if(M.mind && M.mind.name)
				name = M.mind.name
			if(M.real_name && M.real_name != name)
				if(name)
					name += " ([M.real_name])"
				else
					name = M.real_name
		if(!name)
			name = (C.holder && C.holder.fakekey) ? C.holder.fakekey : C.key
		if(joined_ghosts)
			say_dead_direct("The ghost of <span class='name'>[name]</span> now [pick("skulks","lurks","prowls","creeps","stalks")] among the dead. [message]")
		else
			say_dead_direct("<span class='name'>[name]</span> no longer [pick("skulks","lurks","prowls","creeps","stalks")] in the realm of the dead. [message]")

/mob/proc/switch_to_camera(var/obj/machinery/camera/C)
	if (!C.can_use() || stat || (get_dist(C, src) > 1 || machine != src || blinded || !canmove))
		return 0
	check_eye(src)
	return 1

/mob/living/silicon/ai/switch_to_camera(var/obj/machinery/camera/C)
	if(!C.can_use() || !is_in_chassis())
		return 0

	eyeobj.setLoc(C)
	return 1

// Returns true if the mob has a client which has been active in the last given X minutes.
/mob/proc/is_client_active(var/active = 1)
	return client && client.inactivity < active MINUTES

/mob/proc/can_eat()
	return 1

/mob/proc/can_force_feed()
	return 1

#define SAFE_PERP -50
/mob/living/proc/assess_perp(var/obj/access_obj, var/check_access, var/auth_weapons, var/check_records, var/check_arrest)
	if(stat == DEAD)
		return SAFE_PERP

	return 0

/mob/living/carbon/assess_perp(var/obj/access_obj, var/check_access, var/auth_weapons, var/check_records, var/check_arrest)
	if(handcuffed)
		return SAFE_PERP

	return ..()

/mob/living/carbon/human/assess_perp(var/obj/access_obj, var/check_access, var/auth_weapons, var/check_records, var/check_arrest)
	var/threatcount = ..()
	if(. == SAFE_PERP)
		return SAFE_PERP

	//Agent cards lower threatlevel.
	var/obj/item/card/id/id = GetIdCard()
	if(id && istype(id, /obj/item/card/id/syndicate))
		threatcount -= 2
	// A proper	CentCom id is hard currency.
	else if(id && istype(id, /obj/item/card/id/centcom))
		return SAFE_PERP

	if(check_access && !access_obj.allowed(src))
		threatcount += 4

	if(auth_weapons && !access_obj.allowed(src))
		if(istype(l_hand, /obj/item/gun) || istype(l_hand, /obj/item/melee))
			threatcount += 4

		if(istype(r_hand, /obj/item/gun) || istype(r_hand, /obj/item/melee))
			threatcount += 4

		if(istype(belt, /obj/item/gun) || istype(belt, /obj/item/melee))
			threatcount += 2

		if(species.name != "Human")
			threatcount += 2

	if(check_records || check_arrest)
		var/perpname = name
		if(id)
			perpname = id.registered_name

		var/datum/data/record/R = find_security_record("name", perpname)
		if(check_records && !R)
			threatcount += 4

		if(check_arrest && R && (R.fields["criminal"] == "*Arrest*"))
			threatcount += 4

	return threatcount

/mob/living/simple/hostile/assess_perp(var/obj/access_obj, var/check_access, var/auth_weapons, var/check_records, var/check_arrest)
	var/threatcount = ..()
	if(. == SAFE_PERP)
		return SAFE_PERP

	if(!istype(src, /mob/living/simple/hostile/retaliate/goat))
		threatcount += 4
	return threatcount




#undef SAFE_PERP

/mob/proc/get_multitool(var/obj/item/tool/multitool/P)
	if(istype(P))
		return P

/mob/observer/ghost/get_multitool()
	return isAdminGhostAI(src) && ..(ghost_multitool)

/mob/living/carbon/human/get_multitool()
	return ..(get_active_hand())

/mob/living/silicon/robot/get_multitool()
	return ..(get_active_hand())

/mob/living/silicon/ai/get_multitool()
	return ..(aiMulti)


//This proc returns true if the mob has no health problems. EG, no damaged organs, alive, not poisoned, etc
//It is used by cryopods to allow people to quickly respawn during peaceful times
/mob/proc/in_perfect_health()
	return

/mob/proc/in_good_health()
	return

/mob/living/in_perfect_health()
	if(stat == DEAD)
		return FALSE

	if(usr.health != usr.maxHealth)
		return FALSE


	return TRUE

/mob/living/carbon/human/in_perfect_health()
	for (var/a in bad_external_organs)
		return FALSE

	for (var/obj/item/organ/o in internal_organs)
		if (o.damage)
			return FALSE

	return ..()

/mob/living/carbon/human/in_good_health()
	if(stat == DEAD)
		return FALSE

	if(health != maxHealth)
		return FALSE

	return TRUE


/mob/get_sex()
	return gender

//Tries to find the mob's email.
/proc/find_email(real_name)
	for(var/mob/mob in GLOB.living_mob_list)
		if(mob.real_name == real_name)
			if(!mob.mind)
				return
			return mob.mind.initial_email_login["login"]

/proc/get_both_hands(mob/living/carbon/M)
	if(!istype(M))
		return
	var/list/hands = list(M.l_hand, M.r_hand)
	return hands

/mob/proc/drop_embedded()
	//Embedded list is defined at mob level so we can have this here too
	for(var/obj/A in embedded)
		if (A.loc == src)
			A.forceMove(loc)
			if(isitem(A))
				var/obj/item/I = A
				I.on_embed_removal(src)
			A.tumble()
	embedded = list()

/mob/proc/skill_to_evade_traps()
	if(!stats)
		return 0
	var/prob_evade = 0
	var/base_prob_evade = 30
	if(MOVING_DELIBERATELY(src))
		prob_evade += base_prob_evade
	if(!stats)
		return prob_evade
	prob_evade += base_prob_evade * (stats.getStat(STAT_VIG)/STAT_LEVEL_MASTER - weight_coeff())
	if(stats.getPerk(PERK_SURE_STEP))
		prob_evade += base_prob_evade*30/STAT_LEVEL_MASTER
	//if(stats.getPerk(PERK_RAT))
	//	prob_evade += base_prob_evade/1.5
	return prob_evade

/mob/proc/mob_playsound(atom/source, soundin, vol as num, vary, extrarange as num, falloff, is_global, frequency, is_ambiance = 0,  ignore_walls = TRUE, zrange = 2, override_env, envdry, envwet, use_pressure = TRUE)
	if(isliving(src))
		var/mob/living/L = src
		vol *= L.noise_coeff + weight_coeff()
		extrarange *= L.noise_coeff + weight_coeff()
	playsound(source, soundin, vol, vary, extrarange, falloff, is_global, frequency, is_ambiance,  ignore_walls, zrange, override_env, envdry, envwet, use_pressure)

/mob/proc/weight_coeff()
	return get_max_w_class()/(ITEM_SIZE_TITANIC)

// Steps used to modify wounding multiplier. Should be used alongside edge/sharp when determining final damage of BRUTE-type attacks.
/proc/step_wounding(var/wounding, var/is_increase = FALSE) // Usually mobs are the ones attacking (no), so this should be okay here? If it gets lucky a macro would be slightly faster
	if(is_increase)
		switch(wounding)
			if(WOUNDING_HARMLESS)
				return WOUNDING_TINY
			if(WOUNDING_TINY)
				return WOUNDING_SMALL
			if(WOUNDING_SMALL)
				return WOUNDING_NORMAL
			if(WOUNDING_NORMAL)
				return WOUNDING_NORMAL
			if(WOUNDING_NORMAL)
				return WOUNDING_WIDE
			if(WOUNDING_WIDE)
				return WOUNDING_EXTREME
			if(WOUNDING_EXTREME)
				return WOUNDING_DEVESTATING
			if(WOUNDING_DEVESTATING)
				return WOUNDING_DEVESTATING
	else
		switch(wounding)
			if(WOUNDING_HARMLESS)
				return WOUNDING_HARMLESS
			if(WOUNDING_TINY)
				return WOUNDING_HARMLESS
			if(WOUNDING_SMALL)
				return WOUNDING_TINY
			if(WOUNDING_NORMAL)
				return WOUNDING_SMALL
			if(WOUNDING_SERIOUS)
				return WOUNDING_NORMAL
			if(WOUNDING_WIDE)
				return WOUNDING_SERIOUS
			if(WOUNDING_EXTREME)
				return WOUNDING_WIDE
			if(WOUNDING_DEVESTATING)
				return WOUNDING_EXTREME

/proc/step_wounding_double(var/wounding, var/is_increase = FALSE)
	if(is_increase)
		switch(wounding)
			if(WOUNDING_HARMLESS)
				return WOUNDING_SMALL
			if(WOUNDING_TINY)
				return WOUNDING_NORMAL
			if(WOUNDING_SMALL)
				return WOUNDING_SERIOUS
			if(WOUNDING_NORMAL)
				return WOUNDING_WIDE
			if(WOUNDING_SERIOUS)
				return WOUNDING_WIDE
			if(WOUNDING_WIDE)
				return WOUNDING_DEVESTATING
			if(WOUNDING_EXTREME)
				return WOUNDING_DEVESTATING
	else
		switch(wounding)
			if(WOUNDING_HARMLESS)
				return WOUNDING_HARMLESS
			if(WOUNDING_TINY)
				return WOUNDING_HARMLESS
			if(WOUNDING_SMALL)
				return WOUNDING_HARMLESS
			if(WOUNDING_NORMAL)
				return WOUNDING_TINY
			if(WOUNDING_SERIOUS)
				return WOUNDING_SMALL
			if(WOUNDING_WIDE)
				return WOUNDING_NORMAL
			if(WOUNDING_EXTREME)
				return WOUNDING_SERIOUS
			if(WOUNDING_DEVESTATING)
				return WOUNDING_WIDE

// Determine wounding level. If var/wounding is provided, the attack should come from a projectile. This isn't the case yet, as we default to var/wounding = 1 until melee rework.
/proc/wound_check(var/injurytype, var/wounding, var/edge, var/sharp)
	if(sharp && (!edge)) // impaling/piercing, 2x damage, affected by injurytype
		switch(injurytype)
			if(INJURY_TYPE_HOMOGENOUS)
				return wounding ? step_wounding_double(wounding) : 1
			if(INJURY_TYPE_UNLIVING)
				return wounding ? step_wounding(wounding) : 1.5
			else
				return wounding ? wounding : 2
	if(sharp && edge) // cutting, 1.5x damage
		return wounding ? wounding : 1.5
	return wounding ? wounding : 1 // crushing, 1x damage

//Soj edit
/mob/proc/get_health()
	return health

/**
 * Wrapper for walk_to. Most cases of walk_to should be instead substituted for this, although this has slightly worse performance than stock walk_to.
 *
 * Args:
 * All the same as walk_to.
 * deathcheck = FALSE: If deathcheck == TRUE, and Ref.stat == DEAD, we will return FALSE.
 * respect_override = TRUE: If TRUE, we will check ref's walk_override_timer variable (set whenever this proc is called with override = TRUE), and if its more or equal to world.time, we return.
 * temporary_walk = FALSE: If this or override is true, we calculate a timer based on distance and the Lag arg. If this is true, we set a timer to walk_to(Ref, 0) based on
 * the aforementioned timer. The proc set for this timer is walk_to_wrapper_timer. See it's doc for more info.
 * override = FALSE: If true, we set the ref's walk_override_timer to world.time + the aforementioned timer. See respect_override for more info.
**/
/proc/walk_to_wrapper(atom/movable/Ref, Trg, Min=0, Lag=0, Speed=0, deathcheck = FALSE, respect_override = TRUE, temporary_walk = FALSE, override = FALSE)
	if (deathcheck && Ref.stat == DEAD)
		return FALSE
	if (respect_override && (Ref.walk_override_timer >= world.time))
		return FALSE
	if (override || temporary_walk)
		var/timer = ((get_dist(Ref, Trg) * (Lag * 1.2)) + 3) // WARNING. ARBITRARY MATH. I DO NOT KNOW IF THIS WILL WORK.
		if (override)
			Ref.walk_override_timer = (world.time + timer)
		if (temporary_walk)
			var/current_time = world.time
			Ref.walk_to_initial_time = current_time
			addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(walk_to_wrapper_timer), Ref, 0, current_time), timer)
	walk_to(Ref, Trg, Min, Lag, Speed)
	return TRUE

/// For use in walk_to_wrapper exclusively. If another temporary walk has been called while this timer was active, this walk is cancelled already, so we return.
/proc/walk_to_wrapper_timer(atom/movable/Ref, Trg, initial)
	if (initial != Ref.walk_to_initial_time) //so multiple movements dont interrupt eachother
		return FALSE
	walk_to(Ref, Trg)

///Is the passed in mob a ghost with admin powers, doesn't check for AI interact like isAdminGhost() used to
/proc/isAdminObserver(mob/user)
	if(!user) //Are they a mob? Auto interface updates call this with a null src
		return
	if(!user.client) // Do they have a client?
		return
	if(!isobserver(user)) // Are they a ghost?
		return
	if(!check_rights_for(user.client, R_ADMIN)) // Are they allowed?
		return
	return TRUE

///Is the passed in mob an admin ghost WITH AI INTERACT enabled
/proc/isAdminGhostAI(mob/user)
	if(!isAdminObserver(user))
		return
	if(!user.client.AI_Interact) // Do they have it enabled?
		return
	return TRUE
