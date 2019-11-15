
var/list/dreams = list(
//Items & Structures
	"a bullet casing","an ammo magazine","a body bag","a broken device","a pile of remains","a shooting target",
	"a roll of tape","a plushie","a toy","a piece of trash","a wheelchair","a tie","a holster","a locket",
	"an eyepatch","a blindfold","a pair of gloves","a sombrero","a helmet","a cowboy hat","a beanie","a bandana",
	"a gas mask","a surgical mask","a halloween mask","a pair of shoes","a pair of jackboots","a gorka","a firesuit",
	"a duster","a snowsuit","a formal suit","a prison jumpsuit","a medical gown","a swimsuit","a terminal","a missile",
	"a warning sign","a painting","a poster","a biogenerator","a microwave","an operating table","a violin","a scanner",
	"a common item","an uncommon item","a rare item","a hidden treasure","a PDA","a radio","a camera","a freezer",
	"a flamethrower","a pistol","a sniper rifle","a laser cannon","a knife","a crossbow","an improvised weapon",
	"a hair comb","a landmine","a newspaper","an oddity","a bag of money","a virus dish","a supermatter crystal",
	"a pair of handcuffs","a pair of legcuffs","a stool","a baton","a nuclear device","a toolbox", "a mind fryer",
	"a spy implant","a spy sensor",

//Feelings
	"admiration","adoration","appreciation","amusement","anxiety","awe","awkwardness","boredom","calmness","confusion",
	"craving","disgust","depression","entrancement","envy","excitement","greed","fear","horror","interest","lust","pain",
	"joy","nostalgia","romance","sadness","satisfaction","obsession","insanity","sexual desire","sympathy","triumph",

//Phrases
	"not a good idea","it might work","you can stop it","it's out of your control","consume it","don't touch it",
	"trust them","don't trust them","their loyalty is uncertain","it's worth the risk","for your own sake","it's the end",
	"the dawn of a new beginning","the final curtain","a new life","riches await","no fortunes here","good luck","i did it",
	"here!","i can't take this","not here!","don't you dare","look carefully","listen wisely","think hard","pull back",
	"give it up","don't give up","help me","impossible","bloody expensive","nice job","let me out of here","stay calm",
	"like a dream","this isn't a dream","are you ready","amazing chest ahead",

//Ranks
	"the First Officer","the Ironhammer Commander","the Technomancer Exultant","the Moebius Expedition Overseer",
	"the Moebius Biolab Officer","the Guild Merchant","a Assistant","a Bartender","a Janitor","a Gardener",
	"a Preacher","a Entertainer","a Chef","a Moebius Medical Doctor","a Moebius Psychologist","a Moebius Paramedic",
	"a Moebius Chemist","a Moebius Scientist","a Moebius Roboticist","a Cyborg","a Guild Technician","a Guild Miner",
	"a Technomancer", "a Ironhammer Operative","a Ironhammer Gunnery Sergeant","a Ironhammer Inspector", "the Captain",
	"a Ironhammer Medical Specialist",

//Races (Check Creatures Before Adding Stuff Here, There's Some Overlap!)
	"a human","a sablekyne","a kriosan","a mar'qua","a seelie","a sergal","a abhuman","a vox","a cht'mant","a wolf",
	"a fox","a husky","a shark","a slimewolf","an angel","a demon","a dragon","a dogborg","a kobold","a bird","a squirrel",
	"a bunny","a siberian spacebat","a synth","a lamia","a wabbite","a polar bear","a lion","a coyote","a deer",
	"a crocodile","a strange hybrid","a nevrean","an agudner","an otie","a squid","a synx",

//People
	"a friend","an enemy","a loved one","an acquaintance","a stranger","an unknown individual","a hidden figure",
	"a legless being","an armless being","a winged being","a tailed being","a fellow soldier","a superior","a subordinate",

//Creatures & Hostiles
	"a alien drone","a alien sentinel","a alien queen","a bear","a space carp","a space pike","a creature",
	"a diyaab","a one star autonomous drone","a one star autonomous sentinel","a hivemind probe","a hivemind cyborg",
	"a hivemind zombie","a hivemind maneater","a hivemind warped","a hivemind marionette","a hivemind stinger",
	"a hivemind tyrant","a one star type 0315","a mimic","a nanite infested miniroach cluster","a scavenger",
	"a clown","a goat","a combat drone","a russian soldier","a samak","a bat swarm","a shantak","a mercenary",
	"a sentient tree","a viscerator","a vox armalis","a slime","a cortical borer","a cat","a chick","a chicken",
	"a corgi","a cow","a crab","a fennec","a goose","a lizard","a mouse","a sentient mushroom","a parrot","a penguin",
	"a red panda","a fae panda","a space worm","a spiderbot","a tindalos","a sentient tomato","a yithian","a giant spider",
	"a giant nurse spider","a giant hunter spider","a kampfer roach","a fuhrer roach","a jager roach","a kraftwerk roach",
	"a seuche roach","a panzer roach","a gestrahlte roach","a disembodied brain","a monkey","a shadekin",

//Factions/Groups
	"the marshals","the blackshield militia","the prospectors","the excelsior institute","lonestar shipping solutions",
	"the artificers guild","the nadezhda council","mercenary groups","scavenger gangs","terrorist groups","outside forces",

//Station Locations
	"the arrivals area","the bar","the emergency storage","the transfer shuttle","the tool storage","the bar","the chapel",
	"the holodeck","the hydroponics area","the kitchen","the freezer","the locker room","the theatre","the medbay",
	"the chemistry lab","the morgue","the operating theatre","the recovery room","the cargo bay","the warehouse",
	"the research lab","the server room","the toxins test chamber","the technical storage","the engine","the armory",
	"the telecommunications chamber","the brig","the courtroom","the interrogation room","the security post","the vault",
	"the teleporter","the maintenance tunnels",

//Other Locations
	"the darkness of space","the empty void","the planet surface","the space ruins","the derelict","the smuggler hideout",
	"the enemy vessel","the caverns","the smoky room","the construction site","the stash location","the roach nest",
	"an abandoned laboratory","a cold place","a warm place","an airless environment",

//Events
	"a meteor impact","a hijacking","an assassination", "a meeting","a secret meeting","a party","a wedding","a funeral",
	"a death","a critical injury","a shooting","a stabbing","a beating","an accident","a terrible accident","a near miss",
	"a coincidence","a strange event","a mystery","an investigation","a trial","a kidnapping","a sentencing","a robbery",
	"an imprisonment","a theft","an enemy attack","a therapy session","a gym session","a birthday","a disappearance",
	"a betrayal","a confession","a secret revealed","a decision made","a difficult choice","a romance","a celebration",
	"a blackout","a power failure","an engine failure","a crash","a catastrophe","a miracle","an alliance","a discovery",
	"a battle","a war","a victory","a defeat","a surrender", "a fungal outbreak", "a contagious disease", "an experiment",
	"a scavenger hunt","an expedition","a journey","a chase","an exploration","a risky move","a conversation","a good time",
	"a code yellow","a code red","an explosion","a nuclear detonation","an encounter","a regretful moment","getting pounced on",
	"an assassination contract")


mob/living/carbon/proc/dream()
	dreaming = 1

	spawn(0)
		for(var/i = rand(1,4),i > 0, i--)
			to_chat(src, "\blue <i>... [pick(dreams)] ...</i>")
			sleep(rand(40,70))
			if(paralysis <= 0)
				dreaming = 0
				return 0
		dreaming = 0
		return 1

mob/living/carbon/proc/handle_dreams()
	if(client && !dreaming && prob(5))
		dream()

mob/living/carbon/var/dreaming = 0
