
var/list/dreams = list(
//Devices, Appliances, Tools
	"an arcade machine","an AI card","a biogenerator","a biomatter canister","a bioprinter","a bioreactor","a bluespace crystal",
	"a broken device","a burnt circuit","a cable","a camera","a console","a conveyor belt","a core sampler","a cyberplant",
	"a cyborg recharging station","a cryopod","a coolant tank","a debugger","a depth scanner","a design disk","a defibrillator",
	"an electronic assembly","an encryption key","a flashlight","a floor painter","a freezer","a fuel tank","a hailer",
	"an integrated circuit","a laptop","a lever","a mecha chassis","a mass spectrometer","a megaphone","an MMI","a microwave",
	"a mind fryer","a nuclear device","an operating table","a PDA","a power sink","a power storage unit","a radio","a reagent scanner",
	"a recharger","a relay positioning device","a roll of tape","a scanner","a scrap beacon","a solar panel","a spy implant",
	"a spy sensor","a suit cooling unit","a supermatter crystal","a toolbox","a violin","a virus dish","a universal recorder","a tablet",
	"a telescreen","a television","a toilet","a TTS device","a uplink beacon","a water cooler","a wheelchair",

//Structures
	"an air vent","an airlock","a bed","a bedsheet","a bookcase","a boulder","a burrow","a catwalk","a chair","a closet","a coat rack",
	"a curtain","a disposals chute","a dog bed","an emergency shutter","a filing cabinet","a floor tile","a medical stand","a mirror",
	"a notice board","a painting","a poster","a roller bed","a reinforced window","a showcase","a sofa","a stool","a sign","a table",
	"a transit tube","a wardrobe","a web","a warning sign","a window","an entropy inversion device",

//Weapons
	"a bullet casing","an ammo magazine","a missile","a flamethrower","a pistol","a sniper rifle","a laser cannon","a knife",
	"a crossbow","an improvised weapon","a landmine","a baton","a pair of handcuffs","a pair of legcuffs", "a SA C-20r","a dart gun",
	"an AKMS","a Drozd","a Makarov","an Ostwind",
	"a Kalashnikov","aHustler","a Longarm","an Omnirifle","a Osprey",
	"a Boar","a Bulldog","a Pitbull","a Giskard","an Olivaw",
	"a Lamia","a Naga","a Bronco","a Colt","a Mandella","a Basilisk",
	"a Delta Elite","a Stallion","a Clarissa","a Firefly","a Molly","a Mateba",
	"a Mistral","a Havelock","a Deckard","a Bull","a MAC",
	"a Texan","a Straylight","a handmade pistol","a L6 SAW","a Penetrator","a Zeus",
	"a Rose","a Regulator","a Pulse Rifle","an RPG","a STS","the Head Unpatter",

//Clothing
	"a blindfold","an eyepatch","a monocle","a pair of aviators","a pair of glasses","a pair of goggles","a pair of earmuffs",
	"an armband","a badge","a holster","a leg brace","a neck brace","a scarf","a stethoscope","a tie","a waistcoat","a pair of gloves",
	"a bandana","a beanie","a beret","a cap","a cowboy hat","a fez","a helmet","a hood","a sombrero","a top hat","a ushanka",
	"a welding helmet","a balaclava","a breath mask","a gas mask","a muzzle","a surgical mask","a mask","a cigarette","a smoking pipe",
	"a pair of shoes","a pair of boots","a pair of jackboots","a pair of magboots","a pair of footwraps","a pair of slippers",
	"a bio suit", "a bomb suit","a firesuit","a radiation suit","a shirt","a universal sling","a straight jacket","an overcloak",
	"a poncho","a gorka","a greatcoat","a hoodie","a bulletproof vest","a bathrobe","a burial gown","a jumpsuit","a jumpskirt",
	"a prison jumpsuit","a harness","a medical gown","a loincloth","a skirt","a dress","a formal suit","an undercoat","a top","a costume",
	"a duster","a snowsuit","a locket",

//Misc
	"a common item","an uncommon item","a rare item","a hidden treasure","a pile of remains","a body bag","a shooting target",
	"a plushie","a toy","a piece of trash","a hair comb","a newspaper","an oddity","a bag of money","a pat on the head",

//Feelings
	"admiration","adoration","appreciation","amusement","anxiety","awe","awkwardness","boredom","calmness","confusion",
	"craving","desire","disgust","depression","entrancement","envy","excitement","greed","fear","horror","interest","insanity",
	"lust","pain","joy","nostalgia","romance","sadness","satisfaction","obsession","insanity","sympathy","triumph",

//Phrases
	"not a good idea","it might work","you can stop it","it's out of your control","consume it","don't touch it",
	"trust them","don't trust them","their loyalty is uncertain","it's worth the risk","for your own sake","it's the end",
	"the dawn of a new beginning","the final curtain","a new life","riches await","no fortunes here","good luck","i did it",
	"here!","i can't take this","not here!","don't you dare","look carefully","listen wisely","think hard","pull back",
	"give it up","don't give up","help me","impossible","bloody expensive","nice job","let me out of here","stay calm",
	"like a dream","this isn't a dream","are you ready","amazing chest ahead",

//Ranks
	"the Steward","the Warrant Officer","the Blackshield Commander","the Guild Master","the Soteria Research Overseer",
	"the Soteria Biolab Overseer","the Surface Operations Manager","an Assistant","a Bartender","a Janitor","a Gardener",
	"a Prime","an Entertainer","a Chef","a Doctor","a Psychologist","a Soteria Paramedic",
	"a Soteria Chemist","a Soteria Scientist","a Soteria Roboticist","a Cyborg","a Cargo Technician","a Lonestar Miner",
	"a Guild Adept", "a Marshal Officer","a Supply Specialist","a Ranger", "the Premier",
	"a Corpsman","a Trooper",

//Races (Check Creatures Before Adding Stuff Here, There's Some Overlap!)
	"an abhuman","an akula","an angel","a bird","a bunny","a cht'mant","a coyote","a crocodile","a deer","a demon",
	"a dogborg","a dragon","a fox","a goblin","a human","a husky","a kobold","a kriosan","a lion","a mar'qua",
	"a polar bear",,"a sablekyne","a seelie","a sergal","a shark","a slime","a squid",
	"a squirrel","a strange hybrid","a synth","a wabbite","a wolf","a cindarite",

//People
	"a friend","an enemy","a loved one","an acquaintance","a stranger","an unknown individual","a hidden figure",
	"a legless being","an armless being","a winged being","a tailed being","a fellow soldier","a superior","a subordinate",

//Creatures & Hostiles
	"a alien drone","a alien sentinel","a alien queen","a bear","a space carp","a space pike","a creature",
	"a diyaab","a greyson positronic autonomous drone","a greyson positronic autonomous sentinel","a hivemind probe","a hivemind cyborg",
	"a hivemind zombie","a hivemind maneater","a hivemind warped","a hivemind marionette","a hivemind stinger",
	"a hivemind tyrant","a greyson positronic type 0315","a mimic","a nanite infested miniroach cluster","a scavenger",
	"a clown","a goat","a combat drone","a russian soldier","a samak","a bat swarm","a shantak","a mercenary",
	"a sentient tree","a viscerator","a vox armalis","a slime","a cortical borer","a cat","a chick","a chicken",
	"a corgi","a cow","a crab","a fennec","a goose","a lizard","a mouse","a sentient mushroom","a parrot","a penguin",
	"a red panda","a fae panda","a space worm","a spiderbot","a tindalos","a sentient tomato","a yithian","a giant spider",
	"a giant nurse spider","a giant hunter spider","a kampfer roach","a fuhrer roach","a jager roach","a kraftwerk roach",
	"a seuche roach","a panzer roach","a gestrahlte roach","a disembodied brain","a monkey","a shadekin","an impossible shape",
    "a crimson jelly","a fading memory","a psionic crusher","a monstrosity without a face","a creature with limbs upon limbs upon limbs",
    "a dark silluette",

//Factions/Groups
	"the marshals","the blackshield","the prospectors","the excelsior institute","lonestar shipping solutions",
	"the artificers guild","the nadezhda council","mercenary groups","scavenger gangs","terrorist groups","outside forces",

//Station Locations
	"the gate","the bar","the emergency storage","the transfer shuttle","the tool storage","the bar","the chapel",
	"the holodeck","the hydroponics area","the kitchen","the freezer","the locker room","the theatre","the medbay",
	"the chemistry lab","the morgue","the operating theatre","the recovery room","the cargo bay","the warehouse",
	"the research lab","the server room","the toxins test chamber","the technical storage","the engine","the armory",
	"the telecommunications chamber","the brig","the courtroom","the interrogation room","the security post","the vault",
	"the teleporter","the maintenance tunnels","the twisted tunnels of deep maintenance",

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
	"an assassination contract","a suited teleporting individual with a plasma SMG","a deep maintenance incursion",
    "a shuttlecraft flying backwards and upside down with a flag on it one does not recognize",
    "a single quake followed by all shadows rotating counter clockwise")


mob/living/carbon/proc/dream()
	dreaming = 1

	spawn(0)
		for(var/i = rand(1,4),i > 0, i--)
			to_chat(src, "\blue <i>... [pick(dreams)] ...</i>")
			sleep(rand(40,70))
			if(paralysis <= 0)
				dreaming = 0
				return
		dreaming = 0

mob/living/carbon/proc/handle_dreams()
	if(client && !dreaming && prob(5))
		dream()

mob/living/carbon/var/dreaming = 0
