
/obj/item/tool_upgrade/stickers
	name = "Aged Stickers"
	desc = "A collection of old stickers worn down by time and full of dirt and grime make the tool harder to hold properly."
	icon_state = "artmod_1"
	price_tag = 0

/obj/item/tool_upgrade/stickers/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = -rand(2,3)*0.1,
	UPGRADE_PRECISION = rand(-6,-3),
	UPGRADE_FORCE_MOD = rand(-2,-1),
	UPGRADE_BULK = rand(0,1),
	UPGRADE_COLOR = pick("#AA7744", "#774411", "#777777")
	)
	I.prefix = "artistic"
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(10, 14)/10
	I.removal_difficulty *= rand(5, 15)/10

/obj/item/tool_upgrade/loudener
	name = "Fitted Horns"
	desc = "For some malicious reason somenone added horns, making the tool louder. Who would do such a thing?"
	icon_state = "dampener"
	price_tag = 0

/obj/item/tool_upgrade/loudener/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = -rand(2,3)*0.1,
	UPGRADE_BULK = rand(1,2),
	UPGRADE_PRECISION = rand(-8,-4),
	UPGRADE_ITEMFLAGPLUS = LOUD,
	UPGRADE_COLOR = pick("#AA7744", "#774411", "#777777")
	)
	I.prefix = "hydraulic"
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(10, 14)/10
	I.removal_difficulty *= rand(5, 15)/10

/obj/item/tool_upgrade/moldy_paint
	name = "Moldy Paint"
	desc = "Once a deep red, now a sickly yellow-green. At least now you can slowly peel off the paint..."
	icon_state = "paint_red"
	price_tag = 0

/obj/item/tool_upgrade/moldy_paint/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = -rand(2,3)*0.1,
	UPGRADE_PRECISION = -10, //its still red paint
	UPGRADE_COLOR = pick("#AA7744", "#774411", "#777777")
	)
	I.prefix = "painted"
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(10, 14)/10
	I.removal_difficulty *= rand(5, 15)/10

/obj/item/tool_upgrade/cracked_fuel
	name = "Cracked Fuel Tank"
	desc = "The massive crack in the fuel tank prevents you from filling it up properly. You should exchange this."
	icon_state = "canister"
	price_tag = 0

/obj/item/tool_upgrade/cracked_fuel/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = -rand(2,3)*0.1,
	UPGRADE_BULK = 3,
	UPGRADE_DEGRADATION_MULT = 1.35,
	UPGRADE_MAXFUEL = -15,
	UPGRADE_PRECISION = rand(-3,-1),
	UPGRADE_COLOR = pick("#AA7744", "#774411", "#777777")
	)
	I.prefix = "expanded"
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(10, 14)/10
	I.removal_difficulty *= rand(5, 15)/10

/obj/item/tool_upgrade/broken_plasma_injector
	name = "Burnt Plasma Injector"
	desc = "This injector is burnt from sustained wear and tear, reducing its efficiency."
	icon_state = "injector"
	price_tag = 0

/obj/item/tool_upgrade/broken_plasma_injector/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = -rand(2,3)*0.1,
	UPGRADE_POWERCOST_MULT = 1.4,
	UPGRADE_FUELCOST_MULT = 1.4,
	UPGRADE_PRECISION = rand(-3,-1),
	UPGRADE_COLOR = pick("#AA7744", "#774411", "#777777")
	)
	I.prefix = "plasma-fueled"
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(10, 14)/10
	I.removal_difficulty *= rand(5, 15)/10

/obj/item/tool_upgrade/faulty_heatsink
	name = "faulty heatsink"
	desc = "This heatsink was falsely installed. It damages the tool with every use and due to the installation more power is used. It is also clunky and doesnt fit properly. Whoever jury-rigged this didnt know what they were doing."
	icon_state = "heatsink"
	price_tag = 0

/obj/item/tool_upgrade/faulty_heatsink/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = -rand(2,3)*0.1,
	UPGRADE_DEGRADATION_MULT = 1.15,
	UPGRADE_POWERCOST_MULT = 1.4,
	UPGRADE_BULK = 1,
	UPGRADE_PRECISION = rand(-3,-1),
	UPGRADE_COLOR = pick("#AA7744", "#774411", "#777777")
	)
	I.prefix = "heatsunk"
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(10, 14)/10
	I.removal_difficulty *= rand(5, 15)/10

/obj/item/tool_upgrade/not_magnetic
	name = "demagnetized bit"
	desc = "Someone welded this on with too much heat and destroyed the bit in the process. This is useless."
	icon_state = "magnetic"
	price_tag = 0

/obj/item/tool_upgrade/not_magnetic/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = -rand(2,3)*0.1,
	UPGRADE_PRECISION = -4,
	UPGRADE_BULK = 1,
	UPGRADE_PRECISION = rand(-3,-1),
	UPGRADE_COLOR = pick("#AA7744", "#774411", "#777777")
	)
	I.prefix = "magnetic"
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(10, 14)/10
	I.removal_difficulty *= rand(5, 15)/10

//Comic gold right here. Funniest thing you ever seen!
/obj/item/tool_upgrade/fungi
	name = "overgrown barrel"
	desc = "A formerly fine gun barrel, now sticky and slimy, left to house a cyphelloid fungi growth. At least you hope it is."
	icon_state = "ported_barrel"
	price_tag = 0

/obj/item/tool_upgrade/fungi/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = -rand(2,3)*0.1,
	UPGRADE_BULK = 3,
	UPGRADE_PRECISION = rand(-3,-1),
	UPGRADE_COLOR = pick("#AA7744", "#774411", "#777777")
	)
	I.prefix = "cyphelloid barreled"
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(10, 14)/10
	I.removal_difficulty *= rand(5, 15)/10


#define TRASH_TOOLMODS list(/obj/item/tool_upgrade/stickers,\
/obj/item/tool_upgrade/loudener,\
/obj/item/tool_upgrade/moldy_paint,\
/obj/item/tool_upgrade/cracked_fuel,\
/obj/item/tool_upgrade/broken_plasma_injector,\
/obj/item/tool_upgrade/faulty_heatsink,\
/obj/item/tool_upgrade/not_magnetic,\
/obj/item/tool_upgrade/fungi)
