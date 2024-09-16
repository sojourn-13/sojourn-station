/mob/living/carbon/human/emote(var/act,var/m_type=1,var/message = null)
	var/param = null

	if (findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	if(findtext(act,"s",-1) && !findtext(act,"_",-2))//Removes ending s's unless they are prefixed with a '_'
		act = copytext(act,1,length(act))

	var/muzzled = istype(src.wear_mask, /obj/item/clothing/mask/muzzle) || istype(src.wear_mask, /obj/item/grenade)
	//var/m_type = 1
	// Apparently, var/m_type defines whether an emote is visible (1) or hearable (2) for terms of readability during situations in which the mob is either blind or deaf. Do correct me if I'm wrong on this one. - Seb

	for (var/obj/item/implant/I in src)
		if (I.implanted)
			I.trigger(act, src)

	if(src.stat == 2.0 && (act != "deathgasp"))
		return

	var/cloud_emote = ""

	switch(act)
		if ("airguitar")
			if (!src.restrained())
				message = "is strumming the air and headbanging like a safari chimp."
				m_type = 1

	//Machine-only emotes
		if("ping", "beep", "buzz", "yes", "ye", "no", "rcough", "rsneeze")

			if(!isSynthetic())
				to_chat(src, "<span class='warning'>You are not a synthetic.</span>")
				return

			var/M = null
			if(param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if(!M)
				param = null

			var/display_msg = "beeps"
			var/use_sound = 'sound/machines/twobeep.ogg'
			if(act == "buzz")
				display_msg = "buzzes"
				cloud_emote = "cloud-malfunction"
				use_sound = 'sound/machines/buzz-sigh.ogg'
			else if(act == "ping")
				display_msg = "pings"
				use_sound = 'sound/machines/ping.ogg'
			else if(act == "yes" || act == "ye")
				display_msg = "emits an affirmative blip"
				use_sound = 'sound/machines/synth_yes.ogg'
			else if(act == "no")
				display_msg = "emits a negative blip"
				use_sound = 'sound/machines/synth_no.ogg'
			else if(act == "rcough")
				display_msg = "emits a robotic cough"
				if(get_sex() == FEMALE)
					use_sound = pick('sound/effects/mob_effects/f_machine_cougha.ogg','sound/effects/mob_effects/f_machine_coughb.ogg')
				else
					use_sound = pick('sound/effects/mob_effects/m_machine_cougha.ogg','sound/effects/mob_effects/m_machine_coughb.ogg', 'sound/effects/mob_effects/m_machine_coughc.ogg')
			else if(act == "rsneeze")
				display_msg = "emits a robotic sneeze"
				if(get_sex() == FEMALE)
					use_sound = 'sound/effects/mob_effects/machine_sneeze.ogg'
				else
					use_sound = 'sound/effects/mob_effects/f_machine_sneeze.ogg'
			else if(act == "slowclap")
				display_msg = "activates their slow-clap processor" // Good, that's still working.
				use_sound = 'sound/misc/slowclap.ogg'

			if (param)
				message = "[display_msg] at [param]."
			else
				message = "[display_msg]."
			playsound(src.loc, use_sound, 50, 0)
			m_type = 1

	//machine only end

		if ("blink")
			message = "blinks slowly."
			m_type = 1

		if ("blink_r")
			message = "blinks twice in rapid succession."
			m_type = 1

		if ("bow")
			if (!src.buckled)
				var/M = null
				if (param)
					for (var/mob/A in view(null, null))
						if (param == A.name)
							M = A
							break
				if (!M)
					param = null

				if (param)
					message = "bows to [param]."
				else
					message = "bows."
			m_type = 1

		if ("custom")
			var/input = sanitize(input("Choose an emote to display.") as text|null)
			if (!input)
				return
			var/input2 = input("Is this a visible or hearable emote?") in list("Visible","Hearable")
			if (input2 == "Visible")
				m_type = 1
			else if (input2 == "Hearable")
				if (src.miming)
					return
				m_type = 2
			else
				alert("Unable to use this emote, must be either hearable or visible.")
				return
			return custom_emote(m_type, message)

		if ("me")

			//if(silent && silent > 0 && findtext(message,"\"",1, null) > 0)
			//	return //This check does not work and I have no idea why, I'm leaving it in for reference.

			if (src.client)
				if (client.prefs.muted & MUTE_IC)
					to_chat(src, "\red You cannot send IC messages (muted).")
					return
				if (src.client.handle_spam_prevention(message,MUTE_IC))
					return
			if (stat)
				return
			if(!(message))
				return
			return custom_emote(m_type, message)

		if ("subtle")

			//if(silent && silent > 0 && findtext(message,"\"",1, null) > 0)
			//	return //This check does not work and I have no idea why, I'm leaving it in for reference.

			if (src.client)
				if (client.prefs.muted & MUTE_IC)
					src << "\red You cannot send IC messages (muted)."
					return
				if (src.client.handle_spam_prevention(message,MUTE_IC))
					return
			if (stat)
				return
			if(!(message))
				return
			return custom_emote(m_type, "<I>[message]</I>", 1)

		if("pain")
			if(!message)
				if(miming)
					message = "appears to be in pain!"
					m_type = 1 // Can't we get defines for these?
				else
					message = "twists in pain."
					m_type = 1

			cloud_emote = "cloud-pain"

		if("medic")
			if(!message)
				if(miming)
					message = "calls out for a medic!"
					m_type = 1 // Can't we get defines for these?

			cloud_emote = "cloud-medic"

// Commenting out to prevent encouraging MilRP.
/*
		if ("salute")
			if (!src.buckled)
				var/M = null
				if (param)
					for (var/mob/A in view(null, null))
						if (param == A.name)
							M = A
							break
				if (!M)
					param = null

				if (param)
					message = "salutes [param]."
				else
					message = "salutes."
			m_type = 1
*/

		if ("choke")
			cloud_emote = "cloud-gasp"
			if(miming)
				message = "clutches [identifying_gender == "male" ? "his" : identifying_gender == "female" ? "her" : "their"] throat desperately!"
				m_type = 1
			else
				if (!muzzled)
					message = "chokes!"
					m_type = 2
				else
					message = "makes a strong noise."
					m_type = 2

		if ("clap")
			if (!src.restrained())
				message = "claps."
				m_type = 2
				switch(pick("1", "2"))
					if("1")
						playsound(loc, 'sound/misc/clap1.ogg', 80)
					if("2")
						playsound(loc, 'sound/misc/clap2.ogg', 80)
				if(miming)
					m_type = 1

		if ("slowclap")
			if (!src.restrained())
				message = "sarcastically slow claps."
				m_type = 2
				playsound(loc, 'sound/misc/slowclap.ogg', 80)
				if(miming)
					m_type = 1

		if ("flap")
			if (!src.restrained())
				message = "flaps [identifying_gender == "male" ? "his" : identifying_gender == "female" ? "her" : "their"] wings."
				m_type = 2
				if(miming)
					m_type = 1

		if ("aflap")
			if (!src.restrained())
				message = "flaps [identifying_gender == "male" ? "his" : identifying_gender == "female" ? "her" : "their"] wings ANGRILY!"
				m_type = 2
				if(miming)
					m_type = 1

		if ("drool")
			message = "drools."
			m_type = 1

		if ("eyebrow")
			message = "raises an eyebrow."
			m_type = 1

		if ("chuckle")
			if(miming)
				message = "appears to chuckle."
				m_type = 1
			else
				if (!muzzled)
					message = "chuckles."
					m_type = 2
					if(get_sex() == FEMALE)
						switch(pick("1", "2"))
							if("1")
								playsound(src, 'sound/effects/mob_effects/f_chuckle.ogg', 70)
							if("2")
								playsound(src, 'sound/effects/mob_effects/f_chuckle2.ogg', 40)
					else
						switch(pick("1", "2"))
							if("1")
								playsound(src, 'sound/effects/mob_effects/m_chuckle.ogg', 70)
							if("2")
								playsound(src, 'sound/effects/mob_effects/m_chuckle2.ogg', 70)
				else
					message = "chuckles muffledly."
					m_type = 2

		if ("twitch")
			message = "twitches violently."
			m_type = 1

		if ("twitch_s")
			message = "twitches."
			m_type = 1

		if ("faint")
			message = "faints."
			if(src.sleeping)
				return //Can't faint while asleep
			src.sleeping += 10 //Short-short nap
			m_type = 1

		if ("cough")
			if(miming)
				message = "takes [identifying_gender == "male" ? "his" : identifying_gender == "female" ? "her" : "their"] curled up fist to their mouth, mimicking a cough!"
				m_type = 1
			else
				if (!muzzled)
					message = "coughs!"
					m_type = 2
					if(get_sex() == FEMALE)
						switch(pick("1", "2"))
							if("1")
								playsound(src, 'sound/effects/mob_effects/f_cougha.ogg', 70)
							if("2")
								playsound(src, 'sound/effects/mob_effects/f_coughb.ogg', 70)
					else
						switch(pick("1", "2", "3"))
							if("1")
								playsound(src, 'sound/effects/mob_effects/m_cougha.ogg', 70)
							if("2")
								playsound(src, 'sound/effects/mob_effects/m_coughb.ogg', 70)
							if("3")
								playsound(src, 'sound/effects/mob_effects/m_coughc.ogg', 70)
				else
					message = "makes a strong noise."
					m_type = 2

		if ("throat")
			if(miming)
				message = "takes a curled up fist to their mouth, clearing [identifying_gender == "male" ? "his" : identifying_gender == "female" ? "her" : "their"] throat."
				m_type = 1
			else
				if (!muzzled)
					message = "awkwardly clears [identifying_gender == "male" ? "his" : identifying_gender == "female" ? "her" : "their"] throat."
					m_type = 2
					if(get_sex() == FEMALE)
						switch(pick("1", "2"))
							if("1")
								playsound(src, 'sound/effects/mob_effects/throat_f.ogg', 70)
							if("2")
								playsound(src, 'sound/effects/mob_effects/throat_f2.ogg', 70)
					else
						switch(pick("1", "2"))
							if("1")
								playsound(src, 'sound/effects/mob_effects/throat_m.ogg', 70)
							if("2")
								playsound(src, 'sound/effects/mob_effects/throat_m2.ogg', 70)
				else
					message = "makes a strong noise."
					m_type = 2

		if ("frown")
			message = "frowns."
			m_type = 1

		if ("nod")
			message = "nods."
			m_type = 1

		if ("blush")
			message = "blushes."
			m_type = 1

		if ("wave")
			message = "waves."
			m_type = 1

		if ("gasp")
			if(miming)
				message = "appears to be gasping!"
				m_type = 1
			else
				if (!muzzled)
					message = "gasps!"
					m_type = 2
					if(get_sex() == FEMALE)
						switch(pick("1", "2", "3"))
							if("1")
								playsound(loc, 'sound/effects/mob_effects/gasp_f1.ogg', 80, 1)
							if("2")
								playsound(loc, 'sound/effects/mob_effects/gasp_f2.ogg', 80, 1)
							if("3")
								playsound(loc, 'sound/effects/mob_effects/gasp_f3.ogg', 80, 1)
					else
						switch(pick("1", "2", "3"))
							if("1")
								playsound(loc, 'sound/effects/mob_effects/gasp_m1.ogg', 80, 1)
							if("2")
								playsound(loc, 'sound/effects/mob_effects/gasp_m2.ogg', 80, 1)
							if("3")
								playsound(loc, 'sound/effects/mob_effects/gasp_m3.ogg', 80, 1)
				else
					message = "makes a noise."
					m_type = 2
			cloud_emote = "cloud-gasp"

		if ("deathgasp")
			if(stats.getPerk(PERK_TERRIBLE_FATE))
				message = "their inert body emits a strange sensation and a cold invades your body. Their screams before dying recount in your mind."
			else
				message = "[form.death_message]"
			m_type = 1

		if ("giggle")
			if(miming)
				message = "giggles silently!"
				m_type = 1
			else
				if (!muzzled)
					message = "giggles."
					m_type = 2
					if(get_sex() == FEMALE)
						switch(pick("1", "2"))
							if("1")
								playsound(src, 'sound/effects/mob_effects/f_giggle.ogg', 70)
							if("2")
								playsound(src, 'sound/effects/mob_effects/f_giggle2.ogg', 50)
					else
						switch(pick("1", "2"))
							if("1")
								playsound(src, 'sound/effects/mob_effects/m_giggle.ogg', 50)
							if("2")
								playsound(src, 'sound/effects/mob_effects/m_giggle2.ogg', 50)
				else
					message = "makes a noise."
					m_type = 2

		if ("glare")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null

			if (param)
				message = "glares at [param]."
			else
				message = "glares."

		if ("stare")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null

			if (param)
				message = "stares at [param]."
			else
				message = "stares."

		if ("look")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break

			if (!M)
				param = null

			if (param)
				message = "looks at [param]."
			else
				message = "looks."
			m_type = 1

		if ("grin")
			message = "grins."
			m_type = 1

		if ("cry")
			if(miming)
				message = "cries."
				m_type = 1
			else
				if (!muzzled)
					message = "cries."
					m_type = 2
				else
					message = "makes a weak, whimpering noise. [identifying_gender == "male" ? "He" : identifying_gender == "female" ? "She" : "They"] [get_gender() == NEUTER ? "frown" : "frowns"]."
					m_type = 2

		if ("sigh")
			if(miming)
				message = "sighs."
				m_type = 1
			else
				if (!muzzled)
					message = "sighs."
					m_type = 2
					if(get_sex() == FEMALE)
						playsound(loc, 'sound/effects/mob_effects/f_sigh.ogg', 70)
					else
						playsound(loc, 'sound/effects/mob_effects/m_sigh.ogg', 70)
				else
					message = "makes a weak noise."
					m_type = 2

		if ("laugh")
			if(miming)
				message = "acts out a laugh."
				m_type = 1
			else
				if (!muzzled)
					message = "laughs."
					m_type = 2
					if(get_sex() == FEMALE)
						switch(pick("1", "2", "3"))
							if("1")
								playsound(src, 'sound/voice/f_laugh.ogg', 70)
							if("2")
								playsound(src, 'sound/voice/f_laugh2.ogg', 50)
							if("3")
								playsound(src, 'sound/voice/f_laugh3.ogg', 50)
					else
						switch(pick("1", "2", "3"))
							if("1")
								playsound(src, 'sound/voice/m_laugh.ogg', 70)
							if("2")
								playsound(src, 'sound/voice/m_laugh2.ogg', 20)
							if("3")
								playsound(src, 'sound/voice/m_laugh3.ogg', 20)
				else
					message = "makes a noise."
					m_type = 2

		if ("mumble")
			message = "mumbles..."
			m_type = 2
			if(miming)
				m_type = 1

		if ("grumble")
			if(miming)
				message = "grumbles."
				m_type = 1
			if (!muzzled)
				message = "grumbles!"
				m_type = 2
			else
				message = "makes a noise."
				m_type = 2

		if ("groan")
			if(miming)
				message = "appears to groan!"
				m_type = 1
			else
				if (!muzzled)
					message = "groans!"
					m_type = 2
				else
					message = "makes a loud noise."
					m_type = 2

		if ("moan")
			if(miming)
				message = "appears to moan!"
				m_type = 1
			else
				message = "moans!"
				m_type = 2
				if(get_sex() == FEMALE)
					switch(pick("1", "2", "3"))
						if("1")
							playsound(loc, 'sound/effects/mob_effects/moan_f1.ogg', 40)
						if("2")
							playsound(loc, 'sound/effects/mob_effects/moan_f2.ogg', 80)
						if("3")
							playsound(loc, 'sound/effects/mob_effects/moan_f4.ogg', 80)
				else
					switch(pick("1", "2", "3"))
						if("1")
							playsound(loc, 'sound/effects/mob_effects/moan_m1.ogg', 80)
						if("2")
							playsound(loc, 'sound/effects/mob_effects/moan_m3.ogg', 80)
						if("3")
							playsound(loc, 'sound/effects/mob_effects/moan_m5.ogg', 80)
			cloud_emote = "cloud-love"

		if ("johnny")
			var/M
			if (param)
				M = param
			if (!M)
				param = null
			else
				if(miming)
					message = "takes a drag from a cigarette and blows \"[M]\" out in smoke."
					m_type = 1
				else
					message = "says, \"[M], please. He had a family.\" [src.name] takes a drag from a cigarette and blows his name out in smoke."
					m_type = 2

		if ("point")
			if (!src.restrained())
				var/mob/M = null
				if (param)
					for (var/atom/A as mob|obj|turf|area in view(null, null))
						if (param == A.name)
							M = A
							break

				if (!M)
					message = "points."
				else
					pointed(M)

				if (M)
					message = "points to [M]."
				else
			m_type = 1

		if ("raise")
			if (!src.restrained())
				message = "raises a hand to speak."
			m_type = 1

		if("shake")
			message = "shakes [identifying_gender == "male" ? "his" : identifying_gender == "female" ? "her" : "their"] head."
			m_type = 1

		if ("shrug")
			message = "shrugs."
			m_type = 1

		if ("signal")
			if (!src.restrained())
				var/t1 = round(text2num(param))
				if (isnum(t1))
					if (t1 <= 5 && (!src.r_hand || !src.l_hand))
						message = "raises [t1] finger\s."
					else if (t1 <= 10 && (!src.r_hand && !src.l_hand))
						message = "raises [t1] finger\s."
			m_type = 1

		if ("smile")
			message = "smiles."
			m_type = 1

		if ("shiver")
			message = "shivers."
			m_type = 2
			if(miming)
				m_type = 1

		if ("pale")
			message = "goes pale for a second."
			m_type = 1

		if ("tremble")
			message = "trembles in fear!"
			m_type = 1

		if ("sneeze")
			if (miming)
				message = "sneezes."
				m_type = 1
			else
				if (!muzzled)
					message = "sneezes."
					m_type = 2
					if(get_sex() == FEMALE)
						playsound(loc, 'sound/effects/mob_effects/f_sneeze.ogg', 70)
					else
						playsound(loc, 'sound/effects/mob_effects/sneeze.ogg', 70)
				else
					message = "makes a strange noise."
					m_type = 2

		if ("sniff")
			if(miming)
				message = "sniffs."
				m_type = 1
			else
				if (!muzzled)
					message = "sniffs."
					m_type = 2
					if(get_sex() == FEMALE)
						playsound(loc, 'sound/effects/mob_effects/f_sniff.ogg', 70)
					else
						playsound(loc, 'sound/effects/mob_effects/m_sniff.ogg', 70)
				else
					message = "makes a strange noise."
					m_type = 2

		if ("snore")
			if (miming)
				message = "sleeps soundly."
				m_type = 1
			else
				if (!muzzled)
					message = "snores."
					m_type = 2
					if(get_sex() == FEMALE)
						playsound(loc, 'sound/effects/mob_effects/f_snore.ogg', 70)
					else
						playsound(loc, 'sound/effects/mob_effects/m_snore.ogg', 70)

				else
					message = "makes a noise."
					m_type = 2
		if ("snort")
			if (miming)
				message = "exhales through [identifying_gender == "male" ? "his" : identifying_gender == "female" ? "her" : "their"] nostrils."
				m_type = 1
			else
				if (!muzzled)
					message = "snorts!"
					m_type = 2
				else
					message = "attempts to exhale."
					m_type = 2

		if ("whimper")
			if (miming)
				message = "appears hurt."
				m_type = 1
			else
				if (!muzzled)
					message = "whimpers."
					m_type = 2
				else
					message = "makes a weak noise."
					m_type = 2

		if ("wink")
			message = "winks."
			m_type = 1

		if ("yawn")
			if (!muzzled)
				message = "yawns."
				if(get_sex() == FEMALE)
					m_type = 2
					playsound(loc, 'sound/effects/mob_effects/yawn_f.ogg', 70)
				else
					m_type = 2
					playsound(loc, 'sound/effects/mob_effects/yawn_m.ogg', 70)
				if(miming)
					m_type = 1

		if ("collapse")
			Paralyse(2)
			message = "collapses!"
			m_type = 2
			if(miming)
				m_type = 1

		if("hug")
			m_type = 1
			if (!src.restrained())
				var/M = null
				if (param)
					for (var/mob/A in view(1, null))
						if (param == A.name)
							M = A
							break
				if (M == src)
					M = null

				if (M)
					message = "hugs [M]."
				else
					message = "opens [identifying_gender == "male" ? "his" : identifying_gender == "female" ? "her" : "their"] arms wide, expecting a hug!" // NIKO! MY COUSIN! I CAN'T BELIEVE YOU'RE HERE!

		if ("handshake")
			m_type = 1
			if (!src.restrained() && !src.r_hand)
				var/mob/M = null
				if (param)
					for (var/mob/A in view(1, null))
						if (param == A.name)
							M = A
							break
				if (M == src)
					M = null

				if (M)
					if (M.canmove && !M.r_hand && !M.restrained())
						message = "shakes hands with [M]."
					else
						message = "holds out [identifying_gender == "male" ? "his" : identifying_gender == "female" ? "her" : "their"] hand to [M] to shake."

		if("dap")
			m_type = 1
			if (!src.restrained())
				var/M = null
				if (param)
					for (var/mob/A in view(1, null))
						if (param == A.name)
							M = A
							break
				if (M)
					message = "gives daps to [M]."
				else
					message = "sadly can't find anybody to give daps to, and daps [identifying_gender == "male" ? "himself" : identifying_gender == "female" ? "herself" : "themselves"]. Shameful."

		if ("scream")
			if (miming)
				message = "acts out a scream!"
				m_type = 1
			else
				if (!muzzled)
					message = "screams!"
					m_type = 2
					if(prob(1))
						playsound(loc, 'sound/voice/wilhelm_scream.ogg', 80, 1)
					else if(get_sex() == FEMALE)
						switch(pick("1", "2", "3"))
							if("1")
								playsound(loc, 'sound/voice/femalescream_1.ogg', 80, 1)
							if("2")
								playsound(loc, 'sound/voice/femalescream_4.ogg', 80, 1)
							if("3")
								playsound(loc, 'sound/voice/femalescream_5.ogg', 80, 1)
					else
						switch(pick("1", "2", "3"))
							if("1")
								playsound(loc, 'sound/voice/malescream_1.ogg', 80, 1)
							if("2")
								playsound(loc, 'sound/voice/malescream_3.ogg', 80, 1)
							if("3")
								playsound(loc, 'sound/voice/malescream_4.ogg', 80, 1)
				else
					message = "makes a very loud noise."
					m_type = 2
			cloud_emote = "cloud-scream"

		if("painscream")
			cloud_emote = "cloud-pain"
			if (miming)
				message = "acts out a squirming scream!"
				m_type = 1
			else
				if (!muzzled)
					message = "<span class='danger'>screams in agony!</span>"
					m_type = 2
					if(get_sex() == FEMALE)
						switch(pick("1", "2"))
							if("1")
								playsound(loc, 'sound/voice/femalescream_2.ogg', 80, 1)
							if("2")
								playsound(loc, 'sound/voice/femalescream_3.ogg', 100, 1)
					else
						switch(pick("1", "2"))
							if("1")
								playsound(loc, 'sound/voice/malescream_2.ogg', 80, 1)
							if("2")
								playsound(loc, 'sound/voice/malescream_5.ogg', 80, 1)
				else
					message = "<span class='danger'>makes a very loud noise, squirming around!</span>"
					m_type = 2


		if ("urah") //Emoting will NOT give you the perk's bonuses, but anyone who knows the emote can at least use it for flavor value.
			if (!muzzled)
				cloud_emote = "cloud-scream"
				message = "releases a heroic roar, inspiring everyone around [identifying_gender == "male" ? "him" : identifying_gender == "female" ? "her" : "themselves"]! URA!"
				if(get_sex() == FEMALE)
					m_type = 2
					playsound(loc, 'sound/voice/f_warcry.ogg', 80, 30)
				else
					m_type = 2
					playsound(loc, 'sound/voice/ura.ogg', 80, 1)
				if(miming)
					message = "acts out a battlecry!"
					m_type = 1

		if("crack")
			if(!restrained())
				message = "cracks [identifying_gender == "male" ? "his" : identifying_gender == "female" ? "her" : "their"] knuckles."
				playsound(src, 'sound/voice/knuckles.ogg', 50, 1,)
				m_type = 1

		if("meow", "meows")
			if(miming)
				message = "acts out a soft mrowl."
				m_type = 1
			else
				if(!muzzled)
					message = "meows!"
					m_type = 2
					playsound(loc, 'sound/voice/meow1.ogg', 50, 1)

		if("squeak","squeaks")
			if(miming)
				message = "acts out a soft squeak."
				m_type = 1
			else
				if(!muzzled)
					message = "squeaks!"
					m_type = 2
					playsound(loc, 'sound/effects/mouse_squeak.ogg', 50, 1)

		if("vomit")
			if(isSynthetic())
				to_chat(src, "<span class='warning'>You are unable to vomit.</span>")
				return
			vomit()
			return

		if("whistle", "whistles")
			cloud_emote = "cloud-music"
			m_type = 2
			if(!muzzled)
				message = "whistles a tune."
				switch(pick("1", "2", "3"))
					if("1")
						playsound(loc, 'sound/misc/longwhistle.ogg', 25, 1, -3)
					if("2")
						playsound(loc, 'sound/misc/roach.ogg', 50, 1,) // Fitting
					if("3")
						playsound(loc, 'sound/misc/weasel.ogg', 50, 1,)
			else
				message = "makes a light spitting noise, a poor attempt at a whistle."
		if("qwhistle")
			cloud_emote = "cloud-music"
			if(!muzzled)
				message = "whistles in astonishment."
				playsound(loc, 'sound/misc/shortwhistle.ogg', 50, 1)
			else
				message = "makes a light spitting noise, a poor attempt at a whistle."

		if("awhistle")
			cloud_emote = "cloud-music"
			m_type = 2
			if(!muzzled)
				var/M = null
				if(param)
					for(var/mob/A in view(null, null)) // Within sight, from a distance
						if(param == A.name)
							M = A
							break
				if(M)
					message = "whistles to get [M]'s attention!"
					playsound(loc, 'sound/misc/whistle_attention.ogg', 50, 1) // Hey! Taxi!
				else
					message = "whistles to get some attention!"
					playsound(loc, 'sound/misc/whistle_attention.ogg', 50, 1)
			else
				m_type = 1
				message = "makes some noise to draw attention to [identifying_gender == "male" ? "himself" : identifying_gender == "female" ? "herself" : "themselves"]!"

		if("zartan")
			cloud_emote = "cloud-music"
			if(!muzzled)
				message = "whistles a jolly good tune."
				playsound(loc, 'sound/misc/zartan.ogg', 50, 1)
			else
				m_type = 1
				message = "mumbles a jolly good melody."

		if("mwah")
			cloud_emote = "cloud-love"
			m_type = 2
			if(!muzzled)
				var/M = null
				if(param)
					for(var/mob/A in view(null, null)) // From a distance!
						if(param == A.name)
							M = A
							break
				if(M)
					message = "blows a kiss for [M]!"
					playsound(loc, 'sound/misc/kiss.ogg', 80, 1)
				else
					message = "blows a kiss!"
					playsound(loc, 'sound/misc/kiss.ogg', 80, 1)
			else
				m_type = 1
				message = "seems to pucker [identifying_gender == "male" ? "his" : identifying_gender == "female" ? "hers" : "their"] lips for a kiss!"

		if("snap", "snaps")
			m_type = 2
			if(!restrained())
				message = "snaps [identifying_gender == "male" ? "his" : identifying_gender == "female" ? "her" : "their"] fingers."
				switch(pick("1", "2"))
					if("1")
						playsound(loc, 'sound/effects/fingersnap.ogg', 50, 1, -3)
					if("2")
						playsound(loc, 'sound/effects/fingersnap2.ogg', 50, 1, -3)

		if("slap", "slaps")
			m_type = 1
			if(!restrained())
				var/M = null
				if(param)
					for(var/mob/A in view(1, null))
						if(param == A.name)
							M = A
							break
				if(M)
					message = "<span class='danger'>slaps [M] across the face. Ouch!</span>"
					playsound(loc, 'sound/effects/spank.ogg', 50, 1)
					if(ishuman(M)) //Snowflakey!
						var/mob/living/carbon/human/H = M
						if(istype(H.wear_mask,/obj/item/clothing/mask/smokable))
							H.drop_from_inventory(H.wear_mask)
				else
					message = "slaps [identifying_gender == "male" ? "his" : identifying_gender == "female" ? "her" : "their"] cheeks to focus!"
					playsound(loc, 'sound/effects/facepalm.ogg', 80, 1)

		if("aslap", "aslaps")
			m_type = 1
			if(!restrained())
				var/M = null
				if(param)
					for(var/mob/A in view(1, null))
						if(param == A.name)
							M = A
							break
				if(M)
					message = "<span class='danger'>slaps [M]'s butt!</span>"
					playsound(loc, 'sound/effects/spank.ogg', 50, 1)
				else
					message = "<span style='color:pink'>playfully spanks [identifying_gender == "male" ? "his" : identifying_gender == "female" ? "her" : "their"] own butt~</span>" // Saucy
					playsound(loc, 'sound/effects/facepalm.ogg', 80, 1)

		if("facepalm", "facepalms")
			m_type = 1
			if(!restrained())
				message = "facepalms in shame."
				playsound(loc, 'sound/effects/facepalm.ogg', 80, 1)

		if ("awoo")
			m_type = 2
			if(!muzzled)
				message = "awoo's cutely!"
				playsound(loc, 'sound/voice/awoo.ogg', 50, 1, -1)
			else
				message = "makes a strange noise."
		if ("nya")
			m_type = 2
			if(!muzzled)
				message = "lets out a nyah~"
				playsound(loc, 'sound/voice/nya.ogg', 50, 1, -1)
			else
				message = "makes a strange noise."
		if ("peep")
			m_type = 2
			if(!muzzled)
				message = "peeps like a bird."
				playsound(loc, 'sound/voice/peep.ogg', 50, 1, -1)
			else
				message = "makes a strange noise."
		if("chirp")
			m_type = 2
			if(!muzzled)
				message = "chirps!"
				playsound(src.loc, 'sound/misc/nymphchirp.ogg', 50, 0)
			else
				message = "makes a strange noise."
		if ("weh")
			m_type = 2
			if(!muzzled)
				message = "weh's. Weh!"
				playsound(loc, 'sound/voice/weh.ogg', 50, 1, -1)
			else
				message = "makes a strange noise."
		if ("merp")
			m_type = 2
			if(!muzzled)
				message = "merps."
				playsound(loc, 'sound/voice/merp.ogg', 50, 1, -1)
			else
				message = "makes a strange noise."
		if ("trill")
			m_type = 2
			cloud_emote = "cloud-love"
			if(!muzzled)
				message = "trills softly."
				playsound(loc, 'sound/voice/trill.ogg', 50, 1, -1) // Copyright CC BY-NC 3.0 Arnaud Coutancier (freesound.org) for the source audio.
			else
				message = "makes a strange noise."
		if ("geck")
			m_type = 2
			cloud_emote = "cloud-scream" //of course
			if(!muzzled)
				message = "geckers obnoxiously!"
				playsound(loc, 'sound/voice/geck.ogg', 50, 1, -1)
			else
				message = "makes a strange noise."
		if ("squish")
			m_type = 2
			if(!muzzled)
				message = "squishes."
				playsound(loc, 'sound/voice/slime_squish.ogg', 50, 1, -1)  //Credit to DrMinky (freesound.org) for the sound.
			else
				message = "makes a strange noise."
		if ("bark")
			m_type = 2
			cloud_emote = "cloud-scream"
			if(!muzzled)
				message = "barks!"
				playsound(loc, 'sound/voice/bark2.ogg', 50, 1, -1)
			else
				message = "makes a strange noise."
		if ("hiss")
			m_type = 2
			cloud_emote = "cloud-scream"
			if(!muzzled)
				message = "hisses!"
				playsound(loc, 'sound/voice/hiss.ogg', 50, 1, -1)
			else
				message = "makes a strange noise."
		if ("squeak")
			m_type = 2
			if(!muzzled)
				message = "lets out a squeak."
				playsound(loc, 'sound/effects/mouse_squeak.ogg', 50, 1, -1)
			else
				message = "makes a strange noise."
		if ("purr")
			m_type = 2
			cloud_emote = "cloud-love"
			if(!muzzled)
				message = "purrs softly."
				playsound(loc, 'sound/voice/purr.ogg', 50, 1, -1)
			else
				message = "makes a strange noise."
		if ("ycackle")
			m_type = 2
			cloud_emote = "cloud-scream"
			if(!muzzled)
				message = "cackles like a hyena!"
				playsound(loc, 'sound/voice/YeenCackle.ogg', 50, 1, -1)
			else
				message = "makes a strange noise."
		if ("shriek")
			m_type = 2
			cloud_emote = "cloud-scream"
			if(!muzzled)
				message = "<span class='danger'>SHRIEKS!</span>"
				playsound(loc, 'sound/voice/shriek.ogg', 50, 1, -1)
			else
				message = "makes a strange noise."
		if ("bellow")
			m_type = 2
			if(!muzzled)
				message = "bellows!"
				playsound(loc, 'sound/voice/LizardBellow.ogg', 50, 1, -1)
			else
				message = "makes a strange noise."
		if ("squeal")
			m_type = 2
			if(!muzzled)
				message = "squeals."
				playsound(loc, 'sound/voice/LizardSqueal.ogg', 50, 1, -1)
			else
				message = "makes a strange noise."
		if ("moo")
			m_type = 2
			if(!muzzled)
				message = "moos."
				playsound(loc, 'sound/voice/moo1.ogg', 50, 1, -1) //credit to minecraft for the sound effect!
			else
				message = "makes a strange noise."
		if ("bleat")
			m_type = 2
			if(!muzzled)
				message = "bleats."
				playsound(loc, 'sound/voice/bleat.ogg', 50, 1, -1) //credit to bigsoundbank for the effect.
			else
				message = "makes a strange noise."
		if ("warble")
			m_type = 2
			if(!muzzled)
				message = "warbles."
				playsound(loc, 'sound/voice/warble.ogg', 50, 1, -1)
			else
				message = "makes a strange noise."
		if ("lwarble")
			m_type = 2
			if(!muzzled)
				message = "warbles."
				playsound(loc, 'sound/voice/lowwarble.ogg', 50, 1, -1)
			else
				message = "makes a strange noise."
		if ("croon")
			m_type = 2
			if(!muzzled)
				switch(pick("1", "2"))
					if("1")
						message = "croons."
						playsound(loc, 'sound/voice/croon1.ogg', 50, 1, -1)
					if("2")
						message = "croons."
						playsound(loc, 'sound/voice/croon2.ogg', 50, 1, -1)
			else
				message = "makes a strange noise."
		if ("croak")
			m_type = 2
			if(!muzzled)
				message = "croaks."
				playsound(loc, 'sound/voice/croak.ogg', 50, 1, -1)
			else
				message = "makes a strange noise."
		if ("chitter")
			m_type = 2
			if(!muzzled)
				message = "chitters."
				switch(pick("1", "2"))
					if("1")
						playsound(loc, 'sound/voice/chitter1.ogg', 50, 1, -1)
					if("2")
						playsound(loc, 'sound/voice/chitter2.ogg', 90, 1, -1)
			else
				message = "makes a strange noise."
		if ("help")
			to_chat(src, "aslap-(none)/mob, awhistle-(none)/mob, awoo, bark, bellow, bleat, blink, blink_r, blush, bow-(none)/mob, chirp, chitter, choke, chuckle, clap, croon1, croon2, croak, collapse, cough, cry, custom, deathgasp, drool, eyebrow, \
					facepalm, frown, gasp, geck, giggle, glare-(none)/mob, grin, groan, grumble, handshake, hiss, hug-(none)/mob, laugh, look-(none)/mob, merp, moan, moo, mumble, mwah-(none)/mob, nod, nya, painscream, pale, peep, point-atom, qwhistle, \
					raise, scream, sneeze, shake, shiver, shriek, shrug, sigh, signal-#1-10, squish, slap-(none)/mob, smile, sneeze, sniff, snore, stare-(none)/mob, squeak, squeal, throat, tremble, trill, twitch, twitch_s, urah, vomit, weh, whimper, wink, yawn,\
					ycackle, zartan. Synthetics: beep, buzz, yes, no, rcough, rsneeze, ping")

		else
			to_chat(src, "\blue Unusable emote '[act]'. Say *help for a list.")





	if (message)
		log_emote("[name]/[key] : [message]")
		custom_emote(m_type, message)

	if(cloud_emote)
		var/image/emote_bubble = image('icons/mob/emote.dmi', src, cloud_emote, ABOVE_MOB_LAYER)
		flick_overlay(emote_bubble, clients, 30)
		QDEL_IN(emote_bubble, 3 SECONDS)


/mob/living/carbon/human/verb/pose()
	set name = "Set Pose"
	set desc = "Sets a description which will be shown when someone examines you."
	set category = "IC"

	if(suppress_communication)
		return FALSE

	pose =  sanitize(input(usr, "This is [src]. [identifying_gender == "male" ? "He" : identifying_gender == "female" ? "She" : "They"] [get_gender() == NEUTER ? "are" : "is"]...", "Pose", null)  as text)
