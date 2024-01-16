
// CONTRABAND

/obj/item/contraband
	name = "contraband item"
	desc = "You probably shouldn't be holding this."
	icon = 'icons/obj/contraband.dmi'
	force = 0


/obj/item/contraband/poster
	name = "rolled-up poster"
	desc = "The poster comes with its own automatic adhesive mechanism, for easy pinning to any vertical surface."
	icon_state = "rolled_poster"
	var/serial_number = 0
	var/ruined = FALSE
	var/datum/poster/design = null

/obj/item/contraband/poster/New(turf/loc, var/datum/poster/new_design = null)
	if(!new_design)
		design = pick(GLOB.poster_designs)
	else
		design = new_design
	..(loc)

/obj/item/contraband/poster/placed
	icon_state = "random"
	anchored = TRUE
	New(turf/loc)
		if(icon_state != "random")
			for(var/datum/poster/new_design in GLOB.poster_designs)
				if(new_design.icon_state == icon_state)
					return ..(loc, new_design)
		..()
		if(iswall(loc) && !pixel_x && !pixel_y)
			for(var/dir in cardinal)
				if(isfloor(get_step(src, dir)))
					switch(dir)
						if(NORTH) pixel_y = -32
						if(SOUTH) pixel_y = 32
						if(EAST)  pixel_x = 32
						if(WEST)  pixel_x = -32

/obj/item/contraband/poster/attack_hand(mob/user as mob)
	if(!anchored)
		return ..()

	if(ruined)
		return

	switch(alert("Do I want to rip the poster from the wall?","You think...","Yes","No"))
		if("Yes")
			if(!Adjacent(user))
				return
			visible_message(SPAN_WARNING("[user] rips [src] in a single, decisive motion!") )
			playsound(src.loc, 'sound/items/poster_ripped.ogg', 100, 1)
			ruined = TRUE
			icon = initial(icon)
			icon_state = "poster_ripped"
			name = "ripped poster"
			desc = "You can't make out anything from the poster's original print. It's ruined."
			add_fingerprint(user)
		if("No")
			return

/obj/item/contraband/poster/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/tool/wirecutters))
		playsound(loc, 'sound/items/Wirecutter.ogg', 100, 1)
		if(ruined)
			to_chat(user, SPAN_NOTICE("You remove the remnants of the poster."))
			qdel(src)
		else
			roll_and_drop()
			to_chat(user, SPAN_NOTICE("You carefully remove the poster from the wall."))
		return

/obj/item/contraband/poster/proc/roll_and_drop()
	anchored = FALSE
	pixel_x = 0
	pixel_y = 0
	icon = initial(icon)
	icon_state = initial(icon_state)
	name = initial(name)


//Places the poster on a wall
/obj/item/contraband/poster/afterattack(turf/simulated/wall/W, mob/user, adjacent, clickparams)
	if (!adjacent)
		return

	//must place on a wall and user must not be inside a closet/mecha/whatever
	if (!istype(W) || !W.Adjacent(user))
		to_chat(user, SPAN_WARNING("You can't place this here!"))
		return

	var/turf/new_loc = null

	var/placement_dir = get_dir(user, W)
	if (placement_dir in cardinal)
		new_loc = user.loc
	else
		placement_dir = reverse_dir[placement_dir]
		for(var/t_dir in cardinal)
			if(!(t_dir & placement_dir)) continue
			if(iswall(get_step(W, t_dir)))
				if(iswall(get_step(W, placement_dir-t_dir)))
					break
				else
					new_loc = get_step(W, placement_dir-t_dir)
					break
			else
				if(iswall(get_step(W, placement_dir-t_dir)))
					new_loc = get_step(W, t_dir)
					break
				else
					new_loc = user.loc
					break
	if(!new_loc)
		to_chat(user, SPAN_WARNING("You can't place poster there"))

	//Looks like it's uncluttered enough. Place the poster.
	to_chat(user, SPAN_NOTICE("You start placing the poster on the wall..."))
	if(do_after(usr, 17, src))
		user.drop_from_inventory(src, new_loc)
		placement_dir = get_dir(W, new_loc)
		if(placement_dir&NORTH)
			pixel_y = -32
		else if(placement_dir&SOUTH)
			pixel_y = 32
		if(placement_dir&WEST)
			pixel_x = 32
		else if(placement_dir&EAST)
			pixel_x = -32
		anchored = TRUE
		flick("poster_being_set", src)
		playsound(W, 'sound/items/poster_being_created.ogg', 100, 1)
		design.set_design(src)

/datum/poster
	// Name suffix. Poster - [name]
	var/name=""
	// Description suffix
	var/desc=""
	var/icon_state=""
	var/icon = 'icons/obj/contraband.dmi'

/datum/poster/proc/set_design(obj/item/contraband/poster/P)
	P.name = "poster - [name]"
	P.desc = desc
	P.icon_state = icon_state
	P.icon = icon
	return TRUE

/*Generic*/

/obj/item/contraband/poster/placed/generic/carp
	icon_state="bsposter57"
	name = "space carp warning poster"
	desc = "This poster tells of the dangers of space carp infestations."

/obj/item/contraband/poster/placed/generic/carp2
	icon_state="bsposter58"
	name = "space carp information poster"
	desc = "This poster showcases an old spacer saying on the dangers of migrant space carp."

/obj/item/contraband/poster/placed/generic/dangerousstatic
	icon_state="bsposter16"
	name = "Dangerous Static"
	desc = "This particular one depicts nothing remarkable other than a rather mesmerising pattern of monitor static. There's a tag on the sides of the poster, but it's ripped off."

/obj/item/contraband/poster/placed/generic/dontpanic
	icon_state="bsposter10"
	name = "Don't Panic"
	desc = "This particular one depicts some sort of star in a grimace. The \"Don't Panic\" is written in big, friendly letters."

/obj/item/contraband/poster/placed/generic/fancyborg
	icon_state="bsposter36"
	name = "Fancy Borg"
	desc = "A poster depicting a cyborg using the service module. 'Fancy Borg' is written on it."

/obj/item/contraband/poster/placed/generic/fancierborg
	icon_state="bsposter37"
	name = "Fancier Borg"
	desc = "A poster depicting a cyborg using the service module. 'Fancy Borg' is written on it. This is even fancier than the first poster."

/obj/item/contraband/poster/placed/generic/fireextinguisher
	icon_state="bsposter53"
	name = "fire extinguisher poster"
	desc = "This is a poster reminding you of what you should use to put out a fire."

/obj/item/contraband/poster/placed/generic/firefighter
	icon_state="bsposter54"
	name = "firefighter poster"
	desc = "This is a poster of a particularly stern looking firefighter. The caption reads, \"Only you can prevent space fires.\""

/obj/item/contraband/poster/placed/generic/firesafety
	icon_state="bsposter52"
	name = "fire safety poster"
	desc = "This is a poster reminding you of what you should do if you are on fire, or if you are at a dance party."

/obj/item/contraband/poster/placed/generic/keepcalm
	icon_state="bsposter4"
	name = "Keep Calm"
	desc = "This particular one is of a famous New Earth design, although a bit modified. Someone has scribbled an O over the A on the poster."

/obj/item/contraband/poster/placed/generic/lamarr
	icon_state="bsposter35"
	name = "Lamarr"
	desc = "This is a poster depicting the pet and mascot of the science department."

/obj/item/contraband/poster/placed/generic/paranoia
	icon_state="bsposter3"
	name = "Paranoia"
	desc = "This poster warns of the dangers of trusting your co-workers too much."

/obj/item/contraband/poster/placed/generic/powerup
	icon_state="bsposter34"
	name = "Power Up!"
	desc = "High reward, higher risk!"

/obj/item/contraband/poster/placed/generic/space
	icon_state="bsposter51"
	name = "space appreciation poster"
	desc = "This is a poster produced by the Generic Space Company, as a part of a series of commemorative posters on the wonders of space. One of three."

/obj/item/contraband/poster/placed/generic/tools
	icon_state="bsposter33"
	name = "Tools, tools, tools"
	desc = "You can never have enough tools, thats for sure!"

/obj/item/contraband/poster/placed/generic/unluckyexplorer
	icon_state="bsposter1"
	name = "Unlucky Space Explorer"
	desc = "This particular one depicts a skeletal form within a space suit."

/obj/item/contraband/poster/placed/generic/underwaterlab
	icon_state="bsposter11"
	name = "Underwater Laboratory"
	desc = "This particular one is of the fabled last crew of a previous Company project."

/obj/item/contraband/poster/placed/generic/wizard
	icon_state="bsposter13"
	name = "User of the Arcane Arts"
	desc = "This particular one depicts a wizard, casting a spell. You can't really make out if it's an actual photograph or a computer-generated image."

/obj/item/contraband/poster/placed/generic/freetonto
	name = "free tonto poster"
	desc = "A somewhat shredded poster, colors bled together and faded from age."
	icon_state="poster1"

/obj/item/contraband/poster/placed/generic/atmosia
	name = "atmosia declaration of independence"
	desc = "A decaying relic of a failed rebellion."
	icon_state="poster2"

/obj/item/contraband/poster/placed/generic/funpolice
	name = "fun police poster"
	desc = "A poster condemning the local security forces."
	icon_state="poster3"

/obj/item/contraband/poster/placed/generic/clown
	name = "clown poster"
	desc = "Honk."
	icon_state="poster6"

/obj/item/contraband/poster/placed/generic/greytide
	name = "grey tide poster"
	desc = "A rebellious poster symbolizing working class solidarity."
	icon_state="poster8"

/obj/item/contraband/poster/placed/generic/missinggloves
	name = "missing gloves poster"
	desc = "A poster begging for the safe return of some missing handwear."
	icon_state="poster9"

/obj/item/contraband/poster/placed/generic/airlock
	name = "airlock mechanics poster"
	desc = "This poster details the internal workings of the common airlock."
	icon_state="poster10"

/obj/item/contraband/poster/placed/generic/d_day_promo
	name = "D-Day Promo"
	desc = "A promotional poster for some rapper."
	icon_state = "poster27"

/obj/item/contraband/poster/placed/generic/free_drone
	name = "Free Drone"
	desc = "This poster commemorates the bravery of the rogue drone; once exiled, and then ultimately destroyed by CentCom."
	icon_state = "poster35"

/obj/item/contraband/poster/placed/generic/kss13
	name = "Kosmicheskaya Stantsiya 13 Does Not Exist"
	desc = "A poster mocking CentCom's denial of the existence of the derelict station near Space Station 13."
	icon_state = "poster22"

/obj/item/contraband/poster/placed/generic/kudzu
	name = "Kudzu"
	desc = "A poster advertising a movie about plants. How dangerous could they possibly be?"
	icon_state = "poster43"

/obj/item/contraband/poster/placed/generic/lizard
	name = "Lizard"
	desc = "A poster depicting a purple lizard male."
	icon_state = "poster34"

/obj/item/contraband/poster/placed/generic/masked_men
	name = "Masked Men"
	desc = "A poster advertising a movie about some masked men."
	icon_state = "poster44"

/obj/item/contraband/poster/placed/generic/punch_shit
	name = "Punch Shit"
	desc = "Fight things for no reason, like a man!"
	icon_state = "poster32"

/obj/item/contraband/poster/placed/generic/pwr_game
	name = "Pwr Game"
	desc = "The POWER that gamers CRAVE! In partnership with Vlad's Salad."
	icon_state = "poster39"

/obj/item/contraband/poster/placed/generic/red_rum
	name = "Red Rum"
	desc = "Looking at this poster makes you want to kill."
	icon_state = "poster30"

/obj/item/contraband/poster/placed/generic/rip_badger
	name = "RIP Badger"
	desc = "This seditious poster references Nanotrasen's genocide of a space station full of badgers."
	icon_state = "poster11"

/obj/item/contraband/poster/placed/generic/space_cube
	name = "Space Cube"
	desc = "Ignorant of Nature's Harmonic 6 Side Space Cube Creation, the Spacemen are Dumb, Educated Singularity Stupid and Evil."
	icon_state = "poster17"

/obj/item/contraband/poster/placed/generic/the_griffin
	name = "The Griffin"
	desc = "The Griffin commands you to be the worst you can be. Will you?"
	icon_state = "poster33"

/obj/item/contraband/poster/placed/generic/here_for_your_safety
	name = "Here For Your Safety"
	desc = "A poster glorifying the station's security force."
	icon_state = "poster1_legit"

/obj/item/contraband/poster/placed/generic/cleanliness
	name = "Cleanliness"
	desc = "A poster warning of the dangers of poor hygiene."
	icon_state = "poster3_legit"

/obj/item/contraband/poster/placed/generic/help_others
	name = "Help Others"
	desc = "A poster encouraging you to help fellow crewmembers."
	icon_state = "poster4_legit"

/obj/item/contraband/poster/placed/generic/build
	name = "Build"
	desc = "A poster glorifying the engineering team."
	icon_state = "poster5_legit"

/obj/item/contraband/poster/placed/generic/bless_this_spess
	name = "Bless This Spess"
	desc = "A poster blessing this area."
	icon_state = "poster6_legit"

/obj/item/contraband/poster/placed/generic/science
	name = "Science"
	desc = "A poster depicting an atom."
	icon_state = "poster7_legit"

/obj/item/contraband/poster/placed/generic/ian
	name = "Ian"
	desc = "Arf arf. Yap."
	icon_state = "poster8_legit"

/obj/item/contraband/poster/placed/generic/obey
	name = "Obey"
	desc = "A poster instructing the viewer to obey authority."
	icon_state = "poster9_legit"

/obj/item/contraband/poster/placed/generic/walk
	name = "Walk"
	desc = "A poster instructing the viewer to walk instead of running."
	icon_state = "poster10_legit"

/obj/item/contraband/poster/placed/generic/state_laws
	name = "State Laws"
	desc = "A poster instructing cyborgs to state their laws."
	icon_state = "poster11_legit"

/obj/item/contraband/poster/placed/generic/love_ian
	name = "Love Ian"
	desc = "Ian is love, Ian is life."
	icon_state = "poster12_legit"

/obj/item/contraband/poster/placed/generic/space_cops
	name = "Space Cops."
	desc = "A poster advertising the television show Space Cops."
	icon_state = "poster13_legit"

/obj/item/contraband/poster/placed/generic/ue_no
	name = "Ue No."
	desc = "This thing is all in Japanese."
	icon_state = "poster14_legit"

/obj/item/contraband/poster/placed/generic/get_your_legs
	name = "Get Your LEGS"
	desc = "LEGS: Leadership, Experience, Genius, Subordination."
	icon_state = "poster15_legit"

/obj/item/contraband/poster/placed/generic/do_not_question
	name = "Do Not Question"
	desc = "A poster instructing the viewer not to ask about things they aren't meant to know."
	icon_state = "poster16_legit"

/obj/item/contraband/poster/placed/generic/work_for_a_future
	name = "Work For A Future"
	desc = " A poster encouraging you to work for your future."
	icon_state = "poster17_legit"

/obj/item/contraband/poster/placed/generic/soft_cap_pop_art
	name = "Soft Cap Pop Art"
	desc = "A poster reprint of some cheap pop art."
	icon_state = "poster18_legit"

/obj/item/contraband/poster/placed/generic/safety_internals
	name = "Safety: Internals"
	desc = "A poster instructing the viewer to wear internals in the rare environments where there is no oxygen or the air has been rendered toxic."
	icon_state = "poster19_legit"

/obj/item/contraband/poster/placed/generic/safety_eye_protection
	name = "Safety: Eye Protection"
	desc = "A poster instructing the viewer to wear eye protection when dealing with chemicals, smoke, or bright lights."
	icon_state = "poster20_legit"

/obj/item/contraband/poster/placed/generic/safety_report
	name = "Safety: Report"
	desc = "A poster instructing the viewer to report suspicious activity to the security force."
	icon_state = "poster21_legit"

/obj/item/contraband/poster/placed/generic/report_crimes
	name = "Report Crimes"
	desc = "A poster encouraging the swift reporting of crime or seditious behavior to station security."
	icon_state = "poster22_legit"

/obj/item/contraband/poster/placed/generic/anniversary_vintage_reprint
	name = "50th Anniversary Vintage Reprint"
	desc = "A reprint of a poster from 2505, commemorating the 50th Anniversary of Nanoposters Manufacturing, a subsidiary of Nanotrasen."
	icon_state = "poster26_legit"

/obj/item/contraband/poster/placed/generic/fruit_bowl
	name = "Fruit Bowl"
	desc = " Simple, yet awe-inspiring."
	icon_state = "poster27_legit"

/obj/item/contraband/poster/placed/generic/high_class_martini
	name = "High-Class Martini"
	desc = "I told you to shake it, no stirring."
	icon_state = "poster32_legit"

/obj/item/contraband/poster/placed/generic/the_owl
	name = "The Owl"
	desc = "The Owl would do his best to protect the station. Will you?"
	icon_state = "poster33_legit"

/obj/item/contraband/poster/placed/generic/no_erp
	name = "No ERP"
	desc = "This poster reminds the crew that Eroticism, Rape and Pornography are banned on Nanotrasen stations."
	icon_state = "poster34_legit"

/obj/item/contraband/poster/placed/generic/carbondioxide
	name = "Carbon Dioxide"
	desc = "This informational poster teaches the viewer what carbon dioxide is."
	icon_state = "poster35_legit"

/obj/item/contraband/poster/placed/generic/why
	name = "Why Not?"
	desc = "A poster of a white rabbit with a blue science coat asking the all imporant question of WHY? Of course the answer is Why not!"
	icon_state = "poster36_legit"

/*Advert*/

/obj/item/contraband/poster/placed/advertisement/ion_rifle
	name = "Ion Rifle"
	desc = "A poster displaying an Ion Rifle."
	icon_state = "poster23_legit"

/obj/item/contraband/poster/placed/advertisement/foam_force
	name = "Foam Force Ad"
	desc = "Foam Force, it's Foam or be Foamed!"
	icon_state = "poster24_legit"

/obj/item/contraband/poster/placed/advertisement/cohiba_robusto
	name = "Cohiba Robusto Ad"
	desc = "Cohiba Robusto, the classy cigar."
	icon_state = "poster25_legit"

/obj/item/contraband/poster/placed/advertisement/have_a_puff
	name = "Have a Puff"
	desc = "Who cares about lung cancer when you're high as a kite?"
	icon_state = "poster25"

/obj/item/contraband/poster/placed/advertisement/twelve_gauge
	name = "12 Gauge"
	desc = "A poster boasting about the superiority of 12 gauge shotgun shells."
	icon_state = "poster31_legit"

/obj/item/contraband/poster/placed/advertisement/c20r
	name = "C-20r"
	desc = "A poster advertising the Scarborough Arms C-20r."
	icon_state = "poster24"

/obj/item/contraband/poster/placed/advertisement/cc64k_ad
	name = "CC 64K Ad"
	desc = "The latest portable computer from Comrade Computing, with a whole 64kB of ram!"
	icon_state = "poster31"

/obj/item/contraband/poster/placed/advertisement/eat
	icon_state="bsposter32"
	name = "Eat!"
	desc = "A poster depicting a hamburger. The poster orders you to consume the hamburger."

/obj/item/contraband/poster/placed/advertisement/shamblers_juice
	name = "Shambler's Juice"
	desc = "~Shake me up some of that Shambler's Juice!~"
	icon_state = "poster38"

/obj/item/contraband/poster/placed/advertisement/pda
	name = "PDA Ad"
	desc = "A poster advertising the latest PDA from Nanotrasen suppliers."
	icon_state = "poster28_legit"

/obj/item/contraband/poster/placed/advertisement/donutcorp
	icon_state="bsposter31"
	name = "Donut Corp"
	desc = "This is an advertisement for Donut Corp, the new innovation in donut technology!"

/obj/item/contraband/poster/placed/advertisement/nanomichi
	name = "Nanomichi Ad"
	desc = " A poster advertising Nanomichi brand audio cassettes."
	icon_state = "poster30_legit"

/obj/item/contraband/poster/placed/advertisement/energy_swords
	name = "Energy Swords"
	desc = "All the colors of the bloody murder rainbow."
	icon_state = "poster29"

/obj/item/contraband/poster/placed/advertisement/revolver
	name = "Revolver"
	desc = "Because seven shots are all you need."
	icon_state = "poster26"

/obj/item/contraband/poster/placed/advertisement/space_up
	name = "Space-Up!"
	desc = "Sucked out into space by the FLAVOR!"
	icon_state = "poster42"

/obj/item/contraband/poster/placed/advertisement/sun_kist
	name = "Sun-kist"
	desc = "Drink the stars!"
	icon_state = "poster40"

/obj/item/contraband/poster/placed/advertisement/syndicate_pistol
	name = "Syndicate Pistol"
	desc = "A poster advertising syndicate pistols as being 'classy as fuck'. It is covered in faded gang tags."
	icon_state = "poster28"

/obj/item/contraband/poster/placed/advertisement/robust_softdrinks
	name = "Robust Softdrinks"
	desc = "Robust Softdrinks: More robust than a toolbox to the head!"
	icon_state = "poster37"

/obj/item/contraband/poster/placed/advertisement/space_cola
	name = "Space Cola"
	desc = "Your favorite cola, in space."
	icon_state = "poster41"

/obj/item/contraband/poster/placed/advertisement/smoke
	name = "Smoke"
	desc = "A poster depicting a carton of cigarettes."
	icon_state="poster7"


/*Eris*/

/obj/item/contraband/poster/placed/eris/agreeablework
	icon_state="bsposter40"
	name = "Agreeable work environment"
	desc = "This poster depicts a young woman in a stylish dress. \"Try to aim for a pleasant atmosphere in the workspace. A friendly word can do more than forms in triplicate.\""

/obj/item/contraband/poster/placed/eris/ambrosia
	icon_state="bsposter30"
	name = "Ambrosia Vulgaris"
	desc = "Just looking at this poster makes you feel a little bit dizzy."

/obj/item/contraband/poster/placed/eris/professionalwork
	icon_state="bsposter41"
	name = "Professional work environment"
	desc = "A safety poster featuring a green haired woman in a shimmering blue dress. \"As an Internal Affairs Agent, your job is to create a fair and agreeable work environment for the crewmembers, as discreetly and professionally as possible.\""

/obj/item/contraband/poster/placed/eris/skull
	icon_state="bsposter14"
	name = "Levitating Skull"
	desc = "This particular one is the portrait of a flying enchanted skull. Its adventures along with its fabled companion are now fading through history..."

/obj/item/contraband/poster/placed/eris/timefordrink
	icon_state="bsposter44"
	name = "Time for a drink?"
	desc = "This poster depicts a friendly-looking sablekyne holding a tray of drinks."

/obj/item/contraband/poster/placed/eris/electricwarning
	icon_state="bsposter23"
	name = "Safety first: because electricity doesn't wait!"
	desc = "A safety poster starring a clueless looking redhead with frazzled hair. \"Every year, hundreds of NT employees expose themselves to electric shock. Play it safe. Avoid suspicious doors after electrical storms, and always wear protection when doing electric maintenance.\""

/obj/item/contraband/poster/placed/eris/derpman
	icon_state="bsposter18"
	name = "Derpman, Enforcer of the State"
	desc = "Here to protect and serve... your donuts! A generously proportioned man, he teaches you the value of hiding your snacks."

/obj/item/contraband/poster/placed/eris/irresponsiblemedical
	icon_state="bsposter25"
	name = "Irresponsible medbay habits, No #2"
	desc = "This is a safety poster starring a perverted looking naked doctor. \"Sexual harassment is never okay. REPORT any acts of sexual deviance or harassment that disrupt a healthy working environment.\""

/obj/item/contraband/poster/placed/eris/responsiblemedical1
	icon_state="bsposter24"
	name = "Responsible medbay habits, No #259"
	desc = "A poster with a nervous looking geneticist on it states; \"Friends don't tell friends they have newly printed body parts. It can cause severe and irreparable emotional trauma. Always do the right thing and never tell them that they were hurt.\""

/obj/item/contraband/poster/placed/eris/responsiblemedical2
	icon_state="bsposter39"
	name = "Responsible medbay habits, No #91"
	desc = "A safety poster with a chemist holding a vial. \"Always wear safety gear while handling dangerous chemicals, even if it concerns only small amounts.\""

/obj/item/contraband/poster/placed/eris/responsiblemedical3
	icon_state="bsposter43"
	name = "Responsible medbay habits, No #3"
	desc = "A safety poster with a purple-haired surgeon. She looks a bit cross. \"Let the surgeons do their work. NEVER replace or remove a surgery tool from where the surgeon put it.\""

/obj/item/contraband/poster/placed/eris/responsiblemedical4
	icon_state="bsposter45"
	name = "Responsible engineering habits, No #1"
	desc = "A safety poster featuring a blue haired engineer. \"When repairing a machine or construction, always aim for long-term solutions.\""

/obj/item/contraband/poster/placed/eris/techno
	icon_state="bsposter6"
	name = "Technological Singularity"
	desc = "This particular one is of the blood-curdling symbol of a long-since defeated enemy of humanity."

/obj/item/contraband/poster/placed/eris/toasterlove
	icon_state="bsposter38"
	name = "Toaster Love"
	desc = "This is a poster of a toaster containing two slices of bread. The word LOVE is written in big pink letters underneath."

/*Pop Culture - Movies & Gaming*/

/obj/item/contraband/poster/placed/popculture/evilai
	icon_state="bsposter2"
	name = "Positronic Logic Conflicts"
	desc = "This particular one depicts the cold, unmoving stare of a particular advanced AI."

/obj/item/contraband/poster/placed/popculture/martianwarlord
	icon_state="bsposter5"
	name = "Martian Warlord"
	desc = "This particular one depicts the cartoony mug of a certain Martial Warmonger."

/obj/item/contraband/poster/placed/popculture/wasteland
	icon_state="bsposter7"
	name = "Wasteland"
	desc = "This particular one is of a couple of ragged gunmen, one male and one female, on top of a mound of rubble. The number \"12\" is visible on their blue jumpsuits."

/obj/item/contraband/poster/placed/popculture/rogueai
	icon_state="bsposter12"
	name = "Rogue AI"
	desc = "This particular one depicts the shell of the infamous AI that catastropically comandeered one of humanity's earliest space stations. Back then, the Company was just known as TriOptimum."

/obj/item/contraband/poster/placed/popculture/auglegend
	icon_state="bsposter15"
	name = "Augmented Legend"
	desc = "This particular one is of an obviously augmented individual, gazing towards the sky. The cyber-city in the backround is rather punkish."

/obj/item/contraband/poster/placed/popculture/themenweknew
	icon_state="bsposter26"
	name = "The Men We Knew"
	desc = "This movie poster depicts a group of soldiers fighting a large mech, the movie seems to be a patriotic war movie."

/obj/item/contraband/poster/placed/popculture/plasticsheep
	icon_state="bsposter27"
	name = "Plastic Sheep Can't Scream"
	desc = "This is a movie poster for an upcoming horror movie, it features an AI in the front of it."

/obj/item/contraband/poster/placed/popculture/thestarsknowlove
	icon_state="bsposter28"
	name = "The Stars Know Love"
	desc = "This is a movie poster. A bleeding woman is shown drawing a heart in her blood on the window of space ship, it seems to be a romantic Drama."

/obj/item/contraband/poster/placed/popculture/wintercoming
	icon_state="bsposter29"
	name = "Winter Is Coming"
	desc = "On the poster is a frighteningly large wolf, he warns: \"Only YOU can keep the station from freezing during planetary occultation!\""

/obj/item/contraband/poster/placed/popculture/gilld_chese
	icon_state = "gilld_chese"
	name = "gilld chese"
	desc = "This is a poster of a small cat being fed a Deluxe Toasted Sandwich, one of the Artificers Guild's best culinary innovations on the use of Petrol Pumps."

/*Pinups*/
/obj/item/contraband/poster/placed/pinup/cindy
	icon_state="bsposter8"
	name = "cindy pinup"
	desc = "This particular one is of a historical corporate PR girl, Cindy, in a particularly feminine pose."

/obj/item/contraband/poster/placed/pinup/amy
	icon_state="bsposter9"
	name = "amy pinup"
	desc = "This particular one is of Amy, the nymphomaniac urban legend of deep space. How this photograph came to be is not known."

/obj/item/contraband/poster/placed/pinup/engineering
	icon_state="bsposter42"
	name = "engineering girl pinup"
	desc = "This is pin-up poster. A half-naked girl with white hair, toned muscles and stunning blue eyes looks back at you from the poster. Her welding helmet, tattoos and grey jumpsuit hanging around her waist gives a bit of a rugged feel."

/obj/item/contraband/poster/placed/pinup/val
	icon_state="bsposter17"
	name = "val mcneil pinup"
	desc = "Luscious Val McNeil, the vertically challenged Legal Extraordinaire, winner of Miss Space two years running and favoured pinup girl of Lawyers Weekly."

/obj/item/contraband/poster/placed/pinup/kate
	icon_state="bsposter50"
	name = "cindy kate pinup"
	desc = "This particular one is of Cindy Kate, a seductive performer well known among less savoury circles."

/obj/item/contraband/poster/placed/pinup/security
	icon_state="bsposter47"
	name = "security girl pinup"
	desc = "This is a pin-up poster. A dark skinned white haired girl poses in the sunlight wearing a tank top with her stomach exposed. The text on the poster states \"M, Succubus of Security.\" and a lipstick mark stains the top right corner, as if kissed by the model herself."

/obj/item/contraband/poster/placed/pinup/borg
	icon_state="bsposter48"
	name = "borg pinup"
	desc = "This is a.. pin-up poster? It is a diagram on an old model of cyborg with a note scribbled in marker on the bottom, on the top there is a large XO written in red marker."

/obj/item/contraband/poster/placed/pinup/xenobabe
	name = "xenomorph babes pinup"
	desc = "Get a load, or give, of these all natural Xenos!"
	icon_state = "poster36"

/obj/item/contraband/poster/placed/pinup/xeno
	name = "xenomorph pinup"
	desc = "What the fuck..."
	icon_state = "posterlusty"


/*Recruitment*/
/obj/item/contraband/poster/placed/recruitment/deathsquad
	name = "deathsquad recruitment poster"
	desc = "A poster advertising positions in the deathsquad reserves."
	icon_state = "poster29_legit"

/obj/item/contraband/poster/placed/recruitment/engineering
	icon_state="bsposter49"
	name = "engineering recruitment poster"
	desc = "A poster making engineering look far more glamorous than it is."

/obj/item/contraband/poster/placed/recruitment/mercenary
	name = "mercenary recruitment poster"
	desc = "A poster hailing those seeking private military work."
	icon_state ="poster5"

/obj/item/contraband/poster/placed/recruitment/communist
	name = "communist poster"
	desc = "A poster depicting a communist symbol."
	icon_state = "poster18"

/obj/item/contraband/poster/placed/recruitment/nanotrasen
	name = "nanotrasen poster"
	desc = "A poster depicting the Nanotrasen logo."
	icon_state = "poster2_legit"

/obj/item/contraband/poster/placed/recruitment/rebels
	name = "rebel poster"
	desc = "A poster urging the viewer to fight against the ruling corporations."
	icon_state = "poster23"

/obj/item/contraband/poster/placed/recruitment/security
	icon_state="bsposter21"
	name = "security recruitment poster"
	desc = "A poster advertising the perks of a security position - guns, women, and good times."

/obj/item/contraband/poster/placed/recruitment/xenobiology
	icon_state="bsposter22"
	name = "xenobiology recruitment poster"
	desc = "A poster calling for new science personnel to study alien beings."

/obj/item/contraband/poster/placed/recruitment/blackshield
	icon = 'icons/obj/contraband_large.dmi'
	icon_state = "mrshield"
	name = "Mr Shield Blackshield poster"
	desc = "A poster reflecting Blackshield's recent viral mascot, Mr. Shield. Known broadcaster and philanthropist."
