/* Cards
 * Contains:
 *		DATA CARD
 *		ID CARD
 *		FINGERPRINT CARD HOLDER
 *		FINGERPRINT CARD
 *		KEYS
 */


/*
 * DATA CARDS - Used for the teleporter
 */
/obj/item/card
	name = "card"
	desc = "Does card things."
	icon = 'icons/obj/card.dmi'
	w_class = ITEM_SIZE_TINY

	var/list/files = list(  )

/obj/item/card/data
	name = "data disk"
	desc = "A disk of data."
	icon_state = "data"
	var/function = "storage"
	var/data = "null"
	var/special = null
	item_state = "card-id"

/obj/item/card/data/verb/label(t as text)
	set name = "Label Disk"
	set category = "Object"
	set src in usr

	if (t)
		src.name = text("data disk- '[]'", t)
	else
		src.name = "data disk"
	src.add_fingerprint(usr)
	return

/obj/item/card/data/clown
	name = "\proper the coordinates to clown planet"
	icon_state = "data"
	item_state = "card-id"
	layer = 3
	level = ABOVE_PLATING_LEVEL
	desc = "This card contains coordinates to the fabled Clown Planet. Handle with care."
	function = "teleporter"
	data = "Clown Land"

/*
 * ID CARDS
 */

/obj/item/card/emag_broken
	desc = "It's a card with a magnetic strip attached to some circuitry. It looks too busted to be used for anything but salvage."
	name = "broken cryptographic sequencer"
	icon_state = "emag"
	item_state = "card-id"
	origin_tech = list(TECH_MAGNET = 2, TECH_ILLEGAL = 2)
	matter = list(MATERIAL_SILVER = 1, MATERIAL_PLASTIC = 1)

/obj/item/card/emag
	desc = "It's a card with a magnetic strip attached to some circuitry."
	name = "cryptographic sequencer"
	icon_state = "emag"
	item_state = "card-id"
	origin_tech = list(TECH_MAGNET = 2, TECH_ILLEGAL = 2)
	matter = list(MATERIAL_SILVER = 1, MATERIAL_PLASTIC = 1)
	var/uses = 10

var/const/NO_EMAG_ACT = -50
/obj/item/card/emag/resolve_attackby(atom/A, mob/user)
	var/used_uses = A.emag_act(uses, user, src)
	if(used_uses == NO_EMAG_ACT)
		return ..(A, user)

	uses -= used_uses
	A.add_fingerprint(user)
	if(used_uses)
		log_and_message_admins("emagged \an [A].")

	if(uses<1)
		user.visible_message(SPAN_WARNING("\The [src] fizzles and sparks - it seems it's been used once too often, and is now spent."))
		user.drop_item()
		var/obj/item/card/emag_broken/junk = new(user.loc)
		junk.add_fingerprint(user)
		qdel(src)

	return 1

/obj/item/card/id
	name = "identification card"
	desc = "A card used to provide ID and determine access across the colony."
	icon_state = "id"
	item_state = "card-id"
	slot_flags = SLOT_ID

	var/access = list()
	var/registered_name = "Unknown" // The name registered_name on the card
	var/list/associated_email_login = list("login" = "", "password" = "")
	var/associated_account_number = 0

	var/age = "\[UNSET\]"
	var/blood_type = "\[UNSET\]"
	var/dna_hash = "\[UNSET\]"
	var/fingerprint_hash = "\[UNSET\]"
	var/sex = "\[UNSET\]"
	var/icon/front

	//alt titles are handled a bit weirdly in order to unobtrusively integrate into existing ID system
	var/assignment = null	//can be alt title or the actual job
	var/rank = null			//actual job
	var/dorm = 0			// determines if this ID has claimed a dorm already

	var/mining_points = 0 //mining points on the ID

	var/formal_name_prefix
	var/formal_name_suffix
	var/claimed_locker = FALSE

	var/group = "colony" // ID class used for wallet code - Seb

/obj/item/card/id/examine(mob/user)
	set src in oview(1)
	if(mining_points)
		to_chat(usr, "There are [mining_points] mining points on the card.")
	if(in_range(usr, src))
		show(usr)
		to_chat(usr, desc)
		to_chat(usr, text("\icon[] []: The current assignment on the card is [].", src, src.name, src.assignment))
		to_chat(usr, "The blood type on the card is [blood_type].")
		to_chat(usr, "The DNA hash on the card is [dna_hash].")
		to_chat(usr, "The fingerprint hash on the card is [fingerprint_hash].")
	else
		to_chat(usr, SPAN_WARNING("It is too far away."))


/obj/item/card/id/proc/prevent_tracking()
	return 0

/obj/item/card/id/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "IDCard", name)
		ui.open()

/obj/item/card/id/ui_data(mob/user)
	var/list/data = list()

	data["registered_name"] = registered_name
	data["sex"] = sex
	data["age"] = age
	data["assignment"] = assignment
	data["fingerprint_hash"] = fingerprint_hash
	data["blood_type"] = blood_type
	data["dna_hash"] = dna_hash

	return data

/obj/item/card/id/proc/show(mob/user as mob)
	if(front)
		user << browse_rsc(front, "front.png")
	ui_interact(user)

/obj/item/card/id/proc/update_name()
	name = "[src.registered_name]'s ID Card ([src.assignment])"

/obj/item/card/id/proc/set_id_photo(var/mob/M)
	front = getFlatIcon(M, SOUTH)

/mob/proc/set_id_info(var/obj/item/card/id/id_card)
	id_card.age = 0
	id_card.registered_name		= real_name
	id_card.sex 				= capitalize(gender)
	id_card.set_id_photo(src)

	if(dna)
		id_card.blood_type		= dna.b_type
		id_card.dna_hash		= dna.unique_enzymes
		id_card.fingerprint_hash= md5(dna.uni_identity)
	id_card.update_name()

/mob/living/carbon/human/set_id_info(var/obj/item/card/id/id_card)
	..()
	id_card.age = age

/obj/item/card/id/attack_self(mob/user as mob)
	user.visible_message("\The [user] shows you: \icon[src] [src.name]. The assignment on the card: [src.assignment]",\
		"You flash your ID card: \icon[src] [src.name]. The assignment on the card: [src.assignment]")

	src.add_fingerprint(user)
	return

/obj/item/card/id/GetAccess()
	return access

/obj/item/card/id/GetIdCard()
	return src

/obj/item/card/id/syndicate_command
	name = "syndicate ID card"
	desc = "An ID straight from the Syndicate."
	registered_name = "Syndicate"
	assignment = "Syndicate Overlord"
	access = list(access_syndicate, access_external_airlocks)
	group = "centcom"

/obj/item/card/id/captains_spare
	name = "premier's spare ID"
	desc = "A golden and pompous spare ID, for when a new premier is elected or in the shameful case an existing one lost his original badge. The most stolen item on the colony."
	icon_state = MATERIAL_GOLD
	item_state = "gold_id"
	registered_name = "Premier"
	assignment = "Premier"
	group = "golden"

/obj/item/card/id/captains_spare/New()
	access = get_all_station_access()
	..()

/obj/item/card/id/synthetic
	name = "\improper Synthetic ID"
	desc = "Access module for NanoTrasen Synthetics."
	icon_state = "id-robot"
	item_state = "tdgreen"
	assignment = "Synthetic"

/obj/item/card/id/synthetic/New()
	access = get_all_station_access() + access_synth
	..()

/obj/item/card/id/all_access
	name = "\improper Administrator's spare ID"
	desc = "The spare ID of the Lord of Lords themselves."
	icon_state = "data"
	item_state = "tdgreen"
	registered_name = "Administrator"
	assignment = "Administrator"
	group = "centcom"

/obj/item/card/id/all_access/New()
	access = get_access_ids()
	..()

/obj/item/card/id/centcom
	name = "\improper CentCom. ID"
	desc = "An ID straight from Central Command."
	icon_state = "centcom"
	registered_name = "Central Command"
	assignment = "General"
	group = "secblue"

/obj/item/card/id/all_access/New()
	access = get_all_centcom_access()
	..()

/obj/item/card/id/gold
	group = "golden"
	icon_state = MATERIAL_GOLD
	item_state = "gold_id"

/obj/item/card/id/sci
	group = "whitesilver"
	icon_state = "id_sci"

/obj/item/card/id/gene
	group = "whitesilver"
	icon_state = "id_gene"

/obj/item/card/id/chem
	group = "whitesilver"
	icon_state = "id_chem"

/obj/item/card/id/med
	group = "whitesilver"
	icon_state = "id_med"

/obj/item/card/id/sci
	group = "whitesilver"
	icon_state = "id_sci"

/obj/item/card/id/viro
	group = "whitesilver"
	icon_state = "id_viro"

/obj/item/card/id/heatlab
	group = "whitesilver"
	icon_state = "id_heatlab"

/obj/item/card/id/rd
	group = "whitesilver"
	icon_state = "id_rd"

/obj/item/card/id/cmo
	group = "whitesilver"
	icon_state = "id_cmo"

/obj/item/card/id/det
	group = "secblue"
	icon_state = "id_inspector"

/obj/item/card/id/medcpec
	group = "secblue"
	icon_state = "id_medspec"

/obj/item/card/id/sec
	group = "secblue"
	icon_state = "id_operative"

/obj/item/card/id/hos
	group = "secblue"
	icon_state = "id_hos"

/obj/item/card/id/hop
	icon_state = "id_hop"

/obj/item/card/id/ce
	group = "engineers"
	icon_state = "id_ce"

/obj/item/card/id/engie
	group = "engineers"
	icon_state = "id_engie"

/obj/item/card/id/atmos // Currently unused.
	group = "engineers"
	icon_state = "id_atmos"

/obj/item/card/id/car
	group = "engineers" // Not an engie, but the sepia fits.
	icon_state = "id_car"

/obj/item/card/id/hydro
	group = "greenone"
	icon_state = "id_hydro"

/obj/item/card/id/chaplain
	icon_state = "id_chaplain"

/obj/item/card/id/church
	icon_state = "id_nt"

/obj/item/card/id/black
	icon_state = "id_black"

/obj/item/card/id/dkgrey
	icon_state = "id_dkgrey"

/obj/item/card/id/ltgrey
	icon_state = "id_ltgrey"

/obj/item/card/id/white
	group = "whitesilver"
	icon_state = "id_white"

/obj/item/card/id/blankwhite
	group = "whitesilver"
	icon_state = "id_blankwhite"

/obj/item/card/id/lodge
	icon_state = "id_lodge"
	desc = "A bird skull hanging from a leather thong, carved by the hunting lodge and given to members to display name and rank. A small chip inside allows it to be used like any other access badge, encoded with the users biometrics."

/obj/item/card/id/visitor
	icon_state = "guest"
	desc = "An official guest pass issued by the Nadehzda colony. This one bears the mark of Nadezhda customs and has no listed expiry date."

//Keys
/obj/item/keys
	name = "skeleton key"
	desc = "The true key to rule them all, can't open \"deadbolts\"."
	icon = 'icons/obj/card.dmi'
	icon_state = "keys"
	w_class = ITEM_SIZE_TINY

/obj/item/keys/janitor
	name = "janitor keys"
	desc = "A set of keys to open any door, can't open \"deadbolts\"."
	w_class = ITEM_SIZE_BULKY //No hiding this
	slot_flags = SLOT_BELT

/obj/item/keys/lockpicks
	name = "lock picks"
	desc = "A set of lock picks used to open doors, sadly cant pick through \"deadbolts\"."
	icon_state = "lockpick"
