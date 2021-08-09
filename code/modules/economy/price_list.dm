// For convenience and easier comparing and maintaining of item prices,
// all these will be defined here and sorted in different sections.

// The proc that is called when the price is being asked for. Use this to refer to another object if necessary.
/atom/movable/proc/get_item_cost(export)
	. = price_tag


// From the machine //

/obj/item/reagent_containers/food/drinks/cans/cola
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/space_mountain_wind
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/dr_gibb
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/starkist
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/waterbottle
	price_tag = 2

/obj/item/reagent_containers/food/drinks/cans/space_up
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/iced_tea
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/grape_juice
	price_tag = 1


//***************//
//----Bottles----//
//***************//

// Juices, soda and similar //

/obj/item/reagent_containers/food/drinks/bottle/cola
	price_tag = 1

/obj/item/reagent_containers/food/drinks/bottle/space_up
	price_tag = 1

/obj/item/reagent_containers/food/drinks/bottle/space_mountain_wind
	price_tag = 1

/obj/item/reagent_containers/food/drinks/bottle/orangejuice
	price_tag = 1

/obj/item/reagent_containers/food/drinks/bottle/cream
	price_tag = 1

/obj/item/reagent_containers/food/drinks/bottle/tomatojuice
	price_tag = 1

/obj/item/reagent_containers/food/drinks/bottle/limejuice
	price_tag = 1


// Beer //

/obj/item/reagent_containers/food/drinks/bottle/small/beer
	price_tag = 1

/obj/item/reagent_containers/food/drinks/bottle/small/ale
	price_tag = 1


// Spirituous Liquors //

/obj/item/reagent_containers/food/drinks/bottle/absinthe
	price_tag = 2

/obj/item/reagent_containers/food/drinks/bottle/bluecuracao
	price_tag = 2

/obj/item/reagent_containers/food/drinks/bottle/gin
	price_tag = 2

/obj/item/reagent_containers/food/drinks/bottle/kahlua
	price_tag = 2

/obj/item/reagent_containers/food/drinks/bottle/melonliquor
	price_tag = 2

/obj/item/reagent_containers/food/drinks/bottle/rum
	price_tag = 2

/obj/item/reagent_containers/food/drinks/bottle/tequilla
	price_tag = 2

/obj/item/reagent_containers/food/drinks/bottle/vodka
	price_tag = 2

/obj/item/reagent_containers/food/drinks/bottle/whiskey
	price_tag = 2


/obj/item/reagent_containers/food/drinks/bottle/patron
	price_tag = 2

/obj/item/reagent_containers/food/drinks/bottle/goldschlager
	price_tag = 2

/obj/item/reagent_containers/food/drinks/bottle/bottleofnothing
	price_tag = 10

/obj/item/reagent_containers/food/drinks/bottle/grenadine
	price_tag = 2


// Wines //

/obj/item/reagent_containers/food/drinks/bottle/wine
	price_tag = 2

/obj/item/reagent_containers/food/drinks/bottle/cognac
	price_tag = 2

/obj/item/reagent_containers/food/drinks/bottle/vermouth
	price_tag = 2

/obj/item/reagent_containers/food/drinks/bottle/pwine
	price_tag = 3

//***************//
//----Smokes-----//
//***************//

/obj/item/storage/fancy/cigarettes
	price_tag = 5

/obj/item/storage/fancy/cigarettes/ishimura
	price_tag = 5

/obj/item/storage/fancy/cigarettes/tannhauser
	price_tag = 5

/obj/item/storage/fancy/cigarettes/brouzouf
	price_tag = 6

/obj/item/storage/fancy/cigarettes/frozen
	price_tag = 8

/obj/item/storage/fancy/cigarettes/shodan
	price_tag = 8

/obj/item/storage/fancy/cigarettes/toha
	price_tag = 8

/obj/item/storage/fancy/cigarettes/fortress
	price_tag = 9

/obj/item/storage/fancy/cigarettes/fortressred
	price_tag = 9

/obj/item/storage/fancy/cigarettes/fortressblue
	price_tag = 9

/obj/item/storage/fancy/cigar
	price_tag = 15

/obj/item/storage/box/matches
	price_tag = 3

/obj/item/flame/lighter
	price_tag = 2

/obj/item/flame/lighter/zippo
	price_tag = 5

/obj/item/bluespace_crystal
	price_tag = 500

/obj/machinery
	price_tag = 100

/obj/machinery/get_item_cost(export)
	. = ..()
	for(var/atom/movable/i in component_parts)
		. += SStrade.get_new_cost(i)

/obj/machinery/portable_atmospherics
	price_tag = 200

/obj/machinery/power/supermatter
	price_tag = 20000

/obj/machinery/portable_atmospherics/canister/get_item_cost(export)
	. = price_tag + (price_tag * log(10, air_contents.volume)) //todo, prices of gases

/obj/structure/reagent_dispensers/price_tag = 5

/obj/structure/reagent_dispensers/get_item_cost()
	var/ratio = reagents.total_volume / reagents.maximum_volume

	return ..() + round(contents_cost * ratio)


/obj/item/tank
	price_tag = 50

/obj/item/tank/plasma
	price_tag = 75

/obj/item/tank/get_item_cost(export)
	. = price_tag + (price_tag * log(10, air_contents.volume)) //todo, prices of gases

/obj/item/circuitboard
	price_tag = 150

/obj/item/circuitboard/get_item_cost(export)
	. = ..()
	for(var/atom/movable/i in req_components)
		if(ispath(i))
			. += SStrade.get_new_cost(i) * log(10, price_tag / 2)
/* SoJ edit we have are own vaules for this
/obj/item/stock_parts
	price_tag = 100

/obj/item/stock_parts/get_item_cost(export)
	. = ..() * rating
*/

/obj/item/organ
	price_tag = 50 //Mass printable here

/mob/living/simple_animal/corgi
	price_tag = 250

/mob/living/simple_animal/cat
	price_tag = 150

/mob/living/carbon/superior_animal/roach
	price_tag = 150

/mob/living/carbon/superior_animal/roach/roachling
	price_tag = 100

/mob/living/carbon/superior_animal/roach/hunter
	price_tag = 200

/mob/living/simple_animal/hostile/helldiver
	price_tag = 500

/mob/living/carbon/superior_animal/lodge/clucker
	price_tag = 300 //Eggs to hatch make this easy to mass do

 //Imagine dragging a loge animals allllll the way to the colony
/mob/living/carbon/superior_animal/lodge/tatonka
	price_tag = 800

/mob/living/carbon/superior_animal/lodge/tatonka/tangu
	price_tag = 1650

/mob/living/carbon/superior_animal/lodge/cerberus
	price_tag = 1500

/mob/living/carbon/superior_animal/lodge/cerberus/chimera
	price_tag = 3500

/mob/living/exosuit/get_item_cost(export)
	. = ..() + SStrade.get_import_cost()

/obj/item/stack/get_item_cost(export)
	return amount * ..()

/obj/item/reagent_containers/blood
	price_tag = 5

/obj/item/reagent_containers/blood/get_item_cost(export)
	. = ..()
	. += (. / 2 * reagents?.total_volume) //holds as of 08-AUG-21 200u, meaning max filled should be around 405 credits

/obj/item/ammo_magazine/price_tag = 60

/obj/item/ammo_magazine/ammobox/price_tag = 40
/*
/obj/item/ammo_magazine/get_item_cost(export)
	. = ..()
	for(var/obj/item/ammo_casing/i in stored_ammo)
		. += i.get_item_cost(export)

/obj/item/ammo_casing/price_tag = 20 //This leads to selling spent shells for 20 credits, a ammo box of 300 blanks will go for 600. This is so dumb

/obj/item/ammo_casing/get_item_cost(export)
	. = ..() * amount
*/
/obj/item/tool/price_tag = 20

/obj/item/tool/get_item_cost(export)
	. = 1
	for(var/i in tool_qualities)
		. += tool_qualities[i] / 10 //AHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
	. *= ..()

/obj/structure/medical_stand/price_tag = 100

/obj/item/virusdish/price_tag = 300

/obj/item/reagent_containers/price_tag = 20

/obj/item/reagent_containers/glass/beaker/bluespace/price_tag = 300
/*
//This is so bad, like no really this is horrable, this should have never been a thing
//Get a beaker fill 120u of water have it be worth have it be worth 2400 credits.
/obj/item/reagent_containers/get_item_cost(export)
	. = ..()
	. += reagents.total_volume * .
*/
/obj/item/clothing/price_tag = 30

/obj/item/solar_assembly/price_tag = 100

/obj/item/tracker_electronics/price_tag = 150

/obj/item/handcuffs/price_tag = 30

/obj/item/handcuffs/get_item_cost(export)
	. = ..()
	. += breakouttime / 20

/obj/item/grenade/price_tag = 50

/obj/item/robot_parts/price_tag = 100
/obj/item/robot_parts/robot_component/armour/exosuit/price_tag = 300
/obj/item/robot_parts/robot_component/armour/exosuit/radproof/price_tag = 500
/obj/item/robot_parts/robot_component/armour/exosuit/em/price_tag = 550
/obj/item/robot_parts/robot_component/armour/exosuit/combat/price_tag = 1000

/obj/item/mech_component/price_tag = 150
/obj/item/mech_equipment/price_tag = 200

/obj/item/gun/launcher/grenade/price_tag = 1500

/obj/item/storage/briefcase/inflatable/price_tag = 50

/obj/item/inflatable/price_tag = 40

/obj/item/tool/knife/dagger/bluespace/price_tag = 400