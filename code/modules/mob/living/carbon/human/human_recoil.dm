/mob/living/carbon/human/handle_movement_recoil()
	deltimer(recoil_reduction_timer)

	var/base_recoil = 8

	if(MOVING_DELIBERATELY(src) || src.stats.getPerk(PERK_SURE_STEP))
		base_recoil -= 3

	var/mob/living/carbon/human/H = src
	var/suit_stiffness = 0
	var/uniform_stiffness = 0
	var/back_stiffness = 0
	if(H.wear_suit)
		suit_stiffness = H.wear_suit.stiffness
	if(H.w_uniform)
		uniform_stiffness = H.w_uniform.stiffness
	if(H.back)
		back_stiffness = H.back.stiffness

	//Bolus helps counter this
	if(src.stats.getPerk(PERK_BOLUS_EQUI_AID))
		var/datum/perk/cooldown/bolus_momentiums/TA = src.stats.getPerk(PERK_BOLUS_EQUI_AID)
		if(suit_stiffness)
			suit_stiffness = suit_stiffness / TA.stage
		if(uniform_stiffness)
			uniform_stiffness = uniform_stiffness / TA.stage
		if(back_stiffness)
			back_stiffness = back_stiffness / TA.stage

	base_recoil += back_stiffness + suit_stiffness + suit_stiffness * uniform_stiffness // Wearing it under actual armor, or anything too thick is extremely uncomfortable.

	if(usr.stats.getPerk(PERK_PERFECT_SHOT))
		base_recoil -= 0.4 //less recoil if your a good shot
	if(usr.stats.getPerk(PERK_SMARTLINK))
		base_recoil -= 0.1 //Worse than kriosans but probably enough to matter

	add_recoil(base_recoil)
