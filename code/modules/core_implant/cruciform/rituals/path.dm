//////////////////////////////////////////////////
/////////         TESSELLATE             /////////
//////////////////////////////////////////////////

/datum/ritual/cruciform/tessellate
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/tessellate
	category = "Tessellate"

/datum/ritual/targeted/cruciform/tessellate
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/tessellate
	category = "Tessellate"

/datum/ritual/cruciform/tessellate/heal_heathen_special
	name = "Graceful Repose"
	phrase = "Favus mellis composita verba; dulcedo animae sanitas ossium." //"Gracious words are a honeycomb, sweet to the soul and healing to the bones."
	desc = "A litany that heals the mind and body of esoteric maladies such as genetic malignance or brain damage. However it requires them to be awake and able to hear you. This litany requires alot of power and needs a quarter of an hour to recharge."
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	cooldown_category = "grepose"
	power = 60

/datum/ritual/cruciform/tessellate/heal_heathen_special/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	var/list/people_around = list()
	for(var/mob/living/carbon/human/H in view(user))
		if(H != user && !isdeaf(H))
			people_around.Add(H)

	if(people_around.len > 0)
		to_chat(user, SPAN_NOTICE("Your feel the air thrum with an inaudible vibration."))
		playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
		for(var/mob/living/carbon/human/participant in people_around)
			to_chat(participant, SPAN_NOTICE("You hear a silent signal..."))
			heal_other(participant)
			add_effect(participant, FILTER_HOLY_GLOW, 25)
		set_personal_cooldown(user)
		return TRUE
	else
		fail("Your cruciform sings, alone, unto the void.", user, C)
		return FALSE

/datum/ritual/cruciform/tessellate/heal_heathen_special/proc/heal_other(mob/living/carbon/human/participant)
	to_chat(participant, "<span class='info'>A sensation of relief bathes you, washing away your most of your pain in body and mind</span>")
	participant.reagents.add_reagent("laudanum", 10)
	participant.adjustCloneLoss(-20)
	participant.unnatural_mutations.removeAllMutations() //Just like a genetics purger
	participant.unnatural_mutations.total_instability = 0
	var/mob/living/carbon/human/H = participant
	var/obj/item/organ/internal/I = H.random_organ_by_process(BP_BRAIN)
	if(I && istype(I))
		var/list/brain_wounds = I.GetComponents(/datum/component/internal_wound)  //Remove all wounds before doing the adjustBrainLoss
		if(brain_wounds && brain_wounds.len)
			for (var/datum/component/internal_wound/W in brain_wounds)
				I.remove_wound(W)
	participant.adjustBrainLoss(-20)
	participant.updatehealth()

/datum/ritual/cruciform/tessellate/heal_heathen_improved
	name = "Healing Word"
	phrase = "Ita ut in plateas ejicerent infirmos, et ponerent in lectulis et grabatis, ut, veniente Petro, saltem umbra illius obumbraret quemquam illorum, et liberarentur ab infirmitatibus suis." //"As a result, people brought the sick into the streets and laid them on beds and mats so that at least Peter’s shadow might fall on some of them as he passed by."
	desc = "Heal every person who can see and hear you for a fair amount, even if they do not have a cruciform. This prayer uses alot of power and requires 15 minutes to pass before it or the less powerful Divine Hymn can be used again."
	cooldown = TRUE
	power = 50
	cooldown_time = 15 MINUTES
	cooldown_category = "dhymn" //It shares a cooldown because it replaces divine hymn, not adds atop it.

/datum/ritual/cruciform/tessellate/heal_heathen_improved/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	var/list/people_around = list()
	for(var/mob/living/carbon/human/H in view(user))
		if(H != user)
			people_around.Add(H)

	if(people_around.len > 0)
		to_chat(user, SPAN_NOTICE("Your feel the air thrum with an inaudible vibration."))
		playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
		for(var/mob/living/carbon/human/participant in people_around)
			to_chat(participant, SPAN_NOTICE("You hear a silent signal..."))
			heal_other(participant)
			add_effect(participant, FILTER_HOLY_GLOW, 25)
		set_personal_cooldown(user)
		return TRUE
	else
		fail("Your cruciform sings, alone, unto the void.", user, C)
		return FALSE

/datum/ritual/cruciform/tessellate/heal_heathen_improved/proc/heal_other(mob/living/carbon/human/participant)
		to_chat(participant, "<span class='info'>A sensation of relief bathes you, washing away your some of your pain</span>")
		participant.reagents.add_reagent("anodyne", 10)
		participant.adjustBruteLoss(-20)
		participant.adjustFireLoss(-20)
		participant.adjustOxyLoss(-40)
		participant.adjustBrainLoss(-5)
		participant.updatehealth()

/datum/ritual/cruciform/tessellate/true_relief
	name = "True Relief"
	phrase = "Bibant, et obliviscantur egestatis suae, et doloris sui non recordentur amplius." //"Let them drink and forget their poverty and remember their misery no more."
	desc = "Litany often used by Tessellates when preparing a patient for surgery if complete anesthesia isn't available. Relieves the pain of the person in front of you, and makes them feel a bit trippy. More powerful than Word of Mercy, which it shares a 5 minute cooldown with."
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	cooldown_category = "wmercy" //Shared with Word of Mercy
	power = 40

/datum/ritual/cruciform/tessellate/true_relief/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T)
		fail("No target in front of you.", user, C)
		return FALSE
	to_chat(T, SPAN_NOTICE("You feel much better as your pain eases."))
	to_chat(user, SPAN_NOTICE("You ease the pain of [T.name]."))

	T.reagents.add_reagent("myrrh", 10)

	return TRUE

/datum/ritual/cruciform/tessellate/superstable //More powerful version of Absolution of Wounds, lacks inaprov but does some basic healing over time. No cooldown, but chems will OD if spammed on a patient.
	name = "Spare the Dying"
	phrase = "Et tenens manum puellae, ait illi: Talitha cumi, quod est interpretatum: Puella (tibi dico), surge." //" He took her by the hand and said to her, “Talitha koum!” (which means “Little girl, I say to you, get up!”)."
	desc = "Stabilizes the health of the person in front of you and begins the process of healing. Holy chemicals can still overdose, beware of using this too much on a single person."
	power = 25

/datum/ritual/cruciform/tessellate/superstable/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C,list/targets)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T)
		fail("No target in front of you.", user, C)
		return FALSE

	to_chat(T, SPAN_NOTICE("You feel divine life flowing through your veins."))
	to_chat(user, SPAN_NOTICE("You stabilize [T.name]'s health."))

	T.reagents.add_reagent("anodyne", 10)
	T.reagents.add_reagent("holydexalinp", 10)
	T.reagents.add_reagent("holytricord", 10)
	T.reagents.add_reagent("holydylo", 10)
	T.reagents.add_reagent("holycilin", 10)
	T.reagents.add_reagent("holyquickclot", 10) //Enough to OD for the better effect

	return TRUE

/datum/ritual/cruciform/tessellate/realignment
	name = "Realignment"
	phrase = "Omnia mihi licent, sed non omnia expediunt: omnia mihi licent, sed ego sub nullis redigar potestate." //"“I have the right to do anything,” you say—but not everything is beneficial. “I have the right to do anything”—but I will not be mastered by anything."
	desc = "Heals all toxins and liver damage, purges all toxic chemical reagents and stimulants in the blood stream, and slows down anyone in front of you while curing all addictions."
	power = 60
	cooldown_time = 15 MINUTES
	cooldown_category = "realignment"

/datum/ritual/cruciform/tessellate/realignment/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T)
		fail("No target in front of you.", user, C)
		return FALSE
	to_chat(T, SPAN_NOTICE("You feel yourself growing more focused with each passing second."))
	to_chat(user, SPAN_NOTICE("You grant [T.name] cleansing."))

	T.reagents.add_reagent("alignitol", 10)
	set_personal_cooldown(user)

	return TRUE

/datum/ritual/cruciform/tessellate/omnitool
	name = "Touch of the Bleeding-Heart"
	phrase = "Exaudi clamorem meum, et amplius noli pati." //"Hear my cry, and suffer no more."
	desc = "Channels the power of your cruciform into an incorporeal omnitool."
	power = 40
	cooldown = TRUE
	cooldown_time = 2 MINUTES
	cooldown_category = "omnitool_litany"
	success_message = "Your hand glows with holy light, and you feel more in tune with the workings of flesh."

/datum/ritual/cruciform/tessellate/omnitool/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	var/stat_bio = 25
	var/stat_cog = 25
	var/obj/item/tool/tessellate_omni/tool = new /obj/item/tool/tessellate_omni(src, user)
	if (user.stats.getStat(STAT_BIO) > 32)
		stat_bio = user.stats.getStat(STAT_BIO) * 0.8
		if (user.stats.getStat(STAT_BIO) > 62)
			stat_bio = 50
	if (user.stats.getStat(STAT_COG) > 32)
		stat_cog = user.stats.getStat(STAT_COG) * 0.8
		if (user.stats.getStat(STAT_COG) > 62)
			stat_cog = 50
	tool.tool_qualities = list(QUALITY_CLAMPING = stat_bio, QUALITY_CAUTERIZING = stat_bio, QUALITY_RETRACTING = stat_bio, QUALITY_DRILLING = stat_cog, QUALITY_SAWING = stat_cog, QUALITY_BONE_SETTING = stat_bio, QUALITY_CUTTING = stat_cog, QUALITY_BONE_GRAFTING = stat_bio)
	usr.put_in_active_hand(tool)
	set_personal_cooldown(user)
	return TRUE

//////////////////////////////////////////////////
/////////         LEMNISCATE             /////////
//////////////////////////////////////////////////

/datum/ritual/cruciform/lemniscate
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/lemniscate
	category = "Lemniscate"

/datum/ritual/targeted/cruciform/lemniscate
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/lemniscate
	category = "Lemniscate"

/datum/ritual/cruciform/lemniscate/long_boost
	name = "Long boost ritual"
	phrase = null
	desc = "This litany boosts the stats of everyone who's hear you on the short time."
	cooldown = TRUE
	cooldown_time = 2 MINUTES
	effect_time = 30 MINUTES
	cooldown_category = "short_boost"
	category = "Lemniscate"
	power = 50
	var/list/stats_to_boost = list()

/datum/ritual/cruciform/lemniscate/long_boost/New()
	..()
	desc = "This litany boosts [get_stats_to_text()] stats of everyone who hears you for thirty minutes."

/datum/ritual/cruciform/lemniscate/long_boost/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	var/list/people_around = list()
	for(var/mob/living/carbon/human/H in view(user))
		if(H != user && !isdeaf(H))
			people_around.Add(H)

	if(people_around.len > 0)
		to_chat(user, SPAN_NOTICE("Your feel the air thrum with an inaudible vibration."))
		playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
		for(var/mob/living/carbon/human/participant in people_around)
			to_chat(participant, SPAN_NOTICE("You hear a silent signal..."))
			give_boost(participant)
			add_effect(participant, FILTER_HOLY_GLOW, 25)
		set_global_cooldown()
		return TRUE
	else
		fail("Your cruciform sings, alone, unto the void.", user, C)
		return FALSE


/datum/ritual/cruciform/lemniscate/long_boost/proc/give_boost(mob/living/carbon/human/participant)
	for(var/stat in stats_to_boost)
		var/amount = stats_to_boost[stat]
		participant.stats.addTempStat(stat, amount, effect_time, src.name)
		addtimer(CALLBACK(src, PROC_REF(take_boost), participant, stat, amount), effect_time)
	spawn(30)
		to_chat(participant, SPAN_NOTICE("A wave of dizziness washes over you and your mind is filled with a sudden insight into [get_stats_to_text()]."))


/datum/ritual/cruciform/lemniscate/long_boost/proc/take_boost(mob/living/carbon/human/participant, stat, amount)
	to_chat(participant, SPAN_WARNING("Your knowledge of [get_stats_to_text()] feels lessened."))

/datum/ritual/cruciform/lemniscate/long_boost/proc/get_stats_to_text()
	if(stats_to_boost.len == 1)
		return lowertext(stats_to_boost[1])
	var/stats_text = ""
	for(var/i = 1 to stats_to_boost.len)
		var/stat = stats_to_boost[i]
		if(i == stats_to_boost.len)
			stats_text += " and [stat]"
			continue
		if(i == 1)
			stats_text += "[stat]"
		else
			stats_text += ", [stat]"
	return lowertext(stats_text)

/datum/ritual/cruciform/lemniscate/long_boost/mental
	name = "Sanctorum of Life"
	phrase = "Formavit igitur Dominus Deus hominem de limo terrae, et inspiravit in faciem ejus spiraculum vitae, et factus est homo in animam viventem." //"Then the Lord God formed a man from the dust of the ground and breathed into his nostrils the breath of life, and the man became a living being."
	stats_to_boost = list(STAT_MEC = 15, STAT_COG = 15, STAT_BIO = 15)

/datum/ritual/cruciform/lemniscate/long_boost/physical
	name = "Pilgrim's Path"
	phrase = "Dominus, ait, in cujus conspectu ambulo, mittet angelum suum tecum, et diriget viam tuam." //"He replied, ‘The Lord, before whom I have walked faithfully, will send his angel with you and make your journey a success.'"
	stats_to_boost = list(STAT_ROB = 15, STAT_TGH = 15, STAT_VIG = 15)

/datum/ritual/cruciform/lemniscate/holy_boost
	name = "Bolster the Fellowship"
	phrase = "Benedicat tibi Dominus, et custodiat te. Ostendat Dominus faciem suam tibi, et misereatur tui. Convertat Dominus vultum suum ad te, et det tibi pacem." //“The Lord bless you and keep you; the Lord make his face shine on you and be gracious to you; the Lord turn his face toward you and give you peace.”
	var/stats_to_boost = list(STAT_MEC = 10, STAT_COG = 10, STAT_BIO = 10, STAT_ROB = 10, STAT_TGH = 10, STAT_VIG = 10)
	cooldown = TRUE
	cooldown_time = 2 MINUTES
	effect_time = 30 MINUTES
	desc = "This litany boosts all the stats of all disciples who hear you for thirty minutes, but has no effect on those without cruciforms."

/datum/ritual/cruciform/lemniscate/holy_boost/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	var/list/people_around = list()
	for(var/mob/living/carbon/human/H in view(user))
		if(H != user && !isdeaf(H) && is_neotheology_disciple(H)) //This one only for the homies
			people_around.Add(H)

	if(people_around.len > 0)
		to_chat(user, SPAN_NOTICE("Your feel the air thrum with an inaudible vibration."))
		playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
		for(var/mob/living/carbon/human/participant in people_around)
			to_chat(participant, SPAN_NOTICE("You hear a silent signal..."))
			give_boost(participant)
			add_effect(participant, FILTER_HOLY_GLOW, 25)
		set_global_cooldown()
		return TRUE
	else
		fail("Your cruciform sings, alone, unto the void.", user, C)
		return FALSE

/datum/ritual/cruciform/lemniscate/holy_boost/proc/give_boost(mob/living/carbon/human/participant)
	for(var/stat in stats_to_boost)
		var/amount = stats_to_boost[stat]
		participant.stats.addTempStat(stat, amount, effect_time, src.name)
		addtimer(CALLBACK(src, PROC_REF(take_boost), participant, stat, amount), effect_time)
	spawn(30)
		to_chat(participant, SPAN_NOTICE("The power of the Absolute infuses you, and you feel divine will guiding your hand in all that you do."))


/datum/ritual/cruciform/lemniscate/holy_boost/proc/take_boost(mob/living/carbon/human/participant, stat, amount)
	to_chat(participant, SPAN_WARNING("You feel the power that guided you fade away, leaving you with only your own skills."))


/datum/ritual/targeted/cruciform/lemniscate/food_for_the_masses
	name = "Food for the Masses"
	phrase = "Sive ergo manducatis sive bibitis vel aliud quid facitis omnia in gloriam Dei facite." //"So whether you eat or drink or whatever you do, do it all for the glory of God."
	desc = "You call upon the churches limited fabrication abilities, creating a lunch box that contains special upgraded food for you and others. While not particularly nutritious, it is packed with \
	healing chemicals and stimulants. The strain of using this litany, however, forces the speaker to wait a minimum of an hour to use it again."
	cooldown = TRUE
	power = 25 //Limited primarily by its cooldown, cost doesn't need to be super high
	cooldown_time = 60 MINUTES
	cooldown_category = "food_masses"

/datum/ritual/targeted/cruciform/lemniscate/food_for_the_masses/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C,list/targets)
	new /obj/item/storage/lunchbox/lemniscate/full(usr.loc)
	to_chat(user, SPAN_NOTICE("A lemniscate branded lunchbox that smells delicious appears at your feet, still warm and fresh from the kitchens!"))
	set_personal_cooldown(user)
	return TRUE



//////////////////////////////////////////////////
/////////         MONOMIAL               /////////
//////////////////////////////////////////////////

/datum/ritual/cruciform/monomial
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/monomial
	fail_message = "The Cruciform feels cold against your chest."
	category = "Monomial"

/datum/ritual/targeted/cruciform/monomial
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/monomial
	category = "Monomial"

/datum/ritual/cruciform/monomial/ironskin
	name = "Resolution"
	phrase = "Dominus virtutem populo suo dabit; Dominus benedicet populo suo in pace." //"The Lord gives strength to his people; the Lord blesses his people with peace."
	desc = "A short litany that removes all pain and minorly heals the speaker. It is much stronger than the relief litany, but requires more power and has a five minute recharge time between uses."
	power = 90 //Powerful combat litany, should use everything a non-Prime monomial has
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	cooldown_category = "monopain"
	ignore_stuttering = TRUE

/datum/ritual/cruciform/monomial/ironskin/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/cruciform/C)
	H.reagents.add_reagent("nepenthe", 10)
	H.adjustBruteLoss(-10)
	H.adjustFireLoss(-10)
	H.adjustOxyLoss(-20)
	H.adjustBrainLoss(-5)
	H.updatehealth()
	set_personal_cooldown(H)
	return TRUE

/datum/ritual/cruciform/monomial/perfect_self
	name = "Perfect Self"
	phrase = "Quaerite primum regnum Dei et iustitiam eius, et haec omnia adicientur vobis." //"But seek first his kingdom and his righteousness, and all these things will be given to you as well."
	desc = "A solemn prayer, often spoken in a whisper that allows a disciple to focus inward and reach their full potential in both body and mind. This litany lasts fifteen minutes and takes over half an hour before it can be used again."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "pself"
	effect_time = 15 MINUTES
	power = 90

/datum/ritual/cruciform/monomial/perfect_self/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	user.stats.addTempStat(STAT_TGH, 10, effect_time)
	user.stats.addTempStat(STAT_ROB, 10, effect_time)
	user.stats.addTempStat(STAT_VIG, 10, effect_time)
	user.stats.addTempStat(STAT_COG, 10, effect_time)
	user.stats.addTempStat(STAT_BIO, 10, effect_time)
	user.stats.addTempStat(STAT_MEC, 10, effect_time)
	to_chat(user, SPAN_NOTICE("You feel at peace with yourself, your body and mind going beyond their limits."))
	set_personal_cooldown(user)
	addtimer(CALLBACK(src, PROC_REF(discard_effect), user), src.cooldown_time)
	return TRUE

/datum/ritual/cruciform/monomial/perfect_self/proc/discard_effect(mob/living/carbon/human/user, amount)
	to_chat(user, SPAN_NOTICE("You feel the divine peace receeding as your body and mind return to their normal state."))

/datum/ritual/cruciform/monomial/inner_peace
	name = "Inner Peace"
	phrase = "Ferrum ferro exacuitur, et homo exacuit faciem amici sui." //"As iron sharpens iron, so one person sharpens another."
	desc = "You impart a portion of your inner peace on another, easing their mind from the troubles of this world. In doing so, you sacrifice some of your own mental health. Requires two minutes between uses, and can only be used by organics on organics."
	cooldown = TRUE
	cooldown_time = 2 MINUTES
	cooldown_category = "succour"
	power = 40

/datum/ritual/cruciform/monomial/inner_peace/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C,list/targets)
	var/mob/living/carbon/human/H = get_front_human_in_range(user, 1)

	if(!istype(H))
		fail("Target not found.",user,C,targets)
		return FALSE

	//Checking turfs allows this to be done in unusual circumstances, like if both are inside the same mecha
	var/turf/T = get_turf(user)
	if (!(T.Adjacent(get_turf(H))))
		to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
		return

	user.visible_message("[user] lays their hand on [H]'s chest and chants the words of inner peace.", "You lay your hands upon [H] and chant the words of inner peace.")
	if (do_after(user, 20, H, TRUE))
		T = get_turf(user)
		if (H.species?.reagent_tag == IS_SYNTHETIC)
			fail("The target is synthetic and cannot benefit from inner peace.", user, C)
			return FALSE
		if (user.species?.reagent_tag == IS_SYNTHETIC)
			fail("You are synthetic and cannot provide inner peace.", user, C)
			return FALSE
		if (!(T.Adjacent(get_turf(H))))
			fail("[H] is beyond your reach..", user, C)
			return FALSE
		to_chat(H, "<span class='info'>As a mountain of of faith is shared with you a senstation of calmness and focus settles in.</span>")
		H.sanity.changeLevel(40)
		H.updatehealth()
		user.sanity.changeLevel(-20)
		user.updatehealth()
		set_personal_cooldown(user)
		return TRUE

/datum/ritual/cruciform/monomial/bulwark_of_harmony
	name = "Bulwark of Harmony"
	phrase = "Unde bella et lites inter vos? Nonne ex concupiscentiis vestris quae militant in vobis?" //"What causes fights and quarrels among you? Don’t they come from your desires that battle within you?"
	desc = "A litany fashioned after the idea that body and mind can be a fixed point, resisting change in all ways. For a single minute, the speaker slows down drastically, but reduces all damage they \
	may recieve by half, letting them remain as they are for longer."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "bulwark_of_harmony"
	effect_time = 1 MINUTES
	power = 60
	/*var/brute_mod_monomial
	var/burn_mod_monomial
	var/toxin_mod_monomial
	var/oxygen_mod_monomial*/

/datum/ritual/cruciform/monomial/bulwark_of_harmony/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)

	/*brute_mod_monomial = (user.brute_mod_perk * 0.5)
	user.brute_mod_perk -= brute_mod_monomial

	burn_mod_monomial = (user.burn_mod_perk * 0.5)
	user.burn_mod_perk -= burn_mod_monomial

	toxin_mod_monomial = (user.toxin_mod_perk * 0.5)
	user.toxin_mod_perk -= toxin_mod_monomial

	oxygen_mod_monomial = (user.oxy_mod_perk * 0.5)
	user.oxy_mod_perk -= oxygen_mod_monomial*/

	user.brute_mod_perk *= 0.5
	user.burn_mod_perk *= 0.5
	user.toxin_mod_perk *= 0.5
	user.oxy_mod_perk *= 0.5

	user.added_movedelay += 5

	to_chat(user, SPAN_NOTICE("You feel your body stiffening, your stout refusal to change slowing down the world around you as you remain at a fixed point."))
	set_personal_cooldown(user)
	addtimer(CALLBACK(src, PROC_REF(discard_effect), user), src.effect_time)
	return TRUE

/datum/ritual/cruciform/monomial/bulwark_of_harmony/proc/discard_effect(mob/living/carbon/human/user, amount)
	to_chat(user, SPAN_NOTICE("Your body quickens as you slip once more into the flow of normal spacetime."))
	/*user.brute_mod_perk += brute_mod_monomial
	user.burn_mod_perk += burn_mod_monomial
	user.toxin_mod_perk += toxin_mod_monomial
	user.oxy_mod_perk += oxygen_mod_monomial*/
	user.brute_mod_perk /= 0.5
	user.burn_mod_perk /= 0.5
	user.toxin_mod_perk /= 0.5
	user.oxy_mod_perk /= 0.5
	user.added_movedelay -= 5

//////////////////////////////////////////////////
/////////         DIVISOR                /////////
//////////////////////////////////////////////////

/datum/ritual/cruciform/divisor
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/divisor
	category = "Divisor"

/datum/ritual/targeted/cruciform/divisor
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/divisor
	category = "Divisor"

/datum/ritual/targeted/cruciform/divisor/spawn_con
	name = "Canticle of Defense"
	phrase = "At illi dixerunt: Nihil. Dixit ergo eis: Sed nunc qui habet sacculum, tollat; similiter et peram: et qui non habet, vendat tunicam suam et emat gladium." //"He said to them, “But now if you have a purse, take it, and also a bag; and if you don’t have a sword, sell your cloak and buy one."
	desc = "Request a Counselor taser, absolutism tactical belt, and divisor garb from the church armory for defending yourself and your fellow disciples. Establishing the connection takes a lot of power and this litany may only be used once every four hours."
	power = 20 //Balanced mainly by 4 hour cooldown
	cooldown = TRUE
	cooldown_time = 4 HOURS
	cooldown_category = "cdefn"

/datum/ritual/targeted/cruciform/divisor/spawn_con/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C,list/targets)
	new /obj/item/gun/energy/taser(usr.loc)
	new /obj/item/cell/medium/neotheology(usr.loc)
	new /obj/item/storage/belt/security/neotheology(usr.loc)
	new /obj/item/clothing/head/rank/divisor(usr.loc)
	new /obj/item/clothing/suit/greatcoat/divisor(usr.loc)
	set_personal_cooldown(user)
	return TRUE

/datum/ritual/cruciform/divisor/echo_of_blasphemy
	name = "Echo of Blasphemy"
	phrase = "Ignem veni mittere in terram, et quid volo nisi ut accendatur?" //"I have come to bring fire on the earth, and how I wish it were already kindled!"
	desc = "Sets alight and burns anything around you without a cruciform. This litany can only be used once every minute."
	cooldown = TRUE
	cooldown_time = 1 MINUTES
	cooldown_category = "flames_of_fate"
	power = 10

/datum/ritual/cruciform/divisor/echo_of_blasphemy/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	playsound(user.loc, 'sound/effects/cascade.ogg', 65, 1)
	log_and_message_admins("performed an echo_of_blasphemy")
	for(var/mob/living/victim in oview(2))
		if(!victim.get_core_implant(/obj/item/implant/core_implant/cruciform))
			to_chat(victim, SPAN_WARNING("A blast of heat and embers hit you!"))
			victim.adjust_fire_stacks(5)
			victim.IgniteMob()
			victim.adjustFireLoss(30)
	set_personal_cooldown(user)
	return TRUE

/datum/ritual/cruciform/divisor/probability_coefficient
	name = "Probability Coefficient"
	phrase = "Parasti in conspectu meo mensam adversus eos qui tribulant me." //"You prepare a table before me in the presence of my enemies."
	desc = "A more powerful version of the danger detection litany, developed by Augustine for the Divisors when the threat of carrion first came to the attention of the Church. It can tell a Divisor just how many foes they are facing, their general types, and whether they are within seven meters. It can also detect the presence of the foul carrion, within or without a host."
	power = 30 //This isn't particularly strong
	var/longrange = 14 //The actual range of the litany
	var/closerange = 7 //The range that the litany considers "close"

/datum/ritual/cruciform/divisor/probability_coefficient/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/cruciform/C)
	var/was_triggered = FALSE
	var/howfar
	var/spiders = 0
	var/spidersclose = 0
	var/roaches = 0
	var/roachesclose = 0
	var/termites = 0
	var/termitesclose = 0
	var/ameridian = 0
	var/ameridianclose = 0
	var/psionic = 0
	var/psionicclose = 0
	var/other = 0
	var/otherclose = 0
	var/simples = 0
	var/simplesclose = 0
	var/traps
	var/carrion
	log_and_message_admins("performed empowered reveal litany")
	for(var/mob/living/carbon/superior_animal/S in range(longrange, H))
		if (S.stat != DEAD)
			if(!S.friendly_to_colony) //if something's friendly to the colony e.g. the Commander's beacon roach we don't care
				was_triggered = TRUE
				howfar = get_dist(H.loc, S.loc)
				switch(S.faction)
					if("roach")
						roaches += 1
						if(howfar <= closerange)
							roachesclose += 1
					if("spiders")
						spiders += 1
						if(howfar <= closerange)
							roachesclose += 1
					if("ameridian")
						ameridian += 1
						if(howfar <= closerange)
							ameridianclose += 1
					if("wurm")
						termites += 1
						if(howfar <= closerange)
							termitesclose += 1
					if("psi_monster")
						psionic += 1
						if(howfar <= closerange)
							S.alpha = 254 //Reveals cloaked psi creatures within the close radius! 254 because if you set it to 255 the cloaking code just executes again
							psionicclose += 1
					else
						other += 1
						if(howfar <= closerange)
							otherclose += 1

	for (var/mob/living/simple_animal/hostile/S in range(longrange, H))
		if (S.stat != DEAD)
			if(!S.friendly_to_colony) //if something's friendly to the colony e.g. the Commander's beacon roach we don't care
				howfar = get_dist(H.loc, S.loc)
				if(istype(S, /mob/living/simple_animal/spider_core) && howfar >= closerange) //Carrions get detected separately
					was_triggered = TRUE
					carrion = TRUE
				else
					was_triggered = TRUE
					simples += 1
					if(howfar <= closerange)
						simplesclose += 1

	if(locate(/obj/structure/wire_splicing || /obj/item/mine || /obj/item/mine_old || /obj/item/spider_shadow_trap || /obj/item/beartrap || /obj/item/emp_mine || /obj/effect/decal/cleanable/crayon/trap) in view(closerange, H))
		traps = TRUE
		was_triggered = TRUE

	for(var/mob/living/carbon/human/target in range(closerange, H))
		for(var/organ in target.organs)
			if (organ in subtypesof(/obj/item/organ/internal/carrion))
				carrion = TRUE
				was_triggered = TRUE

	if(!was_triggered) //Nothing to see here!
		to_chat(H, SPAN_NOTICE("There is nothing here. You feel safe."))
	else //Bad things around
		var/return_message = ""
		if(roaches)
			return_message += "There are [roaches] giant roaches nearby, [roachesclose] of them are close!.\n"
		if(spiders)
			return_message +="There are [spiders] giant spiders nearby, [spidersclose] of them are close!.\n"
		if(termites)
			return_message += "There are [termites] giant termites nearby, [termitesclose] of them are close!\n"
		if(ameridian)
			return_message += "There are [ameridian] ameridian golems nearby, [ameridianclose] of them are close!\n"
		if(psionic)
			return_message += "There are [psionic] psionic abominations nearby, [psionicclose] of them are close!\n"
		if(simples)
			return_message += "There are [simples] dumb beasts nearby, [simplesclose] of them are close!\n"
		if(traps)
			return_message += "There are potential traps close, but the number of them cannot be determined!\n"
		if(other)
			return_message += "There are [other] unidentifiable threats nearby, [otherclose] of them are close!" //No other threats to add to the return message so we don't add a blank line to the end
		to_chat(H, SPAN_NOTICE("[return_message]."))
		if(carrion) //This one being an antag gets its own red text and second message
			to_chat(H, SPAN_DANGER("A black terrible evil brushes against your mind suddenly, a horrible monstrous entity whose views intelligent beings as prey. You know there is a carrion close."))
	return TRUE

/datum/ritual/cruciform/divisor/divisor_smite
	name = "Divine Smite"
	phrase = "In maxilla asini, in mandibula pulli asinarum, delevi eos, et percussi mille viros." //"With a donkey’s jawbone, I have made donkeys of them. With a donkey’s jawbone, I have killed a thousand men"
	desc = "A short litany spoken in the middle of battle. Gives the speaker additional power and strength when swinging a melee weapon for ninety seconds. Takes five minutes to recharge."
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	cooldown_category = "divisor_smite"
	effect_time = 90 SECONDS
	power = 25
	var/wrath_damage = 0.2

/datum/ritual/cruciform/divisor/divisor_smite/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	user.damage_multiplier += wrath_damage
	to_chat(user, SPAN_NOTICE("You feel divine wrath empowering you with immense but fleeting strength!"))
	set_personal_cooldown(user)
	addtimer(CALLBACK(src, PROC_REF(discard_effect), user), src.effect_time)
	return TRUE

/datum/ritual/cruciform/divisor/divisor_smite/proc/discard_effect(mob/living/carbon/human/user, amount)
	to_chat(user, SPAN_NOTICE("You feel the divine wrath fade, leaving you with only your own strength."))
	user.damage_multiplier -= wrath_damage

/datum/ritual/cruciform/divisor/zoom_litany
	name = "Speed of Battle"
	phrase = "Festinavit David et cucurrit ad pugnam ex adverso Philisthaei." //"David ran quickly toward the battle line to meet him."
	desc = "Empowers the speaker with enhanced movement speed, allowing them to run faster for a short time. To avoid overtaxing the body, this may only be used once every five minutes."
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	effect_time = 1 MINUTES
	power = 25
	cooldown_category = "zoom_litany"

/datum/ritual/cruciform/divisor/zoom_litany/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C,list/targets)
	to_chat(user, "<span class='info'>You feel yourself speeding up, the Absolute speeding you on your way!</span>")
	user.added_movedelay -= 0.5
	set_personal_cooldown(user)
	addtimer(CALLBACK(src, PROC_REF(discard_effect), user), src.effect_time)
	return TRUE

/datum/ritual/cruciform/divisor/zoom_litany/proc/discard_effect(mob/living/carbon/human/user)
	to_chat(user, "You feel yourself slowing down once more.")
	user.added_movedelay += 0.5

//////////////////////////////////////////////////
/////////         FACTORIAL              /////////
//////////////////////////////////////////////////

/datum/ritual/cruciform/factorial
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/factorial
	fail_message = "The cruciform's gears grind to a halt."
	category = "Factorial"

/datum/ritual/targeted/cruciform/factorial
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/factorial
	category = "Factorial"

// Battery Charge
/datum/ritual/cruciform/factorial/charge
	name = "Channel Power"
	desc = "Use the energy in your cruciform to charge the power cell you are holding."
	phrase = "Ex fide ad electricitatem." //"From faith to electricity."
	cooldown = TRUE
	cooldown_time = 0 MINUTES
	cooldown_category = "charging"
	power = 0 // Do not use the power in one shot
	var/charge_used = 10 // Amount of cruciform energy used.
	var/charge_rate = 20 // The delay between each charge? The number is in deciseconds, so 30 is equal to 3 seconds

/datum/ritual/cruciform/factorial/charge/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	set_personal_cooldown(user)
	var/inhand = user.get_active_hand()
	if(istype(inhand, /obj/item/cell))
		var/obj/item/cell/P = inhand
		if(P.max_chargerate == 0) // Can we even charge the damn thing.
			fail("This type of cell cannot be charged.", user, C)
			return
		to_chat(user, "You start charging the [P.name].")
		while(C.power >= charge_used) // Keep going until we run out of power
			if(!istype(user.get_active_hand(), /obj/item/cell)) // Check if we're still holding a cell. Because rigged cell explode when charging.
				break
			if(P.fully_charged()) // Leave the loop if the cell is charged.
				break
			if(do_after(user, charge_rate)) // Small delay where the user must stand still
				if(C.power < charge_used)
					fail("You don't have the power to charge this.", user, C)
					break
				C.power -= charge_used // We use some juicy cruciform power
				P.give(charge_used * 10) // Charge the power cell
			else
				break // Leave the loop if we interrupt.
		to_chat(user, "You finish charging the [P.name]. It is now [P.percent()]% charged.")
	else
		fail("You need a power cell in your active hand to charge it.", user, C)

// Self-Repair
/datum/ritual/cruciform/factorial/self_repair
	name = "Litany of the Iron Soul"
	desc = "Use the energy in your cruciform to repair all mechanical parts on the bearer, be they synthetic limbs or organs. The energy required to do so will knock you down for a few seconds, and lessen your combat capabilities for five minutes."
	phrase = "Absolutas sustentat me." //"The Absolute sustains me."
	cooldown = TRUE
	cooldown_time = 10 MINUTES
	cooldown_category = "repair"
	power = 50
	var/debuff_amount = -5
	var/debuff_length = 5 MINUTES

/datum/ritual/cruciform/factorial/self_repair/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	user.visible_message("<b><font color='red'>[user]'s cruciform glows before they suddenly collapse!</font><b>", "<b><font color='red'>Your feel the air thrum with an inaudible vibration, your cruciform withdrawing everything you have to empower your litany!</font><b>", "<b><font color='red'>You hear a thud!</font><b>")
	var/got_healed = FALSE
	var/list/target_organs = user.organs + user.internal_organs
	for(var/obj/item/organ/internal/I in target_organs) //First check internal organs and repair wounds. This is full aheal level fix for internal wounds, very powerful
		if(I.nature == MODIFICATION_SILICON)
			var/list/current_wounds = I.GetComponents(/datum/component/internal_wound)
			if(current_wounds && current_wounds.len)
				for (var/datum/component/internal_wound/W in current_wounds)
					I.remove_wound(W)
				got_healed = TRUE //We were healed by the litany
			I.heal_damage(20, 20, TRUE)
	for(var/obj/item/organ/external/E in target_organs) //Once the wounds are cleared, check if any external limbs are above the damage that can be repaired without surgery. If so, repair them to one less, allowing finishing work to be done with welder/cable
		if(BP_IS_ROBOTIC(E))
			if(E.burn_dam > ROBOLIMB_SELF_REPAIR_CAP)
				var/repair_amount = E.burn_dam-ROBOLIMB_SELF_REPAIR_CAP + 1
				E.heal_damage(0,repair_amount,TRUE)
				got_healed = TRUE
			if(E.brute_dam > ROBOLIMB_SELF_REPAIR_CAP)
				var/repair_amount = E.brute_dam-ROBOLIMB_SELF_REPAIR_CAP + 1
				E.heal_damage(repair_amount,0,TRUE)
				got_healed = TRUE
	if(!got_healed)
		to_chat(user, "You are not damaged enough for this litany to heal you.")
		return FALSE
	else
		to_chat(user, "Your mechanical organs knit themselves back together. The energy to do so knocks you down, then leaves you in a weakened state for a few minutes.")
		user.weakened = 10 //Hardstun of same strength as psionic healing, but no pain (because organics already aren't getting the full benefit)
		user.stats.addTempStat(STAT_TGH, debuff_amount, debuff_length, src.name)
		user.stats.addTempStat(STAT_ROB, debuff_amount, debuff_length, src.name)
		user.stats.addTempStat(STAT_VIG, debuff_amount, debuff_length, src.name)
		addtimer(CALLBACK(src, PROC_REF(debuff_over), user), debuff_length)
		set_personal_cooldown(user)
		return TRUE

/datum/ritual/cruciform/factorial/self_repair/proc/debuff_over(user)
	to_chat(user, "Your energy returns to you from your self-repairs, leaving you in full fighting shape once more.")

// Mass-Repair
/datum/ritual/cruciform/factorial/mass_repair
	name = "Blessing of the Machine"
	desc = "Use the energy in your cruciform to repair all mechanical parts of those around you, be they synthetic limbs or organs, leaving them in a state where no more than basic repairs will be needed. Impairs the combat abilities of the healed and healer for five minutes, with the amount of impairment to the healer scaling with the number of people healed."
	phrase = "Etiam in his machinis animae sunt." //"Even in these machines there are souls."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "repair"
	power = 50
	var/number_healed = 0 //Number of people healed
	var/debuff_amount_healed = -5 //Amount of penalty given to the VIG, ROB, and TGH of those healed
	var/debuff_length_healed = 5 MINUTES //How long thos healed will have their debuff
	var/debuff_amount_healer = 0 //Amount of penalty given to the VIG, ROB, and TGH of the healer, will scale to number of people healed
	var/debuff_length_healer = 5 MINUTES //How long the healer will have their debuff

/datum/ritual/cruciform/factorial/mass_repair/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	user.visible_message("<b><font color='red'>[user]'s cruciform glows before brightly!</font><b>", "<b><font color='red'>Your feel the air thrum with an inaudible vibration!</font><b>", "<b><font color='red'>You hear a light ticking sound!</font><b>")
	for(var/mob/living/carbon/human/H in oview(user)) // Affect everyone the user can see.
		var/got_healed = FALSE //Were they healed by this litany
		var/list/target_organs = H.organs + H.internal_organs
		for(var/obj/item/organ/internal/I in target_organs) //First check internal organs and repair wounds. This is full aheal level fix for internal wounds, very powerful
			if(I.nature == MODIFICATION_SILICON)
				var/list/current_wounds = I.GetComponents(/datum/component/internal_wound)
				if(current_wounds && current_wounds.len)
					for (var/datum/component/internal_wound/W in current_wounds)
						I.remove_wound(W)
					got_healed = TRUE //We were healed by the litany
				I.heal_damage(20, 20, TRUE)
		for(var/obj/item/organ/external/E in target_organs) //Once the wounds are cleared, check if any external limbs are above the damage that can be repaired without surgery. If so, repair them to one less
			if(BP_IS_ROBOTIC(E))
				if(E.burn_dam > ROBOLIMB_SELF_REPAIR_CAP)
					var/repair_amount = E.burn_dam-ROBOLIMB_SELF_REPAIR_CAP + 1
					E.heal_damage(0,repair_amount,TRUE)
					got_healed = TRUE
				if(E.brute_dam > ROBOLIMB_SELF_REPAIR_CAP)
					var/repair_amount = E.brute_dam-ROBOLIMB_SELF_REPAIR_CAP + 1
					E.heal_damage(repair_amount,0,TRUE)
					got_healed = TRUE
		if(got_healed)
			add_effect(H, FILTER_HOLY_GLOW, 25) // Make them glow.
			to_chat(H, "You feel your robotic body parts mending at [user]'s words! The holy power infusing your systems will interfere with your combat prowess for a few minutes.")
			number_healed += 1
			H.stats.addTempStat(STAT_TGH, debuff_amount_healed, debuff_length_healed, src.name)
			H.stats.addTempStat(STAT_ROB, debuff_amount_healed, debuff_length_healed, src.name)
			H.stats.addTempStat(STAT_VIG, debuff_amount_healed, debuff_length_healed, src.name)
			addtimer(CALLBACK(src, PROC_REF(healed_debuff_over), H), debuff_length_healed)

	if(number_healed > 0)
		debuff_amount_healer = -5 * number_healed
		user.stats.addTempStat(STAT_TGH, debuff_amount_healer, debuff_length_healer, src.name)
		user.stats.addTempStat(STAT_ROB, debuff_amount_healer, debuff_length_healer, src.name)
		user.stats.addTempStat(STAT_VIG, debuff_amount_healer, debuff_length_healer, src.name)
		set_personal_cooldown(user)
		to_chat(user, "You feel your energy flowing into those you have blessed. The drain will significantly interfere with your combat abilities for a few minutes.")
		addtimer(CALLBACK(src, PROC_REF(healer_debuff_over), user), debuff_length_healer)
		return TRUE

/datum/ritual/cruciform/factorial/mass_repair/proc/healed_debuff_over(mob/living/carbon/human/H)
	to_chat(H,"You feel the interference dissipate, leaving you once more at combat readiness.") //Not entirely true if you got this stacked by multiple healers, but if you did that's your problem.


/datum/ritual/cruciform/factorial/mass_repair/proc/healer_debuff_over(mob/living/carbon/human/H)
	to_chat(H,"You feel your energy return to you, leaving you in a combat ready state.")

/datum/ritual/cruciform/factorial/omnitool
	name = "Touch of the Engine-Speaker"
	phrase = "Ferrum, audi verba mea et tactum senties meum." //"Iron, hear my words and feel my touch."
	desc = "Channels the power of your cruciform into an incorporeal omnitool."
	power = 40
	cooldown = TRUE
	cooldown_time = 2 MINUTES
	cooldown_category = "omnitool_litany"
	success_message = "Your hand glows with holy light, and you feel more in tune with the machinery around you."

/datum/ritual/cruciform/factorial/omnitool/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	var/stat_mec = 25
	var/stat_rob = 25
	var/obj/item/tool/factorial_omni/tool = new /obj/item/tool/factorial_omni(src, user)
	if (user.stats.getStat(STAT_MEC) > 32)
		stat_mec = user.stats.getStat(STAT_MEC) * 0.8
		if (user.stats.getStat(STAT_MEC) > 62)
			stat_mec = 50
	if (user.stats.getStat(STAT_ROB) > 32)
		stat_rob = user.stats.getStat(STAT_ROB) * 0.8
		if (user.stats.getStat(STAT_ROB) > 62)
			stat_rob = 50
	tool.tool_qualities = list(QUALITY_SCREW_DRIVING = stat_mec, QUALITY_BOLT_TURNING = stat_mec, QUALITY_DRILLING = stat_mec, QUALITY_WELDING = stat_mec, QUALITY_PRYING = stat_mec, QUALITY_DIGGING = stat_rob, QUALITY_PULSING = stat_mec, QUALITY_WIRE_CUTTING = stat_mec, QUALITY_HAMMERING = stat_rob, QUALITY_SHOVELING = stat_rob, QUALITY_EXCAVATION = stat_rob, QUALITY_SAWING = stat_mec)
	usr.put_in_active_hand(tool)
	set_personal_cooldown(user)
	return TRUE

/datum/ritual/cruciform/factorial/mod_litany
	name = "Hymn of the Engineer"
	phrase = "Per fidem in Absoluto assequi possumus instrumenta servitii." //"Through faith in the Absolute we can obtain the means of service."
	desc = "Requests unique mods or cruciform upgrades from the lower levels. To avoid exhausting supplies, this litany may only be used once every hour. One must still have another perform the rites of installation to upgrade one's cruciform."
	power = 25 //Mainly restricted by its cooldown
	cooldown = TRUE
	cooldown_time = 60 MINUTES
	cooldown_category = "mod_litany"
	success_message = "On the verge of audibility you hear pleasant music. Seemingly working on their own, your hands shape a brand new device."
	var/anti_cheat = FALSE

/datum/ritual/cruciform/factorial/mod_litany/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	if(anti_cheat)
		fail("Your Greed will resault in your downfall. Take your requested item, and wait your turn like the rest.", user, C)
		return FALSE

	anti_cheat = TRUE

	var/response = input(user, "Which upgrade do you require?") in list("Holy Oils", "Righteous Seal", "Nature's Blessing", "Cleansing Presence", "Faith's Shield", "Martyr's Gift", "Wrath of God", "Speed of the Chosen", "Cancel Litany")
	if (response == "Holy Oils")
		new /obj/item/tool_upgrade/augment/holy_oils(user.loc)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Righteous Seal")
		new /obj/item/tool_upgrade/augment/crusader_seal(user.loc)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Nature's Blessing")
		new /obj/item/cruciform_upgrade/natures_blessing(user.loc)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Cleansing Presence")
		new /obj/item/cruciform_upgrade/cleansing_presence(user.loc)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Faith's Shield")
		new /obj/item/cruciform_upgrade/faiths_shield(user.loc)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Martyr's Gift")
		new /obj/item/cruciform_upgrade/martyr_gift(user.loc)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Wrath of God")
		new /obj/item/cruciform_upgrade/wrath_of_god(user.loc)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Speed of the Chosen")
		new /obj/item/cruciform_upgrade/speed_of_the_chosen(user.loc)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Cancel Litany")
		fail("You decide not to obtain church artifice at this time.", user, C)
		anti_cheat = FALSE
		return FALSE
	anti_cheat = FALSE
	return TRUE

/datum/ritual/cruciform/factorial/nodrop_magnet
	name = "Hand of Magnetism"
	phrase = "Ager attractivus operis mei ad se alligavit." //"Field of attraction bound my work to self."
	desc = "Harness the Physics of the Absolute. Items sanctified by the Church you are holding are no longer droppable. \
	Only works with church-based items. \
	If used on an item that already can't be dropped, it will become droppable. \
	Does not work with firearms or cells."//To op to have a no drop on command gun sadly
	power = 15
	cooldown = FALSE
	success_message = "The item that you are holding feels impossible to escape the Physics of the Absolute."

/datum/ritual/cruciform/factorial/nodrop_magnet/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	var/obj/item/O = user.get_active_hand()
	var/success = FALSE
	if(O)
		var/list/can_magnet = list(
			/obj/item/shield/riot/crusader,
			/obj/item/shield/buckler/nt,
			/obj/item/shield/riot/nt,
			/obj/item/tool/factorial_omni,
			/obj/item/tool/spear/halberd,
			/obj/item/tool/knife/dagger/nt,
			/obj/item/tool/sword/crusader,
			/obj/item/storage/firstaid/nt,
			/obj/item/stack/medical/bruise_pack/advanced/nt,
			/obj/item/stack/medical/ointment/advanced/nt,)

		can_magnet += typesof(/obj/item/tool/sword/nt) - /obj/item/tool/sword/nt/longsword/implant
		can_magnet += typesof(/obj/item/tool/knife/neotritual) - /obj/item/tool/knife/neotritual/implant

		for(var/list_item in can_magnet)
			//message_admins("list_item = [list_item] O.type = [O.type]")
			if(list_item == O.type)
				O.canremove = !O.canremove
				success = TRUE
				break
		if(O.canremove)
			success_message = "You destroy the magnetic field binding [O.name] to you."
		else
			success_message = "[O.name] that you are holding feels impossible to let go."

	if(!success && O)
		fail("[O.name] is unable to be magnetized.", user, C)
	if(!O)
		fail("Nothing in hand to magnetize.", user, C)

	return success