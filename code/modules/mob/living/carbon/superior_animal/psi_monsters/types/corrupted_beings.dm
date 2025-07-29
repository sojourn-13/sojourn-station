/mob/living/carbon/superior/shell_hound
	name = "Shell hound"
	desc = "A heavy plated hound, coated in bone armor, its exposed underbelly shows fleshy muscle, with no skin to cover it. \
	Along its bone shell back are spines of mineral by the looks of it."
	icon_state = "q-hound"
	icon_living = "q-hound"
	icon = 'icons/mob/mobs-monster.dmi'
	maxHealth = 200 * DVEY_HEALTH_MOD
	health = 200 * DVEY_HEALTH_MOD
	attack_sound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	melee_damage_lower = 20
	melee_damage_upper = 30
	emote_see = list("howls in a broken voice.", "wracks its claws against the ground.", "gnarls.")
	turns_per_move = 3
	attacktext = "carves"
	faction = "daskvey"

	colony_friend = FALSE
	friendly_to_colony = FALSE

	has_special_parts = TRUE //var for checking during the butcher process.
	special_parts = list(/obj/item/animal_part/chimera_fang)


	armor_divisor = 2 //Sharp bones


	//Good stats baseline in case admins dont edit these
	armor = list(melee = 11, bullet = 3, energy = 11, bomb = 10, bio = 100, rad = 100, agony = 17)
	research_value = 2500

/mob/living/carbon/superior/psi/daskvey_follower
	name = "Daskveyian Swordsman"
	desc = "A basic footsoldier of the Hand of Daskvey. Donning the mask of the warrior, the lowest rank of souls receive their sword and begin training for the safey of their brothers and sisters."
	icon_state = "psisolder_hm_sword"
	icon_living = "psisolder_hm_sword"
	icon = 'icons/mob/mobs-daskvey.dmi'
	maxHealth = 250 * DVEY_HEALTH_MOD
	health = 250 * DVEY_HEALTH_MOD
	attack_sound = 'sound/weapons/slice.ogg'
	melee_damage_lower = 26
	melee_damage_upper = 26
	emote_see = list("looks left then right.", "breathes heavily.", "adjusts their armor.")
	turns_per_move = 3
	move_to_delay = 3
	attacktext = "cuts into"
	faction = "daskvey"

	chameleon_skill = 255
	phaser = FALSE

	psionic_respawn = FALSE

	colony_friend = FALSE
	friendly_to_colony = FALSE

	armor_divisor = 1.25

	color = "#49D6F2"

	drop_items = list(/obj/item/tool/sword/cult/deepmaints)

	can_leave = TRUE //freedom

	//Same armor that they are warning
	armor = list(melee = 7, bullet = 7, energy = 7, bomb = 30, bio = 100, rad = 50)
	research_value = 3000

/*
Note about the deepmaints_bound!
These ones are meant to be only used for chaos level and not for events, or deeper factional ties
They are soully made and reflavoured to be for PVE.
*/

/mob/living/carbon/superior/psi/daskvey_follower/deepmaints_bound
	name = "Wild Daskveyian Swordsman"
	desc = "Once a basic footsoldier of the Hand of Daskvey. \
	Donning the mask of the warrior, the lowest rank of souls receive their sword and begin training for only the safey of their brothers and sisters. \
	Turned mad from the Kings influence and being rebound to the Deep Maintenance acts on impluse attacking anyone not directly apart of the Daskvey."
	psionic_respawn = TRUE //Endles fighter
	can_leave = FALSE
	drop_items = list(/obj/item/tool/sword/cult/deepmaints, /obj/random/psi/always_spawn)
	color = null
	research_value = 2800

/mob/living/carbon/superior/psi/daskvey_follower/daskvey
	name = "Daskvey"
	desc = "A lumbering dragon as dark as the void of space itself, \
	large sheets of leathery wings furl behind its back, \
	while its head looks on with its eyeless gaze, \
	only sockets in place of normal eyes. \
	It remains deep in thought in its squating position at all times, \
	positivly streaming psionic energy to the entire area around it."
	icon_state = "phoron_dragon_squat_complete"
	icon_living = "phoron_dragon_squat_complete"
	icon = 'icons/mob/64x64.dmi'

	maxHealth = 7500
	health = 7500
	attack_sound = 'sound/weapons/slice.ogg'
	melee_damage_lower = 40
	melee_damage_upper = 60
	emote_see = list("sighs deeply")
	turns_per_move = 1
	move_to_delay = 1
	attacktext = "rends apart"

	armor_divisor = 2.5

	color = null

	drop_items = list(/obj/item/clothing/glasses/eyepatch, /obj/item/clothing/glasses/eyepatch)

	delay_for_range = 3 SECONDS
	limited_ammo = FALSE
	mag_drop = FALSE
	ranged = TRUE
	comfy_range = 6
	projectiletype = /obj/item/projectile/kinetic_blast_electro/brutal

	var/loaded_ammo = 1

	//Wowerz scales are FIRE PROOF? who would have known
	//Scale armor ref from CDDA
	//Dragons are weak to melee - source: Dnd
	//Ive never seen a wizard NOT nuke a dragon with fire ball
	armor = list(melee = 10, bullet = 17, energy = 23, bomb = 40, bio = 100, rad = 100)
	research_value = 15000

/mob/living/carbon/superior/psi/daskvey_follower/daskvey/MiddleClickOn(mob/targetDD as mob)
	var/mob/living/carbon/superior/psi/daskvey_follower/daskvey/shooter = src //We're the shooter.
	if(loaded_ammo == 1)
		projectiletype = /obj/item/projectile/kinetic_blast_electro/brutal
		shooter.OpenFire(targetDD)
		return
	if(loaded_ammo == 2)
		projectiletype = /obj/item/projectile/kinetic_blast_pyro
		shooter.OpenFire(targetDD)
		loaded_ammo = 1
		return
	if(loaded_ammo == 3)
		projectiletype = /obj/item/projectile/tether/tail
		shooter.OpenFire(targetDD)
		loaded_ammo = 1
		return
	shooter.OpenFire(targetDD)

/mob/living/carbon/superior/psi/daskvey_follower/daskvey/verb/badbreathverb()
	set name = "Fire Breath"
	set category = "Abilities"
	src.badbreath()

/mob/living/carbon/superior/psi/daskvey_follower/daskvey/proc/badbreath()
	visible_message(SPAN_WARNING("\red [src] has a firey look in its maw!"))
	loaded_ammo = 2

/mob/living/carbon/superior/psi/daskvey_follower/daskvey/verb/tail_throwverb()
	set name = "Tail Grapple Breath"
	set category = "Abilities"
	src.tail_throw()

/mob/living/carbon/superior/psi/daskvey_follower/daskvey/proc/tail_throw()
	visible_message(SPAN_WARNING("\red [src] flicks its tail and wings!"))
	loaded_ammo = 3

// Broken code that doesn't work with the Eris sanity system.
/*

/mob/living/carbon/superior/psi/daskvey_follower/daskvey/verb/mind_of_cloathverb()
	set name = "Rune Chat"
	set category = "Abilities"
	src.mind_of_cloath()

/mob/living/carbon/superior/psi/daskvey_follower/daskvey/proc/mind_of_cloath(mob/M)
	visible_message(SPAN_WARNING("\red [src] pierces the minds, blanking them in arcane knowledge!"))
	for(M in living_mobs_in_view(5, src))
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			H.sanity.breakdown_fabric()
*/

/mob/living/carbon/superior/psi/daskvey_follower/daskvey/Bump(var/atom/obstacle)
	.=..()
	if(iscarbon(obstacle))
		var/mob/living/carbon/J = obstacle
		J.take_organ_damage(12)
		J.throw_at(get_edge_target_turf(src,pick(alldirs)),rand(3,6),30)

/mob/living/carbon/superior/psi/daskvey_follower/cleaver
	name = "Daskveyian Wall Breaker"
	desc = "A basic footsoldier of the Hand of Daskvey. Donning the mask of the warrior, the agressive souls of former criminals find themselves too enraged to naught but strike their enemies down with furious rage. Flesh or steel, the axe will smash its way through."
	icon_state = "psisolder_hm_axe"
	icon_living = "psisolder_hm_axe"
	maxHealth = 250 * DVEY_HEALTH_MOD
	health = 250 * DVEY_HEALTH_MOD
	melee_damage_lower = 33
	melee_damage_upper = 33
	emote_see = list("looks left then right.", "breaths heavily.", "adjusts their armor.")
	turns_per_move = 3
	move_to_delay = 4
	attacktext = "hacks"


	drop_items = list(/obj/item/tool/sword/cleaver/cult/deepmaints)

	armor_divisor = 1.25
	research_value = 3200

/mob/living/carbon/superior/psi/daskvey_follower/cleaver/deepmaints_bound
	name = "Wild Daskveyian Wall Breaker"
	desc = "Once a basic footsoldier of the Hand of Daskvey. \
	Donning the mask of the warrior, the agressive souls of former criminals find themselves too enraged to naught but strike their enemies down with furious rage. \
	Flesh or steel, the axe will smash its way through. \
	Turned mad from the Kings influence and being rebound to the Deep Maintenance acts on impluse attacking anyone not directly apart of the Daskvey."
	color = null
	psionic_respawn = TRUE //Endles fighter
	can_leave = FALSE
	drop_items = list(/obj/item/tool/sword/cleaver/cult/deepmaints, /obj/random/psi/always_spawn)
	research_value = 3000

/mob/living/carbon/superior/psi/daskvey_follower/plasma
	name = "Daskveyian Plasma Caster"
	desc = "Trained warrior of the Hand of Daskvey. Carrying a laser gun enhanced by the wielder's mind, they inflict deadly pain on any that obstruct the freedom of their cult's members. For freedom is never free."
	icon_state = "psisolder_hm_plasma"
	icon_living = "psisolder_hm_plasma"
	maxHealth = 250 * DVEY_HEALTH_MOD
	health = 250 * DVEY_HEALTH_MOD
	melee_damage_lower = 8
	melee_damage_upper = 10
	emote_see = list("looks left then right.", "breaths heavily.", "adjusts their armor.")
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

	armor_divisor = 1
	research_value = 3500

/mob/living/carbon/superior/psi/daskvey_follower/plasma/deepmaints_bound
	name = "Wild Daskveyian Plasma Caster"
	desc = "Once a trained warrior of the Hand of Daskvey. Carrying a laser gun enhanced by the wielder's mind, they inflict deadly pain on most that obstruct them. \
	Turned mad from the Kings influence and being rebound to the Deep Maintenance acts on impluse attacking anyone not directly apart of the Daskvey."
	color = null
	psionic_respawn = TRUE //Endles fighter
	can_leave = FALSE
	drop_items = list(/obj/item/gun/energy/plasma/cassad/cult/deepmaints, /obj/random/psi/always_spawn)
	research_value = 3300

/mob/living/carbon/superior/psi/daskvey_follower/laser
	name = "Daskveyian Las-Gunner"
	desc = "Trained Gunner of the Hand of Daskvey, their hands blessed with a fine laser rifle to burn away that which would threaten them or their fellow followers."
	icon_state = "psisolder_hm_laser"
	icon_living = "psisolder_hm_laser"
	maxHealth = 250 * DVEY_HEALTH_MOD
	health = 250 * DVEY_HEALTH_MOD
	melee_damage_lower = 8
	melee_damage_upper = 10
	emote_see = list("looks left then right.", "breaths heavily.", "adjusts their armor.")
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

	armor_divisor = 1
	research_value = 3400

/mob/living/carbon/superior/psi/daskvey_follower/laser/deepmaints_bound
	name = "Wild Daskveyian Las-Gunner"
	desc = "Once a trained Gunner of the Hand of Daskvey, their hands clutching a fine laser rifle to burn away that which would threaten them or their fellow followers. \
	Turned mad from the Kings influence and being rebound to the Deep Maintenance acts on impluse attacking anyone not directly apart of the Daskvey."
	color = null
	psionic_respawn = TRUE //Endles fighter
	can_leave = FALSE
	drop_items = list(/obj/item/gun/energy/laser/cult/deepmaints, /obj/random/psi/always_spawn)
	research_value = 3200

/mob/living/carbon/superior/psi/daskvey_follower/smg
	name = "Daskveyian Assaulter"
	desc = "A basic Gunner of the Hand of Daskvey, fervent and ready to fight, their weapon sprays waves of lead to any that would harm those that they hold dear."
	icon_state = "psisolder_hm_smg"
	icon_living = "psisolder_hm_smg"
	maxHealth = 250 * DVEY_HEALTH_MOD
	health = 250 * DVEY_HEALTH_MOD
	melee_damage_lower = 8
	melee_damage_upper = 10
	emote_see = list("looks left then right.", "breaths heavily.", "adjusts their armor.")
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

	armor_divisor = 1
	research_value = 3100

/mob/living/carbon/superior/psi/daskvey_follower/smg/Initialize(mapload)
	. = ..()
	//Proj Upgrade
	if(GLOB.chaos_level >= 5)
		projectiletype = /obj/item/projectile/bullet/pistol_35

/mob/living/carbon/superior/psi/daskvey_follower/smg/deepmaints_bound
	name = "Wild Daskveyian Assaulter"
	desc = "Once a mere Gunner of the Hand of Daskvey, still ready to fight, their weapon sprays waves of lead to any that would harm those that they held dear. \
	Turned mad from the Kings influence and being rebound to the Deep Maintenance acts on impluse attacking anyone not directly apart of the Daskvey."
	color = null
	psionic_respawn = TRUE //Endles fighter
	can_leave = FALSE
	drop_items = list(/obj/item/gun/projectile/automatic/greasegun/cult/deepmaints, /obj/random/psi/always_spawn)
	research_value = 2900

/mob/living/carbon/superior/psi/daskvey_follower/rifle
	name = "Daskveyian Rifleperson"
	desc = "A basic rifleperson of the Hand of Daskvey. Shadowed behind the mask of the warrior, they find peace with weapon in hand, for no duty is more important to freedom than to take up arms for it."

	icon_state = "psisolder_hm_rifle"
	icon_living = "psisolder_hm_rifle"
	maxHealth = 250 * DVEY_HEALTH_MOD
	health = 250 * DVEY_HEALTH_MOD
	melee_damage_lower = 8
	melee_damage_upper = 10
	emote_see = list("looks left then right.", "breaths heavily.", "adjusts their armor.")
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

	armor_divisor = 1
	research_value = 3300

/mob/living/carbon/superior/psi/daskvey_follower/rifle/Initialize(mapload)
	. = ..()
	//Proj Upgrade
	if(GLOB.chaos_level >= 5)
		projectiletype = /obj/item/projectile/bullet/rifle_75

/mob/living/carbon/superior/psi/daskvey_follower/rifle/deepmaints_bound
	name = "Wild Daskveyian Rifleperson"
	desc = "Once just a basic rifleperson of the Hand of Daskvey. Shadowed behind the mask of the warrior, they lost the peace given to them, yearning freedom once more. \
	Turned mad from the Kings influence and being rebound to the Deep Maintenance acts on impluse attacking anyone not directly apart of the Daskvey."
	color = null
	psionic_respawn = TRUE //Endles fighter
	can_leave = FALSE
	drop_items = list(/obj/item/gun/projectile/automatic/sts/rifle/cult/deepmaints, /obj/random/psi/always_spawn)
	research_value = 3100

/mob/living/carbon/superior/psi/daskvey_follower/shield
	name = "Daskveyian Juggernaut "
	desc = "A soul of strength and integrity, recovered from the ravages laid upon it. Outfitted in heavy armor, it protects those in its shadow with unbending steel, for they are the wall that holds back any that seek to harm their kin."
	icon_state = "psi_juggernaut_glass_Shield"
	icon_living = "psi_juggernaut_glass_Shield"
	maxHealth = 300 * DVEY_HEALTH_MOD
	health = 300 * DVEY_HEALTH_MOD
	melee_damage_lower = 20
	melee_damage_upper = 25
	emote_see = list("looks left then right.", "breaths heavily.", "adjusts their armor.")
	turns_per_move = 4
	move_to_delay = 5
	attacktext = "destablizes"

	drop_items = list()

	armor_divisor = 1
	armor = list(melee = 15, bullet = 15, energy = 3, bomb = 100, bio = 100, rad = 90)
	var/knockdown_odds = 30
	research_value = 4000

// BUMP!
/mob/living/carbon/superior/psi/daskvey_follower/shield/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(knockdown_odds))
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			else
				L.Weaken(3)
				L.visible_message(SPAN_DANGER("\the [src] uses its shield to knock over \the [L]!"))
	. = ..()

/mob/living/carbon/superior/psi/daskvey_follower/shield/deepmaints_bound
	name = "Wild Daskveyian Juggernaut "
	desc = "Once a soul of strength and integrity, recovered from the ravages laid upon it. Still fitted in heavy armor, it protected those in its shadow with unbending steel, for they were once the wall that held back any that seek to harm their kin. \
	Turned mad from the Kings influence and being rebound to the Deep Maintenance acts on impluse attacking anyone not directly apart of the Daskvey."
	color = null
	psionic_respawn = TRUE //Endles fighter
	can_leave = FALSE
	drop_items = list(/obj/random/psi/always_spawn, /obj/random/psi/always_spawn)
	research_value = 3800

/mob/living/carbon/superior/psi/daskvey_follower/halberd
	name = "Daskveyian Halberdier"
	desc = "A soul of strength and integrity, recovered from the ravages laid upon it. Outfitted in heavy armor, it protects those in its shadow with unwavering confidence, for they know what failure means."
	icon_state = "psi_juggernaut_glass_halberd"
	icon_living = "psi_juggernaut_glass_halberd"
	maxHealth = 280 * DVEY_HEALTH_MOD
	health = 280 * DVEY_HEALTH_MOD
	melee_damage_lower = 33
	melee_damage_upper = 33
	emote_see = list("looks left then right", "breaths heavilly", "adjusts their armor")
	turns_per_move = 4
	move_to_delay = 5
	attacktext = "hacks"

	drop_items = list()

	armor_divisor = 1.5
	armor = list(melee = 15, bullet = 15, energy = 3, bomb = 100, bio = 100, rad = 90)
	research_value = 4200

/mob/living/carbon/superior/psi/daskvey_follower/halberd/deepmaints_bound
	name = "Wild Daskveyian Halberdier"
	desc = "Once a soul of strength and integrity, recovered from the ravages laid upon it. Still fitted in heavy armor, it used to protects those in its shadow with unwavering confidence, for they found what failure means. \
	Turned mad from the Kings influence and being rebound to the Deep Maintenance acts on impluse attacking anyone not directly apart of the Daskvey."
	color = null
	psionic_respawn = TRUE //Endles fighter
	can_leave = FALSE
	drop_items = list(/obj/random/psi/always_spawn, /obj/random/psi/always_spawn)
	research_value = 4000

/mob/living/carbon/superior/psi/daskvey_follower/weakling
	name = "Daskveyian Uplifted"
	desc = "A soul recently uplifted by the Hand of Daskvey, still lost and recovering from its pains, they find themselves lost in a trance of forgotten memories."
	icon_state = "psion_h"
	icon_living = "psion_h"
	maxHealth = 150 * DVEY_HEALTH_MOD
	health = 150 * DVEY_HEALTH_MOD
	melee_damage_lower = 15
	melee_damage_upper = 15
	emote_see = list("looks left then right.", "breathes softly.", "adjusts their robes.")
	turns_per_move = 1
	move_to_delay = 2
	attacktext = "punches"

	drop_items = list()

	armor_divisor = 1
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	research_value = 1000

/mob/living/carbon/superior/psi/daskvey_follower/weakling/deepmaints_bound
	name = "Wild Daskveyian Uplifted"
	desc = "Once A soul uplifted by the Hand of Daskvey, lost and suffering from it's pains, found often in a trance of forgotten memories. \
	Do to the Kings influence and being rebound to the Deep Maintenance it acts on impluse attacking anyone not directly apart of the Daskvey."
	color = null
	psionic_respawn = TRUE //Endles fighter
	can_leave = FALSE
	drop_items = list(/obj/random/psi/always_spawn)
	research_value = 1200

/mob/living/carbon/superior/psi/daskvey_follower/orb_shooter
	name = "Daskveyian Cultist "
	desc = "A soul reformed by the Hand of Daskvey, they spend their time occupied with daily routine, trying to fend off the insanity of their own predicament, while better learning their new powers."
	icon_state = "psion_v"
	icon_living = "psion_v"
	maxHealth = 150 * DVEY_HEALTH_MOD
	health = 150 * DVEY_HEALTH_MOD
	melee_damage_lower = 15
	melee_damage_upper = 15
	emote_see = list("looks left then right.", "breathes softly.", "adjusts their robes.")
	turns_per_move = 1
	move_to_delay = 2
	attacktext = "punches"

	drop_items = list()

	armor_divisor = 1
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

	rounds_per_fire = 1
	delay_for_range = 1 SECONDS
	delay_for_rapid_range = 1 SECOND
	limited_ammo = FALSE
	mag_drop = FALSE
	ranged = TRUE
	comfy_range = 6
	projectiletype = /obj/item/projectile/kinetic_blast_electro/dangerous
	research_value = 2800

/mob/living/carbon/superior/psi/daskvey_follower/orb_shooter/deepmaints_bound
	name = "Wild Daskveyian Cultist "
	desc = "Once a soul reformed by the Hand of Daskvey, they spend their time occupied with daily routine, trying to fend off the insanity of their own predicament, while better learning their new powers. \
	Turned mad from the Kings influence and being rebound to the Deep Maintenance acts on impluse attacking anyone not directly apart of the Daskvey."
	color = null
	psionic_respawn = TRUE //Endles fighter
	can_leave = FALSE
	drop_items = list(/obj/random/psi/always_spawn, /obj/random/psi/always_spawn)
	research_value = 3000

/mob/living/carbon/superior/psi/daskvey_follower/orb_master
	name = "Daskveyian Hand"
	desc = "A master of the mind, reformed and guided true by the Hand of Daskvey. The members of the Hands form the parties of preach leaders, and assistants to the acolytes. Their knowledge of psionics is of a scholarly level."
	icon_state = "psion_v_master"
	icon_living = "psion_v_master"
	maxHealth = 150 * DVEY_HEALTH_MOD
	health = 150 * DVEY_HEALTH_MOD
	melee_damage_lower = 15
	melee_damage_upper = 15
	emote_see = list("looks left then right.", "breathes softly.", "adjusts their robes.")
	turns_per_move = 1
	move_to_delay = 2
	attacktext = "punches"

	drop_items = list()

	armor_divisor = 1
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

	rounds_per_fire = 1
	delay_for_range = 1 SECONDS
	delay_for_rapid_range = 1 SECOND
	limited_ammo = FALSE
	mag_drop = FALSE
	ranged = TRUE
	comfy_range = 6
	projectiletype = /obj/item/projectile/kinetic_blast_pyro
	research_value = 3800

/mob/living/carbon/superior/psi/daskvey_follower/orb_master/handle_ammo_check()
	if(prob(40))
		projectiletype = /obj/item/projectile/kinetic_blast_pyro

	if(prob(30))
		projectiletype = /obj/item/projectile/kinetic_blast_electro/robust

	if(prob(20))
		projectiletype = /obj/item/projectile/kinetic_blast_electro/dangerous

	if(prob(10))
		projectiletype = /obj/item/projectile/kinetic_blast_electro/brutal
	..()

/mob/living/carbon/superior/psi/daskvey_follower/orb_master/deepmaints_bound
	name = "Wild Daskveyian Hand"
	desc = "A fallen master of the mind, once reformed and guided true by the Hand of Daskvey. \
	The members of the Hands form the parties of preach leaders, and assistants to the acolytes. \
	Their knowledge of psionics is of a scholarly level. \
	Turned mad from the Kings influence and being rebound to the Deep Maintenance acts on impluse attacking anyone not directly apart of the Daskvey."
	color = null
	psionic_respawn = TRUE //Endles fighter
	can_leave = FALSE
	drop_items = list(/obj/random/psi/always_spawn, /obj/random/psi/always_spawn, /obj/random/psi/always_spawn)
	research_value = 4000
