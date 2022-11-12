
/datum/borer_chem
	var/id = ""
	var/name = ""
	var/cost = 1 // Per dose delivered.
	var/dose_size = 15

	var/unlockable=0

/datum/borer_chem/New()
	if(!id)
		return
	var/datum/reagent/C = GLOB.chemical_reagents_list[id]
	name = C.name

/datum/borer_chem/head
/datum/borer_chem/chest
/datum/borer_chem/arm
/datum/borer_chem/leg

/datum/borer_chem/head/bicaridine
	id = "bicaridine"

/datum/borer_chem/head/tramadol
	id = "tramadol"

/datum/borer_chem/head/alkysine
	id = "alkysine"
	//cost = 0

/datum/borer_chem/head/ryetalyn
	id = "ryetalyn"

/datum/borer_chem/head/methylin
	id = "methylin"

/datum/borer_chem/chest/blood
	id = "blood"

/datum/borer_chem/chest/imidazoline
	id = "imidazoline"

/datum/borer_chem/chest/inacusiate
	id = "inacusiate"

/datum/borer_chem/chest/lipozine
	id = "lipozine"

/datum/borer_chem/chest/ethylredoxrazine
	id = "ethylredoxrazine"

/datum/borer_chem/chest/oxycodone
	id = "oxydone"

/datum/borer_chem/chest/radium
	id = "radium"

/datum/borer_chem/chest/leporazine
	id = "leporazine"

/datum/borer_chem/chest/charcoal
	id = "charcoal"
	cost = 2

/datum/borer_chem/chest/anti_toxin
	id = "anti_toxin"

/datum/borer_chem/chest/inaprovaline
	id = "inaprovaline"
	cost = 2

/datum/borer_chem/arm/bicaridine
	id = "bicaridine"
	cost = 2

/datum/borer_chem/arm/kelotane
	id = "kelotane"
	cost = 2

/datum/borer_chem/leg/hyperzine
	id = "hyperzine"

////////////////////////////
// UNLOCKABLES
////////////////////////////

//datum/borer_chem/unlockable
//	unlockable=1

/datum/borer_chem/head/unlockable
	unlockable=1
/datum/borer_chem/chest/unlockable
	unlockable=1
/datum/borer_chem/arm/unlockable
	unlockable=1
/datum/borer_chem/leg/unlockable
	unlockable=1

/datum/borer_chem/head/unlockable/space_drugs
	id = "space_drugs"
	cost = 2

/datum/borer_chem/head/unlockable/paracetamol
	id = "paracetamol"
	cost = 2

/datum/borer_chem/head/unlockable/dexalin
	id = "dexalin"
	cost = 2

/datum/borer_chem/head/unlockable/dexalinp
	id = "dexalinp"
	cost = 2

/datum/borer_chem/head/unlockable/peridaxon
	id = "peridaxon"
	cost = 2

/datum/borer_chem/head/unlockable/rezadone
	id = "rezaone"
	cost = 2

/datum/borer_chem/chest/unlockable/nutriment
	id = "nutriment"
	cost = 2
/*
/datum/borer_chem/chest/unlockable/paismoke
	id = PAISMOKE
	cost = 15
*/
/datum/borer_chem/chest/unlockable/arithrazine
	id = "arithrazine"
	cost = 2

/datum/borer_chem/chest/unlockable/capsaicin
	id = "capsaicin"
	cost = 2

/datum/borer_chem/chest/unlockable/frostoil
	id = "frostoil"
	cost = 2

/datum/borer_chem/chest/unlockable/quickclot
	id = "quickclot"
	cost = 10

/datum/borer_chem/chest/unlockable/dermaline
	id = "dermaline"
	cost = 2

/datum/borer_chem/arm/unlockable/cafe_latte
	id = "cafe_latte"
	cost = 1

/datum/borer_chem/arm/unlockable/iron
	id = "iron"
	cost = 1
/*
/datum/borer_chem/leg/unlockable/bustanut
	id = BUSTANUT
	cost = 2
*/
/datum/borer_chem/leg/unlockable/synaptizine
	id = "synaptizine"
	cost = 2
