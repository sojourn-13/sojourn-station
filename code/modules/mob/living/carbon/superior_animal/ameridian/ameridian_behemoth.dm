// Beefier variant of the golem
/mob/living/carbon/superior/ameridian_golem/behemoth
	name = "ameridian behemoth"
	desc = "A weird creature made of ameridian. It is bigger, stronger and pack a harder punch than its brethen."
	icon_state = "golem_ameridian_purple"
	health = 200 * AMGOLEM_HEALTH_MOD
	maxHealth = 200 * AMGOLEM_HEALTH_MOD
	melee_damage_lower = 40
	melee_damage_upper = 50
	move_to_delay = 5
	armor = list(melee = 7, bullet = 3, energy = 7, bomb = 40, bio = 100, rad = 100) //We want to be gunned down, not lasered
	drop_amount = 3
	size_factor = 1.25 // 25% bigger

	mob_ablative_armor = 10
	ablative_retaining = ABLATION_STANDARD
	research_value = 2000

/mob/living/carbon/superior/ameridian_golem/behemoth/attack_hand(mob/living/carbon/M as mob)
	if(M.a_intent == I_GRAB || M.a_intent == I_DISARM)
		visible_message(SPAN_WARNING("[src] punch [M] when \he stupidly try to grab it!"))
		UnarmedAttack(M, 1)
		var/throwdir = get_dir(src, M)
		M.throw_at(get_edge_target_turf(M, throwdir), rand(3,6), 30)
	else
		..()
