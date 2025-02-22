/mob/living/carbon/superior/psi/dreaming_king
	name = "Dreaming King"
	desc = "The Dreaming King, named by the first psion who saw it through a drug induced haze. Thought first to be merely the creation of a fever dream until sojourns into deep maintenance revealed him \
	to be a nightmare come to life. Only one may live at any one time, the king of the other world roams deep maintenance and woe to anyone that would try to take his crown."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "crab3"
	icon_living = "crab3"

	maxHealth = 1400 * PSIBOSS_HEALTH_MOD
	health = 1400 * PSIBOSS_HEALTH_MOD
	attack_sound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	melee_damage_lower = 50
	melee_damage_upper = 60
	attacktext = "delivered a devastating blow to"
	emote_see = list("smears its sticky claws along its shoulders.", "bellows in a low voice, \"Render unto the king all which you have.\"", "intones, \"Kneel before the crown.\"", \
	"repeats in a different voice, \"He's completely insane. You see that, right? No care for the rules.\"", "speaks loudly, \"We meet again. Farewell.\"", "yells loudly, \"A taste of your former glory!\"")
	healing_factor = 0
	pixel_x = -16
	pixel_y = 0
	default_pixel_x = -16
	default_pixel_y = 0
	size_pixel_offset_x = -16
	armor_divisor = 4
	momento_mori = /obj/effect/decal/cleanable/psi_ash/king
	first_teleport_callout = "<b><font size='3px'>\the Dreaming King looses a terrible scream before journeying to nowhere, his words bellowing in rage, \"Only the king may wear the crown!\" The answering calls of his court echoing through the realm!</font></b>"
	second_teleport_callout = "<b><font size='3px'>\the Dreaming King looses an agonized howl before journeying to nowhere, his words bellowing in rage, \"I will never die!\" The strongest of his court heard affirming his call!</font></b>"
	var/dreaming_king = TRUE
	var/hound_of_the_crown = FALSE
	drop_items = list(/obj/random/psi/always_spawn, /obj/random/psi/always_spawn, /obj/random/psi/always_spawn, /obj/random/psi/always_spawn, /obj/random/psi/always_spawn, /obj/random/psi/always_spawn, /obj/random/psi/always_spawn, /obj/random/psi/always_spawn)
	fast_respawn = 1 MINUTES
	slow_respawn = 3 MINUTES
	respawn_mob_type = /obj/random/cluster/psi_monster
	affects_chaos = TRUE

/mob/living/carbon/superior/psi/dreaming_king/hound_crown
	name = "Hound of the Crown"
	desc = "The faithful hound of the dreaming king, a terrible and nightmarish outsider that pursues intruders into the king's realm. At the behest of the king's decree, it has adapted to render psions \
	into powerless nulls. After all, they are the most common thieves in this other wordly realm."
	icon_state = "bigred"
	icon_living = "bigred"
	emote_see = list("looses a ground shaking growl.", "sniffs the air, its jaw opening and closing as black drool seeps from its teeth.", "suddenly howls!", "spasms slightly, shivering from jaw to tail.", \
	"growls lowly, \"Live. Die. Serve. Live. Die. Serve.\"", "growls lowly, \"The flesh cries out for more...\"", "growls lowly, \"At your side.\"")
	poison_per_bite = 5
	turns_per_move = 12
	momento_mori = /obj/effect/decal/cleanable/psi_ash/hound
	first_teleport_callout = "<b><font size='3px'>\the Hound of the Crown looses a terrible scream before journeying to nowhere, the thing screaming in pure blackened hate! Distant howls can be heard echoing through the halls in answer!</font></b>"
	second_teleport_callout = "<b><font size='3px'>\the Hound of the Crown looses an agonized howl before journeying to nowhere, its words echoing, \"Nobody stands before the king!\" Nearby howls can be heard echoing through the halls in answer!</font></b>"
	dreaming_king = FALSE
	hound_of_the_crown = TRUE
	fast_respawn = 1 MINUTES
	slow_respawn = 3 MINUTES
	respawn_mob_type = /obj/random/cluster/psi_monster
	affects_chaos = TRUE

/obj/random/psi_megafauna
	name = "random calamity"
	icon_state = "ammo-green"

/obj/random/psi_megafauna/item_to_spawn()
	return pick_n_take(psi_mega_fauna)
