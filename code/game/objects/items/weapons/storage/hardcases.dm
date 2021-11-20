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

/obj/item/storage/hcases/proc/can_interact(mob/user)
	if((!ishuman(user) && (loc != user)) || user.stat || user.restrained())
		return 1
	if(istype(loc, /obj/item/storage))
		return 2
	return 0

/obj/item/storage/hcases/verb/apply_sticker(mob/user)
	set name = "Apply Sticker"
	set category = "Object"
	set src in view(1)

	if(can_interact(user) == 1)
		return
	sticker(user)

/obj/item/storage/hcases/proc/sticker(mob/user)
	var/list/options = list()
	options["Orange"] = "[sticker_name]_sticker_o"
	options["Blue"] = "[sticker_name]_sticker_b"
	options["Red"] = "[sticker_name]_sticker_r"
	options["Green"] = "[sticker_name]_sticker_g"
	options["Purple"] = "[sticker_name]_sticker_p"
	options["IH Blue"] = "[sticker_name]_sticker_ih"


	var/choice = input(user,"Which color do you want?") as null|anything in options

	if(!choice)
		return

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

/obj/item/storage/hcases/verb/quick_open_close(mob/user)
	set name = "Close Lid"
	set category = "Object"
	set src in view(1)

	if(can_interact(user) == 1)	//can't use right click verbs inside bags so only need to check for ablity
		return

	open_close(user)

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
	max_storage_space = DEFAULT_SMALL_STORAGE * 1.3 //a better fancy box

//////////////////////////////////////////Ammo//////////////////////////////////////////

/obj/item/storage/hcases/ammo
	name = "ammo hard case"
	desc = "A generic ammo can. Can hold ammo magazines, boxes, and bullets. Alt+click to open and close."
	icon_state = "ammo_case"
	sticker_name = "ammo"
	matter = list(MATERIAL_STEEL = 20)

	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine/ammobox,
		/obj/item/gun/projectile/boltgun/flare_gun
		)

/obj/item/storage/hcases/ammo/ih
	icon_state = "ammo_case_ih"
	desc = "An ammo can for Marshals. Can hold ammo magazines, boxes, and bullets. Alt+click to open and close."

/obj/item/storage/hcases/ammo/serb
	icon_state = "ammo_case_serb"
	desc = "A generic ammo holding can. Can hold ammo magazines, boxes, and bullets. Alt+click to open and close."

/obj/item/storage/hcases/ammo/blackmarket
	icon_state = "ammo_case_blackmarket"
	desc = "A shady looking ammo can. Can hold ammo magazines, boxes, and bullets. Alt+click to open and close."

/obj/item/storage/hcases/ammo/excel
	icon_state = "ammo_case_excel"
	desc = "The peoples ammo can! Can hold ammo magazines, boxes, and bullets. Alt+click to open and close."

/obj/item/storage/hcases/ammo/scrap
	icon_state = "ammo_case_scrap"
	desc = "A lacquer coated ammo can. Can hold ammo magazines, boxes, and bullets. Alt+click to open and close."
	max_storage_space = DEFAULT_SMALL_STORAGE * 1.3 //a better fancy box

//////////////////////////////////////////Parts//////////////////////////////////////////

/obj/item/storage/hcases/parts
	name = "hardware hard case"
	desc = "A hard case that can hold electronic parts. Alt+click to open and close."
	icon_state = "hcase_parts"
	matter = list(MATERIAL_STEEL = 20)
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/computer_hardware,
		/obj/item/stock_parts,
		/obj/item/device,
		/obj/item/cell,
		/obj/item/stack/cable_coil,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/ammo_casing/flare,
		/obj/item/extinguisher/mini,
		/obj/item/airlock_electronics,
		/obj/item/airalarm_electronics,
		/obj/item/tool_upgrade,
		/obj/item/clothing/head/welding,
		/obj/item/weldpack,
		/obj/item/circuitboard
		)

/obj/item/storage/hcases/parts/scrap
	icon_state = "scrap_parts"
	sticker_name = "scrap"
	desc = "A lacquer coated hard case that can hold weapon, armor, machine, and electronic parts. Alt+click to open and close."
	max_storage_space = DEFAULT_SMALL_STORAGE * 1.3 //a better fancy box

//////////////////////////////////////////Medical//////////////////////////////////////////

/obj/item/storage/hcases/med
	name = "medical hard case"
	desc = "A hardcase with medical markings that can hold a lot of medical supplies. Alt+click to open and close."
	icon_state = "hcase_medi"
	matter = list(MATERIAL_STEEL = 20)

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

/obj/item/storage/hcases/med/scrap
	icon_state = "scrap_medi"
	sticker_name = "scrap"
	desc = "A lacquer coated hardcase with medical markings that can hold a lot of medical supplies. Alt+click to open and close."
	max_storage_space = DEFAULT_SMALL_STORAGE * 1.3 //a better fancy box

//////////////////////////////////////////Engineering//////////////////////////////////////////

/obj/item/storage/hcases/engi
	name = "tool hard case"
	desc = "A hardcase with engineering markings that can hold a variety of different tools and materials. Alt+click to open and close."
	icon_state = "hcase_engi"
	matter = list(MATERIAL_STEEL = 20)
	max_w_class = ITEM_SIZE_NORMAL
	can_hold = list(
		/obj/item/cell,
		/obj/item/circuitboard,
		/obj/item/stack/material,
		/obj/item/clothing/head/welding,
		/obj/item/weldpack,
		/obj/item/material,
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
		/obj/item/cell
		)

/obj/item/storage/hcases/engi/scrap
	icon_state = "scrap_engi"
	sticker_name = "scrap"
	desc = "An old lacquer coated hardcase with engineering markings that can hold a variety of different tools and materials. Alt+click to open and close."
	max_storage_space = DEFAULT_SMALL_STORAGE * 1.3 //a better fancy box
