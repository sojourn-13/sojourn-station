
/*
 * Contains
 * /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/scattershot
 * /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/scattershot/flak
 * /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/lmg
 * /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/lmg/scrap
 * /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/flare
 * /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/explosive
 * /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/flashbang
 */

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic
	name = "general ballisic weapon"
	var/projectile_energy_cost
	range = MECHA_MELEE | MECHA_RANGED
	var/max_ammo = 0// How much ammo can we cram into this gun?
	var/ammo_type = null //Use defines PLEASE
	var/loaded = FALSE //do we spawn fully loaded?
	fire_volume = 100

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/get_equip_info()
		return "[..()]\[[src.projectiles]\]"

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>Ammo left: [projectiles]</span>")
	to_chat(user, "<span class='info'>Ammo type: [ammo_type]</span>")

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/attackby(obj/item/I, mob/user)
	..()
	if (istype(I, /obj/item/mech_ammo_box))
		var/obj/item/mech_ammo_box/FMJ = I //Full metal jecket
		while(1)
			if(ammo_type != src.ammo_type)
				to_chat(user, SPAN_WARNING("Wrong ammo type!"))
				return 0
			if(FMJ.ammo_amount_left <= 0)
				to_chat(user, SPAN_WARNING("The box is out of ammo."))
				return 0
			if(src.max_ammo <= src.projectiles)
				to_chat(user, SPAN_WARNING("The [src] is full."))
				return 0
			FMJ.ammo_amount_left -= FMJ.amount_per_click
			src.projectiles += FMJ.amount_per_click
			return 1

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/New() //Freshly made ones are not loaded
	..()
	if(loaded)
		return
	projectiles = 0

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/Initialize() //On load we give random ammo
	..()
	if(loaded)
		return
	projectiles = clamp(-1, rand(0,max_ammo), max_ammo+1)

//////////////
/// GHETTO ///
//////////////

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/cannon
	name = "\improper Ancient Autocannon \"Mule\""
	desc = "One of the first versions of what would become autocannon/5, unreliable, constantly jamming and produces more heat than even it's automatic successor. But hey at least it's something that can still blow people away."
	icon_state = "mecha_makeshift_cannon"
	equip_cooldown = 20
	projectile = /obj/item/projectile/bullet/auto_460/scrap
	ammo_type = CAL_MECH_AUTOCANNON
	fire_sound = 'sound/mecha/weapons/autocannon.ogg'
	projectiles = 20
	max_ammo = 20
	projectiles_per_shot = 1 //20 Shots
	deviation = 3
	fire_cooldown = 5
	required_type = list(/obj/mecha/combat, /obj/mecha/working)

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/cannon/loaded
	loaded = TRUE

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/hmg
	name = "\improper 25mm Heavy Machinegun \"Lynx\""
	desc = "An ancient weapon once used to be mounted on cars as a squad support weapon now relic of it's time still fully capable of riddling anything moving with salvo of bullets."
	icon_state = "mecha_makeshift_uac2"
	equip_cooldown = 20
	projectile = /obj/item/projectile/bullet/pistol_35/scrap
	ammo_type = CAL_MECH_MACHINEGUN
	fire_sound = 'sound/mecha/weapons/hmg.ogg'
	projectiles = 100
	max_ammo = 100
	projectiles_per_shot = 5
	deviation = 10 //heavy deviation, its cheap casing rattles with each shot
	fire_cooldown = 3
	required_type = list(/obj/mecha/combat, /obj/mecha/working, /obj/mecha/working)

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/hmg/loaded
	loaded = TRUE

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/flak
	name = "\improper Flak Cannon \"Hippopotamus\""
	desc = "A predecesor to LB-X series used on anything from cars to airplanes and as point-defence on spacecraft. Offers reliability compared to it's successor as it's not likely it will jam."
	icon_state = "mecha_makeshift_scatter"
	equip_cooldown = 25 //fairly slow firing, but utterly devastating against the unarmored.
	projectile = /obj/item/projectile/bullet/pellet/shotgun/flak
	ammo_type = CAL_MECH_SHOTGUN
	fire_sound = 'sound/mecha/weapons/lbx.ogg'
	projectiles = 10
	max_ammo = 10
	projectiles_per_shot = 1
	fire_cooldown = 2 // we fire a huge burst of pellets all over the place!
	deviation = 15 //emphasis on ALL OVER the place
	required_type = list(/obj/mecha/combat, /obj/mecha/working, /obj/mecha/working)
	price_tag = 700

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/flak/loaded
	loaded = TRUE

//////////////////////
/// MILITARY GRADE ///
//////////////////////

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/cannon/military
	name = "\improper Autocannon \"Soaring Eagle\""
	desc = "A counterfeit autocannon/5 made probably off stolen blueprints as a consequence of industrial sabotage, it's almost as good as the real thing, shredding anyone anything with it's mighty bullets."
	icon_state = "mecha_cannon"
	equip_cooldown = 25
	matter = list(MATERIAL_STEEL = 25, MATERIAL_PLASTEEL = 15)
	projectile = /obj/item/projectile/bullet/auto_460
	projectiles = 30
	max_ammo = 30
	projectiles_per_shot = 1 //30 shots
	deviation = 2
	fire_cooldown = 4

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/cannon/military/loaded
	loaded = TRUE

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/ultracannon
	name = "\improper Ultra Autocannon \"Prowling Cougar\""
	desc = "A counterfeit ultra autocannon/2 even somehow less reliable than the actual thing, jamming and screeching as it tries to fire. If it does function how it's supposed to however it's a deadly tool in hands of a skilled pilot."
	icon_state = "mecha_uac2"
	equip_cooldown = 10
	matter = list(MATERIAL_STEEL = 25, MATERIAL_PLASTEEL = 15)
	projectile = /obj/item/projectile/bullet/rifle_75
	ammo_type = CAL_MECH_ULTRACANNON
	fire_sound = 'sound/mecha/weapons/ultracannon.ogg'
	projectiles = 300
	max_ammo = 300
	projectiles_per_shot = 3
	deviation = 5 //little bit innacurate, but still able to consistently lay down fire on targets
	fire_cooldown = 1.75

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/ultracannon/loaded
	loaded = TRUE

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/scattershot
	name = "\improper LB-X Autocannon \"Roaring Lion\""
	desc = "A modified autocannon/5 made for purpose of launching clustershots instead of precision shots. Quite lethal to most opponents despite having same jamming issues as ultra variant."
	icon_state = "mecha_scatter"
	equip_cooldown = 25 // we fire fairly slow, but do a LOT of damage up close.
	matter = list(MATERIAL_STEEL = 25, MATERIAL_PLASTEEL = 15)
	projectile = /obj/item/projectile/bullet/pellet/shotgun/scattershot //snoflaek projectile. works similarly to regular shotgun rounds with 2 more pellets and 2 more damage per pellet
	ammo_type = CAL_MECH_SHOTGUN
	fire_sound = 'sound/mecha/weapons/lbx.ogg'
	projectiles = 40
	max_ammo = 40
	projectiles_per_shot = 1 //each 'projectile' carries 8 pellets
	fire_cooldown = 1
	deviation = 8 //kinda innacurate, but a horribly deudly firearm none the less.


/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/scattershot/loaded
	loaded = TRUE


