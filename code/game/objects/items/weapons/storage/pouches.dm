/obj/item/storage/pouch
	name = "pouch"
	desc = "Can hold various things."
	icon = 'icons/inventory/pockets/icon.dmi'
	icon_state = "pouch"
	item_state = "pouch"
	price_tag = 400
	cant_hold = list(/obj/item/storage/pouch) //Pouches in pouches was a misstake

	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_BELT //Pouches can be worn on belt
	storage_slots = 1
	max_w_class = ITEM_SIZE_SMALL
	max_storage_space = DEFAULT_SMALL_STORAGE
	matter = list(MATERIAL_BIOMATTER = 12)
	attack_verb = list("pouched")

	var/sliding_behavior = FALSE

/obj/item/storage/pouch/verb/toggle_slide()
	set name = "Toggle Slide"
	set desc = "Toggle the behavior of last item in [src] \"sliding\" into your hand."
	set category = "Object"

	sliding_behavior = !sliding_behavior
	to_chat(usr, SPAN_NOTICE("Items will now [sliding_behavior ? "" : "not"] slide out of [src]"))

/obj/item/storage/pouch/attack_hand(mob/living/carbon/human/user)
	if(sliding_behavior && contents.len && (src in user))
		var/obj/item/I = contents[contents.len]
		if(istype(I))
			hide_from(usr)
			var/turf/T = get_turf(user)
			remove_from_storage(I, T)
			usr.put_in_hands(I)
			add_fingerprint(user)
	else
		..()

/obj/item/storage/pouch/small_generic
	name = "small generic pouch"
	desc = "Can hold nearly anything in it, but only a small amount."
	icon_state = "small_generic"
	item_state = "small_generic"
	storage_slots = null //Uses generic capacity
	max_storage_space = DEFAULT_SMALL_STORAGE * 0.5
	max_w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/storage/pouch/small_generic/purple
	icon_state = "small_generic_p"
	item_state = "small_generic_p"

/obj/item/storage/pouch/small_generic/leather
	icon_state = "small_leather"
	item_state = "small_leather"
	price_tag = 150

/obj/item/storage/pouch/medium_generic
	name = "medium generic pouch"
	desc = "Can hold nearly anything in it, but only a moderate amount."
	icon_state = "medium_generic"
	item_state = "medium_generic"
	storage_slots = null //Uses generic capacity
	max_storage_space = DEFAULT_SMALL_STORAGE
	max_w_class = ITEM_SIZE_NORMAL
	price_tag = 500

/obj/item/storage/pouch/medium_generic/leather
	icon_state = "medium_leather"
	item_state = "medium leather"
	price_tag = 300

/obj/item/storage/pouch/medium_generic/opifex
	name = "opifex smuggle pouch"
	desc = "Can hold nearly anything in it, but only a moderate amount. Made by the opifex, for the opifex."
	icon_state = "medium_opifex"
	item_state = "medium_opifex"

/obj/item/storage/pouch/large_generic
	name = "large generic pouch"
	desc = "A mini satchel. Can hold a fair bit, but it won't fit in your pocket"
	icon_state = "large_generic"
	item_state = "large_generic"
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BELT | SLOT_DENYPOCKET
	storage_slots = null //Uses generic capacity
	max_storage_space = DEFAULT_NORMAL_STORAGE
	max_w_class = ITEM_SIZE_NORMAL
	matter = list(MATERIAL_BIOMATTER = 20)
	price_tag = 1000

/obj/item/storage/pouch/large_generic/leather
	desc = "A mini satchel made of leather. Can hold a fair bit, but it won't fit in your pocket"
	icon_state = "large_leather"
	item_state = "large_leather"
	price_tag = 700

/obj/item/storage/pouch/medical_supply
	name = "medical supply pouch"
	desc = "Can hold medical equipment. But only about four pieces of it."
	icon_state = "medical_supply"
	item_state = "medical_supply"

	storage_slots = 4
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/device/scanner/health,
		/obj/item/dnainjector,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/pill,
		/obj/item/reagent_containers/syringe,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/head/surgery,
		/obj/item/clothing/gloves/latex,
		/obj/item/reagent_containers/hypospray,
		/obj/item/clothing/glasses/hud/health,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/ammo_casing/flare
		)

/obj/item/storage/pouch/engineering_tools
	name = "engineering tools pouch"
	desc = "Can hold small engineering tools. But only about four pieces of them."
	icon_state = "engineering_tool"
	item_state = "engineering_tool"

	storage_slots = 4
	max_w_class = ITEM_SIZE_SMALL

	can_hold = list(
		/obj/item/tool,
		/obj/item/device/lighting/toggleable/flashlight,
		/obj/item/device/radio/headset,
		/obj/item/stack/cable_coil,
		/obj/item/device/t_scanner,
		/obj/item/device/scanner/gas,
		/obj/item/taperoll/engineering,
		/obj/item/device/robotanalyzer,
		/obj/item/tool/minihoe,
		/obj/item/tool/hatchet,
		/obj/item/device/scanner/plant,
		/obj/item/extinguisher/mini,
		/obj/item/hand_labeler,
		/obj/item/clothing/gloves,
		/obj/item/clothing/glasses,
		/obj/item/flame/lighter,
		/obj/item/cell/small,
		/obj/item/cell/medium,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/ammo_casing/flare
		)

/obj/item/storage/pouch/engineering_supply
	name = "engineering supply pouch"
	desc = "Can hold engineering equipment. But only about three pieces of it."
	icon_state = "engineering_supply"
	item_state = "engineering_supply"

	storage_slots = 3
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/cell,
		/obj/item/circuitboard,
		/obj/item/tool,
		/obj/item/stack/material,
		/obj/item/material,
		/obj/item/stack/rods,
		/obj/item/device/lighting/toggleable/flashlight,
		/obj/item/stack/cable_coil,
		/obj/item/device/t_scanner,
		/obj/item/device/scanner/gas,
		/obj/item/taperoll/engineering,
		/obj/item/device/robotanalyzer,
		/obj/item/extinguisher/mini,
		/obj/item/airlock_electronics,
		/obj/item/airalarm_electronics,
		/obj/item/circuitboard/apc,
		/obj/item/ammo_casing/flare
		)

/obj/item/storage/pouch/janitor_supply
	name = "janitorial supply pouch"
	desc = "Can hold janitorial equipment, but only about four pieces of them."
	icon_state = "janitor_supply"
	item_state = "janitor_supply"

	storage_slots = 4
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/grenade/chem_grenade/cleaner,
		/obj/item/grenade/chem_grenade/antiweed,
		/obj/item/reagent_containers/spray/cleaner,
		/obj/item/device/assembly/mousetrap,
		/obj/item/device/scanner/plant,
		/obj/item/extinguisher/mini,
		/obj/item/gun/projectile/boltgun/flare_gun
		)

/obj/item/storage/pouch/ammo
	name = "ammo pouch"
	desc = "Can hold ammo magazines and bullets, not the boxes though."
	icon_state = "ammo"
	item_state = "ammo"

	storage_slots = 4
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing
		)

/obj/item/storage/pouch/tubular
	name = "tubular pouch"
	desc = "Can hold seven cylindrical and small items, including but not limiting to flares, glowsticks, syringes and even hatton tubes or rockets."
	icon_state = "flare"
	item_state = "flare"

	storage_slots = 7
	w_class = ITEM_SIZE_NORMAL
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/tool/baton,
		/obj/item/device/lighting/glowstick,
		/obj/item/device/lighting/toggleable/flashlight,
		/obj/item/ammo_casing/rocket,
		/obj/item/ammo_magazine/smg_35,
		/obj/item/reagent_containers/syringe,
		/obj/item/reagent_containers/glass/beaker/vial,
		/obj/item/reagent_containers/hypospray,
		/obj/item/pen,
		/obj/item/storage/pill_bottle,
		/obj/item/hatton_magazine,
		/obj/item/extinguisher,
		/obj/item/implanter,
		/obj/item/grenade/chem_grenade,
		/obj/item/weldpack/canister,
		/obj/item/cell/medium,
		/obj/item/tank/emergency_oxygen,
		/obj/item/tank/emergency_nitgen,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/ammo_casing/flare
		)

/obj/item/storage/pouch/tubular/vial
	name = "vial pouch"
	desc = "Can hold about five vials. Rebranding!"

/obj/item/storage/pouch/tubular/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/pockets/icon.dmi', "flare_[contents.len]"))

/obj/item/storage/pouch/grow_a_gun
	name = "H&S Grow A Gun"
	desc = "A bag of dehydrated guns, just add water to grow them into a ready to use slot-o-matic. There are several warnings to not eat the dehydrated guns inside, and to keep away from kids unless hydrated."
	icon_state = "grow"
	item_state = "grow"
	matter = list(MATERIAL_PLASTIC = 1)
	storage_slots = 7
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_TINY

	can_hold = list(
		/obj/item/reagent_containers/food/snacks/cube/gun,
		)

/obj/item/storage/pouch/grow_a_gun/New()
	populate_contents()

/obj/item/storage/pouch/grow_a_gun/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/food/snacks/cube/gun(src)
	update_icon()

/obj/item/storage/pouch/grow_a_gun/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/pockets/icon.dmi', "grow_[contents.len]"))


/obj/item/storage/pouch/pistol_holster
	name = "pistol holster"
	desc = "Can hold a handgun in."
	icon_state = "pistol_holster"
	item_state = "pistol_holster"

	storage_slots = 1
	w_class = ITEM_SIZE_NORMAL
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/gun/projectile/clarissa,
		/obj/item/gun/projectile/colt,
		/obj/item/gun/projectile/firefly,
		/obj/item/gun/projectile/basilisk,
		/obj/item/gun/projectile/giskard,
		/obj/item/gun/projectile/gyropistol,
		/obj/item/gun/projectile/handmade_pistol,
		/obj/item/gun/projectile/lamia,
		/obj/item/gun/projectile/mk58,
		/obj/item/gun/projectile/revolver/lemant,
		/obj/item/gun/projectile/olivaw,
		/obj/item/gun/projectile/silenced,
		/obj/item/gun/energy/gun,
		/obj/item/gun/energy/chameleon,
		//obj/item/gun/energy/captain, //too unwieldy, use belt/suit slot or other storage
		/obj/item/gun/energy/stunrevolver,
		/obj/item/gun/projectile/revolver,
		/obj/item/gun/projectile/shotgun/doublebarrel/sawn, //short enough to fit in
		/obj/item/gun/launcher/syringe,
		/obj/item/gun/energy/plasma/auretian,
		/obj/item/gun/energy/centurio,
		/obj/item/gun/projectile/boltgun/flare_gun
		)

	sliding_behavior = TRUE

/obj/item/storage/pouch/pistol_holster/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/pockets/icon.dmi', "pistol_layer"))

/obj/item/storage/pouch/baton_holster
	name = "baton sheath"
	desc = "Can hold a baton, or indeed most shafts."
	icon_state = "baton_holster"
	item_state = "baton_holster"

	storage_slots = 1
	max_w_class = ITEM_SIZE_BULKY

	can_hold = list(
		/obj/item/melee,
		/obj/item/tool/baton,
		/obj/item/tool/crowbar,
		/obj/item/hatton_magazine,
		/obj/item/weldpack/canister,
		/obj/item/cell/medium,
		/obj/item/tank/emergency_oxygen,
		/obj/item/tank/emergency_nitgen,
		/obj/item/device/lighting/toggleable/flashlight,
		/obj/item/reagent_containers/food/snacks/tastybread,
		/obj/item/reagent_containers/food/snacks/baguette,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/food/drinks/cans,
		/obj/item/gun/projectile/boltgun/flare_gun
		)

	sliding_behavior = TRUE

/obj/item/storage/pouch/baton_holster/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/pockets/icon.dmi', "baton_layer"))

/obj/item/storage/pouch/holding
	name = "pouch of holding"
	desc = "If your pockets are not large enough to store all your belongings, you may want to use this high-tech pouch that opens into a localized pocket of bluespace (pun intended)."
	icon_state = "holdingpouch"
	item_state = "holdingpouch"
	storage_slots = 7
	max_w_class = ITEM_SIZE_BULKY
	max_storage_space = DEFAULT_HUGE_STORAGE
	matter = list(MATERIAL_STEEL = 4, MATERIAL_GOLD = 5, MATERIAL_DIAMOND = 2, MATERIAL_URANIUM = 2)
	origin_tech = list(TECH_BLUESPACE = 4)

/obj/item/storage/pouch/holding/New()
	..()
	item_flags |= BLUESPACE
	bluespace_entropy(3, get_turf(src))

/obj/item/storage/pouch/holding/attackby(obj/item/W as obj, mob/user as mob)
	if(W.item_flags & BLUESPACE)
		to_chat(user, SPAN_WARNING("The bluespace interfaces of the two devices conflict and malfunction, producing a loud explosion."))
		if (ishuman(user))
			var/mob/living/carbon/human/H = user
			var/held = W.get_equip_slot()
			if (held == slot_l_hand)
				var/obj/item/organ/external/E = H.get_organ(BP_L_ARM)
				E.droplimb(0, DROPLIMB_BLUNT)
			else if (held == slot_r_hand)
				var/obj/item/organ/external/E = H.get_organ(BP_R_ARM)
				E.droplimb(0, DROPLIMB_BLUNT)
		user.drop_item()
		return
	..()
