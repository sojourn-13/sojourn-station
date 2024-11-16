
/*
 * Contains
/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic
/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/cannon
/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/flak
/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/hmg
/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/cannon/military
/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/ultracannon
/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/scattershot
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
	return "[..()]\[[projectiles]\]"

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/examine(mob/user)
	. = ..()
	to_chat(user, "<span class='info'>Ammo left: [projectiles]</span>")
	to_chat(user, "<span class='info'>Ammo type: [ammo_type]</span>")

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/attackby(obj/item/I, mob/user)
	. = ..()
	if(istype(I, /obj/item/mech_ammo_box))
		var/obj/item/mech_ammo_box/FMJ = I //Full metal jecket
		if(FMJ.ammo_type != ammo_type)
			to_chat(user, SPAN_WARNING("Wrong ammo type!"))
			return 0
		if(FMJ.ammo_amount_left <= 0)
			to_chat(user, SPAN_WARNING("[FMJ] is out of ammo."))
			return 0
		if(projectiles >= max_ammo)
			to_chat(user, SPAN_WARNING("[src] is full."))
			return 0
		FMJ.ammo_amount_left -= FMJ.amount_per_click
		projectiles += FMJ.amount_per_click
		return 1

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/New() //Freshly made ones are not loaded
	. = ..()
	if(loaded)
		return
	projectiles = 0

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/Initialize() //On load we give random ammo
	. = ..()
	if(loaded)
		return
	projectiles = clamp(-1, rand(0,max_ammo), max_ammo+1)

//////////////////////////////////////////////////
/// INDUSTRIAL WEAPONS - NON-COMBAT MECHS ONLY ///
//////////////////////////////////////////////////

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/cannon
	name = "\improper Industrial Coilgun \"Mule\""
	desc = "A tool of many miners, salvagers and submariners to deal with hostile fauna wherever they might find themselves at, converted to use autocannon ammo for use in Earth-like conditions. Due to this it's not as potent as it's factory version but way cheaper to maintain."
	icon_state = "mecha_coilgun"
	equip_cooldown = 15 //Fast firing but low ammunition capacity
	projectile = /obj/item/projectile/bullet/mech_coilgun
	ammo_type = CAL_MECH_AUTOCANNON
	fire_sound = 'sound/mecha/weapons/coilgun.ogg'
	projectiles = 20
	max_ammo = 20 //Can reload once and then refit new box
	projectiles_per_shot = 1 //20 Shots
	deviation = 6
	fire_cooldown = 2
	required_type = list(/obj/mecha/working)

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/cannon/loaded
	loaded = TRUE

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/flak
	name = "\improper Flak Cannon \"Ox\""
	desc = "A vessel point defense weapon refitted to be mountable onto a mech, favorite of militias and backwater governments as anti-air armament and riot-buster. Thanks to it's massive recoil stemming from being mounted to much less stable platform it has come to be known as the 'Ox'."
	icon_state = "mecha_makeshift_scatter"
	equip_cooldown = 25 //fairly slow firing, but utterly devastating against the unarmored.
	projectile = /obj/item/projectile/bullet/pellet/mech_flak
	ammo_type = CAL_MECH_SHOTGUN
	fire_sound = 'sound/mecha/weapons/flakcannon.ogg'
	projectiles = 5
	max_ammo = 5 //Can reload six times before having to refit the entire thing (At least that's the idea)
	projectiles_per_shot = 1
	fire_cooldown = 3 // we fire a huge burst of pellets all over the place! / This actually only matters for burst fire so ??????????
	deviation = 10 //emphasis on ALL OVER the place
	required_type = list(/obj/mecha/working)
	price_tag = 700

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/flak/loaded
	loaded = TRUE

/////////////////////////////////////
/// SQUAD SUPPORT WEAPONS - MIXED ///
/////////////////////////////////////
//Workhorse mech weapon, not great not terrible
/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/hmg
	name = "\improper Mech Heavy Machinegun \"Liberator\""
	desc = "A squad support weapon rechambered in 25mm with clasps from the side to be fitted on a mech's arm and to prevent anyone from trying to fire it outside of it."
	icon_state = "mecha_makeshift_uac2"
	equip_cooldown = 20
	projectile = /obj/item/projectile/bullet/mech_machinegun
	ammo_type = CAL_MECH_MACHINEGUN
	fire_sound = 'sound/mecha/weapons/hmg.ogg'
	projectiles = 120
	projectiles_per_shot = 6 // 20 bursts
	max_ammo = 120
	deviation = 10 //heavy deviation, its cheap casing rattles with each shot
	fire_cooldown = 1.2
	required_type = list(/obj/mecha/combat, /obj/mecha/working)

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/hmg/loaded
	loaded = TRUE

//////////////////////////////////////
/// AUTOCANNONS - COMBAT MECH ONLY ///
//////////////////////////////////////

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/cannon/military
	name = "\improper Autocannon \"Valor\""
	desc = "A downsized spaceship autocannon rechambered in 60mm is a true weapon of terror capable of annihilating anything in it's path with deadly precision. This version features a ballistic computer to dampen the recoil."
	icon_state = "mecha_cannon"
	equip_cooldown = 25
	matter = list(MATERIAL_STEEL = 25, MATERIAL_PLASTEEL = 15)

	fire_sound = 'sound/mecha/weapons/autocannon.ogg'
	projectile = /obj/item/projectile/bullet/mech_autocannon
	projectiles = 10
	max_ammo = 10
	projectiles_per_shot = 1

	deviation = 2
	fire_cooldown = 2

	required_type = list(/obj/mecha/combat)

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/cannon/military/loaded
	loaded = TRUE

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/ultracannon
	name = "\improper Burst-Fire Autocannon \"Victory\""
	desc = "An autocannon made with mechs in mind boasting only 30mm as a tradeoff being able to shoot two times in a row reliably without jamming. Due to the smaller caliber it is capable of firing at higher distances than the 60mm version."
	icon_state = "mecha_burstcannon"
	equip_cooldown = 10
	matter = list(MATERIAL_STEEL = 25, MATERIAL_PLASTEEL = 15)
	projectile = /obj/item/projectile/bullet/mech_burstcannon
	ammo_type = CAL_MECH_ULTRACANNON
	fire_sound = 'sound/mecha/weapons/burstautocannon.ogg'
	projectiles = 60
	max_ammo = 60 //20 salvos
	projectiles_per_shot = 2
	deviation = 4 //little bit innacurate, but still able to consistently lay down fire on targets
	fire_cooldown = 1.5
	required_type = list(/obj/mecha/combat)

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/ultracannon/loaded
	loaded = TRUE

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/scattershot
	name = "\improper Scatter-Shot Autocannon \"Liberty\""
	desc = "An anti-air autocannon using flak rounds instead of standard ones but not losing out on any of the precision that it comes with. In contrary to how most flak weapons operate this one concentrates most of it's shots in single place."
	icon_state = "mecha_scatter"
	equip_cooldown = 25 // we fire fairly slow, but do a LOT of damage up close.
	matter = list(MATERIAL_STEEL = 25, MATERIAL_PLASTEEL = 15)
	projectile = /obj/item/projectile/bullet/pellet/mech_flak/military
	ammo_type = CAL_MECH_SHOTGUN
	fire_sound = 'sound/mecha/weapons/scatterautocannon.ogg'
	projectiles = 30
	max_ammo = 30
	projectiles_per_shot = 1 //each 'projectile' carries 8 pellets
	fire_cooldown = 1
	deviation = 6 //kinda innacurate, but a horribly deudly firearm none the less.
	required_type = list(/obj/mecha/combat)

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/scattershot/loaded
	loaded = TRUE


