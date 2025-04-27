/obj/item/storage/belt
	name = "belt"
	desc = "Can hold various things."
	icon = 'icons/inventory/belt/icon.dmi'
	icon_state = "utility"
	item_state = "utility"
	storage_slots = 7
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_NORMAL_STORAGE
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_BIOMATTER = 4, MATERIAL_PLASTIC = 5)
	attack_verb = list("whipped", "lashed", "disciplined")
	price_tag = 15
	cant_hold = list(/obj/item/storage/pouch) //Cant stack pouches in belts
	var/show_above_suit = 0

/obj/item/storage/belt/Initialize()
	. = ..()
	if (!item_state)
		item_state = icon_state

	update_icon()

/obj/item/storage/belt/verb/toggle_layer()
	set name = "Switch Belt Layer"
	set category = "Object"

	if(show_above_suit == -1)
		to_chat(usr, SPAN_NOTICE("\The [src] cannot be worn above your suit!"))
		return
	show_above_suit = !show_above_suit
	update_icon()

/obj/item/storage/update_icon()
	if (ismob(src.loc))
		var/mob/M = src.loc
		M.update_inv_belt()

/obj/item/storage/belt/sci
	icon_state = "scibelt"
	item_state = "scibelt"

/obj/item/storage/belt/utility
	name = "tool belt"
	desc = "Can hold various tools."
	icon_state = "utility"
	item_state = "utility"
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

/obj/item/storage/belt/utility/full/populate_contents()
	new /obj/item/tool/screwdriver(src)
	new /obj/item/tool/wrench(src)
	new /obj/item/tool/weldingtool(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/tool/wirecutters(src)
	new /obj/item/stack/cable_coil/random(src)

/obj/item/storage/belt/utility/full/guild/populate_contents()
	new /obj/item/tool/hammer(src)
	new /obj/item/tool/wrench(src)
	new /obj/item/tool/weldingtool(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/tool/wirecutters(src)
	new /obj/item/tool/saw(src)
	new /obj/item/stack/cable_coil/random(src)

/obj/item/storage/belt/utility/roboticist
	name = "roboticist tool belt"
	desc = "Can hold various tools."
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
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/ammo_casing/flare,
		/obj/item/gun/hydrogen/plasma_torch // Something that can hold a welder should be able to hold the same welder turned into a gun.
	)

/obj/item/storage/belt/utility/roboticist/populate_contents()
	new /obj/item/tool/screwdriver/electric(src)
	new /obj/item/tool/wrench/big_wrench(src)
	new /obj/item/tool/plasma_torch/loaded(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/tool/wirecutters(src)
	new /obj/item/tool/multitool(src)
	new /obj/item/stack/cable_coil(src)

/obj/item/storage/belt/hunter
	name = "hunting belt"
	desc = "Can hold various tools fit for a lodge hunter."
	icon_state = "hunting"
	item_state = "hunting"
	storage_slots = 11
	can_hold = list(
		/obj/item/tool,
		/obj/item/tool_upgrade,
		/obj/item/device/radio,
		/obj/item/stack/cable_coil,
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
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine,
		/obj/item/melee,
		/obj/item/reagent_containers/snacks,
		/obj/item/reagent_containers/drinks,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/pill,
		/obj/item/reagent_containers/syringe,
		/obj/item/stack/medical,
		/obj/item/device/scanner/health,
		/obj/item/soap,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/ammo_casing/flare,
		/obj/item/oddity/chimeric_fang_trophy,
		/obj/item/device/binoculars,
		/obj/item/device/lighting/glowstick/flare/torch
	)

/obj/item/storage/belt/utility/neotheology
	name = "Absolutism utility belt"
	desc = "Waist-held holy items."
	icon_state = "utility_neotheology"
	can_hold_extra = list(
		/obj/item/book/ritual/cruciform,
		/obj/item/implant/core_implant/cruciform,
		/obj/item/soap,
		/obj/item/reagent_containers/spray/cleaner,
		/obj/item/tool/knife/dagger/nt,
		/obj/item/tool/sword/nt/shortsword,
		/obj/item/reagent_containers/drinks/bottle/ntcahors,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/ammo_casing/flare,
		/obj/item/gun/energy/plasma/martyr,
		/obj/item/gun/energy/ntpistol,
		/obj/item/device/binoculars
	)

/obj/item/storage/belt/utility/handmade
	name = "handmade tool belt"
	desc = "Can hold various tools, its made from wire. It somehow always ends up the same color no matter what it is made from."
	icon_state = "handmade_utility"
	item_state = "handmande_utility"
	price_tag = 5

/obj/item/storage/belt/utility/handmade/full/populate_contents()
	new /obj/item/tool/screwdriver/improvised(src)
	new /obj/item/tool/wrench/improvised(src)
	new /obj/item/tool/weldingtool/improvised(src)
	new /obj/item/tool/crowbar/improvised(src)
	new /obj/item/tool/wirecutters/improvised(src)
	new /obj/item/stack/cable_coil/random(src)
	new /obj/item/tool/saw/improvised(src)

/obj/item/storage/belt/utility/opifex
	name = "opifex black tool webbing"
	desc = "A black webbing made specifically for opifex to prevent any pulling or ruffling of feathers, slightly uncomfortable for anyone else but none can deny its quality. This harness is built specifically for tools, limiting its versatility."
	icon_state = "webbing_black"
	item_state = "webbing_black"
	storage_slots = 12

/obj/item/storage/belt/utility/opifex/full/populate_contents()
	new /obj/item/tool/crowbar/pneumatic(src)
	new /obj/item/tool/hammer/deadblow(src)
	new /obj/item/tool/multitool/advanced(src)
	new /obj/item/tool/saw/circular/advanced(src)
	new /obj/item/tool/screwdriver/electric(src)
	new /obj/item/stack/cable_coil/random(src)
	new /obj/item/tool/shovel/power(src)
	new /obj/item/tool/tape_roll/fiber(src)
	new /obj/item/tool/weldingtool/advanced(src)
	new /obj/item/tool/wirecutters/armature(src)
	new /obj/item/tool/wrench/big_wrench(src)
	new /obj/item/tool/knife/dagger(src)

/obj/item/storage/belt/medical/opifex
	name = "opifex black medical webbing"
	desc = "A black webbing made specifically for opifex to prevent any pulling or ruffling of feathers, slightly uncomfortable for anyone else but none can deny its quality. This harness is built specifically for medical supplies, limiting its versatility."
	icon_state = "webbing_black"
	item_state = "webbing_black"
	storage_slots = 12

/obj/item/storage/belt/medical/opifex/full/populate_contents()
	new /obj/item/device/scanner/health(src)
	new /obj/item/reagent_containers/glass/bottle/stoxin(src)
	new /obj/item/reagent_containers/syringe/large/hyperzine(src)
	new /obj/item/reagent_containers/syringe/large/tricordrazine(src)
	new /obj/item/reagent_containers/syringe/large/inaprovaline(src)
	new /obj/item/storage/pill_bottle/opifex(src)
	new /obj/item/storage/pill_bottle/opifex(src)
	//Opifex medical gets SI oint/bruise packs cuz they pre-order it on opi-fedex
	//Downside is that they cant be split do to how naming and descs are rewrote
	new /obj/item/stack/medical/ointment/soteria{splittable=FALSE;name="opifex optimized ointments";singular_name="opifex optimized ointment";desc="Used to treat those nasty burns. Its formula massively improved by including toxin-purging sterilizing nanites."}(src)
	new /obj/item/stack/medical/bruise_pack/soteria{splittable=FALSE;name="opifex optimized gauze";singular_name="opifex optimized gauze";desc="A sterile gauze to wrap around bloody stumps. Do to nanites these sterilize wounds as ointment would."}(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/bodybag/cryobag(src)
	new /obj/item/extinguisher/mini(src)

/obj/item/storage/belt/medical/opifex/medical/solfed
	name = "black medical webbing"
	desc = "A black webbing, highly customized and lovingly worn. This harness is built specifically for medical supplies, limiting its versatility."
	icon_state = "webbing_black"
	item_state = "webbing_black"
	storage_slots = 16

/obj/item/storage/belt/medical/opifex/medical/solfed/populate_contents()
	new /obj/item/device/scanner/health(src)
	new /obj/item/reagent_containers/syringe/large/hyperzine(src)
	new /obj/item/reagent_containers/syringe/large/tricordrazine(src)
	new /obj/item/reagent_containers/syringe/large/inaprovaline(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/prosurgeon(src)
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/dermaline(src)
	new /obj/item/storage/pill_bottle/dexalin_plus(src)
	new /obj/item/storage/pill_bottle/antitox(src)
	new /obj/item/bodybag/cryobag(src)

/obj/item/storage/belt/medical
	name = "medical belt"
	desc = "Can hold various medical equipment."
	icon_state = "medicalbelt"
	item_state = "medical"
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

/obj/item/storage/belt/medical/emt
	name = "EMT utility belt"
	desc = "A sturdy black webbing belt with attached pouches."
	icon_state = "emsbelt"
	item_state = "emsbelt"

/obj/item/storage/belt/security
	name = "tactical belt"
	desc = "Can hold various military and security equipment. Even has some clamps to allow you to hold masks and hats."
	icon_state = "security"
	item_state = "security"
	can_hold = list(
		/obj/item/clothing/head,
		/obj/item/clothing/mask,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/handcuffs,
		/obj/item/tool/crowbar,
		/obj/item/device/flash,
		/obj/item/clothing/gloves,
		/obj/item/clothing/glasses,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine,
		/obj/item/cell/small,
		/obj/item/cell/medium,
		/obj/item/flame/lighter,
		/obj/item/device/lighting/toggleable/flashlight,
		/obj/item/modular_computer/pda,
		/obj/item/device/radio/headset,
		/obj/item/device/hailer,
		/obj/item/device/megaphone,
		/obj/item/device/t_scanner/advanced,
		/obj/item/device/holowarrant,
		/obj/item/melee,
		/obj/item/device/radio,
		/obj/item/tool/knife,
		/obj/item/tool/shovel/combat,
		/obj/item/gun/projectile/mk58,
		/obj/item/gun/projectile/makarov,
		/obj/item/gun/projectile/clarissa,
		/obj/item/gun/projectile/colt,
		/obj/item/gun/energy/gun,
		/obj/item/gun/projectile/giskard,
		/obj/item/gun/projectile/olivaw,
		/obj/item/gun/projectile/revolver/detective,
		/obj/item/gun/energy/gun/martin,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/ammo_casing/flare,
		/obj/item/taperoll,
		/obj/item/pen,
		/obj/item/device/taperecorder,
		/obj/item/clipboard,
		/obj/item/device/camera,
		/obj/item/folder,
		/obj/item/reagent_containers/snacks,
		/obj/item/reagent_containers/drinks,
		/obj/item/device/binoculars, // By popular demand. - Seb
		/obj/item/tool/baton //So it can actually hold both sizes of batons like it used to.
	)

/obj/item/storage/belt/holding
	name = "belt of holding"
	desc = "The greatest in pants-supporting bluespace technology."
	icon_state = "holdingbelt"
	item_state = "holdingbelt"
	storage_slots = 14
	max_w_class = ITEM_SIZE_BULKY
	max_storage_space = DEFAULT_HUGE_STORAGE * 1.25
	matter = list(MATERIAL_STEEL = 6, MATERIAL_GOLD = 6, MATERIAL_DIAMOND = 2, MATERIAL_URANIUM = 3)
	origin_tech = list(TECH_BLUESPACE = 4)

/obj/item/storage/belt/holding/New()
	..()
	item_flags |= BLUESPACE
	bluespace_entropy(4, get_turf(src))

/obj/item/storage/belt/holding/attackby(obj/item/W as obj, mob/user as mob)
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

/obj/item/storage/belt/security/tactical
	name = "professional tactical belt"
	desc = "Can hold various military and security equipment, more so than a standard belt or web harness."
	icon_state = "tactical"
	storage_slots = 16 //Holds a lot as its bigger


/obj/item/storage/belt/security/tactical/marshalert

/obj/item/storage/belt/security/tactical/marshalert/populate_contents()
	new /obj/item/tool/shovel/combat(src)
	new /obj/item/gun/energy/gun/martin(src)
	new /obj/item/cell/small/hyper(src)
	new /obj/item/cell/small/hyper(src)
	new /obj/item/device/lighting/toggleable/flashlight/heavy(src)
	new /obj/item/cell/medium/hyper(src)
	new /obj/item/handcuffs(src)
	new /obj/item/handcuffs(src)
	new /obj/item/device/taperecorder(src)
	new /obj/item/device/camera(src)
	new /obj/item/folder(src)
	new /obj/item/clothing/head/helmet/marshal_full(src)
	new /obj/item/clothing/mask/gas/ihs(src)
	new /obj/item/grenade/flashbang(src)
	new /obj/item/grenade/chem_grenade/teargas(src)
	new /obj/item/grenade/frag/stinger(src)

/obj/item/storage/belt/security/tactical/shieldert

/obj/item/storage/belt/security/tactical/shieldert/populate_contents()
	new /obj/item/tool/shovel/combat(src)
	new /obj/item/gun/energy/gun/martin(src)
	new /obj/item/cell/small/hyper(src)
	new /obj/item/cell/small/hyper(src)
	new /obj/item/device/lighting/toggleable/flashlight/heavy(src)
	new /obj/item/cell/medium/high(src)
	new /obj/item/handcuffs(src)
	new /obj/item/handcuffs(src)
	new /obj/item/device/taperecorder(src)
	new /obj/item/device/camera(src)
	new /obj/item/grenade/flashbang(src) //we're so past caring about contraband.
	new /obj/item/grenade/flashbang(src)
	new /obj/item/grenade/explosive(src)
	new /obj/item/grenade/explosive(src)
	new /obj/item/clothing/glasses/powered/thermal(src)
	new /obj/item/clothing/glasses/powered/night(src)

/obj/item/storage/belt/security/tactical/solfed

/obj/item/storage/belt/security/tactical/solfed/populate_contents()
	new /obj/item/tool/shovel/combat(src)
	new /obj/item/grenade/frag(src)
	new /obj/item/grenade/frag(src)
	new /obj/item/grenade/explosive(src)
	new /obj/item/grenade/explosive(src)
	new /obj/item/cell/small/moebius/nuclear(src)
	new /obj/item/cell/small/moebius/nuclear(src)
	new /obj/item/cell/medium/moebius/nuclear(src)
	new /obj/item/clothing/glasses/powered/night(src)
	new /obj/item/clothing/glasses/powered/thermal(src)
	new /obj/item/device/lighting/toggleable/flashlight/heavy(src)
	new /obj/item/ammo_magazine/kurz_50/hv(src)
	new /obj/item/ammo_magazine/kurz_50/hv(src)
	new /obj/item/ammo_magazine/ammobox/kurz_50/hv(src)
	new /obj/item/device/binoculars(src)

/obj/item/storage/belt/security/tactical/opifex
	name = "opifex tactical belt"
	desc = "A black tactical belt made specifically for opifex to prevent any pulling or ruffling of feathers, slightly uncomfortable for anyone else but none can deny its quality. This harness is built specifically for combat, limiting its versatility."

/obj/item/storage/belt/security/tactical/opifex/full/populate_contents()
	new /obj/item/reagent_containers/spray/pepper(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/device/flash(src)
	new /obj/item/device/lighting/toggleable/flashlight/heavy(src)
	new /obj/item/gun/energy/gun(src)
	new /obj/item/cell/medium/high(src)
	new /obj/item/cell/medium/high(src)
	new /obj/item/tool/knife/dagger/assassin(src)
	new /obj/item/grenade/spawnergrenade/manhacks/opifex(src)
	new /obj/item/grenade/spawnergrenade/manhacks/opifex(src)
	new /obj/item/grenade/smokebomb(src)
	new /obj/item/grenade/chem_grenade/teargas(src)

/obj/item/storage/belt/security/neotheology
	name = "Absolutism tactical belt"
	desc = "Can hold various military and security equipment for the awakened crusader or skilled divisor. Deus Vult."
	icon_state = "tactical_neotheology"
	can_hold_extra = list(
		/obj/item/book/ritual/cruciform,
		/obj/item/implant/core_implant/cruciform,
		/obj/item/tool/knife/neotritual,
		/obj/item/gun/energy/crossbow,
		/obj/item/gun/energy/taser, //specially fitted to hold the counselor
		/obj/item/tool/knife/dagger/nt,
		/obj/item/tool/sword/nt/shortsword,
		/obj/item/reagent_containers/drinks/bottle/ntcahors,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/ammo_casing/flare,
		/obj/item/gun/energy/plasma/martyr,
		/obj/item/gun/energy/ntpistol,
		/obj/item/device/binoculars
	)

/obj/item/storage/belt/champion
	name = "championship belt"
	desc = "Proves to the world that you are the strongest!"
	icon_state = "champion"
	item_state = "champion"
	storage_slots = 1
	can_hold = list(
		/obj/item/clothing/mask/costume/job/luchador
		)
	price_tag = 50

/obj/item/storage/belt/church
	name = "absolutism belt"
	desc = "Waist-held holy items."
	icon_state = "ntbelt"

/obj/item/storage/belt/webbing
	name = "web harness"
	desc = "Everything you need at hand, at belt."
	icon_state = "webbing"
	item_state = "webbing"
	storage_slots = 14
	max_w_class = ITEM_SIZE_SMALL //Holds 14 small items like a real harness, and hats
	max_storage_space = DEFAULT_NORMAL_STORAGE

/obj/item/storage/belt/webbing/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Brown"] = "webbing"
	options["Green"] = "webbing_green"
	options["Black"] = "webbing_black"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/storage/belt/webbing/ih
	name = "security web harness"
	desc = "Everything you need at hand, at belt."
	icon_state = "webbing_ih"
	item_state = "webbing_ih"

/obj/item/storage/belt/webbing/artificer
	name = "artificer guild web harness"
	desc = "Everything you need at hand, at belt. This one is hand crafted by the artificer guild, allowing it to better store larger items by sacrificing space. Better than most tool belts."
	cant_hold = list(/obj/item/storage/pouch,
					 /obj/item/storage/firstaid,
					 /obj/item/storage/toolbox,
					 /obj/item/storage/briefcase) //These types of storage in a belt

/obj/item/storage/belt/webbing/artificer/verb/toggle_storage()
	set name = "Adjust Storage"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["6 Large"]   = "large_storage"
	options["9 Normal"] = "big_storage"
	options["14 Small"]  = "small_storage"

	var/choice = input(M,"What kind of storage do you want?","Adjust Storage") as null|anything in options

	if(src.contents.len >= 1)
		to_chat(M, "You cant adjust the storage well items are inside.")
		return

	if(src && choice && !M.incapacitated() && Adjacent(M))

		if(options[choice] == "large_storage")
			to_chat(M, "You allow the storage of 6 Bulky items.")
			storage_slots = 6
			max_w_class = ITEM_SIZE_BULKY //Holds 6 bulky items, form tools to guns
			return

		if(options[choice] == "big_storage")
			to_chat(M, "You allow the storage of 9 Normal items.")
			storage_slots = 9 //Like old belts used to be
			max_w_class = ITEM_SIZE_NORMAL
			return

		if(options[choice] == "small_storage")
			to_chat(M, "You allow the storage of 14 Small items.")
			storage_slots = 14 //Same as normal webbings
			max_w_class = ITEM_SIZE_SMALL
			return


		return 1

//Start with normal
/obj/item/storage/belt/webbing/artificer/ert
	storage_slots = 9 //Like old belts used to be
	max_w_class = ITEM_SIZE_NORMAL

/obj/item/storage/belt/webbing/artificer/ert/populate_contents()
	new /obj/item/tool/crowbar/pneumatic(src)
	new /obj/item/tool/hammer/deadblow(src)
	new /obj/item/tool/multitool/advanced(src)
	new /obj/item/tool/screwdriver/electric(src)
	new /obj/item/tool/shovel/power(src)
	new /obj/item/tool/tape_roll/fiber(src)
	new /obj/item/tool/baton/arcwelder(src)
	new /obj/item/tool/wirecutters/armature(src)
	new /obj/item/tool/wrench/big_wrench(src)
