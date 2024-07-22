//This is set of item created to work with Eris stat and perk systems
//The idea here is simple, you find oddities in random spawners, you use them, and they grant you stats, or even perks.
//After use, the object is claimed, and cannot be used by someone else
//If rebalancing is needed, keep in mind spawning rate of those items, it might be good idea to change that as well
//Clockrigger 2019

/obj/item/oddity
	name = "An Oddity"
	desc = "Strange item of uncertain origin."
	icon = 'icons/obj/oddities.dmi'
	icon_state = "techno_part3"
	item_state = "techno_part3"
	w_class = ITEM_SIZE_SMALL

//You choose what stat can be increased, and a maximum value that will be added to this stat
//The minimum is defined above. The value of change will be decided by random
	var/random_stats = TRUE //Do we randomize the stats at all on spawn?
	var/list/oddity_stats  //This is are stat field form cog to vig and were we put are value
	var/sanity_value = 1
	var/datum/perk/oddity/perk //This is so we can link a perk into the oddity
	var/prob_perk = 40 //how likely it is to role a perk - if prek isnt present, out of 100
	var/min_stats = 1 //The lowest amount it can give when randomizing
	var/kill_stats = FALSE


/obj/item/oddity/Initialize()
	. = ..()
	AddComponent(/datum/component/atom_sanity, sanity_value, "")
	var/area/my_area = get_area(src.loc)
	if(!my_area)
		oddity_rolling()
		return
	if(my_area.name == "Deep Maintenance") //Shockingly this is how get area works
		upgraded_oddity_rolling()
	else
		oddity_rolling()

/obj/item/oddity/proc/oddity_rolling()
	if(!perk && prob(prob_perk))
		perk = get_oddity_perk()
	if(oddity_stats)
		if(random_stats)
			for(var/stat in oddity_stats)
				oddity_stats[stat] = rand(min_stats, oddity_stats[stat])
		AddComponent(/datum/component/inspiration, oddity_stats, perk, kill_stats)

/obj/item/oddity/proc/upgraded_oddity_rolling()
	if(!perk && prob(prob_perk+5))
		perk = get_good_perk()
	if(oddity_stats)
		if(random_stats)
			for(var/stat in oddity_stats)
				oddity_stats[stat] = round((oddity_stats[stat] = rand(min_stats, oddity_stats[stat]) * 1.5))
		AddComponent(/datum/component/inspiration, oddity_stats, perk, kill_stats)

/proc/get_oddity_perk()
	return pick(subtypesof(/datum/perk/oddity))


/proc/get_good_perk()
	return pick(GOOD_ODDITY_PERKS)

/obj/item/oddity/examine(user)
	..()

//Oddities are separated into categories depending on their origin. They are meant to be used both in maints and derelicts, so this is important
//This is done by subtypes, because this way even densiest code monkey will not able to misuse them
//They are meant to be put in appropriate random spawners

//Common - you can find those everywhere
/obj/item/oddity/common/blueprint
	name = "strange blueprint"
	desc = "There's no telling what this design is supposed to be. Whatever could be built from this likely wouldn't work yet the Greyson Positronic logo near the top makes one wonder."
	icon_state = "blueprint"
	prob_perk = 10 //Old blueprints nothing much to manifest on
	oddity_stats = list(
		STAT_COG = 3,
		STAT_MEC = 4
	)

/obj/item/oddity/common/coin
	name = "strange coin"
	desc = "It appears to be more of a collectible than any sort of actual currency. What metal it's made from seems to be a mystery."
	icon_state = "coin"
	prob_perk = 50 //The coin is a 50/50 as thats what the mind perceives the odds being
	oddity_stats = list(
		STAT_ROB = 4,
		STAT_TGH = 4
	)

/obj/item/oddity/common/photo_landscape
	name = "alien landscape photo"
	desc = "There is some ire about the planet in this photograph."
	prob_perk = 30 //Unknown and alien, leaving a good amount to imagine being their
	icon_state = "photo_landscape"
	oddity_stats = list(
		STAT_COG = 4,
		STAT_TGH = 4
	)

/obj/item/oddity/common/photo_coridor
	name = "surreal maint photo"
	desc = "The corridor in this photograph looks familiar, though something seems wrong about it; it's as if everything in it was replaced with an exact replica of itself."
	icon_state = "photo_corridor"
	prob_perk = 25 //Limited by the grounding of something familiar its hard to imagine newness inside it
	oddity_stats = list(
		STAT_MEC = 4,
		STAT_TGH = 4
	)

/obj/item/oddity/common/photo_eyes
	name = "observer photo"
	desc = "Just looking at this photo sparks a primal fear in your heart."
	icon_state = "photo_corridor"
	prob_perk = 45 //Something deep inside the mind can manifest itself drastically
	oddity_stats = list(
		STAT_ROB = 5,
		STAT_TGH = 5,
		STAT_VIG = 5
	)

/obj/item/oddity/common/old_newspaper
	name = "odd newspaper clipping" //Old old news papers are a good joke
	desc = "It contains a report on some old and strange phenomenon. Maybe it's lies, maybe it's corporate experiments gone wrong. The date listed on it is impossible, yet it bears the stamp of the Nadezhda."
	icon_state = "old_newspaper"
	prob_perk = 10 //Grounded in rality and able to be discarded as yellow journalism
	oddity_stats = list(
		STAT_MEC = 2,
		STAT_COG = 2,
		STAT_BIO = 2
	)

/obj/item/oddity/common/paper_crumpled
	name = "turn-out page"
	desc = "This ALMOST makes sense, it details connections and similarities between groups, yet the nonsensical phrasing makes it seem like one huge conspiracy."
	icon_state = "paper_crumpled"
	prob_perk = 5 //Inked manmen dont really make one imagine something new
	oddity_stats = list(
		STAT_MEC = 3,
		STAT_COG = 3,
		STAT_BIO = 3
	)

/obj/item/oddity/common/broken_glass
	name = "smashed glass jar"
	desc = "A broken glass jar, covered in dust and left with a stained rim."
	icon_state = "broken_glassjar"
	prob_perk = 35 //Unknown liquids unknown containment allowing for room to speculate without grounding
	oddity_stats = list(
		STAT_BIO = 10,
		STAT_ROB = 5
	)

/obj/item/oddity/common/paper_omega
	name = "collection of obscure reports"
	desc = "Even the authors seem to be rather skeptical about their findings. The reports are not connected to each other, but their results are similar. The logo is faded, making it hard to tell if this was Greyson, Soteria, or an independent group."
	icon_state = "reports1"
	prob_perk = 45 //The skeptical mind of the inker helps keep it grounded but it shows something unable to be shaken out of the mind
	oddity_stats = list(
		STAT_MEC = 6,
		STAT_COG = 6,
		STAT_BIO = 6
	)

/obj/item/oddity/common/paper_omega/Initialize()
	icon_state = "reports[rand(1,6)]" // All these unused sprites will now add variety to reports. - Seb
	.=..()

/obj/item/oddity/common/book_eyes
	name = "observer book"
	desc = "This book details information on some cybernetic creatures. Who did this? How is this even possible? The illustrations bear uncomfortable likeness to hivemind abominations."
	icon_state = "book_omega"
	prob_perk = 15 //A book of robotic beings well fearing an upraising its paranioa in the puplics mind, only given power by mar qua
	oddity_stats = list(
		STAT_ROB = 7,
		STAT_TGH = 7,
		STAT_VIG = 7
	)

/obj/item/oddity/common/book_omega // Dummy parent for crayon magic purposes
	oddity_stats = list(
		STAT_BIO = 5,
		STAT_ROB = 5,
		STAT_VIG = 5
	)

/obj/item/oddity/common/book_omega/closed
	name = "occult book"
	desc = "Most of the stories in this book seem to be the ramblings of an insane cultist, but at least the stories are interesting. \
			Some of the phrases are written in a language that makes sense at times, but becomes intelligible to you a second after. Something about candles around a magic circle on the floor...\
			While this sounds like utter nonsense to you, you have a dreadful feeling that using this book in the runes described would have some sinister effect..."
	icon_state = "book_eyes" // This sprite fits better an occult book, swapped with the observer one.
	prob_perk = 15 //old wrighting with the madmans ink allows the mind to go a bit more wild then just a single paper

/obj/item/oddity/common/book_omega/opened
	name = "open occult book"
	icon_state = "book_eyes_open"
	item_state = "book_eyes_open" // Yes, it HAS spooky on-hand sprites!
	desc = "The book floats open in your hands, infinite forbidden knowledge and non-euclidean geometry contained within at your disposal. \
			The anomaly has been strengthened in its odd nature by forces unknown, but is still perfectly functional for your rituals..."
	oddity_stats = list(
		STAT_BIO = 9,
		STAT_ROB = 9,
		STAT_VIG = 9
	)

/obj/item/oddity/common/broken_key
	name = "broken key"
	desc = "An archaic yellow or golden key that belongs to an unknown door. The end bit has broken off..."
	prob_perk = 75 //A key to an unknown item or place, this one gets quite the imagination...
	icon_state = "broken_key"
	oddity_stats = list(
		STAT_COG = 10
	)

/obj/item/oddity/common/book_bible
	name = "old bible"
	desc = "This is the account of the heavens and the earth when they were created..."
	icon_state = "book_bible"
	prob_perk = 5 //Grounded and talked about, hard to think outside the box when given its history and known lore
	force = 1
	effective_faction = list("psi_monster") // roach are weak to bricks.
	damage_mult = 15 //15~, damage to psionic mobs no AP
	oddity_stats = list(
		STAT_ROB = 4,
		STAT_VIG = 4
	)

/obj/item/oddity/common/book_log
	name = "forgotten logs"
	desc = "A once detailed book containing information on all manner of things, ruined pages and smudged writings are all what's left of it..."
	icon_state = "book_log"
	prob_perk = 15 //Grounded in the real life and the real planets nature anomliest yes but still has links to the plan
	oddity_stats = list(
		STAT_TGH = 7,
		STAT_ROB = 6,
		STAT_MEC = 3
	)

/obj/item/oddity/common/instructional_bio
	name = "first-aid book"
	desc = "Instructional manual for Soteria personnel giving basic knowledge of CPR and how to deal with Unruly patients"
	icon_state = "instructional_bio"
	prob_perk = 5 //Grounded and talked about, instructional manual for Lifeline techs
	oddity_stats = list(
		STAT_BIO = 6,
		STAT_ROB = 4,
	)

/obj/item/oddity/common/instructional_cog_python
	name = "old coding book"
	desc = "A guide giving instructions on how to write computer code, This one seems to be covered in tears with the initials L.T. under the book's cover."
	icon_state = "instructional_cog_python"
	prob_perk = 15 //references
	oddity_stats = list(
		STAT_TGH = 4,
		STAT_COG = 6
	)


/obj/item/oddity/common/old_money
	name = "old money"
	desc = "It's not like the organization that issued this exists anymore."
	icon_state = "old_money"
	prob_perk = 5 //Money well having power grants some power
	oddity_stats = list(
		STAT_ROB = 5,
		STAT_TGH = 2
	)

/obj/item/oddity/common/healthscanner
	name = "odd health scanner"
	desc = "It's broken and stuck on some really strange readings. What species is this data from, even...?"
	icon_state = "healthscanner"
	item_state = "electronic"
	prob_perk = 10 //Powerful as unreadable data is its not all that able to be exspanded on
	oddity_stats = list(
		STAT_COG = 4,
		STAT_BIO = 6
	)

/obj/item/oddity/common/old_pda
	name = "broken pda"
	desc = "An old unknown era PDA. These were issued to their employees all throughout the galaxy."
	prob_perk = 3 //Old pda old phones old things are not all that odd but a small story on what data it could have had, not able to be manifested on
	icon_state = "old_pda"
	item_state = "electronic"
	oddity_stats = list(
		STAT_COG = 3,
		STAT_MEC = 6
	)

/obj/item/oddity/common/towel
	name = "trustworthy towel"
	desc = "It's always good to have one with you."
	icon_state = "towel"
	prob_perk = 2 //A trinket nothing more
	oddity_stats = list(
		STAT_ROB = 4,
		STAT_TGH = 4
	)

/obj/item/oddity/common/teddy
	name = "teddy bear"
	desc = "He will be there for you, even in tough times."
	icon_state = "teddy"
	prob_perk = 7 //itself is a oddity to think it would be able to protect
	oddity_stats = list(
		STAT_ROB = 7,
		STAT_TGH = 7,
		STAT_VIG = 7
	)

/obj/item/oddity/common/tattoo
	name = "tattoo kit"
	desc = "An odd box containing various tools used in the process of creating tattoos. You have a feeling this set of tools was well taken care of and cherished, but do to age they are rendered unuseable."
	icon_state = "tattoo_kit"
	prob_perk = 7 //ponder and devote yourself to the craft like the artist before you.
	oddity_stats = list(
		STAT_COG = 8,
		STAT_TGH = 8
	)

/obj/item/oddity/common/old_knife
	name = "old knife"
	desc = "Is this blood older than you? You can't tell and probably you will never know."
	icon_state = "old_knife"
	item_state = "knife"
	prob_perk = 5 //Only so much you can imagine a knife about
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 5)
	force = WEAPON_FORCE_DANGEROUS
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	slot_flags = SLOT_BELT
	sharp = TRUE
	edge = TRUE

	oddity_stats = list(
		STAT_ROB = 7,
		STAT_TGH = 7
	)

/obj/item/oddity/common/rusted_sword
	name = "rusted sword" //Sword was never maintained or used
	desc = "A withered sword hilt with a rusted blade still barely slotted in place. Was this just for show?"
	icon_state = "rusted_sword"
	item_state = "knife"
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 5)
	force = WEAPON_FORCE_ROBUST
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	slot_flags = SLOT_BELT
	sharp = TRUE
	edge = TRUE

	prob_perk = 7 //only so much you can think about a sword
	oddity_stats = list(
		STAT_MEC = 7, //What maintance prevents
		STAT_BIO = 7, //Understanding rot and rust
	)

/obj/item/oddity/common/old_id
	name = "old id"
	desc = "There is a story behind this name. Untold and cruel in fate."
	icon_state = "old_id"
	prob_perk = 5 //Old thing just some plastic thats hard to read nothing to exspand the mind on
	oddity_stats = list(
		STAT_VIG = 8
	)

/obj/item/oddity/techno
	name = "Unknown technological part"
	desc = "A technological part made by the Artificer Perfection Cube."
	icon_state = "techno_part1"
	prob_perk = 25 //Unknown tech unknown parts unknown uses by a cult much to exspand the mind in

/obj/item/oddity/techno/Initialize()
	icon_state = "techno_part[rand(1,7)]"
	.=..()

/obj/item/oddity/common/old_radio
	name = "old radio"
	desc = "Close your eyes, bring it closer and listen. You can almost hear it, in the edge of your consciousness. The world is ticking."
	icon_state = "old_radio"
	prob_perk = 3 //Russian radio numbers well intresting wouldnt be exspanded on other then thinking idealy
	oddity_stats = list(
		STAT_COG = 7,
		STAT_VIG = 8
	)

/obj/item/oddity/common/paper_bundle
	name = "paper bundle"
	desc = "There surely is a glimmer of truth, hidden under all of this dissociated knowledge."
	icon_state = "paper_bundle"
	prob_perk = 20 //Data, so much data to grasp straws on
	oddity_stats = list(
		STAT_BIO = 4,
		STAT_ROB = 4,
		STAT_VIG = 6
	)

/obj/item/oddity/common/disk
	name = "broken design disk"
	desc = "This disk is corrupted and completely unusable. It has a hand-drawn picture of some strange mechanism on it - looking at it for too long makes your head hurt."
	icon_state = "disc"
	prob_perk = 60 //Something corrupted and ruined like a design disk must have been tampred by something or someone this is easy to endlessly think about
	oddity_stats = list(
		STAT_MEC = 10
	)

/obj/item/oddity/common/redbrick
	name = "red brick"
	desc = "A small red brick that makes a silly sound."
	icon_state = "brick"
	force = WEAPON_FORCE_DANGEROUS
	throwforce  = WEAPON_FORCE_BRUTAL
	oddity_stats = list(
		STAT_MEC = 4,
		STAT_TGH = 4,
		STAT_ROB = 3
	)
	hitsound = 'sound/weapons/redbrick.ogg'
	effective_faction = list("roach") // roach are weak to bricks.
	damage_mult = 2
	prob_perk = 0 //Just a brick


/obj/item/oddity/common/mirror
	name = "cracked mirror"
	desc = "A thousand mirror images stare back at you as you examine the trinket. What if you're the reflection, staring back out at the real world? At the real you?"
	icon_state = "mirror"
	prob_perk = 40 //Bad luck to think on
	oddity_stats = list(
		STAT_COG = 2,
		STAT_VIG = 4
	)

/obj/item/oddity/common/mirror/doodle
	prob_perk = 0
	perk = PERK_NO_OBFUSCATION
	kill_stats = TRUE
	min_stats = 16
	oddity_stats = list(
		STAT_COG = 18
	)

/obj/item/oddity/common/lighter
	name = "rusted lighter"
	desc = "This zippo lighter is rusted shut. It smells faintly of sulphur and blood."
	icon_state = "syndicate_lighter"
	prob_perk = 10 //hard to manifest on this
	oddity_stats = list(
		STAT_TGH = 7
	)

/obj/item/oddity/common/device
	name = "odd device"
	desc = "Something about this gadget both disturbs and interests you. Its manufacturer's name has been mostly smudged away, but you can see a strange mechanism as their logo."
	icon_state = "device"
	prob_perk = 60 //something unknown does unknown and cant really be used leading to wild speculation
	oddity_stats = list(
		STAT_MEC = 8,
		STAT_COG = 6
	)

/obj/item/oddity/common/book_unholy // Parent so that we can benefit from rituals

/obj/item/oddity/common/book_unholy/closed
	name = "unholy book"
	desc = "The writings inside describe some strange rituals wrote in crayons. Some pages have been torn out or smudged to illegibility, \
			but what little you can make out tells you that \"...to be able to see beyond the veil, the caster will need to be half blind...\". \
			While this may look like utter nonsense to you, the dreadful feeling that using this book in the runes described would have some sinister effect..."
	icon_state = "book_skull"
	prob_perk = 80 //Cult around this gives it great power
	oddity_stats = list(
		STAT_COG = 3,
		STAT_MEC = 7
	)

/obj/item/oddity/common/book_unholy/opened
	name = "awakened unholy book"
	desc = "The book floats open in your hands, infinite forbidden knowledge and non-euclidean geometry contained within at your disposal. \
			The anomaly has been strengthened in its odd nature by forces unknown, but is still perfectly functional for your rituals..."
	icon_state = "book_skull_open"
	item_state = "book_skull_open"
	oddity_stats = list(
		STAT_COG = 6,
		STAT_MEC = 9
	)

/obj/item/oddity/common/photo_crime
	name = "crime scene photo"
	desc = "It is unclear whether this is a victim of suicide or murder. His face is frozen in a look of agony and terror, and you shudder to think at what his last moments might have been."
	icon_state = "photo_crime"
	prob_perk = 30 //The idea of death can manifest something onto any canvus its on
	oddity_stats = list(
		STAT_COG = 9,
		STAT_VIG = 9
	)

/obj/item/oddity/rare/eldritch_tie
	name = "Horrifying tie"
	desc = "A tie no one would be caught dead wearing!"
	icon_state = "eldritch_tie"
	min_stats = 10
	oddity_stats = list(
		STAT_COG = 12,
		STAT_TGH = 12,
		STAT_BIO = 12,
		STAT_ROB = 12
	)
	price_tag = 2000 //Its a good tie for a collector
	perk = PERK_SURE_STEP //Insainly rare and ok stats, but really its the perk. In Disco-E this perk would save you so much making this the perfect joke

/obj/item/oddity/rare/moon_fragment
	name = "Fragment of Moon"
	desc = "A glowing, white, glass like shard of the Amethyn Moon."
	icon_state = "moon_fragment"
	min_stats = 16
	//Its 1 then done so we give quite a bit
	oddity_stats = list(
		STAT_COG = 18,
		STAT_VIG = 18
	)
	price_tag = 2500 //Bluecross spawn
	prob_perk = 0
	kill_stats = TRUE
	perk = PERK_SKILL_CAP_EXPANDING

/obj/item/oddity/rare/drawing_of_sun
	name = "Drawing of a Unknown Sun"
	desc = "A drawing of a type of sun no one has ever seen before done in crayon."
	icon_state = "crayon_sun"
	min_stats = 3
	oddity_stats = list(
		STAT_COG = 1,
		STAT_VIG = 2
	)
	price_tag = 5
	perk = PERK_SKILL_CAP_ADDITION
	prob_perk = 0
	kill_stats = TRUE

//Non-Spawn
//Odditys that are event only or spawned in on map gen
/obj/item/oddity/rare/golden_cup
	name = "Colony Games Trophy"
	desc = "A trophy earned during the monthly competitions between various factions. The gold is fashioned from anomalous metal, giving it beneficial properties to carry with you. Hold your factions achievement high!"
	icon_state = "golden_cup" // Sprite by Dongels
	min_stats = 5
	oddity_stats = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_VIG = 8,
		STAT_BIO = 8,
		STAT_ROB = 8,
		STAT_VIG = 8
	)
	perk = PERK_GUNSLINGER

/obj/item/oddity/broken_necklace
	name = "Broken necklace"
	desc = "A broken necklace that has a blue crystal as a trinket."
	icon_state = "broken_necklace"
	origin_tech = list(TECH_BLUESPACE = 9)
	min_stats = 7
	oddity_stats = list(
		STAT_COG = 9,
		STAT_VIG = 9,
		STAT_ROB = 9,
		STAT_TGH = 9,
		STAT_BIO = 9,
		STAT_MEC = 9
	)
	price_tag = 12000
	var/cooldown
	var/entropy_value = 5
	var/blink_range = 8
	prob_perk = 0 //Pure

/obj/item/oddity/broken_necklace/New()
	..()
	GLOB.bluespace_gift++
	GLOB.bluespace_entropy -= rand(30, 50)

/obj/item/oddity/broken_necklace/examine(user, distance)
	. = ..()
	var/area/my_area = get_area(src)
	if(my_area.bluespace_entropy < (my_area.bluespace_hazard_threshold * 0.75))
		to_chat(user, SPAN_NOTICE("This feels cold to the touch."))

	else
		to_chat(user, SPAN_NOTICE("This feels warm to the touch."))

	if(GLOB.bluespace_entropy > GLOB.bluespace_hazard_threshold*0.7)
		to_chat(user, SPAN_NOTICE("Has it always shone so brightly?"))

	if(my_area.bluespace_entropy > my_area.bluespace_hazard_threshold*0.95 || GLOB.bluespace_hazard_threshold > GLOB.bluespace_hazard_threshold*0.95)
		to_chat(user, SPAN_NOTICE("You can see an inscription in some language unknown to you."))


/obj/item/oddity/broken_necklace/Destroy()
	var/turf/T = get_turf(src)
	if(T)
		bluespace_entropy(80,T)
		new /obj/item/bluespace_dust(T)
	GLOB.bluespace_gift--
	return ..()

/obj/item/oddity/broken_necklace/attack_self(mob/user)
	if(world.time < cooldown)
		return
	cooldown = world.time + 3 SECONDS
	user.visible_message(SPAN_WARNING("[user] crushes [src]!"), SPAN_DANGER("You crush [src]!"))
	var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
	sparks.set_up(3, 0, get_turf(user))
	sparks.start()
	var/turf/T = get_random_secure_turf_in_range(user, blink_range, 2)
	go_to_bluespace(get_turf(user), entropy_value, TRUE, user, T)
	for(var/obj/item/grab/G in user.contents)
		if(G.affecting)
			go_to_bluespace(get_turf(user), entropy_value, FALSE, G.affecting, locate(T.x+rand(-1,1),T.y+rand(-1,1),T.z))
	if(prob(1))
		qdel(src)

/obj/item/oddity/broken_necklace/throw_impact(atom/movable/hit_atom)
	if(!..()) // not caught in mid-air
		visible_message(SPAN_NOTICE("[src] fizzles upon impact!"))
		var/turf/T = get_turf(hit_atom)
		var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
		sparks.set_up(3, 0, T)
		sparks.start()
		if(!hit_atom.anchored)
			var/turf/NT = get_random_turf_in_range(hit_atom, blink_range, 2)
			go_to_bluespace(T, entropy_value, TRUE, hit_atom, NT)
		if(prob(1))
			qdel(src)

/obj/item/oddity/blackbox_nanoforge
	name = "Matter Nano-Forge Black Box"
	desc = "The core and data of all the designs for the Matter Nano-Forge. The craftsmanship being some of the best possible by hand tools alone."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "blackcube"
	min_stats = 10
	oddity_stats = list(
		STAT_COG = 15,
		STAT_MEC = 15
	)
	perk = PERK_BLACKBOX_INSIGHT

/obj/item/oddity/bath
	name = "Lonestar Smelling Salts"
	desc = "A bottle of water that smells a lot of pork and cocaine. This will kick you back into your seat but don't expect your brain to like it much."
	icon_state = "cursed_hog"
	random_stats = FALSE
	oddity_stats = list(
		STAT_TGH = 8,
		STAT_ROB = 8,
		STAT_VIG = 8
	)
	price_tag = 1000
	perk = PERK_FAILING_MIND //You sure will get brain damage if you get anywhere near this

//A randomized oddity with random stats, meant for artist job project
/obj/item/oddity/artwork
	name = "Strange Device"
	desc = "You can't find out how to turn it on. Maybe it's already working?"
	icon_state = "artwork_1"
	price_tag = 200
	prob_perk = 0//no perks for artwork oddities

/obj/item/oddity/artwork/Initialize()
	name = get_weapon_name(capitalize = TRUE)
	icon_state = "artwork_[rand(1,6)]"
	. = ..()

/obj/item/oddity/artwork/get_item_cost(export)
	. = ..()
	GET_COMPONENT(comp_sanity, /datum/component/atom_sanity)
	. += comp_sanity.affect * 100
	GET_COMPONENT(comp_insp, /datum/component/inspiration)
	var/list/true_stats = comp_insp.calculate_statistics()
	for(var/stat in true_stats)
		. += true_stats[stat] * 50

//Faction Oddities
/obj/item/oddity/nt
	random_stats = FALSE

/obj/item/oddity/nt/seal
	name = "Cartographer's Seal"
	desc = "A badge carrying the seal of the cartographer of the Church of Absolute, said to be marked with a tithe of blood as proof of its sacred nature. An extremely rare sight, as many of these seals are thought to be lost. Merely holding one is said to inspire divine right. The church would be immensely interested in this."
	icon_state = "nt_seal"
	oddity_stats = list(
		STAT_TGH = 12,
		STAT_VIG = 12,
		STAT_ROB = 12
	)
	price_tag = 8000
	perk = PERK_HOLY_LIGHT

/obj/item/oddity/nt/pyramid
	name = "Pyramid"
	desc = "A small sandstone pyramid, covered in bizzare engravings. The Cartographer of the Church of the Absolute has declared relics like this holy beyond any doubt, though none know exactly why."
	icon_state = "pyramid"
	oddity_stats = list(
		STAT_TGH = 16
	)
	price_tag = 8000
	perk = PERK_STRANGTH

/obj/item/oddity/chimeric_fang_trophy
	name = "Chimera Fang Trophy"
	desc = "A scrimshaw carved chimera fang turned into a trophy, the bone either taken from a butchered chimera or hunting companion fallen in battle. In either case, its very presence hardens the holder's resolve."
	icon_state = "chimera_trophy"
	oddity_stats = list(
		STAT_ROB = 12,
		STAT_TGH = 12,
		STAT_BIO = 8
	)
	price_tag = 800 //Its a good trophy for a collector
	perk = PERK_HARDEN

/obj/item/oddity/si_bluespace_scanner
	name = "Bluespace Tuning Device"
	desc = "An anomalous, experimental tool produced by the Soteria Institute to get accurate readings of local and global Bluespace entropy." // It's a lie that it stabilizes Bluespace.
	icon_state = "si_scan"
	item_state = "si_scan"
	matter = list(MATERIAL_PLASTIC = 15, MATERIAL_STEEL = 10, MATERIAL_PLASMAGLASS = 2, MATERIAL_GOLD = 10, MATERIAL_SILVER = 10, MATERIAL_PLASMA = 5, MATERIAL_DIAMOND = 1)
	oddity_stats = list(
		STAT_COG = 2, //trash stats for mass-printed trash
		STAT_MEC = 2
	)
	perk = PERK_SHARP_MIND //TODO: fix /datum/perk/bluespace

/obj/item/oddity/si_bluespace_scanner/attack_self(mob/user as mob)
	var/area/my_area = get_area(src)
	if(my_area.bluespace_entropy)
		to_chat(user, SPAN_NOTICE("The Nullifier's scanner is detecting bluespace entropy in this room to be [my_area.bluespace_entropy] zeframs."))

	if(GLOB.bluespace_entropy)
		to_chat(user, SPAN_NOTICE("The Nullifier's global scanner notifies of stellar discrepancy at [GLOB.bluespace_entropy] zeframs of bluespace entropy on the planet."))

// Considering the vast amount of references in code, a Zefram being a unit of measurement for Bluespace Entropy fits, while not being directly a Cochrane. - Seb

/obj/item/oddity/code_book
	name = "Marshal Code Handbook"
	desc = "A heavy book with details and translations of the Marshal codes."
	icon_state = "instructional_rob" // Fits better with a supposed Marshal's logo up front. - Seb
	oddity_stats = list(
		STAT_VIG = 6
	)
	price_tag = 3200 //So we have a reason for stealing it
	perk = PERK_CODESPEAK

/obj/item/oddity/chem_book
	name = "Chemistry Reference Table"
	desc = "A heavy book with details and translations of chemistry and its affects on the body, even has some guides on how to properly use chemicals."
	icon_state = "instructional_bio"
	oddity_stats = list(
		STAT_BIO = 6
	)
	price_tag = 3200 //So we have a reason for stealing it
	perk = PERK_CHEMIST

//Lonestar
//Oddities that are only orderable through Lonestar cargo

/obj/item/oddity/ls
	prob_perk = 0
	price_tag = 200

/obj/item/oddity/ls/collector_coin
	name = "Collector's Coin"
	desc = "Got it for a good price!"
	icon_state = "collector_coin"
	oddity_stats = list(
		STAT_COG = 2
	)

/obj/item/oddity/ls/pamphlet
	name = "Old Tourist Pamphlet"
	desc = "A leaflet with all the great reasons you should visit 'Humanity's Cradle'. A keepsake for those wanting overexposed photos of a past life."
	icon_state = "earth_pamphlet"
	oddity_stats = list(
		STAT_TGH = 2
	)

/obj/item/oddity/ls/rod_figure
	name = "Immovable Rod Action Figure"
	desc = "More moveable than the real thing; just as stiff."
	icon = 'icons/obj/objects.dmi'
	icon_state = "immrod"
	item_state = "nullrod"
	w_class = ITEM_SIZE_NORMAL
	oddity_stats = list(
		STAT_TGH = 2,
		STAT_MEC = 2
	)

/obj/item/oddity/ls/chess_set
	name = "Chess set"
	desc = "Pieces - you guessed it - aren't included."
	icon_state = "chess_set"
	w_class = ITEM_SIZE_NORMAL
	oddity_stats = list(
		STAT_COG = 5
	)

/obj/item/oddity/ls/starscope
	name = "Starscope"
	desc = "Replica of an ancient, alien device. It was used for sublight, space travel, acting as a 'star compass'."
	icon_state = "starscope"
	oddity_stats = list(
		STAT_COG = 2,
		STAT_MEC = 5
	)

/obj/item/oddity/ls/flashdrive
	name = "USB flash drive"
	desc = "An outdated, Earther, data storage device. Little more than a technical curiosity, now.	"
	icon_state = "flashdrive"
	oddity_stats = list(
		STAT_MEC = 2
	)

/obj/item/oddity/ls/mutant_tooth
	name = "Mutated Tooth"
	desc = "A Cindarite tooth featuring an uncommon (and very painful) mutation. You can't wait to study it!"
	icon_state = "mutant_tooth"
	oddity_stats = list(
		STAT_BIO = 7
	)

/obj/item/oddity/ls/manual
	name = "Specialist Manual"
	desc = "A rugged, somewhat poor compilation of notes and pages from a variety of books and manuals. \
			The first few pages feature information ranging from how to make a molotov cocktail to how to hotwire a mech."
	icon_state = "manual"
	oddity_stats = list(
		STAT_COG = 2,
		STAT_MEC = 1,
		STAT_BIO = 1,
		STAT_TGH = 1,
		STAT_VIG = 1,
		STAT_ROB = 1
	)

/obj/item/oddity/ls/bouquet
	name = "Bouquet"
	desc = "It has the sweetest aroma. You feel the flutter of butterflies."
	icon_state = "bouquet"
	item_state = "bouquet"
	w_class = ITEM_SIZE_NORMAL
	oddity_stats = list(
		STAT_TGH = 5
	)

/obj/item/oddity/ls/magazine
	name = "Swimming Magazine"
	desc = "A good, swimming magazine. Nowadays, it's mostly for collection purposes."
	icon_state = "magazine"
	oddity_stats = list(
		STAT_TGH = 2,
		STAT_BIO = 2
	)

/obj/item/oddity/ls/dogtags
	name = "SolFed Dogtags"
	desc = "Mementos from the war. Krios has recently begun exporting their surplus."
	icon_state = "tags"
	oddity_stats = list(
		STAT_TGH = 2,
		STAT_ROB = 2
	)

//Lonestar Clothing Oddities
//for oddities that double as clothes

/obj/item/oddity/ls/silk_cloak
	name = "Silk Cloak"
	desc = "The latest fashion craze on Krios!"
	icon_state = "silk_cloak"
	item_state = "silk_cloak"
	slot_flags = SLOT_OCLOTHING
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	oddity_stats = list(
		STAT_TGH = 2,
		STAT_COG = 2
	)

//Lonestar Weapon Oddities
//oddities that double as weapons

/obj/item/oddity/ls/kriosan_sword
	name = "Kriosan Officer Sword" //double-check and add desc
	desc = "A replica of the blades given to Kriosan military officers, as a reward for their loyal service."
	icon_state = "kriosan_sword"
	item_state = "saber"
	matter = list(MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 5)
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE
	force = WEAPON_FORCE_DANGEROUS
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	tool_qualities = list(QUALITY_CUTTING = 10)
	slot_flags = SLOT_BELT
	sharp = TRUE
	edge = TRUE
	armor_divisor = ARMOR_PEN_SHALLOW

	oddity_stats = list(
		STAT_ROB = 7
	)

//Lonestar Misc Oddities
//Primarily for gimmicks that aren't weapon or clothing related

/obj/item/oddity/ls/newton_odd
	name = "Newton Cradle"
	desc = "Physics is amazing."
	icon_state = "newtoncradle"
	var/on = FALSE
	oddity_stats = list(
		STAT_MEC = 6
	)

/obj/item/oddity/ls/newton_odd/AltClick(var/mob/user)
	if(on)
		icon_state = "newtoncradle"
		on = FALSE
	else
		icon_state = "newtoncradle-on"
		on = TRUE

/obj/item/oddity/ls/newton_odd/attack_self(mob/user as mob)
	if(on)
		icon_state = "newtoncradle"
		on = FALSE
	else
		icon_state = "newtoncradle-on"
		on = TRUE

/obj/item/oddity/ls/puzzlebox
	name = "Puzzlebox" //todo add cool sound
	desc = "Looks oddly similar to a positronic brain. Something tells you you're better off not solving it."
	icon_state = "puzzlebox"
	price_tag = 650
	var/openchance = 0.2
	var/stumped_people = list()
	oddity_stats = list(
		STAT_COG = 5,
		STAT_VIG = 2
	)

/obj/item/oddity/ls/puzzlebox/attack_self(mob/user as mob)
	if(user in stumped_people)
		to_chat(user, "<span class='info'>Further attempts have gotten you no closer to solving the [src].</span>")
		return
	if(prob(openchance))
		new /mob/living/carbon/superior_animal/human/stranger(user.loc)
		new /obj/item/oddity/rare/openedpuzzlebox(user.loc)
		to_chat(user, SPAN_WARNING("[src] clicks and lights up!"))
		qdel(src)
	else
		to_chat(user,("<span class='info'>After several attempts and frustrating, indecisive clicks, you decide to put down the [src].</span>"))
		stumped_people += user

/obj/item/oddity/ls/starprojector
	name = "Starprojector"
	desc = "A handheld holoprojector. The beauty of uncountable planets is held within its storage."
	icon_state = "projector"
	var/on = FALSE
	oddity_stats = list(
		STAT_COG = 8
	)

/obj/item/oddity/ls/starprojector/attack_self(mob/user as mob)
	if (on)
		on = FALSE
		icon_state = "projector"
		to_chat(user, "<span class='info'>The [src] flickers and dies.</span>")

	else
		on = TRUE
		icon_state = "projector_on"
		to_chat(user, "<span class='info'>The [src] shows you the beauty of the galaxy. A host of worlds, now beyond your reach.</span>")

/obj/item/oddity/ls/inertdetonator //todo stop being lazy and give it a closed sprite
	name = "Inert Detonator"
	desc = "A device that was once in the hand of a terrorist; its payload is long dead. It's a miracle this thing ever worked, still, it's cool to look at!"
	icon_state = "detonator"
	var/inert = FALSE
	var/boom = 1
	oddity_stats = list(
		STAT_MEC = 5,
		STAT_TGH = 2
	)

/obj/item/oddity/ls/inertdetonator/attack_self(mob/user as mob)
	if(inert)
		to_chat(user,("<span class='info'> The [src] clicks! Neat.</span>"))
		return

	if(prob (boom))
		to_chat(user, SPAN_WARNING("The [src] clicks! Uh oh."))
		explosion(src.loc, -1, 1, 4, 10)
		qdel(src)

	else
		to_chat(user,("<span class='info'> The [src] clicks! Neat.</span>"))
		inert = TRUE

//Lonestar Special
//For unique oddities that don't fit into other categories

/obj/item/oddity/rare/openedpuzzlebox
	name = "Opened Puzzlebox" //todo add cool sound; make sure path is correct
	desc = "The box... it's been opened."
	icon_state = "puzzlebox_open"
	prob_perk = 100 //Pandoras box
	min_stats = 15
	oddity_stats = list(
		STAT_COG = 25,
		STAT_VIG = 25
	)
