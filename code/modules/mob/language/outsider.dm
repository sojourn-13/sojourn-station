/datum/language/xenocommon
	name = LANGUAGE_XENOMORPH
	colour = "alien"
	desc = "The common tongue of the xenomorphs."
	speech_verb = list("hisses")
	ask_verb = list("hisses")
	exclaim_verb = list("hisses")
	key = "4"
	flags = RESTRICTED
	syllables = list("sss","sSs","SSS")
	shorthand = "Xeno"
	has_written_form = FALSE

/*
/datum/language/xenos
	name = LANGUAGE_HIVEMIND
	desc = "Xenomorphs have the strange ability to commune over a psychic hivemind."
	speech_verb = list("hisses")
	ask_verb = list("hisses")
	exclaim_verb = list("hisses")
	colour = "alien"
	key = "a"
	flags = RESTRICTED | HIVEMIND
	shorthand = "N/A"

/datum/language/xenos/check_special_condition(var/mob/other)

	var/mob/living/carbon/M = other
	if(!istype(M))
		return 1
	if(locate(/obj/item/organ/internal/xenos/hivenode) in M.internal_organs)
		return 1

	return 0
*/

/datum/language/cultcommon
	name = LANGUAGE_CULT
	desc = "The chants of the occult, the incomprehensible."
	speech_verb = list("intones")
	ask_verb = list("intones")
	exclaim_verb = list("chants")
	colour = "cult"
	key = "c"
	flags = RESTRICTED | NO_TRANSLATE
	space_chance = 100
	has_written_form = TRUE		//I҉̵̴̢҉̶̸̴̵̸̷̷̴̷̷̶̷̴̵̡̨̡̢̧̨̧̡̛̛̛̛̛̀́̀́̀̀̕͘̕͜͢͢͢͜͜͢͜͢͡͞͠͠͠͝͠͡͠͠͞͠ ͜͢҉̴̷̵̨̧̢̛̛̛͝͏̧́̀́̀̕̕͘̕͘͜͢͠͡͏̴̸̶̴̧̛́́́͟͢͡͞͠͞͏̴̴̵̵̵̵̢̨̢̧͟͟͠͞͡͠͞͝͡ḉ̷̸̶̧̢̧̀́͟͢͟͟͢͜͠͡҉̢̛͟͏̷̶̸̡̡̨̡̛̛́͘͢͜͢͠͏̡̧̕͝͏̸̶́́̀͢͢͢͢͡͠͠ ͞͞͏̷̷̀̕͠҉͡͏̸̶̸̷̨̧̨̢̨̨̨́́̀̕̕͜͞͡͏͏̵̴̶̸̀́͟͠u̶̵̡̢̧̕͟͢͝͏̵̶҉̧҉̛͠͝͡҉̶̸̴̶̨̡̀́̀̀́̀͢͢͡͝͝͡͞͡
	syllables = list("phlegethor","kadishtu","nahlizet","naf'lthagn","fhtagn","jatkaa","mgar","balaq", "karazet", "exim’ha", \
		"shatruex", "crunatus", "sas'so", "c'arta", "forbici", "cruonita", "n'ath", "reth", "sh'yro", "eth", "d'raggathnor", \
		"mah'weyh", "pleggh", "at", "e'ntrath", "tok-lyr", "rqa'nap", "g'lt-ulotf", "ta'gh", "fara'qha", "pretaanluxis", "lokemundux", \
		"yu'gular", "faras", "ngah", "havas", "stragarana", "stragarana", "umathar", "uf'kal", "maranax", "rash'tla", \
		"sektath", "mal'zua", "zasan", "malax", "viortia", "kla'atu", "barada", "nikt'o", "fwe'sh", "mah", "erl", "nyag", "r'ya", \
		"gal'h'rfikk", "harfrandid", "syha'h", "pretiacruento", "invisux", "dedo", "ol'btoh", "n'ath", "reth", "sh'yro", "eth", \
		"crudux", "khari'd", "gual'te", "cruo", "nikt'o", "barada", "kla'atu", "barhah", "hra" ,"zar'garis")
	shorthand = "CT"

/datum/language/cult
	name = LANGUAGE_OCCULT
	desc = "The initiated can share their thoughts by means defying all reason."
	speech_verb = list("intones")
	ask_verb = list("intones")
	exclaim_verb = list("chants")
	colour = "cult"
	key = "z"
	flags = RESTRICTED | HIVEMIND
	shorthand = "N/A"
	has_written_form = FALSE	//Hiveminds don't get a written language.


// Alien species languages.
//TODO: Eventually organize these into another language .dm that isn't 'outsider'. Why did we decided to put languages here like this in the first place?
//I was going to leave the exact same comment as above before i saw it. Why is it here?

// Chtmant racial language. Lore: Roaches are a hivemind with a queen, so therefor they sport hivemind speek.
/datum/language/chtmant
	name = LANGUAGE_CHTMANT
	desc = "The hivemind linking all cht'mants who share a common hive ancestry."
	speech_verb = list("chitters")
	ask_verb = list("clocks")
	exclaim_verb = list("screes")
	colour = "cult"
	key = "o"
	flags = RESTRICTED | HIVEMIND
	shorthand = "N/A"
	has_written_form = FALSE	//Hiveminds don't get a written language.

//Opifex racial language. Lore: Literally vox clone. Some intelligibility with Yassari because it's a nomadic based trade-tongue language.
/datum/language/vox
	name = LANGUAGE_OPIFEXEE
	desc = "The chants of the opifex, the incomprehensible garbling of birds."
	speech_verb = list("squawks")
	ask_verb = list("chirps")
	exclaim_verb = list("screeches")
	colour = "opifex"
	key = "f"
	flags = RESTRICTED | NO_TRANSLATE
	partial_understanding = list(
		LANGUAGE_YASSARI = 20
	)
	space_chance = 60
	has_written_form = TRUE
	syllables = list("ti","ti","ti","hi","hi","ki","ki","ki","ki","ya","ta","ha","ka","ya","chi","cha","kah", \
	"SKRE","AHK","EHK","RAWK","KRA","AAA","EEE","KI","II","KRI","KA")
	shorthand = "N/A"

//Kriosan racial language. Lore: German creolization due to Sol-Gov occupation; therefor intelligibility with German.
/datum/language/kriosan
	name = LANGUAGE_KRIOSAN
	desc = "The main language of Krios, Kriosan Creole. Mostly consiting of quill-hound noises, posturing and many Eurolang loan words."
	speech_verb = list("states", "rumbles")
	ask_verb = list("stipulates", "huffs")
	exclaim_verb = list("barks", "yips")
	colour = "kriosan"
	key = "k"
	has_written_form = FALSE	//Lore reason - Creolized German and their ancient native language. Therefor their written language is 'dead' effectively.
	partial_understanding = list(
		LANGUAGE_EURO = 75,
		LANGUAGE_COMMON = 10
	)
	shorthand = "KO"
	syllables = list("Frau", "Mann", "Waffe", "Schiff", "Bombe", "Explosion", "Grenze", "Strasse", "Halle", "Pistole", "Gewehr", "Uniform", "Kind", "Arzt", \
					 "und", "ja", "nein", "vielleicht", "ob", "Hund", "Hundt", "katse", "Rüde", "Pleite", "Schreckschraube", "Klammer", "fahren","Raumschiff", \
 					 "Serbien", "Eisenhammer", "Soteria", "Atmosphaere", "Generator", "Ingenieur", "Religion", "Ratte", "Priester", "Käfer", "Armee", "Regierung", "neu", \
 					 "fuß", "braver", "Hoffnung", "schauen", "sterben", "elektrisch", "Teufel", "kurieren", "Fleisch", "trinken", "Auftrag", "Hilfe", "Medizin", "zeppelin", \
 					 "verfallen", "Verfall", "National", "Laser", "Strom", "Gruppe", "Verteidigung", "verteidigen", "suche", "Auge", "Hand", "Bein", "Kopf", \
 					 "Flucht", "teufel", "Ritter", "Einfluss", "Einfall", "Muesli", "Wand", "Fenster", "Metall", "Holz", "Glas", "platz",  \
 					 "Bleib", "gib laut", "hunden", "sitz", "Weltraum", "Turbine", "Treibstoff", "platt", "dunkel", "hell", "tauchen", "Licht", "scheinen", \
 					 "Kaiser", "bekaempfen", "Tastatur", "Augenlicht", "verwerfen", "analysieren", "verschieben", \
 					 "Flammen", "Feuer", "Batterie", "laser", "Unwetter", "Abflug", "behandeln", "Roboter", "Regierung", \
					 "Unterhaltung", "Platituede", "Pferd", "Poker", "spielen", "Stopp", "Baum", "Raumschlacht", "Kolonie", "kolonisieren", \
 					 "Gas", "Schaltung", "umstuerzen", "Umsturz", "Wissenschaft", "erforschen", "Forschung", "Psychologe", "Schmerz", \
 					 "Schmerzen", "gebrochen", "brechen", "alle", "Musik", "also", "Interesse", "Pruegel", "Alkohol", "Getraenk", \
 					 "dynamisch", "Dynamik", "Organisation", "hauptsache", "ueberhaupt", "weil", "denn", "deshalb", "mir", "dir", \
 					 "dein", "mein", "ihr", "eure", "seine", "meine", "Hier", "Fisch", "Ziege")

//Aqula racial language. Lore: Long history of indpendence from Sol, therefor their language did not intergrate much. Somewhat physical language due to showing of force, akin to grunts, posturing or facial expressions providing context to wording (I.e akin to a tonal language style but with body language instead).
/datum/language/akula
	name = LANGUAGE_AKULA
	desc = "A historic language spoken by Akula for centuries. Includes physical gestures and gutteral noises, mixing both verbal and non-verbal language elements."
	speech_verb = list("grunts", "utters")
	ask_verb = list("queries")
	exclaim_verb = list("roars")
	colour = "akula"
	key = "a"
	has_written_form = FALSE //Lore reason - Warrior culture, likely did not adapt much of a writing system since it was unneeded. Literacy / Acedmia done in foreign tongues.
	partial_understanding = list(
		LANGUAGE_JANA = 10,
		LANGUAGE_JIVE = 20
	)
	shorthand = "AQ"
	syllables = list("qy","bok","mok","yok","dy","gly","ryl","byl","dok","forbici", "tarem", "n'ath", "reth", "sh'yro", "eth", "d'raggathnor","niii",
	"d'rekkathnor", "khari'd", "gual'te", "ki","ki","ki","ki","ya","ta","wej","nym","assah","qwssa","nieasl","qyno","shaffar",
	"eg","bog","voijs","nekks","bollos","qoulsan","borrksakja","neemen","aka","nikka","qyegno","shafra","beolas","Byno") //Todo: Add something original here. Borrows from Bay's cult-speak since it looked somewhat fitting.

//Marqua racial language. Lore: Did not integrate into Sol, therefor their langauge has remained mostly untouched. Only mild influences from buisnesses, trade, and frontier languages.
/datum/language/marqua
	name = LANGUAGE_MARQUA
	desc = "A language spoken commonly by Marqua across the galaxy. Most of its sounds are unique, being noted as near impossible to replicate many of the noises by other species."
	speech_verb = list("warbles")
	ask_verb = list("trills")
	exclaim_verb = list("rythmically trills")
	flags = RESTRICTED
	colour = "marqua"
	key = "q"
	has_written_form = TRUE
	partial_understanding = list(
		LANGUAGE_JANA = 20,
		LANGUAGE_YASSARI = 10
	)
	shorthand = "MQ"
	space_chance = 20
	syllables = list("qr","qrr","xuq","qil","quum","xuqm","vol","xrim","zaoo","qu-uu","qix","qoo","zix","*","!") //Todo: Add actual stuff here. This is borrowed from Bay skrell because I'm unoriginal.

//Mycus and Folken language. Lore: Both are native to the planet for centuries yet are not spare-faring. Both are based off fauna life and live 'in touch' with the planet. Therefor, common hivemind language through the plent.
/datum/language/plant
	name = LANGUAGE_PLANT
	desc = "One of the few native languages of the local peoples of Amerith. The transmission of this language is unknown, but believed to be through either local vibrations, transmited through plant life or other anomolous means."
	speech_verb = list("creaks")
	ask_verb = list("rattles")
	exclaim_verb = list("crackles")
	flags = RESTRICTED | HIVEMIND
	colour = "plant"
	key = "p"
	has_written_form = FALSE //Hiveminds don't get a written language.

//Naramad language. full credit to Yanniert for all of the details herein contained.
/datum/language/merp
	name = LANGUAGE_MERP
	desc = "A crude pidgin tongue, not created by it's supposedly native speakers, but by their foreign overlords. Enforced as the only legal native language of the Naramadi people by the Federation as a means to unify the planet and make administrative work easier, while allowing them to keep a semblance of native culture."
	speech_verb = list("says", "clicks")
	ask_verb = list("chirps")
	exclaim_verb = list("croaks")
	colour = "rough"
	key = "n"
	has_written_form = TRUE
	partial_understanding = list(
		LANGUAGE_COMMON = 10,
		LANGUAGE_EURO = 10
	)
	shorthand = "NP"
	space_chance = 5
	syllables = list("Punainen", "Koira", "Tuolla", "Rikas", "syvä", "kivääri", "ulkomaalainen", "ihmisen", "sammakko", "taivaaseen", "Koti", "tilaa",  "sinä", "vastustamaton", "heimo", "klaani",  "kotitalous", "raha", "iso", "pieni", "sairaus", "ruokaa", "alkoholia", "kana", "asevelvollisuus", "alus", "joki", "saari", "ase", "veitsi", "juusto", "pää", "häntää", "taistelevat", "halaamalla", "ystävät", "ystävyys", "kansainyhteisö", "liitto", "aurinko", "missä", "mitä", "kun", "Miten", "siksi", "laulu", "kalastaa", "hämärä", "epäilyttävä", "luottamus", "kusipää", "paskiainen", "ääliö", "munata", "*!*")

//Cindarite language: Lore: Cindarite Voc being a languaged optimized for clear communication. Its function over form having a clear distinct lack of metaphors and emphasizes mostly on relaying any information as optimal as possible due to their upbringing in bunkers on a highly dangerous homeworld. 
/datum/language/weh
	name = LANGUAGE_WEH
	desc = "Cindarite Voc is language emphasizes clear communication with a distinct lack of metaphors and figures of speech to avoid unnecessary missunderstandings. It consists mostly of a combination of various hissing noises and guttural roars. Generations upon generations of living in bunkers on a highly hazardous planet resulted in Cindarite Voc from degrading from a colorful descriptive language to more rigid and functional tool to relay information."
	speech_verb = list("says", "hisses")
	ask_verb = list("inquires")
	exclaim_verb = list("bellows")
	colour = "cindarite" //placeholder for now till somebody can explain me how to set this up proper 
	key = "u"
	has_written_form = TRUE
	partial_understanding = list(
		LANGUAGE_COMMON = 20, 
		LANGUAGE_YASSARI = 10, 
		LANGUAGE_EURO = 10, 
		LANGUAGE_JANA = 10 
	)
	shorthand = "CRV"
	space_chance = 50
	syllables = list("ssa", "zra", "sz", "sssc", "i", "zro", "zii", "zr", "zs", "sz", "ssso", "ol",  "or", "ar", "weh", "ors",  "uuz", "izu", "iso", "e", "a", "u", "lo", "ak", "ssro", "nar", "nra", "nzo", "ee", "li", "ki", "eeh", "ssh", "hssr", "hiissr", "rass", "sie", "lu", "ku", "ri", "bi", "bso", "om", "rro", "siksi", "don", "su", "sss", "ars", "ree", "ssan")
