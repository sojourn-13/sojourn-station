
/*
Abdicator
A powerful gun that is guild crafted only, and for a reason!
This CQC powerhouse is master of running upto mobs and people alike to point blank unload them.
Adding this to natural spawns would ruin its many balancing facters on being hard to craft well also powerful!
It also has more matterals then it takes to craft as a way to have a sunk cost.
*/

/obj/item/gun/energy/laser/railgun/abdicator
	name = "\"Abdicator\" energy shotgun"
	icon = 'icons/obj/guns/energy/abdication.dmi'
	icon_state = "abdication"
	item_state = null
	item_charge_meter = TRUE
	desc = "An energy shotgun that proves the oldest truth that the tallest buildings and most grand achievements are built by digging a deep foundation to set it upon. \
	It fires a super heated blast of concentrated laser pellets in a similar fashion to the Reductor, but loses stopping power rapidly over a distance, so it is most effective at point blank range. \
	Unlike the Reductor or Myrmidon, the secondary firing mode uses a chemical blend to fire flare rounds, offering some utility. When overclock, the battery is turned into a rocket propelled grenade, \
	use with caution. This design was originally blue-printed by the Soteria before cooperation with the Guild allowed for it to see regular use in the hands of an experienced guild adept."
	fire_sound = 'sound/weapons/energy/emitter2.ogg'
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun/energy
	can_dual = FALSE
	w_class = ITEM_SIZE_HUGE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 8, MATERIAL_PLASTIC = 10, MATERIAL_URANIUM = 1, MATERIAL_PLASMAGLASS = 1, MATERIAL_WOOD = 8)
	origin_tech = list(TECH_COMBAT = 6, TECH_MAGNET = 8, TECH_ENGINEERING = 8) //With how hard it is to make? High value.
	fire_delay = 20
	charge_cost = 150
	init_recoil = CARBINE_RECOIL(1)
	damage_multiplier = 1 //already quite a bit lethal and dangerous with the burn damage and 'close range spray'.
	blacklist_upgrades = list(/obj/item/gun_upgrade/mechanism/greyson_master_catalyst = TRUE)
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE) //essentially a scattershot reductor.

	proj_step_multiplier = 0.5 //2x bullet speed, mostly for flares so they dont crawl

	max_upgrades = 6 //Has 1 more mod slot

	init_firemodes = list(
		list(mode_name="laser pellets", mode_desc="fires a shower of spreading lasers", projectile_type=/obj/item/projectile/bullet/pellet/shotgun/energy, icon="kill"),
		list(mode_name="flare shell", mode_desc="fires an illuminating flare of variable colors", projectile_type=/obj/item/projectile/bullet/flare/choas, charge_cost=100, icon="grenade"),
		list(mode_name="grenade", mode_desc="fires an explosive synth-shell", projectile_type=/obj/item/projectile/bullet/rocket/railgun, charge_cost=30000, icon="grenade")
	)
	consume_cell = FALSE
	twohanded = TRUE
	serial_type = "AG"

/obj/item/gun/energy/laser/railgun/abdicator/consume_next_projectile()
	if(!cell) return null
	if(!ispath(projectile_type)) return null
	if(consume_cell && !cell.checked_use(charge_cost))
		visible_message(SPAN_WARNING("\The [cell] of \the [src] burns out!"))
		qdel(cell)
		cell = null
		playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)
		new /obj/effect/decal/cleanable/ash(get_turf(src))
		return new projectile_type(src)
	else if(!consume_cell && !cell.checked_use(charge_cost))
		return null
	else
		return new projectile_type(src)