/datum/gear/utility/zippo
	display_name = "zippo selection"
	path = /obj/item/flame/lighter/zippo
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/utility
	display_name = "briefcase"
	path = /obj/item/storage/briefcase
	sort_category = "Utility"

/datum/gear/utility/briefcasesecure
	display_name = "briefcase, secure"
	path = /obj/item/storage/secure/briefcase
	cost = 2

/datum/gear/lunchbox
	display_name = "lunch box"
	path = /obj/item/storage/lunchbox
	sort_category = "Utility"
	cost = 2

/datum/gear/lunchbox/New()
	..()
	// Build dynamic lists containing all matching food/drink types so the lunchbox
	// selection includes every available snack, meal, and canned drink without
	// hardcoding individual paths.
	var/list/snacks = list()
	var/list/meals = list()
	var/list/canned_drinks = list()

	// Collect types from the type tree and convert them into name->path
	// assoc lists so the loadout UI displays human-friendly names instead
	// of raw type paths.
	snacks = init_lunchable_list(lunchables_lunches())
	meals = init_lunchable_list(lunchables_snacks())
	canned_drinks = init_lunchable_list(lunchables_drinks())

	// Register tweaks
	gear_tweaks += new /datum/gear_tweak/contents/snack(snacks)
	gear_tweaks += new /datum/gear_tweak/contents/meal(meals)
	gear_tweaks += new /datum/gear_tweak/contents/drink(canned_drinks)


/datum/gear/lunchbox/cat
	display_name = "cat lunch box"
	path = /obj/item/storage/lunchbox/cat
	cost = 2

/datum/gear/lunchbox/cat/New()
	..()

/datum/gear/lunchbox/rainbow
	display_name = "rainbow lunch box"
	path = /obj/item/storage/lunchbox/rainbow
	cost = 2

/datum/gear/lunchbox/rainbow/New()
	..()

/datum/gear/lunchbox/church
	display_name = "church lunch box"
	path = /obj/item/storage/lunchbox/lemniscate
	cost = 2

/datum/gear/lunchbox/church/New()
	..()

/datum/gear/utility/cane
	display_name = "cane"
	path = /obj/item/cane
	cost = 0

/datum/gear/utility/canewhite
	display_name = "cane, white"
	path = /obj/item/cane/whitecane
	cost = 0

/datum/gear/utility/crutch
	display_name = "crutch"
	path = /obj/item/cane/crutch
	cost = 0

/datum/gear/utility/clipboard
	display_name = "clipboard"
	path = /obj/item/clipboard
	cost = 0

/datum/gear/utility/multipen
	display_name = "multicolored pen"
	path = /obj/item/pen/multi
	cost = 0

/datum/gear/utility/crayonbox
	display_name = "crayon box"
	path = /obj/item/storage/fancy/crayons
	cost = 1

/datum/gear/utility/folder
	display_name = "folder selection"
	path = /obj/item/folder
	flags = GEAR_HAS_TYPE_SELECTION
	cost = 0

/datum/gear/utility/cyborgbook
	display_name = "S.R.I Cyborg Catalogue"
	path = /obj/item/book/manual/robotics_catalogue
	cost = 0

/datum/gear/utility/advancedlaptop
	display_name = "laptop, advanced"
	path = /obj/item/modular_computer/laptop/preset/custom_loadout/advanced/golden
	cost = 4

/datum/gear/utility/normallaptop
	display_name = "laptop, consumer"
	path = /obj/item/modular_computer/laptop/preset/custom_loadout/standard/xenoware
	cost = 2

/datum/gear/utility/cheaplaptop
	display_name = "laptop, military"
	path = /obj/item/modular_computer/laptop/preset/custom_loadout/cheap/elbrus4kk
	cost = 3

/datum/gear/utility/lighter
	display_name = "lighter"
	path = /obj/item/flame/lighter
	cost = 1

/datum/gear/utility/matchbook
	display_name = "matchbook"
	path = /obj/item/storage/box/matches
	cost = 0

/datum/gear/utility/paicard
	display_name = "personal AI device"
	path = /obj/item/device/paicard
	cost = 1

/datum/gear/utility/silvercoin
	display_name = "silver coin"
	path = /obj/item/coin/silver
	cost = 0

/datum/gear/utility/tabletadvanced
	display_name = "tablet computer, advanced"
	path = /obj/item/modular_computer/tablet/preset/custom_loadout/advanced
	cost = 3

/datum/gear/utility/tabletcheap
	display_name = "tablet computer, consumer"
	path = /obj/item/modular_computer/tablet/preset/custom_loadout/cheap
	cost = 2

/datum/gear/utility/wristmounted
	display_name = "wristmounted computer"
	path = /obj/item/modular_computer/wrist

/datum/gear/utility/tts
	display_name = "tts device"
	path = /obj/item/device/text_to_speech
	cost = 0

/datum/gear/utility/wheelchair
	display_name = "wheelchair"
	path = /obj/item/wheelchair
	cost = 0

/datum/gear/utility/sling
	display_name = "universal sling"
	path = 	/obj/item/clothing/suit/sling
	cost = 0

/datum/gear/utility/guitar
	display_name = "guitar"
	path = /obj/item/device/synthesized_instrument/guitar
	cost = 0

/datum/gear/utility/guitar_e
	display_name = "polyguitar guitar"
	path = /obj/item/device/synthesized_instrument/guitar/multi
	cost = 0

/datum/gear/utility/synthesized
	display_name = "synthesizer"
	path = /obj/item/device/synthesized_instrument/synthesizer
	cost = 0

/datum/gear/utility/trumpet
	display_name = "synthesized trumpet"
	path = /obj/item/device/synthesized_instrument/trumpet
	cost = 0

/datum/gear/utility/violin
	display_name = "synthesized violin"
	path = /obj/item/device/synthesized_instrument/violin
	cost = 0

/datum/gear/utility/tinfoil
	display_name = "anti-psion hat"
	path = /obj/item/clothing/head/psionic/tinfoil
	cost = 1 //Has materas so its still a little bit of costs

/datum/gear/utility/costume
	display_name = "costume kit"
	path = /obj/item/storage/box/costume
	flags = GEAR_HAS_TYPE_SELECTION
	cost = 1 //Style at a cost! - also cardboard
