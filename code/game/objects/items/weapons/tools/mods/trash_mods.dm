
/obj/item/tool_upgrade/stickers
	name = "Aged Stickers"
	desc = "A collection of old stickers laminated that have only collected dust and oil making it harder to hold."
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
	name = "Horn Fittings"
	desc = "For malius reasons horns have been added; leading to making the tool much louder."
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
	name = "Mold Paint"
	desc = "Once rich red, now a sickly green. At lest now you can slowly peal off the paint..."
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
	desc = "Secondary fuel tank that has a massive crack in it leading to fuel leaking if you topped it off."
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
	desc = "Once set on fire, these things only slow you down."
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
	name = "wrongly installed heatsink"
	desc = "This heatsink was added to the tool, completely wrong making it take more power and more space well also damaging the tools health even more."
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
	name = "demagnetic bit"
	desc = "Someone welded this magnetic bit, completely destorying its magnetic field. It's not even helping as a weapon."
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
	name = "cyphelloid barrel"
	desc = "A normally fine mod left to house a mushroom, sticky and slimey."
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
