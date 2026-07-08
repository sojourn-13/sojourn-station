/obj/item/storage/briefcase
	name = "briefcase"
	desc = "A sturdy briefcase made of authentic faux-leather."
	icon_state = "briefcase"
	item_state = "briefcase"
	flags = CONDUCT
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	throw_speed = 1
	throw_range = 4
	w_class = ITEM_SIZE_BULKY //Cant normally bag this
	max_w_class = ITEM_SIZE_NORMAL //We can fit anything smaller then us
	max_storage_space = 20 //Its a big case
	matter = list(MATERIAL_BIOMATTER = 8, MATERIAL_PLASTIC = 4)
	price_tag = 90
	no_swing = FALSE //Incase we ever do make fancy briefcase weapons...
	var/has_loot = FALSE

/obj/item/storage/briefcase/random_items
	has_loot = TRUE

/obj/item/storage/briefcase/populate_contents()
	..()
	if(has_loot)
		var/loops = rand(1,3)
		while(loops)
			loops -= 1
			if(prob(50))
				new /obj/item/paper(src)
			if(prob(30))
				new /obj/item/paper(src)

		if(prob(rand(30,80)))
			new /obj/random/pen_safe(src)

		if(prob(rand(10,20)))
			new /obj/random/credits/c50(src)
		if(prob(rand(50,80)))
			new /obj/item/pc_part/drive/disk/adv/coin(src)

		if(prob(rand(10,30)))
			new /obj/item/newspaper(src)

		if(prob(rand(20,70)))
			if(prob(rand(40,95)))
				new /obj/item/folder(src)
			if(prob(rand(30,80)))
				new /obj/item/folder/blue(src)
			if(prob(rand(30,80)))
				new /obj/item/folder/red(src)
			if(prob(rand(30,80)))
				new /obj/item/folder/yellow(src)
			if(prob(rand(30,80)))
				new /obj/item/folder/cyan(src)

		if(prob(30))
			new /obj/item/stack/medical/bruise_pack(src)
		if(prob(15))
			new /obj/random/cloth/gloves(src)
		if(prob(15))
			new /obj/random/cloth/glasses(src)
		if(prob(rand(70,100)))
			new /obj/random/drinking_glasses(src)

		if(prob(rand(10,30)))
			if(prob(rand(10,15)))
				new /obj/item/oddity/common/blueprint(src)
			if(prob(rand(5,15)))
				new /obj/item/oddity/common/old_newspaper(src)
			if(prob(rand(5,15)))
				new /obj/item/oddity/common/paper_crumpled(src)
			if(prob(5))
				new /obj/item/oddity/common/old_pda(src)
			if(prob(rand(25,30)))
				new /obj/item/oddity/common/paper_bundle(src)
			if(prob(rand(5,10)))
				new /obj/item/oddity/common/disk(src)

		if(prob(1))
			new /obj/random/lathe_disk(src)

/*
/obj/item/storage/briefcase/rifle //replaced with the 'duffel' child item
	name = "gun case"
	desc = "A sturdy metal case made for transporting ranged weaponry."
	icon_state = "rifle_case"
	item_state = "rifle_case"
	flags = CONDUCT
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	throw_speed = 1
	throw_range = 4
	max_w_class = null
	max_storage_space = 16
	can_hold = list(/obj/item/gun,
		/obj/item/ammo_magazine
		)
	matter = list(MATERIAL_STEEL = 8, MATERIAL_PLASTIC = 4) */