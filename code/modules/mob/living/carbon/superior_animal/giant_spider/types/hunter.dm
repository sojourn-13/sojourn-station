//hunters have the most poison and move the fastest, so they can find prey
/mob/living/carbon/superior_animal/giant_spider/hunter
	desc = "Furry and black, it makes you shudder to look at it. This one has sparkling purple eyes."
	icon_state = "hunter"
	icon_living = "hunter"
	maxHealth = 90
	health = 90
	melee_damage_lower = 10
	melee_damage_upper = 20
	poison_per_bite = 5
	move_to_delay = 4
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/spider/hunter
	meat_amount = 4

/mob/living/carbon/superior_animal/giant_spider/hunter/cloaker
	desc = "Furry and black, it makes you shudder to look at it. This one has a chameleonic chitin that makes it hard to see."
	alpha = 50

/mob/living/carbon/superior_animal/giant_spider/hunter/viper
	desc = "Furry and black, it makes you shudder to look at it. This one has sparkling purple eyes and a large red splotch on its abdomen."
	icon_state = "viper"
	icon_living = "viper"
	maxHealth = 140
	health = 140
	melee_damage_lower = 20
	melee_damage_upper = 25

/mob/living/carbon/superior_animal/giant_spider/tarantula
	desc = "Furry and black, it makes you shudder to look at it. This one is an absolute unit of chitin, armor, and chittering horror."
	icon_state = "tarantula"
	icon_living = "tarantula"
	maxHealth = 300
	health = 300
	melee_damage_lower = 20
	melee_damage_upper = 25