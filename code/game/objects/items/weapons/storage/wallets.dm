/obj/item/storage/wallet
	name = "wallet"
	desc = "It can hold a few small and personal things."
	storage_slots = 7
	icon_state = "wallet"
	price_tag = 20
	w_class = ITEM_SIZE_SMALL
	level = BELOW_PLATING_LEVEL //sneaky
	cant_hold = list(
		/obj/item/tool/screwdriver/combi_driver,
		/obj/item/tool/screwdriver/combi_driver/onestar) //We can not hold these do to being bigger then the wallet itself
	can_hold = list(
		/obj/item/spacecash,
		/obj/item/card,
		/obj/item/clothing/mask/smokable/cigarette/,
		/obj/item/device/lighting/toggleable/flashlight/pen,
		/obj/item/seeds,
		/obj/item/reagent_containers/pill,
		/obj/item/coin,
		/obj/item/dice,
		/obj/item/disk,
		/obj/item/implanter,
		/obj/item/flame/lighter,
		/obj/item/flame/match,
		/obj/item/paper,
		/obj/item/pen,
		/obj/item/photo,
		/obj/item/reagent_containers/dropper,
		/obj/item/tool/screwdriver,
		/obj/item/computer_hardware/hard_drive/portable,
		/obj/item/reagent_containers/syringe,
		/obj/item/genetics/purger,
		/obj/item/genetics/sample,
		/obj/item/genetics/mut_injector,
		/obj/item/stamp,
		// All these anomalies should be small in size enough to be able to fit inside a wallet.
		/obj/item/oddity/common/old_id, // ID's fit
		/obj/item/oddity/common/lighter, // Zippos fit
		/obj/item/oddity/common/coin, // Coins fit
		/obj/item/oddity/common/photo_crime, // All sizes of photos should fit
		/obj/item/oddity/common/photo_landscape,
		/obj/item/oddity/common/photo_coridor,
		/obj/item/oddity/common/photo_eyes,
		/obj/item/oddity/common/paper_crumpled, // Papers fit
		/obj/item/oddity/common/paper_bundle,
		/obj/item/oddity/common/broken_key, // It's broken and small enough to fit
		/obj/item/oddity/common/old_money // Money stacks fit
		)
	slot_flags = SLOT_ID

	matter = list(MATERIAL_BIOMATTER = 4)
	var/obj/item/card/id/front_id = null


/obj/item/storage/wallet/remove_from_storage(obj/item/W as obj, atom/new_location)
	. = ..(W, new_location)
	if(W == front_id)
		front_id = null
		name = initial(name)
		update_icon()

/obj/item/storage/wallet/handle_item_insertion(obj/item/W as obj, prevent_warning = 0)
	. = ..(W, prevent_warning)
	if(.)
		if(!front_id && istype(W, /obj/item/card/id))
			front_id = W
			name = "[name] ([front_id])"
			update_icon()

/obj/item/storage/wallet/update_icon()

	if(front_id)
		switch(front_id.group)
			if("colony")
				icon_state = "walletid"
				return
			if("whitesilver")
				icon_state = "walletid_silver"
				return
			if("golden")
				icon_state = "walletid_gold"
				return
			if("greenone")
				icon_state = "walletid_green"
				return
			if("secblue")
				icon_state = "walletid_sec"
				return
			if("engineers")
				icon_state = "walletid_sepia"
				return
			if("centcom")
				icon_state = "walletid_centcom"
				return

	else
		icon_state = "wallet"


/obj/item/storage/wallet/GetIdCard()
	return front_id

/obj/item/storage/wallet/GetAccess()
	var/obj/item/I = GetIdCard()
	if(I)
		return I.GetAccess()
	else
		return ..()

/obj/item/storage/wallet/random/populate_contents()
	var/item1_type
	var/item2_type
	var/item3_type
	var/item4_type

	if(prob(80))
		item1_type = pick(/obj/item/spacecash/bundle/c10,
						/obj/item/spacecash/bundle/c100,
						/obj/item/spacecash/bundle/c20,
						/obj/item/spacecash/bundle/c50,
						/obj/random/cigarettes/singles,
						//Gives work_visa_sol a LOT
						/obj/item/clothing/accessory/work_visa_sol,
						/obj/item/clothing/accessory/work_visa_sol,
						/obj/item/clothing/accessory/work_visa_sol,
						/obj/item/clothing/accessory/work_visa_sol,
						/obj/random/cigarettes/singles,
						/obj/item/reagent_containers/pill/floorpill/wallet)

	if(prob(30))
		item2_type = pick(/obj/item/spacecash/bundle/c10,
						/obj/item/spacecash/bundle/c100,
						/obj/item/spacecash/bundle/c20,
						/obj/item/spacecash/bundle/c50,
						/obj/random/cigarettes/singles,
						/obj/item/oddity/common/lighter,
						/obj/item/reagent_containers/pill/floorpill/wallet)

	if(prob(50))
		item3_type = pick(/obj/item/coin/silver,
						/obj/item/coin/gold,
						/obj/item/coin/iron,
						/obj/item/oddity/common/coin,
						/obj/item/oddity/common/paper_crumpled,
						/obj/item/oddity/common/old_money,
						/obj/random/cigarettes/singles,
						/obj/item/reagent_containers/pill/floorpill/wallet)

	if(prob(50))
		item4_type = pick(/obj/item/oddity/common/old_id,
						/obj/item/oddity/common/broken_key,
						/obj/item/oddity/common/paper_bundle,
						/obj/item/flame/lighter,
						/obj/item/flame/match,
						/obj/item/paper,
						/obj/item/pen,
						/obj/item/reagent_containers/pill/floorpill/wallet)

	if(item1_type)
		new item1_type(src)
	if(item2_type)
		new item2_type(src)
	if(item3_type)
		new item3_type(src)
	if(item4_type)
		new item4_type(src)
