/obj/item/storage/hcases //probably should rename
	name = "hard case"
	desc = "A hardcase that can hold a lot of various things. Alt+click to open and close."
	icon = 'icons/obj/storage/cases.dmi' //Sprites made by shazbot194, many thanks
	icon_state = "hcase"
	var/sticker_name = "hcase"

	w_class = ITEM_SIZE_NORMAL
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_SMALL_STORAGE * 1.5 //a better fancy box
	matter = list(MATERIAL_STEEL = 20)
	var/sticker = null
	var/closed = TRUE
	price_tag = 120

/obj/item/storage/hcases/Destroy()

	for (var/obj/held_item in contents) //if we find storage is harddelling move this down to that destroy
		qdel(held_item)

	..()
	return QDEL_HINT_QUEUE //just to be safe

/obj/item/storage/hcases/can_interact(mob/user, require_adjacent_turf = TRUE, show_message = TRUE)
	if((!ishuman(user) && (loc != user)) || user.stat || user.restrained())
		return 1
	if(istype(loc, /obj/item/storage))
		return 2
	return 0

/obj/item/storage/hcases/verb/apply_sticker()
	set name = "Apply Sticker"
	set category = "Object"
	set src in view(1)

	if(isghost(usr))
		to_chat(usr, SPAN_NOTICE("The stickers can't sence ghosts artistic design."))
		return

	if(!isliving(loc))
		return

//	sticker(user)

///obj/item/storage/hcases/proc/sticker(mob/user)
	var/mob/M = usr
	var/list/options = list()
	options["Orange"] = "[sticker_name]_sticker_o"
	options["Blue"] = "[sticker_name]_sticker_b"
	options["Red"] = "[sticker_name]_sticker_r"
	options["Green"] = "[sticker_name]_sticker_g"
	options["Purple"] = "[sticker_name]_sticker_p"
	options["Darker Blue"] = "[sticker_name]_sticker_ih"


	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options
	if(src && choice && !M.incapacitated() && Adjacent(M))

		sticker = options[choice]

	update_icon()

/obj/item/storage/hcases/update_icon()
	icon_state = "[initial(icon_state)][closed ? "" : "_open"]"
	cut_overlays()
	if(sticker)
		add_overlay("[sticker][closed ? "" : "_open"]")

/obj/item/storage/hcases/open(mob/user)
	if(closed)
		to_chat(user, SPAN_NOTICE("The lid is closed."))
		return

	. = ..()

/obj/item/storage/hcases/verb/quick_open_close()
	set name = "Close Lid"
	set category = "Object"
	set src in view(1)

	if(isghost(usr))
		to_chat(usr, SPAN_NOTICE("The lid doesn't move even at your suggestion."))
		return

	if(can_interact(usr) == 1)	//can't use right click verbs inside bags so only need to check for ablity
		return

	open_close(usr)

/obj/item/storage/hcases/AltClick(mob/user)

	var/able = can_interact(user)

	if(able == 1)
		return

	if(able == 2)
		to_chat(user, SPAN_NOTICE("You cannot open the lid of \the [src] while it\'s in a container."))
		return

	open_close(user)

/obj/item/storage/hcases/proc/open_close(user)
	close_all()
	if (!isturf(src.loc))
		to_chat(user, SPAN_NOTICE("You cant toggle the lid, put it on the ground."))
		return
	if(closed)
		to_chat(user, SPAN_NOTICE("You open the lid of the [src]."))
		w_class = ITEM_SIZE_TITANIC
		closed = FALSE
	else
		to_chat(user, SPAN_NOTICE("You close the lid of the [src]."))
		w_class = ITEM_SIZE_NORMAL
		closed = TRUE

	playsound(loc, 'sound/weapons/guns/interact/selector.ogg', 100, 1)
	update_icon()

obj/item/storage/hcases/attackby(obj/item/W, mob/user)
	if(closed)
		to_chat(user, SPAN_NOTICE("You try to access \the [src] but its lid is closed!"))
		return
	. = ..()

/obj/item/storage/hcases/scrap	//Scrap isn't worse beyond poor shaming
	icon_state = "scrap"
	sticker_name = "scrap"
	desc = "A lacquer coated hardcase that can hold a lot of various things. Alt+click to open and close."

/obj/item/storage/hcases/scrap/job_artist
	exspand_when_spawned = FALSE //No exspanding cheats

/obj/item/storage/hcases/scrap/job_artist/populate_contents()
	new /obj/item/bananapeel(src)
	new /obj/item/storage/fancy/crayons(src)
	new /obj/item/toy/weapon/waterflower(src)
	new /obj/item/stamp/clown(src)
	new /obj/item/handcuffs/fake(src)

/obj/item/storage/hcases/preimer
	exspand_when_spawned = FALSE //No exspanding cheats

/obj/item/storage/hcases/preimer/populate_contents()
	new /obj/item/storage/box/ids(src)
	new /obj/item/tool/knife/dagger/ceremonial(src)
	new /obj/item/clothing/accessory/cross(src)



//////////////////////////////////////////Ammo//////////////////////////////////////////

/obj/item/storage/hcases/ammo
	name = "ammo hard case"
	desc = "A generic ammo can. Can hold normal ammo magazines, packets, bullets, gun parts, a assortment of grenades and some gear. Alt+click to open and close."
	icon_state = "ammo_case"
	sticker_name = "ammo"
	matter = list(MATERIAL_STEEL = 20)
	storage_slots = 14 //336 rounds of .50 Kurz. Really annoying big ammo box! More or less.
	max_w_class = ITEM_SIZE_SMALL //no drum mags or big boxes etc.

	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine/ammobox,
		/obj/item/ammo_kit,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/device/radio,
		/obj/item/tool/knife,
		/obj/item/cell/small,
		/obj/item/cell/medium,
		/obj/item/device/flash,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/handcuffs,
		/obj/item/part/gun
		)

/obj/item/storage/hcases/ammo/ih
	icon_state = "ammo_case_ih"
	desc = "An ammo can for Marshals. Can hold normal ammo magazines, packets, bullets, gun parts, a assortment of grenades and some gear. Alt+click to open and close."
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine/ammobox,
		/obj/item/ammo_kit,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/device/radio,
		/obj/item/tool/knife,
		/obj/item/cell/small,
		/obj/item/cell/medium,
		/obj/item/device/flash,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/handcuffs,
		/obj/item/part/gun
		)

/obj/item/storage/hcases/ammo/ih/wo
	exspand_when_spawned = FALSE //No exspanding cheats
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine/ammobox,
		/obj/item/ammo_kit,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/device/radio,
		/obj/item/tool/knife,
		/obj/item/cell/small,
		/obj/item/cell/medium,
		/obj/item/device/flash,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/handcuffs,
		/obj/item/part/gun
		)

/obj/item/storage/hcases/ammo/ih/wo/populate_contents()
	new /obj/item/handcuffs/advanced(src)
	new /obj/item/voucher/marshal/wosecondary(src) // They no longer spawn with an Amnesty, moved it to this selection of secondaries.
	new /obj/item/device/lighting/toggleable/flashlight/seclite(src)
	new /obj/item/cell/small/high(src)
	new /obj/item/gun/energy/gun/martin/preloaded(src)
	new /obj/item/clothing/accessory/badge/holo/wo(src)

/obj/item/storage/hcases/ammo/ih/spec_officer
	exspand_when_spawned = FALSE //No exspanding cheats
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine/ammobox,
		/obj/item/ammo_kit,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/device/radio,
		/obj/item/tool/knife,
		/obj/item/cell/small,
		/obj/item/cell/medium,
		/obj/item/device/flash,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/handcuffs,
		/obj/item/part/gun
		)

/obj/item/storage/hcases/ammo/ih/spec_officer/populate_contents()
	new /obj/item/handcuffs/advanced(src)
	new /obj/item/device/lighting/toggleable/flashlight/seclite(src)
	new /obj/item/cell/small/high(src)
	new /obj/item/gun/energy/gun/martin/preloaded(src)
	new /obj/item/clothing/accessory/badge/holo/warden(src)


/obj/item/storage/hcases/ammo/ih/ranger_officer
	exspand_when_spawned = FALSE //No exspanding cheats
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine/ammobox,
		/obj/item/ammo_kit,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/device/radio,
		/obj/item/tool/knife,
		/obj/item/cell/small,
		/obj/item/cell/medium,
		/obj/item/device/flash,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/handcuffs,
		/obj/item/part/gun
		)

/obj/item/storage/hcases/ammo/ih/ranger_officer/populate_contents()
	new /obj/item/handcuffs/advanced(src)
	new /obj/item/ammo_magazine/speed_loader_kurz_50/rubber(src)
	new /obj/item/ammo_magazine/speed_loader_kurz_50/rubber(src)
	new /obj/item/device/lighting/toggleable/flashlight/seclite(src)
	new /obj/item/clothing/accessory/badge/holo/inspector(src)
	new /obj/item/cell/small/high(src)

/obj/item/storage/hcases/ammo/ih/marshal_officer
	exspand_when_spawned = FALSE //No exspanding cheats
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine/ammobox,
		/obj/item/ammo_kit,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/device/radio,
		/obj/item/tool/knife,
		/obj/item/cell/small,
		/obj/item/cell/medium,
		/obj/item/device/flash,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/handcuffs,
		/obj/item/part/gun
		)

/obj/item/storage/hcases/ammo/ih/marshal_officer/populate_contents()
	new /obj/item/handcuffs/advanced(src)
	new /obj/item/gun/energy/gun/martin/preloaded(src)
	new /obj/item/device/lighting/toggleable/flashlight/seclite(src)
	new /obj/item/cell/small/high(src)

/obj/item/storage/hcases/ammo/serb
	icon_state = "ammo_case_serb"
	desc = "A generic ammo holding can. Can hold normal ammo magazines, packets, bullets, gun parts, a assortment of grenades and some gear. Alt+click to open and close."
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine/ammobox,
		/obj/item/ammo_kit,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/device/radio,
		/obj/item/tool/knife,
		/obj/item/cell/small,
		/obj/item/cell/medium,
		/obj/item/device/flash,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/handcuffs,
		/obj/item/part/gun
		)

/obj/item/storage/hcases/ammo/blackmarket
	icon_state = "ammo_case_blackmarket"
	desc = "A shady looking ammo can. Can hold normal ammo magazines, packets, bullets, gun parts, a assortment of grenades and some gear. Alt+click to open and close."
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine/ammobox,
		/obj/item/ammo_kit,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/device/radio,
		/obj/item/tool/knife,
		/obj/item/cell/small,
		/obj/item/cell/medium,
		/obj/item/device/flash,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/handcuffs,
		/obj/item/part/gun
		)
/obj/item/storage/hcases/ammo/blackmarket/co
	exspand_when_spawned = FALSE //No exspanding cheats
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine/ammobox,
		/obj/item/ammo_kit,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/device/radio,
		/obj/item/tool/knife,
		/obj/item/cell/small,
		/obj/item/cell/medium,
		/obj/item/device/flash,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/handcuffs,
		/obj/item/part/gun
		)
/obj/item/storage/hcases/ammo/blackmarket/co/populate_contents()
	new /obj/item/handcuffs/advanced(src)
	new /obj/item/voucher/blackshield/COsecondary(src) // They don't spawn with a Lamia anymore, but come with their own secondary voucher.
	new /obj/item/device/lighting/toggleable/flashlight/seclite(src)
	new /obj/item/cell/small/high(src)
	new /obj/item/gun/energy/gun/martin/preloaded(src)
	new /obj/item/tool/knife/boot/blackshield(src)
	new /obj/item/clothing/accessory/badge/holo/co(src)

/obj/item/storage/hcases/ammo/blackmarket/serg
	exspand_when_spawned = FALSE //No exspanding cheats
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine/ammobox,
		/obj/item/ammo_kit,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/device/radio,
		/obj/item/tool/knife,
		/obj/item/cell/small,
		/obj/item/cell/medium,
		/obj/item/device/flash,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/handcuffs,
		/obj/item/part/gun
		)
/obj/item/storage/hcases/ammo/blackmarket/serg/populate_contents()
	new /obj/item/handcuffs/advanced(src)
	new /obj/item/device/lighting/toggleable/flashlight/seclite(src)
	new /obj/item/cell/small/high(src)
	new /obj/item/gun/energy/gun/martin/preloaded(src)
	new /obj/item/tool/knife/boot/blackshield(src)


/obj/item/storage/hcases/ammo/blackmarket/medspec
	exspand_when_spawned = FALSE //No exspanding cheats
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine/ammobox,
		/obj/item/ammo_kit,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/device/radio,
		/obj/item/tool/knife,
		/obj/item/cell/small,
		/obj/item/cell/medium,
		/obj/item/device/flash,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/handcuffs,
		/obj/item/part/gun
		)
/obj/item/storage/hcases/ammo/blackmarket/medspec/populate_contents()
	new /obj/item/handcuffs/advanced(src)
	new /obj/item/device/lighting/toggleable/flashlight/seclite(src)
	new /obj/item/cell/small/high(src)
	new /obj/item/gun/energy/gun/martin/preloaded(src)
	new /obj/item/tool/knife/boot/blackshield(src)

/obj/item/storage/hcases/ammo/blackmarket/trooper
	exspand_when_spawned = FALSE //No exspanding cheats
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine/ammobox,
		/obj/item/ammo_kit,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/device/radio,
		/obj/item/tool/knife,
		/obj/item/cell/small,
		/obj/item/cell/medium,
		/obj/item/device/flash,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/handcuffs,
		/obj/item/part/gun
		)
/obj/item/storage/hcases/ammo/blackmarket/trooper/populate_contents()
	new /obj/item/handcuffs/advanced(src)
	new /obj/item/device/lighting/toggleable/flashlight/seclite(src)
	new /obj/item/cell/small/high(src)
	new /obj/item/gun/energy/gun/martin/preloaded(src)
	new /obj/item/tool/knife/boot/blackshield(src)

/obj/item/storage/hcases/ammo/excel
	icon_state = "ammo_case_excel"
	desc = "The peoples ammo can! Can hold normal ammo magazines, packets, bullets, gun parts, a assortment of grenades and some gear. Alt+click to open and close."
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine/ammobox,
		/obj/item/ammo_kit,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/device/radio,
		/obj/item/tool/knife,
		/obj/item/cell/small,
		/obj/item/cell/medium,
		/obj/item/device/flash,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/handcuffs,
		/obj/item/part/gun
		)
/obj/item/storage/hcases/ammo/scrap
	icon_state = "ammo_case_scrap"
	desc = "A lacquer coated ammo can. Can hold normal ammo magazines, packets, bullets, gun parts, a assortment of grenades and some gear. Alt+click to open and close."
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine/ammobox,
		/obj/item/ammo_kit,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/device/radio,
		/obj/item/tool/knife,
		/obj/item/cell/small,
		/obj/item/cell/medium,
		/obj/item/device/flash,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/handcuffs,
		/obj/item/part/gun
		)
/obj/item/storage/hcases/ammo/scrap/outsider
	desc = "A harcase containing what little you could scavenge for your own survival. Can hold normal ammo magazines, packets, bullets, gun parts, a assortment of grenades and some gear. Alt+click to open and close."
	exspand_when_spawned = FALSE //No exspanding cheats
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine/ammobox,
		/obj/item/ammo_kit,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/device/radio,
		/obj/item/tool/knife,
		/obj/item/cell/small,
		/obj/item/cell/medium,
		/obj/item/device/flash,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/handcuffs,
		/obj/item/part/gun
		)
/obj/item/storage/hcases/ammo/scrap/outsider/populate_contents()
	new /obj/random/gun_handmade/willspawn(src)
	new /obj/item/device/lighting/toggleable/flashlight(src)
	new /obj/item/cell/small/high(src)
	new /obj/item/cell/medium/high(src)
	new /obj/item/ammo_kit(src)
	new /obj/item/storage/firstaid/outsider(src)
	new /obj/item/reagent_containers/drinks/flask/lithium(src)


//////////////////////////////////////////Cards//////////////////////////////////////////

/obj/item/storage/hcases/cardcarp
	name = "gaming hard case"
	desc = "A wooden hard case made specifically for card carp, but it can hold various other gaming items. Alt+click to open and close."
	icon_state = "gaming"
	matter = list(MATERIAL_WOOD = 10)
	max_storage_space = DEFAULT_BULKY_STORAGE * 2 // Side bars for decks tend to have lots of cards and given how specialized this is, a little extra space isn't bad. -Kaz

	can_hold = list(
		/obj/item/cardholder,
		/obj/item/card_carp,
		/obj/item/pack_card_carp,
		/obj/item/scale,
		/obj/item/bone_counter,
		/obj/item/board,
		/obj/item/storage/pill_bottle/chechker,
		/obj/item/deck,
		/obj/item/pack
		)

//////////////////////////////////////////Parts//////////////////////////////////////////

/obj/item/storage/hcases/parts
	name = "hardware hard case"
	desc = "A hard case that can hold electronic parts. Alt+click to open and close."
	icon_state = "hcase_parts"
	matter = list(MATERIAL_STEEL = 20)
	max_w_class = ITEM_SIZE_SMALL //no large cells thanks
	storage_slots = 20
	can_hold = list(
		/obj/item/pc_part,
		/obj/item/stock_parts,
		/obj/item/device,
		/obj/item/cell,
		/obj/item/stack/nanopaste,
		/obj/item/stack/cable_coil,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/ammo_casing/flare,
		/obj/item/extinguisher/mini,
		/obj/item/airlock_electronics,
		/obj/item/airalarm_electronics,
		/obj/item/tool_upgrade,
		/obj/item/clothing/head/welding,
		/obj/item/circuitboard,
		/obj/item/part/gun
		)

/obj/item/storage/hcases/parts/scrap
	icon_state = "scrap_parts"
	sticker_name = "scrap"
	desc = "A lacquer coated hard case that can hold weapon, armor, machine, and electronic parts. Alt+click to open and close."

//////////////////////////////////////////Medical//////////////////////////////////////////

/obj/item/storage/hcases/med
	name = "medical hard case"
	desc = "A hardcase with medical markings that can hold a lot of medical supplies and surgical tools. Alt+click to open and close."
	icon_state = "hcase_medi"
	matter = list(MATERIAL_STEEL = 20)

	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_SMALL_STORAGE * 2

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
		/obj/item/stack/nanopaste,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/head/surgery,
		/obj/item/clothing/gloves/latex,
		/obj/item/reagent_containers/hypospray,
		/obj/item/clothing/glasses/hud/health,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/ammo_casing/flare,
		/obj/item/tool/bonesetter,
		/obj/item/tool/cautery,
		/obj/item/tool/hemostat,
		/obj/item/tool/retractor,
		/obj/item/tool/scalpel,
		/obj/item/tool/tape_roll/bonegel,
		/obj/item/tool/medmultitool,
		/obj/item/tool/tape_roll,
		/obj/item/bodybag
		)

/obj/item/storage/hcases/med/scrap
	icon_state = "scrap_medi"
	sticker_name = "scrap"
	desc = "A lacquer coated hardcase with medical markings that can hold a lot of medical supplies and surgical tools. Alt+click to open and close."

/obj/item/storage/hcases/med/medical_job
	exspand_when_spawned = FALSE //No exspanding cheats

/obj/item/storage/hcases/med/medical_job/populate_contents()
	new /obj/item/stack/medical/bruise_pack/advanced/large(src)
	new /obj/item/stack/medical/ointment/advanced/large(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_containers/syringe/inaprovaline(src)
	new /obj/item/device/scanner/health(src)
	//Has medicals items inside it to save on spawn storage.
	new /obj/item/storage/firstaid/soteria(src)
	new /obj/item/modular_computer/tablet/moebius/preset(src)


/obj/item/storage/hcases/med/medical_job_psyco
	exspand_when_spawned = FALSE //No exspanding cheats

/obj/item/storage/hcases/med/medical_job_psyco/populate_contents()
	new /obj/item/stack/medical/bruise_pack/advanced/large(src)
	new /obj/item/stack/medical/ointment/advanced/large(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_containers/syringe/inaprovaline(src)
	new /obj/item/device/scanner/health(src)
	//Has medicals items inside it to save on spawn storage.
	new /obj/item/storage/firstaid/soteria(src)
	new /obj/item/storage/pill_bottle/njoy/red(src)
	new /obj/item/storage/pill_bottle/njoy/blue(src)
	new /obj/item/storage/pill_bottle/njoy/green(src)
	new /obj/item/modular_computer/tablet/moebius/preset(src)


/obj/item/storage/hcases/med/medical_job_cbo
	exspand_when_spawned = FALSE //No exspanding cheats

/obj/item/storage/hcases/med/medical_job_cbo/populate_contents()
	new /obj/item/stack/medical/bruise_pack/advanced/large(src)
	new /obj/item/stack/medical/ointment/advanced/large(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_containers/syringe/inaprovaline(src)
	new /obj/item/device/scanner/health(src)
	//Has medicals items inside it to save on spawn storage.
	new /obj/item/storage/firstaid/soteria/large(src)
	new /obj/item/modular_computer/tablet/moebius/preset(src)
	new /obj/item/gun/projectile/makarov/moebius/preloaded_cbo(src)
	new /obj/item/gun_upgrade/trigger/dnalock(src)

/obj/item/storage/hcases/med/medical_job_trama
	exspand_when_spawned = FALSE //No exspanding cheats

/obj/item/storage/hcases/med/medical_job_trama/populate_contents()
	new /obj/item/stack/medical/bruise_pack/advanced/large(src)
	new /obj/item/stack/medical/ointment/advanced/large(src)
	new /obj/item/gearbox/traumatizedteam(src)
	new /obj/item/gunbox/traumatizedteam_sidearm(src)
	new /obj/item/gunbox/traumatizedteam(src) // Moved the weapon selection to here
	new /obj/item/storage/firstaid/soteria/large(src)
	new /obj/item/modular_computer/tablet/moebius/preset(src)

//////////////////////////////////////////Engineering//////////////////////////////////////////

/obj/item/storage/hcases/engi
	name = "tool hard case"
	desc = "A hardcase with engineering markings that can hold a variety of different tools and materials. Alt+click to open and close."
	icon_state = "hcase_engi"
	matter = list(MATERIAL_STEEL = 20)
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_NORMAL_STORAGE
	can_hold = list(
		/obj/item/cell,
		/obj/item/circuitboard,
		/obj/item/stack/material,
		/obj/item/clothing/head/welding,
		/obj/item/weldpack,
		/obj/item/material,
		/obj/item/stack/nanopaste,
		/obj/item/tool,
		/obj/item/device,
		/obj/item/stack/cable_coil,
		/obj/item/taperoll/engineering,
		/obj/item/device/scanner/plant,
		/obj/item/extinguisher/mini,
		/obj/item/hand_labeler,
		/obj/item/clothing/gloves,
		/obj/item/clothing/glasses,
		/obj/item/flame/lighter,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/ammo_casing/flare,
		/obj/item/extinguisher/mini,
		/obj/item/airlock_electronics,
		/obj/item/airalarm_electronics,
		/obj/item/tool_upgrade,
		/obj/item/cell,
		/obj/item/part/gun,
		/obj/item/storage/makeshift_grinder
		)

/obj/item/storage/hcases/engi/scrap
	icon_state = "scrap_engi"
	sticker_name = "scrap"
	desc = "An old lacquer coated hardcase with engineering markings that can hold a variety of different tools and materials. Alt+click to open and close."


////////////////////////////////////////////Rando 'gear kits'./////////////////////////////////////


/obj/item/gunbox/warrantofficer //credit goes to Hestia both for the idea of loadout gun box and for the code, and sprite.
	name = "\improper Warrant Officers equipment kit"
	desc = "A secure box containing the Warrant Officers primary weapon."
	icon = 'icons/obj/storage.dmi'
	icon_state = "rifle_case"

/obj/item/gunbox/warrantofficer/attack_self(mob/living/user)
	..()
	var/stamped
	if(!stamped)
		stamped = TRUE
		var/list/options = list() // Moved the Galaxy to secondary selection
		options["Python - precision rifle"] = list(/obj/item/gun/projectile/automatic/mamba/python,/obj/item/ammo_magazine/heavy_rifle_408,/obj/item/ammo_magazine/heavy_rifle_408, /obj/item/ammo_magazine/heavy_rifle_408/rubber, /obj/item/storage/pouch/ammo)
		options["SWAT - combat shotgun"] = list(/obj/item/gun/projectile/shotgun/pump/swat, /obj/item/ammo_magazine/speed_loader_shotgun, /obj/item/ammo_magazine/speed_loader_shotgun, /obj/item/ammo_magazine/speed_loader_shotgun/beanbag, /obj/item/ammo_magazine/ammobox/c10x24_small, /obj/item/storage/pouch/tubular)
		options["Ostwind - police carbine"] = list(/obj/item/gun/projectile/automatic/ostwind, /obj/item/ammo_magazine/light_rifle_257, /obj/item/ammo_magazine/light_rifle_257, /obj/item/ammo_magazine/light_rifle_257/rubber/pepperball, /obj/item/storage/pouch/ammo)
		options["Gleam - Assault Laser"] = list(/obj/item/gun/energy/lasercore/militia/blaster, /obj/item/cell/medium/high, /obj/item/cell/medium/high, /obj/item/cell/medium/high, /obj/item/storage/pouch/tubular)
		options["Second Secondary"] = list(/obj/item/voucher/marshal/wosecondary)

		var/choice = input(user,"What type of equipment?") as null|anything in options
		if(src && choice)
			var/list/things_to_spawn = options[choice]
			for(var/new_type in things_to_spawn)
				var/atom/movable/AM = new new_type(get_turf(src))
				if(istype(AM, /obj/item/gun/))
					to_chat(user, "You have chosen \the [AM].")
			qdel(src)
		else
			stamped = FALSE


/obj/item/gunbox/commanding_officer
	name = "\improper CO equipment kit"
	desc = "A secure box containing the CO primary weapon."
	icon = 'icons/obj/storage.dmi'
	icon_state = "rifle_case"

/obj/item/gunbox/commanding_officer/attack_self(mob/living/user)
	..()
	var/stamped
	if(!stamped)
		stamped = TRUE
		var/list/options = list()
		options["\"Longarm\" - marksman rifle"] = list(/obj/item/gun/projectile/automatic/omnirifle/scoped, /obj/item/ammo_magazine/heavy_rifle_408, /obj/item/ammo_magazine/heavy_rifle_408, /obj/item/ammo_magazine/heavy_rifle_408, /obj/item/ammo_magazine/heavy_rifle_408, /obj/item/ammo_magazine/heavy_rifle_408, /obj/item/storage/pouch/ammo)
		options["\"Hustler\" - Breacher Shotgun"] = list(/obj/item/gun/projectile/automatic/omnirifle/hustler, /obj/item/ammo_magazine/sbaw, /obj/item/ammo_magazine/sbaw, /obj/item/ammo_magazine/sbaw, /obj/item/ammo_magazine/sbaw, /obj/item/ammo_magazine/sbaw, /obj/item/storage/pouch/ammo)
		options["\"Gleam\" - Assault Laser"] = list(/obj/item/gun/energy/lasercore/militia/blaster, /obj/item/cell/medium/high, /obj/item/cell/medium/high, /obj/item/cell/medium/high, /obj/item/cell/medium/high, /obj/item/cell/medium/high, /obj/item/storage/pouch/tubular)
		options["Second Secondary"] = list(/obj/item/voucher/blackshield/COsecondary)

		var/choice = input(user,"What type of equipment?") as null|anything in options
		if(src && choice)
			var/list/things_to_spawn = options[choice]
			for(var/new_type in things_to_spawn)
				var/atom/movable/AM = new new_type(get_turf(src))
				if(istype(AM, /obj/item/gun/))
					to_chat(user, "You have chosen \the [AM].")
			qdel(src)
		else
			stamped = FALSE

/obj/item/gearbox/traumatizedteam
	name = "Lifeline Technician's equipment kit"
	desc = "A secure box containing the heavy duty protective gear of the Soteria Lifeline Technicians."
	icon = 'icons/obj/storage.dmi'
	icon_state = "secure"

/obj/item/gearbox/traumatizedteam/attack_self(mob/living/user)
	..()
	var/stamped
	if(!stamped)
		stamped = TRUE
		var/list/options = list()
		options["Recovery Team RIG"] = list(/obj/item/rig/recovery_suit/equipped)
		options["Advanced Paramedic Armor"] = list(/obj/item/clothing/suit/armor/paramedic,/obj/item/clothing/head/helmet/faceshield/paramedic)
		var/choice = input(user,"Which armor will you take?") as null|anything in options
		if(src && choice)
			var/list/things_to_spawn = options[choice]
			for(var/new_type in things_to_spawn)
				var/atom/movable/AM = new new_type(get_turf(src))
				if(istype(AM, /obj/item/gun/))
					to_chat(user, "You have chosen \the [AM].")
			qdel(src)
		else
			stamped = FALSE

/obj/item/gunbox/traumatizedteam
	name = "Lifeline Technician's self-defense guncase"
	desc = "A secure box containing the weapon of choice for the Soteria Lifeline Technician."
	icon = 'icons/obj/storage.dmi'
	icon_state = "medbriefcase"

/obj/item/gunbox/traumatizedteam/attack_self(mob/living/user)
	..()
	var/stamped
	if(!stamped)
		stamped = TRUE
		var/list/options = list()
		// Keeping this in case any other "sensible" option for a primary weapon for Lifeline Techs arrives, just add them as an option here.
		options["SI \"MedTech\" .40 SMG with Rubber/HV ammo"] = list(/obj/item/gun/projectile/automatic/c20r/sci/med/preloaded,/obj/item/gun_upgrade/muzzle/silencer,/obj/item/ammo_magazine/smg_magnum_40/hv,/obj/item/ammo_magazine/smg_magnum_40/hv, /obj/item/ammo_magazine/smg_magnum_40/rubber, /obj/item/ammo_magazine/smg_magnum_40/rubber, /obj/item/ammo_magazine/smg_magnum_40/rubber, /obj/item/ammo_magazine/smg_magnum_40/rubber)
		options["Soteria \"Sprocket\" laser carbine"] = list(/obj/item/gun/energy/cog/sprocket/preloaded,/obj/item/cell/medium/moebius/high)
		options["SST \"Humility\" shotgun"] = list(/obj/item/gun/energy/sst/humility/preloaded,/obj/item/cell/medium/moebius/high)
		var/choice = input(user,"Which gun will you take?") as null|anything in options
		if(src && choice)
			var/list/things_to_spawn = options[choice]
			for(var/new_type in things_to_spawn)
				var/atom/movable/AM = new new_type(get_turf(src))
				if(istype(AM, /obj/item/gun/))
					to_chat(user, "You have chosen \the [AM].")
			qdel(src)
		else
			stamped = FALSE

/obj/item/gunbox/traumatizedteam_sidearm
	name = "Lifeline Technician's sidearm guncase"
	desc = "A secure box containing the weapon of choice for the Soteria Lifeline Technician."
	icon = 'icons/obj/storage.dmi'
	icon_state = "medbriefcase"

/obj/item/gunbox/traumatizedteam_sidearm/attack_self(mob/living/user)
	..()
	var/stamped
	if(!stamped)
		stamped = TRUE
		var/list/options = list()
		options["SI \"Malpractice\" handgun with Rubber/FMJ ammo"] = list(/obj/item/clothing/accessory/holster/leg, /obj/item/gun/projectile/makarov/moebius/preloaded,/obj/item/gun_upgrade/muzzle/silencer,/obj/item/ammo_magazine/highcap_pistol_35, /obj/item/ammo_magazine/highcap_pistol_35/rubber, /obj/item/ammo_magazine/highcap_pistol_35/rubber)
		options["SST \"Abnegate\" handgun"] = list(/obj/item/clothing/accessory/holster/leg, /obj/item/gun/energy/sst/preloaded,)
		options["SI-HG \"Hera\" stun revolver"] = list(/obj/item/clothing/accessory/holster/leg, /obj/item/gun/energy/stunrevolver/sci/preloaded)
		var/choice = input(user,"Which gun will you take?") as null|anything in options
		if(src && choice)
			var/list/things_to_spawn = options[choice]
			for(var/new_type in things_to_spawn)
				var/atom/movable/AM = new new_type(get_turf(src))
				if(istype(AM, /obj/item/gun/))
					to_chat(user, "You have chosen \the [AM].")
			qdel(src)
		else
			stamped = FALSE

/obj/item/gunbox/forehead
	name = "Foreman's melee weapon case"
	desc = "A secure box containing the melee weapon of choice for Foremen."
	icon = 'icons/obj/storage.dmi'
	icon_state = "rifle_case" // Placeholder?

/obj/item/gunbox/forehead/attack_self(mob/living/user)
	..()
	var/stamped
	if(!stamped)
		stamped = TRUE
		var/list/options = list()
		options["Foreman's Sledgehammer"] = list(/obj/item/tool/hammer/foremansledge)
		options["\"Render Slayer\" Greatsword"] = list(/obj/item/tool/sword/foreman)
		var/choice = input(user,"Which weapon will you take?") as null|anything in options
		if(src && choice)
			var/list/things_to_spawn = options[choice]
			for(var/new_type in things_to_spawn)
				var/atom/movable/AM = new new_type(get_turf(src))
				if(istype(AM, /obj/item/gun/))
					to_chat(user, "You have chosen \the [AM].")
			qdel(src)
		else
			stamped = FALSE

// ERT / Agent kits. These mostly hold imprinters to grant stats / perks that said operative should have without having to manually tweak.
//Agents already start with the stats perks if spawned via _ert spawners however these are maintained for convenience if making agents via spawn_character + select_outfit.

/obj/item/storage/hcases/ert
	name = "imprinter hard case" // 2 stats +50 3 stats +25.
	desc = "A hardcase containing a number of advanced mental imprinters."
	can_hold = list(/obj/item/device/mental_imprinter/agent)

/obj/item/storage/hcases/ert/populate_contents()
	new /obj/item/device/mental_imprinter/agent(src)
	new /obj/item/device/mental_imprinter/agent(src)
	new /obj/item/device/mental_imprinter/agent(src)
	new /obj/item/device/mental_imprinter/agent/strong(src)
	new /obj/item/device/mental_imprinter/agent/strong(src)

/obj/item/storage/hcases/ert/marshal
	name = "marshals imprinter hard case"
	desc = "A hardcase containing a number of advanced mental imprinters. This one bears the badge of the Nadezhda Marshals."
	can_hold = list(/obj/item/device/mental_imprinter, /obj/item/device/mental_imprinter)

/obj/item/storage/hcases/ert/marshal/populate_contents()
	new /obj/item/device/mental_imprinter/agent(src)
	new /obj/item/device/mental_imprinter/agent(src)
	new /obj/item/device/mental_imprinter/agent(src)
	new /obj/item/device/mental_imprinter/agent/strong(src)
	new /obj/item/device/mental_imprinter/agent/strong(src)
	new /obj/item/device/hardware_imprinter/smartlink(src)
	new /obj/item/device/hardware_imprinter/spaceasshole(src)
	new /obj/item/device/hardware_imprinter/codlang(src)
	new /obj/item/device/hardware_imprinter/contraband(src)

/obj/item/storage/hcases/ert/blackshield
	name = "blackshield imprinter hard case"
	desc = "A hardcase containing a number of advanced mental imprinters. This one bears the badge of the Nadezhda Blackshield Militia."
	can_hold = list(/obj/item/device/mental_imprinter, /obj/item/device/mental_imprinter)

/obj/item/storage/hcases/ert/marshal/populate_contents()
	new /obj/item/device/mental_imprinter/agent(src)
	new /obj/item/device/mental_imprinter/agent(src)
	new /obj/item/device/mental_imprinter/agent(src)
	new /obj/item/device/mental_imprinter/agent/strong(src)
	new /obj/item/device/mental_imprinter/agent/strong(src)
	new /obj/item/device/hardware_imprinter/boltraining(src)
	new /obj/item/device/hardware_imprinter/spaceasshole(src)
	new /obj/item/device/hardware_imprinter/conditioning(src)
	new /obj/item/device/hardware_imprinter/contraband(src)

/obj/item/storage/hcases/ert/medical
	name = "medical imprinter hard case"
	desc = "A hardcase containing a number of advanced mental imprinters. This one bears the badge of the SI medical division."
	can_hold = list(/obj/item/device/mental_imprinter, /obj/item/device/mental_imprinter)

/obj/item/storage/hcases/ert/medical/populate_contents()
	new /obj/item/device/mental_imprinter/agent(src)
	new /obj/item/device/mental_imprinter/agent(src)
	new /obj/item/device/mental_imprinter/agent(src)
	new /obj/item/device/mental_imprinter/agent/strong(src)
	new /obj/item/device/mental_imprinter/agent/strong(src)
	new /obj/item/device/hardware_imprinter/medexpert(src)
	new /obj/item/device/hardware_imprinter/medadept(src)
	new /obj/item/device/hardware_imprinter/chemist(src)
	new /obj/item/device/hardware_imprinter/science(src)
