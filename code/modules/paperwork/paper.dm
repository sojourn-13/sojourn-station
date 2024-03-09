// How many fields a sheet of paper may hold.
#define MAX_FIELDS 50

/*
 * Paper
 * also scraps of paper
 */

/obj/item/paper
	name = "sheet of paper"
	gender = NEUTER
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "paper"
	item_state = "paper"
	throwforce = 0
	w_class = ITEM_SIZE_TINY
	throw_range = 1
	throw_speed = 1
	slot_flags = SLOT_HEAD
	body_parts_covered = HEAD
	attack_verb = list("bapped")
	matter = list(MATERIAL_BIOMATTER = 1)
	preloaded_reagents = list("woodpulp" = 3)

	var/info		//What's actually written on the paper.
	var/info_links	//A different version of the paper which includes html links at fields and EOF
	var/stamps		//The (text for the) stamps on the paper.
	var/fields		//Amount of user created fields
	var/free_space = MAX_PAPER_MESSAGE_LEN
	var/stamped		//Bitfield of stamp possibilities.
	var/list/ico[0]      //Icons and
	var/list/offset_x[0] //offsets stored for later
	var/list/offset_y[0] //usage by the photocopier
	var/rigged = 0
	var/spam_flag = 0
	var/crumpled = FALSE
	var/datum/language/language = LANGUAGE_COMMON // Language the paper was written in. Editable by users up until something's actually written

	var/const/deffont = "Verdana"
	var/const/signfont = "Times New Roman"
	var/const/crayonfont = "Comic Sans MS"
	var/crayon_pen = FALSE

/obj/item/paper/ui_host(mob/user)
	if(istype(loc, /obj/structure/noticeboard))
		return loc
	return ..()

/obj/item/paper/card
	name = "blank card"
	desc = "A gift card with space to write on the cover."
	icon_state = "greetingcard"
	slot_flags = null //no fun allowed!!!!

/obj/item/paper/card/AltClick() //No fun allowed
	return

/obj/item/paper/card/update_icon()
	return

/obj/item/paper/card/smile
	name = "happy card"
	desc = "A gift card with a smiley face on the cover."
	icon_state = "greetingcard_smile"

/obj/item/paper/card/cat
	name = "cat card"
	desc = "A gift card with a cat on the cover."
	icon_state = "greetingcard_cat"

/obj/item/paper/card/flower
	name = "flower card"
	desc = "A gift card with a flower on the cover."
	icon_state = "greetingcard_flower"

/obj/item/paper/card/heart
	name = "heart card"
	desc = "A gift card with a heart on the cover."
	icon_state = "greetingcard_heart"

/obj/item/paper/card/New()
	..()
	pixel_y = rand(-8, 8)
	pixel_x = rand(-9, 9)
	stamps = null

	if(info != initial(info))
		info = html_encode(info)
		info = replacetext(info, "\n", "<BR>")
		info = parsepencode(info)
		return

/obj/item/paper/New(loc, text,title, datum/language/L = null)
	..(loc)
	pixel_y = rand(-8, 8)
	pixel_x = rand(-9, 9)
	set_content(text ? text : info, title)

	if (L)
		language = L

	var/old_language = language
	if (!set_language(language, TRUE))
		log_debug("[src] ([type]) initialized with invalid or missing language `[old_language]` defined.")
		set_language(LANGUAGE_COMMON, TRUE)

/obj/item/paper/proc/set_content(text,title)
	if(title)
		name = title
	info = html_encode(text)
	info = parsepencode(text)
	update_icon()
	update_space(info)
	updateinfolinks()

/obj/item/paper/proc/set_language(datum/language/new_language, force = FALSE)
	if (!new_language || (info && !force))
		return FALSE

	if (!istype(new_language))
		new_language = global.all_languages[new_language]
	if (!istype(new_language))
		return FALSE

	language = new_language
	return TRUE

/obj/item/paper/update_icon()
	if (icon_state == "paper_talisman" || icon_state == "Scroll ink") // For Alchemy related stuff
		return
	else if (info)
		icon_state = "paper_words"
	else
		icon_state = "paper"

/obj/item/paper/proc/update_space(var/new_text)
	if(!new_text)
		free_space -= length(strip_html_properly(new_text))

/obj/item/paper/examine(mob/user)
	. = ..()
	if(name != "sheet of paper")
		to_chat(user, "It's titled '[name]'.")
	if(in_range(user, src) || isghost(user))
		show_content(usr)
	else
		to_chat(user, "<span class='notice'>You have to go closer if you want to read it.</span>")

/obj/item/paper/verb/user_set_language()
	set name = "Set writing language"
	set category = "Object"
	set src in usr

	choose_language(usr)

/obj/item/paper/proc/choose_language(mob/user, admin_force = FALSE)
	if (info)
		to_chat(user, SPAN_WARNING("\The [src] already has writing on it and cannot have its language changed."))
		return
	if (!admin_force && !user.languages.len)
		to_chat(user, SPAN_WARNING("You don't know any languages to choose from."))
		return

	var/list/selectable_languages = list()
	if (admin_force)
		for (var/key in global.all_languages)
			var/datum/language/L = global.all_languages[key]
			if (L.has_written_form)
				selectable_languages += L
	else
		for (var/datum/language/L in user.languages)
			if (L.has_written_form)
				selectable_languages += L

	var/new_language = input(user, "What language do you want to write in?", "Change language", language) as null|anything in selectable_languages
	if (!new_language || new_language == language)
		to_chat(user, SPAN_NOTICE("You decide to leave the language as [language.name]."))
		return
	if (!admin_force && !Adjacent(src, user) && !CanInteract(user, GLOB.deep_inventory_state))
		to_chat(user, SPAN_WARNING("You must remain next to or continue holding \the [src] to do that."))
		return
	set_language(new_language)

/obj/item/paper/proc/show_content(mob/user, forceshow, editable = FALSE)
	var/can_read = (istype(user, /mob/living/carbon/human) || isghost(user) || istype(user, /mob/living/silicon)) || forceshow
	if(!forceshow && istype(user,/mob/living/silicon/ai))
		var/mob/living/silicon/ai/AI = user
		can_read = get_dist(src, AI.camera) < 2
	user << browse("<HTML><HEAD><TITLE>[name]</TITLE></HEAD><BODY bgcolor='[color]'>[can_read ? info : stars(info)][stamps]</BODY></HTML>", "window=[name]")

	var/html = "<html><head><title>[name]</title></head><body bgcolor='[color]'>"
	var/body
	if (can_read && editable)
		body = info_links
		if (isobserver(user) || (language in user.languages))
			if (info)
				html += "<p><i>This paper is written in [language.name].</i></p>"
			else
				html += "<p><i>You are writing in <a href='?src=\ref[src];change_language=1'>[language]</a>.</i></p>"
		else
			html += "<p style=\"color: red;\"><i>This paper is written in a language you don't understand.</i></p>"
			body = language.scramble(info, user.languages)
	else if (!can_read)
		html += "<p style=\"color:red;\"><i>The paper is too far away to read.</i></p>"
	else
		body = info
		if (isobserver(user) || (language in user.languages))
			html += "<p><i>This paper is written in [language.name].</i></p>"
		else
			html += "<p style=\"color: red;\"><i>This paper is written in a language you don't understand.</i></p>"
			body = language.scramble(body, user.languages)

	html += "<hr />"
	html += body + stamps
	html += "</body></html>"
	show_browser(user, html, "window=[name]")

	onclose(user, "[name]")

/obj/item/paper/proc/write_content(mob/user)


/obj/item/paper/verb/rename()
	set name = "Rename paper"
	set category = "Object"
	set src in usr
	playsound(src,'sound/effects/PEN_Ball_Point_Pen_Circling_01_mono.ogg',40,1)

	if((CLUMSY in usr.mutations) && prob(15))
		to_chat(usr, SPAN_WARNING("You cut yourself on the paper."))
		papercut()

	var/n_name = sanitizeSafe(input(usr, "What would you like to label the paper?", "Paper Labelling", null)  as text, MAX_NAME_LEN)

	// We check loc one level up, so we can rename in clipboards and such. See also: /obj/item/photo/rename()
	if((loc == usr || loc.loc && loc.loc == usr) && usr.stat == 0 && n_name)
		name = n_name
		add_fingerprint(usr)

/obj/item/paper/proc/papercut(mob/living/user as mob)
	if(user.hand == user.l_hand) // Are we using the left arm?
		user.apply_damage(1, BRUTE, def_zone = BP_L_ARM)
	if(user.hand == user.r_hand) // Are we using the right arm?
		user.apply_damage(1, BRUTE, def_zone = BP_R_ARM)
	else //Were not using are hands so we damage are chest. As were always going to have this lim
		user.apply_damage(1, BRUTE, def_zone = BP_CHEST) //Hope no one does this well missing an arm...



/obj/item/paper/attack_self(mob/living/user as mob)
	if (user.a_intent == I_HURT)
		if (crumpled)
			user.show_message(SPAN_WARNING("\The [src] is already crumpled."))
			return
		//crumple dat paper
		info = stars(info,85)
		user.visible_message("\The [user] crumples \the [src] into a ball!")
		icon_state = "[icon_state]_crumpled"
		playsound(loc, 'sound/effects/paper_crumpling.ogg', 40, 1)
		crumpled = TRUE
		return
	user.examinate(src)
	if(rigged && (Holiday == "April Fool's Day"))
		if (spam_flag == 0)
			spam_flag = 1
			playsound(loc, 'sound/items/bikehorn.ogg', 50, 1)
			spawn(20)
				spam_flag = 0

/obj/item/paper/attack_ai(var/mob/living/silicon/ai/user)
	show_content(user)

/obj/item/paper/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(user.targeted_organ == BP_EYES)
		user.visible_message(SPAN_NOTICE("You show the paper to [M]. "), \
			SPAN_NOTICE(" [user] holds up a paper and shows it to [M]. "))
		M.examinate(src)

	else if(user.targeted_organ == BP_MOUTH) // lipstick wiping
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			if(H == user)
				to_chat(user, SPAN_NOTICE("You wipe off the lipstick with [src]."))
				H.lip_style = null
				H.update_body()
			else
				user.visible_message(SPAN_WARNING("[user] begins to wipe [H]'s lipstick off with \the [src]."), \
								 	 SPAN_NOTICE("You begin to wipe off [H]'s lipstick."))
				if(do_after(user, 10, H) && do_after(H, 10, needhand = 0))	//user needs to keep their active hand, H does not.
					user.visible_message(SPAN_NOTICE("[user] wipes [H]'s lipstick off with \the [src]."), \
										 SPAN_NOTICE("You wipe off [H]'s lipstick."))
					H.lip_style = null
					H.update_body()

/obj/item/paper/proc/addtofield(var/id, var/text, var/links = 0)
	var/locid = 0
	var/laststart = 1
	var/textindex = 1
	while(locid < MAX_FIELDS)
		var/istart = 0
		if(links)
			istart = findtext(info_links, "<span class=\"paper_field\">", laststart)
		else
			istart = findtext(info, "<span class=\"paper_field\">", laststart)

		if(istart == 0)
			return // No field found with matching id

		laststart = istart + 1
		locid++
		if(locid == id)
			var/iend = 1
			if(links)
				iend = findtext(info_links, "</span>", istart)
			else
				iend = findtext(info, "</span>", istart)

			textindex = iend
			break

	if (links)
		var/before = copytext(info_links, 1, textindex)
		var/after = copytext(info_links, textindex)
		info_links = before + text + after
	else
		var/before = copytext(info, 1, textindex)
		var/after = copytext(info, textindex)
		info = before + text + after
		updateinfolinks()

/obj/item/paper/proc/updateinfolinks()
	info_links = info
	var/i = 0
	for(i = 1, i<=fields, i++)
		addtofield(i, "<font face=\"[deffont]\"><A href='?src=\ref[src];write=[i]'>write</A></font>", 1)
	info_links = info_links + "<font face=\"[deffont]\"><A href='?src=\ref[src];write=end'>write</A></font>"


/obj/item/paper/proc/clearpaper()
	info = null
	stamps = null
	free_space = MAX_PAPER_MESSAGE_LEN
	cut_overlays()
	updateinfolinks()
	update_icon()

/obj/item/paper/proc/get_signature(var/obj/item/pen/P, mob/user as mob)
	if (P && istype(P, /obj/item/pen))
		return P.get_signature(user)
	return (user && user.real_name) ? user.real_name : "Anonymous"

/obj/item/paper/proc/parsepencode(var/t, var/obj/item/pen/P, mob/user as mob, var/iscrayon = 0)
	if (length(t) == 0)
		return ""

	if (findtext(t, "\[sign\]"))
		t = replacetext(t, "\[sign\]", "<font face=\"[signfont]\"><i>[get_signature(P, user)]</i></font>")

	if (iscrayon) // If it is a crayon, and he still tries to use these, make them empty!
		t = replacetext(t, "\[*\]", "")
		t = replacetext(t, "\[hr\]", "")
		t = replacetext(t, "\[small\]", "")
		t = replacetext(t, "\[/small\]", "")
		t = replacetext(t, "\[list\]", "")
		t = replacetext(t, "\[/list\]", "")
		t = replacetext(t, "\[table\]", "")
		t = replacetext(t, "\[/table\]", "")
		t = replacetext(t, "\[grid\]", "")
		t = replacetext(t, "\[/grid\]", "")
		t = replacetext(t, "\[row\]", "")
		t = replacetext(t, "\[cell\]", "")
		t = replacetext(t, "\[logo\]", "")

	if (iscrayon)
		t = "<font face=\"[crayonfont]\" color=[P ? P.colour : "black"]><b>[t]</b></font>"
		crayon_pen = TRUE
	else
		t = "<font face=\"[deffont]\" color=[P ? P.colour : "black"]>[t]</font>"

	t = pencode2html(t)

	//Count the fields
	var/laststart = 1
	while(fields < MAX_FIELDS)
		var/i = findtext(t, "<span class=\"paper_field\">", laststart)	//</span>
		if(i == 0)
			break
		laststart = i + 1
		fields++

	return t

/obj/item/paper/proc/burnpaper(obj/item/flame/P, mob/user)
	var/class = "warning"

	if(P.lit && !user.restrained())
		if(istype(P, /obj/item/flame/lighter/zippo))
			class = "rose"

		user.visible_message("<span class='[class]'>[user] holds \the [P] up to \the [src], it looks like \he's trying to burn it!</span>", \
		"<span class='[class]'>You hold \the [P] up to \the [src], burning it slowly.</span>")

		spawn(20)
			if(get_dist(src, user) < 2 && user.get_active_hand() == P && P.lit)
				user.visible_message("<span class='[class]'>[user] burns right through \the [src], turning it to ash. It flutters through the air before settling on the floor in a heap.</span>", \
				"<span class='[class]'>You burn right through \the [src], turning it to ash. It flutters through the air before settling on the floor in a heap.</span>")

				if(user.get_inactive_hand() == src)
					user.drop_from_inventory(src)

				new /obj/effect/decal/cleanable/ash(src.loc)
				qdel(src)

			else
				to_chat(user, "\red You must hold \the [P] steady to burn \the [src].")


/obj/item/paper/Topic(href, href_list)
	..()
	if(!usr || (usr.stat || usr.restrained()))
		return

	if (href_list["change_language"])
		choose_language(usr)
		show_content(usr, editable = TRUE)
		return

	if(href_list["write"])
		var/id = href_list["write"]
		//var/t = strip_html_simple(input(usr, "What text do you wish to add to " + (id=="end" ? "the end of the paper" : "field "+id) + "?", "[name]", null),8192) as message

		if(free_space <= 0)
			to_chat(usr, "<span class='info'>There isn't enough space left on \the [src] to write anything.</span>")
			return

		var/t =  sanitize(input("Enter what you want to write:", "Write", null, null) as message, free_space, extra = 0)

		if(!t)
			return

		var/obj/item/i = usr.get_active_hand() // Check to see if he still got that darn pen, also check if he's using a crayon or pen.
		var/iscrayon = 0
		if(!istype(i, /obj/item/pen))
			return

		if(istype(i, /obj/item/pen/crayon))
			iscrayon = 1


		// if paper is not in usr, then it must be near them, or in a clipboard or folder, which must be in or near usr
		if(src.loc != usr && !src.Adjacent(usr) && !((istype(src.loc, /obj/item/clipboard) || istype(src.loc, /obj/item/folder)) && (src.loc.loc == usr || src.loc.Adjacent(usr)) ) )
			return

		var/last_fields_value = fields

		//t = html_encode(t)
		t = replacetext(t, "\n", "<BR>")
		t = parsepencode(t, i, usr, iscrayon) // Encode everything from pencode to html


		if(fields > MAX_FIELDS)//large amount of fields creates a heavy load on the server, see updateinfolinks() and addtofield()
			to_chat(usr, SPAN_WARNING("Too many fields. Sorry, you can't do this."))
			fields = last_fields_value
			return

		if(id!="end")
			addtofield(text2num(id), t) // He wants to edit a field, let him.
		else
			info += t // Oh, he wants to edit to the end of the file, let him.
			updateinfolinks()
		playsound(src,'sound/effects/PEN_Ball_Point_Pen_Circling_01_mono.ogg',40,1)
		update_space(t)

		usr << browse("<HTML><HEAD><TITLE>[name]</TITLE></HEAD><BODY bgcolor='[color]'>[info_links][stamps]</BODY></HTML>", "window=[name]") // Update the window

		update_icon()




/obj/item/paper/attackby(obj/item/P as obj, mob/user as mob)
	..()

	if(P.has_quality(QUALITY_ADHESIVE))
		return //The tool's afterattack will handle this

	if(istype(P, /obj/item/paper) || istype(P, /obj/item/photo))
		if (istype(P, /obj/item/paper/carbon))
			var/obj/item/paper/carbon/C = P
			if (!C.iscopy && !C.copied)
				to_chat(user, SPAN_NOTICE("Take off the carbon copy first."))
				add_fingerprint(user)
				return
		var/obj/item/paper_bundle/B = new(src.loc)
		if (name != "paper")
			B.name = name
		else if (P.name != "paper" && P.name != "photo")
			B.name = P.name
		if (user)
			user.drop_from_inventory(P)
			if (ishuman(user))
				var/mob/living/carbon/human/h_user = user
				if (h_user.r_hand == src)
					h_user.drop_from_inventory(src)
					h_user.put_in_r_hand(B)
				else if (h_user.l_hand == src)
					h_user.drop_from_inventory(src)
					h_user.put_in_l_hand(B)
				else if (h_user.l_store == src)
					h_user.drop_from_inventory(src)
					B.loc = h_user
					B.layer = 20
					h_user.l_store = B
					h_user.update_inv_pockets()
				else if (h_user.r_store == src)
					h_user.drop_from_inventory(src)
					B.loc = h_user
					B.layer = 20
					h_user.r_store = B
					h_user.update_inv_pockets()
				else if (h_user.head == src)
					h_user.u_equip(src)
					h_user.put_in_hands(B)
				else if (!istype(src.loc, /turf))
					src.loc = get_turf(h_user)
					if(h_user.client)	h_user.client.screen -= src
					h_user.put_in_hands(B)
			to_chat(user, SPAN_NOTICE("You clip the [P.name] to [(src.name == "paper") ? "the paper" : src.name]."))
		src.loc = B
		P.loc = B

		B.pages.Add(src)
		B.pages.Add(P)
		B.update_icon()
		return B

	else if(istype(P, /obj/item/pen))
		if(crumpled)
			to_chat(usr, SPAN_WARNING("\The [src] is too crumpled to write on."))
			return

		var/obj/item/pen/robopen/RP = P
		if ( istype(RP) && RP.mode == 2 )
			RP.RenamePaper(user,src)
		else
			user << browse("<HTML><HEAD><TITLE>[name]</TITLE></HEAD><BODY bgcolor='[color]'>[info_links][stamps]</BODY></HTML>", "window=[name]")
		return

	else if(istype(P, /obj/item/stamp))
		if((!in_range(src, usr) && loc != user && !( istype(loc, /obj/item/clipboard) ) && loc.loc != user && user.get_active_hand() != P))
			return
		var/obj/item/stamp/S = P
		playsound(src,'sound/bureaucracy/stamp.ogg',40,1)
		stamp(S.stamp_text ? S.stamp_text : "This paper has been stamped with the [P.name].", "paper_[P.icon_state]", S.xplus, S.xminus, S.yplus, S.yminus)
		stamped &= S.stamp_flags
		user << SPAN_NOTICE("You stamp the paper with your [S.name].")

	else if(istype(P, /obj/item/flame))
		burnpaper(P, user)

	add_fingerprint(user)
	return

/obj/item/paper/proc/stamp(var/text, var/icon_state = "paper_stamp-dots", var/xp = 2, var/xm = -2, var/yp = 2, var/ym = -3, var/color)
	stamps += (stamps=="" ? "<HR>" : "<BR>") + "<i>[text]</i>"

	var/image/stampoverlay = image('icons/obj/bureaucracy.dmi', icon_state)
	stampoverlay.color = color
	var/x = rand(xm, xp)
	var/y = rand(ym, yp)
	offset_x += x
	offset_y += y
	stampoverlay.pixel_x = x
	stampoverlay.pixel_y = y

	if(!ico)
		ico = new
	ico += icon_state

	add_overlay(stampoverlay)

/*
 * Premade paper
 */
/obj/item/paper/euro
	language = LANGUAGE_EURO

/obj/item/paper/slavic
	language = LANGUAGE_CYRILLIC

/obj/item/paper/illyrian
	language = LANGUAGE_ILLYRIAN

/obj/item/paper/jana
	language = LANGUAGE_JANA

/obj/item/paper/yassari
	language = LANGUAGE_YASSARI

/obj/item/paper/opifex
	language = LANGUAGE_OPIFEXEE

/obj/item/paper/latin
	language = LANGUAGE_LATIN

/obj/item/paper/romana
	language = LANGUAGE_ROMANA

/obj/item/paper/cult
	language = LANGUAGE_CULT	//May god save your soul.

/obj/item/paper/Court
	name = "Judgement"
	info = "For crimes against the Nadezhda colony, the offender is sentenced to:<BR>\n<BR>\n"

/obj/item/paper/crumpled
	name = "paper scrap"
	icon_state = "paper_crumpled"
	crumpled = TRUE

/obj/item/paper/crumpled/update_icon()
	if (icon_state == "paper_crumpled_bloodied")
		return
	else if (info)
		icon_state = "paper_words_crumpled"
	else
		icon_state = "paper_crumpled"
	return

/obj/item/paper/crumpled/bloody
	icon_state = "paper_crumpled_bloodied"

/obj/item/paper/neopaper
	name = "sheet of odd paper"
	icon_state = "paper_neo"

/obj/item/paper/neopaper/update_icon()
	if(info)
		icon_state = "paper_neo_words"
	else
		icon_state = "paper_neo"
	return

/obj/item/paper/crumpled/neo
	name = "odd paper scrap"
	icon_state = "paper_neo_crumpled"

/obj/item/paper/crumpled/neo/update_icon()
	if (icon_state == "paper_neo_crumpled_bloodied")
		return
	else if (info)
		icon_state = "paper_neo_words_crumpled"
	else
		icon_state = "paper_neo_crumpled"
	return

/obj/item/paper/crumpled/neo/bloody
	icon_state = "paper_neo_crumpled_bloodied"

#undef MAX_FIELDS
