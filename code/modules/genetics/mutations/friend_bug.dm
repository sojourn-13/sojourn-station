/datum/genetics/mutation/roach_friend
	name = "Roach Friend"
	key = "MUTATION_ROACH_FRIEND"
	desc = "Causes the body to produce phermones that Roaches use to identify each other."
	gain_text = "Your body smells funny."
	exclusive_type = MUT_TYPE_FACTION
	instability = 30
	var/old_faction

/datum/genetics/mutation/roach_friend/onMobImplant()
	old_faction = container.holder.faction
	if(container.holder.faction == "spiders")
		container.holder.faction = "sproachder"
	else
		container.holder.faction = "roach"


/datum/genetics/mutation/roach_friend/onMobRemove()
	container.holder.faction = old_faction

/datum/genetics/mutation/spider_friend
	name = "Spider Friend"
	key = "MUTATION_SPIDER_FRIEND"
	desc = "Causes the body to produce phermones that Spiders use to identify each other."
	gain_text = "Your body smells funny."
	exclusive_type = MUT_TYPE_FACTION
	instability = 30
	var/old_faction

/datum/genetics/mutation/spider_friend/onMobImplant()
	old_faction = container.holder.faction
	if(container.holder.faction == "roach")
		container.holder.faction = "sproachder"
	else
		container.holder.faction = "spiders"


/datum/genetics/mutation/spider_friend/onMobRemove()
	container.holder.faction = old_faction

/datum/genetics/mutation/sproachder_friend
	name = "Sproachder Friend"
	key = "MUTATION_SPROACHDER_FRIEND"
	desc = "Causes the body to produce a strange cocktail of phermones that keep both Roaches and Spiders docile."
	gain_text = "Your body smells a little cursed."
	exclusive_type = MUT_TYPE_FACTION
	instability = 60
	var/old_faction

/datum/genetics/mutation/sproachder_friend/onMobImplant()
	old_faction = container.holder.faction
	container.holder.faction = "sproachder"


/datum/genetics/mutation/sproachder_friend/onMobRemove()
	container.holder.faction = old_faction

/datum/genetics/mutation/termite_friend
	name = "Termite Friend"
	key = "MUTATION_TERMITE_FRIEND"
	desc = "Causes the body to produce a light electric signal. Termites and worms can probably sense this."
	gain_text = "Your body tingles a bit."
	exclusive_type = MUT_TYPE_FACTION
	instability = 50 // this can be turned into a stronger ability that allows one to summon a friendly wurm once every 10ish minutes.
	var/old_faction

/datum/genetics/mutation/termite_friend/onMobImplant()
	old_faction = container.holder.faction
	container.holder.faction = "wurm"


/datum/genetics/mutation/termite_friend/onMobRemove()
	container.holder.faction = old_faction
