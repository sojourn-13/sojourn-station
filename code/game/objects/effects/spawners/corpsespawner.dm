//These are meant for spawning on maps, namely Away Missions.

//If someone can do this in a neater way, be my guest-Kor

//To do: Allow corpses to appear mangled, bloody, etc. Allow customizing the bodies appearance (they're all bald and white right now).

/obj/landmark/corpse
	name = "Unknown"
	icon_state = "player-black"
	var/mobname = "Unknown"  //Unused now but it'd fuck up maps to remove it now
	var/corpseuniform = null //Set this to an object path to have the slot filled with said object on the corpse.
	var/corpsesuit = null
	var/corpseshoes = null
	var/corpsegloves = null
	var/corpseradio = null
	var/corpseglasses = null
	var/corpsemask = null
	var/corpsehelmet = null
	var/corpsebelt = null
	var/corpsepocket1 = null
	var/corpsepocket2 = null
	var/corpseback = null
	var/corpseid = 0     //Just set to 1 if you want them to have an ID
	var/corpseidjob = null // Needs to be in quotes, such as "Clown" or "Chef." This just determines what the ID reads as, not their access
	var/corpseidaccess = null //This is for access. See access.dm for which jobs give what access. Again, put in quotes. Use "Captain" if you want it to be all access.
	var/species = "Human"

/obj/landmark/corpse/Initialize()
	..()
	createCorpse()
	return INITIALIZE_HINT_QDEL

/obj/landmark/corpse/proc/createCorpse() //Creates a mob and checks for gear in each slot before attempting to equip it.
	var/mob/living/carbon/human/M = new /mob/living/carbon/human (src.loc)
	M.set_species(species)
	M.real_name = src.name
	M.death(1) //Kills the new mob
	if(src.corpseuniform)
		M.equip_to_slot_or_del(new src.corpseuniform(M), slot_w_uniform)
	if(src.corpsesuit)
		M.equip_to_slot_or_del(new src.corpsesuit(M), slot_wear_suit)
	if(src.corpseshoes)
		M.equip_to_slot_or_del(new src.corpseshoes(M), slot_shoes)
	if(src.corpsegloves)
		M.equip_to_slot_or_del(new src.corpsegloves(M), slot_gloves)
	if(src.corpseradio)
		M.equip_to_slot_or_del(new src.corpseradio(M), slot_l_ear)
	if(src.corpseglasses)
		M.equip_to_slot_or_del(new src.corpseglasses(M), slot_glasses)
	if(src.corpsemask)
		M.equip_to_slot_or_del(new src.corpsemask(M), slot_wear_mask)
	if(src.corpsehelmet)
		M.equip_to_slot_or_del(new src.corpsehelmet(M), slot_head)
	if(src.corpsebelt)
		M.equip_to_slot_or_del(new src.corpsebelt(M), slot_belt)
	if(src.corpsepocket1)
		M.equip_to_slot_or_del(new src.corpsepocket1(M), slot_r_store)
	if(src.corpsepocket2)
		M.equip_to_slot_or_del(new src.corpsepocket2(M), slot_l_store)
	if(src.corpseback)
		M.equip_to_slot_or_del(new src.corpseback(M), slot_back)

	var/datum/job/jobdatum = corpseidjob && SSjob.GetJob(corpseidjob)

	if(src.corpseid)
		var/datum/job/job_access = jobdatum
		if(corpseidaccess)
			job_access = SSjob.GetJob(corpseidaccess)
		var/obj/item/card/id/W = new(M)
		if(job_access)
			W.access = job_access.get_access()
		else
			W.access = list()
		W.assignment = corpseidjob
		M.set_id_info(W)
		M.equip_to_slot_or_del(W, slot_wear_id)



/obj/landmark/corpse/generic/clown
	name = "Clown"
	corpseuniform = /obj/item/clothing/under/costume/job/clown
	corpseshoes = /obj/item/clothing/shoes/costume/job/clown
	corpseradio = /obj/item/device/radio/headset
	corpsemask = /obj/item/clothing/mask/costume/job/clown
	corpsepocket1 = /obj/item/bikehorn
	corpseback = /obj/item/storage/backpack/clown
	corpseid = 1
	corpseidjob = "Clown"

/obj/landmark/corpse/generic/prisoner
	name = "Prisoner"
	corpseuniform = /obj/item/clothing/under/orange
	corpseshoes = /obj/item/clothing/shoes/orange

/obj/landmark/corpse/generic/hunter
	name = "Hunter"
	corpseuniform = /obj/item/clothing/under/gorka/camo
	corpsesuit = /obj/item/clothing/suit/gorka/toggle/gorka/camo
	corpseshoes = /obj/item/clothing/shoes/cowboy/classic
	corpsemask = /obj/item/clothing/mask/gas/old
	corpsehelmet = /obj/item/clothing/head/cowboy/longhorn
	corpsegloves = /obj/item/clothing/gloves/thick

/////////////////Enemies//////////////////////

/obj/landmark/corpse/antagonist/syndicate
	name = "Syndicate Operative"
	corpseuniform = /obj/item/clothing/under/syndicate
	corpsesuit = /obj/item/clothing/suit/armor/vest
	corpseshoes = /obj/item/clothing/shoes/swat
	corpsegloves = /obj/item/clothing/gloves/thick/swat
	corpseradio = /obj/item/device/radio/headset
	corpsemask = /obj/item/clothing/mask/gas
	corpsehelmet = /obj/item/clothing/head/helmet/swat
	corpseback = /obj/item/storage/backpack
	corpseid = 1
	corpseidjob = "Syndicate Operative"
	corpseidaccess = "Syndicate"

/obj/landmark/corpse/antagonist/syndicate/commando
	name = "Syndicate Commando"
	corpseuniform = /obj/item/clothing/under/syndicate
	corpsesuit = /obj/item/clothing/suit/space/void/merc
	corpseshoes = /obj/item/clothing/shoes/swat
	corpsegloves = /obj/item/clothing/gloves/thick/swat
	corpseradio = /obj/item/device/radio/headset
	corpsemask = /obj/item/clothing/mask/gas/tactical
	corpsehelmet = /obj/item/clothing/head/helmet/space/void/merc
	corpseback = /obj/item/tank/jetpack/oxygen
	corpsepocket1 = /obj/item/tank/emergency_oxygen
	corpseid = 1
	corpseidjob = "Syndicate Commando"
	corpseidaccess = "Syndicate"

/obj/landmark/corpse/antagonist/pirate
	name = "Pirate"
	corpseuniform = /obj/item/clothing/under/costume/history/pirate
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpseglasses = /obj/item/clothing/glasses/eyepatch
	corpsehelmet = /obj/item/clothing/head/bandana

/obj/landmark/corpse/antagonist/pirate/gunner
	name = "Pirate Gunner"
	corpsesuit = /obj/item/clothing/suit/costume/history/pirate
	corpsehelmet = /obj/item/clothing/head/costume/history/pirate

/obj/landmark/corpse/antagonist/russian
	name = "Russian"
	corpseuniform = /obj/item/clothing/under/costume/history/soviet
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsehelmet = /obj/item/clothing/head/bearpelt

/obj/landmark/corpse/antagonist/russian/ranged
	corpsehelmet = /obj/item/clothing/head/ushanka
