//hunters have the most poison and move the fastest, so they can find prey
/mob/living/carbon/superior/spider/hunter
	name = "hunter spider"
	desc = "Furry and black, it makes you shudder to look at it. This one has sparkling purple eyes."
	icon_state = "hunter"
	icon_living = "hunter"
	maxHealth = 70 * SPIDER_HEALTH_MOD
	health = 70 * SPIDER_HEALTH_MOD
	melee_damage_lower = 10
	melee_damage_upper = 20
	poison_per_bite = 4
	move_to_delay = 4.5
	meat_type = /obj/item/reagent_containers/snacks/meat/spider/hunter
	meat_amount = 4
	emote_see = list("chitters.","rubs its legs.","bounces in place.")

/mob/living/carbon/superior/spider/hunter/cloaker
	name = "cloaker spider"
	desc = "Furry and black, it makes you shudder to look at it. This one has a weaker chameleonic chitin that makes it hard to see."
	alpha = 50
	armor = list(melee = 1, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 25, agony = 0)


/mob/living/carbon/superior/spider/hunter/cloaker/death() //We are now unable to chameleonic chitin do to being dead
	..()
	alpha = 255

/mob/living/carbon/superior/spider/hunter/viper
	name = "viper spider"
	desc = "Furry and black, it makes you shudder to look at it. This one has sparkling purple eyes and a large red splotch on its abdomen."
	icon_state = "viper"
	icon_living = "viper"
	maxHealth = 100 * SPIDER_HEALTH_MOD
	health = 100 * SPIDER_HEALTH_MOD
	melee_damage_lower = 20
	melee_damage_upper = 25

/mob/living/carbon/superior/spider/hunter/mindweaver
	name = "mindweaver spider"
	desc = "sleek and grey, it makes you shudder to look at it. This one has sparkling magenta eyes and grasping mandibles."
	icon_state = "mindweaver"
	icon_living = "mindweaver"
	maxHealth = 95 * SPIDER_HEALTH_MOD
	health = 95 * SPIDER_HEALTH_MOD
	melee_damage_lower = 15
	melee_damage_upper = 20
	poison_per_bite = 1.5
	poison_type = "mindbreaker"
	move_to_delay = 3.2

//bomb spider, very little toxins and not much health but explodes on reaching melee range.
/mob/living/carbon/superior/spider/plasma
	name = "plasma spider"
	desc = "Furry and black, it makes you shudder to look at it. This one is infused with plasma and has mutated spikes protruding from its chitin."
	icon_state = "phoron"
	icon_living = "phoron"
	maxHealth = 30 * SPIDER_HEALTH_MOD
	health = 30 * SPIDER_HEALTH_MOD
	melee_damage_lower = 5
	melee_damage_upper = 10
	poison_per_bite = 2
	poison_type = "plasma"
	move_to_delay = 4
	meat_type = /obj/item/reagent_containers/snacks/meat/spider/plasma
	meat_amount = 4
	emote_see = list("chitters.","rubs its legs.","vibrates.")
	armor_divisor = 3

/mob/living/carbon/superior/spider/plasma/UnarmedAttack(var/atom/A, var/proximity)
	. = ..()
	explosion(src.loc, 0,1,3)
	src.gib()

//fortress spiders are tanks, not any faster but can knock enemies down and take a few more hits.
/mob/living/carbon/superior/spider/fortress
	name = "fortress spider"
	desc = "Furry and black, it makes you shudder to look at it. This one is an absolute unit of chitin, armor, and chittering horror."
	icon_state = "tarantula"
	icon_living = "tarantula"
	maxHealth = 110 * SPIDER_HEALTH_MOD
	health = 110 * SPIDER_HEALTH_MOD
	melee_damage_lower = 20
	melee_damage_upper = 25
	emote_see = list("chitters.","rubs its legs.","thumps its many legs on the ground.")
	mob_size = MOB_LARGE
	armor = list(melee = 3, bullet = 1, energy = 0, bomb = 5, bio = 10, rad = 25, agony = 0)
	fancy_attack_overlay = "spider_attack_flick"

/mob/living/carbon/superior/spider/fortress/UnarmedAttack(var/atom/A, var/proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && !L.weakened && prob(15))
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			L.Weaken(3)
			L.visible_message(SPAN_DANGER("\the [src] knocks down \the [L]!"))

	. = ..()

/mob/living/carbon/superior/spider/fortress/attack_hand(mob/living/carbon/M as mob)
	..()
	var/mob/living/carbon/human/H = M

	switch(M.a_intent)
		if (I_HELP)
			help_shake_act(M)

		if (I_GRAB)
			if(!weakened && stat == CONSCIOUS)
				if(M.stats.getPerk(PERK_ASS_OF_CONCRETE) || M.stats.getPerk(PERK_BRAWN))
					return 1
				M.Weaken(3)
				visible_message(SPAN_WARNING("\red [src] breaks the grapple and uses its size to knock [M] over!"))
				return 1
			else
				if(M == src || anchored)
					return 0
				for(var/obj/item/grab/G in src.grabbed_by)
					if(G.assailant == M)
						to_chat(M, SPAN_NOTICE("You already grabbed [src]."))
						return

				var/obj/item/grab/G = new /obj/item/grab(M, src)
				if(buckled)
					to_chat(M, SPAN_NOTICE("You cannot grab [src], \he is buckled in!"))
				if(!G) //the grab will delete itself in New if affecting is anchored
					return

				M.put_in_active_hand(G)
				G.synch()
				LAssailant_weakref = WEAKREF(M)

				M.do_attack_animation(src)
				playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
				visible_message(SPAN_WARNING("[M] has grabbed [src] passively!"))

				return 1

		if (I_DISARM)
			if (!weakened && (prob(10 + (H.stats.getStat(STAT_ROB) * 0.1))))
				M.visible_message("\red [M] has knocked \the [src] over!")
				playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
				Weaken(3)

				return 1
			else if(!weakened && stat == CONSCIOUS)
				if(M.stats.getPerk(PERK_ASS_OF_CONCRETE) || M.stats.getPerk(PERK_BRAWN))
					return 1
				M.visible_message("\red [src] knocks [M] to the ground!")
				M.Weaken(3)
				playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)

			M.do_attack_animation(src)

		if (I_HURT)
			var/damage = 3
			if ((stat == CONSCIOUS) && prob(10))
				playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)
				M.visible_message("\red [M] missed \the [src]")
			else
				if (istype(H))
					damage += max(0, (H.stats.getStat(STAT_ROB) / 10))
					if (HULK in H.mutations)
						damage *= 2

				playsound(loc, "punch", 25, 1, -1)
				M.visible_message("\red [M] has punched \the [src]")

				adjustBruteLoss(damage)
				updatehealth()
				M.do_attack_animation(src)

				return 1

/mob/living/carbon/superior/spider/fortress/ogre
	name = "ogre spider"
	desc = "Furry and tan, it makes you shudder to look at it. An absolute unit of a spider with the same strength and durability of a fortress spider combined with the toxins and speed of a hunter."
	icon_state = "ogre"
	icon_living = "ogre"
	poison_per_bite = 4
	maxHealth = 130 * SPIDER_HEALTH_MOD
	health = 130 * SPIDER_HEALTH_MOD

/mob/living/carbon/superior/spider/fortress/pit
	name = "pit snapper spider"
	desc = "Furry and orange, it makes you shudder to look at it. Normally it lacks in toxins but makes up for in its immense bone-snapping mandibles. "
	icon_state = "pit"
	icon_living = "pit"
	poison_per_bite = 0
	melee_damage_lower = 35
	melee_damage_upper = 40
	poison_type = "aranecolmin" //Shockingly this is more deadly then normal as it makes metaball faster
	inherent_mutations = list(MUTATION_PUNCH)

/mob/living/carbon/superior/spider/fortress/burrowing
	name = "trapdoor spider"
	desc = "Furry and brown, it makes you shudder to look at it. Tough, durable, and strong. Unlike the usual strong-bodied spiders, this one carries sleep toxin in its deadly fangs."
	icon_state = "burrowing"
	icon_living = "burrowing"
	poison_type = "stoxin"
	maxHealth = 90 * SPIDER_HEALTH_MOD
	health = 90 * SPIDER_HEALTH_MOD
	fancy_attack_overlay = "spider_attack_flick" //Gets their own as these dont inject normally

/mob/living/carbon/superior/spider/fortress/emperor
	name = "emperor spider"
	desc = "Furry and black, it makes you shudder to look at it. This one is huge with long legs with hard chitin plates and glowing nightmarish eyes filled with malign hatred."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "spider_emperor"
	icon_living = "spider_emperor"
	maxHealth = 200 * SPIDER_HEALTH_MOD
	health = 200 * SPIDER_HEALTH_MOD
	move_to_delay = 1
	turns_per_move = 7
	viewRange = 9
	melee_damage_lower = 20
	melee_damage_upper = 30
	poison_per_bite = 4
	flash_resistances = 3 //For balance against are speedy fello
	poison_type = "party drops"
	meat_type = /obj/item/reagent_containers/snacks/meat/spider/emperor
	armor = list(melee = 6, bullet = 6, energy = 2, bomb = 25, bio = 10, rad = 25, agony = 0)
	armor_divisor = 2

	get_stat_modifier = TRUE //Were not getting armor //Yes we are.

	//Giving the emperor spider his own meat that has party drops. Reducing dropped meat to 3 from 4.
	meat_amount = 4 //So its more worth killing these
	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/emperor_silk_gland)
	emote_see = list("chitters.","rubs its legs.","chitters in something that sounds like speech.")
	mob_size = MOB_LARGE
	inherent_mutations = list(MUTATION_GIGANTISM, MUTATION_RAND_UNSTABLE, MUTATION_RAND_UNSTABLE, MUTATION_RAND_UNSTABLE)
	var/attack_build_up = 0

/mob/living/carbon/superior/spider/fortress/emperor/New()
	..()
	pixel_x = -16
	pixel_y = null

/mob/living/carbon/superior/spider/fortress/emperor/reaper_spider
	name = "reaper spider"
	desc = "Furry, white, and black, it makes you shudder to look at it. This one is a massive hulking leviathan capable of striking fear in even the most powerful and stalwart of men."
	icon_state = "terror_empress"
	icon_living = "terror_empress"
	maxHealth = 750 * LEVIATHAN_HEALTH_MOD
	health = 750 * LEVIATHAN_HEALTH_MOD
	move_to_delay = 2
	turns_per_move = 1
	melee_damage_lower = 40
	melee_damage_upper = 50
	flash_resistances = 100 //Many large eyes, flashing one doesn't blind the others
	poison_per_bite = 6
	poison_type = "stoxin"
	meat_type = /obj/item/reagent_containers/snacks/meat/spider/reaper_spider
	armor_divisor = 3

	get_stat_modifier = FALSE //Were not getting armor

/mob/living/carbon/superior/spider/fortress/emperor/reaper_spider/slip(var/slipped_on)
	return FALSE

/mob/living/carbon/superior/spider/fortress/emperor/reaper_spider/attack_hand(mob/living/carbon/M as mob)
	..()
	var/mob/living/carbon/human/H = M

	switch(M.a_intent)
		if (I_HELP)
			help_shake_act(M)

		if (I_GRAB)
			if(!weakened && stat == CONSCIOUS)
				M.adjustBruteLoss(25)
				M.adjustBruteLoss(25)
				M.adjustBruteLoss(25)
				M.adjustBruteLoss(25)
				M.adjustBruteLoss(25)
				M.adjustBruteLoss(25)
				M.adjustBruteLoss(25)
				M.adjustBruteLoss(25)
				M.adjustOxyLoss(25)
				M.Weaken(5)
				visible_message(SPAN_WARNING("\red [src] immediately crushes [M] with its titan bulk when they stupidly try to grab it!"))
				return 1
			else
				if(M == src || anchored)
					return 0
				for(var/obj/item/grab/G in src.grabbed_by)
					if(G.assailant == M)
						to_chat(M, SPAN_NOTICE("You already grabbed [src]."))
						return

				var/obj/item/grab/G = new /obj/item/grab(M, src)
				if(buckled)
					to_chat(M, SPAN_NOTICE("You cannot grab [src], \he is buckled in!"))
				if(!G) //the grab will delete itself in New if affecting is anchored
					return

				M.put_in_active_hand(G)
				G.synch()
				LAssailant_weakref = WEAKREF(M)

				M.do_attack_animation(src)
				playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
				visible_message(SPAN_WARNING("[M] has grabbed [src] passively!"))

				return 1

		if (I_DISARM)
			if(!weakened && stat == CONSCIOUS)
				M.visible_message("\red [src] hammers [M] to the ground!")
				M.Weaken(5)
				M.adjustBruteLoss(50)
				playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)

			M.do_attack_animation(src)

		if (I_HURT)
			var/damage = 3
			if ((stat == CONSCIOUS) && prob(10))
				playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)
				M.visible_message("\red [M] missed \the [src]")
			else
				if (istype(H))
					damage += max(0, (H.stats.getStat(STAT_ROB) / 10))
					if (HULK in H.mutations)
						damage *= 2

				playsound(loc, "punch", 25, 1, -1)
				M.visible_message("\red [M] has punched \the [src]")

				adjustBruteLoss(damage)
				updatehealth()
				M.do_attack_animation(src)

				return 1
