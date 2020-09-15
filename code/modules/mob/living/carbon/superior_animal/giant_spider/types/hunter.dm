//hunters have the most poison and move the fastest, so they can find prey
/mob/living/carbon/superior_animal/giant_spider/hunter
	name = "hunter spider"
	desc = "Furry and black, it makes you shudder to look at it. This one has sparkling purple eyes."
	icon_state = "hunter"
	icon_living = "hunter"
	maxHealth = 90
	health = 90
	melee_damage_lower = 10
	melee_damage_upper = 20
	poison_per_bite = 4
	move_to_delay = 4
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/spider/hunter
	meat_amount = 4
	emote_see = list("chitters.","rubs its legs.","bounces in place.")

/mob/living/carbon/superior_animal/giant_spider/hunter/cloaker
	name = "cloaker spider"
	desc = "Furry and black, it makes you shudder to look at it. This one has a chameleonic chitin that makes it hard to see."
	alpha = 50

/mob/living/carbon/superior_animal/giant_spider/hunter/cloaker/death() //We are now unable to chameleonic chitin do to being dead
	..()
	alpha = 255

/mob/living/carbon/superior_animal/giant_spider/hunter/viper
	name = "viper spider"
	desc = "Furry and black, it makes you shudder to look at it. This one has sparkling purple eyes and a large red splotch on its abdomen."
	icon_state = "viper"
	icon_living = "viper"
	maxHealth = 140
	health = 140
	melee_damage_lower = 20
	melee_damage_upper = 25

/mob/living/carbon/superior_animal/giant_spider/tarantula
	name = "fortress spider"
	desc = "Furry and black, it makes you shudder to look at it. This one is an absolute unit of chitin, armor, and chittering horror."
	icon_state = "tarantula"
	icon_living = "tarantula"
	maxHealth = 300
	health = 300
	melee_damage_lower = 20
	melee_damage_upper = 25
	emote_see = list("chitters.","rubs its legs.","thumps its many legs on the ground.")
	mob_size = MOB_LARGE

/mob/living/carbon/superior_animal/giant_spider/tarantula/UnarmedAttack(var/atom/A, var/proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && L.reagents)
			L.reagents.add_reagent(poison_type, poison_per_bite)

		if(istype(L) && !L.weakened && prob(15))
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE))
				return
			L.Weaken(3)
			L.visible_message(SPAN_DANGER("\the [src] knocks down \the [L]!"))

	. = ..()

/mob/living/carbon/superior_animal/giant_spider/tarantula/emperor
	name = "emperor spider"
	desc = "Furry and black, it makes you shudder to look at it. This one is huge with long legs and glowing nightmarish eyes filled with malign hatred."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "spider_emperor"
	icon_living = "spider_emperor"
	maxHealth = 500
	health = 500
	move_to_delay = 1
	turns_per_move = 9
	viewRange = 12
	melee_damage_lower = 20
	melee_damage_upper = 30
	poison_per_bite = 4
	poison_type = "party drops"
	emote_see = list("chitters.","rubs its legs.","chitters in something that sounds like speech.")
	mob_size = MOB_LARGE

/mob/living/carbon/superior_animal/giant_spider/tarantula/emperor/New()
	..()
	pixel_x = -16
	pixel_y = null