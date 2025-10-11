/obj/item/organ/internal/vital/heart
	name = "heart"
	desc = "A small heart, sadly no gold..."
	icon_state = "heart-on"
	organ_efficiency = list(OP_HEART = 100)
	parent_organ_base = BP_CHEST
	dead_icon = "heart-off"
	price_tag = 1200
	specific_organ_size = 2
	max_damage = IORGAN_VITAL_HEALTH
	min_bruised_damage = IORGAN_VITAL_BRUISE
	min_broken_damage = IORGAN_VITAL_BREAK
	oxygen_req = 10
	nutriment_req = 10
	var/open
	w_class = ITEM_SIZE_SMALL

	// Pulse and circulation variables - Ported from Baystation12
	var/pulse = PULSE_NORM
	var/heartbeat = 0
	var/beat_sound = 'sound/effects/singlebeat.ogg'
	var/next_blood_squirt = 0
	var/list/external_pump
	var/thready_pulse_time = 0  // Tracks how long pulse has been at PULSE_THREADY

/obj/item/organ/internal/vital/heart/die()
	// When heart dies, pulse should stop
	pulse = PULSE_NONE
	thready_pulse_time = 0  // Reset counter
	if(owner)
		owner.pulse = PULSE_NONE  // Sync to owner for scanner/HUD compatibility
		// Force immediate HUD update to show heart stopped
		owner.hud_updateflag |= 1 << HEALTH_HUD
		owner.handle_regular_hud_updates()

		// Heart death causes immediate respiratory distress/arrest
		owner.losebreath = max(owner.losebreath, 60) // 1 minute of respiratory arrest
		to_chat(owner, SPAN_DANGER("Your heart stops completely - you can't breathe!"))

	if(dead_icon)
		icon_state = dead_icon
	..()

// Advanced heart processing - Ported from Baystation12
/obj/item/organ/internal/vital/heart/Process()
	if(owner)
		handle_pulse()
		if(pulse)
			handle_heartbeat()
			if(pulse == PULSE_2FAST && prob(1))
				take_damage(0.5, BRUTE)
			if(pulse == PULSE_THREADY && prob(5))
				take_damage(0.5, BRUTE)
		handle_circulation()
	..()

/obj/item/organ/internal/vital/heart/proc/handle_pulse()
	if(BP_IS_ROBOTIC(src))
		pulse = PULSE_NONE	//robotic heart, no pulse but still functions
		return

	// pulse mod starts out as just the chemical effect amount
	var/pulse_mod = owner.chem_effects[CE_PULSE] || 0
	var/is_stable = owner.chem_effects[CE_STABLE] || 0

	// If you have enough heart chemicals to be over 2, you're likely to take extra damage.
	if(pulse_mod > 2 && !is_stable)
		var/damage_chance = (pulse_mod - 2) ** 2
		if(prob(damage_chance))
			take_damage(0.5, BRUTE)

	// Enhanced shock effects on pulse - shock causes tachycardia and eventual bradycardia
	if(owner.shock_stage)
		// Enhanced warning system for critical cardiac stress
		if(owner.shock_stage >= 120 && prob(3))
			to_chat(owner, SPAN_WARNING("Your heart pounds irregularly in your chest..."))
		else if(owner.shock_stage >= 80 && prob(2))
			to_chat(owner, SPAN_NOTICE("Your heart is racing from the trauma..."))

		// Even mild shock increases heart rate (compensatory tachycardia)
		if(owner.shock_stage >= 10 && owner.shock_stage < 40)
			pulse_mod += 1
		// Moderate shock increases heart rate more significantly
		else if(owner.shock_stage >= 40 && owner.shock_stage < 80)
			pulse_mod += 2
		// Severe shock causes rapid, weak pulse
		else if(owner.shock_stage >= 80 && owner.shock_stage < 120)
			pulse_mod += 3
		// Critical shock can cause bradycardia and arrhythmias
		else if(owner.shock_stage >= 120)
			// Alternates between bradycardia and tachycardia unpredictably
			if(prob(70))
				pulse_mod -= 2 // Bradycardia
			else
				pulse_mod += 4 // Compensatory tachycardia

	var/oxy = owner.get_blood_oxygenation()
	var/blood_circulation = owner.get_blood_circulation()

	// Warning system for low blood/oxygen
	if(blood_circulation < BLOOD_VOLUME_SURVIVE && prob(2))
		to_chat(owner, SPAN_DANGER("Your heart struggles to pump what little blood remains..."))
	else if(blood_circulation < BLOOD_VOLUME_BAD && prob(1))
		to_chat(owner, SPAN_WARNING("Your heart pounds weakly from blood loss..."))

	if(oxy < BLOOD_VOLUME_OKAY) //brain wants us to get MOAR OXY
		pulse_mod++
	if(oxy < BLOOD_VOLUME_BAD) //MOAR
		pulse_mod++

	if(owner.status_flags & FAKEDEATH || owner.chem_effects[CE_NOPULSE])
		pulse = PULSE_NONE
		return

	//If heart is stopped, it isn't going to restart itself randomly.
	if(pulse == PULSE_NONE)
		// Check for heart restart chemical effect
		if(owner.chem_effects[CE_HEARTRESTART])
			pulse = PULSE_SLOW // Start with slow pulse when restarted chemically
			to_chat(owner, SPAN_NOTICE("You feel your heart suddenly kick back to life!"))
			// Force immediate HUD update to show heart restarted
			owner.hud_updateflag |= 1 << HEALTH_HUD
			owner.handle_regular_hud_updates()
		else
			return
	else //and if it's beating, let's see if it should
		var/should_stop = FALSE

		// Enhanced blood volume checks - heart stops more readily with low blood
		if(blood_circulation < BLOOD_VOLUME_SURVIVE)
			should_stop = prob(85) // High chance if critically low blood
		else if(blood_circulation < BLOOD_VOLUME_BAD)
			should_stop = prob(25) // Moderate chance if low blood
		else if(blood_circulation < BLOOD_VOLUME_OKAY)
			should_stop = prob(5) // Small chance if somewhat low blood

		// Enhanced shock-induced cardiac arrest
		if(owner.shock_stage >= 160) // Severe shock - heart likely to stop
			should_stop = should_stop || prob(60)
			if(prob(10))
				to_chat(owner, SPAN_WARNING("You feel your heart struggling to beat under the strain..."))
		else if(owner.shock_stage >= 120) // Critical shock
			should_stop = should_stop || prob(30)
		else if(owner.shock_stage >= 80) // Moderate shock
			should_stop = should_stop || prob(10)

		// Sustained shock accumulates risk over time
		if(owner.shock_stage >= 80)
			// Track how long shock has been sustained (simplified)
			var/shock_duration_factor = min(owner.shock_stage / 20, 5) // Max 5x multiplier
			if(prob(shock_duration_factor * 2)) // Increases chance over time
				should_stop = TRUE

		// Original conditions
		// Removed brain damage heart failure - brain damage should not directly cause heart issues
		// should_stop = should_stop || prob(max(0, owner.getBrainLoss() - owner.maxHealth * 0.75)) //brain failing to work heart properly
		should_stop = should_stop || (prob(10) && pulse == PULSE_THREADY) //erratic heart patterns, increased chance

		if(should_stop) // The heart has stopped due to traumatic or cardiovascular shock.
			// Different messages based on cause
			if(blood_circulation < BLOOD_VOLUME_SURVIVE)
				to_chat(owner, SPAN_DANGER("Your heart stops beating - not enough blood to pump!"))
			else if(owner.shock_stage >= 120)
				to_chat(owner, SPAN_DANGER("Your heart stops beating from severe shock!"))
			else
				to_chat(owner, SPAN_DANGER("Your heart has stopped!"))

			pulse = PULSE_NONE
			thready_pulse_time = 0  // Reset counter when heart stops
			// Force immediate HUD update to show heart stopped
			if(owner)
				owner.pulse = PULSE_NONE
				owner.hud_updateflag |= 1 << HEALTH_HUD

				// When heart stops, breathing becomes difficult/impossible (cardiac arrest)
				// This simulates agonal breathing or complete respiratory arrest
				owner.losebreath = max(owner.losebreath, 20) // At least 20 seconds of breathing difficulty
				if(prob(70)) // 70% chance of complete respiratory arrest
					owner.losebreath = max(owner.losebreath, 60) // 1 minute of no breathing
					to_chat(owner, SPAN_DANGER("You can't breathe!"))
			return

	// Pulse normally shouldn't go above PULSE_2FAST, unless extreme amounts of bad stuff in blood
	if (pulse_mod < 6)
		pulse = clamp(PULSE_NORM + pulse_mod, PULSE_SLOW, PULSE_2FAST)
	else
		pulse = clamp(PULSE_NORM + pulse_mod, PULSE_SLOW, PULSE_THREADY)

	// Enhanced fibrillation based on shock and oxygen levels
	var/fibrillation_chance = 0
	if(oxy <= BLOOD_VOLUME_SURVIVE)
		fibrillation_chance += 50

	// Shock significantly increases fibrillation risk
	if(owner.shock_stage >= 80)
		fibrillation_chance += 20
	if(owner.shock_stage >= 120)
		fibrillation_chance += 30
	if(owner.shock_stage >= 160)
		fibrillation_chance += 40

	var/fibrillation = prob(fibrillation_chance)
	if(pulse && fibrillation)	//Dangerous arrhythmias from shock/hypoxia
		pulse = PULSE_THREADY

	// Stabilising chemicals pull the heartbeat towards the center
	if(pulse != PULSE_NORM && is_stable)
		if(pulse > PULSE_NORM)
			pulse--
		else
			pulse++

	// Sync heart pulse to owner for scanner/medical tool compatibility
	if(owner)
		var/old_pulse = owner.pulse
		owner.pulse = pulse
		// Force HUD update if pulse changed significantly
		if(old_pulse != pulse)
			owner.hud_updateflag |= 1 << HEALTH_HUD

	// Track sustained PULSE_THREADY (5) - dangerous arrhythmia
	if(pulse == PULSE_THREADY) // PULSE_THREADY = 5
		thready_pulse_time++
		// Heart stops after 8-12 seconds of sustained thready pulse
		if(thready_pulse_time >= rand(8, 12))
			to_chat(owner, SPAN_DANGER("Your heart gives out from sustained arrhythmia!"))
			pulse = PULSE_NONE
			if(owner)
				owner.pulse = PULSE_NONE
				owner.hud_updateflag |= 1 << HEALTH_HUD
				// Respiratory arrest from cardiac arrest
				owner.losebreath = max(owner.losebreath, 60)
				to_chat(owner, SPAN_DANGER("You can't breathe!"))
			return
	else
		// Reset counter if pulse recovers
		thready_pulse_time = 0

/obj/item/organ/internal/vital/heart/proc/handle_heartbeat()
	// Enhanced heartbeat calculation - shock affects heart rhythm
	var/base_heartbeat_threshold = 10

	// Shock lowers the threshold for audible heartbeats (more frequent/louder)
	if(owner.shock_stage >= 40)
		base_heartbeat_threshold = 5
	if(owner.shock_stage >= 80)
		base_heartbeat_threshold = 3
	if(owner.shock_stage >= 120)
		base_heartbeat_threshold = 1

	if(pulse >= PULSE_2FAST || owner.shock_stage >= base_heartbeat_threshold)
		//PULSE_THREADY - maximum value for pulse, currently it 5.
		//High pulse value corresponds to a fast rate of heartbeat.
		//Divided by 2, otherwise it is too slow.
		var/rate = (PULSE_THREADY - pulse)/2

		// Shock makes heartbeat more irregular
		if(owner.shock_stage >= 60)
			rate += rand(-1, 1) // Irregular rhythm

		if(owner.chem_effects[CE_PULSE] > 2)
			heartbeat++

		if(heartbeat >= rate)
			heartbeat = 0
			// Shock makes heartbeat more audible (stronger/louder)
			var/volume = 50
			if(owner.shock_stage >= 80)
				volume = 65
			if(owner.shock_stage >= 120)
				volume = 80
			sound_to(owner, sound(beat_sound,0,0,0,volume))
		else
			heartbeat++

/obj/item/organ/internal/vital/heart/proc/handle_circulation()
	if(!owner)
		return

	//Dead or cryosleep people do not pump the blood.
	if(!owner || owner.InStasis() || owner.is_real_dead() || owner.bodytemperature < 170)
		return

	if(pulse != PULSE_NONE || BP_IS_ROBOTIC(src))
		//Bleeding out
		var/blood_max = 0
		var/list/do_spray = list()
		for(var/obj/item/organ/external/temp in owner.organs)

			if(BP_IS_ROBOTIC(temp))
				continue

			var/open_wound
			if(temp.status & ORGAN_BLEEDING)
				for(var/datum/wound/W in temp.wounds)
					if (!open_wound && (W.damage_type == CUT || W.damage_type == PIERCE) && W.damage && !W.is_treated())
						open_wound = TRUE

					if(W.bleeding())
						// Simplified bleeding - base it on wound damage and whether it's treated
						var/bleed_factor = W.bandaged || W.clamped ? 0.3 : 1.0
						blood_max += (W.damage / 60) * bleed_factor

			// Simplified arterial bleeding check
			if(temp.status & ORGAN_BLEEDING && open_wound)
				var/bleed_amount = round(owner.vessel.total_volume / 600) * 1.5
				if(bleed_amount)
					blood_max += bleed_amount
					do_spray += "[temp.name]"

		switch(pulse)
			if(PULSE_SLOW)
				blood_max *= 0.8
			if(PULSE_FAST)
				blood_max *= 1.25
			if(PULSE_2FAST, PULSE_THREADY)
				blood_max *= 1.5

		if(CE_STABLE in owner.chem_effects) // inaprovaline
			blood_max *= 0.8

		if(world.time >= next_blood_squirt && isturf(owner.loc) && length(do_spray))
			var/spray_organ = pick(do_spray)
			owner.visible_message(
				SPAN_DANGER("Blood sprays out from \the [owner]'s [spray_organ]!"),
				FONT_HUGE(SPAN_DANGER("Blood sprays out from your [spray_organ]!"))
			)

			//AB occurs every heartbeat, this only throttles the visible effect
			next_blood_squirt = world.time + 80
			var/turf/sprayloc = get_turf(owner)
			blood_max -= owner.drip(round(blood_max/3) + 1, sprayloc)
			if(blood_max > 0)
				blood_max -= owner.blood_squirt(blood_max, sprayloc)
				if(blood_max > 0)
					owner.drip(blood_max, get_turf(owner))
		else
			owner.drip(blood_max)

/obj/item/organ/internal/vital/heart/proc/is_working()
	if(!is_usable())
		return FALSE

	return pulse > PULSE_NONE || BP_IS_ROBOTIC(src) || (owner?.status_flags & FAKEDEATH)

/obj/item/organ/internal/vital/heart/open
	open = 1

/obj/item/organ/internal/vital/heart/prosthetic
	name = "prosthetic heart"
	desc = "A metal heart, doesn't beat like a normal heart, but does the same job."
	icon_state = "heart-prosthetic"
	dead_icon = "heart-prosthetic"
	price_tag = 100
	nature = MODIFICATION_SILICON
	matter = list(MATERIAL_STEEL = 1)

/obj/item/organ/internal/vital/heart/plant
	name = "centralized capillary"
	desc = "The centralized heart of a plantoid, functioning as little more than a capillary."
	icon_state = "heart_plant-on"

/obj/item/organ/internal/vital/heart/huge
	name = "six-chambered heart"
	desc = "A complex heart, good enough to hold two (metaphorical) wolves."
	icon_state = "heart_huge"
	organ_efficiency = list(OP_HEART = 150)
	specific_organ_size = 2.3
	price_tag = 1500
	max_blood_storage = 100
	nutriment_req = 15
	dead_icon = "heart_huge"

/obj/item/organ/internal/vital/heart/huge/baboon
	name = "mega-baboon heart"
	desc = "Beats to the drums of the jungle."

/obj/item/organ/internal/vital/heart/huge/exalt
	name = "Exalt heart"
	desc = "A genetically enhanced heart, pumping with the spirit of capitalism.\
	Likely worth more on the black market."
