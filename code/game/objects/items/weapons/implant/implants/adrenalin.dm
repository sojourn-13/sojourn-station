/obj/item/implant/adrenaline
	name = "adrenaline"
	desc = "Removes all stuns and knockdowns."
	icon_state = "implant_chem"
	var/uses = 3
	allowed_organs = list(BP_CHEST)
	origin_tech = list(TECH_MATERIAL=2, TECH_BIO=4, TECH_COMBAT=3, TECH_ILLEGAL=4)

	overlay_icon = "chem"

/obj/item/implant/adrenaline/get_data()
	var/data = {"
		<b>Implant Specifications:</b><BR>
		<b>Name:</b> Cybersun Industries Adrenalin Implant<BR>
		<b>Life:</b> Five days.<BR>
		<b>Important Notes:</b> <font color='red'>Illegal</font><BR>
		<HR>
		<b>Implant Details:</b> Subjects injected with implant can activate a massive injection of adrenalin.<BR>
		<b>Function:</b> Contains nanobots to stimulate body to mass-produce Adrenalin.<BR>
		<b>Special Features:</b> Will prevent and cure most forms of brainwashing.<BR>
		<b>Integrity:</b> Implant can only be used three times before the nanobots are depleted."}
	return data


/obj/item/implant/adrenaline/trigger(emote, mob/living/source)
	if (uses < 1)
		return
	if (emote == "pale")
		src.uses--
		to_chat(source, SPAN_NOTICE("You feel a sudden surge of energy!"))
		source.SetStunned(0)
		source.SetWeakened(0)
		source.SetParalysis(0)

/obj/item/implant/adrenaline/on_install(mob/living/source)
	source.mind.store_memory("Your implant can be activated by using the pale emote, <B>say *pale</B> to attempt to activate.", 0, 0)
	to_chat(source, "The implanted adrenaline implant can be activated by using the pale emote, <B>say *pale</B> to attempt to activate.")


/obj/item/implantcase/adrenaline
	name = "glass case - 'adrenaline'"
	desc = "A case containing an adrenaline implant."
	implant = /obj/item/implant/adrenaline


/obj/item/implanter/adrenaline
	name = "adrenaline implanter"
	desc = "An implanter containing an adrenaline implant."
	implant = /obj/item/implant/adrenaline
