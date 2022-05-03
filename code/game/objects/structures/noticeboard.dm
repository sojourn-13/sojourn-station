/obj/structure/noticeboard
	name = "notice board"
	desc = "A board for pinning important notices upon."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "nboard00"
	density = 0
	anchored = 1
	var/notices = 0

/obj/structure/noticeboard/Initialize()
	. = ..()
	for(var/obj/item/I in loc)
		if(notices > 4) break
		if(istype(I, /obj/item/paper))
			I.loc = src
			notices++
	icon_state = "nboard0[notices]"

//attaching papers!!
/obj/structure/noticeboard/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(istype(O, /obj/item/paper))
		if(notices < 5)
			O.add_fingerprint(user)
			add_fingerprint(user)
			user.drop_from_inventory(O)
			O.loc = src
			notices++
			icon_state = "nboard0[notices]"	//update sprite
			to_chat(user, SPAN_NOTICE("You pin the paper to the noticeboard."))
		else
			to_chat(user, SPAN_NOTICE("You reach to pin your paper to the board but hesitate. You are certain your paper will not be seen among the many others already attached."))

/obj/structure/noticeboard/attack_hand(var/mob/user)
	examine(user)

// Since Topic() never seems to interact with usr on more than a superficial
// level, it should be fine to let anyone mess with the board other than ghosts.
/obj/structure/noticeboard/examine(var/mob/user)
	if(!user)
		user = usr
	if(user.Adjacent(src))
		var/dat = "<B>Noticeboard</B><BR>"
		for(var/obj/item/paper/P in src)
			dat += "<A href='?src=\ref[src];read=\ref[P]'>[P.name]</A> <A href='?src=\ref[src];write=\ref[P]'>Write</A> <A href='?src=\ref[src];remove=\ref[P]'>Remove</A><BR>"
		user << browse("<HEAD><TITLE>Notices</TITLE></HEAD>[dat]","window=noticeboard")
		onclose(user, "noticeboard")
	else
		..()

/obj/structure/noticeboard/Topic(href, href_list)
	..()
	usr.set_machine(src)
	if(href_list["remove"])
		if((usr.stat || usr.restrained()))	//For when a player is handcuffed while they have the notice window open
			return
		var/obj/item/P = locate(href_list["remove"])
		if(P && P.loc == src)
			P.loc = get_turf(src)	//dump paper on the floor because you're a clumsy fuck
			P.add_fingerprint(usr)
			add_fingerprint(usr)
			notices--
			icon_state = "nboard0[notices]"
	if(href_list["write"])
		if((usr.stat || usr.restrained())) //For when a player is handcuffed while they have the notice window open
			return
		var/obj/item/P = locate(href_list["write"])
		if((P && P.loc == src)) //ifthe paper's on the board
			if(istype(usr.r_hand, /obj/item/pen)) //and you're holding a pen
				add_fingerprint(usr)
				P.attackby(usr.r_hand, usr) //then do ittttt
			else
				if(istype(usr.l_hand, /obj/item/pen)) //check other hand for pen
					add_fingerprint(usr)
					P.attackby(usr.l_hand, usr)
				else
					to_chat(usr, SPAN_NOTICE("You'll need something to write with!"))
	if(href_list["read"])
		var/obj/item/paper/P = locate(href_list["read"])
		if((P && P.loc == src))
			usr << browse("<HTML><HEAD><TITLE>[P.name]</TITLE></HEAD><BODY><TT>[P.info]</TT></BODY></HTML>", "window=[P.name]")
			onclose(usr, "[P.name]")
	return

// put actual, filled noticeboards here. These are for adding actual notices via code. Be careful! Anything written here will likely be taken as law by those that read them

/obj/structure/noticeboard/marshal
	name = "Marshal bulletin board"
	desc = "A board containing vital notices and official memos for Marshal Officers."
	icon_state = "nboard03"
	notices = 3

/obj/structure/noticeboard/marshal/New()
//add some memos, make sure to break them up so it's relatively readable in code!
	var/obj/item/paper/P = new()
	P.name = "Memo RE: Equipment handling"
	P.info = "<br>Officers and Troopers alike, remember to properly secure lockers and weaponry. This is not a daycare, you should not need to be reminded that duty-gear is not to be left lying around and unsecured - Agent Sanja"
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped &= STAMP_FACTION
	src.contents += P

	P = new()
	P.name = "Memo RE: Recorder"
	P.info = "<br>A small note for all personnel, new and old alike. It has come to our attention that there is a fatal operating error in the software of handheld universal recorders that causes them to make \
	audio files inaccessible should the file fill up. Make a note of it, and switch to a new file BEFORE the recorder turns off due to a full-file, the techies are getting a bit tired of recovering data from these broken files - Ranger Doe"
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped &= STAMP_FACTION
	src.contents += P

	P = new()
	P.name = "Memo; Daily Routine"
	P.info = "<hr><hr><b><center>Daily Routine check list</b><br><small>Marshal E.R.T. Officer Moore</small></center><hr> <ul><li>Record checks <small>{Every hour or when needed. Keeping our eyes on the past and those around us is key to stopping any issues that may fall on the colony. As the old saying goes 'The devil hides in the details'.}</small> \
<li> Clearing hallway maintenance tunnels and any potential dangers <small>{The main point is to avoid any local vermin from wandering into the hallways and to reduce any potential injuries. Take it slow if you must and bring back up when needed. You're the last line of defence for the colony when others fail or are too weak to defend themselves. Stay alive and stay smart}</small><li> Scocial presence and patrols \
<small>{Our job is not to sit around and hide in our box, get out there and keep the public trust with a simple 'Hello' and asking about their day. We're what they look to for support when times get tough. Keep your eyes open for possible infractions and always represent the marshals with the safety of the colony in mind}</small> <li> Study and training\
<small>{It's not a shameful thing to look back on your knowledge for help, some days we all need a hand. Being able to keep an active mind like steel and the ability to accurately divine the law will be a well  used skill. Much like our local church they teach us to keep body spirit and mind in balance, so to must we learn to improve on these with mental drills, situational training with our team, and rest when we need it.}</small></ul> <hr><hr>"
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped &= STAMP_FACTION
	src.contents += P

/obj/structure/noticeboard/blackshield
	name = "Blackshield bulletin board"
	desc = "A board containing vital notices and official memos for the Blackshield Militia"
	icon_state = "nboard02"
	notices = 2

/obj/structure/noticeboard/blackshield/New()
	var/obj/item/paper/P = new()
	P.name = "Memo RE: Equipment handling"
	P.info = "<br>Officers and Troopers alike, remember to properly secure lockers and weaponry. This is not a daycare, you should not need to be reminded that duty-gear is not to be left lying around - Agent Sanja"
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped &= STAMP_FACTION
	src.contents += P

	P = new()
	P.name = "Memo RE: Gate procedure"
	P.info = "<br>This is a firm reminder to all Blackshield Personnel to draw their attention to the Gate Operations section of S.O.P, <b>particularly</b> the section detailing proper bolting of the gate when present and \
	<b><i>UNBOLTING</b></i> of the gate when NOT present. The next trooper to get a fax sent because he left the foreman bolted outside is going to be scrubbing the latrines with his toothbrust - Sgt Dansen"
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped &= STAMP_FACTION
	src.contents += P

/obj/structure/noticeboard/medical
	name = "Medical bulletin board"
	desc = "A board containing vital notices and official memos for Soteria Medical"
	icon_state = "nboard01"
	notices = 1

/obj/structure/noticeboard/medical/New()
	var/obj/item/paper/P = new()
	P.name = "Memo RE: Initial setup"
	P.info = "<br>Note to all biolab staff:<br> Please remember to set up the cryo cooler to 80K, attach anesthetic tanks to the surgery stands and make the following basic chems -<br><ul> <li> Bicaridine<br><li> Keloderm (1 part Kelotane, 1 part Dermaline)<br>\
	<li> Carthatoline<br><li> Dexalin Plus (in 5u pills)<br> <li> Tramadol (in 5u pills)<br><li> Sanguinum<br><li> Peridaxon using the leftover Cronexadone<br><li> Cronexadone (to be mixed in two parts with the beakers next to the cryo tubes)</ul><br>Thank you Dears - Dr M. Bright"
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped &= STAMP_FACTION
	src.contents += P


/obj/structure/noticeboard/research
	name = "Medical bulletin board"
	desc = "A board containing vital notices and official memos for the Soteria research"
	icon_state = "nboard00"
	notices = 1

/obj/structure/noticeboard/research/New()
	var/obj/item/paper/P = new()
	P = new()
	P.name = "Memo RE: Ameridian handling"
	P.info = "Remember, when dealing with Ameridian Crystals, to :<ol> \
	<li> Wear a Radiation Suit. The crystals are radioactive with a radius of 2 meters, and the small ones are as radioactive as the grown ones.\
	<li> Let the crystals grow. Only a fully grown crystal will spread and allow for a sustainable field.\
	<li> Not let it grow out of control. If enough fully matured crystals are close enough together, golems can appear.\
	<li> Retreat past the Sonic Fence if golems appear. The Sonic Fence will instantly destroy the golems that touches it. You can also use the Handheld Sonic emitter to destroy the golem.\
	<li> Not turn off the Sonic Fence or allow it to be turned off. The Sonic Fence is a perfect containment to Ameridian, when it is active. If it turned off, the crystal will be able to spread out of control. If it needs to be turned off for whatever reason, either keep an eye on the crystals, or harvest them all to prevent unwanted spread.\
	<li> Reseed the field. In case the field get removed completely, more crystals can be seeded with either 5 ameridian shard, or by splashing at least 10u of Liquid Ameridian on the floor.\
	<li> Refine the shards. While Ameridian is valuable on its own, it's true value can only be used when refining it into Liquid Ameridian using an Ameridian Refinery, after which it can be further transformed into regular materials in the Liquid Ameridian Processor.\
	<li> Carry the shards through the fence. Your body interfere with the Sonic Fence, allowing you to carry ameridian shards through the fence. The same cannot be said for dragged or thrown crystals, which will get destroyed on contact. Do not throw money away.</ol> "
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped &= STAMP_FACTION
	src.contents += P

/obj/structure/noticeboard/guild
	name = "Artificers Guild bulletin board"
	desc = "A board containing vital notices and official memos for the colonies resident Guild"
	icon_state = "nboard00"
	notices = 0

/obj/structure/noticeboard/prospectors
	name = "Prospectors bulletin board"
	desc = "A board containing vital notices and official memos for the colonies most underappreciated trashmen"
	icon_state = "nboard00"
	notices = 0

/obj/structure/noticeboard/lonestar_service
	name = "Lonestar Shipping bulletin board"
	desc = "A board containing vital notices and official memos for Lonestar-Service Employees"
	icon_state = "nboard00"
	notices = 0

/obj/structure/noticeboard/lonestar_supply
	name = "Lonestar Shipping bulletin board"
	desc = "A board containing vital notices and official memos for Lonestar-Supply Employees"
	icon_state = "nboard00"
	notices = 2

/obj/structure/noticeboard/lonestar_supply/New()
	var/obj/item/paper/P = new()
	P.name = "Memo RE: Mining Drills"
	P.info = "<ul><li>seismic activity 1: The lowest possible pretty much. Should be a cakewalk even if you've got basic equipment or don't quite know what you're doing just yet. \
	The scariest you'll run into is a spitter or two, at worst maybe a singular warrior. It'll also be only two burrows per drill, each spewing out groups of three until you smash'em. \
	<li>Seismic activity 2: The biggest difference between 1 and 2 is the fact that the chances for warriors, spitters or worse is higher. Otherwise it is just three burrows that spit out groups of three. \
	<li> Seismic activity 3: While we stay with only three burrows, each of them will now spew out four termites up until you break it, also at a faster rate. \
	<li>Seismic activity 4: Four burrows, four termites and a relatively high chance for beefier termites to show up. \
	<li> Seismic activity 5: Five burrows, four termites. At this point you can expect termites almost every minute out of a burrow, and a burrow every two minutes. Should have some serious firepower if you wanna tackle that. \
	<li> Seismic activity 6: SEVEN BURROWS. FIVE TERMITES. Expect basically ONLY the beefy motherfuckers and get ready to BEAT SHIT DOWN FAST. THEY ARE COMING, AND THERE ARE MANY. Now it's literally two minutes between burrows and only sixty seconds between large groups coming from them. \
	<b>Do not put your drill on an activity 6 spot if you ain't prepared for it, stuff WILL get out of hand, you WILL be overrun.</b></ul><br>Yeah that's about it, see ya'.<br>\
P.S - <u><h1>Don't leave the drills running unattended!</u></h1>"
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped &= STAMP_FACTION
	src.contents += P

	P = new()
	P.name = "Memo RE: Ameridian handling"
	P.info = "Remember, when dealing with Ameridian Crystals, to :<ol> \
	<li> Wear a Radiation Suit. The crystals are radioactive with a radius of 2 meters, and the small ones are as radioactive as the grown ones.\
	<li> Let the crystals grow. Only a fully grown crystal will spread and allow for a sustainable field.\
	<li> Not let it grow out of control. If enough fully matured crystals are close enough together, golems can appear.\
	<li> Retreat past the Sonic Fence if golems appear. The Sonic Fence will instantly destroy the golems that touches it. You can also use the Handheld Sonic emitter to destroy the golem.\
	<li> Not turn off the Sonic Fence or allow it to be turned off. The Sonic Fence is a perfect containment to Ameridian, when it is active. If it turned off, the crystal will be able to spread out of control. If it needs to be turned off for whatever reason, either keep an eye on the crystals, or harvest them all to prevent unwanted spread.\
	<li> Reseed the field. In case the field get removed completely, more crystals can be seeded with either 5 ameridian shard, or by splashing at least 10u of Liquid Ameridian on the floor.\
	<li> Refine the shards. While Ameridian is valuable on its own, it's true value can only be used when refining it into Liquid Ameridian using an Ameridian Refinery, after which it can be further transformed into regular materials in the Liquid Ameridian Processor.\
	<li> Carry the shards through the fence. Your body interfere with the Sonic Fence, allowing you to carry ameridian shards through the fence. The same cannot be said for dragged or thrown crystals, which will get destroyed on contact. Do not throw money away.</ol> "
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped &= STAMP_FACTION
	src.contents += P


/obj/structure/noticeboard/church
	name = "Church of the Absolute bulletin board"
	desc = "A board containing vital notices and official memos for the faithful"
	icon_state = "nboard00"
	notices = 0
/*
/obj/structure/noticeboard/church/New()

	var/obj/item/paper/P = new()  write this later, idr the steps
	P.name = "Memo RE: Bio-gen troubleshooting"
	P.info = "<br> "
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped &= STAMP_FACTION
	src.contents += P
	*/