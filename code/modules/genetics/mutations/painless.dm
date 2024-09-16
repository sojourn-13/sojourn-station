/datum/genetics/mutation/painless
	name = "Painless"
	key = "MUTATION_NO_PAIN"
	desc = "You no longer feel pain."
	gain_text = "Your sensation of pain fades completely."
	var/existed_prior = FALSE

/datum/genetics/mutation/painless/onMobImplant()
	if(!istype(container.holder,/mob/living/carbon))
		return
	var/mob/living/carbon/target = container.holder
	if(!(target.species.flags & NO_PAIN))
		target.species.flags |= NO_PAIN
	else
		existed_prior = TRUE

/datum/genetics/mutation/painless/onMobRemove()
	if(!istype(container.holder,/mob/living/carbon))
		return
	if(existed_prior)
		return
	var/mob/living/carbon/target = container.holder
	target.species.flags &= ~NO_PAIN
