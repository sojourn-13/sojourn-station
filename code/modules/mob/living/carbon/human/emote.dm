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
				message = "молотит по воздуху словно по струнам гитары и крутит головой словно бешеная обезьяна"
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

			var/display_msg = "пищит"
			var/use_sound = 'sound/machines/twobeep.ogg'
			if(act == "buzz")
				display_msg = "жужжит"
				cloud_emote = "cloud-malfunction"
				use_sound = 'sound/machines/buzz-sigh.ogg'
			else if(act == "ping")
				display_msg = "звенит"
				use_sound = 'sound/machines/ping.ogg'
			else if(act == "yes" || act == "ye")
				display_msg = "издает утвердительный сигнал"
				use_sound = 'sound/machines/synth_yes.ogg'
			else if(act == "no")
				display_msg = "издает отрицательный сигнал"
				use_sound = 'sound/machines/synth_no.ogg'
			else if(act == "rcough")
				display_msg = "издает электронный кашель"
				if(get_sex() == FEMALE)
					use_sound = pick('sound/effects/mob_effects/f_machine_cougha.ogg','sound/effects/mob_effects/f_machine_coughb.ogg')
				else
					use_sound = pick('sound/effects/mob_effects/m_machine_cougha.ogg','sound/effects/mob_effects/m_machine_coughb.ogg', 'sound/effects/mob_effects/m_machine_coughc.ogg')
			else if(act == "rsneeze")
				display_msg = "издает электронный чих"
				if(get_sex() == FEMALE)
					use_sound = 'sound/effects/mob_effects/machine_sneeze.ogg'
				else
					use_sound = 'sound/effects/mob_effects/f_machine_sneeze.ogg'
			else if(act == "slowclap")
				display_msg = "активирует процессор медленных аплодисментов" // Good, that's still working.
				use_sound = 'sound/misc/slowclap.ogg'

			if (param)
				message = "[display_msg] at [param]."
			else
				message = "[display_msg]."
			playsound(src.loc, use_sound, 50, 0)
			m_type = 1

	//machine only end

		if ("blink")
			message = "медленно моргает"
			m_type = 1

		if ("blink_r")
			message = "быстро проморгался"
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
					message = "поклонился в сторону [param]"
				else
					message = "поклонился"
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
			return custom_emote(m_type, "<I>[message]</I>", 1, TRUE)

		if("pain")
			if(!message)
				if(miming)
					message = "похоже пребывает в болевом шоке"
					m_type = 1 // Can't we get defines for these?
				else
					message = "корчится от боли"
					m_type = 1

			cloud_emote = "cloud-pain"

		if("medic")
			if(!message)
				if(miming)
					message = "зовет медика!"
					m_type = 1 // Can't we get defines for these?

			cloud_emote = "cloud-medic"

// Commenting out to prevent encouraging MilRP.

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
					message = "исполняет воинское приветствие в сторону [param]."
				else
					message = "исполняет воинское приветствие."
			m_type = 1


		if ("choke")
			cloud_emote = "cloud-gasp"
			if(miming)
				message = "хватается за [identifying_gender == "male" ? "его" : identifying_gender == "female" ? "её": "её" ] горло в отчаянии"
				m_type = 1
			else
				if (!muzzled)
					message = "[identifying_gender == "male" ? "Подавился" : identifying_gender == "female" ? "Подавилась" : "Подавилась"]"
					m_type = 2
				else
					message = "издает громкий звук"
					m_type = 2

		if ("clap")
			if (!src.restrained())
				message = "аплодирует"
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
				message = "саркастически медленно аплодирует"
				m_type = 2
				playsound(loc, 'sound/misc/slowclap.ogg', 80)
				if(miming)
					m_type = 1

		if ("flap")
			if (!src.restrained())
				message = "взмахивает [identifying_gender == "male" ? "его" : identifying_gender == "female" ? "её" : "её"] крыльями"
				m_type = 2
				if(miming)
					m_type = 1

		if ("aflap")
			if (!src.restrained())
				message = "агрессивно взмахивает [identifying_gender == "male" ? "его" : identifying_gender == "female" ? "её" : "её"] крыльями"
				m_type = 2
				if(miming)
					m_type = 1

		if ("drool")
			message = "несет чепуху"
			m_type = 1

		if ("eyebrow")
			message = "поднимает бровь"
			m_type = 1

		if ("chuckle")
			if(miming)
				message = "кажется, усмехается"
				m_type = 1
			else
				if (!muzzled)
					message = "усмехается"
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
					message = "приглушенно усмехается"
					m_type = 2

		if ("twitch")
			message = "дергается"
			m_type = 1

		if ("twitch_s")
			message = "сильно дергается"
			m_type = 1

		if ("faint")
			message = "падает в обморок"
			if(src.sleeping)
				return //Can't faint while asleep
			src.sleeping += 10 //Short-short nap
			m_type = 1

		if ("cough")
			if(miming)
				message = "имитирует кашель поднося [identifying_gender == "male" ? "его" : identifying_gender == "female" ? "её" : "её"] сжатый кулак ко рту!"
				m_type = 1
			else
				if (!muzzled)
					message = "кашляет"
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
					message = "издает громкий звук"
					m_type = 2

		if ("throat")
			if(miming)
				message = "подносит кулак к  [identifying_gender == "male" ? "его" : identifying_gender == "female" ? "её" : "её"] горлу, видимо покашливая"
				m_type = 1
			else
				if (!muzzled)
					message = "в неловкости прочищает [identifying_gender == "male" ? "его" : identifying_gender == "female" ? "её" : "её"] горло"
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
					message = "издает громкий звук"
					m_type = 2

		if ("frown")
			message = "хмурится"
			m_type = 1

		if ("nod")
			message = "кивает"
			m_type = 1

		if ("blush")
			message = "краснеет"
			m_type = 1

		if ("wave")
			message = "машет рукой"
			m_type = 1

		if ("gasp")
			if(miming)
				message = "похоже задыхается"
				m_type = 1
			else
				if (!muzzled)
					message = "задыхается"
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
					message = "издает звук"
					m_type = 2
			cloud_emote = "cloud-gasp"

		if ("deathgasp")
			if(stats.getPerk(PERK_TERRIBLE_FATE))
				message = "их неподвижное тело вызывают странное ощущение, холод проникает в ваше тело. Их крики эхом звучат у вас в голове"
			else
				message = "[form.death_message]"
			m_type = 1

		if ("giggle")
			if(miming)
				message = "беззвучно хихикает"
				m_type = 1
			else
				if (!muzzled)
					message = "хихикает"
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
					message = "издает звук"
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
				message = "сверепо пялится на [param]"
			else
				message = "сверепо пялится"

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
				message = "пялится на [param]"
			else
				message = "пялится"

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
				message = "смотрит на [param]"
			else
				message = "смотрит"
			m_type = 1

		if ("grin")
			message = "оскаливается"
			m_type = 1

		if ("cry")
			if(miming)
				message = "плачет"
				m_type = 1
			else
				if (!muzzled)
					message = "плачет"
					m_type = 2
				else
					message = "издает слабое хныкание [identifying_gender == "male" ? "Он" : identifying_gender == "female" ? "Она" : "Она"] [get_gender() == NEUTER ? "frown" : "frowns"]"
					m_type = 2

		if ("sigh")
			if(miming)
				message = "вздыхает"
				m_type = 1
			else
				if (!muzzled)
					message = "вздыхает"
					m_type = 2
					if(get_sex() == FEMALE)
						playsound(loc, 'sound/effects/mob_effects/f_sigh.ogg', 70)
					else
						playsound(loc, 'sound/effects/mob_effects/m_sigh.ogg', 70)
				else
					message = "издает слабый звук"
					m_type = 2

		if ("laugh")
			if(miming)
				message = "изображает смех"
				m_type = 1
			else
				if (!muzzled)
					message = "смеётся"
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
					message = "издает звук"
					m_type = 2

		if ("mumble")
			message = "бормочет"
			m_type = 2
			if(miming)
				m_type = 1

		if ("grumble")
			if(miming)
				message = "ворчит"
				m_type = 1
			if (!muzzled)
				message = "ворчит"
				m_type = 2
			else
				message = "издает звук"
				m_type = 2

		if ("groan")
			if(miming)
				message = "похоже стонет от боли"
				m_type = 1
			else
				if (!muzzled)
					message = "стонет от боли"
					m_type = 2
				else
					message = "издает громкий звук"
					m_type = 2

		if ("moan")
			if(miming)
				message = "кажется стонет"
				m_type = 1
			else
				message = "стонет"
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
					message = "затягивает сигаретой и выпускает в сторону \"[M]\" облако дыма"
					m_type = 1
				else
					message = "говорит, \"[M], пожалуйста. У него была семья.\" [src.name] затягивается сигаретой и выдыхает клубок дыма с его именем"
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
					message = "указывает пальцем"
				else
					pointed(M)

				if (M)
					message = "указывает на [M]"
				else
			m_type = 1

		if ("raise")
			if (!src.restrained())
				message = "поднимает руку, пытаясь привлечь внимание"
			m_type = 1

		if("shake")
			message = "трясет [identifying_gender == "male" ? "его" : identifying_gender == "female" ? "её" : "их"] головой"
			m_type = 1

		if ("shrug")
			message = "пожимает плечами"
			m_type = 1

		if ("signal")
			if (!src.restrained())
				var/t1 = round(text2num(param))
				if (isnum(t1))
					if (t1 <= 5 && (!src.r_hand || !src.l_hand))
						message = "raises [t1] finger\s"
					else if (t1 <= 10 && (!src.r_hand && !src.l_hand))
						message = "raises [t1] finger\s"
			m_type = 1

		if ("smile")
			message = "улыбается"
			m_type = 1

		if ("shiver")
			message = "дрожит"
			m_type = 2
			if(miming)
				m_type = 1

		if ("pale")
			message = "на секунду бледнеет"
			m_type = 1

		if ("tremble")
			message = "содрагается в страхе"
			m_type = 1

		if ("sneeze")
			if (miming)
				message = "беззвучно чихает"
				m_type = 1
			else
				if (!muzzled)
					message = "чихает"
					m_type = 2
					if(get_sex() == FEMALE)
						playsound(loc, 'sound/effects/mob_effects/f_sneeze.ogg', 70)
					else
						playsound(loc, 'sound/effects/mob_effects/sneeze.ogg', 70)
				else
					message = "издает громкий звук"
					m_type = 2

		if ("sniff")
			if(miming)
				message = "беззвучно нюхает"
				m_type = 1
			else
				if (!muzzled)
					message = "нюхает"
					m_type = 2
					if(get_sex() == FEMALE)
						playsound(loc, 'sound/effects/mob_effects/f_sniff.ogg', 70)
					else
						playsound(loc, 'sound/effects/mob_effects/m_sniff.ogg', 70)
				else
					message = "издает странный звук"
					m_type = 2

		if ("snore")
			if (miming)
				message = "беззучно храпит"
				m_type = 1
			else
				if (!muzzled)
					message = "храпит"
					m_type = 2
					if(get_sex() == FEMALE)
						playsound(loc, 'sound/effects/mob_effects/f_snore.ogg', 70)
					else
						playsound(loc, 'sound/effects/mob_effects/m_snore.ogg', 70)

				else
					message = "издает шум"
					m_type = 2
		if ("snort")
			if (miming)
				message = "видимо фыркает через [identifying_gender == "male" ? "его" : identifying_gender == "female" ? "её" : "их"] ноздри"
				m_type = 1
			else
				if (!muzzled)
					message = "фыркает"
					m_type = 2
				else
					message = "пытается фыркнуть"
					m_type = 2

		if ("whimper")
			if (miming)
				message = "кажется хнычет"
				m_type = 1
			else
				if (!muzzled)
					message = "хнычет"
					m_type = 2
				else
					message = "издает слабый звук"
					m_type = 2

		if ("wink")
			message = "подмигивает"
			m_type = 1

		if ("yawn")
			if (!muzzled)
				message = "зевает"
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
			message = "падает"
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
					message = "обнимает [M]"
				else
					message = "широко раскрывает [identifying_gender == "male" ? "его" : identifying_gender == "female" ? "её" : "их"] руки, в ожидании объятий" // NIKO! MY COUSIN! I CAN'T BELIEVE YOU'RE HERE!

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
						message = "пожимает руку [M]"
					else
						message = "протягивает [identifying_gender == "male" ? "его" : identifying_gender == "female" ? "её" : "их"] руку в сторону [M] для рукопожатия"

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
					message = "даёт пятюню [M]"
				else
					message = "вздыхая с сожалением, не может найти того кому можно дать пятюню, и отвешивает её [identifying_gender == "male" ? "самому себе" : identifying_gender == "female" ? "самой себе" : "самим себе"]. Печально"

		if ("scream")
			if (miming)
				message = "изображает крик"
				m_type = 1
			else
				if (!muzzled)
					message = "кричит"
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
					message = "издает очень громкий звук"
					m_type = 2
			cloud_emote = "cloud-scream"

		if("painscream")
			cloud_emote = "cloud-pain"
			if (miming)
				message = "изображает пронзительный крик в боли"
				m_type = 1
			else
				if (!muzzled)
					message = "<span class='danger'>кричит в агонии</span>"
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
					message = "<span class='danger'>издает очень громкий звук, извиваясь во все стороны</span>"
					m_type = 2


		if ("urah") //Emoting will NOT give you the perk's bonuses, but anyone who knows the emote can at least use it for flavor value.
			if (!muzzled)
				cloud_emote = "cloud-scream"
				message = "издает героический рёв, поднимая боевой дух всем рядом с [identifying_gender == "male" ? "ним" : identifying_gender == "female" ? "ней" : "ними"]! УРА-А"
				if(get_sex() == FEMALE)
					m_type = 2
					playsound(loc, 'sound/voice/f_warcry.ogg', 80, 30)
				else
					m_type = 2
					playsound(loc, 'sound/voice/ura.ogg', 80, 1)
				if(miming)
					message = "изображает боевой клич"
					m_type = 1

		if("crack")
			if(!restrained())
				message = "разминает [identifying_gender == "male" ? "его" : identifying_gender == "female" ? "её" : "их"] кулаки."
				playsound(src, 'sound/voice/knuckles.ogg', 50, 1,)
				m_type = 1

		if("meow", "meows")
			if(miming)
				message = "беззучно мяукает"
				m_type = 1
			else
				if(!muzzled)
					message = "мяукает"
					m_type = 2
					playsound(loc, 'sound/voice/meow1.ogg', 50, 1)

		if("squeak","squeaks")
			if(miming)
				message = "изображает пищание"
				m_type = 1
			else
				if(!muzzled)
					message = "пищит"
					m_type = 2
					playsound(loc, 'sound/effects/mouse_squeak.ogg', 50, 1)

		if("vomit")
			if(isSynthetic())
				to_chat(src, "<span class='warning'>You are unable to vomit.</span>")//Нужно ли переводить предупреждения?
				return
			vomit()
			return

		if("whistle", "whistles")
			cloud_emote = "cloud-music"
			m_type = 2
			if(!muzzled)
				message = "насвистывает мелодию"
				switch(pick("1", "2", "3"))
					if("1")
						playsound(loc, 'sound/misc/longwhistle.ogg', 25, 1, -3)
					if("2")
						playsound(loc, 'sound/misc/roach.ogg', 50, 1,) // Fitting
					if("3")
						playsound(loc, 'sound/misc/weasel.ogg', 50, 1,)
			else
				message = "издает шипящий звук в явной попытке свистнуть"
		if("qwhistle")
			cloud_emote = "cloud-music"
			if(!muzzled)
				message = "насвистывает в удивлении."
				playsound(loc, 'sound/misc/shortwhistle.ogg', 50, 1)
			else
				message = "издает шипящий звук в явной попытке свистнуть"

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
					message = "свистит, чтоб привлечь внимание [M]"
					playsound(loc, 'sound/misc/whistle_attention.ogg', 50, 1) // Hey! Taxi!
				else
					message = "свистит, чтоб привлечь внимание к себе"
					playsound(loc, 'sound/misc/whistle_attention.ogg', 50, 1)
			else
				m_type = 1
				message = "издает шипящий звук в попытке того, чтоб на  [identifying_gender == "male" ? "него" : identifying_gender == "female" ? "неё" : "них"] обратили внимание"

		if("zartan")
			cloud_emote = "cloud-music"
			if(!muzzled)
				message = "насвистывает веселую мелодию"
				playsound(loc, 'sound/misc/zartan.ogg', 50, 1)
			else
				m_type = 1
				message = "бормочет мотив веселой мелодии"

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
					message = "отправляет воздушный поцелуй для [M]"
					playsound(loc, 'sound/misc/kiss.ogg', 80, 1)
				else
					message = "отправляет воздушный поцелуй"
					playsound(loc, 'sound/misc/kiss.ogg', 80, 1)
			else
				m_type = 1
				message = "похоже поджимает [identifying_gender == "male" ? "его" : identifying_gender == "female" ? "её" : "их"] губы для поцелуя"

		if("snap", "snaps")
			m_type = 2
			if(!restrained())
				message = "щелкает [identifying_gender == "male" ? "его" : identifying_gender == "female" ? "её" : "их"] пальцами"
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
					message = "<span class='danger'>отвешивает [M] пощёчину. Ауч</span>"
					playsound(loc, 'sound/effects/spank.ogg', 50, 1)
					if(ishuman(M)) //Snowflakey!
						var/mob/living/carbon/human/H = M
						if(istype(H.wear_mask,/obj/item/clothing/mask/smokable))
							H.drop_from_inventory(H.wear_mask)
				else
					message = "шлепает [identifying_gender == "male" ? "самого себя" : identifying_gender == "female" ? "саму себя" : "самих себя"] по лицу, чтоб привести себя в чувство!"
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
					message = "<span class='danger'>шлепает [M] по заднице</span>"
					playsound(loc, 'sound/effects/spank.ogg', 50, 1)
				else
					message = "<span style='color:pink'>игриво шлепает [identifying_gender == "male" ? "самого себя" : identifying_gender == "female" ? "саму себя" : "самих себя"] по заднице~</span>" // Saucy
					playsound(loc, 'sound/effects/facepalm.ogg', 80, 1)

		if("facepalm", "facepalms")
			m_type = 1
			if(!restrained())
				message = "шлепает себя ладонью по лицу"
				playsound(loc, 'sound/effects/facepalm.ogg', 80, 1)

		if ("awoo")
			m_type = 2
			if(!muzzled)
				message = "воет"
				playsound(loc, 'sound/voice/awoo.ogg', 50, 1, -1)
			else
				message = "издает странный звук"
		if ("nya")
			m_type = 2
			if(!muzzled)
				message = "някает~"
				playsound(loc, 'sound/voice/nya.ogg', 50, 1, -1)
			else
				message = "издает странный звук"
		if ("peep")
			m_type = 2
			if(!muzzled)
				message = "чирикает как птичка"
				playsound(loc, 'sound/voice/peep.ogg', 50, 1, -1)
			else
				message = "издает странный звук"
		if("chirp")
			m_type = 2
			if(!muzzled)
				message = "щебечет"
				playsound(src.loc, 'sound/misc/nymphchirp.ogg', 50, 0)
			else
				message = "издает странный звук"
		if ("weh")
			m_type = 2
			if(!muzzled)
				message = "выдыхает странный звук из своего рта. Weh!"
				playsound(loc, 'sound/voice/weh.ogg', 50, 1, -1)
			else
				message = "издает странный звук"
		if ("merp")
			m_type = 2
			if(!muzzled)
				message = "издает странный звук из своего рта. Merp!"
				playsound(loc, 'sound/voice/merp.ogg', 50, 1, -1)
			else
				message = "издает странный звук"
		if ("trill")
			m_type = 2
			cloud_emote = "cloud-love"
			if(!muzzled)
				message = "издает тихую трель"
				playsound(loc, 'sound/voice/trill.ogg', 50, 1, -1) // Copyright CC BY-NC 3.0 Arnaud Coutancier (freesound.org) for the source audio.
			else
				message = "издает странный звук"
		if ("geck")
			m_type = 2
			cloud_emote = "cloud-scream" //of course
			if(!muzzled)
				message = "пищит как фенек"
				playsound(loc, 'sound/voice/geck.ogg', 50, 1, -1)
			else
				message = "издает странный звук"
		if ("squish")
			m_type = 2
			if(!muzzled)
				message = "хлюпает"
				playsound(loc, 'sound/voice/slime_squish.ogg', 50, 1, -1)  //Credit to DrMinky (freesound.org) for the sound.
			else
				message = "издает странный звук"
		if ("bark")
			m_type = 2
			cloud_emote = "cloud-scream"
			if(!muzzled)
				message = "гавкает"
				playsound(loc, 'sound/voice/bark2.ogg', 50, 1, -1)
			else
				message = "издает странный звук"
		if ("hiss")
			m_type = 2
			cloud_emote = "cloud-scream"
			if(!muzzled)
				message = "шипит"
				playsound(loc, 'sound/voice/hiss.ogg', 50, 1, -1)
			else
				message = "издает странный звук"
		if ("squeak")
			m_type = 2
			if(!muzzled)
				message = "издает писк"
				playsound(loc, 'sound/effects/mouse_squeak.ogg', 50, 1, -1)
			else
				message = "издает странный звук"
		if ("purr")
			m_type = 2
			cloud_emote = "cloud-love"
			if(!muzzled)
				message = "тихонько мурчит"
				playsound(loc, 'sound/voice/purr.ogg', 50, 1, -1)
			else
				message = "издает странный звук"
		if ("ycackle")
			m_type = 2
			cloud_emote = "cloud-scream"
			if(!muzzled)
				message = "хохочет как гиена"
				playsound(loc, 'sound/voice/YeenCackle.ogg', 50, 1, -1)
			else
				message = "издает странный звук"
		if ("shriek")
			m_type = 2
			cloud_emote = "cloud-scream"
			if(!muzzled)
				message = "<span class='danger'>пронзительно визжит!</span>"
				playsound(loc, 'sound/voice/shriek.ogg', 50, 1, -1)
			else
				message = "издает странный звук"
		if ("bellow")
			m_type = 2
			if(!muzzled)
				message = "сверепо ревёт"
				playsound(loc, 'sound/voice/LizardBellow.ogg', 50, 1, -1)
			else
				message = "издает странный звук"
		if ("squeal")
			m_type = 2
			if(!muzzled)
				message = "издает писк"
				playsound(loc, 'sound/voice/LizardSqueal.ogg', 50, 1, -1)
			else
				message = "издает странный звук"
		if ("moo")
			m_type = 2
			if(!muzzled)
				message = "мычит"
				playsound(loc, 'sound/voice/moo1.ogg', 50, 1, -1) //credit to minecraft for the sound effect!
			else
				message = "издает странный звук"
		if ("bleat")
			m_type = 2
			if(!muzzled)
				message = "блеет"
				playsound(loc, 'sound/voice/bleat.ogg', 50, 1, -1) //credit to bigsoundbank for the effect.
			else
				message = "издает странный звук"
		if ("warble")
			m_type = 2
			if(!muzzled)
				message = "издает радостную трель"
				playsound(loc, 'sound/voice/warble.ogg', 50, 1, -1)
			else
				message = "издает странный звук"
		if ("lwarble")
			m_type = 2
			if(!muzzled)
				message = "издает низкую трель"
				playsound(loc, 'sound/voice/lowwarble.ogg', 50, 1, -1)
			else
				message = "издает странный звук"
		if ("croon")
			m_type = 2
			if(!muzzled)
				switch(pick("1", "2"))
					if("1")
						message = "протяжно квакает"
						playsound(loc, 'sound/voice/croon1.ogg', 50, 1, -1)
					if("2")
						message = "издает протяжное квакание"
						playsound(loc, 'sound/voice/croon2.ogg', 50, 1, -1)
			else
				message = "издает странный звук"
		if ("croak")
			m_type = 2
			if(!muzzled)
				message = "хрипло квакает"
				playsound(loc, 'sound/voice/croak.ogg', 50, 1, -1)
			else
				message = "издает странный звук"
		if ("chitter")
			m_type = 2
			if(!muzzled)
				message = "чирикает словно насекомое"
				switch(pick("1", "2"))
					if("1")
						playsound(loc, 'sound/voice/chitter1.ogg', 50, 1, -1)
					if("2")
						playsound(loc, 'sound/voice/chitter2.ogg', 90, 1, -1)
			else
				message = "издает странный звук"
		if ("help")
			to_chat(src, "aslap-(none)/mob, awhistle-(none)/mob, awoo, bark, bellow, bleat, blink, blink_r, blush, bow-(none)/mob, chirp, chitter, choke, chuckle, clap, croon1, croon2, croak, collapse, cough, cry, custom, deathgasp, drool, eyebrow, \
					facepalm, frown, gasp, geck, giggle, glare-(none)/mob, grin, groan, grumble, handshake, hiss, hug-(none)/mob, laugh, look-(none)/mob, merp, moan, moo, mumble, mwah-(none)/mob, nod, nya, painscream, pale, peep, point-atom, qwhistle, \
					raise, scream, sneeze, shake, shiver, shriek, shrug, sigh, signal-#1-10, squish, slap-(none)/mob, smile, sneeze, sniff, snore, stare-(none)/mob, squeak, squeal, throat, tremble, trill, twitch, twitch_s, urah, vomit, weh, whimper, wink, yawn,\
					ycackle, zartan. Synthetics: beep, buzz, yes, no, rcough, rsneeze, ping")
		if("closeeay") //coffe edit
			message = "закатывает глаза"
			m_type = 1
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
