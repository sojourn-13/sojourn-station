// Beefier variant of the golem
/mob/living/carbon/superior/ameridian_golem/titan
	name = "ameridian titan"
	desc = "An incredible mass of rolling sheet rock and razor sharp amerdiain fragments, it shambles about as red Ameridian crystals glow and crack loudly around it"
	icon = 'icons/obj/ameridian_titan.dmi'
	icon_state = "golem_ameridian_titan" // Sprite from Eris, I don't know who made them. -R4d6
	health = 200 * AMGOLEM_HEALTH_MOD //2025-G: These values should be var edit during event formula ((amount of spires in local area) multiplied by (10000 HP)); with each spire being destroyed removing 10000 HP value
	maxHealth = 92520
	melee_damage_lower = 40
	melee_damage_upper = 50
	move_to_delay = 20 // 2025-G: We want our Titan very slow
	turns_per_move = 5
	light_range = 10
	light_color = COLOR_LIGHTING_RED_BRIGHT
	armor = list(melee = 20, bullet = 3, energy = 7, bomb = 40, bio = 100, rad = 100) //We want to be gunned down, not lasered 2025-G: Anti-Church Melee
	ranged = TRUE
	rapid = TRUE
	projectiletype = /obj/item/projectile/ameridian_shard/golem
	drop_amount = 13
	size_factor = 1

	mob_ablative_armor = 10
	ablative_retaining = ABLATION_STANDARD

/mob/living/carbon/superior/ameridian_golem/titan/attack_hand(mob/living/carbon/M as mob)
	if(M.a_intent == I_GRAB || M.a_intent == I_DISARM)
		visible_message(SPAN_WARNING("[src] punch [M] when \he stupidly try to grab it!"))
		UnarmedAttack(M, 1)
		var/throwdir = get_dir(src, M)
		M.throw_at(get_edge_target_turf(M, throwdir), rand(3,6), 30)
	else
		..()
