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
		var/obj/item/weapon/card/id/W = new(M)
		if(job_access)
			W.access = job_access.get_access()
		else
			W.access = list()
		W.assignment = corpseidjob
		M.set_id_info(W)
		M.equip_to_slot_or_del(W, slot_wear_id)

// I'll work on making a list of corpses people request for maps, or that I think will be commonly used. Syndicate operatives for example.

///Roles - Civilian///

/obj/landmark/corpse/roles/civilian/assistant
	name = "Assistant"
	corpseuniform = /obj/item/clothing/under/rank/assistant
	corpsesuit = /obj/item/clothing/suit/storage/ass_jacket
	corpseshoes = /obj/item/clothing/shoes/color/black
	corpseradio = /obj/item/device/radio/headset
	corpseback = /obj/item/weapon/storage/backpack
	corpseid = 1
	corpseidjob = "Assistant"

/obj/landmark/corpse/roles/civilian/chef
	name = "Chef"
	corpseuniform = /obj/item/clothing/under/rank/chef
	corpsesuit = /obj/item/clothing/suit/rank/chef
	corpseshoes = /obj/item/clothing/shoes/color/black
	corpseradio = /obj/item/device/radio/headset/headset_service
	corpsehelmet = /obj/item/clothing/head/rank/chef
	corpseback = /obj/item/weapon/storage/backpack
	corpseid = 1
	corpseidjob = "Chef"

/obj/landmark/corpse/roles/civilian/bartender
	name = "Bartender"
	corpseuniform = /obj/item/clothing/under/rank/bartender
	corpseshoes = /obj/item/clothing/shoes/laceup
	corpseradio = /obj/item/device/radio/headset/headset_service
	corpseback = /obj/item/weapon/storage/backpack
	corpseid = 1
	corpseidjob = "Bartender"

/obj/landmark/corpse/roles/civilian/janitor
	name = "Janitor"
	corpseuniform = /obj/item/clothing/under/rank/janitor
	corpseshoes = /obj/item/clothing/shoes/galoshes
	corpseradio = /obj/item/device/radio/headset/headset_service
	corpsehelmet = /obj/item/clothing/head/soft/purple
	corpseback = /obj/item/weapon/storage/backpack
	corpseid = 1
	corpseidjob = "Janitor"

/obj/landmark/corpse/roles/civilian/janitor/biosuit
	name = "Janitor"
	corpseuniform = /obj/item/clothing/under/rank/janitor
	corpsesuit = /obj/item/clothing/suit/bio_suit/janitor
	corpseshoes = /obj/item/clothing/shoes/galoshes
	corpsegloves = /obj/item/clothing/gloves/latex
	corpseradio = /obj/item/device/radio/headset/headset_service
	corpsemask = /obj/item/clothing/mask/breath
	corpsehelmet = /obj/item/clothing/head/bio_hood/janitor
	corpseback = /obj/item/weapon/storage/backpack
	corpseid = 1
	corpseidjob = "Janitor"

/obj/landmark/corpse/roles/civilian/gardener
	name = "Gardener"
	corpseuniform = /obj/item/clothing/under/rank/hydroponics
	corpsesuit = /obj/item/clothing/suit/apron
	corpseshoes = /obj/item/clothing/shoes/workboots
	corpsegloves = /obj/item/clothing/gloves/botanic_leather
	corpseradio = /obj/item/device/radio/headset/headset_service
	corpseback = /obj/item/weapon/storage/backpack
	corpseid = 1
	corpseidjob = "Gardener"

/obj/landmark/corpse/roles/civilian/neotheopreacher
	name = "NeoTheologist Preacher"
	corpseuniform = /obj/item/clothing/under/rank/chaplain
	corpsesuit = /obj/item/clothing/suit/rank/chaplain
	corpseshoes = /obj/item/clothing/shoes/reinforced
	corpsegloves = /obj/item/clothing/gloves/thick
	corpseradio = /obj/item/device/radio/headset
	corpseback = /obj/item/weapon/storage/backpack
	corpseid = 1
	corpseidjob = "NeoTheologist Preacher"

///Roles - Medical///

/obj/landmark/corpse/roles/medical/moebiusdoctor
	name = "Moebius Doctor"
	corpseuniform = /obj/item/clothing/under/rank/medical
	corpsesuit = /obj/item/clothing/suit/storage/toggle/labcoat
	corpseshoes = /obj/item/clothing/shoes/laceup
	corpseradio = /obj/item/device/radio/headset/headset_med
	corpsepocket2 = /obj/item/device/lighting/toggleable/flashlight/pen
	corpseback = /obj/item/weapon/storage/backpack/medic
	corpseid = 1
	corpseidjob = "Moebius Doctor"

/obj/landmark/corpse/roles/medical/moebiusdoctor/biosuit
	name = "Moebius Doctor"
	corpseuniform = /obj/item/clothing/under/rank/medical
	corpsesuit = /obj/item/clothing/suit/bio_suit/virology
	corpseshoes = /obj/item/clothing/shoes/laceup
	corpsegloves = /obj/item/clothing/gloves/latex
	corpseradio = /obj/item/device/radio/headset/headset_med
	corpsemask = /obj/item/clothing/mask/breath
	corpsehelmet = /obj/item/clothing/head/bio_hood/virology
	corpsepocket2 = /obj/item/device/lighting/toggleable/flashlight/pen
	corpseback = /obj/item/weapon/storage/backpack/medic
	corpseid = 1
	corpseidjob = "Moebius Doctor"

/obj/landmark/corpse/roles/medical/moebiuschemist
	name = "Moebius Chemist"
	corpseuniform = /obj/item/clothing/under/rank/chemist
	corpsesuit = /obj/item/clothing/suit/storage/toggle/labcoat/chemist
	corpseshoes = /obj/item/clothing/shoes/laceup
	corpseradio = /obj/item/device/radio/headset/headset_med
	corpsepocket2 = /obj/item/device/lighting/toggleable/flashlight/pen
	corpseback = /obj/item/weapon/storage/backpack/medic
	corpseid = 1
	corpseidjob = "Moebius Chemist"

/obj/landmark/corpse/roles/medical/moebiuschemist/biosuit
	name = "Moebius Chemist"
	corpseuniform = /obj/item/clothing/under/rank/chemist
	corpsesuit = /obj/item/clothing/suit/bio_suit/virology
	corpseshoes = /obj/item/clothing/shoes/laceup
	corpsegloves = /obj/item/clothing/gloves/latex
	corpseradio = /obj/item/device/radio/headset/headset_med
	corpsemask = /obj/item/clothing/mask/breath
	corpsehelmet = /obj/item/clothing/head/bio_hood/virology
	corpsepocket2 = /obj/item/device/lighting/toggleable/flashlight/pen
	corpseback = /obj/item/weapon/storage/backpack/medic
	corpseid = 1
	corpseidjob = "Moebius Chemist"

/obj/landmark/corpse/roles/medical/moebiuspsychiatrist
	name = "Moebius Psychiatrist"
	corpseuniform = /obj/item/clothing/under/rank/psych
	corpsesuit = /obj/item/clothing/suit/storage/toggle/labcoat
	corpseshoes = /obj/item/clothing/shoes/laceup
	corpseradio = /obj/item/device/radio/headset/headset_med
	corpsepocket2 = /obj/item/device/lighting/toggleable/flashlight/pen
	corpseback = /obj/item/weapon/storage/backpack/medic
	corpseid = 1
	corpseidjob = "Moebius Psychiatrist"

/obj/landmark/corpse/roles/medical/moebiuspsychiatrist/biosuit
	name = "Moebius Psychiatrist"
	corpseuniform = /obj/item/clothing/under/rank/psych
	corpsesuit = /obj/item/clothing/suit/bio_suit/virology
	corpseshoes = /obj/item/clothing/shoes/laceup
	corpsegloves = /obj/item/clothing/gloves/latex
	corpseradio = /obj/item/device/radio/headset/headset_med
	corpsemask = /obj/item/clothing/mask/breath
	corpsehelmet = /obj/item/clothing/head/bio_hood/virology
	corpsepocket2 = /obj/item/device/lighting/toggleable/flashlight/pen
	corpseback = /obj/item/weapon/storage/backpack/medic
	corpseid = 1
	corpseidjob = "Moebius Psychiatrist"

/obj/landmark/corpse/roles/medical/moebiusparamedic
	name = "Moebius Paramedic"
	corpseuniform = /obj/item/clothing/under/scrubs/green
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpseradio = /obj/item/device/radio/headset/headset_med
	corpsebelt = /obj/item/weapon/storage/belt/medical/emt
	corpsepocket2 = /obj/item/device/lighting/toggleable/flashlight/pen
	corpseback = /obj/item/weapon/storage/backpack/medic
	corpseid = 1
	corpseidjob = "Moebius Paramedic"

/obj/landmark/corpse/roles/medical/moebiusparamedic/biosuit
	name = "Moebius Paramedic"
	corpseuniform = /obj/item/clothing/under/scrubs/green
	corpsesuit = /obj/item/clothing/suit/bio_suit/virology
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/latex
	corpseradio = /obj/item/device/radio/headset/headset_med
	corpsemask = /obj/item/clothing/mask/breath
	corpsehelmet = /obj/item/clothing/head/bio_hood/virology
	corpsebelt = /obj/item/weapon/storage/belt/medical/emt
	corpsepocket2 = /obj/item/device/lighting/toggleable/flashlight/pen
	corpseback = /obj/item/weapon/storage/backpack/medic
	corpseid = 1
	corpseidjob = "Moebius Paramedic"

/obj/landmark/corpse/roles/medical/moebiusparamedic/voidsuit
	name = "Moebius Paramedic"
	corpseuniform = /obj/item/clothing/under/scrubs/green
	corpsesuit = /obj/item/clothing/suit/space/void/medical
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/thick
	corpseradio = /obj/item/device/radio/headset/headset_med
	corpsemask = /obj/item/clothing/mask/breath
	corpsehelmet = /obj/item/clothing/head/helmet/space/rig/medical
	corpsebelt = /obj/item/weapon/storage/belt/medical/emt
	corpsepocket2 = /obj/item/device/lighting/toggleable/flashlight/pen
	corpseback = /obj/item/weapon/storage/backpack/medic
	corpseid = 1
	corpseidjob = "Moebius Paramedic"

/obj/landmark/corpse/roles/medical/moebiusbiolabofficer
	name = "Moebius Biolab Officer"
	corpseuniform = /obj/item/clothing/under/rank/moebius_biolab_officer
	corpsesuit = /obj/item/clothing/suit/storage/toggle/labcoat/cmo
	corpseshoes = /obj/item/clothing/shoes/laceup
	corpseradio = /obj/item/device/radio/headset/heads/cmo
	corpsepocket2 = /obj/item/device/lighting/toggleable/flashlight/pen
	corpseback = /obj/item/weapon/storage/backpack/medic
	corpseid = 1
	corpseidjob = "Moebius Biolab Officer"

/obj/landmark/corpse/roles/medical/moebiusbiolabofficer/biosuit
	name = "Moebius Biolab Officer"
	corpseuniform = /obj/item/clothing/under/rank/moebius_biolab_officer
	corpsesuit = /obj/item/clothing/suit/bio_suit/cmo
	corpseshoes = /obj/item/clothing/shoes/laceup
	corpsegloves = /obj/item/clothing/gloves/latex
	corpseradio = /obj/item/device/radio/headset/heads/cmo
	corpsemask = /obj/item/clothing/mask/breath
	corpsehelmet = /obj/item/clothing/head/bio_hood/cmo
	corpsepocket2 = /obj/item/device/lighting/toggleable/flashlight/pen
	corpseback = /obj/item/weapon/storage/backpack/medic
	corpseid = 1
	corpseidjob = "Moebius Biolab Officer"

///Roles - Research///

/obj/landmark/corpse/roles/research/moebiusscientist
	name = "Moebius Scientist"
	corpseuniform = /obj/item/clothing/under/rank/scientist
	corpsesuit = /obj/item/clothing/suit/storage/toggle/labcoat/science
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpseradio = /obj/item/device/radio/headset/headset_sci
	corpseback = /obj/item/weapon/storage/backpack
	corpseid = 1
	corpseidjob = "Moebius Scientist"

/obj/landmark/corpse/roles/research/moebiusscientist/biosuit
	name = "Moebius Scientist"
	corpseuniform = /obj/item/clothing/under/rank/scientist
	corpsesuit = /obj/item/clothing/suit/bio_suit/scientist
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/latex
	corpseradio = /obj/item/device/radio/headset/headset_sci
	corpsemask = /obj/item/clothing/mask/breath
	corpsehelmet = /obj/item/clothing/head/bio_hood/scientist
	corpseback = /obj/item/weapon/storage/backpack
	corpseid = 1
	corpseidjob = "Moebius Scientist"

/obj/landmark/corpse/roles/research/moebiusroboticist
	name = "Moebius Roboticist"
	corpseuniform = /obj/item/clothing/under/rank/roboticist
	corpsesuit = /obj/item/clothing/suit/storage/robotech_jacket
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpseradio = /obj/item/device/radio/headset/headset_sci
	corpsebelt = /obj/item/weapon/storage/belt/utility/full
	corpseback = /obj/item/weapon/storage/backpack
	corpseid = 1
	corpseidjob = "Moebius Roboticist"

/obj/landmark/corpse/roles/research/moebiusroboticist/biosuit
	name = "Moebius Roboticist"
	corpseuniform = /obj/item/clothing/under/rank/roboticist
	corpsesuit = /obj/item/clothing/suit/bio_suit/scientist
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/latex
	corpseradio = /obj/item/device/radio/headset/headset_sci
	corpsemask = /obj/item/clothing/mask/breath
	corpsehelmet = /obj/item/clothing/head/bio_hood/scientist
	corpsebelt = /obj/item/weapon/storage/belt/utility/full
	corpseback = /obj/item/weapon/storage/backpack
	corpseid = 1
	corpseidjob = "Moebius Roboticist"

/obj/landmark/corpse/roles/research/moebiusexpeditionoverseer
	name = "Moebius Expedition Overseer"
	corpseuniform = /obj/item/clothing/under/rank/expedition_overseer
	corpsesuit = /obj/item/clothing/suit/storage/robotech_jacket
	corpseshoes = /obj/item/clothing/shoes/reinforced
	corpseradio = /obj/item/device/radio/headset/heads/rd
	corpsebelt = /obj/item/weapon/storage/belt/utility/full
	corpsepocket1 = /obj/item/weapon/clipboard
	corpseback = /obj/item/weapon/storage/backpack
	corpseid = 1
	corpseidjob = "Moebius Expedition Overseer"

/obj/landmark/corpse/roles/research/moebiusexpeditionoverseer/biosuit
	name = "Moebius Expedition Overseer"
	corpseuniform = /obj/item/clothing/under/rank/expedition_overseer
	corpsesuit = /obj/item/clothing/suit/bio_suit/scientist
	corpseshoes = /obj/item/clothing/shoes/reinforced
	corpsegloves = /obj/item/clothing/gloves/latex
	corpseradio = /obj/item/device/radio/headset/heads/rd
	corpsemask = /obj/item/clothing/mask/breath
	corpsehelmet = /obj/item/clothing/head/bio_hood/scientist
	corpsebelt = /obj/item/weapon/storage/belt/utility/full
	corpsepocket1 = /obj/item/weapon/clipboard
	corpseback = /obj/item/weapon/storage/backpack
	corpseid = 1
	corpseidjob = "Moebius Expedition Overseer"

///Roles - Engineering///

/obj/landmark/corpse/roles/engineering/technomancer
	name = "Technomancer"
	corpseuniform =/obj/item/clothing/under/rank/engineer
	corpsesuit = /obj/item/clothing/suit/storage/hazardvest
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/thick
	corpseradio = /obj/item/device/radio/headset/headset_eng
	corpsehelmet = /obj/item/clothing/head/hardhat
	corpsebelt = /obj/item/weapon/storage/belt/utility/mostlyfull
	corpsepocket1 = /obj/item/device/t_scanner
	corpseback = /obj/item/weapon/storage/backpack/industrial
	corpseid = 1
	corpseidjob = "Technomancer"

/obj/landmark/corpse/roles/engineering/technomancer/voidsuit
	name = "Technomancer"
	corpseuniform =/obj/item/clothing/under/rank/engineer
	corpsesuit = /obj/item/clothing/suit/space/void/engineering
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/thick
	corpseradio = /obj/item/device/radio/headset/headset_eng
	corpsemask = /obj/item/clothing/mask/breath
	corpsehelmet = /obj/item/clothing/head/helmet/space/void/engineering
	corpsebelt = /obj/item/weapon/storage/belt/utility/mostlyfull
	corpsepocket1 = /obj/item/device/t_scanner
	corpseback = /obj/item/weapon/storage/backpack/industrial
	corpseid = 1
	corpseidjob = "Technomancer"

/obj/landmark/corpse/roles/engineering/technomancerexultant
	name = "Technomancer Exultant"
	corpseuniform =/obj/item/clothing/under/rank/exultant
	corpsesuit = /obj/item/clothing/suit/storage/hazardvest
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/thick
	corpseradio = /obj/item/device/radio/headset/heads/ce
	corpsehelmet = /obj/item/clothing/head/firefighter/chief
	corpsebelt = /obj/item/weapon/storage/belt/utility/mostlyfull
	corpsepocket1 = /obj/item/device/t_scanner
	corpseback = /obj/item/weapon/storage/backpack/industrial
	corpseid = 1
	corpseidjob = "Technomancer Exultant"

/obj/landmark/corpse/roles/engineering/technomancerexultant/voidsuit
	name = "Technomancer Exultant"
	corpseuniform =/obj/item/clothing/under/rank/exultant
	corpsesuit = /obj/item/clothing/suit/space/void/engineering
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/thick
	corpseradio = /obj/item/device/radio/headset/heads/ce
	corpsemask = /obj/item/clothing/mask/breath
	corpsehelmet = /obj/item/clothing/head/helmet/space/void/engineering
	corpsebelt = /obj/item/weapon/storage/belt/utility/mostlyfull
	corpsepocket1 = /obj/item/device/t_scanner
	corpseback = /obj/item/weapon/storage/backpack/industrial
	corpseid = 1
	corpseidjob = "Technomancer Exultant"

///Roles - Cargo///

/obj/landmark/corpse/roles/cargo/guildminer
	name = "Guild Miner"
	corpseuniform = /obj/item/clothing/under/rank/miner
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpseradio = /obj/item/device/radio/headset/headset_cargo
	corpseback = /obj/item/weapon/storage/backpack/industrial
	corpseid = 1
	corpseidjob = "Guild Miner"

/obj/landmark/corpse/roles/cargo/guildminer/voidsuit
	name = "Guild Miner"
	corpseuniform = /obj/item/clothing/under/rank/miner
	corpsesuit = /obj/item/clothing/suit/space/void/mining
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/thick
	corpseradio = /obj/item/device/radio/headset/headset_cargo
	corpsemask = /obj/item/clothing/mask/breath
	corpsehelmet = /obj/item/clothing/head/helmet/space/void/mining
	corpseback = /obj/item/weapon/storage/backpack/industrial
	corpseid = 1
	corpseidjob = "Guild Miner"

/obj/landmark/corpse/roles/cargo/guildmerchant
	name = "Guild Merchant"
	corpseuniform = /obj/item/clothing/under/rank/cargotech
	corpsesuit = /obj/item/clothing/suit/storage/qm_coat
	corpseshoes = /obj/item/clothing/shoes/color/brown
	corpseradio = /obj/item/device/radio/headset/heads/merchant
	corpseglasses = /obj/item/clothing/glasses/sunglasses
	corpsepocket1 = /obj/item/weapon/clipboard
	corpseback = /obj/item/weapon/storage/backpack/industrial
	corpseid = 1
	corpseidjob = "Guild Merchant"

/obj/landmark/corpse/roles/cargo/guildmerchant/voidsuit
	name = "Guild Merchant"
	corpseuniform = /obj/item/clothing/under/rank/cargotech
	corpsesuit = /obj/item/clothing/suit/space/void/mining
	corpseshoes = /obj/item/clothing/shoes/color/brown
	corpsegloves = /obj/item/clothing/gloves/thick
	corpseradio = /obj/item/device/radio/headset/heads/merchant
	corpseglasses = /obj/item/clothing/glasses/sunglasses
	corpsemask = /obj/item/clothing/mask/breath
	corpsehelmet = /obj/item/clothing/head/helmet/space/void/mining
	corpsepocket1 = /obj/item/weapon/clipboard
	corpseback = /obj/item/weapon/storage/backpack/industrial
	corpseid = 1
	corpseidjob = "Guild Merchant"

/obj/landmark/corpse/roles/cargo/guildtechnician
	name = "Guild Technician"
	corpseuniform = /obj/item/clothing/under/rank/cargotech
	corpsesuit = /obj/item/clothing/suit/storage/cargo_jacket
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpseradio = /obj/item/device/radio/headset/headset_cargo
	corpseback = /obj/item/weapon/storage/backpack/industrial
	corpseid = 1
	corpseidjob = "Guild Technician"

/obj/landmark/corpse/roles/cargo/guildtechnician/voidsuit
	name = "Guild Technician"
	corpseuniform = /obj/item/clothing/under/rank/cargotech
	corpsesuit = /obj/item/clothing/suit/space/void/mining
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/thick
	corpseradio = /obj/item/device/radio/headset/headset_cargo
	corpsemask = /obj/item/clothing/mask/breath
	corpsehelmet = /obj/item/clothing/head/helmet/space/void/mining
	corpseback = /obj/item/weapon/storage/backpack/industrial
	corpseid = 1
	corpseidjob = "Guild Technician"

///Roles - Security///

/obj/landmark/corpse/roles/security/ironhammercommander
	name = "Ironhammer Commander"
	corpseuniform = /obj/item/clothing/under/rank/ih_commander
	corpsesuit = /obj/item/clothing/suit/armor/hos
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/stungloves
	corpseradio = /obj/item/device/radio/headset/heads/hos
	corpseglasses = /obj/item/clothing/glasses/sechud/tactical
	corpsehelmet = /obj/item/clothing/head/sec/navy/hos
	corpsepocket1 = /obj/item/weapon/handcuffs
	corpseback = /obj/item/weapon/storage/backpack/security
	corpseid = 1
	corpseidjob = "Ironhammer Commander"

/obj/landmark/corpse/roles/security/ironhammercommander/biosuit
	name = "Ironhammer Commander"
	corpseuniform = /obj/item/clothing/under/rank/ih_commander
	corpsesuit = /obj/item/clothing/suit/bio_suit/security
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/latex
	corpseradio = /obj/item/device/radio/headset/heads/hos
	corpseglasses = /obj/item/clothing/glasses/sechud/tactical
	corpsehelmet = /obj/item/clothing/head/bio_hood/security
	corpsepocket1 = /obj/item/weapon/handcuffs
	corpseback = /obj/item/weapon/storage/backpack/security
	corpseid = 1
	corpseidjob = "Ironhammer Commander"

/obj/landmark/corpse/roles/security/ironhammercommander/voidsuit
	name = "Ironhammer Commander"
	corpseuniform = /obj/item/clothing/under/rank/ih_commander
	corpsesuit = /obj/item/clothing/suit/space/void/security
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/stungloves
	corpseradio = /obj/item/device/radio/headset/heads/hos
	corpsemask = /obj/item/clothing/mask/breath
	corpseglasses = /obj/item/clothing/glasses/sechud/tactical
	corpsehelmet = /obj/item/clothing/head/helmet/space/void/security
	corpsepocket1 = /obj/item/weapon/handcuffs
	corpseback = /obj/item/weapon/storage/backpack/security
	corpseid = 1
	corpseidjob = "Ironhammer Commander"

/obj/landmark/corpse/roles/security/ironhammergunnerysergeant
	name = "Ironhammer Gunnery Sergeant"
	corpseuniform = /obj/item/clothing/under/rank/warden
	corpsesuit = /obj/item/clothing/suit/armor/vest/security
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/stungloves
	corpseradio = /obj/item/device/radio/headset/headset_sec
	corpseglasses = /obj/item/clothing/glasses/sechud/tactical
	corpsehelmet = /obj/item/clothing/head/sec/navy/warden
	corpsepocket1 = /obj/item/weapon/handcuffs
	corpseback = /obj/item/weapon/storage/backpack/security
	corpseid = 1
	corpseidjob = "Ironhammer Gunnery Sergeant"

/obj/landmark/corpse/roles/security/ironhammergunnerysergeant/biosuit
	name = "Ironhammer Gunnery Sergeant"
	corpseuniform = /obj/item/clothing/under/rank/warden
	corpsesuit = /obj/item/clothing/suit/bio_suit/security
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/latex
	corpseradio = /obj/item/device/radio/headset/headset_sec
	corpseglasses = /obj/item/clothing/glasses/sechud/tactical
	corpsehelmet = /obj/item/clothing/head/bio_hood/security
	corpsepocket1 = /obj/item/weapon/handcuffs
	corpseback = /obj/item/weapon/storage/backpack/security
	corpseid = 1
	corpseidjob = "Ironhammer Gunnery Sergeant"

/obj/landmark/corpse/roles/security/ironhammergunnerysergeant/voidsuit
	name = "Ironhammer Gunnery Sergeant"
	corpseuniform = /obj/item/clothing/under/rank/warden
	corpsesuit = /obj/item/clothing/suit/space/void/security
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/stungloves
	corpseradio = /obj/item/device/radio/headset/headset_sec
	corpsemask = /obj/item/clothing/mask/breath
	corpseglasses = /obj/item/clothing/glasses/sechud/tactical
	corpsehelmet = /obj/item/clothing/head/helmet/space/void/security
	corpsepocket1 = /obj/item/weapon/handcuffs
	corpseback = /obj/item/weapon/storage/backpack/security
	corpseid = 1
	corpseidjob = "Ironhammer Gunnery Sergeant"

/obj/landmark/corpse/roles/security/ironhammermedspecialist
	name = "Ironhammer Medical Specialist"
	corpseuniform = /obj/item/clothing/under/rank/medspec
	corpsesuit = /obj/item/clothing/suit/storage/toggle/labcoat/medspec
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/thick
	corpseradio = /obj/item/device/radio/headset/headset_sec
	corpsebelt = /obj/item/weapon/storage/belt/medical
	corpsepocket1 = /obj/item/weapon/handcuffs
	corpseback = /obj/item/weapon/storage/backpack/security
	corpseid = 1
	corpseidjob = "Ironhammer Medical Specialist"

/obj/landmark/corpse/roles/security/ironhammermedspecialist/biosuit
	name = "Ironhammer Medical Specialist"
	corpseuniform = /obj/item/clothing/under/rank/medspec
	corpsesuit = /obj/item/clothing/suit/bio_suit/security
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/latex
	corpseradio = /obj/item/device/radio/headset/headset_sec
	corpsehelmet = /obj/item/clothing/head/bio_hood/security
	corpsebelt = /obj/item/weapon/storage/belt/medical
	corpsepocket1 = /obj/item/weapon/handcuffs
	corpseback = /obj/item/weapon/storage/backpack/security
	corpseid = 1
	corpseidjob = "Ironhammer Medical Specialist"

/obj/landmark/corpse/roles/security/ironhammermedspecialist/voidsuit
	name = "Ironhammer Medical Specialist"
	corpseuniform = /obj/item/clothing/under/rank/medspec
	corpsesuit = /obj/item/clothing/suit/space/void/security
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/stungloves
	corpseradio = /obj/item/device/radio/headset/headset_sec
	corpsemask = /obj/item/clothing/mask/breath
	corpsehelmet = /obj/item/clothing/head/helmet/space/void/security
	corpsebelt = /obj/item/weapon/storage/belt/medical
	corpsepocket1 = /obj/item/weapon/handcuffs
	corpseback = /obj/item/weapon/storage/backpack/security
	corpseid = 1
	corpseidjob = "Ironhammer Medical Specialist"

/obj/landmark/corpse/roles/security/ironhammerinspector
	name = "Ironhammer Inspector"
	corpseuniform = /obj/item/clothing/under/rank/inspector
	corpsesuit = /obj/item/clothing/suit/storage/insp_trench
	corpseshoes = /obj/item/clothing/shoes/reinforced
	corpsegloves = /obj/item/clothing/gloves/stungloves
	corpseradio = /obj/item/device/radio/headset/headset_sec
	corpsehelmet = /obj/item/clothing/head/rank/inspector
	corpsepocket1 = /obj/item/weapon/handcuffs
	corpseback = /obj/item/weapon/storage/backpack/security
	corpseid = 1
	corpseidjob = "Ironhammer Inspector"

/obj/landmark/corpse/roles/security/ironhammerinspector/biosuit
	name = "Ironhammer Inspector"
	corpseuniform = /obj/item/clothing/under/rank/inspector
	corpsesuit = /obj/item/clothing/suit/bio_suit/security
	corpseshoes = /obj/item/clothing/shoes/reinforced
	corpsegloves = /obj/item/clothing/gloves/latex
	corpseradio = /obj/item/device/radio/headset/headset_sec
	corpsehelmet = /obj/item/clothing/head/bio_hood/security
	corpsepocket1 = /obj/item/weapon/handcuffs
	corpseback = /obj/item/weapon/storage/backpack/security
	corpseid = 1
	corpseidjob = "Ironhammer Inspector"

/obj/landmark/corpse/roles/security/ironhammerinspector/voidsuit
	name = "Ironhammer Inspector"
	corpseuniform = /obj/item/clothing/under/rank/inspector
	corpsesuit = /obj/item/clothing/suit/space/void/security
	corpseshoes = /obj/item/clothing/shoes/reinforced
	corpsegloves = /obj/item/clothing/gloves/stungloves
	corpseradio = /obj/item/device/radio/headset/headset_sec
	corpsemask = /obj/item/clothing/mask/breath
	corpsehelmet = /obj/item/clothing/head/helmet/space/void/security
	corpsepocket1 = /obj/item/weapon/handcuffs
	corpseback = /obj/item/weapon/storage/backpack/security
	corpseid = 1
	corpseidjob = "Ironhammer Inspector"

/obj/landmark/corpse/roles/security/ironhammeroperative
	name = "Ironhammer Operative"
	corpseuniform = /obj/item/clothing/under/rank/security
	corpsesuit = /obj/item/clothing/suit/armor/vest/security
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/stungloves
	corpseradio = /obj/item/device/radio/headset/headset_sec
	corpseglasses = /obj/item/clothing/glasses/sechud/tactical
	corpsemask = /obj/item/clothing/mask/balaclava/tactical
	corpsehelmet = /obj/item/clothing/head/helmet
	corpsepocket1 = /obj/item/weapon/handcuffs
	corpseback = /obj/item/weapon/storage/backpack/security
	corpseid = 1
	corpseidjob = "Ironhammer Operative"

/obj/landmark/corpse/roles/security/ironhammeroperative/biosuit
	name = "Ironhammer Operative"
	corpseuniform = /obj/item/clothing/under/rank/security
	corpsesuit = /obj/item/clothing/suit/bio_suit/security
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/latex
	corpseradio = /obj/item/device/radio/headset/headset_sec
	corpseglasses = /obj/item/clothing/glasses/sechud/tactical
	corpsemask = /obj/item/clothing/mask/balaclava/tactical
	corpsehelmet = /obj/item/clothing/head/bio_hood/security
	corpsepocket1 = /obj/item/weapon/handcuffs
	corpseback = /obj/item/weapon/storage/backpack/security
	corpseid = 1
	corpseidjob = "Ironhammer Operative"

/obj/landmark/corpse/roles/security/ironhammeroperative/voidsuit
	name = "Ironhammer Operative"
	corpseuniform = /obj/item/clothing/under/rank/security
	corpsesuit = /obj/item/clothing/suit/space/void/security
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsegloves = /obj/item/clothing/gloves/stungloves
	corpseradio = /obj/item/device/radio/headset/headset_sec
	corpseglasses = /obj/item/clothing/glasses/sechud/tactical
	corpsemask = /obj/item/clothing/mask/breath
	corpsehelmet = /obj/item/clothing/head/helmet/space/void/security
	corpsepocket1 = /obj/item/weapon/handcuffs
	corpseback = /obj/item/weapon/storage/backpack/security
	corpseid = 1
	corpseidjob = "Ironhammer Operative"

///Roles - Command///

/obj/landmark/corpse/roles/command/firstofficer
	name = "First Officer"
	corpseuniform = /obj/item/clothing/under/rank/first_officer
	corpseshoes = /obj/item/clothing/shoes/reinforced
	corpseradio = /obj/item/device/radio/headset/heads/hop
	corpseglasses = /obj/item/clothing/glasses/sunglasses
	corpsepocket1 = /obj/item/weapon/flame/lighter/zippo
	corpseback = /obj/item/weapon/storage/backpack
	corpseid = 1
	corpseidjob = "First Officer"


/obj/landmark/corpse/roles/command/captain
	name = "Captain"
	corpseuniform = /obj/item/clothing/under/rank/captain
	corpseshoes = /obj/item/clothing/shoes/color/brown
	corpseradio = /obj/item/device/radio/headset/heads/captain
	corpseglasses = /obj/item/clothing/glasses/sunglasses
	corpsehelmet = /obj/item/clothing/head/rank/centcomm
	corpsepocket1 = /obj/item/weapon/flame/lighter/zippo
	corpseback = /obj/item/weapon/storage/backpack
	corpseid = 1
	corpseidjob = "Captain"

///Extra Roles (Jobs not on Eris, and generic personnel i.e. scientists not affiliated with Moebius)///

/obj/landmark/corpse/generic/clown
	name = "Clown"
	corpseuniform = /obj/item/clothing/under/costume/job/clown
	corpseshoes = /obj/item/clothing/shoes/costume/job/clown
	corpseradio = /obj/item/device/radio/headset
	corpsemask = /obj/item/clothing/mask/costume/job/clown
	corpsepocket1 = /obj/item/weapon/bikehorn
	corpseback = /obj/item/weapon/storage/backpack/clown
	corpseid = 1
	corpseidjob = "Clown"

/obj/landmark/corpse/generic/prisoner
	name = "Prisoner"
	corpseuniform = /obj/item/clothing/under/orange
	corpseshoes = /obj/item/clothing/shoes/orange

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
	corpseback = /obj/item/weapon/storage/backpack
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
	corpsemask = /obj/item/clothing/mask/gas/syndicate
	corpsehelmet = /obj/item/clothing/head/helmet/space/void/merc
	corpseback = /obj/item/weapon/tank/jetpack/oxygen
	corpsepocket1 = /obj/item/weapon/tank/emergency_oxygen
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
