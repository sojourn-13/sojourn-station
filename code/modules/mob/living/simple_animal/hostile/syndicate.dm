/mob/living/simple/hostile/syndicate
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
	needs_environment = FALSE
	unsuitable_atoms_damage = 15
	environment_smash = 1
	faction = "syndicate"
	status_flags = CANPUSH
	leather_amount = 0
	bones_amount = 0
	inherent_mutations = list(MUTATION_HEART, MUTATION_LUNG, MUTATION_LIVER, MUTATION_BLOOD_VESSEL, MUTATION_MUSCLES, MUTATION_NERVES)

/mob/living/simple/hostile/syndicate/death(gibbed, deathmessage = "drops its weapon as it explodes in a shower of gore when their death implant detonates!")
	..()
	new /obj/effect/gibspawner/human(src.loc)
	playsound(src, 'sound/effects/Explosion2.ogg', 75, 1, -3)
	drop_death_loot()
	qdel(src)
	return

///////////////Sword and shield////////////
/mob/living/simple/hostile/syndicate/melee
	melee_damage_lower = 20
	melee_damage_upper = 25
	maxHealth = 250 //Boosted because melee given armor/shield
	health = 250
	icon_state = "syndicatemelee"
	drop_items = list(/obj/item/melee/energy/sword/red, /obj/item/shield/buckler/energy)
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

/mob/living/simple/hostile/syndicate/melee/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(prob(65))
		visible_message("\red \b [src] blocks the [O]! ")
		return
	..()

/mob/living/simple/hostile/syndicate/melee/bullet_act(var/obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(65) || ((Proj.testing)))
		..()
	else
		visible_message("\red <B>[src] blocks [Proj] with its shield!</B>")
	return 0

/mob/living/simple/hostile/syndicate/melee/space
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

/mob/living/simple/hostile/syndicate/melee/space/allow_spacemove()
	return ..()

/mob/living/simple/hostile/syndicate/ranged
	ranged = 1
	rapid = 1
	icon_state = "syndicateranged"
	projectilesound = 'sound/weapons/Gunshot_light.ogg'
	projectiletype = /obj/item/projectile/bullet/pistol_35

	drop_items = list(/obj/item/gun/projectile/automatic/c20r)

/mob/living/simple/hostile/syndicate/ranged/space
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

/mob/living/simple/hostile/syndicate/ranged/space/allow_spacemove()
	return ..()


//variants

//melee
/mob/living/simple/hostile/syndicate/melee/weak
	icon_state = "syndicate_knife"
	melee_damage_lower = 7
	melee_damage_upper = 15
	maxHealth = 100
	health = 100
	drop_items = list(/obj/item/tool/knife/tacknife)

/mob/living/simple/hostile/syndicate/melee/heavy
	name = "\improper Mercenary heavy"
	icon_state = "syndicate_sword"
	melee_damage_lower = 25
	melee_damage_upper = 30
	maxHealth = 300 //Boosted because melee given armor/shield
	health = 300

//range
/mob/living/simple/hostile/syndicate/ranged/weak
	ranged_cooldown = 2
	rapid = 0
	icon_state = "syndicate_pistol"
	drop_items = list(/obj/item/gun/projectile/makarov)

/mob/living/simple/hostile/syndicate/ranged/heavy
	ranged_cooldown = 3
	icon_state = "syndicate_smg"
	maxHealth = 200 //Boosted because melee given armor/shield
	health = 200

/mob/living/simple/hostile/syndicate/ranged/heavy/shotgun
	ranged_cooldown = 4
	rapid = 0
	icon_state = "syndicate_shotgun"
	drop_items = list(/obj/item/gun/projectile/shotgun/pump/combat/sawn)
	projectilesound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	projectiletype = /obj/item/projectile/bullet/shotgun

//space melee
/mob/living/simple/hostile/syndicate/melee/space/weak
	icon_state = "syndicate_space_knife"
	melee_damage_lower = 7
	melee_damage_upper = 15
	maxHealth = 100
	health = 100
	drop_items = list(/obj/item/tool/knife/tacknife, /obj/item/shield/buckler/energy)

//space range
/mob/living/simple/hostile/syndicate/ranged/space/weak
	ranged_cooldown = 2
	rapid = 0
	icon_state = "syndicate_space_pistol"
	drop_items = list(/obj/item/gun/projectile/makarov)

/mob/living/simple/hostile/syndicate/ranged/space/heavy
	ranged_cooldown = 2
	icon_state = "syndicaterangedpsace"
	maxHealth = 200 //Boosted because melee given armor/shield
	health = 200

/mob/living/simple/hostile/syndicate/ranged/space/heavy/shotgun
	ranged_cooldown = 4
	rapid = 0
	icon_state = "syndicate_space_shotgun"
	drop_items = list(/obj/item/gun/projectile/shotgun/pump/combat/sawn)
	projectilesound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	projectiletype = /obj/item/projectile/bullet/shotgun

//robots
/mob/living/simple/hostile/viscerator
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

/mob/living/simple/hostile/viscerator/death()
	..(null,"is smashed into pieces!")
	qdel(src)

/mob/living/simple/hostile/viscerator/opifex
	name = "opifex viscerator"
	desc = "A small, twin-bladed machine capable of inflicting very deadly lacerations. This one is an opifex model and thus targets non-colony humanoids, animals, and cht'mants."
	faction = "neutral"
	colony_friend = TRUE

/mob/living/simple/hostile/viscerator/colony
	name = "colony-locked viscerator"
	desc = "A small, twin-bladed machine capable of inflicting very deadly lacerations. This model has functional colony-locked IFF and thus only targets non-colony humanoids and animals."
	faction = "neutral"
	colony_friend = TRUE

/mob/living/simple/hostile/viscerator/psionic
	name = "psionic swarm"
	desc = "A cloud of bluish swirling energies flow through the air"
	icon_state = "psionicswarm"
	pass_flags = PASSTABLE | PASSGRILLE
	faction = "neutral"
	colony_friend = TRUE
	attack_sound = 'sound/weapons/lightstab.ogg'
	var/time_alive = 0

/mob/living/simple/hostile/viscerator/psionic/New()
	..()
	set_light(l_range = 2, l_power = 1, l_color = "#8A2BE2")

/mob/living/simple/hostile/viscerator/psionic/Life()
	..()
	if(time_alive >= 30)
		phase_out()
	else
		time_alive += 1

/mob/living/simple/hostile/viscerator/psionic/proc/phase_out()
		visible_message("The [src.name] fades to a speck before disappearing in a glint.")
		playsound(src.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		qdel(src)
		return

/mob/living/simple/hostile/elitemercenary
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
	armor = list(melee = 11, bullet = 12, energy = 7, bomb = 0, bio = 100, rad = 50)
	vision_range = 16
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 10
	attacktext = "punched"
	a_intent = I_HURT
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

/mob/living/simple/hostile/elitemercenary/New()
	..()
	set_light(l_range = 4, l_power = 3)

/mob/living/simple/hostile/elitemercenary/death(gibbed, deathmessage = "drops its weapon as it explodes in a shower of gore when their death implant detonates!")
	..()
	new /obj/effect/gibspawner/human(src.loc)
	playsound(src, 'sound/effects/Explosion1.ogg', 75, 1, -3)
	drop_death_loot()
	qdel(src)
	return

/mob/living/simple/hostile/elitemercenary/allow_spacemove()
	return ..()

//elite melee
/mob/living/simple/hostile/elitemercenary/melee
	melee_damage_lower = 30
	melee_damage_upper = 35
	maxHealth = 450 //Boosted because melee given armor/shield
	health = 450
	armor = list(melee = 16, bullet = 10, energy = 7, bomb = 0, bio = 100, rad = 50)
	icon_state = "syndicate_stormtrooper_sword"
	drop_items = list(/obj/item/melee/energy/sword/red, /obj/item/shield/buckler/energy)
	attacktext = "slashed"

//elite range
/mob/living/simple/hostile/elitemercenary/range
	ranged_cooldown = 3
	ranged = 1
	rapid = 1
	icon_state = "syndicate_stormtrooper_smg"
	projectilesound = 'sound/weapons/Gunshot_light.ogg'
	projectiletype = /obj/item/projectile/bullet/pistol_35
	drop_items = list(/obj/item/gun/projectile/automatic/c20r)

/mob/living/simple/hostile/elitemercenary/range/gunslinger
	ranged_cooldown = 2
	rapid = 0
	icon_state = "syndicate_stormtrooper_pistol"
	projectilesound = 'sound/weapons/guns/fire/revolver_fire.ogg'
	projectiletype = /obj/item/projectile/bullet/kurz_50
	drop_items = list(/obj/item/gun/projectile/revolver/mistral)

/mob/living/simple/hostile/elitemercenary/range/space/heavy/shotgun
	ranged_cooldown = 4
	rapid = 0
	armor = list(melee = 16, bullet = 12, energy = 5, bomb = 0, bio = 100, rad = 50)
	health = 450
	maxHealth = 450
	icon_state = "syndicate_stormtrooper_shotgun"
	projectilesound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	projectiletype = /obj/item/projectile/bullet/shotgun
	drop_items = list(/obj/item/gun/projectile/shotgun/pump/combat)
