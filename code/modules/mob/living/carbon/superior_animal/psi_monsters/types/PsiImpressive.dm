/mob/living/carbon/superior/psi/flesh_behemoth
	name = "flesh behemoth"
	desc = "Hunger, hunger for meat. Meat meat meat. It comes, impossibly strong and looking to devour everything in its path, a wicked blade of bone ready to slice you apart. Its ability to regenerate \
	from even the most disgusting wounds requires you to bring light to stall its power."
	icon_state = "vargo"
	icon_living = "vargo"

	maxHealth = 800 * PSIMOB_HEALTH_MOD
	health = 800 * PSIMOB_HEALTH_MOD
	attack_sound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	melee_damage_lower = 30
	melee_damage_upper = 40
	emote_see = list("drags a blackened tongue along its arm blade.", "chuckles, \"I'll bring slaughter to the lambs!\"", "mumbles, \"This edge is nice and sharp.\"")
	turns_per_move = 3
	healing_factor = 50
	attacktext = "carved"
	death_present = TRUE
	death_spawn_gift = /obj/random/cluster/psi_monster/maggot_death_gasp
	death_gasp = "<b><font size='3px'>The flesh behemoth heaves as its body crumbles, wriggling pus maggots bursting from its failing rotted bulk!</font></b>!"
	drop_items = list(/obj/random/psi/always_spawn, /obj/random/psi/always_spawn)
	momento_mori = /obj/effect/decal/cleanable/psi_ash/flesh_behemoth
	armor_divisor = 1
	research_value = 8000

/mob/living/carbon/superior/psi/mind_gazer
	name = "mind gazer"
	desc = "One of the most twisted creatures in this other world, its origin unknown, but its nightmarish speed and strength are to be greatly feared."
	icon_state = "eelo"
	icon_living = "eelo"

	maxHealth = 400 * PSIMOB_HEALTH_MOD
	health = 400 * PSIMOB_HEALTH_MOD
	melee_damage_lower = 25
	melee_damage_upper = 30
	emote_see = list("whirls about, its massive singular eye spasming,", "suddenly halts, its singular pupil dilating!", "whistles a small tune...")
	turns_per_move = 8
	healing_factor = 10
	attacktext = "rammed"
	drop_items = list(/obj/random/psi/always_spawn, /obj/random/psi/always_spawn)
	armor_divisor = 1.2
	leach_on_odds = 30
	can_leach = TRUE
	steal_odds = 15
	stat_to_steal = STAT_VIG
	steal_amount = -4
	research_value = 6500

/mob/living/carbon/superior/psi/pus_maggot/ash_wendigo
	name = "ash wendigo"
	desc = "Rage given form, agonized and seeking to punish others for its fate. With skull wreathed in fire, it comes for you."
	icon_state = "guardA"
	icon_living = "guardA"

	maxHealth = 600 * PSIMOB_HEALTH_MOD
	health = 600 * PSIMOB_HEALTH_MOD
	melee_damage_lower = 25
	melee_damage_upper = 30
	emote_see = list("crackles and pops as its head burns!", "looses a haunting scream!", "claws at its head, trying to put out the flames!")
	burn_attack_text = "The ash wendigo wreathes its claws in fire before striking!"
	burn_attack_sound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	healing_factor = 0 // Head is a source of light.
	light_range = 4 // Makes it harder for other psi monsters to regen. Because rage.
	chameleon_skill = 155 // Has a harder time cloaking given its natural light.
	light_color = COLOR_LIGHTING_RED_BRIGHT
	attacktext = "clawed"
	drop_items = list(/obj/random/psi/always_spawn, /obj/random/psi/always_spawn)
	armor_divisor = 1.5
	research_value = 7200

/mob/living/carbon/superior/psi/cerebral_crusher
	name = "cerebral crusher"
	desc = "A hulking creature of bone, powerful and ponderous in its strength, its claws are coated in toxins that weaken the mind, its touch draining and its ability to rend flesh, murderous."
	icon_state = "farartbot"
	icon_living = "farartbot"
	life_cycles_before_sleep = 60
	maxHealth = 800 * PSIMOB_HEALTH_MOD
	health = 800 * PSIMOB_HEALTH_MOD
	attack_sound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	melee_damage_lower = 30
	melee_damage_upper = 40
	emote_see = list("scratches at its bone plates.", "moans, \"We hear your thoughts, we feel your fear.\"", "groans, \"Kill us! End this nightmare!\"")
	turns_per_move = 4
	poison_per_bite = 2
	healing_factor = 10
	attacktext = "slammed"
	drop_items = list(/obj/random/psi/always_spawn, /obj/random/psi/always_spawn)
	armor_divisor = 1.3
	research_value = 8500

/mob/living/carbon/superior/psi/wasonce/crimson_jelly
	name = "crimson jelly"
	desc = "A genetic abomination left to rot, midway through the transformation into something far worse. The end result of horrible creatures left to gestate instead of being properly purged. \
	It hungers for form and its body may spread its genetic instability, but at least through it, has weakened over time."
	icon = 'icons/mob/psi_monsters.dmi'
	icon_state = "oormat"
	icon_living = "oormat"

	maxHealth = 800 * PSIMOB_HEALTH_MOD
	health = 800 * PSIMOB_HEALTH_MOD
	chameleon_skill = 10
	healing_factor = 10
	pixel_x = 0
	pixel_y =0
	default_pixel_x = 0
	default_pixel_y = 0
	size_pixel_offset_x = 0
	real_mutator = TRUE
	lethal_to_captive = TRUE //We kill are captives
	knockdown_odds = 15
	armor = list(melee = 5, bullet = 2, energy = 1, bomb = 30, bio = 100, rad = 100)
	drop_items = list(/obj/random/psi/always_spawn, /obj/random/psi/weapons/always_spawn)
	armor_divisor = 2.3
	research_value = 9000

/mob/living/carbon/superior/psi/wasonce/crimson_jelly/pitch_horror
	name = "pitch horror"
	desc = "Left to fester, to grow, to mutate into a terrible thing of eyes and teeth. What never should have been, twisted into something unbearable to the minds of men. It comes and brings \
	mutating horror in its wake. Only the light may halt its unnatural regeneration."
	icon = 'icons/mob/psi_monsters.dmi'
	icon_state = "hyper"
	icon_living = "hyper"
	maxHealth = 1250 * PSIMOB_HEALTH_MOD
	health = 1250 * PSIMOB_HEALTH_MOD
	knockdown_odds = 30
	drop_items = list(/obj/random/psi/always_spawn, /obj/random/psi/weapons/always_spawn, /obj/random/psi/always_spawn, /obj/random/psi/weapons/always_spawn)
	armor_divisor = 4
	research_value = 12000

// King's Court. Special named psi mobs with better stats and custom voice lines, they are spawned whenever the king of the hound journey.
/mob/living/carbon/superior/psi/flesh_behemoth/baron
	name = "Baron Wormwood"
	desc = "He sings for meat, for piles and piles of flesh heaped onto a rotting table for his greedy maw to consume all manner of ripened offal."
	emote_see = list("chuckles lowly, split bleeding lips cracking into a pleased leer.", "murmurs, \"So troubling, so troubling, more gore for the pile but they bring so many toys...\"", "snorts, \"Too many butchers, not enough bakers.\"")
	death_gasp = "<b><font size='3px'>Baron Wormwood heaves as his body crumbles, wriggling pus maggots bursting from its failing rotted bulk!</font></b>!"
	research_value = 9500

/mob/living/carbon/superior/psi/mind_gazer/viscount
	name = "Viscount Mannimarcus"
	desc = "His all seeing eye has let its gaze fall upon you."
	emote_see = list("chitters in song.", "rasps, \"I told the King they would come, but his arrogance led to nothing being done.\"", "sighs wearily, \"We must be ever vigil.\"")
	research_value = 8000

/mob/living/carbon/superior/psi/pus_maggot/ash_wendigo/duke
	name = "Duke Ravencroft"
	desc = "He comes to protect his king. Is it out of loyalty or simply the chance to kill?"
	emote_see = list("growls quietly.", "hisses, \"The King is dead, long live the King.\"", "yells, \"Ashes! Ashes and dust, all of you!\"")
	research_value = 8500

/mob/living/carbon/superior/psi/cerebral_crusher/marshal
	name = "Marshal Benedictus"
	desc = "He shall pry your secrets from your flesh and slice your mind to colorful bloodied ribbons."
	emote_see = list("knocks a closed fist on his bone plates.", "mutters, \"They call themselves marshals, yet with no court? Hmph!\"", "grinds his knuckles along the ground, \"Not a loss, not a loss at all.\"")
	research_value = 10000

/mob/living/carbon/superior/psi/wasonce/crimson_jelly/jester
	name = "Red Jester Thomas"
	desc = "He laughed, even at the end."
	emote_see = list("laughs in a chorus of voices!", "giggles madly!", "howls with laughter!")
	research_value = 10500

/mob/living/carbon/superior/psi/wasonce/crimson_jelly/pitch_horror/steward
	name = "Steward Kerevork"
	desc = "Enslavement."
	emote_see = list("moans, \"There was no escape.\"", "sighs, \"I have no regrets, I went with a clear conscience.\"", "groans, \"If only we could have forseen this.\"")
	research_value = 14000

/mob/living/carbon/superior/psi/licker/pack
	name = "pack runners"
	desc = "The hound of the crown's pack, loyal and deadly, they've learned to meld into each other, weaving themselves like smoke between the hound and you. Even the Hound has his servants."
	density = FALSE
	research_value = 3500
