/mob/living/simple_animal/hostile/syndicate
	name = "\improper Mercenary operative"
	desc = "A vat grown mercenary working for some cladestine group."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "syndicate"
	icon_dead = "syndicate_dead" //TODO: That icon doesn't exist
	icon_gib = "syndicate_gib"
	speak_chance = 5
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 4
	move_to_delay = 1
	turns_per_move = 1
	stop_automated_movement_when_pulled = 0
	maxHealth = 150
	health = 150
	vision_range = 12
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 10
	attacktext = "punched"
	a_intent = I_HURT
	var/weapon1
	var/weapon2
	min_oxy = 5
	max_oxy = 0
	min_tox = 0
	max_tox = 1
	min_co2 = 0
	max_co2 = 5
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 15
	environment_smash = 1
	faction = "syndicate"
	status_flags = CANPUSH
	leather_amount = 0
	bones_amount = 0

/mob/living/simple_animal/hostile/syndicate/death(gibbed, deathmessage = "drops its weapon as it explodes in a shower of gore when their death implant detonates!")
	..()
	new /obj/effect/gibspawner/human(src.loc)
	playsound(src, 'sound/effects/Explosion2.ogg', 75, 1, -3)
	if(weapon1)
		new weapon1(src.loc)
	if(weapon2)
		new weapon2(src.loc)
	qdel(src)
	return

///////////////Sword and shield////////////
/mob/living/simple_animal/hostile/syndicate/melee
	melee_damage_lower = 20
	melee_damage_upper = 25
	maxHealth = 250 //Boosted because melee given armor/shield
	health = 250
	icon_state = "syndicatemelee"
	weapon1 = /obj/item/melee/energy/sword/red
	weapon2 = /obj/item/shield/buckler/energy
	attacktext = "slashed"
	status_flags = 0
	armor = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0,
		agony = 1000 //Pain damage proof, and rubber proof.
	)

/mob/living/simple_animal/hostile/syndicate/melee/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(prob(65))
		visible_message("\red \b [src] blocks the [O]! ")
		return
	..()

/mob/living/simple_animal/hostile/syndicate/melee/bullet_act(var/obj/item/projectile/Proj)
	if(!Proj)	return
	if(prob(65))
		..()
	else
		visible_message("\red <B>[src] blocks [Proj] with its shield!</B>")
	return 0

/mob/living/simple_animal/hostile/syndicate/melee/space
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	icon_state = "syndicatemeleespace"
	name = "Mercenary Commando"
	speed = 0

/mob/living/simple_animal/hostile/syndicate/melee/space/allow_spacemove()
	return ..()

/mob/living/simple_animal/hostile/syndicate/ranged
	ranged = 1
	rapid = 1
	icon_state = "syndicateranged"
	projectilesound = 'sound/weapons/Gunshot_light.ogg'
	projectiletype = /obj/item/projectile/bullet/pistol_35

	weapon1 = /obj/item/gun/projectile/automatic/c20r

/mob/living/simple_animal/hostile/syndicate/ranged/space
	icon_state = "syndicaterangedpsace"
	name = "Mercenary Commando"
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	speed = 0

/mob/living/simple_animal/hostile/syndicate/ranged/space/allow_spacemove()
	return ..()


//variants

//melee
/mob/living/simple_animal/hostile/syndicate/melee/weak
	icon_state = "syndicate_knife"
	melee_damage_lower = 7
	melee_damage_upper = 15
	maxHealth = 100
	health = 100
	weapon1 = /obj/item/tool/knife/tacknife

/mob/living/simple_animal/hostile/syndicate/melee/heavy
	name = "\improper Mercenary heavy"
	icon_state = "syndicate_sword"
	melee_damage_lower = 25
	melee_damage_upper = 30
	maxHealth = 300 //Boosted because melee given armor/shield
	health = 300

//range
/mob/living/simple_animal/hostile/syndicate/ranged/weak
	ranged_cooldown = 2
	rapid = 0
	icon_state = "syndicate_pistol"
	weapon1 = /obj/item/gun/projectile/clarissa/makarov

/mob/living/simple_animal/hostile/syndicate/ranged/heavy
	ranged_cooldown = 3
	icon_state = "syndicate_smg"
	maxHealth = 200 //Boosted because melee given armor/shield
	health = 200

/mob/living/simple_animal/hostile/syndicate/ranged/heavy/shotgun
	ranged_cooldown = 4
	rapid = 0
	icon_state = "syndicate_shotgun"
	weapon1 = /obj/item/gun/projectile/shotgun/pump/combat/sawn
	projectilesound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	projectiletype = /obj/item/projectile/bullet/shotgun

//space melee
/mob/living/simple_animal/hostile/syndicate/melee/space/weak
	icon_state = "syndicate_space_knife"
	melee_damage_lower = 7
	melee_damage_upper = 15
	maxHealth = 100
	health = 100
	weapon1 = /obj/item/tool/knife/tacknife

//space range
/mob/living/simple_animal/hostile/syndicate/ranged/space/weak
	ranged_cooldown = 2
	rapid = 0
	icon_state = "syndicate_space_pistol"
	weapon1 = /obj/item/gun/projectile/clarissa/makarov

/mob/living/simple_animal/hostile/syndicate/ranged/space/heavy
	ranged_cooldown = 2
	icon_state = "syndicaterangedpsace"
	maxHealth = 200 //Boosted because melee given armor/shield
	health = 200

/mob/living/simple_animal/hostile/syndicate/ranged/space/heavy/shotgun
	ranged_cooldown = 4
	rapid = 0
	icon_state = "syndicate_space_shotgun"
	weapon1 = /obj/item/gun/projectile/shotgun/pump/combat/sawn
	projectilesound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	projectiletype = /obj/item/projectile/bullet/shotgun

//robots
/mob/living/simple_animal/hostile/viscerator
	name = "viscerator"
	desc = "A small, twin-bladed machine capable of inflicting very deadly lacerations."
	icon = 'icons/mob/mobs-monster.dmi'
	icon_state = "viscerator_attack"
	pass_flags = PASSTABLE
	health = 15
	maxHealth = 15
	melee_damage_lower = 15
	melee_damage_upper = 15
	attacktext = "cut"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	faction = "syndicate"
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

/mob/living/simple_animal/hostile/viscerator/death()
	..(null,"is smashed into pieces!")
	qdel(src)

/mob/living/simple_animal/hostile/viscerator/opifex
	name = "opifex viscerator"
	desc = "A small, twin-bladed machine capable of inflicting very deadly lacerations. This one is an opifex model and thus targets non-colony humanoids, animals, and cht'mants."
	faction = "neutral"
	colony_friend = TRUE


/mob/living/simple_animal/hostile/elitemercenary
	name = "\improper Elite operative"
	desc = "A vat grown elite mercenary with bionic enhancements and high quality armor. You feel like you're about to have a bad time."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "syndicate_stormtrooper"
	icon_dead = "syndicate_stormtrooper_dead" //TODO: That icon doesn't exist
	icon_gib = "syndicate_gib"
	speak_chance = 5
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 4
	move_to_delay = 2
	turns_per_move = 1
	stop_automated_movement_when_pulled = 0
	maxHealth = 350
	health = 350
	vision_range = 16
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 10
	attacktext = "punched"
	a_intent = I_HURT
	var/weapon1
	var/weapon2
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	unsuitable_atoms_damage = 0
	environment_smash = 1
	faction = "elitemerc"
	status_flags = 0

/mob/living/simple_animal/hostile/elitemercenary/New()
	..()
	set_light(l_range = 4, l_power = 3)

/mob/living/simple_animal/hostile/elitemercenary/death(gibbed, deathmessage = "drops its weapon as it explodes in a shower of gore when their death implant detonates!")
	..()
	new /obj/effect/gibspawner/human(src.loc)
	playsound(src, 'sound/effects/Explosion1.ogg', 75, 1, -3)
	if(weapon1)
		new weapon1(src.loc)
	if(weapon2)
		new weapon2(src.loc)
	qdel(src)
	return

/mob/living/simple_animal/hostile/elitemercenary/allow_spacemove()
	return ..()

//elite melee
/mob/living/simple_animal/hostile/elitemercenary/melee
	melee_damage_lower = 30
	melee_damage_upper = 35
	maxHealth = 450 //Boosted because melee given armor/shield
	health = 450
	icon_state = "syndicate_stormtrooper_sword"
	weapon1 = /obj/item/melee/energy/sword/red
	weapon2 = /obj/item/shield/buckler/energy
	attacktext = "slashed"

//elite range
/mob/living/simple_animal/hostile/elitemercenary/range
	ranged_cooldown = 3
	ranged = 1
	rapid = 1
	icon_state = "syndicate_stormtrooper_smg"
	projectilesound = 'sound/weapons/Gunshot_light.ogg'
	projectiletype = /obj/item/projectile/bullet/pistol_35
	weapon1 = /obj/item/gun/projectile/automatic/c20r

/mob/living/simple_animal/hostile/elitemercenary/range/gunslinger
	ranged_cooldown = 2
	rapid = 0
	icon_state = "syndicate_stormtrooper_pistol"
	projectilesound = 'sound/weapons/guns/fire/revolver_fire.ogg'
	projectiletype = /obj/item/projectile/bullet/kurtz_50
	weapon1 = /obj/item/gun/projectile/revolver/mateba

/mob/living/simple_animal/hostile/elitemercenary/range/space/heavy/shotgun
	ranged_cooldown = 4
	rapid = 0
	icon_state = "syndicate_stormtrooper_shotgun"
	projectilesound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	projectiletype = /obj/item/projectile/bullet/shotgun
	weapon1 = /obj/item/gun/projectile/shotgun/pump/combat
