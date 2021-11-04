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
