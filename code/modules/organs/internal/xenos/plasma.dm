/obj/item/organ/internal/xenos/plasmavessel
	name = "plasma vessel"
	parent_organ = BP_CHEST
	icon_state = "xgibdown1"
	organ_tag = BP_PLASMA
	var/stored_plasma = 0
	var/max_plasma = 500
	owner_verbs = list(/mob/living/carbon/human/proc/transfer_plasma)

/mob/living/carbon/human/proc/transfer_plasma(mob/living/carbon/human/M as mob in oview(1, src))
	set name = "Transfer Plasma"
	set desc = "Transfer Plasma to another alien"
	set category = "Abilities"

	var/obj/item/organ/internal/xenos/plasmavessel/organ = first_organ_by_type(/obj/item/organ/internal/xenos/plasmavessel)
	if(!organ)
		return

	if (get_dist(src, M) > 1)
		to_chat(src, "<span class='alium'>You need to be closer.</span>")
		return

	var/amount = input(src, "Amount:", "Transfer Plasma to [M]") as num
	if (amount)
		amount = abs(round(amount))
		if(organ.check_alien_ability(amount))
			M.gain_plasma(amount)
			to_chat(M, "<span class='alium'>[src] has transfered [amount] plasma to you.</span>")
			to_chat(src, "<span class='alium'>You have transferred [amount] plasma to [M].</span>")


/obj/item/organ/internal/xenos/plasmavessel/queen
	name = "bloated plasma vessel"
	stored_plasma = 200
	max_plasma = 500

/obj/item/organ/internal/xenos/plasmavessel/sentinel
	stored_plasma = 100
	max_plasma = 250

/obj/item/organ/internal/xenos/plasmavessel/hunter
	name = "tiny plasma vessel"
	stored_plasma = 100
	max_plasma = 150
	owner_verbs = null //Can't transfer plasma

/obj/item/organ/internal/xenos/plasmavessel/drone
	owner_verbs = list(
		/mob/living/carbon/human/proc/transfer_plasma,
		/mob/living/carbon/human/proc/alien_evolve
	)


/mob/living/carbon/human/proc/alien_evolve()
	set name = "Evolve (500)"
	set desc = "Produce an interal egg sac capable of spawning children. Only one queen can exist at a time."
	set category = "Abilities"

	var/obj/item/organ/internal/xenos/plasmavessel/drone/organ = first_organ_by_type(/obj/item/organ/internal/xenos/plasmavessel/drone)
	if(!organ)
		return

	if(alien_queen_exists())
		to_chat(owner, SPAN_NOTICE("We already have an active queen."))
		return

	if(organ.check_alien_ability(500))
		visible_message(
			"<span class='alium'><B>[src] begins to twist and contort!</B></span>",
			"<span class='alium'>You begin to evolve!</span>"
		)
		set_species("Xenomorph Queen")
