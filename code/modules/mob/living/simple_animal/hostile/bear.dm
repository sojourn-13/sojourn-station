//Space bears!
/mob/living/simple_animal/hostile/bear
	name = "black bear"
	desc = "A bear of the common black bear variety."
	icon = 'icons/mob/mobs-bear.dmi'
	icon_state = "bearfloor"
	icon_gib = "bear_gib"
	icon_dead = "bear_dead"
	speak_emote = list("growls", "roars")
	emote_see = list("stares ferociously", "stomps")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	meat_type = /obj/item/reagent_containers/food/snacks/meat/bearmeat
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "pokes"
	stop_automated_movement_when_pulled = 0
	maxHealth = 60
	health = 60
	melee_damage_lower = 20
	melee_damage_upper = 30
	attack_sound = 'sound/effects/creatures/maul.ogg'
	leather_amount = 6
	bones_amount = 4
	special_parts = list(/obj/item/animal_part/wolf_tooth)
	faction = "russian"

/mob/living/simple_animal/hostile/bear/FindTarget()
	. = ..()
	if(.)
		playsound(src, 'sound/effects/creatures/bear.ogg', 100, 1, -3)

/mob/living/simple_animal/hostile/bear/hudson
	name = "Hudson"
	desc = "A legendary black space bear. It's quite sparkly."
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "pokes"
	icon_state = "space_bear"
	icon_gib = "bear_gib"
	icon_dead = "space_bear_dead"
	maxHealth = 120
	health = 120
	melee_damage_lower = 30
	melee_damage_upper = 40

/mob/living/simple_animal/hostile/bear/brown
	name = "brown bear"
	desc = "A bear of the common brown bear variety."
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "pokes"
	icon_state = "brownbear"
	icon_gib = "brownbear_gib"
	icon_dead = "brownbear_dead"

/mob/living/simple_animal/hostile/bear/polar
	name = "polar bear"
	desc = "A bear of the uncommon polar bear variety."
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "pokes"
	icon_state = "polarbear"
	icon_gib = "brownbear_gib"
	icon_dead = "polarbear_dead"

/mob/living/simple_animal/hostile/bear/excelsior
	name = "excelsior armored bear"
	desc = "A huge bear outfitted with armor and trained by the excelsior judging from the markings on his armor. Who comes up with this shit?"
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "pokes"
	icon_state = "combatbear"
	icon_gib = "brownbear_gib"
	icon_dead = "combatbear_dead"
	faction = "excelsior"
	maxHealth = 400
	health = 400
	melee_damage_lower = 30
	melee_damage_upper = 40
	special_parts = list(/obj/item/animal_part/wolf_tooth,/obj/item/animal_part/wolf_tooth)

/mob/living/simple_animal/hostile/bear/mukwah
	name = "mukwah"
	desc = "A bear that escaped from the abandoned zoo labs before mutating into a creature known as a mukwah. Unlike a standard bear, a mukwah is much more powerful, a heavy hitter that is \
	slow but with a strength that exceeds even other powerful fauna."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "yaoguai"
	icon_dead = "yaoguai_dead"
	maxHealth = 400
	health = 400
	melee_damage_lower = 40 //Low health but an extremely powerful hitter
	melee_damage_upper = 50 //You call 400 HP LOW HEALTH?! - Seb
	leather_amount = 10
	bones_amount = 10
	pixel_x = -16
	special_parts = list(/obj/item/animal_part/wolf_tooth,/obj/item/animal_part/wolf_tooth)