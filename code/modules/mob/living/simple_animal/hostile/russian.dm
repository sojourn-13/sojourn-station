/mob/living/simple/hostile/russian
	name = "russian"
	desc = "For the Motherland!"
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "russianmelee"
	icon_dead = "russian_dead" //TODO: that icon doesn't exist
	icon_gib = "syndicate_gib"
	speak_chance = 0
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 4
	stop_automated_movement_when_pulled = 0
	maxHealth = 100
	health = 100
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 15
	attacktext = "punched"
	a_intent = I_HURT
	drop_items = list(/obj/landmark/corpse/antagonist/russian, /obj/item/tool/knife)
	min_oxy = 5
	max_oxy = 0
	min_tox = 0
	max_tox = 1
	min_co2 = 0
	max_co2 = 5
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 15
	faction = "russian"
	status_flags = CANPUSH
	leather_amount = 0
	bones_amount = 0
	inherent_mutations = list(MUTATION_HEART, MUTATION_LUNG, MUTATION_LIVER, MUTATION_BLOOD_VESSEL, MUTATION_MUSCLES, MUTATION_NERVES)


/mob/living/simple/hostile/russian/ranged
	icon_state = "russianranged"
	drop_items = list(/obj/landmark/corpse/antagonist/russian/ranged, /obj/item/gun/projectile/revolver)
	ranged = 1
	projectiletype = /obj/item/projectile/bullet
	projectilesound = 'sound/weapons/Gunshot.ogg'
	casingtype = /obj/item/ammo_casing/magnum_40


/mob/living/simple/hostile/russian/death()
	..()
	drop_death_loot()
	qdel(src)
	return