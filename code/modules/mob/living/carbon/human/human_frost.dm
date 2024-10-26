//Common breathing procs

/mob/living/carbon/human/breathe()
	..()
	handle_frost()

/mob/living/carbon/human/proc/handle_frost()
	if(frost <= -1)
		frost = 0

	var/synth = FALSE
	var/gained_frost_harm = 0
	var/give_warening = FALSE
	var/give_emote = TRUE

	if(species.reagent_tag == IS_SYNTHETIC)
		synth = TRUE

	if(frost)

		if(frost > max_frost)
			frost = max_frost

		if(nutrition >= 300 && !synth) //If we are very, very cold we'll use up quite a bit of nutriment to heat us up.
			nutrition -= 1
			frost -= 1
		if(synth)
			frost -= 1 //Synths get it for free

		if(frost >= 1000)
			gained_frost_harm += 6
			sanity.changeLevel(15) //do to order of operation this will never max out stored sanity by itself
			frost_warnings = "Your body feels hot!"

		if(frost >= 900)
			gained_frost_harm += 4
			sanity.changeLevel(-5)
			if(!frost_warnings)
				frost_warnings = "You start to feel warmer."
			if(prob(5))
				bodytemperature -= 2 * TEMPERATURE_DAMAGE_COEFFICIENT
				frost -= 5

		if(frost >= 800)
			gained_frost_harm += 3
			sanity.changeLevel(-2.5)

		if(frost >= 700)
			gained_frost_harm += 2
			sanity.changeLevel(-0.5)
			if(!frost_warnings)
				frost_warnings = "Cold is starting to make your skin burn madly!"

		if(frost >= 600)
			gained_frost_harm += 2
			sanity.changeLevel(-0.5)

		if(frost >= 500)
			gained_frost_harm += 1
			sanity.changeLevel(-0.5)


		if(frost >= 400)
			gained_frost_harm += 1
			sanity.changeLevel(-0.1)

		if(frost >= 350)
			gained_frost_harm += 1
			sanity.changeLevel(-0.1)
			if(!frost_warnings)
				frost_warnings = "The cold is starting to make your skin itch."

		if(frost >= 300)
			sanity.changeLevel(-0.1)
			if(prob(5))
				bodytemperature -= 1 * TEMPERATURE_DAMAGE_COEFFICIENT
				frost -= 5

		if(frost >= 250)
			give_warening = TRUE
			if(!frost_warnings)
				frost_warnings = "A chill on your skin starts to sap your engery."

		if(frost >= 200)
			if(!frost_emote)
				if(synth)
					frost_emote = "interal fans whirls slow down to an almost stand still for a moment."
				else
					frost_emote = "shivers well their nose starts to run."

		if(frost >= 150)
			if(nutrition > 20 && !synth) //
				nutrition -= 2
				frost -= 2

		if(frost >= 100)
			if(!frost_emote)
				if(synth)
					frost_emote = "interal fans whirls slow down to an almost stand still for a moment."
				else
					frost_emote = "teeth starts to chatter a moment."
			if(prob(10))
				bodytemperature -= 1 * TEMPERATURE_DAMAGE_COEFFICIENT
				frost -= 2


		if(frost >= 50)
			if(!frost_emote)
				if(synth)
					frost_emote = "interal fans whirls slow down."
				else
					frost_emote = "nose starts to turn red."

		if(frost >= 10)
			if(!frost_emote)
				if(synth)
					frost_emote = "interal fans whirls slow down."
				else
					frost_emote = "shivers."


	if(gained_frost_harm)
		frost_to_burns(gained_frost_harm)

	if(frost_warnings_cooldown >= 50 && give_warening && frost_warnings)
		frost_warnings_cooldown = 0
		to_chat(src, "<span class='info'>[frost_warnings]</span>")

	if(frost_emote_cooldown >= 50 && give_emote && frost_emote)
		frost_emote_cooldown = 0
		custom_emote(message = frost_emote)

	frost_warnings_cooldown += 1
	frost_emote_cooldown += 1
	frost_emote = null
	frost_warnings = null

/mob/living/carbon/human/proc/frost_to_burns(burn)
	take_overall_damage(0,burn, used_weapon = "Artic Bite")

