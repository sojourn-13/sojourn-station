/datum/ritual/group/cruciform
	implant_type = /obj/item/implant/core_implant/cruciform
	success_message = "On the verge of audibility you hear pleasant music, your mind clears up and the spirit grows stronger. Your prayer was heard."
	fail_message = "The Cruciform feels cold against your chest."
	var/high_ritual = TRUE
//cnt is equal to the number of people FOLLOWING the ritual, not including the speaker. Therefore I adjusted requirements to be one lower and benefits to count as if there was one more.

/datum/ritual/group/cruciform/pre_check(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C, targets)
	if(!..())
		return FALSE
	if(high_ritual && !C.get_module(CRUCIFORM_CLERGY) && !is_inquisidor(user))
		return FALSE
	return TRUE

/datum/ritual/group/cruciform/step_check(mob/living/carbon/human/H)
	for(var/obj/machinery/power/nt_obelisk/O in range(7,H))
		if(O.stat || !O.active || get_dist(H, O) > O.area_radius)
			continue
		return TRUE
	return FALSE

/datum/ritual/group/cruciform/stat//parent ritual
	effect_type = /datum/group_ritual_effect/cruciform/stat

/datum/ritual/group/cruciform/stat/step_check(mob/living/carbon/human/H)
	if(GLOB.miracle_points < 1)
		return FALSE
	return TRUE

/datum/group_ritual_effect/cruciform/stat
	var/stat_buff
	var/buff_value = 3
	var/additional_value = 2
	var/buff_total

/datum/group_ritual_effect/cruciform/stat/trigger_success(var/mob/starter, var/list/participants)
	. = ..()
	GLOB.miracle_points--
	GLOB.grup_ritual_performed++ //I guess here?

/datum/group_ritual_effect/cruciform/stat/success(var/mob/living/M, var/cnt)
	if(cnt < 2 || !stat_buff)
		return
	buff_total = buff_value + (cnt +1) * additional_value
	M.stats.changeStat(stat_buff, buff_total)

/datum/ritual/group/cruciform/stat/mechanical
	name = "Value of Labor"
	desc = "Boosts Mechanical stat to 3 + 2 for each participant permanently, if god wills it."
	phrase = "Filius sapiens laetificat patrem, filius vero stultus moestitia est matris suae." //Proverbs 10:1-5
	phrases = list(
		"Filius sapiens laetificat patrem, filius vero stultus moestitia est matris suae.",
		"Nil proderunt thesauri impietatis, justitia vero liberabit a morte.",
		"Non affliget Dominus fame animam justi, et insidias impiorum subvertet.",
		"Egestatem operata est manus remissa; manus autem fortium divitias parat.",
		"Qui congregat in messe, filius sapiens est; qui autem stertit aestate, filius confusionis.",
		"Amen."
	)
	effect_type = /datum/group_ritual_effect/cruciform/stat/mechanical

/datum/group_ritual_effect/cruciform/stat/mechanical
	stat_buff = STAT_MEC

/datum/ritual/group/cruciform/stat/cognition
	name = "Discovery of the Path"
	desc = "Boosts Cognition stat to 3 + 2 for each participant permanently, if god wills it."
	phrase = "Dedit quoque Deus sapientiam Salomoni et prudentiam multam nimis et latitudinem cordis quasi harenam quae est in litore maris." //1 Kings 4:29-34
	phrases = list(
		"Dedit quoque Deus sapientiam Salomoni et prudentiam multam nimis et latitudinem cordis quasi harenam quae est in litore maris.",
		"Et praecedebat sapientia Salomonis sapientiam omnium Orientalium et Aegyptiorum.",
		"Et erat sapientior cunctis hominibus sapientior Aethan Ezraita et Heman et Chalcal et Dorda filiis Maol et erat nominatus in universis gentibus per circuitum.",
		"Locutus est quoque Salomon tria milia parabolas et fuerunt carmina eius quinque et mille.",
		"Et disputavit super lignis a cedro quae est in Libano usque ad hysopum quae egreditur de pariete et disseruit de iumentis et volucribus et reptilibus et piscibus.",
		"Et veniebant de cunctis populis ad audiendam sapientiam Salomonis et ab universis regibus terrae qui audiebant sapientiam eius.",
		"Amen."
	)
	effect_type = /datum/group_ritual_effect/cruciform/stat/cognition

/datum/group_ritual_effect/cruciform/stat/cognition
	stat_buff = STAT_COG

/datum/ritual/group/cruciform/stat/biology
	name = "Creation of Vitae"
	desc = "Boosts Biology stat to 3 + 2 for each participant permanently, if god wills it."
	phrase = "Convocatis autem duodecim apostolis dedit illis virtutem et potestatem super omnia daemonia et ut languores curarent." //Luke 9:1-6
	phrases = list(
		"Convocatis autem duodecim apostolis dedit illis virtutem et potestatem super omnia daemonia et ut languores curarent.",
		"Et misit illos praedicare regnum Dei et sanare infirmos.",
		"Et ait ad illos nihil tuleritis in via neque virgam neque peram neque panem neque pecuniam neque duas tunicas habeatis.",
		"Et in quamcumque domum intraveritis ibi manete et inde ne exeatis.",
		"Et quicumque non receperint vos exeuntes de civitate illa etiam pulverem pedum vestrorum excutite in testimonium supra illos.",
		"Egressi autem circumibant per castella evangelizantes et curantes ubique.",
		"Amen."
	)
	effect_type = /datum/group_ritual_effect/cruciform/stat/biology

/datum/group_ritual_effect/cruciform/stat/biology
	stat_buff = STAT_BIO

/datum/ritual/group/cruciform/robustness
	name = "Strength of the Absolute"
	desc = "Boosts Robustness stat to 3 + 2 for each participant permanently, if god wills it."
	phrase = "Audi Israhel tu transgredieris hodie Iordanem ut possideas nationes maximas et fortiores te civitates ingentes et ad caelum usque muratas." //Dueteronomy 9:1-6
	phrases = list(
		"Audi Israhel tu transgredieris hodie Iordanem ut possideas nationes maximas et fortiores te civitates ingentes et ad caelum usque muratas.",
		"Populum magnum atque sublimem filios Enacim quos ipse vidisti et audisti quibus nullus potest ex adverso resistere.",
		"Scies ergo hodie quod Dominus Deus tuus ipse transibit ante te ignis devorans atque consumens qui conterat eos et deleat atque disperdat ante faciem tuam velociter sicut locutus est tibi.",
		"Ne dicas in corde tuo com deleverit eos Dominus Deus tuus in conspectu tuo propter iustitiam meam introduxit me Dominus ut terram hanc possiderem com propter impietates suas istae deletae sint nationes.",
		"Neque enim propter iustitias tuas et aequitatem cordis tui ingredieris ut possideas terras eorum sed quia illae egerunt impie te introeunte deletae sunt et ut conpleret verbum suum Dominus quod sub iuramento pollicitus est patribus tuis Abraham Isaac et Iacob.",
		"Scito igitur quod non propter iustitias tuas Dominus Deus tuus dederit tibi terram hanc optimam in possessionem com durissimae cervicis sis populus.",
		"Amen."
	)
	effect_type = /datum/group_ritual_effect/cruciform/stat/robustness

/datum/group_ritual_effect/cruciform/stat/robustness
	stat_buff = STAT_ROB

/datum/ritual/group/cruciform/toughness
	name = "Reclamation of Endurance"
	desc = "Boosts Toughness stat to 3 + 2 for each participant permanently, if god wills it."
	phrase = "In finem psalmus David." //Psalm 19:1-6
	phrases = list(
		"In finem psalmus David.",
		"Caeli enarrant gloriam Dei et opera manuum eius adnuntiat firmamentum.",
		"Dies diei eructat verbum et nox nocti indicat scientiam.",
		"Non sunt loquellae neque sermones quorum non audiantur voces eorum.",
		"In omnem terram exivit sonus eorum et in fines orbis terrae verba eorum.",
		"In sole posuit tabernaculum suum et ipse tamquam sponsus procedens de thalamo suo exultavit ut gigans ad currendam viam.",
		"A summo caeli egressio eius et occursus eius usque ad summum eius nec est qui se abscondat a calore eius.",
		"Amen."
	)
	effect_type = /datum/group_ritual_effect/cruciform/stat/toughness

/datum/group_ritual_effect/cruciform/stat/toughness
	stat_buff = STAT_TGH

/datum/ritual/group/cruciform/crusade
	name = "Call of the Crusade"
	desc = "A litany that may reveal the prayers of crusaders, if enough people participate."
	phrase = "Locutus est Dominus ad Mosen dicens." //Numbers 10:1-9
	phrases = list(
		"Locutus est Dominus ad Mosen dicens.",
		"Fac tibi duas tubas argenteas ductiles quibus convocare possis multitudinem quando movenda sunt castra.",
		"Cumque increpueris tubis congregabitur ad te omnis turba ad ostium foederis tabernaculi.",
		"Si semel clangueris venient ad te principes et capita multitudinis Israhel.",
		"Sin autem prolixior atque concisus clangor increpuerit movebunt castra primi qui sunt ad orientalem plagam.",
		"In secundo autem sonitu et pari ululatu tubae levabunt tentoria qui habitant ad meridiem et iuxta hunc modum reliqui facient ululantibus tubis in profectione.",
		"Quando autem congregandus est populus simplex tubarum clangor erit et non concise ululabunt.",
		"Filii Aaron sacerdotes clangent tubis eritque hoc legitimum sempiternum in generationibus vestris.",
		"Si exieritis ad bellum de terra vestra contra hostes qui dimicant adversum vos clangetis ululantibus tubis et erit recordatio vestri coram Domino Deo vestro ut eruamini de manibus inimicorum vestrorum.",
		"Amen."
	)
	effect_type = /datum/group_ritual_effect/cruciform/crusade

/datum/group_ritual_effect/cruciform/crusade/success(var/mob/living/M, var/cnt)
	log_and_message_admins("is attempting to invoke the Crusader Protocol. If appropriate, assign them and the other participants the Crusader antag role (Currently called Inquisitor).")
	/*if(cnt < 6)
		return
	var/obj/item/implant/core_implant/CI = M.get_core_implant(/obj/item/implant/core_implant/cruciform)
	if(CI)
		var/datum/ritual/cruciform/crusader/C = /datum/ritual/cruciform/crusader/brotherhood
		CI.known_rituals |= initial(C.name)
		C = /datum/ritual/cruciform/crusader/battle_call
		CI.known_rituals |= initial(C.name)
		C = /datum/ritual/cruciform/crusader/flash
		CI.known_rituals |= initial(C.name)*/

/datum/ritual/group/cruciform/sanctify
	name = "Bless Area"
	desc = "Sanctify the land you tread."
	phrase = "Loquere filiis Israel, ut tollant mihi primitias: ab omni homine qui offeret ultroneus, accipietis eas." //Exodus 25:1-8
	phrases = list(
		"Loquere filiis Israel, ut tollant mihi primitias: ab omni homine qui offeret ultroneus, accipietis eas.",
		"Haec sunt autem quae accipere debeatis: aurum, et argentum, et aes.",
		"Hyacinthum et purpuram, coccumque bis tinctum, et byssum, pilos caprarum.",
		"Et pelles arietum rubricatas, pellesque janthinas, et ligna setim.",
		"Oleum ad luminaria concinnanda: aromata in unguentum, et thymiamata boni odoris.",
		"Lapides onychinos, et gemmas ad ornandum ephod, ac rationale.",
		"Facientque mihi sanctuarium, et habitabo in medio eorum.",
		"Amen."
	)
	effect_type = /datum/group_ritual_effect/cruciform/sanctify
	high_ritual = FALSE

/datum/ritual/group/cruciform/sanctify/step_check(mob/living/carbon/human/H)
	return TRUE

/datum/group_ritual_effect/cruciform/sanctify/success(var/mob/living/M, var/cnt)
	..()
	var/area/A = get_area(M)
	var/aoe = 6
	A?.sanctify()
	if(cnt < 2)
		fail("There are not enough disciples praying to bless this land.", M)
		return FALSE
	else
		if (A == /area/deepmaint) //Less effective in the deep maintenance, but more directly useful because holy ground stops psi monsters from spawning for 10 minutes
			aoe = (cnt +1) * 2
			for(var/turf/T in range(M, aoe))
				T.holy = 1
		else
			aoe = (cnt +1) * 3
			for(var/turf/T in range(M, aoe))
				T.holy = 1

/area/proc/sanctify()
	LEGACY_SEND_SIGNAL(src, COMSIG_AREA_SANCTIFY)
	return
