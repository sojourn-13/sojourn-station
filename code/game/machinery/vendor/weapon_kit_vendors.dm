
//For Blackshield Kits
/obj/machinery/vending/blackshield_kit
	name = "\improper Blackshield Kit Vendor"
	desc = "A vendor that can dispense specialized equipment kits for Blackshield Troopers."
	icon_state = "trashvend"
	products = list( // 5 in stock for the default blackshield kit, 3 for the rest
		/obj/item/storage/box/bs_kit/mosin = 5,
		/obj/item/storage/box/bs_kit/duty = 2,
		/obj/item/storage/box/bs_kit/sts = 3,
		/obj/item/storage/box/bs_kit/sts_para = 2,
		/obj/item/storage/box/bs_kit/rds_omnicarbine = 2,
		/obj/item/storage/box/bs_kit/cog = 3,
		/obj/item/storage/box/bs_kit/greasegun = 3,
		/obj/item/storage/box/bs_kit/triage = 2,
		/obj/item/storage/box/bs_kit/buckler = 3,
		/obj/item/storage/box/bs_kit/grizzly = 3,
		/obj/item/storage/box/bs_kit/stallion = 5,
		/obj/item/storage/box/bs_kit/rex10 = 3,
		/obj/item/storage/box/bs_kit/pilgrim = 3,
		/obj/item/storage/box/bs_kit/colt = 3,
		/obj/item/storage/box/bs_kit/makarov = 3,
		/obj/item/storage/box/bs_kit/martin = 5,
		/obj/item/storage/box/bs_kit/sawn_shotgun = 5,
		/obj/item/storage/box/bs_kit/standard_armor = 5,
		/obj/item/storage/box/bs_kit/flak_armor = 3,
		/obj/item/storage/box/bs_kit/bullet_armor = 3,
		/obj/item/storage/box/bs_kit/laser_armor = 3,
		/obj/item/storage/box/bs_kit/standard_armor_corpsman = 2
		)
	prices = list( // 500$ for default Blackshield stuff, 750 for the rest
		/obj/item/storage/box/bs_kit/mosin = 500,
		/obj/item/storage/box/bs_kit/duty = 800,
		/obj/item/storage/box/bs_kit/sts = 750,
		/obj/item/storage/box/bs_kit/sts_para = 1200,
		/obj/item/storage/box/bs_kit/rds_omnicarbine = 1200,
		/obj/item/storage/box/bs_kit/cog = 750,
		/obj/item/storage/box/bs_kit/greasegun = 750,
		/obj/item/storage/box/bs_kit/triage = 1200,
		/obj/item/storage/box/bs_kit/buckler = 750,
		/obj/item/storage/box/bs_kit/grizzly = 750,
		/obj/item/storage/box/bs_kit/stallion = 750,
		/obj/item/storage/box/bs_kit/rex10 = 500,
		/obj/item/storage/box/bs_kit/pilgrim = 750,
		/obj/item/storage/box/bs_kit/colt = 500,
		/obj/item/storage/box/bs_kit/makarov = 500,
		/obj/item/storage/box/bs_kit/martin = 500,
		/obj/item/storage/box/bs_kit/sawn_shotgun = 500,
		/obj/item/storage/box/bs_kit/standard_armor = 500,
		/obj/item/storage/box/bs_kit/flak_armor = 750,
		/obj/item/storage/box/bs_kit/bullet_armor = 750,
		/obj/item/storage/box/bs_kit/laser_armor = 1250,
		/obj/item/storage/box/bs_kit/standard_armor_corpsman = 1250
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
			if("Armor")
				RedeemArmor(I, user)
			if("CorpsmanArmor")
				RedeemCorpsmanArmor(I, user)
		return
	return ..()

/obj/machinery/vending/blackshield_kit/proc/RedeemPrimary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Mosin Kit" = /obj/item/storage/box/bs_kit/mosin,
					"STS Kit" = /obj/item/storage/box/bs_kit/sts,
					"Cog Kit" = /obj/item/storage/box/bs_kit/cog,
					"Grease Gun Kit" = /obj/item/storage/box/bs_kit/greasegun,
					"Buckler SMG Kit" = /obj/item/storage/box/bs_kit/buckler,
					"Grizzly Kit" = /obj/item/storage/box/bs_kit/grizzly)
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
					"STS Kit" = /obj/item/storage/box/bs_kit/sts,
					"Cog Kit" = /obj/item/storage/box/bs_kit/cog,
					"Grease Gun Kit" = /obj/item/storage/box/bs_kit/greasegun,
					"Buckler SMG Kit" = /obj/item/storage/box/bs_kit/buckler,
					"Triage SMG Kit" = /obj/item/storage/box/bs_kit/triage,
					"Grizzly Kit" = /obj/item/storage/box/bs_kit/grizzly)
	var/selection = items[input(redeemer, "Pick your primary weapon", "Blackshield Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/blackshield_kit/proc/RedeemSargPrimary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Mosin Kit" = /obj/item/storage/box/bs_kit/mosin,
					"Duty Kit" = /obj/item/storage/box/bs_kit/duty,
					"Buckler SMG Kit" = /obj/item/storage/box/bs_kit/buckler,
					"STS Para Kit" = /obj/item/storage/box/bs_kit/sts_para,
					"Cog Kit" = /obj/item/storage/box/bs_kit/cog,
					"Warthog Omni Kit" = /obj/item/storage/box/bs_kit/rds_omnicarbine,
					"Grizzly Kit" = /obj/item/storage/box/bs_kit/grizzly,)
	var/selection = items[input(redeemer, "Pick your primary weapon", "Blackshield Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/blackshield_kit/proc/RedeemSecondary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Colt Kit" = /obj/item/storage/box/bs_kit/colt,
					"Makarov Kit" = /obj/item/storage/box/bs_kit/makarov,		
					"Stallion Kit" = /obj/item/storage/box/bs_kit/stallion,
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

/obj/machinery/vending/blackshield_kit/proc/RedeemArmor(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Plate Armor Kit" = /obj/item/storage/box/bs_kit/standard_armor,
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
		/obj/item/storage/box/m_kit/ppv = 5,
		/obj/item/storage/box/m_kit/breacher = 5,
		/obj/item/storage/box/m_kit/state_auto = 5,
		/obj/item/storage/box/m_kit/bulldog = 5,
		/obj/item/storage/box/m_kit/gear_lasgun = 5,
		/obj/item/storage/box/m_kit/wirbelwind = 5,
		/obj/item/storage/box/m_kit/taser = 5,
		/obj/item/storage/box/m_kit/bronco = 5,
		/obj/item/storage/box/m_kit/makarov = 5,
		/obj/item/storage/box/m_kit/ladon = 5,
		/obj/item/storage/box/m_kit/glock = 5,
		/obj/item/storage/box/m_kit/standard_armor = 5,
		/obj/item/storage/box/m_kit/bullet_proof = 5,
		/obj/item/storage/box/m_kit/laser_armor = 5,
		/obj/item/storage/box/m_kit/riot = 5
		)
	prices = list( // 500$ for default marshal stuff, 750 for the rest
		/obj/item/storage/box/m_kit/ppv = 1000,
		/obj/item/storage/box/m_kit/breacher = 750,
		/obj/item/storage/box/m_kit/state_auto = 750,
		/obj/item/storage/box/m_kit/bulldog = 750,
		/obj/item/storage/box/m_kit/gear_lasgun = 750,
		/obj/item/storage/box/m_kit/wirbelwind = 500,
		/obj/item/storage/box/m_kit/taser = 500,
		/obj/item/storage/box/m_kit/bronco = 750,
		/obj/item/storage/box/m_kit/makarov = 750,
		/obj/item/storage/box/m_kit/glock = 750,
		/obj/item/storage/box/m_kit/ladon = 750,
		/obj/item/storage/box/m_kit/standard_armor = 500,
		/obj/item/storage/box/m_kit/bullet_proof = 850,
		/obj/item/storage/box/m_kit/riot = 750,
		/obj/item/storage/box/m_kit/laser_armor = 1250
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
			if("Armor")
				RedeemArmor(I, user)
		return
	return ..()

/obj/machinery/vending/marshal_kit/proc/RedeemPrimary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"PPV Kit" = /obj/item/storage/box/m_kit/ppv,
					"Breacher-hammer Kit" = /obj/item/storage/box/m_kit/breacher,
					"State Auto-Shotgun Kit" = /obj/item/storage/box/m_kit/state_auto,
					"Bulldog Kit" = /obj/item/storage/box/m_kit/bulldog,
					"Gear Lasgun Kit" = /obj/item/storage/box/m_kit/gear_lasgun)
	var/selection = items[input(redeemer, "Pick your primary weapon", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemSpecPrimary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"PPV Kit" = /obj/item/storage/box/m_kit/ppv,
					"State Auto-Shotgun Kit" = /obj/item/storage/box/m_kit/state_auto,
					"Bulldog Kit" = /obj/item/storage/box/m_kit/bulldog,
					"Gear Lasgun Kit" = /obj/item/storage/box/m_kit/gear_lasgun,
					"Pug shotgun Kit" = /obj/item/storage/box/m_kit/pug,
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
					"Thompson Kit" = /obj/item/storage/box/m_kit/tommygun,
					"Armstrong Kit" = /obj/item/storage/box/m_kit/armstrong,
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
					"Bronco Kit" = /obj/item/storage/box/m_kit/bronco,
					"Makarov Kit" = /obj/item/storage/box/m_kit/makarov,
					"Ladon Kit" = /obj/item/storage/box/m_kit/ladon,
					"Sky Kit" = /obj/item/storage/box/m_kit/glock,
					"Wirbelwind Kit" = /obj/item/storage/box/m_kit/wirbelwind)
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
					"Judge Kit" = /obj/item/storage/box/m_kit/judge,
					"Zwang Kit" = /obj/item/storage/box/m_kit/zwang)
	var/selection = items[input(redeemer, "Pick your side-arm", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemArmor(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Standard Visor" = /obj/item/storage/box/m_kit/standard_armor,
					"Bullet-Proof Armor Kit" = /obj/item/storage/box/m_kit/bullet_proof,
					"Ablative Armor Kit" = /obj/item/storage/box/m_kit/laser_armor,
					"Riot Armor Kit" = /obj/item/storage/box/m_kit/riot)
	var/selection = items[input(redeemer, "Pick your armor", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE
