/*
	Badges are worn on the belt or neck, and can be used to show that the holder is an authorized
	Security agent - the user details can be imprinted on holobadges with a Security-access ID card,
	or they can be emagged to accept any ID for use in disguises.
*/


//All badge sprites done by - CeUvi

/obj/item/clothing/accessory/badge
	name = "Ranger's badge"
	desc = "A marshal ranger badge, made from gold and set on leather."
	icon_state = "badge"
	item_state = "marshalbadge"
	slot_flags = SLOT_BELT | SLOT_ACCESSORY_BUFFER
	price_tag = 200

	var/stored_name
	var/badge_string = "Marshal"

/obj/item/clothing/accessory/badge/old
	name = "faded badge"
	desc = "A faded badge, backed with leather. It bears the emblem of a forensic division."
	icon_state = "badge_round"

/obj/item/clothing/accessory/badge/proc/set_name(var/new_name)
	stored_name = new_name
	name = "[initial(name)] ([stored_name])"

/obj/item/clothing/accessory/badge/attack_self(mob/user as mob)

	if(!stored_name)
		to_chat(user, "You polish your badge fondly, shining up the surface.")
		set_name(user.real_name)
		return

	if(isliving(user))
		if(stored_name)
			user.visible_message(SPAN_NOTICE("[user] displays their [src.name].\nIt reads: [stored_name], [badge_string]."),SPAN_NOTICE("You display your [src.name].\nIt reads: [stored_name], [badge_string]."))
		else
			user.visible_message(SPAN_NOTICE("[user] displays their [src.name].\nIt reads: [badge_string]."),SPAN_NOTICE("You display your [src.name]. It reads: [badge_string]."))

/obj/item/clothing/accessory/badge/attack(mob/living/carbon/human/M, mob/living/user)
	if(isliving(user))
		user.visible_message(SPAN_DANGER("[user] invades [M]'s personal space, thrusting [src] into their face insistently."),SPAN_DANGER("You invade [M]'s personal space, thrusting [src] into their face insistently."))

//.Holobadges.
/obj/item/clothing/accessory/badge/holo
	name = "holobadge"
	desc = "This glowing blue badge marks the holder as a member of security."
	icon_state = "holobadge"
	item_state = "holobadge"
	badge_string = "Marshals"
	var/emagged //Emagging removes Sec check.

/obj/item/clothing/accessory/badge/holo/tag
	name = "marshal holotag"
	desc = "This pair of glowing plates is meant to be attached to armor or clothing and marks the wearer as a member of security."
	icon_state = "holotag"
	item_state = "holotag"
	badge_string = "Marshals"

/obj/item/clothing/accessory/badge/holo/cord
	icon_state = "holobadge-cord"
	slot_flags = SLOT_MASK | SLOT_ACCESSORY_BUFFER


/obj/item/clothing/accessory/badge/holo/wo
	name = "holobadge"
	desc = "This glowing golden badge marks the holder as a member of security."
	icon_state = "marshalbadge"
	item_state = "marshalbadge"

/obj/item/clothing/accessory/badge/holo/inspector
	name = "holobadge"
	desc = "This glowing silver badge marks the holder as a member of security."
	icon_state = "inspectorbadge"
	item_state = "inspectorbadge"

/obj/item/clothing/accessory/badge/holo/co
	name = "holobadge"
	desc = "This glowing red badge marks the holder as a member of blackshield."
	icon_state = "sargebadge"
	item_state = "sargebadge"

/obj/item/clothing/accessory/badge/holo/warden
	name = "holobadge"
	desc = "This glowing cyan badge marks the holder as a member of security."
	icon_state = "specbadge"
	item_state = "holobadge"

/obj/item/clothing/accessory/badge/holo/attack_self(mob/user as mob)
	if(!stored_name)
		to_chat(user, "Waving around a holobadge before swiping an ID would be pretty pointless.")
		return
	return ..()

/obj/item/clothing/accessory/badge/holo/emag_act(var/remaining_charges, var/mob/user)
	if (emagged)
		to_chat(user, SPAN_DANGER("\The [src] is already cracked."))
		return
	else
		emagged = 1
		to_chat(user, SPAN_DANGER("You crack the holobadge security checks."))
		return 1

/obj/item/clothing/accessory/badge/holo/attackby(var/obj/item/O as obj, var/mob/user as mob)
	var/obj/item/card/id/id_card = O.GetIdCard()
	if(!id_card)
		return

	if(access_security in id_card.access || emagged)
		to_chat(user, "You imprint your ID details onto the badge.")
		set_name(user.real_name)
	else
		to_chat(user, "[src] rejects your insufficient access rights.")
	return

/obj/item/storage/box/holobadge
	name = "holobadge box"
	desc = "A box claiming to contain holobadges."
	New()
		new /obj/item/clothing/accessory/badge/holo(src)
		new /obj/item/clothing/accessory/badge/holo(src)
		new /obj/item/clothing/accessory/badge/holo/tag(src)
		new /obj/item/clothing/accessory/badge/holo/tag(src)
		new /obj/item/clothing/accessory/badge/holo/cord(src)
		new /obj/item/clothing/accessory/badge/holo/cord(src)
		..()
		return


/obj/item/clothing/accessory/badge/warden
	name = "Supply specialist badge"
	desc = "A silver supply specialist badge. Stamped with the words 'SS.'"
	icon_state = "silverbadgez"
	slot_flags = SLOT_ACCESSORY_BUFFER


/obj/item/clothing/accessory/badge/hos
	name = "Warrant officer's badge"
	desc = "An immaculately polished gold Warrant Officer badge."
	icon_state = "goldbadge"
	slot_flags = SLOT_ACCESSORY_BUFFER

/obj/item/clothing/accessory/badge/smc
	name = "blackshield commander's badge"
	desc = "An immaculately polished gold blackshield commander badge."
	icon_state = "goldbadge"
	badge_string = "Blackshield"
	slot_flags = SLOT_ACCESSORY_BUFFER

/obj/item/clothing/accessory/badge/marshal
	name = "Marshal Agent's badge"
	desc = "A leather-backed gold badge displaying the crest of the Brigadier and Provost Marshal, signifying the wearer as an agent of both, carrying the full authority over both organizations."
	icon_state = "agentbadge"
	badge_string = "Special Agent"

/obj/item/clothing/accessory/badge/militiaagent
	name = "blackshield specialist's badge"
	desc = "A leather-backed gold badge displaying the crest of the Brigadier and Provost Marshal, signifying the wearer as an agent of both, carrying the full authority over both organizations."
	icon_state = "agentbadge"
	badge_string = "Specialist"
