/datum/perk/nepotism
	name = "Nepotism"
	desc = "You earn higher pay than your fellow peers. Aren't you a lucky one."
	gain_text = "You feel comforted, knowing the amount of money coming your way."

//I guess we gotta update the crew records now.
/datum/perk/nepotism/assign(mob/living/carbon/human/H)
	..()
	for(var/datum/computer_file/report/crew_record/R in GLOB.all_crew_records)
		//I can't believe they used hashing for this
		if(R.get_fingerprint() == md5(holder.dna.uni_identity))
			log_debug("Found fat cat based on unique fingerprint")
			var/nepotism = R.get_nepotismMod()
			nepotism += 0.5
			R.set_nepotismMod(nepotism)
			return

/datum/perk/nepotism/remove()
	for(var/datum/computer_file/report/crew_record/R in GLOB.all_crew_records)
		//I can't believe they used hashing for this
		if(R.get_fingerprint() == md5(holder.dna.uni_identity))
			log_debug("Found fat cat based on unique fingerprint")
			var/nepotism = R.get_nepotismMod()
			nepotism -= 0.5
			R.set_nepotismMod(nepotism)
			return
	..()



/datum/perk/debtor
	name = "Debtor"
	desc = "You owe money to someone or something. Unfortunately, your wages have been garnished to make up the difference."
	gain_text = "You feel annoyed, thinking about how much of your wage is going into paying off your debt."

//I guess we gotta update the crew records now.
/datum/perk/debtor/assign(mob/living/carbon/human/H)
	..()
	log_debug("Trying to apply a person's debt")
	for(var/datum/computer_file/report/crew_record/R in GLOB.all_crew_records)
		//I can't believe they used hashing for this
		if(R.get_fingerprint() == md5(holder.dna.uni_identity))
			log_debug("Found dirty poor based on unique fingerprint")
			var/nepotism = R.get_nepotismMod()
			nepotism -= 0.5
			R.set_nepotismMod(nepotism)
			return

/datum/perk/debtor/remove()
	for(var/datum/computer_file/report/crew_record/R in GLOB.all_crew_records)
		//I can't believe they used hashing for this
		if(R.get_fingerprint() == md5(holder.dna.uni_identity))
			log_debug("Found dirty poor based on unique fingerprint")
			var/nepotism = R.get_nepotismMod()
			nepotism += 0.5
			R.set_nepotismMod(nepotism)
			return
	..()

/datum/perk/splicer
	name = "Splicer"
	desc = "Your genes are heavily modified already, your base genetic instability is 20%, even if you don't have any mutations."
	gain_text = "Your body is modified enough already; pushing it further might be bad."

//Genetics is made reliably enough that simply increasing total instability, a dynamically changing value, will be permanent until removed.
/datum/perk/splicer/assign(mob/living/carbon/human/H)
	..()
	holder.unnatural_mutations.total_instability += 20

/datum/perk/splicer/remove()
	holder.unnatural_mutations.total_instability -= 20
	..()