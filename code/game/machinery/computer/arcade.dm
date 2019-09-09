/obj/machinery/computer/arcade/
	name = "random arcade"
	desc = "random arcade machine"
	icon_state = "arcade"
	icon_keyboard = null
	icon_screen = "invaders"
	var/list/prizes = list(
		/obj/item/weapon/storage/box/snappops			= 2,
		/obj/item/toy/junk/blink								= 2,
		/obj/item/clothing/under/syndicate				= 2,
		/obj/item/toy/weapon/sword								= 2,
		/obj/item/weapon/gun/projectile/revolver/capgun	= 2,
		/obj/item/toy/weapon/crossbow							= 2,
		/obj/item/clothing/suit/costume/halloween/syndicate	= 2,
		/obj/item/weapon/storage/fancy/crayons			= 2,
		/obj/item/toy/junk/spinningtoy						= 2,
		/obj/item/toy/figure/mecha/ripley						= 1,
		/obj/item/toy/figure/mecha/fireripley					= 1,
		/obj/item/toy/figure/mecha/deathripley					= 1,
		/obj/item/toy/figure/mecha/gygax						= 1,
		/obj/item/toy/figure/mecha/durand						= 1,
		/obj/item/toy/figure/mecha/honk						= 1,
		/obj/item/toy/figure/mecha/marauder					= 1,
		/obj/item/toy/figure/mecha/seraph						= 1,
		/obj/item/toy/figure/mecha/mauler						= 1,
		/obj/item/toy/figure/mecha/odysseus					= 1,
		/obj/item/toy/figure/mecha/phazon						= 1,
		/obj/item/toy/weapon/waterflower						= 1,
		/obj/random/action_figure						= 1,
		/obj/random/plushie								= 1,
		/obj/item/toy/weapon/cultsword							= 1
	)

/obj/machinery/computer/arcade/Initialize()
	. = ..()
	if(!circuit)
		circuit = pick(subtypesof(/obj/item/weapon/circuitboard/arcade))
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

/obj/machinery/computer/arcade/attack_ai(mob/user as mob)
	return src.attack_hand(user)


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
	circuit = /obj/item/weapon/circuitboard/arcade/battle
	var/enemy_name = "Space Villian"
	var/temp = "Winners don't use space drugs" //Temporary message, for attack messages, etc
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

	name_action = pick("Ambush ", "Annihilate ", "Assassinate ", "Assault ", "Arrest ", "Attack ", "Assail ", "Battle ", "Beat ", "Besiege ", "Challenge ", "Chase ", "Combat ", "Confront ", "Conquer ", "Contest ", "Crush ", "Decimate ", "Defeat ", "Demolish ", "Destroy ", "Detain ", "Dispatch ", "Duel ", "Execute ", "Expunge ", "Eradicate ", "Fight ", "Greytide ", "Hinder ", "Harm ", "Humiliate ", "Hunt ", "Hurt ", "Impeach ", "Impede ", "Injure ", "Kick ", "Kill ", "Murder ", "Obliterate ", "Oppose ", "Outmanoeuvre ", "Overpower ", "Overthrow ", "Pursue ", "Repel ", "Repress ", "Repulse ", "Resist ", "Robust ", "Rout ", "Raid ", "Raze ", "Ravage ", "Shame ", "Slaughter ", "Slay ", "Smash ", "Spar ", "Stop ", "Strike ", "Subdue ", "Surmount ", "Storm ", "Vanquish ", "Wound ", "Wreck ")

	name_part1 = pick("Admiral ", "Agent ", "Assassin ", "Anarchist ", "Arms Dealer ", "Arsonist ", "Administrator ", "Abductor ", "Baron ", "Bandit ", "Bounty Hunter ", "Blood Cultist ", "Boss ", "Brigadier ", "Bomber ", "Captain ", "Chapter Master ", "Colonel ", "Commander ", "Commodore ", "Count ", "Cultist ", "Crazy ", "Doctor ", "Dread King ", "Duke ", "Deserter ", "Destroyer ", "Deviant ", "Enforcer ", "Emperor ", "Empress ", "Executioner ", "Escaped Prisoner ", "Extorter ", "Forger ", "Fraudster ", "Firestarter ", "Fanatic ", "Fugitive ", "Gangster ", "General ", "Gunner ", "Inquisitor ", "Interferer ", "Inciter ", "Igniter ", "King ", "Killer ", "Kidnapper ", "Leader ", "Legate ", "Lieutenant ", "Lord ", "Mad ", "Magnate ", "Mafioso ", "Major ", "Mercenary ", "Master ", "Maverick ", "NeoTheologist ", "Ninja ", "Officer ", "Operative ", "Prince ", "Princess ", "Professor ", "Private ", "Prophet ", "Pariah ", "Pirate ", "Queen ", "Secret Agent ", "Sergeant ", "Serial Killer ", "Supreme Commander ", "Serbian ", "Smuggler ", "Traitor ", "Terrorist ", "Thief ", "Trafficker ", "Terroriser ", "Viscount ", "Warlord ", "Warmonger ", "Zealot ")
	name_part2 = pick("Alexander", "Ana", "Adams", "Arthur", "Bash",  "Brown", "Buchanan", "Bush", "Bowchief", "Boyum", "Brooks", "Carly", "Clark", "Campbell", "Cox", "Carter", "David", "Dane", "Divino", "Dizet", "Duket", "Diaz", "Ebonheart", "Earl", "Evans", "Edwards",  "Frank", "Flores", "Foster", "Ford", "Fillmore", "Garfield", "Greyson", "Grid", "Gustavia", "Griffin", "Hank", "Harold", "Helenora", "Hippolyta", "Harris", "Hoover", "Hippie", "Ian", "Iain", "Ivan", "Ianto", "Jathok", "Jermaine", "Jim", "Jackson", "Johnson", "Kate", "K'vhas", "Kei", "Lee", "Leslie", "Luxitou", "Makino", "Marshall", "Muu'rn", "Myrin", "Madison", "Monroe", "Mcfall", "N'imira", "Nathan", "Natasha", "Oliver", "Owen", "Orion", "Pasotel", "Pauper", "Popsy", "Prax", "Pierce", "Quentin", "Ray", "Resca", "Robinson", "Roosevelt", "Samantha", "Sanders", "Sarah", "Seeking", "Stellar", "Strelle", "Szandor", "Thompson", "Thomas", "Uriel", "Victoria", "Violet", "Victor", "Valentine", "Watson", "Walker", "Wilson", "Wolf", "William", "White", "Washington", "Xarillia", "Xander", "Yael", "Yadon", "Yaakov", "Zach", "Zeke", "Zane")

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
