/mob/living/carbon/superior_animal/shell_hound
	name = "Shell hound"
	desc = "A heavy plated hound, coated in bone armor, its exposed underbelly shows fleshy muscle, with no skin to cover it. \
	Along its bone shell back are spines of mineral by the looks of it. "
	icon_state = "q-hound"
	icon_living = "q-hound"
	icon = 'icons/mob/mobs-monster.dmi'
	maxHealth = 400
	health = 400
	attack_sound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	melee_damage_lower = 20
	melee_damage_upper = 30
	emote_see = list("howls in a broken voice", "wracks its claws against the ground", "gnarls")
	turns_per_move = 3
	attacktext = "carves"
	faction = "daskvey"

	colony_friend = FALSE
	friendly_to_colony = FALSE

	has_special_parts = TRUE //var for checking during the butcher process.
	special_parts = list(/obj/item/animal_part/chimera_fang)


	armor_penetration = 25 //Sharp bones


	//Good stats baseline in case admins dont edit these
	armor = list(melee = 45, bullet = 15, energy = 45, bomb = 10, bio = 100, rad = 100, agony = 70)


/mob/living/carbon/superior_animal/psi_monster/daskvey_follower
	name = "Daskveyian Swordsman"
	desc = "A basic footsoldier of the Hand of Daskvey. Donning the mask of the warrior the lowest rank of souls receive their sword, and begin training for the safey of their brothers and sisters."
	icon_state = "psisolder_hm_sword"
	icon_living = "psisolder_hm_sword"
	icon = 'icons/mob/mobs-daskvey.dmi'
	maxHealth = 250
	health = 250
	attack_sound = 'sound/weapons/slice.ogg'
	melee_damage_lower = 26
	melee_damage_upper = 26
	emote_see = list("looks left then right", "breaths heavilly", "adjusts their armour")
	turns_per_move = 3
	move_to_delay = 3
	attacktext = "cuts into"
	faction = "daskvey"

	psionic_respawn = FALSE

	colony_friend = FALSE
	friendly_to_colony = FALSE

	armor_penetration = 15

	color = "#49D6F2"

	drop_items = list(/obj/item/tool/sword/cult/deepmaints)


	//Same armor that they are warning
	armor = list(melee = 35, bullet = 35, energy = 35, bomb = 30, bio = 100, rad = 50)

/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/cleaver
	name = "Daskveyian Wall Breaker "
	desc = "A basic footsoldier of the Hand of Daskvey. Donning the mask of the warrior, the agressive souls of former criminals find themselves to enraged to naught but strike their enemys down with furious rage. Flesh or steel, the axe will smash its way through."
	icon_state = "psisolder_hm_axe"
	icon_living = "psisolder_hm_axe"
	maxHealth = 250
	health = 250
	melee_damage_lower = 33
	melee_damage_upper = 33
	emote_see = list("looks left then right", "breaths heavilly", "adjusts their armour")
	turns_per_move = 3
	move_to_delay = 4
	attacktext = "hacks"


	drop_items = list(/obj/item/tool/sword/cleaver/cult/deepmaints)

	armor_penetration = 15

/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/plasma
	name = "Daskveyian Plasma Caster"
	desc = "Trained warrior of the Hand of Daskvey. Carrying a laser gun enhanced by the wielders mind, they inflict deadly pain on any that obstruct the freedom of their cults members. For freedom is never free."
	icon_state = "psisolder_hm_plasma"
	icon_living = "psisolder_hm_plasma"
	maxHealth = 250
	health = 250
	melee_damage_lower = 8
	melee_damage_upper = 10
	emote_see = list("looks left then right", "breaths heavilly", "adjusts their armour")
	turns_per_move = 3
	move_to_delay = 4
	attacktext = "bashes"

	drop_items = list(/obj/item/gun/energy/plasma/cassad/cult/deepmaints)

	delay_for_range = 3 SECONDS
	limited_ammo = FALSE
	mag_drop = FALSE
	ranged = TRUE
	comfy_range = 6
	projectiletype = /obj/item/projectile/plasma/aoe/heat

	armor_penetration = 15

/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/laser
	name = "Daskveyian Las-Gunner"
	desc = "Trained Gunner of the Hand of Daskvey, their hands placed with a fine laser rifle to burn away that which would threaten them or their fellow followers."
	icon_state = "psisolder_hm_laser"
	icon_living = "psisolder_hm_laser"
	maxHealth = 250
	health = 250
	melee_damage_lower = 8
	melee_damage_upper = 10
	emote_see = list("looks left then right", "breaths heavilly", "adjusts their armour")
	turns_per_move = 3
	move_to_delay = 4
	attacktext = "bashes"

	viewRange = 20
	comfy_range = 20

	drop_items = list(/obj/item/gun/energy/laser/cult/deepmaints)

	delay_for_range = 2 SECONDS
	limited_ammo = FALSE
	mag_drop = FALSE
	ranged = TRUE
	comfy_range = 6
	projectiletype = /obj/item/projectile/beam

	armor_penetration = 15

/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/smg
	name = "Daskveyian Assaulter"
	desc = "A basic Gunner of the Hand of Daskvey, fervent and ready to fight, their weapon sprays waves of lead to any that would harm those that they hold dear."
	icon_state = "psisolder_hm_smg"
	icon_living = "psisolder_hm_smg"
	maxHealth = 250
	health = 250
	melee_damage_lower = 8
	melee_damage_upper = 10
	emote_see = list("looks left then right", "breaths heavilly", "adjusts their armour")
	turns_per_move = 3
	move_to_delay = 4
	attacktext = "bashes"

	drop_items = list(/obj/item/gun/projectile/automatic/greasegun/cult/deepmaints)

	rounds_per_fire = 4
	delay_for_range = 1 SECONDS
	delay_for_rapid_range = 1 SECOND
	rapid_fire_shooting_amount = 4
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 32
	mags_left = 10
	ranged = TRUE
	rapid = TRUE
	comfy_range = 6
	projectiletype = /obj/item/projectile/bullet/pistol_35/scrap
	mag_type = /obj/item/ammo_magazine/smg_35/empty

	armor_penetration = 15

/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/rifle
	name = "Daskveyian Rifleperson"
	desc = "A basic rifleperson of the Hand of Daskvey. Shadowed behind the mask of the warrior, they find peace with weapon in hand, for no duty is more important to freedom, than to take up arms for it."

	icon_state = "psisolder_hm_rifle"
	icon_living = "psisolder_hm_rifle"
	maxHealth = 250
	health = 250
	melee_damage_lower = 8
	melee_damage_upper = 10
	emote_see = list("looks left then right", "breaths heavilly", "adjusts their armour")
	turns_per_move = 3
	move_to_delay = 4
	attacktext = "bashes"

	drop_items = list(/obj/item/gun/projectile/automatic/sts/rifle/cult/deepmaints)

	rounds_per_fire = 2
	delay_for_range = 1 SECONDS
	delay_for_rapid_range = 1 SECOND
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 30
	mags_left = 10
	ranged = TRUE
	rapid = TRUE
	comfy_range = 6
	projectiletype = /obj/item/projectile/bullet/rifle_75/scrap
	mag_type = /obj/item/ammo_magazine/rifle_75/empty

	armor_penetration = 15

/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/shield
	name = "Daskveyian Juggernaut "
	desc = "A soul of strength and integrity, recovered from the ravages laid upon it. REstored in heavy armor it protects those in its shadow with unbending steel, for they are the wall that holds back any that seek to harm their kin."
	icon_state = "psi_juggernaut_glass_Shield"
	icon_living = "psi_juggernaut_glass_Shield"
	maxHealth = 300
	health = 300
	melee_damage_lower = 20
	melee_damage_upper = 25
	emote_see = list("looks left then right", "breaths heavilly", "adjusts their armour")
	turns_per_move = 4
	move_to_delay = 5
	attacktext = "destablizes"

	drop_items = list()

	armor_penetration = 0
	armor = list(melee = 60, bullet = 60, energy = 60, bomb = 100, bio = 100, rad = 90)
	var/knockdown_odds = 30

// BUMP!
/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/shield/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(knockdown_odds))
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			else
				L.Weaken(3)
				L.visible_message(SPAN_DANGER("\the [src] uses its shield to knock over \the [L]!"))
	. = ..()

/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/halberd
	name = "Daskveyian Halberdier"
	desc = "A soul of strength and integrity, recovered from the ravages laid upon it. Restored in heavy armor it protects those in its shadow with unwavering confidence, for they know what failure means."
	icon_state = "psi_juggernaut_glass_halberd"
	icon_living = "psi_juggernaut_glass_halberd"
	maxHealth = 280
	health = 280
	melee_damage_lower = 33
	melee_damage_upper = 33
	emote_see = list("looks left then right", "breaths heavilly", "adjusts their armour")
	turns_per_move = 4
	move_to_delay = 5
	attacktext = "hacks"

	drop_items = list()

	armor_penetration = 30
	armor = list(melee = 60, bullet = 60, energy = 60, bomb = 100, bio = 100, rad = 90)

/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/weakling
	name = "Daskveyian Uplifted"
	desc = "A recently uplifted soul by the Hand of Daskvey, still lost and recovering from its pains, they find themselves lost in a trance of forgotten memories."
	icon_state = "psion_h"
	icon_living = "psion_h"
	maxHealth = 150
	health = 150
	melee_damage_lower = 15
	melee_damage_upper = 15
	emote_see = list("looks left then right", "breaths softly", "adjusts their robes")
	turns_per_move = 1
	move_to_delay = 2
	attacktext = "punches"

	drop_items = list()

	armor_penetration = 0
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/orb_shooter
	name = "Daskveyian Cultist "
	desc = "A reformed soul by the Hand of Daskvey, they spend their time occupied with daily routine, trying to fend off the insanity of their own perdicament, while better learning their new powers."
	icon_state = "psion_v"
	icon_living = "psion_v"
	maxHealth = 150
	health = 150
	melee_damage_lower = 15
	melee_damage_upper = 15
	emote_see = list("looks left then right", "breaths softly", "adjusts their robes")
	turns_per_move = 1
	move_to_delay = 2
	attacktext = "punches"

	drop_items = list()

	armor_penetration = 0
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

	rounds_per_fire = 1
	delay_for_range = 1 SECONDS
	delay_for_rapid_range = 1 SECOND
	limited_ammo = FALSE
	mag_drop = FALSE
	ranged = TRUE
	comfy_range = 6
	projectiletype = /obj/item/projectile/kinetic_blast_electro/dangerous

/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/orb_shooter/handle_ammo_check()
	if(prob(40))
		projectiletype = /obj/item/projectile/kinetic_blast_electro/brutal

	if(prob(30))
		projectiletype = /obj/item/projectile/kinetic_blast_electro/robust

	if(prob(20))
		projectiletype = /obj/item/projectile/kinetic_blast_electro/dangerous

	..()

/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/orb_master
	name = "Daskveyian Hand "
	desc = "A master of the mind, reformed and guided true by the Hand of Daskvey. The members of the Hands form the parties of preach leaders, and assistants to the acolytes. Their knowledge of psionics is of a scholarly level."
	icon_state = "psion_v_master"
	icon_living = "psion_v_master"
	maxHealth = 150
	health = 150
	melee_damage_lower = 15
	melee_damage_upper = 15
	emote_see = list("looks left then right", "breaths softly", "adjusts their robes")
	turns_per_move = 1
	move_to_delay = 2
	attacktext = "punches"

	drop_items = list()

	armor_penetration = 0
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

	rounds_per_fire = 1
	delay_for_range = 1 SECONDS
	delay_for_rapid_range = 1 SECOND
	limited_ammo = FALSE
	mag_drop = FALSE
	ranged = TRUE
	comfy_range = 6
	projectiletype = /obj/item/projectile/kinetic_blast_pyro

/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/orb_master/handle_ammo_check()
	if(prob(40))
		projectiletype = /obj/item/projectile/kinetic_blast_pyro

	if(prob(30))
		projectiletype = /obj/item/projectile/kinetic_blast_electro/robust

	if(prob(20))
		projectiletype = /obj/item/projectile/kinetic_blast_electro/dangerous

	if(prob(10))
		projectiletype = /obj/item/projectile/kinetic_blast_electro/brutal
	..()
