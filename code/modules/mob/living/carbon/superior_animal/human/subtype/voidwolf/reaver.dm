//Reavers, the void wolf elite.
/mob/living/carbon/superior/human/voidwolf/elite
	// basetype, dont use
	name = "Void Reaver Stormtrooper"
	desc = "A void wolf reaver stormtrooper, vatgrown and given bionic enhancements, with far better equipment and decades of experience raiding ships and killing men under the command of a true reaver."
	icon_state = "reaver_lasrak"
	projectilesound = 'sound/weapons/energy/Laser.ogg'
	melee_damage_lower = 20 //We dont like melee
	melee_damage_upper = 25
	ranged = TRUE
	rapid = TRUE
	rapid_fire_shooting_amount = 3
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/beam/voidwolf
	drop_items = list(/obj/item/gun/energy/firestorm/reaver_modded,/obj/random/cloth/assault/reaver)
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 20
	mag_type = /obj/item/cell/medium/high/depleted
	mags_left = 3

	flash_resistances = 20 //no.
	melee_sharp = TRUE //Eswords
	armor_divisor = 3
	armor = list(melee = 15, bullet = 13, energy = 12, bomb = 75, bio = 100, rad = 25) //Legitmently their armor

	fancy_attack_overlay = "voidwolf_gun_melee_flick"
	fancy_attack_shading = "#2975A7" //Sapphire



/mob/living/carbon/superior/human/voidwolf/elite/New()
	..()
	reload_message = "[name] ejects a depleted cell and rapidly reloads a new one!"

/mob/living/carbon/superior/human/voidwolf/elite/Initialize()

	allowed_stat_modifiers[/datum/stat_modifier/mob/living/carbon/superior/aggressive/savage] += 10 //10% extra chance to be a glass cannon

	. = ..()

/mob/living/carbon/superior/human/voidwolf/elite/laserak
	projectiletype = /obj/item/projectile/beam/weak/ap/reaver
	drop_items = list(/obj/item/gun/energy/firestorm/reaver_modded,/obj/random/cloth/assault/reaver)

	mag_type = /obj/item/cell/medium/high/depleted
	mags_left = 3

	rapid_fire_shooting_amount = 5 //we're using the burst 5 mode
	delay_for_rapid_range = 0.22 SECONDS
	melee_sharp = FALSE
	armor_divisor = 1

/obj/item/gun/energy/firestorm/reaver_modded

	initialized_upgrades = list(/obj/item/gun_upgrade/trigger/dangerzone,
								/obj/item/tool_upgrade/refinement/laserguide,
								/obj/item/tool_upgrade/productivity/ergonomic_grip,
								/obj/item/gun_upgrade/barrel/bore,
								/obj/item/tool_upgrade/refinement/stabilized_grip, // max is 5
								)

/mob/living/carbon/superior/human/voidwolf/elite/c20r
	icon_state = "reaver_bulldog"
	projectilesound = 'sound/weapons/guns/fire/smg_fire.ogg'
	projectiletype = /obj/item/projectile/bullet/pistol_35
	drop_items = list(/obj/item/gun/projectile/automatic/c20r/reaver_modded)

	rapid_fire_shooting_amount = 8 // WE FIRE REALLY GODDAMN FAST
	delay_for_rapid_range = 0.15 SECONDS
	rounds_left = 32
	mag_type = /obj/item/ammo_magazine/smg_35/empty
	mags_left = 6 //since we fire. FAST

	casingtype = /obj/item/ammo_casing/pistol_35/spent
	melee_sharp = FALSE
	armor_divisor = 1

/mob/living/carbon/superior/human/voidwolf/elite/c20r/mob_reload()
	..()
	var/mob/living/targetted_mob = (target_mob?.resolve())
	if(targetted_mob)
		var/armor = targetted_mob.getarmor(null, "bullet")
		if(armor)
			armor /= 0.6 //this is are sorta default
		if(armor >= 7) //Bullet proof armor is typically like this
			projectiletype = /obj/item/projectile/bullet/pistol_35/hv
			casingtype = /obj/item/ammo_casing/pistol_35/spent/hv
			visible_message(SPAN_DANGER("<b>[src]</b> loads in a HV magazine!"))
			return
		if(armor < 3)
			projectiletype = /obj/item/projectile/bullet/pistol_35/lethal
			casingtype = /obj/item/ammo_casing/pistol_35/spent/lethal
			visible_message(SPAN_DANGER("<b>[src]</b> loads in a HP magazine!"))
			return
		projectiletype = /obj/item/projectile/bullet/pistol_35
		casingtype = /obj/item/ammo_casing/pistol_35/spent


/obj/item/gun/projectile/automatic/c20r/reaver_modded

	initialized_upgrades = list(/obj/item/gun_upgrade/trigger/dangerzone,
								/obj/item/tool_upgrade/refinement/laserguide,
								/obj/item/tool_upgrade/productivity/ergonomic_grip,
								/obj/item/tool_upgrade/refinement/stabilized_grip,
								/obj/item/gun_upgrade/barrel/forged,
								)

/mob/living/carbon/superior/human/voidwolf/elite/c20r/New()
	..()
	reload_message = "[name] rapidly reloads before the empty mag hits the ground!"

/mob/living/carbon/superior/human/voidwolf/elite/c20r/emp_act(severity)
	return
/*
/mob/living/carbon/superior/human/voidwolf/elite/gyrojet
	icon_state = "reaver_gyro"
	projectilesound = 'sound/weapons/guns/fire/ubgl_fire.ogg'
	projectiletype = /obj/item/projectile/bullet/gyro
	drop_items = list(/obj/random/cloth/assault/reaver/*,obj/item/gun/projectile/gyropistol*/)
	rapid = FALSE
	rounds_left = 4
	mag_type = /obj/item/ammo_magazine/a75/empty
	mags_left = 0 //no spare mags, they are lethal

	get_stat_modifier = FALSE

casingtype = /obj/item/ammo_casing/a75/spent
	melee_sharp = FALSE
	armor_divisor = 1

/mob/living/carbon/superior/human/voidwolf/elite/gyrojet/New()
	..()
	reload_message = "[name] rapidly reloads before the empty mag hits the ground!"// You should be panicing

/mob/living/carbon/superior/human/voidwolf/elite/gyrojet/emp_act(severity)
	return
*/
/mob/living/carbon/superior/human/voidwolf/elite/myrmidon
	icon_state = "reaver_melee"
	melee_damage_lower = 35
	melee_damage_upper = 40
	ranged = FALSE
	rapid = FALSE
	limited_ammo = FALSE
	drop_items = list(/obj/item/tool/sword/saber/cutlass, /obj/item/shield/buckler/energy/reaver/damaged,/obj/random/cloth/assault/reaver)

	melee_sharp = TRUE //Eswords
	armor_divisor = 3
	var/block_chance = 65
	move_and_attack = TRUE
	fancy_attack_overlay = "voidwolf_slash_flick"
	fancy_attack_shading = "#9b111e" //Ruby

/mob/living/carbon/superior/human/voidwolf/elite/myrmidon/New()
	..()
	reload_message = "[name] rapidly reloads?!"

/mob/living/carbon/superior/human/voidwolf/elite/myrmidon/emp_act(severity)
	return

/mob/living/carbon/superior/human/voidwolf/elite/myrmidon/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(prob(block_chance) || moved)
		moved = FALSE
		visible_message("\red \b [src] blocks the [O]!")
		return
	..()

/mob/living/carbon/superior/human/voidwolf/elite/myrmidon/bullet_act(var/obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(block_chance))
		..()
	else if (!(Proj.testing))
		visible_message("\red <B>[src] blocks [Proj] with its shield!</B>")
	return TRUE

/mob/living/carbon/superior/human/voidwolf/elite/captain
	name = "Void Reaver Captain"
	desc = "A void wolf reaver captain, vatgrown and given bionic enhancements, with far better equipment and decades of experience raiding ships and killing men under the command of a true reaver."
	icon_state = "reaver_cap_elite"
	melee_damage_lower = 35
	melee_damage_upper = 40
	drop_items = list(/obj/item/trash/material/e_sword_cutlass, /obj/item/gun/energy/gun, /obj/random/cloth/assault/reaver)

	projectiletype = /obj/item/projectile/beam/voidwolf
	melee_sharp = TRUE //Eswords
	armor_divisor = 3
	var/block_chance = 65
	move_and_attack = TRUE

	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 8
	mag_type = /obj/item/cell/small/high/depleted
	mags_left = 1

/mob/living/carbon/superior/human/voidwolf/elite/captain/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(prob(block_chance) || moved)
		moved = FALSE
		visible_message("\red \b [src] evades the [O]!")
		flick("reaver_cap_elite_evade",src)
		return
	..()

/mob/living/carbon/superior/human/voidwolf/elite/captain/bullet_act(var/obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(block_chance))
		..()
	else if (!(Proj.testing))
		visible_message("\red <B>[src] evades [Proj]!</B>")
		flick("reaver_cap_elite_evade",src)
	return TRUE

/mob/living/carbon/superior/human/voidwolf/elite/captain/Initialize()
	..()
	icon_state = "reaver_cap_elite"


/mob/living/carbon/superior/human/voidwolf/elite/Initialize()
	..()
	if(prob(50))
		icon_state = "[icon_state]_elite"

/mob/living/carbon/superior/human/voidwolf/elite/death(gibbed, deathmessage = "drops its weapon as it explodes in a shower of gore when their death implant detonates!")
	..()
	new /obj/effect/gibspawner/human(src.loc)
	playsound(src, 'sound/effects/Explosion2.ogg', 75, 1, -3)
	drop_death_loot()
	qdel(src)
	return
