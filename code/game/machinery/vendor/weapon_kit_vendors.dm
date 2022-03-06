
//For Blackshield Kits
/obj/machinery/vending/blackshield_kit
	name = "\improper Blackshield Kit Vendor"
	desc = "A vendor that can dispense specialized equipment kits for Blackshield Troopers."
	icon_state = "trashvend"
	products = list( // 5 in stock for the default blackshield kit, 3 for the rest
		/obj/item/storage/box/bs_kit/mosin = 5,
		/obj/item/storage/box/bs_kit/sts = 3,
		/obj/item/storage/box/bs_kit/cog = 3,
		/obj/item/storage/box/bs_kit/roe = 3,
		/obj/item/storage/box/bs_kit/greasegun = 3,
		/obj/item/storage/box/bs_kit/grizzly = 3,
		/obj/item/storage/box/bs_kit/stallion = 5,
		/obj/item/storage/box/bs_kit/lamia = 3,
		/obj/item/storage/box/bs_kit/rex10 = 3,
		/obj/item/storage/box/bs_kit/pilgrim = 3,
		/obj/item/storage/box/bs_kit/colt = 3,
		/obj/item/storage/box/bs_kit/martin = 5,
		/obj/item/storage/box/bs_kit/sawn_shotgun = 5,
		/obj/item/storage/box/bs_kit/standard_armor = 5,
		/obj/item/storage/box/bs_kit/flak_armor = 3,
		/obj/item/storage/box/bs_kit/bullet_armor = 3,
		/obj/item/storage/box/bs_kit/laser_armor = 3
		)
	prices = list( // 500$ for default Blackshield stuff, 750 for the rest
		/obj/item/storage/box/bs_kit/mosin = 500,
		/obj/item/storage/box/bs_kit/sts = 750,
		/obj/item/storage/box/bs_kit/cog = 750,
		/obj/item/storage/box/bs_kit/roe = 750,
		/obj/item/storage/box/bs_kit/greasegun = 750,
		/obj/item/storage/box/bs_kit/grizzly = 750,
		/obj/item/storage/box/bs_kit/stallion = 750,
		/obj/item/storage/box/bs_kit/lamia = 750,
		/obj/item/storage/box/bs_kit/rex10 = 500,
		/obj/item/storage/box/bs_kit/pilgrim = 750,
		/obj/item/storage/box/bs_kit/colt = 500,
		/obj/item/storage/box/bs_kit/martin = 500,
		/obj/item/storage/box/bs_kit/sawn_shotgun = 500,
		/obj/item/storage/box/bs_kit/standard_armor = 500,
		/obj/item/storage/box/bs_kit/flak_armor = 750,
		/obj/item/storage/box/bs_kit/bullet_armor = 750,
		/obj/item/storage/box/bs_kit/laser_armor = 1250
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
					/obj/item/storage/box/bs_kit/mosin = "Mosin",
					/obj/item/storage/box/bs_kit/sts = "STS",
					/obj/item/storage/box/bs_kit/cog = "Cog",
					/obj/item/storage/box/bs_kit/greasegun = "Grease Gun",
					/obj/item/storage/box/bs_kit/roe = "Roe light boltgun",
					/obj/item/storage/box/bs_kit/grizzly = "Grizzly"
					)
	var/selection = input(redeemer, "Pick your primary weapon", "Blackshield Voucher Redemption") as null|anything in items
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE


/obj/machinery/vending/blackshield_kit/proc/RedeemSargPrimary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					/obj/item/storage/box/bs_kit/mosin = "Mosin",
					/obj/item/storage/box/bs_kit/sts_para = "STS Para",
					/obj/item/storage/box/bs_kit/cog = "Cog",
					/obj/item/storage/box/bs_kit/rds_omnicarbine = "Warthog Omni",
					/obj/item/storage/box/bs_kit/roe = "Roe light boltgun",
					/obj/item/storage/box/bs_kit/grizzly = "Grizzly"
					)
	var/selection = input(redeemer, "Pick your primary weapon", "Blackshield Voucher Redemption") as null|anything in items
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/blackshield_kit/proc/RedeemSecondary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					/obj/item/storage/box/bs_kit/stallion = "Stallion",
					/obj/item/storage/box/bs_kit/lamia = "Lamia",
					/obj/item/storage/box/bs_kit/colt = "Colt",
					/obj/item/storage/box/bs_kit/rex10 = "Cowboy",
					/obj/item/storage/box/bs_kit/pilgrim = "Pilgrim",
					/obj/item/storage/box/bs_kit/sawn_shotgun = "Sawn-Off Shotgun",
					/obj/item/storage/box/bs_kit/martin = "Martin"
					)
	var/selection = input(redeemer, "Pick your side-arm", "Blackshield Voucher Redemption") as null|anything in items
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/blackshield_kit/proc/RedeemArmor(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					/obj/item/storage/box/bs_kit/standard_armor = "Plate",
					/obj/item/storage/box/bs_kit/flak_armor = "Flak",
					/obj/item/storage/box/bs_kit/laser_armor = "Ablative",
					/obj/item/storage/box/bs_kit/bullet_armor = "Bullet-Proof"
					)
	var/selection = input(redeemer, "Pick your armor", "Blackshield Voucher Redemption") as null|anything in items
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/blackshield_kit/proc/RedeemCorpsmanArmor(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					/obj/item/storage/box/bs_kit/standard_armor_corpsman = "Plate",
					/obj/item/storage/box/bs_kit/flak_armor = "Flak",
					/obj/item/storage/box/bs_kit/laser_armor = "Ablative",
					/obj/item/storage/box/bs_kit/bullet_armor = "Bullet-Proof"
					)
	var/selection = input(redeemer, "Pick your armor", "Blackshield Voucher Redemption") as null|anything in items
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
		/obj/item/storage/box/m_kit/wirbelwind = 5,
		/obj/item/storage/box/m_kit/state_auto = 5,
		/obj/item/storage/box/m_kit/bulldog = 5,
		/obj/item/storage/box/m_kit/gear_lasgun = 5,
		/obj/item/storage/box/m_kit/firefly = 5,
		/obj/item/storage/box/m_kit/colt = 5,
		/obj/item/storage/box/m_kit/ladon = 5,
		/obj/item/storage/box/m_kit/glock = 5,
		/obj/item/storage/box/m_kit/standard_armor = 5,
		/obj/item/storage/box/m_kit/bullet_proof = 5,
		/obj/item/storage/box/m_kit/laser_armor = 5,
		/obj/item/storage/box/m_kit/riot = 5
		)
	prices = list( // 500$ for default marshal stuff, 750 for the rest
		/obj/item/storage/box/m_kit/wirbelwind = 500,
		/obj/item/storage/box/m_kit/state_auto = 750,
		/obj/item/storage/box/m_kit/bulldog = 750,
		/obj/item/storage/box/m_kit/gear_lasgun = 750,
		/obj/item/storage/box/m_kit/firefly = 500,
		/obj/item/storage/box/m_kit/colt = 750,
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
			if("SpecPrimary")
				RedeemSpecPrimary(I, user)
			if("Armor")
				RedeemArmor(I, user)
		return
	return ..()

/obj/machinery/vending/marshal_kit/proc/RedeemPrimary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					/obj/item/storage/box/m_kit/thompson = "Thompson",
					/obj/item/storage/box/m_kit/state_auto = "State Auto-Shotgun",
					/obj/item/storage/box/m_kit/bulldog = "Bulldog",
					/obj/item/storage/box/m_kit/gear_lasgun = "Gear Lasgun"
					)
	var/selection = input(redeemer, "Pick your primary weapon", "Marshal Voucher Redemption") as null|anything in items
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemSpecPrimary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					/obj/item/storage/box/m_kit/thompson = "Thompson",
					/obj/item/storage/box/m_kit/state_auto = "State Auto-Shotgun",
					/obj/item/storage/box/m_kit/bulldog = "Bulldog",
					/obj/item/storage/box/m_kit/gear_lasgun = "Gear Lasgun",
					/obj/item/storage/box/m_kit/pug = "Pug shotgun",
					/obj/item/storage/box/m_kit/typewriter = "Sunrise Las-SMG"
					)
	var/selection = input(redeemer, "Pick your primary weapon", "Marshal Voucher Redemption") as null|anything in items
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE



/obj/machinery/vending/marshal_kit/proc/RedeemSecondary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					/obj/item/storage/box/m_kit/wirbelwind = "Wirbelwind",
					/obj/item/storage/box/m_kit/firefly = "Firefly",
					/obj/item/storage/box/m_kit/colt = "Colt",
					/obj/item/storage/box/m_kit/ladon = "Ladon",
					/obj/item/storage/box/m_kit/glock = "Glock"
					)
	var/selection = input(redeemer, "Pick your side-arm", "Marshal Voucher Redemption") as null|anything in items
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemArmor(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					/obj/item/storage/box/m_kit/standard_armor = "Standard Visor",
					/obj/item/storage/box/m_kit/bullet_proof = "Bullet Proof",
					/obj/item/storage/box/m_kit/laser_armor = "Ablative",
					/obj/item/storage/box/m_kit/riot = "Riot"
					)
	var/selection = input(redeemer, "Pick your armor", "Marshal Voucher Redemption") as null|anything in items
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE
