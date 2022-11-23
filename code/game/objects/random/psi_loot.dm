
/obj/random/psi
	name = "random deepmaints psionic loot"
	icon_state = "armor-blue"
	spawn_nothing_percentage = 20

/obj/random/psi/item_to_spawn()
	return pickweight(list(
	//Swords and hammers
	/obj/item/tool/sword/cult/deepmaints = 1,
	/obj/item/tool/hammer/homewrecker/cult/deepmaints = 1,
	/obj/item/tool/saw/chain/cult/deepmaints = 1,
	/obj/item/tool/sword/machete/cult/deepmaints = 1,
	/obj/item/tool/sword/cleaver/cult/deepmaints = 1,
	/obj/item/tool/power_fist/cult/deepmaints = 1,
	//Guns and Lasers
	/obj/item/gun/energy/laser/cult/deepmaints = 1,
	/obj/item/gun/energy/plasma/cassad/cult/deepmaints = 1,
	/obj/item/gun/energy/plasma/auretian/cult/deepmaints = 1,
	/obj/item/gun/projectile/automatic/greasegun/cult/deepmaints = 1,
	//Tools
	/obj/item/tool/multitool/advanced/cult/deepmaints = 1,
	/obj/item/tool/shovel/power/cult/deepmaints = 1,
	/obj/item/tool/screwdriver/combi_driver/cult/deepmaints = 1,
	/obj/item/tool/weldingtool/advanced/cult/deepmaints = 1,
	/obj/item/tool/shovel/combat/cult/deepmaints = 1,
	/obj/item/tool/wrench/big_wrench/cult/deepmaints = 1
	))

/obj/random/psi/always_spawn
	name = "random always spawn deepmaints psionic loot"
	spawn_nothing_percentage = 0

/obj/random/psi/low_chance
	name = "low chance random deepmaints psionic loot"
	icon_state = "armor-blue-low"
	spawn_nothing_percentage = 80

/obj/random/psi/guns
	name = "random psionic deepmaints guns"

/obj/random/psi/guns/item_to_spawn()
	return pickweight(list(
	//Guns and Lasers
	/obj/item/gun/energy/laser/cult/deepmaints = 1,
	/obj/item/gun/energy/plasma/cassad/cult/deepmaints = 1,
	/obj/item/gun/energy/plasma/auretian/cult/deepmaints = 1,
	/obj/item/gun/projectile/automatic/greasegun/cult/deepmaints = 1
	))

/obj/random/psi/guns/always_spawn
	name = "gun based always spawn deepmaints psionic loot"
	spawn_nothing_percentage = 0

/obj/random/psi/guns/low_chance
	name = "low chance gun based deepmaints psionic loot"
	icon_state = "armor-blue-low"
	spawn_nothing_percentage = 80

/obj/random/psi/tools
	name = "random psionic deepmaints tools"

/obj/random/psi/tools/item_to_spawn()
	return pickweight(list(
	//Tools
	/obj/item/tool/multitool/advanced/cult/deepmaints = 1,
	/obj/item/tool/shovel/power/cult/deepmaints = 1,
	/obj/item/tool/screwdriver/combi_driver/cult/deepmaints = 1,
	/obj/item/tool/weldingtool/advanced/cult/deepmaints = 1,
	/obj/item/tool/shovel/combat/cult/deepmaints = 1,
	/obj/item/tool/wrench/big_wrench/cult/deepmaints = 1
	))

/obj/random/psi/tools/always_spawn
	name = "tools based always spawn deepmaints psionic loot"
	spawn_nothing_percentage = 0

/obj/random/psi/tools/low_chance
	name = "low chance tools based deepmaints psionic loot"
	icon_state = "armor-blue-low"
	spawn_nothing_percentage = 80

/obj/random/psi/weapons
	name = "random psionic deepmaints weapons"

/obj/random/psi/weapons/item_to_spawn()
	return pickweight(list(
	//Tools
	/obj/item/tool/sword/cult/deepmaints = 1,
	/obj/item/tool/hammer/homewrecker/cult/deepmaints = 1,
	/obj/item/tool/saw/chain/cult/deepmaints = 1,
	/obj/item/tool/sword/machete/cult/deepmaints = 1,
	/obj/item/tool/sword/cleaver/cult/deepmaints = 1,
	/obj/item/tool/power_fist/cult/deepmaints = 1
	))

/obj/random/psi/weapons/always_spawn
	name = "weapons based always spawn deepmaints psionic loot"
	spawn_nothing_percentage = 0

/obj/random/psi/weapons/low_chance
	name = "low chance weapons based deepmaints psionic loot"
	icon_state = "armor-blue-low"
	spawn_nothing_percentage = 80
