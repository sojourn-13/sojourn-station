/datum/perk/splicer
	name = "Splicer"
	desc = "Your genes are heavily modified already, your base genetic instability is 20%, even if you don't have any mutations."
	icon_state = "splicer"
	gain_text = "Your body is modified enough already; pushing it further might be bad."

//Genetics is made reliably enough that simply increasing total instability, a dynamically changing value, will be permanent until removed.
/datum/perk/splicer/assign(mob/living/L)
	..()
	holder.unnatural_mutations.total_instability += 20

/datum/perk/splicer/remove()
	holder.unnatural_mutations.total_instability -= 20
	..()

////////////////////
//Glutten Perk(s) //
////////////////////

//Yes this is a genetic perk
/datum/perk/glutten
	name = "Glutten"
	desc = "Your hunger has been enhanced by a beast who wishes to eat everything, your body is one with the flesh it consumes. <br>\
	When eating raw meats and offal your hunger will try and assimulate the powers of the beast. <br>\
	If you already have that power it will weaken the instablity of splicing so much DNA into yourself to a point. <br>\
	If you are unable to further enhance the splice eating raw meat will heal blood, and burns."
	icon_state = "glutten"
	gain_text = "The world has perpared me a vast banquent, i'd be a fool to not partake."
	lose_text = "All things in moderation, all things in balance..."
	active = FALSE
	passivePerk = FALSE
	var/user_is_choosing = FALSE

/datum/perk/glutten/assign()
	..()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.unnatural_mutations.allowed_instability_was += DESTABILIZE_LEVEL_WAS * 0.5
		H.unnatural_mutations.allowed_instability_clone += DESTABILIZE_LEVEL_CLONE_DAMAGE * 0.5
		H.unnatural_mutations.allowed_instability_base += DESTABILIZE_LEVEL_BASE * 0.5

/datum/perk/glutten/remove()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.unnatural_mutations.allowed_instability_was -= DESTABILIZE_LEVEL_WAS * 0.5
		H.unnatural_mutations.allowed_instability_clone -= DESTABILIZE_LEVEL_CLONE_DAMAGE * 0.5
		H.unnatural_mutations.allowed_instability_base -= DESTABILIZE_LEVEL_BASE * 0.5

	..()

/datum/perk/glutten/activate()
	if(!ishuman(holder))
		return ..()

	var/mob/living/carbon/human/H = holder


	if(world.time < cooldown_time || user_is_choosing)
		to_chat(usr, SPAN_NOTICE("You need more time before you can suppress a genetic power."))
		return FALSE

	if (H.unnatural_mutations.mutation_pool.len == 0)
		to_chat(usr, "You dont have any mutations to controle")
		return

	user_is_choosing = TRUE


	var/action = alert(H, "Toggle Or Remove a Gene?", "Mutation Suppression", "Toggle Gene", "Remove Gene", "Cancel")

	if(action == "Cancel")
		user_is_choosing = FALSE
		return

	var/datum/genetics/mutation/mutations_found = input("What Mutation do you want to [action]?") as null|anything in H.unnatural_mutations.mutation_pool
	var/datum/genetics/mutation/HIM = H.unnatural_mutations.getMutation(mutations_found.key)

	if(!mutations_found)
		return

	user_is_choosing = FALSE

	if(QDELETED(H))
		to_chat(usr, "You dont exist anymore.")
		return

	if(action == "Toggle Gene")
		if(HIM.active)
			HIM.deactivate()
			HIM.haltProcessing()
			if(H.stats.getPerk(PERK_NO_OBFUSCATION))
				to_chat(usr, SPAN_NOTICE("You suppress [HIM], deactiving it."))
		else
			HIM.activate(TRUE) //Deactivate other conflicting ones
			HIM.initializeProcessing()
			if(H.stats.getPerk(PERK_NO_OBFUSCATION))
				if(HIM.active)
					to_chat(usr, SPAN_NOTICE("You allow [HIM] to function."))
				else
					to_chat(usr, SPAN_NOTICE("You try and allow [HIM] to be active but it fails..."))

		cooldown_time = world.time + 3 MINUTES //Its quick but not spamable
		log_and_message_admins("used their [src] perk on [HIM] (toggled to [HIM.active]).")

	if(action == "Remove Gene")
		if(HIM.active)
			HIM.deactivate()
			HIM.haltProcessing()
			if(H.stats.getPerk(PERK_NO_OBFUSCATION))
				to_chat(usr, SPAN_NOTICE("You suppress [HIM], deactiving it before its removal."))
		if(H.stats.getPerk(PERK_NO_OBFUSCATION))
			to_chat(usr, SPAN_NOTICE("You remove [HIM] from your body, stablizing you by [HIM.instability]."))


		H.unnatural_mutations.removeMutation(HIM)

		log_and_message_admins("used their [src] perk on [HIM] (to remove gene).")
		cooldown_time = world.time + 5 MINUTES //Its quick but not spamable

	return ..()