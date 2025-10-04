var/global/list/lunchables_lunches_ = list(
	/obj/item/reagent_containers/snacks/sandwich,
	/obj/item/reagent_containers/snacks/meatbreadslice,
	/obj/item/reagent_containers/snacks/tofubreadslice,
	/obj/item/reagent_containers/snacks/creamcheesebreadslice,
	/obj/item/reagent_containers/snacks/margheritaslice,
	/obj/item/reagent_containers/snacks/meatpizzaslice,
	/obj/item/reagent_containers/snacks/mushroompizzaslice,
	/obj/item/reagent_containers/snacks/vegetablepizzaslice,
	/obj/item/reagent_containers/snacks/openable/liquidfood,
	/obj/item/reagent_containers/snacks/jellysandwich,
	/obj/item/reagent_containers/snacks/tossedsalad,
	/obj/item/reagent_containers/snacks/vegetablesoup,
	/obj/item/reagent_containers/snacks/meatsteak,
	/obj/item/reagent_containers/snacks/chickensteak
	)

var/global/list/lunchables_snacks_ = list(
	/obj/item/reagent_containers/snacks/donut/jelly,
	/obj/item/reagent_containers/snacks/donut/cherryjelly,
	/obj/item/reagent_containers/snacks/muffin,
	/obj/item/reagent_containers/snacks/popcorn,
	/obj/item/reagent_containers/snacks/sosjerky,
	/obj/item/reagent_containers/snacks/openable/no_raisin,
	/obj/item/reagent_containers/snacks/openable/spacetwinkie,
	/obj/item/reagent_containers/snacks/cheesiehonkers,
	/obj/item/reagent_containers/snacks/poppypretzel,
	/obj/item/reagent_containers/snacks/carrotfries,
	/obj/item/reagent_containers/snacks/candiedapple,
	/obj/item/reagent_containers/snacks/applepie,
	/obj/item/reagent_containers/snacks/cherrypie,
	/obj/item/reagent_containers/snacks/plumphelmetbiscuit,
	/obj/item/reagent_containers/snacks/appletart,
	/obj/item/reagent_containers/snacks/carrotcakeslice,
	/obj/item/reagent_containers/snacks/cheesecakeslice,
	/obj/item/reagent_containers/snacks/plaincakeslice,
	/obj/item/reagent_containers/snacks/orangecakeslice,
	/obj/item/reagent_containers/snacks/limecakeslice,
	/obj/item/reagent_containers/snacks/lemoncakeslice,
	/obj/item/reagent_containers/snacks/chocolatecakeslice,
	/obj/item/reagent_containers/snacks/birthdaycakeslice,
	/obj/item/reagent_containers/snacks/watermelonslice,
	/obj/item/reagent_containers/snacks/applecakeslice,
	/obj/item/reagent_containers/snacks/pumpkinpieslice
	)

var/global/list/lunchables_drinks_ = list(
	/obj/item/reagent_containers/drinks/coffee,
	/obj/item/reagent_containers/drinks/tea/black,
	/obj/item/reagent_containers/drinks/tea/green,
	/obj/item/reagent_containers/drinks/h_chocolate,
	/obj/item/reagent_containers/drinks/cans/cola,
	/obj/item/reagent_containers/drinks/cans/space_mountain_wind,
	/obj/item/reagent_containers/drinks/cans/dr_gibb,
	/obj/item/reagent_containers/drinks/cans/space_up,
	/obj/item/reagent_containers/drinks/cans/lemon_lime,
	/obj/item/reagent_containers/drinks/cans/iced_tea,
	/obj/item/reagent_containers/drinks/cans/grape_juice,
	/obj/item/reagent_containers/drinks/cans/tonic,
	/obj/item/reagent_containers/drinks/cans/waterbottle,
	/obj/item/reagent_containers/drinks/cans/sodawater,
	/obj/item/reagent_containers/drinks/cans/melonsoda,
	/obj/item/reagent_containers/drinks/cans/thirteenloko
	)

// This default list is a bit different, it contains items we don't want
var/global/list/lunchables_drink_reagents_ = list(
	/datum/reagent/drink,
	/datum/reagent/drink/doctor_delight,
	/datum/reagent/drink/nuka_cola
	)

// This default list is a bit different, it contains items we don't want
var/global/list/lunchables_ethanol_reagents_ = list(
	/datum/reagent/ethanol,
	/datum/reagent/ethanol/bilk,
	/datum/reagent/ethanol/acid_spit,
	/datum/reagent/ethanol/atomicbomb,
	/datum/reagent/ethanol/beepsky_smash,
	/datum/reagent/ethanol/coffee,
	/datum/reagent/ethanol/hippies_delight,
	/datum/reagent/ethanol/hooch,
	/datum/reagent/ethanol/thirteenloko,
	/datum/reagent/ethanol/manhattan_proj,
	/datum/reagent/ethanol/neurotoxin,
	/datum/reagent/ethanol/pwine,
	/datum/reagent/ethanol/threemileisland,
	/datum/reagent/ethanol/toxins_special,
	)

/proc/lunchables_lunches()
	RETURN_TYPE(/list)
	// Return the static list of allowed lunch items. This file contains
	// explicit object type paths in `lunchables_lunches_`.
	return lunchables_lunches_

/proc/lunchables_snacks()
	RETURN_TYPE(/list)
	// Return the static list of allowed snack items.
	return lunchables_snacks_

/proc/lunchables_drinks()
	RETURN_TYPE(/list)
	// Return the static list of allowed drink items.
	return lunchables_drinks_

/proc/lunchables_drink_reagents()
	RETURN_TYPE(/list)
	if(!(lunchables_drink_reagents_[lunchables_drink_reagents_[1]]))
		lunchables_drink_reagents_ = init_lunchable_reagent_list(lunchables_drink_reagents_, /datum/reagent/drink)
	return lunchables_drink_reagents_

/proc/lunchables_ethanol_reagents()
	RETURN_TYPE(/list)
	if(!(lunchables_ethanol_reagents_[lunchables_ethanol_reagents_[1]]))
		lunchables_ethanol_reagents_ = init_lunchable_reagent_list(lunchables_ethanol_reagents_, /datum/reagent/ethanol)
	return lunchables_ethanol_reagents_

/proc/init_lunchable_list(list/lunches)
	RETURN_TYPE(/list)
	. = list()
	for(var/lunch in lunches)
		var/obj/O = lunch
		.[initial(O.name)] = lunch
	return sortAssoc(.)

/proc/init_lunchable_reagent_list(list/banned_reagents, reagent_types)
	RETURN_TYPE(/list)
	. = list()
	for(var/reagent_type in subtypesof(reagent_types))
		if(reagent_type in banned_reagents)
			continue
		var/datum/reagent/reagent = reagent_type
		.[initial(reagent.name)] = reagent_type
	return sortAssoc(.)
