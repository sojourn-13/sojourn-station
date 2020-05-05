/obj/random/ammo
	name = "random ammunition"
	icon_state = "ammo-green"

/obj/random/ammo/item_to_spawn()
	return pickweight(list(
				/obj/item/weapon/storage/box/shotgunammo/beanbags = 3,
				/obj/item/weapon/storage/box/shotgunammo/slug = 2,
				/obj/item/weapon/storage/box/shotgunammo = 1,
				/obj/item/weapon/storage/box/shotgunammo/buckshot = 3,
				/obj/item/ammo_magazine/ammobox/magnum = 1,
				/obj/item/ammo_magazine/ammobox/magnum/lethal = 1,
				/obj/item/ammo_magazine/ammobox/magnum/rubber = 1,
				/obj/item/ammo_magazine/ammobox/kurtz = 1,
				/obj/item/ammo_magazine/ammobox/kurtz/rubber = 1,
				/obj/item/ammo_magazine/ammobox/kurtz/lethal = 1,
				/obj/item/ammo_magazine/ammobox/lrifle = 1,
				/obj/item/ammo_magazine/ammobox/lrifle_small/rubber = 2,
				/obj/item/ammo_magazine/ammobox/lrifle_small/lethal = 1,
				/obj/item/ammo_magazine/ammobox/rifle_small = 1,
				/obj/item/ammo_magazine/ammobox/rifle_small/lethal = 1,
				/obj/item/ammo_magazine/ammobox/rifle_small/rubber = 2,
				/obj/item/ammo_magazine/ammobox/hrifle_small= 1,
				/obj/item/ammo_magazine/ammobox/hrifle_small/rubber = 2,
				/obj/item/ammo_magazine/ammobox/pistol = 2,
				/obj/item/ammo_magazine/ammobox/pistol/rubber = 2,
				/obj/item/ammo_magazine/ammobox/pistol/lethal = 1,
				/obj/item/ammo_magazine/smg = 1,
				/obj/item/ammo_magazine/smg/rubber = 1,
				/obj/item/ammo_magazine/pistol = 2,
				/obj/item/ammo_magazine/pistol/rubber = 4,
				/obj/item/ammo_magazine/pistol/practice = 4,
				/obj/item/ammo_magazine/hpistol = 2,
				/obj/item/ammo_magazine/hpistol/rubber = 4,
				/obj/item/ammo_magazine/hpistol/practice = 1,
				/obj/item/ammo_magazine/slmagnum = 2,
				/obj/item/ammo_magazine/kurtz = 1,
				/obj/item/ammo_magazine/kurtz/lethal = 1,
				/obj/item/ammo_magazine/kurtz/rubber = 2,
				/obj/item/ammo_magazine/slkurtz = 1,
				/obj/item/ammo_magazine/slkurtz/rubber = 2,
				/obj/item/ammo_magazine/slkurtz/lethal = 1,
				/obj/item/ammo_magazine/slpistol = 3,
				/obj/item/ammo_magazine/slpistol/rubber = 4))


/obj/random/ammo/low_chance
	name = "low chance random ammunition"
	icon_state = "ammo-green-low"
	spawn_nothing_percentage = 60

/obj/random/ammo_fancy
	name = "random advanced ammunition"
	icon_state = "ammo-blue"

/obj/random/ammo_fancy/item_to_spawn()
	return pick(/obj/item/ammo_magazine/rifle/rubber,
				/obj/item/ammo_magazine/rifle,
				/obj/item/ammo_magazine/hrifle,
				/obj/item/ammo_magazine/hrifle/rubber,
				/obj/item/ammo_magazine/hrifle/hv,
				/obj/item/ammo_magazine/hrifle/lethal,
				/obj/item/ammo_magazine/ammobox/rifle_small/lethal,
				/obj/item/ammo_magazine/ammobox/rifle_small,
				/obj/item/ammo_magazine/ammobox/rifle_small/rubber,
				/obj/item/ammo_magazine/ammobox/hrifle_small/rubber,
				/obj/item/ammo_magazine/ammobox/hrifle_small,
				/obj/item/ammo_magazine/ammobox/hrifle_small/lethal,
				/obj/item/ammo_magazine/ammobox/lrifle_small/rubber,
				/obj/item/ammo_magazine/ammobox/lrifle_small,
				/obj/item/ammo_magazine/ammobox/lrifle,
				/obj/item/ammo_magazine/ammobox/lrifle/rubber,
				/obj/item/ammo_magazine/magnum/rubber,
				/obj/item/ammo_magazine/slmagnum,
				/obj/item/ammo_magazine/slkurtz,
				/obj/item/ammo_magazine/slkurtz/rubber,
				/obj/item/ammo_magazine/kurtz,
				/obj/item/ammo_magazine/kurtz/lethal,
				/obj/item/ammo_magazine/ammobox/kurtz/rubber,
				/obj/item/ammo_magazine/ammobox/kurtz/lethal,
				/obj/item/ammo_magazine/ammobox/kurtz,
				/obj/item/ammo_magazine/magnum/rubber,
				/obj/item/ammo_magazine/magnum,
				/obj/item/weapon/cell/medium/high)

/obj/random/ammo_fancy/low_chance
	name = "low chance random random ironhammer ammunition"
	icon_state = "ammo-blue-low"
	spawn_nothing_percentage = 60



/obj/random/ammo/shotgun
	name = "random shotgun ammunition"
	icon_state = "ammo-orange"

/obj/random/ammo/shotgun/item_to_spawn()
	return pickweight(list(
				/obj/item/weapon/storage/box/shotgunammo/beanbags = 4,
				/obj/item/weapon/storage/box/shotgunammo/slug = 2,
				/obj/item/weapon/storage/box/shotgunammo/stunshells = 1,
				/obj/item/weapon/storage/box/shotgunammo/buckshot = 3))

/obj/random/ammo/shotgun/low_chance
	name = "low chance random shotgun ammunition"
	icon_state = "ammo-orange-low"
	spawn_nothing_percentage = 60

/obj/random/ammo_lowcost
	name = "random low tier ammunition"
	icon_state = "ammo-grey"

/obj/random/ammo_lowcost/item_to_spawn()
	return pickweight(list(/obj/item/weapon/storage/box/shotgunammo/beanbags = 4,
				/obj/item/weapon/storage/box/shotgunammo = 2,
				/obj/item/weapon/storage/box/shotgunammo/slug = 1,
				/obj/item/ammo_magazine/ammobox/pistol = 1,
				/obj/item/ammo_magazine/ammobox/pistol/rubber = 6,
				/obj/item/ammo_magazine/hpistol = 2,
				/obj/item/ammo_magazine/hpistol/rubber = 4,
				/obj/item/ammo_magazine/hpistol/practice = 1,
				/obj/item/ammo_magazine/pistol = 3,
				/obj/item/ammo_magazine/pistol/rubber = 4,
				/obj/item/ammo_magazine/pistol/practice = 1,
				/obj/item/weapon/cell/medium = 1))

/obj/random/ammo_lowcost/low_chance
	name = "low chance random low tier ammunition"
	icon_state = "ammo-grey-low"
	spawn_nothing_percentage = 60
