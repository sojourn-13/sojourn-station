
// Plasma shards have been moved to code/game/objects/items/weapons/shards.dm

//legacy crystal
/obj/machinery/crystal
	name = "crystal"
	icon = 'icons/obj/mining.dmi'
	icon_state = "crystal"

/obj/machinery/crystal/New()
	if(prob(50))
		icon_state = "crystal2"

//Talk crystal

/obj/item/talkingcrystal

	name = "crystal"
	icon = 'icons/obj/xenoarchaeology.dmi'
	icon_state = "talk_crystal"
	//listening_to_players = 1
	//speaking_to_players = 1

/obj/item/talkingcrystal/New()
	src.talking_atom = new (src)
	if(prob(50))
		icon_state = "talk_crystal2"
	//START_PROCESSING(SSobj, src)


///obj/item/crystal/Destroy()
	//..()
	//STOP_PROCESSING(SSobj, src)