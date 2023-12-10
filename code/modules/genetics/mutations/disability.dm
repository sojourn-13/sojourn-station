//Macro: placeholder mutation, should not exist
//Disabilities crib off of the hyper-compact Disability bitflags created in the old DNA2 system.
/datum/genetics/mutation/disability
	var/mutation=0
	var/disability=0
	var/sdisability=0

/datum/genetics/mutation/disability/onPlayerImplant()
	if(!..())
		return
	if(mutation && !(mutation in container.holder.mutations))
		container.holder.mutations.Add(mutation)
	if(disability)
		container.holder.disabilities|=disability
	if(sdisability)
		container.holder.sdisabilities|=sdisability

/datum/genetics/mutation/disability/onPlayerRemove()
	if(!..())
		return
	if(mutation && (mutation in container.holder.mutations))
		container.holder.mutations.Remove(mutation)
	if(disability)
		container.holder.disabilities &= (~disability)
	if(sdisability)
		container.holder.sdisabilities &= (~sdisability)

/datum/genetics/mutation/disability/epilepsy
	name = "Epilepsy"
	key = "MUTATION_EPILEPSY"
	desc = "Causes you to have seizures."
	gain_text = "You get a headache."
	disability = EPILEPSY

/datum/genetics/mutation/disability/cough
	name="Coughing"
	key = "MUTATION_COUGHING"
	desc = "Causes you to cough intermittantly."
	gain_text="You start coughing."
	disability=COUGHING

/datum/genetics/mutation/disability/clumsy
	name="Clumsiness"
	key = "MUTATION_CLUMSY"
	desc = "We've isolated the gene that causes people to mess up all the time."
	gain_text="Your hands become a little less agile."
	mutation=CLUMSY


/datum/genetics/mutation/disability/tourettes
	name="Tourettes"
	key = "MUTATION_TOURETTES"
	desc = "An age old mystery has been solved, we now know the gene cluster that causes Tourettes."
	gain_text="You twitch."
	disability=TOURETTES


/datum/genetics/mutation/disability/nervousness
	name="Nervousness"
	key = "MUTATION_NERVOUSNESS"
	desc = "Causes the mind to second-guess itself. Constantly."
	gain_text="You feel nervous."
	disability=NERVOUS

/datum/genetics/mutation/disability/blindness
	name="Blindness"
	key = "MUTATION_BLINDNESS"
	desc = "A film over the pupils cause the eyes to cease functioning."
	gain_text="There goes the lights..."
	sdisability=BLIND

//TODO: Test to see if this works

/datum/genetics/mutation/disability/deaf
	name="Deafness"
	key = "MUTATION_DEAF"
	desc = "Growths in the eardrums block all sound."
	gain_text="It's kinda quiet."
	sdisability=DEAF

/datum/genetics/mutation/disability/nearsighted
	name="Nearsightedness"
	key = "MUTATION_NEARSIGHTED"
	desc="Changes the shape of your eyes, worsening your vision comprehensively."
	gain_text="Your eyes feel weird..."
	disability=NEARSIGHTED

/datum/genetics/mutation/disability/noprints
	name = "Smooth Fingertips"
	key = "MUTATION_NO_PRINTS"
	desc = "Causes finger friction ridges to disappear, essentially removing the fingerprint pattern."
	gain_text="Your fingertips lose their texture..."
	instability = 5
	mutation = mFingerprints

/datum/genetics/mutation/disability/nobreathe
	name = "Anomalous Air Supply"
	key = "MUTATION_NO_BREATHE"
	desc = "Removes the need for oxygen."
	gain_text="Your lungs feel a little minty..."
	instability = 5
	var/existed_prior = FALSE

/datum/genetics/mutation/disability/nobreathe/onMobImplant()
	if(!istype(container.holder,/mob/living/carbon))
		return
	var/mob/living/carbon/target = container.holder
	if(!(target.species.flags & NO_BREATHE))
		target.species.flags |= NO_BREATHE
	else
		existed_prior = TRUE

/datum/genetics/mutation/disability/nobreathe/onMobRemove()
	if(!istype(container.holder,/mob/living/carbon))
		return
	if(existed_prior)
		return
	var/mob/living/carbon/target = container.holder
	target.species.flags &= ~NO_BREATHE


/datum/genetics/mutation/disability/hulk
	name = "H.U.L.K."
	key = "MUTATION_HULK"
	desc = "Heavy, Uncontrolled Lifting & Kinetics. May have undesired effects on the mind."
	gain_text="You feel... Powerful..."
	instability = 80
	mutation = HULK


