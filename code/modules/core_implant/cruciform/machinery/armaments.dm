/datum/armament
	var/name = "Virtue of coding"
	var/desc = "God made it quite clear this should not exist, Perhaps inform those above."
	var/cost = 100
	var/min_cost = 10 //absolute minimum it should cost
	var/path = /obj/item/computer_hardware/hard_drive/portable/design/nt/bioprinter //path to spawn
	var/purchase_count = 0 //how many times its bought
	var/discount_increase = 25 //discount increase per purchase
	var/discount = 0 //total discount to apply to the cost
	var/max_discount = 0 //max amount of discounts
	var/rate_increase = 0 //rate increase per purchase
	var/max_rate_increase = 0 //max rate increase from buying this
	var/max_increase = 25 //increase of eotp max armament points per purchase

//modifiers in the future? maybe some rituals to reduce cost for certain subtype
/datum/armament/proc/get_cost()
	return max(min_cost, cost - discount)

/datum/armament/proc/purchase(var/mob/living/carbon/H)
	if (!eotp)
		error("No EOTP found to purchase from.")
		return FALSE
	if (get_dist(eotp.loc, H.loc) > 3)
		log_and_message_admins("[key_name(H)] tried to make a topic call out of range of the [eotp]")
		return FALSE

	if (!is_neotheology_disciple(H))
		to_chat(H, SPAN_DANGER("You do not understand how to use this."))
		return FALSE

	if (eotp.armaments_points < get_cost())
		to_chat(H, SPAN_DANGER("You lack the required amount of armament points."))
		return FALSE

	eotp.armaments_points -= get_cost()

	purchase_count++

	if (!max_discount)
		discount = discount + discount_increase
	else
		discount = min(max_discount, discount + discount_increase)


	if (purchase_count < 2)
		eotp.max_armaments_points += max_increase

	on_purchase(H)

	log_and_message_admins("[key_name(H)] has invoked [src.name]")
	return TRUE


//maybe buying buffs, blessings, miracles, etc instead of just items
/datum/armament/proc/on_purchase(var/mob/living/carbon/H)
	return


/obj/machinery/power/eotp/ui_data(mob/user)
	var/list/data = list()
	var/list/listed_armaments = list()
	for(var/i=1 to armaments.len)
		var/datum/armament/A = armaments[i]
		listed_armaments.Add(list(list(
			"key" = i,
			"name" = strip_improper(A.name),
			"cost" = A.get_cost(),
			"desc" = A.desc)))
	data["armaments"] = listed_armaments
	return data


/obj/machinery/power/eotp/nano_ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = NANOUI_FOCUS)
	var/list/data = ui_data(user, ui_key)

	ui = SSnano.try_update_ui(user, eotp, ui_key, ui, data, force_open)
	if (!ui)
		// the ui does not exist, so we'll create a new() one
		// for a list of parameters and their descriptions see the code docs in \code\modules\nano\nanoui.dm
		ui = new(user, src, ui_key, "eopt.tmpl", "Eye of the protector", 550, 655)
		// when the ui is first opened this is the data it will use
		ui.set_initial_data(data)
		// open the new ui window
		ui.open()

/obj/machinery/power/eotp/Topic(href, href_list)
	if (href_list["chosen"])
		var/i = text2num(href_list["chosen"])
		var/datum/armament/A = eotp.armaments[i]
		A.purchase(usr)
		SSnano.update_uis(src)

//////////////////////Item summonings
/datum/armament/item
	name = "item summoning"
	desc = "item"
	path = /obj/item/book/ritual/cruciform

//Im really lazy, some one else can make fitting descriptions
/datum/armament/item/New()
	if (desc == initial(desc))
		var/obj/item/I = path
		var/text = initial(I.desc)
		if (text)
			desc = text

/datum/armament/item/on_purchase(mob/living/carbon/H)
	if (path)
		var/obj/_item = new path(get_turf(eotp))
		eotp.visible_message(SPAN_NOTICE("The [_item.name] appears out of bluespace near the [eotp]!"))

/datum/armament/item/disk
	name = "disk"
	cost = 75
	discount_increase = 100
	min_cost = 25

/datum/armament/item/disk/New()
	if (desc == initial(desc))
		var/obj/item/computer_hardware/hard_drive/portable/design/D = path
		var/text = initial(D.disk_name)
		if (text)
			desc = text


/datum/armament/item/disk/cells
	name = "Power Cells disk"
	cost = 75
	min_cost = 50
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/cells

/datum/armament/item/disk/pouches
	name = "Bioprinter disk"
	cost = 75
	min_cost = 25
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/bioprinter

/datum/armament/item/disk/mk58
	name = "Rose and Thorn disk"
	cost = 125
	min_cost = 75
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/mk58

/datum/armament/item/disk/nt_counselor
	name = "Serenity disk"
	cost = 125
	min_cost = 75
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/nt_counselor

/datum/armament/item/disk/nt_protector
	name = "Protector disk"
	cost = 175
	min_cost = 125
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/protector

/datum/armament/item/disk/counselor
	name = "Counselor disk"
	cost = 175
	min_cost = 125
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/counselor

/datum/armament/item/disk/antebellum
	name = "Antebellum disk"
	cost = 175
	min_cost = 125
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/antebellum

/datum/armament/item/disk/carpedie
	name = "Carpedie disk"
	cost = 225
	min_cost = 125
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/carpedie

/datum/armament/item/disk/regulator
	name = "Regulator disk"
	cost = 225
	min_cost = 125
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/regulator

/datum/armament/item/disk/halicon
	name = "Halicon disk"
	cost = 225
	min_cost = 125
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/halicon

/datum/armament/item/disk/halicon
	name = "Halicon disk"
	cost = 225
	min_cost = 125
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/halicon

/datum/armament/item/disk/protector
	name = "Protector disk"
	cost = 225
	min_cost = 125
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/protector

/datum/armament/item/disk/grenades
	name = "Grenades disk"
	cost = 225
	min_cost = 175
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/grenades

/datum/armament/item/disk/lemant
	name = "Lemant disk"
	cost = 225
	min_cost = 175
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/lemant

/datum/armament/item/disk/nt_lightfall
	name = "Lightfall disk"
	cost = 275
	min_cost = 200
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/lightfall

/datum/armament/item/disk/nukes
	name = "Grenades disk"
	cost = 275
	min_cost = 200
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/grenades

/datum/armament/item/disk/plasma_shell
	name = "Plasma disk"
	cost = 275
	min_cost = 200
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/plasma_shells

/datum/armament/item/disk/themis
	name = "Themis disk"
	cost = 325
	min_cost = 225
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/themis

/datum/armament/item/disk/purger
	name = "Purger disk"
	cost = 325
	min_cost = 225
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/purger

/datum/armament/item/disk/dominion
	name = "Dominion disk"
	cost = 325
	min_cost = 225
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/dominion

/datum/armament/item/disk/old_test_disk
	name = "Old Testiment disk"
	cost = 375
	min_cost = 250
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/old_guns

/datum/armament/item/disk/new_test_disk
	name = "New Testiment disk"
	cost = 400
	min_cost = 350
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/new_guns

/datum/armament/item/grenade
	name = "Grenade"
	desc = "Summoning of boom booms"
	path = /obj/item/grenade/explosive/nt
	cost = 275
	min_cost = 200
	discount_increase = 100

/datum/armament/item/gun
	name = "gun"
	discount_increase = 100

/datum/armament/item/gun/largecrossobw
	name = "Large crossbow"
	path = /obj/item/gun/energy/crossbow/largecrossbow
	cost = 125
	min_cost = 50

/datum/armament/item/gun/destroyer
	name = "Destroyer"
	path = /obj/item/gun/energy/plasma/destroyer
	cost = 325
	min_cost = 200

/datum/armament/item/gun/firstaid
	name = "Absolutism Medkit"
	path = /obj/item/storage/firstaid/nt
	cost = 325
	min_cost = 200
