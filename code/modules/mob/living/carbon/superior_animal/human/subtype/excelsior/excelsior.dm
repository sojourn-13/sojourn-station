/mob/living/carbon/superior_animal/human/excelsior
	name = "Excelsior Slave"
	desc = "An excelsior rank and file, often converted unwillingly, making them nothing more than cannon fodder as they fight against the implant controlling them. These ones are too far gone, \
	worn down from years of abuse, death is the only mercy they can have."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "excel_makarov"
	stop_automated_movement_when_pulled = 1
	wander = 0
	maxHealth = 100 * EXCELSIOR_HEALTH_MOD
	health = 100 * EXCELSIOR_HEALTH_MOD

	armor = list(melee = 13, bullet = 13, energy = 17, bomb = 80, bio = 90, rad = 25) //Legitmently their armor (melee is higher {45} to account for AI stupidness)

	//range/ammo stuff
	ranged = 1
	rapid = 1
	rapid_fire_shooting_amount = 3
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/bullet/pistol_35
	projectilesound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 16
	mag_type = /obj/item/ammo_magazine/highcap_pistol_35/empty
	mags_left = 2 //2+1

	melee_damage_lower = 10
	melee_damage_upper = 15
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "slashed"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0
//They are all waring suits
	breath_required_type = NONE
	breath_poison_type = NONE
	min_breath_required_type = 0
	min_breath_poison_type = 0

	min_air_pressure = 0
	min_bodytemperature = 0

//Drops
	meat_amount = 1
	meat_type = /obj/item/reagent_containers/food/snacks/meat/human

	inherent_mutations = list(MUTATION_HEART, MUTATION_LUNG, MUTATION_LIVER, MUTATION_BLOOD_VESSEL, MUTATION_MUSCLES, MUTATION_NERVES)

	drop_items = list(/obj/item/gun/projectile/makarov)
	faction = "excelsior"

/mob/living/carbon/superior_animal/human/excelsior/handle_breath(datum/gas_mixture/breath) //we have are own air supplies
	return

/mob/living/carbon/superior_animal/human/excelsior/handle_environment(var/datum/gas_mixture/environment) //are armor legit is a void suit
	return

/mob/living/carbon/superior_animal/human/excelsior/start_pulling(var/atom/movable/AM)
	to_chat(src, SPAN_WARNING("Your hand gets pushed away from \the [src]. !"))
	return

/mob/living/carbon/superior_animal/human/excelsior/excel_ppsh
	icon_state = "excel_ppsh"
	projectiletype = /obj/item/projectile/bullet/pistol_35
	drop_items = list(/obj/item/gun/projectile/automatic/ppsh)
	projectilesound = 'sound/weapons/guns/fire/grease_fire.ogg'
	rounds_left = 71
	mag_type = /obj/item/ammo_magazine/highcap_pistol_35/drum/empty
	mags_left = 2 //2+1

/mob/living/carbon/superior_animal/human/excelsior/excel_ak
	icon_state = "excel_ak"
	projectiletype = /obj/item/projectile/bullet/rifle_75
	drop_items = list(/obj/item/gun/projectile/automatic/ak47)
	projectilesound = 'sound/weapons/guns/fire/ltrifle_fire.ogg'
	rounds_left = 20
	mag_type = /obj/item/ammo_magazine/rifle_75/empty
	mags_left = 2 //2+1

/mob/living/carbon/superior_animal/human/excelsior/excel_vintorez
	icon_state = "excel_vintorez"
	rapid = 0 //The gun cant rapid fire...
	projectiletype = /obj/item/projectile/bullet/rifle_75
	drop_items = list(/obj/item/gun/projectile/automatic/vintorez)
	projectilesound = 'sound/weapons/guns/fire/ltrifle_fire.ogg'
	rounds_left = 10
	mag_type = /obj/item/ammo_magazine/rifle_75_short/empty
	mags_left = 2 //2+1

/mob/living/carbon/superior_animal/human/excelsior/excel_drozd
	icon_state = "excel_drozd"
	projectiletype = /obj/item/projectile/bullet/magnum_40
	drop_items = list(/obj/item/gun/projectile/automatic/drozd)
	projectilesound = 'sound/weapons/guns/fire/smg_fire.ogg'
	rounds_left = 32
	mag_type = /obj/item/ammo_magazine/smg_magnum_40/empty
	mags_left = 2 //2+1

/mob/living/carbon/superior_animal/human/excelsior/death(gibbed, deathmessage = "drops its weapon as it explodes in a shower of gore when their death implant detonates!")
	..()
	new /obj/effect/gibspawner/human(src.loc)
	playsound(src, 'sound/effects/Explosion2.ogg', 75, 1, -3)
	drop_death_loot()
	qdel(src)
	return

/mob/living/carbon/superior_animal/human/excelsior/excel_hammer_shield
	icon_state = "excel_hammer_shield"
	maxHealth = 150 * EXCELSIOR_HEALTH_MOD //More hp do to shield
	health = 150 * EXCELSIOR_HEALTH_MOD

	melee_damage_lower = 33
	melee_damage_upper = 40
	armor_divisor = ARMOR_PEN_DEEP

	ranged = 0
	rapid = 0
	//Baseline armor + a littlebit of armor from the shield they hold
	armor = list(melee = 16, bullet = 15, energy = 18, bomb = 85, bio = 100, rad = 25)
	//Atm snowflake code for these 2 mobs to not bloat the parrent anymore
	var/block_chance = 50
	var/give_cooldown_odds = 60
	var/give_cooldown_amount = DEFAULT_ATTACK_COOLDOWN
	var/stunning = FALSE

	drop_items = list(/obj/item/shield/buckler/excelsior, /obj/item/tool/hammer/excelsior_hammer)

/mob/living/carbon/superior_animal/human/excelsior/excel_hammer_shield/batton
	icon_state = "excel_batton_shield"
	give_cooldown_odds = 80
	give_cooldown_amount = 12 //DEFAULT_ATTACK_COOLDOWN is 8 so this is 50% longer
	melee_damage_lower = 15
	melee_damage_upper = 20
	stunning = TRUE

	drop_items = list(/obj/item/shield/buckler/excelsior, /obj/item/tool/baton/excelbaton)


/mob/living/carbon/superior_animal/human/excelsior/excel_hammer_shield/UnarmedAttack(atom/A, proximity)
	. = ..()
	if(!.)
		return

	if(isliving(A))
		var/mob/living/L = A
		if(prob(give_cooldown_odds))
			L.visible_message(SPAN_DANGER("\the [src] stunts \the [L]!"))
			L.setClickCooldown(give_cooldown_amount) //Dont melee these guys!
		if(stunning)
			L.visible_message(SPAN_DANGER("\the [src] zaps \the [L]!"))
			L.damage_through_armor(rand(melee_damage_lower,melee_damage_upper), HALLOSS, BP_CHEST, ARMOR_MELEE, used_weapon = src)

/mob/living/carbon/superior_animal/human/excelsior/excel_hammer_shield/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(prob(block_chance))
		visible_message("\red \b [src] blocks the [O]!")
		return
	..()

/mob/living/carbon/superior_animal/human/excelsior/excel_hammer_shield/bullet_act(var/obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(block_chance))
		..()
	else if (!(Proj.testing))
		visible_message("\red <B>[src] blocks [Proj] with its shield!</B>")
	return TRUE

