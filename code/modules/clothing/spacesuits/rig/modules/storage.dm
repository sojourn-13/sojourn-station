//The storage module allows a rig to be used as a sort of backpack, by using an internal storage compartment
/obj/item/rig_module/storage
	name = "RIG storage system"
	desc = "A series of straps, pouches and internal modifications for a RIGsuit. Has space for quite a few items, though it's a bit bulky and awkward."
	interface_name = "internal storage compartment"
	interface_desc = "A storage compartment built directly into the suits back module, accessed through a latching compartment."
	price_tag = 100

	var/obj/item/storage/internal/container = null
	w_class = ITEM_SIZE_HUGE

	//The default iconstate is actually really perfect for this, it looks like a reinforced box
	//Duplicate specify it here incase it gets changed in the parent in future
	icon_state = "module"

	//These vars will be passed onto the storage
	var/list/can_hold = list() //List of objects which this item can store (if set, it can't store anything else)
	var/list/cant_hold = list(/obj/item/rig) //List of objects which this item can't store (in effect only if can_hold isn't set)
	var/max_w_class = ITEM_SIZE_BULKY  //Max size of objects that this object can store (in effect only if can_hold isn't set)
	var/max_storage_space = DEFAULT_BULKY_STORAGE * 0.5 //This is about a satchel worth of storage
	var/storage_slots = null //The number of storage slots in this container.

/obj/item/rig_module/storage/large
	name= "RIG distributed storage system"
	desc = "A series of straps, pouches and internal modifications for a RIGsuit. This model is distributed across the whole body, and can hold more items but only of a smaller size."
	interface_name = "large internal storage compartment"
	interface_desc = "A system of storage integrated into the suits control module."
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_BULKY_STORAGE * 0.7

/obj/item/rig_module/storage/med
	name = "medical storage system"
	desc = "A series of straps, pouches and internal modifications for a RIGsuit. Primarily designed to hold medical supplies."
	interface_name = "large internal storage compartment"
	interface_desc = "A system of storage integrated into the suits control module."
	module_bulk = 0
	max_storage_space = DEFAULT_NORMAL_STORAGE
	can_hold = list(
		/obj/item/device/scanner/health,
		/obj/item/dnainjector,
		/obj/item/device/radio/headset,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/pill,
		/obj/item/reagent_containers/syringe,
		/obj/item/flame/lighter,
		/obj/item/cell/small,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/head/surgery,
		/obj/item/clothing/gloves,
		/obj/item/reagent_containers/hypospray,
		/obj/item/clothing/glasses,
		/obj/item/tool/crowbar,
		/obj/item/device/lighting/toggleable/flashlight,
		/obj/item/extinguisher/mini,
		/obj/item/tape/medical,
		/obj/item/device/flash,
		/obj/item/extinguisher/mini,
		/obj/item/stack/nanopaste,
		/obj/item/bodybag,
		/obj/item/tool/bonesetter,
		/obj/item/tool/scalpel,
		/obj/item/tool/scalpel/advanced,
		/obj/item/tool/scalpel/laser,
		/obj/item/tool/tape_roll/bonegel,
		/obj/item/tool/cautery,
		/obj/item/tool/cautery/adv,
		/obj/item/tool/retractor,
		/obj/item/tool/retractor/adv,
		/obj/item/tool/saw/circular,
		/obj/item/tool/saw/circular/medical,
		/obj/item/tool/hemostat,
		/obj/item/tool/hemostat/adv,
		/obj/item/reagent_containers/pill,
		/obj/item/storage/pill_bottle,
		/obj/item/bodybag/cryobag,
		/obj/item/clothing/gloves,
		/obj/item/clothing/glasses,
		/obj/item/reagent_containers/blood,
		/obj/item/taperoll/medical,
		/obj/item/clothing/gloves,
		/obj/item/clothing/glasses,
		/obj/item/device/radio,
		/obj/item/ammo_casing/flare,
		/obj/item/gun/projectile/boltgun/flare_gun
	)

/obj/item/rig_module/storage/engi
	name = "engineering storage system"
	desc = "A series of straps, pouches and internal modifications for a RIGsuit. Primarily designed to hold tools."
	interface_name = "large internal storage compartment"
	interface_desc = "A system of storage integrated into the suits control module."
	module_bulk = 0
	max_storage_space = DEFAULT_NORMAL_STORAGE
	can_hold = list(
		/obj/item/tool,
		/obj/item/tool_upgrade,
		/obj/item/device/lightreplacer,
		/obj/item/rcd,
		/obj/item/device/lighting/toggleable/flashlight,
		/obj/item/device/radio,
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
		/obj/item/grenade/chem_grenade/cleaner,
		/obj/item/grenade/chem_grenade/antiweed,
		/obj/item/grenade/chem_grenade/metalfoam,
		/obj/item/ammo_casing/flare,
		/obj/item/gun/projectile/boltgun/flare_gun
	)

/obj/item/rig_module/storage/combat
	name = "tactical storage system"
	desc = "A series of straps, pouches and internal modifications for a RIGsuit. Smaller than other such systems, but designed to accomodate everything from small speed-loaders all the way up to tins of ammo or heavy-duty cells."
	interface_name = "large internal storage compartment"
	interface_desc = "A system of storage integrated into the suits control module."
	module_bulk = 0
	max_storage_space = DEFAULT_NORMAL_STORAGE * 0.6
	max_w_class = ITEM_SIZE_BULKY
	can_hold = list(
		/obj/item/ammo_kit,
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/cell
		)

//Create the internal storage and pass on various parameters
/obj/item/rig_module/storage/New()
	container = new /obj/item/storage/internal(src)
	container.can_hold = can_hold
	container.cant_hold = cant_hold
	container.max_w_class = max_w_class
	container.max_storage_space = max_storage_space
	container.storage_slots = storage_slots
	container.master_item = src //If its installed immediately after creation this will get set to the rig in install proc
	container.w_class = w_class
	.=..()
/*****************************
	Installation
*****************************/
//Installing stuff
/obj/item/rig_module/storage/can_install(var/obj/item/rig/rig, var/mob/user, var/feedback = FALSE)
	if (rig.storage) //If it already has a storage mod installed, then no adding another one
		if (user && feedback)
			to_chat(user, SPAN_DANGER("The [rig] already has a storage module installed, you can't fit another one."))
		return FALSE
	.=..()

/obj/item/rig_module/storage/installed()
	.=..()
	holder.storage = src //Set ourselves as the storage mod
	container.master_item = holder //When its inside a rig, that rig is the thing we use for location checks

/obj/item/rig_module/storage/uninstalled(var/obj/item/rig/former, var/mob/living/user)
	.=..()
	former.storage = null //Unset the storage mod
	container.master_item = src //When its outside a rig, use ourselves for location checks




/*****************************
	Internal Handling
*****************************/
//This is called whenever people use something on the rig backpack
/obj/item/rig_module/storage/accepts_item(var/obj/item/input_device)
	if (container)
		return container.attackby(input_device, usr)
	return FALSE

//This will return false if we're done, or true to tell us to keep going and call parent attackhand
/obj/item/rig_module/storage/proc/handle_attack_hand(mob/user as mob)
	return container.handle_attack_hand(user)

/obj/item/rig_module/storage/proc/handle_mousedrop(var/mob/user, var/atom/over_object)
	return container.handle_mousedrop(user, over_object)


/*****************************
	External handling
*****************************/
//The module can be used as a storage container even when not inside a rig
/obj/item/rig_module/storage/attackby(obj/item/W as obj, mob/user as mob)
	.=..()
	if (!.)
		return accepts_item(W)

//More external functionality
/obj/item/rig_module/storage/MouseDrop(obj/over_object)
	if(container.handle_mousedrop(usr, over_object))
		return TRUE
	return ..()


/obj/item/rig_module/storage/attack_hand(mob/user as mob)
	if (loc == user)
		container.open(user)
	else
		container.close_all()
		..()

	src.add_fingerprint(user)
	return


/*****************************
	'modular' storage
*****************************/
