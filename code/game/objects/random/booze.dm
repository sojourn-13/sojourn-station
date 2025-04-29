/obj/random/booze
	name = "random booze"
	icon_state = "cannister-red"

/obj/random/booze/item_to_spawn()
	return pickweight(list(/obj/item/reagent_containers/drinks/bottle/small/beer = 7,
				/obj/item/reagent_containers/drinks/bottle/small/ale = 1,
				/obj/item/reagent_containers/drinks/bottle/absinthe = 1,
				/obj/item/reagent_containers/drinks/bottle/bluecuracao = 1,
				/obj/item/reagent_containers/drinks/bottle/gin = 1,
				/obj/item/reagent_containers/drinks/bottle/kahlua = 1,
				/obj/item/reagent_containers/drinks/bottle/melonliquor = 1,
				/obj/item/reagent_containers/drinks/bottle/rum = 1,
				/obj/item/reagent_containers/drinks/bottle/tequilla = 1,
				/obj/item/reagent_containers/drinks/bottle/vodka = 2,
				/obj/item/reagent_containers/drinks/bottle/whiskey = 1,
				/obj/item/reagent_containers/drinks/bottle/patron = 1,
				/obj/item/reagent_containers/drinks/bottle/goldschlager = 1,
				/obj/item/reagent_containers/drinks/bottle/wine = 1,
				/obj/item/reagent_containers/drinks/bottle/cognac = 1,
				/obj/item/reagent_containers/drinks/bottle/vermouth = 1,
				/obj/item/reagent_containers/drinks/cans/thirteenloko = 0.1,
				/obj/item/reagent_containers/drinks/bottle/pwine = 0.5))

/obj/random/booze/low_chance
	name = "low chance random booze"
	icon_state = "cannister-red-low"
	spawn_nothing_percentage = 60

/obj/random/soft_drink
	name = "random soft drink"
	icon_state = "cannister-red"

/obj/random/soft_drink/item_to_spawn()
	return pickweight(list(
	/obj/item/reagent_containers/drinks/cans/cola = 1,
	/obj/item/reagent_containers/drinks/cans/space_mountain_wind = 1,
	/obj/item/reagent_containers/drinks/cans/dr_gibb = 1,
	/obj/item/reagent_containers/drinks/cans/starkist = 1,
	/obj/item/reagent_containers/drinks/cans/space_up = 1,
	/obj/item/reagent_containers/drinks/cans/lemon_lime = 1,
	/obj/item/reagent_containers/drinks/cans/iced_tea = 1,
	/obj/item/reagent_containers/drinks/cans/grape_juice = 1,
	/obj/item/reagent_containers/drinks/cans/tonic = 1,
	/obj/item/reagent_containers/drinks/cans/waterbottle = 1,
	/obj/item/reagent_containers/drinks/cans/sodawater = 1,
	/obj/item/reagent_containers/drinks/cans/melonsoda = 1))

/obj/random/soft_drink/low_chance
	name = "low chance soft drink"
	icon_state = "cannister-red-low"
	spawn_nothing_percentage = 60

/obj/random/drinking_glasses
	name = "random drinking glass (no reagents)"
	icon_state = "cannister-red"

/obj/random/drinking_glasses/item_to_spawn()
	return pickweight(list(
	/obj/item/reagent_containers/drinks/drinkingglass = 1,
	/obj/item/reagent_containers/drinks/drinkingglass/shot = 1,
	/obj/item/reagent_containers/drinks/drinkingglass/mug = 1,
	/obj/item/reagent_containers/drinks/drinkingglass/pint = 1,
	/obj/item/reagent_containers/drinks/drinkingglass/doble = 1,
	/obj/item/reagent_containers/drinks/drinkingglass/wineglass = 1,
	/obj/item/reagent_containers/drinks/pitcher = 1,
	/obj/item/reagent_containers/drinks/carafe = 1,
	/obj/item/reagent_containers/drinks/flask/shiny = 1,
	/obj/item/reagent_containers/drinks/flask/lithium = 1,
	/obj/item/reagent_containers/drinks/flask = 1,
	/obj/item/reagent_containers/drinks/flask/barflask = 1,
	/obj/item/reagent_containers/drinks/flask/vacuumflask = 1,
	/obj/item/reagent_containers/drinks/mug = 1,
	/obj/item/reagent_containers/drinks/mug/black = 1,
	/obj/item/reagent_containers/drinks/mug/red = 1,
	/obj/item/reagent_containers/drinks/mug/green = 1,
	/obj/item/reagent_containers/drinks/mug/blue = 1,
	/obj/item/reagent_containers/drinks/mug/heart = 1,
	/obj/item/reagent_containers/drinks/mug/one = 0.1,
	/obj/item/reagent_containers/drinks/mug/metal = 1,
	/obj/item/reagent_containers/drinks/mug/rainbow = 1,
	/obj/item/reagent_containers/drinks/mug/brit = 0.1,
	/obj/item/reagent_containers/drinks/mug/moebius = 0.1,
	/obj/item/reagent_containers/drinks/mug/gold = 0.1,
	/obj/item/reagent_containers/drinks/mug/old_nt = 0.1,
	/obj/item/reagent_containers/drinks/mug/new_nt = 0.1,
	/obj/item/reagent_containers/drinks/mug/syndie = 0.1,
	/obj/item/reagent_containers/drinks/mug/serb = 0.1,
	/obj/item/reagent_containers/drinks/mug/ironhammer = 0.1,
	/obj/item/reagent_containers/drinks/mug/league = 0.1,
	/obj/item/reagent_containers/drinks/mug/moe = 0.1,
	/obj/item/reagent_containers/drinks/mug/aster = 0.1,
	/obj/item/reagent_containers/drinks/mug/guild = 0.1,
	/obj/item/reagent_containers/drinks/mug/white = 1,
	/obj/item/reagent_containers/drinks/mug/teacup = 1,
	/obj/item/reagent_containers/drinks/teapot = 0.01))

/obj/random/drinking_glasses/low_chance
	name = "low chance soft drink (no reagents)"
	icon_state = "cannister-red-low"
	spawn_nothing_percentage = 60
