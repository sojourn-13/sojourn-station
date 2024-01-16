/mob/living/carbon/human/examine(mob/user)
	var/skipgloves = 0
	var/skipsuitstorage = 0
	var/skipjumpsuit = 0
	var/skipshoes = 0
	var/skipmask = 0
	var/skipears = 0
	var/skipeyes = 0
	var/skipface = 0

	//exosuits and helmets obscure our view and stuff.
	if(wear_suit)
		skipgloves = wear_suit.flags_inv & HIDEGLOVES
		skipsuitstorage = wear_suit.flags_inv & HIDESUITSTORAGE
		skipjumpsuit = wear_suit.flags_inv & HIDEJUMPSUIT
		skipshoes = wear_suit.flags_inv & HIDESHOES

	if(head)
		skipmask = head.flags_inv & HIDEMASK
		skipeyes = head.flags_inv & HIDEEYES
		skipears = head.flags_inv & HIDEEARS
		skipface = head.flags_inv & HIDEFACE

	if(wear_mask)
		skipface |= wear_mask.flags_inv & HIDEFACE

	var/msg = "<span class='info'>*---------*\nThis is "

	var/datum/gender/T = null
	if(skipjumpsuit && skipface) //big suits/masks/helmets make it hard to tell their gender
		T = GLOB.gender_datums[PLURAL]
	else
		if(icon)
			msg += "\icon[icon] " //fucking BYOND: this should stop dreamseeker crashing if we -somehow- examine somebody before their icon is generated

/*	if(!T) //Gender has been expanded, this check is no longer necessary.
		// Just in case someone VVs the gender to something strange. It'll runtime anyway when it hits usages, better to CRASH() now with a helpful message.
		CRASH("Gender datum was null; key was '[(skipjumpsuit && skipface) ? PLURAL : gender]'")*/

	var/He   = gender_word("He",  T)
	var/he   = gender_word("he",  T)
	var/His  = gender_word("His", T)
	var/his  = gender_word("his", T)
	var/him  = gender_word("him", T)
	var/is   = gender_word("is",  T)
	var/has  = gender_word("has", T)
	var/does = gender_word("does",T)

	msg += "<EM>[src.get_visible_name()]</EM>, <b><font color='[species_color_key]'>a[species_aan] [species_name]</font></b>"
	msg += "!\n"

	//uniform
	if(w_uniform && !skipjumpsuit)
		//Ties
		var/tie_msg
		if(istype(w_uniform,/obj/item/clothing/under))
			var/obj/item/clothing/under/U = w_uniform
			if(U.accessories.len)
				var/i = 1 //Can't use english_list for this so here we go - this is the least-awful option. "i" is iterations through the for loop.
				tie_msg += ". Attached to it is"
				for(var/acc in U.accessories)
					if(i < U.accessories.len && i > 1)
						tie_msg += ","
					else if(i > 1)
						tie_msg += " and"
					tie_msg += " <a href='?src=\ref[user];lookitem=\ref[acc]'>\a [acc]</a>"
					i += 1

		if(w_uniform.blood_DNA)
			msg += "<span class='warning'>[He] [is] wearing \icon[w_uniform] [w_uniform.gender==PLURAL?"some":"a"] [(w_uniform.blood_color != "#030303") ? "blood" : "oil"]-stained <a href='?src=\ref[user];lookitem=\ref[w_uniform]'>\a [w_uniform]</a>[tie_msg]!</span>\n"
		else
			msg += "[He] [is] wearing \icon[w_uniform] <a href='?src=\ref[user];lookitem=\ref[w_uniform]'>\a [w_uniform]</a>[tie_msg].\n"

	//head
	if(head)
		if(head.blood_DNA)
			msg += "<span class='warning'>[He] [is] wearing \icon[head] [head.gender==PLURAL?"some":"a"] [(head.blood_color != "#030303") ? "blood" : "oil"]-stained <a href='?src=\ref[user];lookitem=\ref[head]'>\a [head]</a> on [his] head!</span>\n"
		else
			msg += "[He] [is] wearing \icon[head] <a href='?src=\ref[user];lookitem=\ref[head]'>\a [head]</a> on [his] head.\n"

	//suit/armour
	if(wear_suit)
		if(wear_suit.blood_DNA)
			msg += "<span class='warning'>[He] [is] wearing \icon[wear_suit] [wear_suit.gender==PLURAL?"some":"a"] [(wear_suit.blood_color != "#030303") ? "blood" : "oil"]-stained <a href='?src=\ref[user];lookitem=\ref[wear_suit]'>\a [wear_suit]</a>!</span>\n"
		else
			msg += "[He] [is] wearing \icon[wear_suit] <a href='?src=\ref[user];lookitem=\ref[wear_suit]'>\a [wear_suit]</a>.\n"

		//suit/armour storage
		if(s_store && !skipsuitstorage)
			if(s_store.blood_DNA)
				msg += "<span class='warning'>[He] [is] carrying \icon[s_store] [s_store.gender==PLURAL?"some":"a"] [(s_store.blood_color != "#030303") ? "blood" : "oil"]-stained <a href='?src=\ref[user];lookitem=\ref[s_store]'>\a [s_store]</a> on [his] [wear_suit]!</span>\n"
			else
				msg += "[He] [is] carrying \icon[s_store] <a href='?src=\ref[user];lookitem=\ref[s_store]'>\a [s_store]</a> on [his] [wear_suit].\n"

	//back
	if(back)
		if(back.blood_DNA)
			msg += "<span class='warning'>[He] [has] \icon[back] [back.gender==PLURAL?"some":"a"] [(back.blood_color != "#030303") ? "blood" : "oil"]-stained <a href='?src=\ref[user];lookitem=\ref[back]'>\a [back]</a> on [his] back.</span>\n"
		else
			msg += "[He] [has] \icon[back] <a href='?src=\ref[user];lookitem=\ref[back]'>\a [back]</a> on [his] back.\n"

	//left hand
	if(l_hand&& !(l_hand.item_flags & ABSTRACT))//Abstract items don't show up when examined.
		if(l_hand.blood_DNA)
			msg += "<span class='warning'>[He] [is] holding \icon[l_hand] [l_hand.gender==PLURAL?"some":"a"] [(l_hand.blood_color != "#030303") ? "blood" : "oil"]-stained <a href='?src=\ref[user];lookitem=\ref[l_hand]'>\a [l_hand]</a> [l_hand.wielded ? "hands" : "left hand"]!</span>\n"
		else
			msg += "[He] [is] holding \icon[l_hand] <a href='?src=\ref[user];lookitem=\ref[l_hand]'>\a [l_hand]</a> in [his] [l_hand.wielded ? "hands" : "left hand"].\n"

	//right hand
	if(r_hand && !(r_hand.item_flags & ABSTRACT))
		if(r_hand.blood_DNA)
			msg += "<span class='warning'>[He] [is] holding \icon[r_hand] [r_hand.gender==PLURAL?"some":"a"] [(r_hand.blood_color != "#030303") ? "blood" : "oil"]-stained <a href='?src=\ref[user];lookitem=\ref[r_hand]'>\a [r_hand]</a> in [his] [r_hand.wielded ? "hands" : "right hand"]!</span>\n"
		else
			msg += "[He] [is] holding \icon[r_hand] <a href='?src=\ref[user];lookitem=\ref[r_hand]'>\a [r_hand]</a> in [his] [r_hand.wielded ? "hands" : "right hand"].\n"

	//gloves
	if(gloves && !skipgloves)
		if(gloves.blood_DNA)
			msg += "<span class='warning'>[He] [has] \icon[gloves] [gloves.gender==PLURAL?"some":"a"] [(gloves.blood_color != "#030303") ? "blood" : "oil"]-stained <a href='?src=\ref[user];lookitem=\ref[gloves]'>\a [gloves]</a> on [his] hands!</span>\n"
		else
			msg += "[He] [has] \icon[gloves] <a href='?src=\ref[user];lookitem=\ref[gloves]'>\a [gloves]</a> on [his] hands.\n"
	else if(blood_DNA)
		msg += "<span class='warning'>[He] [has] [(hand_blood_color != "#030303") ? "blood" : "oil"]-stained hands!</span>\n"

	//handcuffed?

	//handcuffed?
	if(handcuffed)
		if(istype(handcuffed, /obj/item/handcuffs/cable))
			msg += "<span class='warning'>[He] [is] \icon[handcuffed] restrained with cable!</span>\n"
		else
			msg += "<span class='warning'>[He] [is] \icon[handcuffed] handcuffed!</span>\n"

	//buckled
	if(buckled)
		msg += "<span class='warning'>[He] [is] \icon[buckled] buckled to [buckled]!</span>\n"

	//belt
	if(belt)
		if(belt.blood_DNA)
			msg += "<span class='warning'>[He] [has] \icon[belt] [belt.gender==PLURAL?"some":"a"] [(belt.blood_color != "#030303") ? "blood" : "oil"]-stained <a href='?src=\ref[user];lookitem=\ref[belt]'>\a [belt]</a> about [his] waist!</span>\n"
		else
			msg += "[He] [has] \icon[belt] <a href='?src=\ref[user];lookitem=\ref[belt]'>\a [belt]</a> about [his] waist.\n"

	//shoes
	if(shoes && !skipshoes)
		if(shoes.blood_DNA)
			msg += "<span class='warning'>[He] [is] wearing \icon[shoes] [shoes.gender==PLURAL?"some":"a"] [(shoes.blood_color != "#030303") ? "blood" : "oil"]-stained <a href='?src=\ref[user];lookitem=\ref[shoes]'>\a [shoes]</a> on [his] feet!</span>\n"
		else
			msg += "[He] [is] wearing \icon[shoes] <a href='?src=\ref[user];lookitem=\ref[shoes]'>\a [shoes]</a> on [his] feet.\n"
	else if(feet_blood_DNA)
		msg += "<span class='warning'>[He] [has] [(feet_blood_color != "#030303") ? "blood" : "oil"]-stained feet!</span>\n"

	//mask
	if(wear_mask && !skipmask)
		var/descriptor = "on [his] face"
		if(istype(wear_mask, /obj/item/grenade))
			descriptor = "in [his] mouth"
		if(wear_mask.blood_DNA)
			msg += "<span class='warning'>[He] [has] \icon[wear_mask] [wear_mask.gender==PLURAL?"some":"a"] [(wear_mask.blood_color != "#030303") ? "blood" : "oil"]-stained <a href='?src=\ref[user];lookitem=\ref[wear_mask]'>\a [wear_mask]</a> [descriptor]!</span>\n"
		else
			msg += "[He] [has] \icon[wear_mask] <a href='?src=\ref[user];lookitem=\ref[wear_mask]'>\a [wear_mask]</a> [descriptor].\n"

	//eyes
	if(glasses && !skipeyes)
		if(glasses.blood_DNA)
			msg += "<span class='warning'>[He] [has] \icon[glasses] [glasses.gender==PLURAL?"some":"a"] [(glasses.blood_color != "#030303") ? "blood" : "oil"]-stained <a href='?src=\ref[user];lookitem=\ref[glasses]'>\a [glasses]</a> covering [his] eyes!</span>\n"
		else
			msg += "[He] [has] \icon[glasses] <a href='?src=\ref[user];lookitem=\ref[glasses]'>\a [glasses]</a> covering [his] eyes.\n"

	//left ear
	if(l_ear && !skipears)
		msg += "[He] [has] \icon[l_ear] <a href='?src=\ref[user];lookitem=\ref[l_ear]'>\a [l_ear]</a> on [his] left ear.\n"

	//right ear
	if(r_ear && !skipears)
		msg += "[He] [has] \icon[r_ear] <a href='?src=\ref[user];lookitem=\ref[r_ear]'>\a [r_ear]</a> on [his] right ear.\n"

	//ID
	if(wear_id)
		msg += "[He] [is] wearing \icon[wear_id] <a href='?src=\ref[user];lookitem=\ref[wear_id]'>\a [wear_id]</a>.\n"

	//Jitters
	if(is_jittery)
		if(jitteriness >= 300)
			msg += "<span class='warning'><B>[He] [is] convulsing violently!</B></span>\n"
		else if(jitteriness >= 200)
			msg += "<span class='warning'>[He] [is] extremely jittery.</span>\n"
		else if(jitteriness >= 100)
			msg += "<span class='warning'>[He] [is] twitching ever so slightly.</span>\n"

	//splints
	for(var/organ in list(BP_L_LEG ,BP_R_LEG,BP_L_ARM,BP_R_ARM))
		var/obj/item/organ/external/o = get_organ(organ)
		if(o && o.status & ORGAN_SPLINTED)
			msg += "<span class='warning'>[He] [has] a splint on [his] [o.name]!</span>\n"

	if(mSmallsize in mutations)
		msg += "[He] [is] small halfling!\n"

	if(!wear_suit && !w_uniform && !(T == src))
		if(locate(/obj/item/implant/carrion_spider) in src)
			msg += SPAN_DANGER("[He] [has] a strange growth on [his] chest!") + "\n"

	var/distance = get_dist(usr,src)
	if(isghost(usr) || usr?.stat == DEAD) // ghosts can see anything
		distance = 1
	if(src.stat || (status_flags & FAKEDEATH))
		msg += "<span class='warning'>[He] [is]n't responding to anything around [him] and seems to be asleep.</span>\n"
		if((stat == DEAD || src.losebreath || (status_flags & FAKEDEATH)) && distance <= 3)
			msg += "<span class='warning'>[He] [does] not appear to be breathing.</span>\n"
		if(ishuman(usr) && !usr?.stat && Adjacent(usr))
			usr?.visible_message("<b>[usr]</b> checks [src]'s pulse.", "You check [src]'s pulse.")
		if(distance<=1 && do_mob(usr,src,15,progress=0))
			if(status_flags & FAKEDEATH)
				to_chat(usr, "<span class='deadsay'>[He] [has] no pulse and [his] soul has departed...</span>")
			else if(pulse() == PULSE_NONE)
				to_chat(usr, "<span class='deadsay'>[He] [has] no pulse[src.client ? "" : " and [his] soul has departed"]...</span>")
			else
				to_chat(usr, "<span class='deadsay'>[He] [has] a pulse!</span>")

	if(fire_stacks)
		msg += "[He] [is] covered in some liquid.\n"
	if(on_fire)
		msg += "<span class='warning'>[He] [is] on fire!.</span>\n"

	if(species.show_ssd && (!species.has_process[BP_BRAIN] || has_brain()) && stat != DEAD)
		if(!key)
			msg += "<span class='deadsay'>[He] [is] [form.show_ssd]. It doesn't look like [he] [is] waking up anytime soon.</span>\n"
		else if(!client)
			msg += "<span class='deadsay'>[He] [is] [form.show_ssd].</span>\n"

	var/list/wound_flavor_text = list()
	var/list/is_bleeding = list()

	for(var/organ_tag in species.has_limbs)

		var/datum/organ_description/OD = species.has_limbs[organ_tag]
		var/organ_descriptor = OD.name

		var/obj/item/organ/external/E = organs_by_name[organ_tag]
		if(!E)
			wound_flavor_text["[organ_descriptor]"] = "<span class='warning'><b>[He] [is] missing [his] [organ_descriptor].</b></span>\n"
		else if(E.is_stump())
			wound_flavor_text["[organ_descriptor]"] = "<span class='warning'><b>[He] [has] a stump where [his] [organ_descriptor] should be.</b></span>\n"
		else
			continue

	for(var/obj/item/organ/external/temp in organs)
		if(BP_IS_PROSTHETIC(temp))
			var/part_display_name
			if(copytext(temp.name, 1, 6) == "robot")
				part_display_name = "\a [temp]"
			else
				part_display_name = "a robot [temp.name]"

			if(!(temp.brute_dam + temp.burn_dam))
				wound_flavor_text["[temp.name]"] = "<span class='warning'>[He] [has] [part_display_name]!</span>\n"
			else
				wound_flavor_text["[temp.name]"] = "<span class='warning'>[He] [has] [part_display_name]. It has [temp.get_wounds_desc()]!</span>\n"
			continue
		else if(temp.wounds.len > 0 || temp.open)
			if(temp.is_stump() && temp.parent)
				// OCCULUS EDIT START: Better clarity for injuries.
				// OLD: 'He has a pair of tiny bruises, a massive salved burn, and a large bruise on his right arm'
				// NEW: 'His right arm has a pair of tiny buises, a massive salved burn, and a large bruise.'
				// old code: wound_flavor_text["[temp.name]"] = "<span class='warning'>[He] [has] [temp.get_wounds_desc()] on [his] [temp.parent.name].</span><br>"
				wound_flavor_text["[temp.name]"] = "<span class='warning'>[His] <b>[temp.parent.name]</b> [has] [temp.get_wounds_desc()].</span><br>"
			else
				// old code: wound_flavor_text["[temp.name]"] = "<span class='warning'>[He] [has] [temp.get_wounds_desc()] on [his] [temp.name].</span><br>"
				wound_flavor_text["[temp.name]"] = "<span class='warning'>[His] <b>[temp.name]</b> [has] [temp.get_wounds_desc()].</span><br>"
				// OCCULUS EDIT END
			if(temp.status & ORGAN_BLEEDING)
				is_bleeding["[temp.name]"] = "<span class='danger'>[His] [temp.name] is bleeding!</span><br>"
		else
			wound_flavor_text["[temp.name]"] = ""
		if(temp.nerve_struck == 2)
			wound_flavor_text["[temp.name]"] += "<span class='warning'>[His] [temp.joint] is dangling uselessly!</span><br>"
		if(((temp.status & ORGAN_BROKEN) && temp.brute_dam > temp.min_broken_damage) || (temp.status & ORGAN_MUTATED))
			wound_flavor_text["[temp.name]"] += "<span class='warning'>[His] [temp.name] is mangled!</span><br>"
		if(temp.status & ORGAN_DEAD)
			wound_flavor_text["[temp.name]"] += "<span class='danger'>[His] [temp.name] is necrotic!</span><br>"//Occulus Edit End
		for(var/obj/item/organ/internal/blood_vessel/BV in temp.internal_organs)//Occulus Edit: Ruptured Blood Vessel
			if(BV.damage > 4)//occulus Edit: Ruptured blood vessel that is above the self-heal threshold
				wound_flavor_text["[temp.name]"] += "<span class='warning'>[His] [temp.name] is swollen with black and blue spots!</span><br>"//Occulus Edit: Ruptured Blood vessel
//Edited out form occulus port but this is good to have in case we ever add back in sanity
/*
	if(user.stats.getPerk(PERK_EMPATH))
		if(sanity.level <= 40 && sanity.level > 20)
			msg += "[He] looks stressed out.\n"
		else if(sanity.level <= 20 && sanity.level > 0)
			msg += "<span class='warning'>[He] looks ready to do something rash!</span>\n"
		else if(sanity.level == 0)
			msg += "<span class ='danger'>[He] needs help! Now! Something is wrong!\n"
*/
	//Handles the text strings being added to the actual description.
	//If they have something that covers the limb, and it is not missing, put flavortext.  If it is covered but bleeding, add other flavortext.

	// ***********************************************************************************
	// THIS NEEDS TO BE ENTIRELY REWRITTEN. Commenting out for now, BADLY NEEDS REWRITING.
	// ***********************************************************************************

	/*
	var/display_chest = 0
	var/display_shoes = 0
	var/display_gloves = 0

	if(wound_flavor_text["head"] && (is_destroyed["head"] || (!skipmask && !(wear_mask && istype(wear_mask, /obj/item/clothing/mask/gas)))))
		msg += wound_flavor_text["head"]
	else if(is_bleeding["head"])
		msg += "<span class='warning'>[src] [has] blood running down [his] face!</span>\n"

	if(wound_flavor_text["upper body"] && !w_uniform && !skipjumpsuit) //No need.  A missing chest gibs you.
		msg += wound_flavor_text["upper body"]
	else if(is_bleeding["upper body"])
		display_chest = 1

	if(wound_flavor_text["left arm"] && (is_destroyed["left arm"] || (!w_uniform && !skipjumpsuit)))
		msg += wound_flavor_text["left arm"]
	else if(is_bleeding["left arm"])
		display_chest = 1

	if(wound_flavor_text["left hand"] && (is_destroyed["left hand"] || (!gloves && !skipgloves)))
		msg += wound_flavor_text["left hand"]
	else if(is_bleeding["left hand"])
		display_gloves = 1

	if(wound_flavor_text["right arm"] && (is_destroyed["right arm"] || (!w_uniform && !skipjumpsuit)))
		msg += wound_flavor_text["right arm"]
	else if(is_bleeding["right arm"])
		display_chest = 1

	if(wound_flavor_text["right hand"] && (is_destroyed["right hand"] || (!gloves && !skipgloves)))
		msg += wound_flavor_text["right hand"]
	else if(is_bleeding["right hand"])
		display_gloves = 1

	if(wound_flavor_text["lower body"] && (is_destroyed["lower body"] || (!w_uniform && !skipjumpsuit)))
		msg += wound_flavor_text["lower body"]
	else if(is_bleeding["lower body"])
		display_chest = 1

	if(wound_flavor_text["left leg"] && (is_destroyed["left leg"] || (!w_uniform && !skipjumpsuit)))
		msg += wound_flavor_text["left leg"]
	else if(is_bleeding["left leg"])
		display_chest = 1

	if(wound_flavor_text["right leg"] && (is_destroyed["right leg"] || (!w_uniform && !skipjumpsuit)))
		msg += wound_flavor_text["right leg"]
	else if(is_bleeding["right leg"])
		display_chest = 1

	if(display_chest)
		msg += "<span class='danger'>[src] [has] blood soaking through from under [his] clothing!</span>\n"
	if(display_shoes)
		msg += "<span class='danger'>[src] [has] blood running from [his] shoes!</span>\n"
	if(display_gloves)
		msg += "<span class='danger'>[src] [has] blood running from under [his] gloves!</span>\n"
	*/

	for(var/limb in wound_flavor_text)
		msg += wound_flavor_text[limb]
		is_bleeding[limb] = null
	for(var/limb in is_bleeding)
		msg += is_bleeding[limb]
	for(var/implant in get_visible_implants())
		msg += "<span class='danger'>[src] [has] \a [implant] sticking out of [his] flesh!</span>\n"
	if(digitalcamo)
		msg += "[He] [is] repulsively uncanny!\n"

	if(hasHUD(usr,"security"))
		var/perpname = get_id_name(name)
		var/criminal = "None"

		if(perpname)
			var/datum/computer_file/report/crew_record/R = get_crewmember_record(perpname)
			criminal = R ? R.get_criminalStatus() : "None"

			msg += "<span class = 'deptradio'>Criminal status:</span> <a href='?src=\ref[src];criminal=1'>\[[criminal]\]</a>\n"
			msg += "<span class = 'deptradio'>Security records:</span> <a href='?src=\ref[src];secrecord=`'>\[View\]</a>  <a href='?src=\ref[src];secrecordadd=`'>\[Add comment\]</a>\n"

	if(hasHUD(usr,"medical"))
		var/perpname = "wot"
		var/medical = "None"

		if(wear_id)
			var/obj/item/card/id/id_card = wear_id.GetIdCard()
			if(id_card)
				perpname = id_card.registered_name
		else
			perpname = src.name

		for (var/datum/data/record/E in data_core.general)
			if (E.fields["name"] == perpname)
				for (var/datum/data/record/R in data_core.general)
					if (R.fields["id"] == E.fields["id"])
						medical = R.fields["p_stat"]

		msg += "<span class = 'deptradio'>Physical status:</span> <a href='?src=\ref[src];medical=1'>\[[medical]\]</a>\n"
		msg += "<span class = 'deptradio'>Medical records:</span> <a href='?src=\ref[src];medrecord=`'>\[View\]</a> <a href='?src=\ref[src];medrecordadd=`'>\[Add comment\]</a>\n"

		var/obj/item/clothing/under/U = w_uniform
		if(U && istype(U) && U.sensor_mode >= 2)
			msg += "<span class='deptradio'><b>Damage Specifics:</span> <span style=\"color:blue\">[round(src.getOxyLoss(), 1)]</span>-<span style=\"color:green\">[round(src.getToxLoss(), 1)]</span>-<span style=\"color:#FFA500\">[round(src.getFireLoss(), 1)]</span>-<span style=\"color:red\">[round(src.getBruteLoss(), 1)]</span></b>\n"
	if(print_flavor_text()) msg += "[print_flavor_text()]\n"

	msg += "*---------*</span>"
	if (pose)
		if( findtext(pose,".",length(pose)) == 0 && findtext(pose,"!",length(pose)) == 0 && findtext(pose,"?",length(pose)) == 0 )
			pose = addtext(pose,".") //Makes sure all emotes end with a period.
		msg += "\n[He] [is] [pose]"

	to_chat(user, msg)
	. = msg

//Helper procedure. Called by /mob/living/carbon/human/examine() and /mob/living/carbon/human/Topic() to determine HUD access to security and medical records.
/proc/hasHUD(mob/M as mob, hudtype)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		switch(hudtype)
			if("security")
				return istype(H.glasses, /obj/item/clothing/glasses/hud/security) || istype(H.glasses, /obj/item/clothing/glasses/sechud)
			if("medical")
				return istype(H.glasses, /obj/item/clothing/glasses/hud/health)
			else
				return 0
	else if(isrobot(M))
		var/mob/living/silicon/robot/R = M
		switch(hudtype)
			if("security")
				return istype(R.module_state_1, /obj/item/borg/sight/hud/sec) || istype(R.module_state_2, /obj/item/borg/sight/hud/sec) || istype(R.module_state_3, /obj/item/borg/sight/hud/sec)
			if("medical")
				return istype(R.module_state_1, /obj/item/borg/sight/hud/med) || istype(R.module_state_2, /obj/item/borg/sight/hud/med) || istype(R.module_state_3, /obj/item/borg/sight/hud/med)
			else
				return 0
	else
		return 0
