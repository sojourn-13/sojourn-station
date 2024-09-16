/mob/living/carbon/superior_animal/xenomorph/sentinel
	name = "sentinel"
	desc = "A basic xenomorph sentinel, slightly tougher than a drone but not by much."
	icon_state = "sentinal"
	icon_living = "sentinal"
	icon_dead = "sentinal_dead"
	icon_rest = "sentinal_stunned"

	maxHealth = 40
	health = 40

/mob/living/carbon/superior_animal/xenomorph/hunter
	name = "hunter"
	desc = "A basic xenomorph hunter, slightly faster than a drone but not by much."
	icon_state = "hunter"
	icon_living = "hunter"
	icon_dead = "hunter_dead"
	icon_rest = "hunter_stunned"
	icon_gib = "hunter_gibbed"

	turns_per_move = 18

/mob/living/carbon/superior_animal/xenomorph/runner
	name = "runner"
	desc = "A basic xenomorph runner, the weakest of all xenomorphs but quite fast."
	icon = 'icons/mob/Xenos_2x2.dmi'
	icon_state = "runner"
	icon_living = "runner"
	icon_dead = "runner_dead"
	icon_rest = "runner_stunned"
	icon_gib = "runner_gibbed"

	maxHealth = 15
	health = 15
	move_to_delay = 2
	turns_per_move = 12

/mob/living/carbon/superior_animal/xenomorph/runner/panther
	name = "panther"
	desc = "A basic xenomorph panther, the weakest of all xenomorphs but quite fast and with sharper claws than a runner."
	icon = 'icons/mob/Xenos_2x2.dmi'
	icon_state = "panther"
	icon_living = "panther"
	icon_dead = "panther_dead"
	icon_rest = "panther_stunned"

	melee_damage_lower = 15
	melee_damage_upper = 20

/mob/living/carbon/superior_animal/xenomorph/spitter
	name = "spitter"
	desc = "A basic xenomorph spitter, has a habit of vomiting toxic gunk on those it manages to get within clawing distance."
	icon_state = "spitter"
	icon_living = "spitter"
	icon_dead = "spitter_dead"
	icon_rest = "spitter_stunned"

	melee_damage_lower = 5
	melee_damage_upper = 7