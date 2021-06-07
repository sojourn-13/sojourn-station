/*
	Deferred spawn storage containers
*/

/*
	These are a special type of storage container used for less-accessed gear. They create their contents through a
	spawn_contents proc which is called the first time the box is opened or interacted with.

	The key thing here is, these contents are not spawned at roundstart, only when a player actually needs them
	And thusly, if no player ever does, then those items are not sitting around wasting memory and CPU time

	Most of the things in this file are intended for use by external antags, and are thus exceptionally powerful
*/


/obj/item/weapon/storage/deferred
	var/list/initial_contents = list() //List of stuff that will be in this box
	//Can be used as an assoc list and allow you to enter a quantity as the value

	var/contents_spawned = FALSE

	name = "box"
	desc = "A steel-cased box."
	icon = 'icons/obj/storage/deferred.dmi'
	icon_state = "box"
	item_state = "box"
	contained_sprite = TRUE

/obj/item/weapon/storage/deferred/populate_contents()
	// Do not create contents if they are already spawned
	if(contents_spawned)
		return

	contents_spawned = TRUE
	for(var/a in initial_contents)
		var/quantity = initial_contents[a] ? initial_contents[a] : 1

		for(var/i = 0; i < quantity; i++)
			new a(src)
	expand_to_fit()

/obj/item/weapon/storage/deferred/open(mob/user)
	populate_contents()
	. = ..()

/obj/item/weapon/storage/deferred/show_to(mob/user)
	populate_contents()
	. = ..()

/obj/item/weapon/storage/deferred/can_be_inserted(obj/item/W, stop_messages = 0)
	populate_contents()
	. = ..()


/obj/item/weapon/storage/deferred/rations //DO this before merging
	name = "infantryman's rations kit"
	icon_state = "irp_box"
	item_state = "irp_box"
	w_class = ITEM_SIZE_HUGE
	desc = "A box of preserved, ready-to-eat food for soldiers and spacefarers on the go."
	initial_contents = list(/obj/item/weapon/storage/ration_pack = 7)


/obj/item/weapon/storage/deferred/toolmod
	name = "tool modifications kit"
	desc = "A sturdy container full of contraptions, bits of material, components and add-ons for modifying tools."
	icon_state = "box_tools"
	initial_contents = list(/obj/random/tool_upgrade = 12,
	/obj/random/tool_upgrade/rare = 3)


/obj/item/weapon/storage/deferred/pouches
	name = "uniform modification kit"
	desc = "A box full of hard-wearing pouches designed for easy attachment to clothing and armor. Good for carrying extra ammo or tools in the field."
	initial_contents = list(/obj/random/pouch = 8, /obj/item/weapon/storage/pouch/pistol_holster = 1)
	//One guaranteed holster and plenty of randoms

/obj/item/weapon/storage/deferred/comms
	name = "communications kit"
	desc = "A box full of radios and beacons"
	initial_contents = list(/obj/item/device/radio/beacon = 6, /obj/item/device/radio = 6)

/obj/item/weapon/storage/deferred/lights
	name = "illumination kit"
	desc = "A box of flares and flashlights"
	initial_contents = list(/obj/item/device/lighting/glowstick/flare = 20, /obj/item/device/lighting/toggleable/flashlight/heavy = 6)

/obj/item/weapon/storage/deferred/music
	name = "morale kit"
	desc = "All that's required to unite nation, compacted within single box."
	icon_state = "box_serbian"
	initial_contents = list(/obj/item/device/synthesized_instrument/trumpet = 1) //TODO: Add an accordian to this, sprites already made.

//Medical
/obj/item/weapon/storage/deferred/surgery
	name = "combat surgery kit"
	desc = "Contains tools for surgery. Has precise foam fitting for safe transport."
	icon_state = "combat_surgery_kit"
	item_state = "combat_surgery_kit"
	initial_contents = list(
		/obj/item/weapon/tool/bonesetter,
		/obj/item/weapon/tool/cautery,
		/obj/item/weapon/tool/saw/circular,
		/obj/item/weapon/tool/hemostat,
		/obj/item/weapon/tool/retractor,
		/obj/item/weapon/tool/scalpel,
		/obj/item/weapon/tool/tape_roll/bonegel,
		/obj/item/stack/medical/advanced/bruise_pack
		)
	can_hold = list(
		/obj/item/weapon/tool/bonesetter,
		/obj/item/weapon/tool/cautery,
		/obj/item/weapon/tool/saw/circular,
		/obj/item/weapon/tool/hemostat,
		/obj/item/weapon/tool/retractor,
		/obj/item/weapon/tool/scalpel,
		/obj/item/weapon/tool/tape_roll/bonegel,
		/obj/item/stack/medical/advanced/bruise_pack
		)


/obj/item/weapon/storage/deferred/meds
	name = "combat medical kit"
	desc = "Contains advanced medical treatments."
	icon_state = "combat_medical_kit"
	item_state = "combat_medical_kit"
	initial_contents = list(/obj/item/weapon/storage/pill_bottle/bicaridine,
	/obj/item/weapon/storage/pill_bottle/dermaline,
	/obj/item/weapon/storage/pill_bottle/dexalin_plus,
	/obj/item/weapon/storage/pill_bottle/dylovene,
	/obj/item/weapon/storage/pill_bottle/tramadol,
	/obj/item/weapon/storage/pill_bottle/spaceacillin,
	/obj/item/stack/medical/splint)

//Crates
//These use open topped crate sprites but are still functionally boxes. They can be picked up, but are too large to fit in anything
/obj/item/weapon/storage/deferred/crate
	w_class = ITEM_SIZE_HUGE //This is too big to fit in a backpack
	icon_state = "serbcrate_deferred_worn"
	item_state = "crate"

/obj/item/weapon/storage/deferred/crate/tools
	name = "tool storage box"
	desc = "A moderately sized crate full of assorted tools."
	icon_state = "serbcrate_deferred_brown"
	initial_contents = list(/obj/random/tool = 13,
	/obj/random/tool/advanced = 2)

/obj/item/weapon/storage/deferred/crate/saw
	name = "infantry support crate"
	desc = "A crate containing two Pulemyot Kalashnikova light machine guns, and 640 rounds of 7.5mm ammunition."
	icon_state = "serbcrate_deferred_green"
	initial_contents = list(/obj/item/weapon/gun/projectile/automatic/lmg/pk = 2,
	/obj/item/ammo_magazine/rifle_75_linked_box = 8)

/obj/item/weapon/storage/deferred/crate/ak
	name = "rifleman crate"
	desc = "A crate containing six AKM rifles, and plenty of magazines."
	icon_state = "serbcrate_deferred_green"
	initial_contents = list(/obj/item/weapon/gun/projectile/automatic/ak47/sa  = 6,
	/obj/item/ammo_magazine/rifle_75 = 18)

/obj/item/weapon/storage/deferred/crate/grenadier
	name = "grenadier crate"
	desc = "A crate containing one \"Lenar\" launcher, and copious quantities of hand-propelled explosive devices."
	icon_state = "serbcrate_deferred_black"
	initial_contents = list(/obj/item/ammo_casing/grenade/blast = 5,
	/obj/item/ammo_casing/grenade/frag = 14,
	/obj/item/ammo_casing/grenade/emp = 4,
	/obj/item/weapon/gun/projectile/grenade/lenar = 1)

/obj/item/weapon/storage/deferred/crate/antiarmor //change to demolitions, won't do now because will affect map
	name = "demolitions crate"
	icon_state = "serbcrate_deferred_black"
	desc = "A crate containing one \"RPG-7\" launcher, and twelve 40mm PG-7VL warheads."
	initial_contents = list(/obj/item/ammo_casing/rocket = 12,
	/obj/item/weapon/storage/pouch/tubular = 1,
	/obj/item/weapon/gun/projectile/rpg = 1,
	/obj/item/weapon/storage/pouch/tubular = 1)

/obj/item/weapon/storage/deferred/crate/demolition
	name = "breaching crate"
	desc = "A crate of tools to deal with stationary hard targets, and remove obstacles."
	icon_state = "serbcrate_deferred_brown"
	initial_contents = list(/obj/item/weapon/plastique = 13,
	/obj/item/weapon/storage/pouch/tubular = 1,
	/obj/item/weapon/hatton = 1,
	/obj/item/weapon/hatton_magazine = 5,
	/obj/item/weapon/tool/pickaxe/diamonddrill = 1)

/obj/item/weapon/storage/deferred/crate/marksman
	name = "marksman crate"
	desc = "A crate containing one Anti-Materiel Rifle, and ten 60-06 shells."
	icon_state = "serbcrate_deferred_black"
	initial_contents = list(/obj/item/weapon/gun/projectile/heavysniper = 1,
	/obj/item/ammo_magazine/ammobox/antim_small = 2)

/obj/item/weapon/storage/deferred/crate/sidearm
	name = "sidearm crate"
	desc = "A crate containing six Makarov .35 pistols, 200 rounds of ammunition, and six fixed-blade combat knives."
	icon_state = "serbcrate_deferred_green"
	initial_contents = list(/obj/item/weapon/gun/projectile/clarissa/makarov = 6,
	/obj/item/ammo_magazine/highcap_pistol_35  = 20,
	/obj/item/weapon/tool/knife/boot = 6)

/obj/item/weapon/storage/deferred/crate/cells
	name = "power cell bin"
	desc = "A moderately sized crate full of various power cells."
	icon_state = "serbcrate_deferred_worn"
	initial_contents = list(/obj/random/powercell = 16)

/obj/item/weapon/storage/deferred/crate/alcohol
	name = "liquor crate"
	desc = "A moderately sized crate full of various alcoholic drinks."
	icon_state = "serbcrate_deferred_worn"
	initial_contents = list(/obj/random/booze = 10,
	/obj/random/booze/low_chance = 10,
	/obj/item/weapon/reagent_containers/food/drinks/bottle/vodka = 3)

/obj/item/weapon/storage/deferred/crate/uniform_green
	name = "green uniform kit"
	desc = "A moderately sized crate full of clothes."
	icon_state = "serbcrate_deferred_green"
	initial_contents = list(
	/obj/item/clothing/under/serbiansuit = 1,
	/obj/item/clothing/head/soft/green2soft = 1,
	/obj/item/clothing/suit/armor/platecarrier/green = 1,
	/obj/item/clothing/head/helmet/faceshield/altyn = 1,
	/obj/item/clothing/mask/balaclava/tactical = 1,
	/obj/item/clothing/shoes/jackboots = 1,
	/obj/item/clothing/gloves/fingerless = 1)

/obj/item/weapon/storage/deferred/crate/uniform_brown
	name = "brown uniform kit"
	desc = "A moderately sized crate full of clothes."
	icon_state = "serbcrate_deferred_brown"
	initial_contents = list(
	/obj/item/clothing/under/serbiansuit/brown = 1,
	/obj/item/clothing/head/soft/tan2soft = 1,
	/obj/item/clothing/suit/armor/platecarrier/tan = 1,
	/obj/item/clothing/head/helmet/faceshield/altyn/brown = 1,
	/obj/item/clothing/mask/balaclava/tactical = 1,
	/obj/item/clothing/shoes/jackboots = 1,
	/obj/item/clothing/gloves/fingerless = 1)

/obj/item/weapon/storage/deferred/crate/uniform_black
	name = "black uniform kit"
	desc = "A moderately sized crate full of clothes."
	icon_state = "serbcrate_deferred_black"
	initial_contents = list(
	/obj/item/clothing/under/serbiansuit/black = 1,
	/obj/item/clothing/suit/armor/platecarrier = 1,
	/obj/item/clothing/head/helmet/faceshield/altyn/black = 1,
	/obj/item/clothing/mask/balaclava/tactical = 1,
	/obj/item/clothing/shoes/jackboots = 1,
	/obj/item/clothing/gloves/fingerless = 1,
	/obj/item/weapon/reagent_containers/food/drinks/bottle/vodka = 1)

/obj/item/weapon/storage/deferred/crate/uniform_flak
	name = "flak serbian uniform crate"
	desc = "A moderately sized crate full of clothes."
	icon_state = "serbcrate_deferred_worn"
	initial_contents = list(
	/obj/item/clothing/under/serbiansuit = 1,
	/obj/item/clothing/suit/armor/flackvest/green = 1,
	/obj/item/clothing/head/helmet/faceshield/altyn/maska = 1,
	/obj/item/clothing/mask/balaclava/tactical = 1,
	/obj/item/clothing/shoes/jackboots = 1,
	/obj/item/clothing/gloves/fingerless = 1,
	/obj/item/weapon/storage/fancy/cigarettes = 1)

/obj/item/weapon/storage/deferred/crate/uniform_light
	name = "light armor kit"
	desc = "A moderately sized crate full of clothes."
	icon_state = "serbcrate_deferred_worn"
	initial_contents = list(
	/obj/item/clothing/under/serbiansuit = 1,
	/obj/item/clothing/head/soft/green2soft = 1,
	/obj/item/clothing/suit/armor/flackvest = 1,
	/obj/item/clothing/head/helmet/steelpot = 1,
	/obj/item/clothing/shoes/jackboots = 1,
	/obj/item/clothing/gloves/fingerless = 1,
	/obj/item/weapon/storage/fancy/cigarettes = 1)

/obj/item/weapon/storage/deferred/crate/iron_lock_security_uniform
	name = "Iron Lock Security uniform crate"
	desc = "A moderately sized crate full of clothes."
	icon_state = "northtech_deferred"
	initial_contents = list(
	/obj/item/clothing/mask/balaclava/tactical = 1,
	/obj/item/clothing/shoes/ablasive/iron_lock_security = 1,
	/obj/item/clothing/gloves/thick/ablasive/iron_lock_security  = 1,
	/obj/item/clothing/head/soft/iron_lock_security = 1,
	/obj/item/clothing/head/helmet/laserproof/iron_lock_security = 1,
	/obj/item/clothing/suit/armor/vest/iron_lock_security = 1,
	/obj/item/clothing/under/iron_lock_security = 1)

/obj/item/weapon/storage/deferred/crate/exc_gear
	name = "excelsior crate"
	desc = "A crate containing everything you need for the revolution."
	icon_state = "exc_deferred"
	initial_contents = list(/obj/item/weapon/gun/projectile/clarissa/makarov = 2,
	/obj/item/ammo_magazine/highcap_pistol_35  = 4,
	/obj/item/weapon/tool/knife/boot = 1,
	/obj/item/weapon/circuitboard/excelsior_teleporter = 1,
	/obj/item/weapon/circuitboard/excelsiorautolathe = 1,
	/obj/item/weapon/stock_parts/manipulator/excelsior = 3,
	/obj/item/weapon/stock_parts/matter_bin/excelsior = 3,
	/obj/item/weapon/cell/large/excelsior = 1,
	/obj/item/weapon/stock_parts/subspace/crystal = 1,
	/obj/item/clothing/under/excelsior = 1,
	/obj/item/weapon/gun/matter/launcher/reclaimer = 1,
	/obj/item/weapon/storage/toolbox/syndicate = 1,
	/obj/item/device/radio/headset/uplink = 1,
	/obj/item/weapon/storage/toolbox/electrical = 1,
	/obj/item/clothing/shoes/combat = 1,
	/obj/item/clothing/gloves/thick/combat = 1,
	/obj/item/clothing/suit/space/void/excelsior = 1,
	/obj/item/weapon/storage/firstaid/ifak = 1,
	/obj/item/weapon/implanter/excelsior = 2,
	/obj/item/weapon/storage/backpack = 1,
	/obj/item/weapon/storage/backpack/satchel = 1)

