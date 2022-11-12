/obj/item/verbs/borer/attached_arm/verb/evolve()
	set category = "Alien"
	set name = "Evolve"
	set desc = "Upgrade yourself or your host."

	var/mob/living/simple_animal/borer/B=loc
	if(!istype(B))
		return
	B.evolve()

/obj/item/verbs/borer/attached_arm/verb/secrete_chemicals()
	set category = "Alien"
	set name = "Secrete Chemicals"
	set desc = "Push some chemicals into your host's bloodstream."

	var/mob/living/simple_animal/borer/B=loc
	if(!istype(B))
		return
	B.secrete_chemicals()

/obj/item/verbs/borer/attached_arm/verb/abandon_host()
	set category = "Alien"
	set name = "Abandon Host"
	set desc = "Slither out of your host."

	var/mob/living/simple_animal/borer/B=loc
	if(!istype(B))
		return
	B.abandon_host()

//////////OFFENSE TREE/////////////////////
/obj/item/verbs/borer/attached_arm/bone_sword/verb/bone_sword()
	set category = "Alien"
	set name = "Bone Sword"
	set desc = "Expend chemicals constantly to form a large blade of bone for your host."

	var/mob/living/simple_animal/borer/B=loc
	if(!istype(B))
		return
	B.bone_sword()

/mob/living/simple_animal/borer/proc/bone_sword()
	set category = "Alien"
	set name = "Bone Sword"
	set desc = "Expend chemicals constantly to form a large blade of bone for your host."

	if(!check_can_do(0))
		return

	if(channeling && !channeling_bone_sword)
		to_chat(src, "<span class='warning'>You can't do this while your focus is directed elsewhere.</span>")
		return
	else if(channeling)
		to_chat(src, "You cease your efforts to sustain a blade of bone for your host.")
		channeling = 0
		channeling_bone_sword = 0
	else if(chemicals < 5)
		to_chat(src, "<span class='warning'>You don't have enough chemicals stored to do this.</span>")
		return
	else
		var/obj/item/tool/sword/cleaver/cult/bone/S = new(get_turf(host), src)
		if(hostlimb == BP_R_ARM)
			if(host.is_holding_in_r_hand())
				if(istype(host.is_holding_in_r_hand(S), /obj/item/tool/sword/cleaver/cult/bone))
					to_chat(src, "<span class='warning'>Your host already has a bone sword on this arm.</span>")
					qdel(S)
					return
				host.drop_item(host.is_holding_in_r_hand())
			host.put_in_r_hand(S)
		else
			if(host.is_holding_in_l_hand())
				if(istype(host.is_holding_in_l_hand(S), /obj/item/tool/sword/cleaver/cult/bone))
					to_chat(src, "<span class='warning'>Your host already has a bone sword on this arm.</span>")
					qdel(S)
					return
				host.drop_item(host.is_holding_in_l_hand())
			host.put_in_l_hand(S)
		to_chat(src, "You begin to focus your efforts on sustaining a blade of bone for your host.")
		channeling = 1
		channeling_bone_sword = 1
		host.visible_message("<span class='warning'>A blade of bone erupts from \the [host.name]'s [hostlimb == BP_R_ARM ? "right" : "left"] arm!</span>","<span class='warning'>A blade of bone erupts from your [hostlimb == BP_R_ARM ? "right" : "left"] arm!</span>")
		spawn()
			var/time_spent_channeling = 0
			while(channeling && channeling_bone_sword)
				time_spent_channeling++
				sleep(10)
			channeling = 0
			channeling_bone_sword = 0
			host.visible_message("<span class='notice'>\The [host]'s bone sword crumbles into nothing.</span>","<span class='notice'>Your bone sword crumbles into nothing.</span>")
			var/showmessage = 0
			if(chemicals < 5)
				to_chat(src, "<span class='warning'>You lose consciousness as the last of your chemicals are expended.</span>")
			else
				showmessage = 1
			passout(time_spent_channeling, showmessage)

/obj/item/verbs/borer/attached_arm/bone_hammer/verb/bone_hammer()
	set category = "Alien"
	set name = "Bone Hammer"
	set desc = "Expend chemicals constantly to form a large, heavy mass of bone on your host's arm."

	var/mob/living/simple_animal/borer/B=loc
	if(!istype(B))
		return
	B.bone_hammer()

/mob/living/simple_animal/borer/proc/bone_hammer()
	set category = "Alien"
	set name = "Bone Hammer"
	set desc = "Expend chemicals constantly to form a large, heavy mass of bone on your host's arm."

	if(!check_can_do(0))
		return

	if(channeling && !channeling_bone_hammer)
		to_chat(src, "<span class='warning'>You can't do this while your focus is directed elsewhere.</span>")
		return
	else if(channeling)
		to_chat(src, "You cease your efforts to sustain a mass of bone for your host.")
		channeling = 0
		channeling_bone_hammer = 0
	else if(chemicals < 10)
		to_chat(src, "<span class='warning'>You don't have enough chemicals stored to do this.</span>")
		return
	else
		var/obj/item/tool/hammer/homewrecker/cult/bonehammer/S = new(get_turf(host), src)
		if(hostlimb == BP_R_ARM)
			if(host.is_holding_in_r_hand())
				if(istype(host.is_holding_in_r_hand(S), /obj/item/tool/hammer/homewrecker/cult/bonehammer))
					to_chat(src, "<span class='warning'>Your host already has a bone hammer on this arm.</span>")
					qdel(S)
					return
				host.drop_item(host.is_holding_in_r_hand())
			host.put_in_r_hand(S)
		else
			if(host.is_holding_in_l_hand())
				if(istype(host.is_holding_in_l_hand(S), /obj/item/tool/hammer/homewrecker/cult/bonehammer))
					to_chat(src, "<span class='warning'>Your host already has a bone hammer on this arm.</span>")
					qdel(S)
					return
				host.drop_item(host.is_holding_in_l_hand())
			host.put_in_l_hand(S)
		to_chat(src, "You begin to focus your efforts on sustaining a mass of bone for your host.")
		channeling = 1
		channeling_bone_hammer = 1
		host.visible_message("<span class='warning'>A mass of bone erupts from \the [host.name]'s [hostlimb == BP_R_ARM ? "right" : "left"] arm!</span>","<span class='warning'>A mass of bone erupts from your [hostlimb == BP_R_ARM ? "right" : "left"] arm!</span>")
		spawn()
			var/time_spent_channeling = 0
			while(channeling && channeling_bone_hammer)
				time_spent_channeling++
				sleep(10)
			channeling = 0
			channeling_bone_hammer = 0
			host.visible_message("<span class='notice'>\The [host]'s bone hammer crumbles into nothing.</span>","<span class='notice'>Your bone hammer crumbles into nothing.</span>")
			var/showmessage = 0
			if(chemicals < 10)
				to_chat(src, "<span class='warning'>You lose consciousness as the last of your chemicals are expended.</span>")
			else
				showmessage = 1
			passout(time_spent_channeling, showmessage)

//////////DEFENSE TREE/////////////////////
/obj/item/verbs/borer/attached_arm/bone_shield/verb/bone_shield()
	set category = "Alien"
	set name = "Bone Shield"
	set desc = "Expend chemicals constantly to form a large shield of bone for your host."

	var/mob/living/simple_animal/borer/B=loc
	if(!istype(B))
		return
	B.bone_shield()

/mob/living/simple_animal/borer/proc/bone_shield()
	set category = "Alien"
	set name = "Bone Shield"
	set desc = "Expend chemicals constantly to form a large shield of bone for your host."

	if(!check_can_do(0))
		return

	if(channeling && !channeling_bone_shield)
		to_chat(src, "<span class='warning'>You can't do this while your focus is directed elsewhere.</span>")
		return
	else if(channeling)
		to_chat(src, "You cease your efforts to sustain a shield of bone for your host.")
		channeling = 0
		channeling_bone_shield = 0
	else if(chemicals < 3)
		to_chat(src, "<span class='warning'>You don't have enough chemicals stored to do this.</span>")
		return
	else
		var/obj/item/shield/riot/bone/S = new(get_turf(host), src)
		if(hostlimb == BP_R_ARM)
			if(host.is_holding_in_r_hand())
				if(istype(host.is_holding_in_r_hand(S), /obj/item/shield/riot/bone))
					to_chat(src, "<span class='warning'>Your host already has a bone shield on this arm.</span>")
					qdel(S)
					return
				host.drop_item(host.is_holding_in_r_hand())
			host.put_in_r_hand(S)
		else
			if(host.is_holding_in_l_hand())
				if(istype(host.is_holding_in_l_hand(S), /obj/item/shield/riot/bone))
					to_chat(src, "<span class='warning'>Your host already has a bone shield on this arm.</span>")
					qdel(S)
					return
				host.drop_item(host.is_holding_in_l_hand())
			host.put_in_l_hand(S)
		to_chat(src, "You begin to focus your efforts on sustaining a shield of bone for your host.")
		channeling = 1
		channeling_bone_shield = 1
		host.visible_message("<span class='warning'>A shield of bone erupts from \the [host.name]'s [hostlimb == BP_R_ARM ? "right" : "left"] arm!</span>","<span class='warning'>A shield of bone erupts from your [hostlimb == BP_R_ARM ? "right" : "left"] arm!</span>")
		spawn()
			var/time_spent_channeling = 0
			while(channeling && channeling_bone_shield)
				time_spent_channeling++
				sleep(10)
			channeling = 0
			channeling_bone_shield = 0
			host.visible_message("<span class='notice'>\The [host]'s bone shield crumbles into nothing.</span>","<span class='notice'>Your bone shield crumbles into nothing.</span>")
			var/showmessage = 0
			if(chemicals < 3)
				to_chat(src, "<span class='warning'>You lose consciousness as the last of your chemicals are expended.</span>")
			else
				showmessage = 1
			passout(time_spent_channeling, showmessage)

/obj/item/verbs/borer/attached_arm/bone_cocoon/verb/bone_cocoon()
	set category = "Alien"
	set name = "Bone Cocoon"
	set desc = "Expend chemicals constantly to form a large protective cocoon of bone around your host."

	var/mob/living/simple_animal/borer/B=loc
	if(!istype(B))
		return
	B.bone_cocoon()

/mob/living/simple_animal/borer/proc/bone_cocoon()
	set category = "Alien"
	set name = "Bone Cocoon"
	set desc = "Expend chemicals constantly to form a large protective cocoon of bone around your host."

	if(!check_can_do(0))
		return

	if(channeling && !channeling_bone_cocoon)
		to_chat(src, "<span class='warning'>You can't do this while your focus is directed elsewhere.</span>")
		return
	else if(channeling)
		to_chat(src, "You cease your efforts to sustain a shield of bone for your host.")
		channeling = 0
		channeling_bone_cocoon = 0
	else if(chemicals < 10)
		to_chat(src, "<span class='warning'>You don't have enough chemicals stored to do this.</span>")
		return
	else
		var/obj/structure/bone_cocoon/S = new(get_turf(host), src)
		to_chat(src, "You begin to focus your efforts on sustaining a cocoon of bone for your host.")
		channeling = 1
		channeling_bone_cocoon = 1
		host.visible_message("<span class='warning'>A cocoon of bone sprouts from \the [host.name]'s [hostlimb == BP_R_ARM ? "right" : "left"] arm and envelops \him!</span>","<span class='warning'>A cocoon of bone erupts from your [hostlimb == BP_R_ARM ? "right" : "left"] arm and envelops you!</span>")
		host.forceMove(S)
		spawn()
			var/time_spent_channeling = 0
			while(channeling && channeling_bone_cocoon)
				time_spent_channeling++
				sleep(10)
			channeling = 0
			channeling_bone_cocoon = 0
			var/showmessage = 0
			if(chemicals < 10)
				to_chat(src, "<span class='warning'>You lose consciousness as the last of your chemicals are expended.</span>")
			else
				showmessage = 1
			passout(time_spent_channeling, showmessage)

/obj/item/verbs/borer/attached_arm/em_pulse/verb/em_pulse()
	set category = "Alien"
	set name = "Electromagnetic Pulse"
	set desc = "Expend a great deal of chemicals to produce a small electromagnetic pulse."

	var/mob/living/simple_animal/borer/B=loc
	if(!istype(B))
		return
	B.em_pulse()

/mob/living/simple_animal/borer/proc/em_pulse()
	set category = "Alien"
	set name = "Electromagnetic Pulse"
	set desc = "Expend a great deal of chemicals to produce a small electromagnetic pulse."

	if(!check_can_do())
		return

	if(chemicals < 100)
		to_chat(src, "<span class='warning'>You need at least 100 chemicals to do this.</span>")
		return
	else
		chemicals -= 100
		empulse(get_turf(src), 1, 2, 1)

//////////UTILITY TREE/////////////////////
/obj/item/verbs/borer/attached_arm/repair_bone/verb/repair_bone()
	set category = "Alien"
	set name = "Repair Bone"
	set desc = "Expend chemicals to repair bones in your host's arm."

	var/mob/living/simple_animal/borer/B=loc
	if(!istype(B))
		return
	B.repair_bone()

/mob/living/simple_animal/borer/proc/repair_bone()
	set category = "Alien"
	set name = "Repair Bone"
	set desc = "Expend chemicals to repair bones in your host's arm."

	if(!check_can_do())
		return

	if (!host)
		return
	if(!istype(host, /mob/living/carbon/human))
		to_chat(src, "<span class='warning'>You can't seem to repair your host's strange biology.</span>")
		return
	if(chemicals < 30)
		to_chat(src, "<span class='warning'>You don't have enough chemicals stored to do this.</span>")
		return
	var/has_healed_hand = 0
	var/mob/living/carbon/human/H = host
	var/obj/item/organ/external/current_limb = null
	current_limb = H.get_organ(hostlimb)

	for(var/obj/item/organ/external/O in current_limb.children)
		if(O.is_broken())
			O.status &= ~ORGAN_BROKEN
			O.perma_injury = 0
			O.heal_damage(O.brute_dam - ((O.min_broken_damage * ORGAN_HEALTH_MULTIPLIER) - 1))
			to_chat(src, "<span class='notice'>You've repaired the bones in your host's [hostlimb == BP_R_ARM ? "right" : "left"] hand.</span>")
			to_chat(host, "<span class='notice'>You feel the bones in your [hostlimb == BP_R_ARM ? "right" : "left"] hand mend together.</span>")
			chemicals -= 30
			has_healed_hand = 1
	if(current_limb.is_broken())
		if(chemicals < 50)
			if(has_healed_hand)
				to_chat(src, "<span class='warning'>You don't have enough chemicals left to heal your host's [hostlimb == BP_R_ARM ? "right" : "left"] arm.</span>")
				return
			else
				to_chat(src, "<span class='warning'>You must have at least 50 chemicals stored to heal a broken arm.</span>")
				return
		current_limb.status &= ~ORGAN_BROKEN
		current_limb.perma_injury = 0
		current_limb.heal_damage(current_limb.brute_dam - ((current_limb.min_broken_damage * ORGAN_HEALTH_MULTIPLIER) - 1))
		to_chat(src, "<span class='notice'>You've repaired the bones in your host's [hostlimb == BP_R_ARM ? "right" : "left"] arm.</span>")
		to_chat(host, "<span class='notice'>You feel the bones in your [hostlimb == BP_R_ARM ? "right" : "left"] arm mend together.</span>")
		chemicals -= 50
	else
		if(!has_healed_hand)
			to_chat(src, "<span class='notice'>None of the bones in your host's [hostlimb == BP_R_ARM ? "right" : "left"] arm or hand are broken.</span>")


/obj/item/tool/sword/cleaver/cult/bone
	name = "bone sword"
	desc = "A somewhat gruesome blade that appears to be made of solid bone."
	icon = 'modular_sojourn/Borers/icons/bonesword.dmi'
	icon_state = "bonesword"
	hitsound = "sound/weapons/bloodyslice.ogg"
	matter = list(MATERIAL_BONE = 30)
	siemens_coefficient = 0
	slot_flags = null
	attack_verb = list("attacks", "slashes", "stabs", "slices", "tears", "rips", "dices", "cuts")

	var/mob/living/simple_animal/borer/parent_borer = null

/obj/item/tool/sword/cleaver/cult/bone/New(atom/A, var/p_borer = null)
	..(A)
	if(istype(p_borer, /mob/living/simple_animal/borer))
		parent_borer = p_borer
	if(!parent_borer)
		qdel(src)
	else
		START_PROCESSING(SSobj, src)

/obj/item/tool/sword/cleaver/cult/bone/Destroy()
	if(parent_borer)
		if(parent_borer.channeling_bone_sword)
			parent_borer.channeling_bone_sword = 0
		if(parent_borer.channeling)
			parent_borer.channeling = 0
		parent_borer = null
	STOP_PROCESSING(SSobj, src)
	..()

/obj/item/tool/sword/cleaver/cult/bone/Process()
	set waitfor = 0
	if(!parent_borer)
		return
	if(!parent_borer.channeling_bone_sword) //the borer has stopped sustaining the sword
		qdel(src)
		return
	if(parent_borer.chemicals < 5) //the parent borer no longer has the chemicals required to sustain the sword
		qdel(src)
		return
	else
		parent_borer.chemicals -= 5
		sleep(10)


/obj/item/tool/hammer/homewrecker/cult/bonehammer
	name = "bone hammer"
	desc = "A large growth that appears to be made of solid bone. It looks heavy."
	icon = 'modular_sojourn/Borers/icons/bonehammer.dmi'
	icon_state = "bonehammer"
	hitsound = 'sound/weapons/heavysmash.ogg'
	force = WEAPON_FORCE_LETHAL
	slot_flags = null
	armor_penetration = ARMOR_PEN_EXTREME
	throwforce = null
	matter = list(MATERIAL_BONE = 30)
	throw_speed = 1
	throw_range = 7
	w_class = ITEM_SIZE_BULKY
	structure_damage_factor = STRUCTURE_DAMAGE_BREACHING
	tool_qualities = list(QUALITY_HAMMERING = 45)
	attack_verb = list("bludgeons", "smashes", "pummels", "crushes", "slams")

	var/mob/living/simple_animal/borer/parent_borer = null

/obj/item/tool/hammer/homewrecker/cult/bonehammer/New(atom/A, var/p_borer = null)
	..(A)
	if(istype(p_borer, /mob/living/simple_animal/borer))
		parent_borer = p_borer
	if(!parent_borer)
		qdel(src)
	else
		START_PROCESSING(SSobj, src)

/obj/item/tool/hammer/homewrecker/cult/bonehammer/Destroy()
	if(parent_borer)
		if(parent_borer.channeling_bone_hammer)
			parent_borer.channeling_bone_hammer = 0
		if(parent_borer.channeling)
			parent_borer.channeling = 0
		parent_borer = null
	STOP_PROCESSING(SSobj, src)
	..()

/obj/item/tool/hammer/homewrecker/cult/bonehammer/Process()
	set waitfor = 0
	if(!parent_borer)
		return
	if(!parent_borer.channeling_bone_hammer) //the borer has stopped sustaining the hammer
		qdel(src)
	if(parent_borer.chemicals < 10) //the parent borer no longer has the chemicals required to sustain the hammer
		qdel(src)
	else
		parent_borer.chemicals -= 10
		sleep(10)


/obj/item/shield/riot/bone
	name = "bone shield"
	desc = "A somewhat gruesome shield that appears to be made of solid bone."
	icon = 'modular_sojourn/Borers/icons/boneshield.dmi'
	icon_state = "boneshield"
	siemens_coefficient = 0
	slot_flags = null

	var/mob/living/simple_animal/borer/parent_borer = null

/obj/item/shield/riot/bone/New(atom/A, var/p_borer = null)
	..(A)
	if(istype(p_borer, /mob/living/simple_animal/borer))
		parent_borer = p_borer
	if(!parent_borer)
		qdel(src)
	else
		START_PROCESSING(SSobj, src)

/obj/item/shield/riot/bone/Destroy()
	if(parent_borer)
		if(parent_borer.channeling_bone_shield)
			parent_borer.channeling_bone_shield = 0
		if(parent_borer.channeling)
			parent_borer.channeling = 0
		parent_borer = null
	STOP_PROCESSING(SSobj, src)
	..()

/obj/item/shield/riot/bone/Process()
	set waitfor = 0
	if(!parent_borer)
		return
	if(!parent_borer.channeling_bone_shield) //the borer has stopped sustaining the sword
		qdel(src)
		return
	if(parent_borer.chemicals < 3) //the parent borer no longer has the chemicals required to sustain the shield
		qdel(src)
		return
	else
		parent_borer.chemicals -= 3


/obj/structure/bone_cocoon
	name = "bone cocoon"
	desc = "A large cocoon that appears to be made of solid bone."
	icon = 'modular_sojourn/Borers/icons/bonecocoon.dmi'
	icon_state = "bonecocoon"
	density = 1
	anchored = 0
	var/mob/living/simple_animal/borer/parent_borer = null

/obj/structure/bone_cocoon/ex_act(var/severity)
	// same explosion invulnerability as the freezer
	var/list/bombs = search_contents_for(/obj/item/device/transfer_valve)
	if(!isemptylist(bombs))
		..(severity)
	return 0

/obj/structure/bone_cocoon/New(atom/A, var/p_borer = null)
	..(A)
	if(istype(p_borer, /mob/living/simple_animal/borer))
		parent_borer = p_borer
	if(!parent_borer)
		qdel(src)
	else
		START_PROCESSING(SSobj, src)

/obj/structure/bone_cocoon/Destroy()
	if(parent_borer)
		if(parent_borer.channeling_bone_cocoon)
			parent_borer.channeling_bone_cocoon = 0
		if(parent_borer.channeling)
			parent_borer.channeling = 0
		parent_borer = null
	STOP_PROCESSING(SSobj, src)
	for(var/atom/movable/I in contents)
		I.forceMove(get_turf(src))
	src.visible_message("<span class='notice'>\The [src] crumbles into nothing.</span>")
	..()

/obj/structure/bone_cocoon/Process()
	set waitfor = 0
	if(!parent_borer)
		return
	if(!parent_borer.channeling_bone_cocoon) //the borer has stopped sustaining the cocoon
		qdel(src)
	if(parent_borer.chemicals < 10) //the parent borer no longer has the chemicals required to sustain the cocoon
		qdel(src)
	else
		parent_borer.chemicals -= 10
		sleep(10)
