/obj/item/storage/pouch
	name = "pouch"
	desc = "Can hold various things."
	icon = 'icons/inventory/pockets/icon.dmi'
	icon_state = "pouch"
	item_state = "pouch"
	price_tag = 100
	cant_hold = list(/obj/item/storage/pouch) //Pouches in pouches was a misstake

	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_BELT //Pouches can be worn on belt
	storage_slots = 1
	max_w_class = ITEM_SIZE_SMALL
	max_storage_space = DEFAULT_SMALL_STORAGE
	matter = list(MATERIAL_BIOMATTER = 12)
	attack_verb = list("pouched")

	var/sliding_behavior = FALSE
	var/internal_bulk = 0 //How much are inside items grows are size
	var/used_storage_space = 0 //How much space is already used in the container, used for growing extra bulk
	var/free_space_percent = 0 //0 means 100% free space, well 100% means no free space
	var/plus_extra_bulk = 0    //Used for adding bulk to the item, as the normal var gets overwrote

/obj/item/storage/pouch/verb/toggle_slide()
	set name = "Toggle Slide"
	set desc = "Toggle the behavior of last item in [src] \"sliding\" into your hand."
	set category = "Object"

	sliding_behavior = !sliding_behavior
	to_chat(usr, SPAN_NOTICE("Items will now [sliding_behavior ? "" : "not"] slide out of [src]"))

/obj/item/storage/pouch/attack_hand(mob/living/carbon/human/user)
	if(sliding_behavior && (src in user))
		// Check for regular storage contents first
		if(contents.len)
			slide_out_item(user)
		// Check for holstered items if this is a holster pouch
		else if(acts_as_holster && get_first_occupied_holster())
			unholster(user)
	else
		..()

/obj/item/storage/pouch/proc/slide_out_item(mob/living/carbon/human/user)
	var/obj/item/I = contents[contents.len]
	if(istype(I))
		hide_from(usr)
		var/turf/T = get_turf(user)
		remove_from_storage(I, T)
		usr.put_in_hands(I)
		add_fingerprint(user)

/obj/item/storage/pouch/Initialize(mapload)
	..()
	pouch_size_increase() //Do to plus_extra_bulk

/obj/item/storage/pouch/handle_item_insertion(obj/item/W as obj, prevent_warning = FALSE, mob/user, suppress_warning = FALSE)
	..()
	//Grow when we add in are items
	pouch_size_increase()
	// If this pouch acts as a holster, track holsterable items in the holstered list
	// Only track items that have SLOT_HOLSTER flag
	if(acts_as_holster && holster_slots && holster_enabled)
		// Only track items that have SLOT_HOLSTER flag
		if(W.slot_flags & SLOT_HOLSTER)
			var/index = get_first_empty_holster()
			if(index)
				holstered[index] = W

/obj/item/storage/pouch/remove_from_storage(obj/item/W as obj, atom/new_location)
	..()
	//So that we can accually shrink when taking items out
	pouch_size_increase()
	// If this pouch acts as a holster, clear the holstered list entry when items are removed
	if(acts_as_holster && holster_slots)
		for(var/i = 1, i <= holster_slots, i++)
			if(holstered[i] == W)
				holstered[i] = null
				break

//Little complex at glance but shockingly simple!
/obj/item/storage/pouch/proc/pouch_size_increase()
	//Interal bulk is how much over-weight class you store it over with.
	internal_bulk = 0
	used_storage_space = 0
	free_space_percent = 0

	//Cycle through are contents and find everything ever
	for(var/obj/item/I in contents)
		var/over_filled = 0 //Now we got to get what a REAL w-class is per object
		over_filled = I.w_class + I.extra_bulk //Extrabulk for sake of calulations is insanely rough
		used_storage_space += over_filled
		if(over_filled > w_class) //If we are item is bigger then are pouch then we get get bigger!
			internal_bulk += over_filled - w_class

	if(used_storage_space) //Prevents devide by 0
		free_space_percent = used_storage_space / max_storage_space //20 / 5 = 4
		free_space_percent *= 100 //To get it to be base 100%
		//This **LOOKS** harsh but its not, unlike w_class these are lineral numbers not mulitied by silly hidden things
		switch(free_space_percent)
			if(0 to 25)
				internal_bulk += 1
			if(25 to 50)
				internal_bulk += 1.5
			if(50 to 75)
				internal_bulk += 2
			if(75 to INFINITY)
				internal_bulk += 2.5

	extra_bulk = internal_bulk + plus_extra_bulk //This scaling means that if you mix in a-ok items with a few over-big ones they are not all stacking their mauls
	if(extra_bulk < 0)
		extra_bulk = 0
	if(istype(loc, /obj/item/storage))
		var/obj/item/storage/SO = loc
		SO.refresh_all() //So we can see are items take up more space and prevent confusion

/obj/item/storage/pouch/small_generic
	name = "small generic pouch"
	desc = "Can hold nearly anything in it, but only a small amount."
	icon_state = "small_generic"
	item_state = "small_generic"
	storage_slots = null //Uses generic capacity
	max_storage_space = DEFAULT_SMALL_STORAGE * 0.5
	max_w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_BIOMATTER = 5)
	level = BELOW_PLATING_LEVEL //We can hide under tiles :D

/obj/item/storage/pouch/small_generic/implanted
	name = "implanted generic pouch"
	desc = "Can hold nearly anything in it, but only a small amount."
	icon_state = "small_implanted"
	max_storage_space = DEFAULT_SMALL_STORAGE * 0.4
	matter = list(MATERIAL_SILK = 1)

/obj/item/storage/pouch/small_generic/purple
	icon_state = "small_generic_p"
	item_state = "small_generic_p"

/obj/item/storage/pouch/small_generic/leather
	icon_state = "small_leather"
	item_state = "small_leather"
	price_tag = 250

/obj/item/storage/pouch/medium_generic
	name = "medium generic pouch"
	desc = "Can hold nearly anything in it, but only a moderate amount."
	icon_state = "medium_generic"
	item_state = "medium_generic"
	storage_slots = null //Uses generic capacity
	max_storage_space = DEFAULT_SMALL_STORAGE
	max_w_class = ITEM_SIZE_NORMAL
	price_tag = 400
	level = BELOW_PLATING_LEVEL //As we can
	plus_extra_bulk = 1 //Anti-quatom scaling with smaller items

/obj/item/storage/pouch/medium_generic/leather
	icon_state = "medium_leather"
	item_state = "medium leather"
	price_tag = 500

/obj/item/storage/pouch/medium_generic/opifex
	name = "opifex smuggle pouch"
	desc = "Can hold nearly anything in it, but only a moderate amount. Made by the opifex, for the opifex."
	icon_state = "medium_opifex"
	item_state = "medium_opifex"

//We do medium for scaling reasons
/obj/item/storage/pouch/medium_generic/psionic
	name = "Woven Pouch C-7v89"
	desc = "A small on the outside experimental hand bag only usable for psionic users."
	icon_state = "medium_psion"
	item_state = "medium_generic"
	storage_slots = null //Uses generic capacity
	max_storage_space = 1 // This increases in size based on the user
	max_w_class = ITEM_SIZE_TINY //Increases in size with user
	price_tag = 800
	level = BELOW_PLATING_LEVEL //As we can
	matter = list(MATERIAL_CLOTH = 15, MATERIAL_PLASMA = 1)
	var/psionic_storage_cap = DEFAULT_NORMAL_STORAGE + 5 //Starting out the peak is 2.25 medium pouches
	var/psionic_scaling_mult = 1
	var/psionic_storage = 5
	var/repression = TRUE
	cant_hold = list(/obj/item/storage/pouch, /obj/item/device/psionic_catalyst)
	plus_extra_bulk = 30 //Heavily limited in putting it in modular storage

/obj/item/storage/pouch/medium_generic/psionic/verb/toggle_repression()
	set name = "Toggle Storage Repression"
	set desc = "Repression makes it so at higher storage points you may put in larger items, at the cost of losing some storage slot options (i.e Belt/Pockets)."
	set category = "Object"
	set src in view(1)

	if(contents.len >= 1)
		to_chat(usr, SPAN_NOTICE("You are not allow to toggle repression well items are inside [src]."))
		return
	if(!isturf(loc))
		to_chat(usr, SPAN_NOTICE("You are not allow to toggle repression well [src] is on person."))
		return
	repression = !repression
	psionic_tune()
	to_chat(usr, SPAN_NOTICE("Repression: [repression ? "Activated" : "Deactivated"] "))


/obj/item/storage/pouch/medium_generic/psionic/pouch_size_increase()
	psionic_tune()
	..()

/obj/item/storage/pouch/medium_generic/psionic/attack_hand(mob/user as mob)
	psionic_tune()
	..()

/obj/item/storage/pouch/medium_generic/psionic/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/device/psionic_catalyst))
		var/obj/item/device/psionic_catalyst/PC = I
		if(!PC.stored_power)
			to_chat(user, "[PC] has no stored power!")
			return
		var/used = FALSE
		//Todo: improved feedback on what your improving
		//I cant make it not sound videogamey
		if(psionic_scaling_mult < 1.5)
			psionic_scaling_mult += 0.1
			used = TRUE
			to_chat(user, "It seems a little easier to use your maxium psionic pool to increase the [src] space.")

		if(psionic_storage < 15 && !used)
			psionic_storage += 1
			used = TRUE
			to_chat(user, "It seems [src] has a little more space.")

		if(!used)
			psionic_storage_cap += 2
			to_chat(user, "It seems catalysts can only increase potential, using more catalyst on this pouch might be wasteful!")


		to_chat(user, "The power stored in [PC] leaks out into the cold void as the [src] is tuned.")
		PC.stored_power = null //Nom!
		PC.resonances = "Null"
		PC.icon_state = "psi_catalyst_dull"

	..()

/obj/item/storage/pouch/medium_generic/psionic/proc/psionic_tune()
	var/failed_to_be_psion = TRUE
	if(ishuman(loc))
		var/mob/living/carbon/human/psionc = loc
		var/obj/item/organ/internal/psionic_tumor/PT = psionc.first_organ_by_process(BP_PSION)
		if(PT)
			slot_flags = initial(slot_flags)
			w_class = initial(w_class)
			failed_to_be_psion = FALSE
			//This balancing is REALLY weird so make sure you know what your doing before tweaking
			//Basically every psionic point is a "tiny item of space"
			//Normal pouches DEFAULT_SMALL_STORAGE, aka 10 according to __DEFINES/inventory_sizes.dm
			//10 psionic points MATCHES small pouches, aka 100 cog.
			//Now thats insanely bad and unfun so we do a bit of safty netting, aka the MINIUM you can have is a small pouch
			//First we eat cubes upto a max of 10, for at lest 1 medium pouch
			//Second After that we just increase the cap endlessly
			max_storage_space = round(PT.max_psi_points * psionic_scaling_mult) + psionic_storage
			max_storage_space = clamp(max_storage_space, 5, psionic_storage_cap)
			max_w_class = ITEM_SIZE_SMALL
			if(!repression)
				if(max_storage_space >= 20) //DEFAULT_NORMAL_STORAGE
				//We are matching large pouches
					max_w_class = ITEM_SIZE_NORMAL
					slot_flags = SLOT_BELT | SLOT_DENYPOCKET
					w_class = ITEM_SIZE_BULKY

				//We are matching backpacks pouches
				if(max_storage_space >= 30) //DEFAULT_BULKY_STORAGE
					max_w_class = ITEM_SIZE_BULKY
					slot_flags = SLOT_DENYPOCKET | SLOT_BACK
					w_class = ITEM_SIZE_HUGE


	if(failed_to_be_psion)
		w_class = initial(w_class)
		max_storage_space = 1 // this is set to one do stop devide by 0
		max_w_class = ITEM_SIZE_TINY //Increases in size with user
		slot_flags = SLOT_BELT | SLOT_DENYPOCKET //non-psionics cant hold this in a pocket without psionic first doing some handing over

/obj/item/storage/pouch/large_generic
	name = "large generic pouch"
	desc = "A mini satchel. Can hold a fair bit, but it won't fit in your pocket."
	icon_state = "large_generic"
	item_state = "large_generic"
	w_class = ITEM_SIZE_BULKY //This is like a second satchle, is this size for belt/box ect nesting tricks
	slot_flags = SLOT_BELT | SLOT_DENYPOCKET
	storage_slots = null //Uses generic capacity
	max_storage_space = DEFAULT_NORMAL_STORAGE
	max_w_class = ITEM_SIZE_NORMAL
	matter = list(MATERIAL_BIOMATTER = 20)
	price_tag = 800
	plus_extra_bulk = 6 //Anti-quatom scaling with smaller items

obj/item/storage/pouch/large_generic/advmedic
	desc = "A mini satchel. Can hold a fair bit, but it won't fit in your pocket. This one is well worn and reeks like the inside of a frontier-chemlab."

obj/item/storage/pouch/large_generic/advmedic/populate_contents()
	new /obj/item/reagent_containers/hypospray/autoinjector/large/meralyn(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/large/meralyn(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/large/meralyn(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/large/vermicetol(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/large/vermicetol(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/large/vermicetol(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/large/varceptol(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/large/varceptol(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/large/varceptol(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/large/blood(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/large/blood(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/large/blood(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/large/blood(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/large/antirad(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/large/antirad(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/large/antirad(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/large/peridaxon(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/large/peridaxon(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/large/peridaxon(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/large/peridaxon(src)


/obj/item/storage/pouch/large_generic/leather
	desc = "A mini satchel made of leather. Can hold a fair bit, but it won't fit in your pocket."
	icon_state = "large_leather"
	item_state = "large_leather"
	price_tag = 900

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
	w_class = ITEM_SIZE_TINY
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
	w_class = ITEM_SIZE_TINY
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
	w_class = ITEM_SIZE_TINY
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
	w_class = ITEM_SIZE_SMALL
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
		/obj/item/cell/small,
		/obj/item/tank/emergency_oxygen,
		/obj/item/tank/emergency_nitgen,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/ammo_casing/flare,
		/obj/item/ammo_casing/shotgun,
		/obj/item/ammo_magazine/speed_loader_shotgun,
		/obj/item/ammo_casing/grenade,
		/obj/item/device/flash,
		/obj/item/reagent_containers/snacks/openable/tastybread
		)

/obj/item/storage/pouch/tubular/vial
	name = "vial pouch"
	desc = "Can hold seven cylindrical and small items, including but not limiting to flares, glowsticks, syringes and even hatton tubes or rockets. Tho the branding on this wants you to only really use it with vial."


/obj/item/storage/pouch/tubular/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/pockets/icon.dmi', "flare_[contents.len]"))

/obj/item/storage/pouch/grow_a_gun
	name = "H&S Grow A Gun"
	desc = "A bag of dehydrated guns, just add water to grow them into a ready to use Slaught-o-Matic. There are several warnings to not eat the dehydrated guns inside, and to keep away from kids unless hydrated."
	icon_state = "grow"
	item_state = "grow"
	matter = list(MATERIAL_PLASTIC = 1)
	storage_slots = 7
	w_class = ITEM_SIZE_TINY
	max_w_class = ITEM_SIZE_TINY

	can_hold = list(
		/obj/item/reagent_containers/snacks/cube/gun,
		)

/obj/item/storage/pouch/grow_a_gun/New()
	populate_contents()

/obj/item/storage/pouch/grow_a_gun/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/snacks/cube/gun(src)
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
	storage_slots = 0
	acts_as_holster = TRUE
	holster_slots = 1
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_NORMAL
	plus_extra_bulk = -1

	can_hold = list(
		/obj/item/gun/projectile/makarov,
		/obj/item/gun/projectile/clarissa,
		/obj/item/gun/projectile/colt,
		/obj/item/gun/projectile/basilisk,
		/obj/item/gun/projectile/giskard,
		//obj/item/gun/projectile/gyropistol,
		/obj/item/gun/projectile/lamia,
		/obj/item/gun/projectile/mk58,
		/obj/item/gun/projectile/revolver/lemant,
		/obj/item/gun/projectile/olivaw,
		/obj/item/gun/projectile/silenced,
		/obj/item/gun/projectile/ladon,
		/obj/item/gun/projectile/glock,
		/obj/item/gun/projectile/that_gun,
		/obj/item/gun/projectile/judiciary,
		/obj/item/gun/projectile/rebar,
		/obj/item/gun/projectile/rivet,
		/obj/item/gun/projectile/silvereye,
		/obj/item/gun/projectile/spring,
		/obj/item/gun/projectile/boltgun/sawn,
		/obj/item/gun/projectile/shotgun/pump/obrez,
		/obj/item/gun/projectile/automatic/texan,
		/obj/item/gun/projectile/automatic/sts/sawn,
		/obj/item/gun/projectile/automatic/luty,
		/obj/item/gun/projectile/automatic/freedom,
		/obj/item/gun/projectile/automatic/slaught_o_matic,
		/obj/item/gun/projectile/automatic/nordwind/strelki/sawn,
		/obj/item/gun/projectile/automatic/omnirifle/solmarine/sawn,
		/obj/item/gun/projectile/automatic/omnirifle/solmarine/shotgunless_sawn,
		/obj/item/gun/energy/glock,
		/obj/item/gun/energy/ionpistol,
		/obj/item/gun/energy/gun,
		/obj/item/gun/energy/chameleon,
		/obj/item/gun/energy/centurio,
		/obj/item/gun/energy/stunrevolver,
		/obj/item/gun/energy/ntpistol,
		/obj/item/gun/energy/zwang,
		/obj/item/gun/energy/captain/zapper,
		/obj/item/gun/energy/floragun,
		/obj/item/gun/energy/taser,
		/obj/item/gun/energy/slimegun,
		/obj/item/gun/energy/sonic_emitter,
		/obj/item/gun/energy/crossbow,
		/obj/item/gun/energy/xray/psychic_cannon,
		/obj/item/gun/energy/laser/railgun/pistol,
		/obj/item/gun/energy/laser/makeshift,
		/obj/item/gun/energy/cog/sawn,
		/obj/item/gun/projectile/revolver,
		/obj/item/gun/projectile/revolver/sixshot/sawn,
		/obj/item/gun/projectile/shotgun/doublebarrel/sawn, //short enough to fit in
		/obj/item/gun/launcher/syringe,
		/obj/item/gun/energy/plasma/auretian,
		/obj/item/gun/energy/plasma/stranger,
		/obj/item/gun/energy/plasma/martyr,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/gun/matter/launcher/nt_sprayer
		)

	cant_hold = list(/obj/item/storage/pouch,
					 /obj/item/gun/projectile/automatic/sts/rifle/blackshield/sawn,
					 /obj/item/gun/projectile/automatic/sts/rifle/sawn,
					 /obj/item/gun/projectile/revolver/sixshot,
					 /obj/item/gun/energy/gun/nuclear,
					 /obj/item/gun/energy/crossbow/largecrossbow,
					 )


	sliding_behavior = TRUE

/obj/item/storage/pouch/pistol_holster/update_icon()
	..()
	cut_overlays()
	// For holster-only storage, check holstered list instead of contents
	if(storage_slots == 0 && acts_as_holster)
		if(get_first_occupied_holster())
			add_overlay(image('icons/inventory/pockets/icon.dmi', "pistol_layer"))
	else if(contents.len)
		add_overlay(image('icons/inventory/pockets/icon.dmi', "pistol_layer"))

/obj/item/storage/pouch/pistol_holster/cowboy
	name = "belt holster"
	desc = "Can hold two handguns in. Quick on the draw!"
	icon_state = "double_holster"
	item_state = "double_holster"
	price_tag = 100
	matter = list(MATERIAL_BIOMATTER = 24) // Two holsters in one!
	slot_flags = SLOT_BELT|SLOT_DENYPOCKET
	max_w_class = ITEM_SIZE_HUGE
	storage_slots = 0
	acts_as_holster = TRUE
	holster_slots = 2

/obj/item/storage/pouch/pistol_holster/cowboy/update_icon()
	..()
	cut_overlays()
	// For holster-only storage, check holstered list instead of contents
	if(storage_slots == 0 && acts_as_holster)
		var/holstered_count = 0
		for(var/i = 1, i <= holster_slots, i++)
			if(holstered[i])
				holstered_count++
		if(holstered_count)
			add_overlay(image('icons/inventory/pockets/icon.dmi', "gun_[holstered_count]"))
	else if(contents.len)
		add_overlay(image('icons/inventory/pockets/icon.dmi', "gun_[contents.len]"))

/obj/item/storage/pouch/kniferig
	name = "throwing knife rig"
	desc = "A rig for professionals at knife throwing."
	icon_state = "kniferig"
	item_state = "kniferig"
	price_tag = 50
	storage_slots = 4 // 12 knives total counting stacks
	can_hold = list(
		/obj/item/stack/thrown/throwing_knife
		)

/obj/item/storage/pouch/kniferig/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/pockets/icon.dmi', "knife_[contents.len]"))

/obj/item/storage/pouch/quiver
	name = "arrows quiver"
	desc = "A quiver that can hold many types of arrows for quick drawing. Ideal for the aspiring or veteran hunter."
	icon_state = "quiver"
	item_state = "quiver"
	price_tag = 50
	slot_flags = SLOT_BELT | SLOT_DENYPOCKET
	matter = list(MATERIAL_BIOMATTER = 10)
	storage_slots = 4 // 12 arrows
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_NORMAL
	sliding_behavior = TRUE // It is by default a quickdraw quiver
	plus_extra_bulk = -2

	can_hold = list(
		/obj/item/ammo_casing/arrow,
		/obj/item/ammo_casing/arrow/bulk, // Just in case...
		/obj/item/ammo_casing/arrow/hunting,
		/obj/item/ammo_casing/arrow/hunting/bulk,
		/obj/item/ammo_casing/arrow/hunting/heavy,
		/obj/item/ammo_casing/arrow/hunting/heavy/bulk,
		/obj/item/ammo_casing/arrow/broadhead,
		/obj/item/ammo_casing/arrow/serrated,
		/obj/item/ammo_casing/arrow/reagent,
		/obj/item/ammo_casing/arrow/reagent/hypo,
		/obj/item/ammo_casing/arrow/practice,
		/obj/item/ammo_casing/arrow/practice/bulk,
		/obj/item/ammo_casing/arrow/empty_payload,
		/obj/item/ammo_casing/arrow/empty_payload/bulk,
		/obj/item/ammo_casing/arrow/explosive,
		/obj/item/ammo_casing/arrow/explosive/emp,
		/obj/item/ammo_casing/arrow/explosive/flashbang,
		/obj/item/ammo_casing/arrow/explosive/heatwave,
		/obj/item/ammo_casing/arrow/explosive/smoke,
		/obj/item/ammo_casing/arrow/explosive/frag,
		/obj/item/ammo_casing/arrow/explosive/frag/sting)

/obj/item/storage/pouch/quiver/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/pockets/icon.dmi', "arrows"))

/obj/item/storage/pouch/bolts
	name = "crossbow quiver"
	desc = "A quiver that can hold many types of crossbow bolts. Quickdrawing and reloading made easier for ye olde siege enthusiast."
	icon_state = "quiver_crossbow"
	item_state = "quiver_crossbow"
	price_tag = 50
	slot_flags = SLOT_BELT | SLOT_DENYPOCKET
	matter = list(MATERIAL_BIOMATTER = 15) // Can hold a full stack of rods.
	storage_slots = 4
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_BULKY // Just in case a full stack won't fit.
	sliding_behavior = TRUE // Quickdraw!
	plus_extra_bulk = -2

	can_hold = list(
		/obj/item/stack/rods,
		/obj/item/ammo_casing/rod_bolt, // Just in case...
		/obj/item/ammo_casing/crossbow_bolts,
		/obj/item/ammo_casing/crossbow_bolts/bulk,
		/obj/item/ammo_casing/crossbow_bolts/fragment,
		/obj/item/ammo_casing/crossbow_bolts/fragment/bulk,
		/obj/item/ammo_casing/crossbow_bolts/speed,
		/obj/item/ammo_casing/crossbow_bolts/speed/bulk)

/obj/item/storage/pouch/bolts/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/pockets/icon.dmi', "bolts"))

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
		/obj/item/reagent_containers/snacks/openable/tastybread,
		/obj/item/reagent_containers/snacks/baguette,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/drinks/cans,
		/obj/item/gun/projectile/boltgun/flare_gun
		)

	sliding_behavior = TRUE

/obj/item/storage/pouch/baton_holster/telebaton

/obj/item/storage/pouch/baton_holster/telebaton/New()
	new/obj/item/melee/telebaton(src)
	update_icon()
	. = ..()

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
	price_tag = 3000

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
				E.droplimb(0, DISMEMBER_METHOD_BLUNT)
			else if (held == slot_r_hand)
				var/obj/item/organ/external/E = H.get_organ(BP_R_ARM)
				E.droplimb(0, DISMEMBER_METHOD_BLUNT)
		user.drop_item()
		return
	..()
