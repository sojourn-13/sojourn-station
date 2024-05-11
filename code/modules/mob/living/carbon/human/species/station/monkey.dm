/datum/species/monkey
	name = "Monkey"
	name_plural = "Monkeys"
	blurb = "Ook."

	default_form = FORM_MONKEY

	language = null
	default_language = LANGUAGE_MONKEY
	mob_size = MOB_SMALL
	has_fine_manipulation = 0
	show_ssd = null

	unarmed_types = list(/datum/unarmed_attack/bite, /datum/unarmed_attack/claws)
	inherent_verbs = list(/mob/living/proc/ventcrawl, /mob/living/proc/hide)
	hud_type = /datum/hud_data/monkey

	rarity_value = 0.1
	total_health = 75
	brute_mod = 1.5
	burn_mod = 1.5
	lower_sanity_process = TRUE

	spawn_flags = IS_RESTRICTED

	bump_flag = MONKEY
	swap_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	push_flags = MONKEY|SLIME|SIMPLE_ANIMAL|ALIEN

	pass_flags = PASSTABLE
	holder_type = /obj/item/holder
/datum/species/monkey/handle_npc(var/mob/living/carbon/human/H)
	if(H.stat != CONSCIOUS)
		return
	if(prob(33) && H.canmove && isturf(H.loc) && !H.pulledby) //won't move if being pulled
		step(H, pick(cardinal))
	if(prob(1))
		H.emote(pick("scratch","jump","roll","tail"))

/datum/species/monkey/get_random_name()
	return "[lowertext(name)] ([rand(100,999)])"
