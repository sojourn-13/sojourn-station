//Macro: MUTATION_EMP
/datum/genetics/mutation/emp
	name = "EMP Blast"
	key = "MUTATION_EMP"
	desc = "Adds a gland in the person's body that allows for strong electromagnetic discharges."
	gain_text = "You feel an energy roiling inside of you..."
	instability = 30
	var/cooldown = 3 MINUTES
	var/last_used

/datum/genetics/mutation/emp/onMobImplant()
	add_verb(container.holder, /mob/living/proc/mutation_emp)
	last_used = world.time - cooldown //Use it instantly

/datum/genetics/mutation/emp/onMobRemove()
	remove_verb(container.holder, /mob/living/proc/mutation_emp)

/mob/living/proc/mutation_emp()
	set name = "Electromagnetic Pulse"
	set category = "Mutation"

	if(stat!=CONSCIOUS)
		usr.show_message("\blue You must be conscious to perform this ability!")
		return

	var/datum/genetics/mutation/emp/emp_mutation = src.unnatural_mutations.getMutation("MUTATION_EMP", TRUE)

	if(!emp_mutation)
		remove_verb(src, /mob/living/proc/mutation_emp)
		return

	if(world.time <= emp_mutation.last_used + emp_mutation.cooldown)
		usr.show_message("\blue The power inside of you is not yet strong enough...")
		return

	emp_mutation.last_used = world.time
	playsound(src.loc, list('sound/weapons/guns/unknown_spacegun_burn.ogg', 'sound/weapons/guns/unknown_spacegun_melt.ogg', 'sound/weapons/guns/unknown_spacegun_incinerate.ogg', 'sound/weapons/guns/unknown_spacegun_vaporize.ogg'))
	empulse(src.loc, 2,3,1) //Death mixes it making it even worst




