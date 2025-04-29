//Macro: MUTATION_PUNCH
/datum/genetics/mutation/punch
	name = "Heavy Hands"
	key = "MUTATION_PUNCH"
	desc = "Increases the force you can put in your bare-handed blows."
	gain_text = "Your hands feel like heavy liquid is pooling inside them..."
	instability = 10

/datum/genetics/mutation/punch/onMobImplant()
	if(!..())
		return
	if(ishuman(container.holder))
		var/mob/living/carbon/human/human_holder = container.holder
		human_holder.punch_damage_increase += 3
	//Imagine the fun of this on colony allied monsters
	if(istype(container.holder, /mob/living/simple/hostile))
		var/mob/living/simple/hostile/HE = container.holder
		HE.melee_damage_lower += 6
		HE.melee_damage_upper += 6
	if(issuperioranimal(container.holder))
		var/mob/living/carbon/superior/SA = container.holder
		SA.melee_damage_lower += 6
		SA.melee_damage_upper += 6

/datum/genetics/mutation/punch/onMobImplant()
	if(!..())
		return
	if(ishuman(container.holder))
		var/mob/living/carbon/human/human_holder = container.holder
		human_holder.punch_damage_increase -= 3
	if(istype(container.holder, /mob/living/simple/hostile))
		var/mob/living/simple/hostile/HE = container.holder
		HE.melee_damage_lower -= 6
		HE.melee_damage_upper -= 6
	if(issuperioranimal(container.holder))
		var/mob/living/carbon/superior/SA = container.holder
		SA.melee_damage_lower -= 6
		SA.melee_damage_upper -= 6