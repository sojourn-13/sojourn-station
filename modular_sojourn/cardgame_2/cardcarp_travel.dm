/obj/item/travel_token
	name = "CardCarp's Travel Card Ticket"
	desc = "A complex looking device that has a preloaded card jammed inside giving it a single use self teleportation to a local beacon that has been pre-linked.\
	CardCarp's workshop has taken great langths to ensure all players as well as place many warning stickers that its verson of teleporation is completely safe; \
	and to hold onto any items as anything dropped well being teleported will be lost."
	icon_state = "tt_ticket"
	origin_tech = list(TECH_BIO_TECH = 2)
	matter = list (MATERIAL_PLASTIC = 3, MATERIAL_GLASS = 1)
	preloaded_reagents = list("silicon" = 20, "crayon_dust_blue" = 5, "plasticide" = 12)
	icon = 'modular_sojourn/cardgame_2/cardgame_sprites.dmi'
	var/linked_beacon
	var/backup
	var/used = FALSE

/obj/item/travel_token/attackby(obj/o, mob/user as mob)
	if(istype(o, /obj/item/card_carp))
		linked_beacon = user.loc
		to_chat(user, "<span class='info'>The device scans the card linking the device to your location.</span>")
		playsound(src,'sound/bureaucracy/stamp.ogg',40,1)
	else
		..()

/obj/item/travel_token/attack_self(mob/user as mob)
	if(used)
		to_chat(user, "<span class='info'>The device seems unable to be used after a single teleportation...</span>")
		user.drop_from_inventory(src)
		qdel(src)
		return
	if(!linked_beacon)
		to_chat(user, "<span class='info'>To link to a location use any CardCarp Card to lock in a location for a single use.</span>")
	if(linked_beacon)
		to_chat(user, "<span class='info'>With a simple press of a button you find yourself in a pitch black void location?</span>")
		backup = user.loc
		cardcarp_travel(user)
	else
		to_chat(user, "<span class='info'>The device beeps a moment before warning giving a warning about no linked location.</span>")


/obj/item/travel_token/proc/cardcarp_travel(mob/M)
	//Dont change the top lines they are real letters BYOND DM cant see normally
	var/list/hmm = list("༒", "༎༐།", "‽", "⸘", "༑")
	var/candle_number = rand(5, 10)
	var/cn = 0

	for(cn = 0,cn<candle_number, cn++)
		var/huh = pick(hmm)
		to_chat(M, "<span class='info'>[huh]</span>") //Spammy!
	if(prob(candle_number))
		to_chat(M,"Where am I?")
	M.loc = null

	var/cn_s = candle_number SECONDS
	sleep(cn_s)
	var/turf/source = get_turf(linked_beacon) //Just in case its a locker or other wierdness
	if(source)
		M.loc = source
		to_chat(M, "<span class='info'>In a instance you find yourself back at the location where you synced the beacon...</span>")
		used = TRUE
		qdel(src)
		return
	if(backup)//Should in theory never need to be used
		var/papertype_helper = pick("Cardstock 160-325","Index 163-255","Book 75-148","A4 210-297","Folio 8.5-13)") //types of paper
		to_chat(M, "<span class='info'>...The eyes of something looking at you states objectively \"A little lost, somewhere you shouldn't be. \
		Worring. Well this time [papertype_helper] has allowed me to get you back to where you need to go...\".</span>")
		M.loc = backup
		to_chat(M, "<span class='info'>In a instance you find yourself back at the same place?</span>")
	else
		to_chat(M, "<span class='info'>The path back is no longer, as the planet and its stars no longer can find you.</span>")
	used = TRUE
	qdel(src)