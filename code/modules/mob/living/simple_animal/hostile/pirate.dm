//Void Wolfs are VERY wip. They're set up as basic enemies with the sprites.

/*Melee Void Wolfs*/
/mob/living/simple_animal/hostile/voidwolf
	name = "Void Wolf Commando"
	desc = "A Void Wolf mercenary wielding an energy blade and riot shield."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "voidwolf_melee"
	icon_dead = "voidwolf_melee_dead"
	speak_chance = 5
	turns_per_move = 5
	response_help = "pushes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 4
	stop_automated_movement_when_pulled = 0
	maxHealth = 200
	health = 200
	vision_range = 12
	harm_intent_damage = 5
	melee_damage_lower = 30
	melee_damage_upper = 30
	attacktext = "slashed"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 0
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0

//Drops
	meat_amount = 4
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/human

	var/weapon1 = /obj/item/weapon/melee/energy/sword/pirate
	var/weapon2 = /obj/item/weapon/shield/riot
	faction = "pirate"


/mob/living/simple_animal/hostile/voidwolf/death()
	..()
	if(weapon1)
		new weapon1 (src.loc)
		weapon1 = null
	if(weapon2)
		new weapon2 (src.loc)
		weapon2 = null

/mob/living/simple_animal/hostile/voidwolf/emp_act(severity)
	..()
	if(rapid)
		rapid = FALSE
	if(prob(95) && ranged)
		ranged = FALSE


/mob/living/simple_animal/hostile/voidwolf/fieldtech
	name = "Void Wolf Field Tech"
	desc = "A Void Wolf mercenary wielding an industrial welder."
	melee_damage_lower = 20
	melee_damage_upper = 22
	icon_state = "voidengie"
	icon_dead = "voidengie_dead"
	attacktext = "burnt"
	attack_sound = 'sound/items/Welder.ogg'
	weapon1 = /obj/item/weapon/tool/weldingtool/advanced
	weapon2 = null

/*Ranged Void Wolfs*/
/mob/living/simple_animal/hostile/voidwolf/ranged
	name = "Void Wolf Trooper"
	desc = "A Void Wolf mercenary wielding an energy rifle."
	icon_state = "voidwolf"
	icon_dead = "voidwolf_dead"
	projectilesound = 'sound/weapons/laser.ogg'
	melee_damage_lower = 10 //We dont like melee
	melee_damage_upper = 15
	maxHealth = 100
	health = 100
	ranged = 1
	rapid = 1
	ranged_cooldown = 3
	minimum_distance = 4
	projectiletype = /obj/item/projectile/beam
	weapon1 = /obj/item/weapon/gun/energy/retro
	weapon2 = null

/mob/living/simple_animal/hostile/voidwolf/fieldtech/ranged
	name = "Void Wolf Field Tech"
	desc = "A Void Wolf mercenary wielding an industrial welder and energy pistol."
	icon_state = "voidengie_ranged"
	icon_dead = "voidengie_ranged_dead"
	melee_damage_lower = 20
	melee_damage_upper = 22
	ranged = 1
	rapid = 1
	minimum_distance = 4
	projectiletype = /obj/item/projectile/beam
	projectilesound = 'sound/weapons/laser.ogg'
	weapon2 = /obj/item/weapon/gun/energy/gun/martin

/mob/living/simple_animal/hostile/voidwolf/aerotrooper
	name = "Void Wolf Aerotrooper"
	desc = "A Void Wolf mercenary wielding an energy rifle and jetpack."
	icon_state = "voidwolf_flying"
	icon_dead = "voidwolf_flying_dead"
	melee_damage_lower = 10 //We dont like melee
	melee_damage_upper = 15
	ranged_cooldown = 3
	ranged = 1
	rapid = 1
	minimum_distance = 4
	projectiletype = /obj/item/projectile/beam
	weapon1 = /obj/item/weapon/gun/energy/retro
	weapon2 = null

/mob/living/simple_animal/hostile/voidwolf/captain
	name = "Void Wolf Captain"
	desc = "A Void Wolf field commander wielding an energy sword and Spider Rose combo. "
	icon_state = "voidwolfcap"
	icon_dead = "voidwolfcap_dead"
	melee_damage_lower = 30
	melee_damage_upper = 35
	maxHealth = 200
	health = 200
	ranged_cooldown = 3
	ranged = 1
	rapid = 1
	minimum_distance = 4
	projectiletype = /obj/item/projectile/beam
	weapon1 = /obj/item/weapon/melee/energy/sword/pirate
	weapon2 = /obj/item/weapon/gun/energy/gun

//Reavers, the void wolf elite.
/mob/living/simple_animal/hostile/voidwolf/elite
	name = "Void Reaver Stormtrooper"
	desc = "A void wolf reaver stormtrooper, vatgrown and given bionic enhancements, with far better equipment and decades of experience raiding ships and killing men under the command of a true reaver."
	icon_state = "reaver_lasrak"
	projectilesound = 'sound/weapons/Laser.ogg'
	maxHealth = 250
	health = 250
	melee_damage_lower = 20 //We dont like melee
	melee_damage_upper = 25
	ranged = 1
	rapid = 1
	ranged_cooldown = 3
	minimum_distance = 4
	projectiletype = /obj/item/projectile/beam/weak/smg
	weapon1 = /obj/item/weapon/gun/energy/firestorm
	weapon2 = null

/mob/living/simple_animal/hostile/voidwolf/elite/bullpup
	icon_state = "reaver_bulldog"
	projectilesound = 'sound/weapons/guns/fire/smg_fire.ogg'
	projectiletype = /obj/item/projectile/bullet/light_rifle_257
	weapon1 = /obj/item/weapon/gun/projectile/automatic/bulldog
	weapon2 = null

/mob/living/simple_animal/hostile/voidwolf/elite/bullpup/emp_act(severity)
	return

/mob/living/simple_animal/hostile/voidwolf/elite/gyrojet
	icon_state = "reaver_gyro"
	projectilesound = 'sound/weapons/guns/fire/hpistol_fire.ogg'
	projectiletype = /obj/item/projectile/bullet/gyro
	weapon1 = /obj/item/weapon/gun/projectile/gyropistol
	weapon2 = null
	rapid = 0

/mob/living/simple_animal/hostile/voidwolf/elite/gyrojet/emp_act(severity)
	return

/mob/living/simple_animal/hostile/voidwolf/elite/myrmidon
	icon_state = "reaver_melee"
	melee_damage_lower = 35
	melee_damage_upper = 40
	maxHealth = 350
	health = 350
	ranged = 0
	rapid = 0
	weapon1 = /obj/item/weapon/tool/sword/saber/cutlass
	weapon2 = /obj/item/weapon/shield/energy/reaver
	armor = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0,
		agony = 1000 //Pain damage proof, and rubber proof.
	)

/mob/living/simple_animal/hostile/voidwolf/elite/myrmidon/emp_act(severity)
	return

/mob/living/simple_animal/hostile/voidwolf/elite/myrmidon/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(prob(65))
		visible_message("\red \b [src] blocks the [O]! ")
		return
	..()


/mob/living/simple_animal/hostile/voidwolf/elite/myrmidon/bullet_act(var/obj/item/projectile/Proj)
	if(!Proj)	return
	if(prob(65))
		..()
	else
		visible_message("\red <B>[src] blocks [Proj] with its shield!</B>")
	return 0

/mob/living/simple_animal/hostile/voidwolf/elite/Initialize()
	..()
	if(prob(50))
		icon_state = "[icon_state]_elite"

/mob/living/simple_animal/hostile/voidwolf/elite/death(gibbed, deathmessage = "drops its weapon as it explodes in a shower of gore when their death implant detonates!")
	..()
	new /obj/effect/gibspawner/human(src.loc)
	playsound(src, 'sound/effects/Explosion2.ogg', 75, 1, -3)
	if(weapon1)
		new weapon1(src.loc)
		weapon1 = null
	if(weapon2)
		new weapon2(src.loc)
		weapon2 = null
	qdel(src)
	return
