/obj/machinery/computer/arcade/
	name = "random arcade"
	desc = "random arcade machine"
	icon_state = "arcade"
	icon_keyboard = null
	icon_screen = "invaders"
	var/list/prizes = list(
		/obj/item/storage/box/snappops			= 2,
		/obj/item/gun/projectile/revolver/capgun	= 2,
		/obj/item/storage/fancy/crayons			= 2,
		/obj/random/costume/body_generic				= 2,
		/obj/random/costume/body_animals				= 2,
		/obj/random/costume/head_generic				= 2,
		/obj/random/costume/head_animals				= 2,
		/obj/random/toy/arcadejunk						= 1,
		/obj/random/toy/action_figure					= 1,
		/obj/random/toy/mecha							= 1,
		/obj/random/toy/plushie							= 1,
	)

/obj/machinery/computer/arcade/Initialize()
	. = ..()
	if(!circuit)
		circuit = pick(subtypesof(/obj/item/circuitboard/arcade))
		var/build_path = initial(circuit.build_path)
		new build_path (loc, circuit)
		return INITIALIZE_HINT_QDEL

/obj/machinery/computer/arcade/proc/prizevend()
	if(!contents.len)
		var/prizeselect = pickweight(prizes)
		new prizeselect(src.loc)

		if(istype(prizeselect, /obj/item/clothing/suit/costume/halloween/syndicate)) //Helmet is part of the suit
			new	/obj/item/clothing/head/costume/halloween/syndicate(src.loc)

	else
		var/atom/movable/prize = pick(contents)
		prize.loc = src.loc

/obj/machinery/computer/arcade/emp_act(severity)
	if(stat & (NOPOWER|BROKEN))
		..(severity)
		return
	var/empprize = null
	var/num_of_prizes = 0
	switch(severity)
		if(1)
			num_of_prizes = rand(1,4)
		if(2)
			num_of_prizes = rand(0,2)
	for(num_of_prizes; num_of_prizes > 0; num_of_prizes--)
		empprize = pickweight(prizes)
		new empprize(src.loc)

	..(severity)

///////////////////
//  BATTLE HERE  //
///////////////////

/obj/machinery/computer/arcade/battle
	name = "arcade machine"
	desc = "Try your luck against a vicious and deadly opponent."
	icon_state = "arcade"
	circuit = /obj/item/circuitboard/arcade/battle
	var/enemy_name = "Space Villain"
	var/temp = "Winners don't use space drugs!" //Temporary message, for attack messages, etc
	var/player_hp = 30 //Player health/attack points
	var/player_mp = 10
	var/enemy_hp = 45 //Enemy health/attack points
	var/enemy_mp = 20
	var/gameover = 0
	var/blocked = 0 //Player cannot attack/heal while set
	var/turtle = 0

/obj/machinery/computer/arcade/battle/New()
	..()
	var/name_action
	var/name_part1
	var/name_part2

	name_action = pick("Ambush ", "Annihilate ", "Assassinate ", "Assault ", "Arrest ", "Attack ", "Assail ",
					   "Backhand ", "Battle ", "Beat ", "Besiege ", "Betray ", "Bombard ", "Bury ",
					   "Challenge ", "Chase ", "Combat ", "Confront ", "Conquer ", "Contest ", "Crush ",
					   "Decimate ", "Defeat ", "Demolish ", "Destroy ", "Detain ", "Dispatch ", "Duel ",
					   "Engage ", "End ", "Execute ", "Expunge ", "Eradicate ", "Explode ",
					   "Face ", "Flame ", "Faze ", "Flout ", "Fight ", "Fire ",
					   "Garrote ", "Grind ", "Gut ", "Gash ", "Greytide ", "Gank ",
					   "Hinder ", "Harm ", "Humiliate ", "Hunt ", "Hurt ",
					   "Impeach ", "Impede ", "Injure ", "Impale ", "Immobilize ",
					   "Jab ", "Jeopardize ", "Jail ", "Jolt ", "Jump ",
					   "Kick ", "Kill ", "Kidnap ", "Knife ", "Knockout ",
					   "Lash ", "Lecture ", "Liquidate ", "Lacerate ",
					   "Mangle ", "Mug ", "Mortify ", "Mystify ", "Murder ",
					   "Neutralize ", "Nullify ", "Neuter ", "Negate ",
					   "Obliterate ", "Oppose ", "Outmanoeuvre ", "Overpower ", "Overthrow ",
					   "Pursue ", "Paralyze ", "Persecute ", "Pertube ", "Pain ",
					   "Repel ", "Repress ", "Repulse ", "Resist ", "Robust ", "Rout ", "Raid ", "Raze ", "Ravage ",
					   "Shame ", "Slaughter ", "Slay ", "Smash ", "Spar ", "Stop ", "Strike ", "Subdue ", "Surmount ", "Storm ",
					   "Terrorize ", "Tarnish ", "Terminate ", "Terrify ", "Torture ",
					   "Unseat ", "Usurp ", "Upset ", "Uproot ",
					   "Vanquish ", "Vilify ", "Vaporize ",
					   "Whack ", "Waste ", "Wrestle ", "Whip ", "Wound ", "Wreck ",
					   "Zap ")

	name_part1 = pick("Admiral ", "Agent ", "Assassin ", "Anarchist ", "Arms Dealer ", "Arsonist ", "Administrator ", "Abductor ",
					  "Baron ", "Bandit ", "Bounty Hunter ", "Blood Cultist ", "Boss ", "Brigadier ", "Bomber ", "Blob ",
					  "Captain ", "Chapter Master ", "Colonel ", "Commander ", "Commodore ", "Count ", "Crazy ", "Changeling ", "Criminal ", "Champion ",
					  "Doctor ", "Dread King ", "Duke ", "Deserter ", "Destroyer ", "Deviant ", "Dangerous ",
					  "Enforcer ", "Emperor ", "Empress ", "Executioner ", "Escaped Prisoner ", "Extorter ", "Exterminator ",
					  "Forger ", "Fraudster ", "Firestarter ", "Fanatic ", "Fugitive ", "Felon ", "Fiery ", "Forefather ",
					  "Gangster ", "General ", "Gunner ", "Grenadier ", "Galactic ", "Gunrunner ", "Guardian ",
					  "Head ", "Headhunter ", "Heavyweight ", "Henchman ", "Henchwoman ", "Holoparasite ", "Hoodlum ", "Hustler ",
					  "Inquisitor ", "Interferer ", "Inciter ", "Igniter ", "Inspector ", "Invincible ", "Iudex ",
					  "Jester ", "Judge ", "Juggernaut ", "Jawbreaker ", "Jumbo ", "Justice ",
					  "King ", "Kingpin ", "Killer ", "Kidnapper ", "Knave ", "Karate Master ",
					  "Leader ", "Legate ", "Lieutenant ", "Lord ", "Lance ", "Legislator ",
					  "Mad ", "Magnate ", "Marshal ", "Major ", "Mercenary ", "Master ", "Maverick ", "Malfunctioning AI ", "Mobster ",
					  "NeoTheologist ", "Necromancer ", "Ninja ", "Negotiator ", "Nuclear ",
					  "Overlord ", "Officer ", "Operative ", "Oppressor ", "Obsessor ", "Obstructor ",
					  "Prince ", "Princess ", "President ", "Professor ", "Private ", "Prophet ", "Pariah ", "Pirate ",
					  "Queen ",
					  "Raider ", "Ravager ", "Renegade ", "Revolutionary ", "Representative ", "Racketeer ",
					  "Soldier ", "Scavenger ", "Sergeant ", "Serial Killer ", "Serbian ", "Smuggler ", "Swarmer ", "Supreme ", "Sorcerer ",
					  "contractor ", "Terrorist ", "Thief ", "Trafficker ", "Terroriser ", "Treasure Hunter ", "Terrible ", "Titanic ",
					  "Vandal ", "Viscount ", "Vampire ", "Void Wolf ", "Veteran ", "Villainous ", "Vice President ",
					  "Warlord ", "Warmonger ", "Wrangler ", "Waster ", "Wizard ",
					  "Xenomorph ", "Xenohybrid ",
					  "Yielder ",
					  "Zealot ")

	name_part2 = pick("Aara", "Abatha", "Alexander", "Alyx", "Ana", "Annabelle", "Adams", "Arleen", "Aronai", "Arthur", "Arby", "Arvedki", "Ascian", "Asriel", "Ash",
					  "Bash",  "Brown", "Buchanan", "Bush", "Bowchief", "Boyum", "Brock", "Brooks", "Borowski", "Blue", "Bastion", "Bee", "Blackfur",
					  "Carly", "Carroll", "Carrot", "Clark", "Cameron", "Campbell", "Cox", "Carter", "Chup", "Citadel", "Costa", "Cade", "Caesar",
					  "David", "Dane", "Divino", "Dizet", "Duket", "Diaz", "Dray", "Dick", "Donald", "Devon", "Dutch", "Dylan", "Drake", "Dakota",
					  "Ebonheart", "Earl", "Evans", "Edwards", "Ekios", "Eric", "Elijah", "Elias", "Ezekiel", "Everett", "Eamon", "Elliot", "Edgar",
					  "Frank", "Flores", "Flynn", "Foster", "Ford", "Fox", "Foxish", "Fillmore", "Fulp", "Felix", "Francisco", "Fabian", "Ferdinand",
					  "Grant", "Gay", "Garfield", "Greyson", "Greg", "Grid", "Gustavia", "Griffin", "George", "Goon", "Gavin", "Gumshoe", "Gemma",
					  "Hank", "Harold", "Hannah", "Holden", "Heaven", "Hunt", "Helenora", "Hippolyta", "Harris", "Hoover", "Hippie", "Heyes", "Hestia",
					  "Ian", "Iain", "Ivy", "Iris", "Isla", "Ivan", "Ianto", "Ishmael", "Isabel", "Ignatius", "Isham", "Isaac", "Isaiah", "Ibrahim",
					  "Jathok", "Jay", "Jermaine", "Jewel", "Jeff", "Jim", "Jackson", "Johnson", "Jack", "Jax", "Josiah", "Jabez", "Jabber", "Jacob",
					  "Kat", "Kate", "Kadir", "Katie", "Knapp", "K'vhas", "Kei", "Ketrai", "Kota", "Krystal", "Kade", "Kappa", "Kayden", "Kingston",
					  "Larmen", "Lee", "Leri", "Leslie", "Lex", "Luna", "Luxitou", "Libelula", "Lifeweb", "Lonta", "Lucas", "Liam", "Lincoln", "Lucifer",
					  "Mae", "Makino", "Marshall", "Menzula", "Mia", "Mimi", "Milos", "Muu'rn", "Myrin", "Madison", "Monroe", "Moon", "Mcfall", "Morgan",
					  "N'imira", "Nathan", "Natasha", "Noah", "Nicola", "Nyla", "Nancy", "Nance", "Nana", "Nate", "Natalya", "Ned", "Neil", "Nick",
					  "Oliver", "Odin", "Owen", "Oscar", "Omar", "Osman", "Oakley", "Otto", "Orion", "Orianna", "Octavius", "O'Shea", "Obadiah",
					  "Pasotel", "Pauper", "Paul", "Popsy", "Prax", "Praxen", "Pierce", "Phayne", "Phoenix", "Preston", "Patrick", "Piper", "Peter",
					  "Quentin", "Quinn", "Quincy", "Quillon", "Quinton", "Quintavius", "Quimby", "Quade", "Queenie", "Quinta", "Quinlan",
					  "Raere", "Raeschen", "Ray", "Resca", "Rex", "Ricardo", "Robbie", "Robinson", "Roosevelt", "Rotten", "Ru", "Rose", "Remington",
					  "Samantha", "Sanders", "Sarah", "Shyne", "Sari", "Sans", "Seeking", "Stall", "Stellar", "Steam", "Schrödinger", "Steven", "Szandor", "Sydney", "Strelle", //best character
					  "Tasald", "Trevor", "Tamoka", "Tarmane", "Todd", "Torvo", "Thompson", "Thomas", "Trump", "Tommy", "Thor", "Timothy", "Tony",
					  "Uriel", "Undine", "Uri", "Universe", "Ulysses", "Uriah", "Usher", "Ursel", "Uziel", "Ursula", "Ursule", "Ulva",
					  "Victoria", "Vanessa", "Veer", "Verity", "Vixen", "Violet", "Victor", "Valentine", "Valentino", "Vaughn", "Vivek",
					  "Watson", "Walker", "Wilson", "Willow", "Wolf", "Will", "White", "Whitefur", "Washington", "Wright", "Wynter", "Wheelie",
					  "Xarillia", "Xander", "Xai", "Xavier", "Xavi", "Xeno", "Xylia", "Xenia", "Xia", "Xu", "Xenophon",
					  "Yael", "Yadon", "Yaakov", "Yuula", "Yog", "Yawn", "Yusuf", "Yasser", "Yuri", "Yanni", "Yoshiro",
					  "Zac", "Zafar", "Zahn", "Zared", "Zach", "Zeke", "Zane", "Zyah", "Zigfried", "Zulu", "Zariza")

	src.enemy_name = replacetext((name_part1 + name_part2), "the ", "")
	src.name = (name_action + name_part1 + name_part2)


/obj/machinery/computer/arcade/battle/attack_hand(mob/user as mob)
	if(..())
		return
	user.set_machine(src)
	var/dat = "<a href='byond://?src=\ref[src];close=1'>Close</a>"
	dat += "<center><h4>[src.enemy_name]</h4></center>"

	dat += "<br><center><h3>[src.temp]</h3></center>"
	dat += "<br><center>Health: [src.player_hp] | Magic: [src.player_mp] | Enemy Health: [src.enemy_hp]</center>"

	dat += "<center><b>"
	if (src.gameover)
		dat += "<a href='byond://?src=\ref[src];newgame=1'>New Game</a>"
	else
		dat += "<a href='byond://?src=\ref[src];attack=1'>Attack</a> | "
		dat += "<a href='byond://?src=\ref[src];heal=1'>Heal</a> | "
		dat += "<a href='byond://?src=\ref[src];charge=1'>Recharge Power</a>"

	dat += "</b></center>"

	user << browse(dat, "window=arcade")
	onclose(user, "arcade")
	return

/obj/machinery/computer/arcade/battle/Topic(href, href_list)
	if(..())
		return 1

	if (!src.blocked && !src.gameover)
		if (href_list["attack"])
			src.blocked = 1
			var/attackamt = rand(2,6)
			src.temp = "You attack for [attackamt] damage!"
			src.updateUsrDialog()
			if(turtle > 0)
				turtle--

			sleep(10)
			src.enemy_hp -= attackamt
			src.arcade_action()

		else if (href_list["heal"])
			src.blocked = 1
			var/pointamt = rand(1,3)
			var/healamt = rand(6,8)
			src.temp = "You use [pointamt] magic to heal for [healamt] damage!"
			src.updateUsrDialog()
			turtle++

			sleep(10)
			src.player_mp -= pointamt
			src.player_hp += healamt
			src.blocked = 1
			src.updateUsrDialog()
			src.arcade_action()

		else if (href_list["charge"])
			src.blocked = 1
			var/chargeamt = rand(4,7)
			src.temp = "You regain [chargeamt] points"
			src.player_mp += chargeamt
			if(turtle > 0)
				turtle--

			src.updateUsrDialog()
			sleep(10)
			src.arcade_action()

	if (href_list["close"])
		usr.unset_machine()
		usr << browse(null, "window=arcade")

	else if (href_list["newgame"]) //Reset everything
		temp = "New Round"
		player_hp = 30
		player_mp = 10
		enemy_hp = 45
		enemy_mp = 20
		gameover = 0
		turtle = 0

		if(emagged)
			src.New()
			emagged = 0

	src.add_fingerprint(usr)
	src.updateUsrDialog()
	return

/obj/machinery/computer/arcade/battle/proc/arcade_action()
	if ((src.enemy_mp <= 0) || (src.enemy_hp <= 0))
		if(!gameover)
			src.gameover = 1
			src.temp = "[src.enemy_name] has fallen! Rejoice!"

			if(emagged)

				new /obj/effect/spawner/newbomb/timer/syndicate(src.loc)
				new /obj/item/clothing/head/costume/misc/petehat(src.loc)
				message_admins("[key_name_admin(usr)] has outbombed Cuban Pete and been awarded a bomb.")
				log_game("[key_name_admin(usr)] has outbombed Cuban Pete and been awarded a bomb.")
				src.New()
				emagged = 0
			else if(!contents.len)
				src.prizevend()

			else
				src.prizevend()

	else if (emagged && (turtle >= 4))
		var/boomamt = rand(5,10)
		src.temp = "[src.enemy_name] throws a bomb, exploding you for [boomamt] damage!"
		src.player_hp -= boomamt

	else if ((src.enemy_mp <= 5) && (prob(70)))
		var/stealamt = rand(2,3)
		src.temp = "[src.enemy_name] steals [stealamt] of your power!"
		src.player_mp -= stealamt
		src.updateUsrDialog()

		if (src.player_mp <= 0)
			src.gameover = 1
			sleep(10)
			src.temp = "You have been drained! GAME OVER"
			if(emagged)

				usr.gib()


	else if ((src.enemy_hp <= 10) && (src.enemy_mp > 4))
		src.temp = "[src.enemy_name] heals for 4 health!"
		src.enemy_hp += 4
		src.enemy_mp -= 4

	else
		var/attackamt = rand(3,6)
		src.temp = "[src.enemy_name] attacks for [attackamt] damage!"
		src.player_hp -= attackamt

	if ((src.player_mp <= 0) || (src.player_hp <= 0))
		src.gameover = 1
		src.temp = "You have been crushed! GAME OVER"
		if(emagged)

			usr.gib()


	src.blocked = 0
	return


/obj/machinery/computer/arcade/battle/emag_act(var/charges, var/mob/user)
	if(!emagged)
		temp = "If you die in the game, you die for real!"
		player_hp = 30
		player_mp = 10
		enemy_hp = 45
		enemy_mp = 20
		gameover = 0
		blocked = 0
		emagged = 1

		enemy_name = "Cuban Pete"
		name = "Outbomb Cuban Pete"

		src.updateUsrDialog()
		return 1
