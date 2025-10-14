
//////////////////////////////
//ORDER MATTERS FOR FEEDBACK//
//////////////////////////////

/datum/bolus_crafting
	var/min = 42 //The MINIUM we need to craft
	var/max = 42 //The MAXIUM we before we cant be crafted
	var/item = /obj/item/reagent_containers/pill/adminordrazine
	var/alinement = "Will" //What the Bolus maker must be

//Immortality

/datum/bolus_crafting/revival
	min = 70
	max = 90
	item = /obj/item/bolus/revival
	alinement = "Immortality"

/datum/bolus_crafting/revival_mkii
	min = 110
	max = 120
	item = /obj/item/bolus/revival_mkii
	alinement = "Immortality"

//Still

/datum/bolus_crafting/cqc
	min = 30
	max = 70
	item = /obj/item/bolus/cqc
	alinement = "Still"

/datum/bolus_crafting/armor
	min = 90
	max = 120
	item = /obj/item/bolus/armor
	alinement = "Still"

/datum/bolus_crafting/agro
	min = 150
	max = 300
	item = /obj/item/bolus/agro
	alinement = "Still"

//Moving

/datum/bolus_crafting/slowdown_reduction
	min = 30
	max = 60
	item = /obj/item/bolus/slowdown_reduction
	alinement = "Moving"

/datum/bolus_crafting/slowdown_reduction_mkii
	min = 90
	max = 120
	item = /obj/item/bolus/slowdown_reduction_mkii
	alinement = "Moving"

//Weaving

/datum/bolus_crafting/healing
	min = 10
	max = 50
	item = /obj/item/bolus/healing
	alinement = "Weaving"

/datum/bolus_crafting/healing_mkii
	min = 50
	max = 80
	item = /obj/item/bolus/healing_mkii
	alinement = "Weaving"

/datum/bolus_crafting/healing_mkiii
	min = 80
	max = 90
	item = /obj/item/bolus/healing_mkiii
	alinement = "Weaving"

//Calm

/datum/bolus_crafting/core_implants
	min = 30
	max = 50
	item = /obj/item/bolus/core_implants
	alinement = "Calm"

/datum/bolus_crafting/core_implants_mkiii
	min = 51
	max = 59
	item = /obj/item/bolus/core_implants/mkiii
	alinement = "Calm"

/datum/bolus_crafting/core_implants_mkii
	min = 60
	max = 90
	item = /obj/item/bolus/core_implants/mkii
	alinement = "Calm"
