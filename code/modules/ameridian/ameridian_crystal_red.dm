// This variant only spread more red crystals, grow slower, and give more crystals on harvest
/obj/structure/ameridian_crystal/red
	name = "red ameridian crystal"
	desc = "A strange crystal formation that seems to grow on its own... However it seems to grow slower than the others."
	icon_state = "ameridian_crystal_red"
	growth_prob = 1
	blue_crystal_prob = -1
	rad_damage = 1
	max_growth = 10 // Take longer to grow, but give twice as many crystals

/obj/structure/ameridian_crystal/red/examine(mob/user)
	..()
	if(user.stats?.getPerk(PERK_PSION)) // Are we a psion and is there something to see?
		to_chat(user, SPAN_PSION("You somehow know that this crystal will only spread more of itself."))
