
//For Blackshield Kits
/obj/machinery/vending/blackshield_kit
	name = "\improper Blackshield Kit Vendor"
	desc = "A vendor that can dispense specialized equipment kits for Blackshield Troopers."
	icon_state = "trashvend"
	products = list( // 5 in stock for the default blackshield kit, 3 for the rest
		/obj/item/storage/box/bs_kit/mosin = 2,
		//obj/item/storage/box/bs_kit/vintorez = 2,
		//obj/item/storage/box/bs_kit/duty = 3,
		//obj/item/storage/box/bs_kit/sts_para = 2,
		//obj/item/storage/box/bs_kit/rds_omnicarbine = 2,
		/obj/item/storage/box/bs_kit/cog = 2,
		//obj/item/storage/box/bs_kit/drozd = 2,
		//obj/item/storage/box/bs_kit/ekaterina = 3,
		//obj/item/storage/box/bs_kit/bounty = 3,
		/obj/item/storage/box/bs_kit/delta = 2,
		/obj/item/storage/box/bs_kit/rex10 = 2,
		//obj/item/storage/box/bs_kit/pilgrim = 3,
		//obj/item/storage/box/bs_kit/makarov = 3,
		//obj/item/storage/box/bs_kit/martin = 2,
		//obj/item/storage/box/bs_kit/sawn_shotgun = 5,
		//obj/item/storage/box/bs_kit/saiga = 2,
		//obj/item/storage/box/bs_kit/standard_armor = 5,
		//obj/item/storage/box/bs_kit/flak_armor = 3,
		//obj/item/storage/box/bs_kit/bullet_armor = 3,
		//obj/item/storage/box/bs_kit/laser_armor = 3,
		//obj/item/storage/box/bs_kit/standard_armor_corpsman = 2
		)
	prices = list( // 500$ for default Blackshield stuff, 750 for the rest
		/obj/item/storage/box/bs_kit/mosin = 500,
		//obj/item/storage/box/bs_kit/vintorez = 1100,
		//obj/item/storage/box/bs_kit/duty = 950,
		//obj/item/storage/box/bs_kit/sts_para = 1200,
		//obj/item/storage/box/bs_kit/rds_omnicarbine = 1200,
		/obj/item/storage/box/bs_kit/cog = 750,
		//obj/item/storage/box/bs_kit/drozd = 800,
		//obj/item/storage/box/bs_kit/ekaterina = 750,
		//obj/item/storage/box/bs_kit/bounty = 750,
		/obj/item/storage/box/bs_kit/delta = 750,
		/obj/item/storage/box/bs_kit/rex10 = 500,
		//obj/item/storage/box/bs_kit/pilgrim = 750,
		//obj/item/storage/box/bs_kit/makarov = 500,
		//obj/item/storage/box/bs_kit/martin = 500, //....why? We literally SPAWN with a martin.
		//obj/item/storage/box/bs_kit/sawn_shotgun = 500,
		//obj/item/storage/box/bs_kit/saiga = 1000,
		//obj/item/storage/box/bs_kit/standard_armor = 500,
		//obj/item/storage/box/bs_kit/flak_armor = 750,
		//obj/item/storage/box/bs_kit/bullet_armor = 750,
		//obj/item/storage/box/bs_kit/laser_armor = 1250,
		//obj/item/storage/box/bs_kit/standard_armor_corpsman = 1250
		)
	auto_price = FALSE

/obj/machinery/vending/blackshield_kit/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/voucher/blackshield))
		var/obj/item/voucher/blackshield/Voucher = I
		if(Voucher.stamped)
			return
		else
			Voucher.stamped = TRUE
		switch(Voucher.voucher_type)
			if("Primary")
				RedeemPrimary(I, user)
			if("CorpsPrimary")
				RedeemCorpsPrimary(I, user)
			if("SargPrimary")
				RedeemSargPrimary(I, user)
			if("Secondary")
				RedeemSecondary(I, user)
			if("COSecondary")
				RedeemCOSecondary(I, user)
			if("Armor")
				RedeemArmor(I, user)
			if("CorpsmanArmor")
				RedeemCorpsmanArmor(I, user)
		return
	return ..()

/obj/machinery/vending/blackshield_kit/proc/RedeemPrimary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Mosin Kit" = /obj/item/storage/box/bs_kit/mosin,
					"Watchtower Kit" = /obj/item/storage/box/bs_kit/watchtower,
					"Duty Kit" = /obj/item/storage/box/bs_kit/duty,
					"Cog Kit" = /obj/item/storage/box/bs_kit/cog,
					"Ekaterina SMG Kit" = /obj/item/storage/box/bs_kit/ekaterina,
					"Bounty Kit" = /obj/item/storage/box/bs_kit/bounty)
	var/selection = items[input(redeemer, "Pick your primary weapon", "Blackshield Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/blackshield_kit/proc/RedeemCorpsPrimary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Mosin Kit" = /obj/item/storage/box/bs_kit/mosin,
					"Duty Kit" = /obj/item/storage/box/bs_kit/duty,
					"Cog Kit" = /obj/item/storage/box/bs_kit/cog,
					"Lascore kit" = /obj/item/storage/box/bs_kit/lascore,
					"Triage Kit" = /obj/item/storage/box/bs_kit/triage,
					"Ekaterina SMG Kit" = /obj/item/storage/box/bs_kit/ekaterina,
					"Drozd SMG Kit" = /obj/item/storage/box/bs_kit/drozd,
					"Bounty Kit" = /obj/item/storage/box/bs_kit/bounty)
	var/selection = items[input(redeemer, "Pick your primary weapon", "Blackshield Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/blackshield_kit/proc/RedeemSargPrimary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"STS Para Kit" = /obj/item/storage/box/bs_kit/sts_para,
					"Cog Kit" = /obj/item/storage/box/bs_kit/cog,
					"Lascore kit" = /obj/item/storage/box/bs_kit/lascore,
					"Warthog Omni Kit" = /obj/item/storage/box/bs_kit/rds_omnicarbine,
					"Vintorez DMR Kit" = /obj/item/storage/box/bs_kit/vintorez,
					"Saiga Kit" = /obj/item/storage/box/bs_kit/saiga)
	var/selection = items[input(redeemer, "Pick your primary weapon", "Blackshield Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/blackshield_kit/proc/RedeemSecondary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Makarov Kit" = /obj/item/storage/box/bs_kit/makarov,
					"Delta Elite Kit" = /obj/item/storage/box/bs_kit/delta,
					"Cowboy Kit" = /obj/item/storage/box/bs_kit/rex10,
					"Pilgrim Kit" = /obj/item/storage/box/bs_kit/pilgrim,
					"Sawn-Off Shotgun Kit" = /obj/item/storage/box/bs_kit/sawn_shotgun,
					"Martin Kit" = /obj/item/storage/box/bs_kit/martin)
	var/selection = items[input(redeemer, "Pick your side-arm kit", "Blackshield Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/blackshield_kit/proc/RedeemCOSecondary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Mateba Kit" = /obj/item/storage/box/bs_kit/mateba,
					"Argos Kit" = /obj/item/storage/box/bs_kit/gemini,
					"Spider Rose Kit" = /obj/item/storage/box/bs_kit/spider)
	var/selection = items[input(redeemer, "Pick your side-arm kit", "Blackshield Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/blackshield_kit/proc/RedeemArmor(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Plate Armor Kit" = /obj/item/storage/box/bs_kit/standard_armor,
					"Armored Overcoat Kit" = /obj/item/storage/box/bs_kit/militia_overcoat,
					"Flak Armor Kit" = /obj/item/storage/box/bs_kit/flak_armor,
					"Ablative Armor Kit" = /obj/item/storage/box/bs_kit/laser_armor,
					"Bullet-Proof Armor Kit" = /obj/item/storage/box/bs_kit/bullet_armor)
	var/selection = items[input(redeemer, "Pick your armor kit", "Blackshield Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/blackshield_kit/proc/RedeemCorpsmanArmor(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Plate Armor Kit" = /obj/item/storage/box/bs_kit/standard_armor_corpsman,
					"Armored Overcoat Kit" = /obj/item/storage/box/bs_kit/militia_overcoat, //We dont have a Corps-persons
					"Flak Armor Kit" = /obj/item/storage/box/bs_kit/flak_armor,
					"Ablative Armor Kit" = /obj/item/storage/box/bs_kit/laser_armor,
					"Bullet-Proof Armor Kit" = /obj/item/storage/box/bs_kit/bullet_armor)
	var/selection = items[input(redeemer, "Pick your armor Kit", "Blackshield Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

//For Marshal Kits
/obj/machinery/vending/marshal_kit
	name = "\improper Marshal Kit Vendor"
	desc = "A vendor that can dispense specialized equipment kits for Marshal Officers."
	icon_state = "trashvend"
	products = list(
		//obj/item/storage/box/m_kit/freedom = 2,
		//obj/item/storage/box/m_kit/breacher = 5,
		/obj/item/storage/box/m_kit/opshotkit = 2,
		/obj/item/storage/box/m_kit/mamba = 2,
		/obj/item/storage/box/m_kit/gear_lasgun = 2,
		//obj/item/storage/box/m_kit/taser = 5,
		//obj/item/storage/box/m_kit/liberty = 5,
		/obj/item/storage/box/m_kit/judiciary = 2,
		//obj/item/storage/box/m_kit/standard_armor = 5,
		//obj/item/storage/box/m_kit/bullet_proof = 5,
		//obj/item/storage/box/m_kit/laser_armor = 5,
		//obj/item/storage/box/m_kit/riot = 5
		)
	prices = list( // 500$ for default marshal stuff, 750 for the rest
		//obj/item/storage/box/m_kit/freedom = 750,
		//obj/item/storage/box/m_kit/breacher = 750,
		/obj/item/storage/box/m_kit/opshotkit = 750,
		/obj/item/storage/box/m_kit/mamba = 750,
		/obj/item/storage/box/m_kit/gear_lasgun = 750,
		//obj/item/storage/box/m_kit/taser = 500,
		//obj/item/storage/box/m_kit/liberty = 1000,
		/obj/item/storage/box/m_kit/judiciary = 750,
		//obj/item/storage/box/m_kit/standard_armor = 500,
		//obj/item/storage/box/m_kit/bullet_proof = 850,
		//obj/item/storage/box/m_kit/riot = 750,
		//obj/item/storage/box/m_kit/laser_armor = 1250
		)
	auto_price = FALSE

/obj/machinery/vending/marshal_kit/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/voucher/marshal))
		var/obj/item/voucher/marshal/Voucher = I
		if(Voucher.stamped)
			return
		else
			Voucher.stamped = TRUE
		switch(Voucher.voucher_type)
			if("Primary")
				RedeemPrimary(I, user)
			if("Secondary")
				RedeemSecondary(I, user)
			if("RangerSecondary")
				RedeemRangerSecondary(I, user)
			if("SpecPrimary")
				RedeemSpecPrimary(I, user)
			if("RangerPrimary")
				RedeemRangerPrimary(I, user)
			if("WOSecondary")
				RedeemWOSecondary(I, user)
			if("Armor")
				RedeemArmor(I, user)
		return
	return ..()

/obj/machinery/vending/marshal_kit/proc/RedeemPrimary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Freedom Kit" = /obj/item/storage/box/m_kit/freedom,
					"Breacher-hammer Kit" = /obj/item/storage/box/m_kit/breacher,
					"Operator Kit" = /obj/item/storage/box/m_kit/opshotkit,
					"Mamba Kit" = /obj/item/storage/box/m_kit/mamba,
					"Gear Laser Carbine Kit" = /obj/item/storage/box/m_kit/gear_lasgun)
	var/selection = items[input(redeemer, "Pick your primary weapon", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemSpecPrimary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"State Auto-Shotgun Kit" = /obj/item/storage/box/m_kit/state_auto,
					"Copperhead Kit" = /obj/item/storage/box/m_kit/copperhead,
					"Gear Laser Carbine Kit" = /obj/item/storage/box/m_kit/gear_lasgun,
					"Sunrise Las-SMG Kit" = /obj/item/storage/box/m_kit/typewriter)
	var/selection = items[input(redeemer, "Pick your primary weapon", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemRangerPrimary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Spec-Op Kit" = /obj/item/storage/box/m_kit/specop,
					"Custer Kit" = /obj/item/storage/box/m_kit/custer,
					"Peacekeeper Kit" = /obj/item/storage/box/m_kit/peacekeeper)
	var/selection = items[input(redeemer, "Pick your primary weapon", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemSecondary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Counselor Kit" = /obj/item/storage/box/m_kit/taser,
					"Liberty Kit" = /obj/item/storage/box/m_kit/liberty,
					"Mistral Kit" = /obj/item/storage/box/m_kit/mistral,
					"Judiciary Kit" = /obj/item/storage/box/m_kit/judiciary)
	var/selection = items[input(redeemer, "Pick your side-arm", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemRangerSecondary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Deckard Kit" = /obj/item/storage/box/m_kit/deckard,
					"Zwang Kit" = /obj/item/storage/box/m_kit/zwang,
					"Judge Revolver Kit" = /obj/item/storage/box/m_kit/judge)
	var/selection = items[input(redeemer, "Pick your side-arm", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemWOSecondary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Mateba Kit" = /obj/item/storage/box/m_kit/mateba,
					"Galaxy Kit" = /obj/item/storage/box/m_kit/galaxy,
					"Amnesty Kit" = /obj/item/storage/box/m_kit/amnesty)
	var/selection = items[input(redeemer, "Pick your side-arm", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemArmor(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Standard Full Plate" = /obj/item/storage/box/m_kit/standard_armor,
					"Webbing Standard Plate" = /obj/item/storage/box/m_kit/webbing_armor,
					"Greatcoat" = /obj/item/storage/box/m_kit/armored_overcoat,
					"Riot Armor Kit" = /obj/item/storage/box/m_kit/riot,
					"Bullet-Proof Armor Kit" = /obj/item/storage/box/m_kit/bullet_proof,
					"Ablative Armor Kit" = /obj/item/storage/box/m_kit/laser_armor
					)
	var/selection = items[input(redeemer, "Pick your armor", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE
