
/*
Abdicator
A powerful gun that is guild crafted only, and for a reason!
This CQC powerhouse is master of running upto mobs and people alike to point blank unload them.
Adding this to natural spawns would ruin its many balancing facters on being hard to craft well also powerful!
It also has more matterals then it takes to craft as a way to have a sunk cost.
*/

/obj/item/gun/energy/abdicator
	name = "\"Abdicator\" energy shotgun"
	icon = 'icons/obj/guns/energy/abdication.dmi'
	icon_state = "abdication"
	item_state = null
	item_charge_meter = TRUE
	desc = "A shotgun that epitomizes the truth that the tallest of buildings and grandest achievments are built by digging the deepest into the earth, \
	fires superheated-shot in a crimson splutter, as the Reductor rail rifle. \
	This Artificier craft is said to have been conceived originally by Soteria, opted into cooperation with the guild so that it might actually see regular use, in the practised hands of any guild adept. There is no adoption without loss."
	fire_sound = 'sound/weapons/emitter2.ogg'
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun/energy
	can_dual = FALSE
	w_class = ITEM_SIZE_HUGE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 8, MATERIAL_PLASTIC = 10, MATERIAL_URANIUM = 1, MATERIAL_PLASMAGLASS = 1, MATERIAL_WOOD = 8)
	fire_delay = 20
	charge_cost = 150
	recoil_buildup = 12 //Big blast of heated shot, got some recoil to it.
	damage_multiplier = 1 //already quite a bit lethal and dangerous with the burn damage and 'close range spray'.
	gun_tags = list(GUN_PROJECTILE, GUN_LASER, GUN_ENERGY, GUN_SCOPE) //essentially a scattershot reductor.

	proj_step_multiplier = 0.5 //2x bullet speed, mostly for flares so they dont crawl

	max_upgrades = 6 //Has 1 more mod slot

	init_firemodes = list(
		list(mode_name="laser pellets", mode_desc="fires a spred of tiney lasers", projectile_type=/obj/item/projectile/bullet/pellet/shotgun/energy, icon="kill"),
		list(mode_name="flare shell", mode_desc="fires a randomized concoction of chemicals to produce light", projectile_type=/obj/item/projectile/bullet/flare/choas, charge_cost=100, icon="grenade")
	)

	twohanded = TRUE

