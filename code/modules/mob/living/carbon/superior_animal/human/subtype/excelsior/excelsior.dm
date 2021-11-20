/mob/living/carbon/superior_animal/human/excelsior
	name = "Excelsior Slave"
	desc = "An excelsior rank and file, often converted unwillingly, making them nothing more than cannon fodder as they fight against the implant controlling them. These ones are too far gone, \
	worn down from years of abuse, death is the only mercy they can have."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "excel_makarov"
	stop_automated_movement_when_pulled = 1
	wander = 0
	maxHealth = 150 //About as much health as a normal person
	health = 150

	armor = list(melee = 60, bullet = 60, energy = 60, bomb = 75, bio = 100, rad = 90) //Legitmently their armor

	//range/ammo stuff
	ranged = 1
	rapid = 1
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/bullet/pistol_35/hv
	projectilesound = 'sound/weapons/guns/fire/pistol_fire.ogg'
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
	meat_amount = 4
	meat_type = /obj/item/reagent_containers/food/snacks/meat/human

	inherent_mutations = list(MUTATION_HEART, MUTATION_LUNG, MUTATION_LIVER, MUTATION_BLOOD_VESSEL, MUTATION_MUSCLES, MUTATION_NERVES)

	drop_items = list(/obj/item/gun/projectile/clarissa/makarov)
	faction = "excelsior"

/mob/living/carbon/superior_animal/human/excelsior/excel_ppsh
	icon_state = "excel_ppsh"
	projectiletype = /obj/item/projectile/bullet/pistol_35/hv
	drop_items = list(/obj/item/gun/projectile/automatic/ppsh)
	projectilesound = 'sound/weapons/guns/fire/grease_fire.ogg'
	rounds_left = 71
	mag_type = /obj/item/ammo_magazine/highcap_pistol_35/drum/empty
	mags_left = 1 //1+1

/mob/living/carbon/superior_animal/human/excelsior/excel_ak
	icon_state = "excel_ak"
	projectiletype = /obj/item/projectile/bullet/rifle_75/hv
	drop_items = list(/obj/item/gun/projectile/automatic/ak47)
	projectilesound = 'sound/weapons/guns/fire/ltrifle_fire.ogg'
	rounds_left = 20
	mag_type = /obj/item/ammo_magazine/rifle_75/empty
	mags_left = 2 //2+1

/mob/living/carbon/superior_animal/human/excelsior/excel_vintorez
	icon_state = "excel_vintorez"
	rapid = 0 //The gun cant rapid fire...
	projectiletype = /obj/item/projectile/bullet/rifle_75/hv
	drop_items = list(/obj/item/gun/projectile/automatic/vintorez)
	projectilesound = 'sound/weapons/guns/fire/ltrifle_fire.ogg'
	rounds_left = 10
	mag_type = /obj/item/ammo_magazine/rifle_75_short/empty
	mags_left = 2 //2+1

/mob/living/carbon/superior_animal/human/excelsior/excel_drozd
	icon_state = "excel_drozd"
	projectiletype = /obj/item/projectile/bullet/pistol_35/hv
	drop_items = list(/obj/item/gun/projectile/automatic/drozd)
	projectilesound = 'sound/weapons/guns/fire/smg_fire.ogg'
	rounds_left = 32
	mag_type = /obj/item/ammo_magazine/smg_35/empty
	mags_left = 2 //2+1

/mob/living/carbon/superior_animal/human/excelsior/death(gibbed, deathmessage = "drops its weapon as it explodes in a shower of gore when their death implant detonates!")
	..()
	new /obj/effect/gibspawner/human(src.loc)
	playsound(src, 'sound/effects/Explosion2.ogg', 75, 1, -3)
	drop_death_loot()
	qdel(src)
	return
