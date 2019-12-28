/mob/living/simple_animal/hostile/jelly
	name = "jelly blob"
	desc = "Some sort of undulating blob of slime."
	icon = 'icons/mob/mobs-monster.dmi'
	icon_state = "jelly"
	icon_dead = "jelly_dead"
	faction = "virgo2"
	maxHealth = 50
	health = 50
	melee_damage_lower = 5
	melee_damage_upper = 15
	speak_chance = 2
	emote_hear = list("squishes","spluts","splorts","sqrshes","makes slime noises")
	emote_see = list("undulates quietly")

/mob/living/simple_animal/hostile/jelly/bloat
	name = "jelly bloat"
	desc = "Some sort of undulating blob of slime. This one has feasted recently."
	icon_state = "jellybig"
	icon_dead = "jelly_dead"
	faction = "virgo2"
	maxHealth = 80
	health = 80
	melee_damage_lower = 5
	melee_damage_upper = 15
	speak_chance = 2
	emote_hear = list("squishes","spluts","splorts","sqrshes","digests","makes slime noises")
	emote_see = list("undulates quietly")