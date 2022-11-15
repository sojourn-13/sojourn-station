//Brain slug proc for voluntary removal of control.
/mob/living/proc/release_control()
	set category = "Alien"
	set name = "Release Control"
	set desc = "Release control of your host's body."

	do_release_control(0)

/mob/living/proc/do_release_control(var/rptext=1)
	var/mob/living/simple_animal/borer/B = has_brain_worms()

	if(!B)
		return

	if(B.controlling)
		if(rptext)
			to_chat(src, "<span class='danger'>You withdraw your probosci, releasing control of [B.host_brain]</span>")
			to_chat(B.host_brain, "<span class='danger'>Your vision swims as the alien parasite releases control of your body.</span>")
		B.ckey = ckey
		B.controlling = 0
	if(B.host_brain.ckey)
		ckey = B.host_brain.ckey
		B.host_brain.ckey = null
		B.host_brain.name = "host brain"
		B.host_brain.real_name = "host brain"
	B.update_hud()

	//reset name if the borer changed it
	fully_replace_character_name(null, B.host_name)

	verbs -= /mob/living/proc/release_control
	verbs -= /mob/living/proc/punish_host

//Brain slug proc for tormenting the host.
/mob/living/proc/punish_host()
	set category = "Alien"
	set name = "Torment host"
	set desc = "Punish your host with agony."

	var/mob/living/simple_animal/borer/B = has_brain_worms()

	if(!B)
		return

	if(B.host_brain.ckey)
		to_chat(src, "<span class='danger'>You send a punishing spike of psychic agony lancing into your host's brain.</span>")
		to_chat(B.host_brain, "<span class='danger'><FONT size=3>Horrific, burning agony lances through you, ripping a soundless scream from your trapped mind!</FONT></span>")
