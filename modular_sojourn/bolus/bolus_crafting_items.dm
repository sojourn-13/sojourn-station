/obj/item/bolus_craftable
	name = "Bolus crafting item"
	desc = "A strange object that seems to exist in spite alone. Best to leave it alone"
	icon = 'modular_sojourn/bolus_icons.dmi'

	//Bolus strangth, basically how much each one is adding.
	var/strangth = 1000
	//Alinement affects the end result of a crafted bolus
	var/bolus_alinement = "Will"

///////////////////////////
/// Those that are calm ///
///////////////////////////

//Filtering water
/obj/item/bolus_craftable/still_water
	name = "Still Water"
	desc = "Unopenable container of water that no matter how much one shakes it, never seems to move."
	icon_state = "water_jar"
	price_tag = 100
	strangth = 15
	bolus_alinement = "Calm"

//Filtering wood planks/logs
/obj/item/bolus_craftable/ygg_twing
	name = "Soaking Branch"
	desc = "A thirsty branch that feels dry."
	icon_state = "twig"
	price_tag = 140
	strangth = 35
	bolus_alinement = "Calm"

////////////////////////////////
/// Those that like to weave ///
///////////////////////////////

//Filtering dna (blood)
/obj/item/bolus_craftable/dust_bunny
	name = "Dust of Life"
	desc = "A thin pile of DNA dust."
	icon_state = "dust"
	price_tag = 20
	strangth = 25
	bolus_alinement = "Weaving"

//Filtering cotton
/obj/item/bolus_craftable/cotton
	name = "Cutting Fabric"
	desc = "A tuffle of cotton that unmends any weaving done to it."
	icon_state = "sharp_cotton"
	price_tag = 80
	strangth = 65
	bolus_alinement = "Weaving"

/////////////////////////////
/// Those locked in Space ///
/////////////////////////////

//Filtering grass
/obj/item/bolus_craftable/blade_of_grass
	name = "Evergreen Grass Blade"
	desc = "A green blade of grass that is unable to be changed on a fundimental level."
	icon_state = "blade_of_grass"
	price_tag = 12
	strangth = 45
	bolus_alinement = "Still"

////////////////////////////
/// Those locked in time ///
////////////////////////////

//Filtering grape
/obj/item/bolus_craftable/seed
	name = "Aged Seed"
	desc = "A grape seed that had been around longer then the fruit that produced it."
	icon_state = "seeds"
	price_tag = 300
	strangth = 65
	bolus_alinement = "Immortality"

//////////////////////////////
/// Those locked in motion ///
//////////////////////////////

//Filtering rocks
/obj/item/bolus_craftable/rolling_stone
	name = "Mossless Stone"
	desc = "A stone that is rolling in bluespace to prevent moss."
	icon_state = "pebble"
	price_tag = 30
	strangth = 45
	bolus_alinement = "Moving"

//Filtering apples
/obj/item/bolus_craftable/applejuice
	name = "Falling Apple Juice"
	desc = "Unopenable container of apple pulp that no matter much time passes it seems to be falling."
	icon_state = "applejuice"
	price_tag = 30
	strangth = 10
	bolus_alinement = "Moving"