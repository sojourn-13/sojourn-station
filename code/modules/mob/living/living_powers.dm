/mob/living
	var/hiding

/mob/living/proc/hide()
	set name = "Hide"
	set desc = "Allows to hide beneath tables or certain items. Toggled on or off."
	set category = "Abilities"

	if(incapacitated())
		return

	hiding = !hiding
	if(hiding)
		to_chat(src, SPAN_NOTICE("You are now hiding."))
	else
		to_chat(src, SPAN_NOTICE("You have stopped hiding."))
	reset_layer()


/mob/living/proc/activate_ai()
	if(AI_inactive && stat != DEAD)//Were not alive to wake up
		AI_inactive = FALSE
		life_cycles_before_sleep = initial(life_cycles_before_sleep)

/mob/living/proc/try_activate_ai()
	if(AI_inactive)
		activate_ai()
