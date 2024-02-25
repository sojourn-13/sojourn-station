//New zombie mobs, if shit goes to hell do just contact me.

//Ranged types
/mob/living/carbon/superior_animal/human/zombies
    name = "zombie prospector"
    desc = "A husk of one of the many infamous 'Prospectors' of the colony, fallen prey to the hoard."
    icon_state = "zombie_prospector_brown_ak"
    icon_dead = "zombie_prospector_brown_dead"
    melee_damage_lower = 10
    melee_damage_upper = 20
    armor = list(melee = 40, bullet = 30, energy = 30, bomb = 50, bio = 100, rad = 50)
    maxHealth = 150
    health = 150
    melee_damage_lower = 10
    melee_damage_upper = 15
    attacktext = "blasts"
    attack_sound = 'sound/weapons/Gunshot"
    stop_automated_movement_when_pulled = 0
    faction = "zombie"
    colony_friend = FALSE
    friendly_to_colony = FALSE


//Drops
    drop_items = list(/obj/item/grenade/frag, /obj/item/book/manual/fiction/kinglear)


/mob/living/carbon/superior_animal/human/zombies/death()
    ..()
    drop_death_loot()


//Ranged weapon stuff


    rapid_fire_shooting_amount = 5
    projectiletype = /obj/item/projectile/bullet
    limited_ammo = TRUE
    mag_drop = TRUE
    ranged = TRUE
    rapid = TRUE
    rounds_left = 20
    mag_type = /obj/item/ammo_mag/rifle-0
    mags_left = 4




/mob/living/carbon/superior_animal/human/zombies/sword
    icon_state = "zombie_prospector_gray_mac_junksword"
    icon_dead = "zombie_prospector_gray_dead"
    melee_damage_lower = 30
    melee_damage_upper = 35
    ranged_cooldown = 1
    rounds_left = 30
    mag_type = /obj/item/ammo_mag/smg-0
    mags_left = 3
    rapid_fire_shooting_amount = 3
    armor = list(melee = 30, bullet = 25, energy = 25, bomb = 55, bio = 100, rad = 50)
    drop_items = list(/obj/item/ammo_mag/smg-32)



/mob/living/carbon/superior_animal/human/zombies/shieldshottie
    icon_state = "zombie_prospector_heavy_pug_shield"
    icon_dead = "zombie_prospector_heavy_dead"
    rapid = FALSE
    ranged_cooldown = 2
    rounds_left = 12
    mag_type = /obj/item/ammo_mag/m12
    mags_left = 3
    armor = list(melee = 60, bullet = 50, energy = 50, bomb = 60, bio = 100, rad = 50)
    projectiletype = /obj/item/projectile/slug
    maxHealth = 200
    health = 200
    drop_items = list(/obj/item/cigarettes/Dpacket1)

//Melee Type//


/mob/living/carbon/superior_animal/human/zombies/sledge
    icon = 'icons/mob/Zombie_Prospectors.dmi'
    icon_state = "zombie_foreman_sledgehammer"
    icon_dead = "zombie_foreman_dead"
    maxHealth = 300
    health = 300
    ranged = FALSE
    melee_damage_lower = 35
    melee_damage_upper = 45
    attacktext = list("attacked", "bashed", "battered", "bludgeoned", "whacked","flattened","pulped")
    armor = list(melee = 40, bullet = 30, energy = 30, bomb = 50, bio = 100, rad = 50)
    drop_items = list(/obj/item/radio/walkietalkie)
    attack_sound = 'sound/weapons/genhit3"




