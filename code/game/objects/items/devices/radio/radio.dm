// Access check is of the type requires one. These have been carefully selected to avoid allowing the janitor to see channels he shouldn't
var/global/list/default_internal_channels = list(
	num2text(PUB_FREQ) = list(),
	num2text(AI_FREQ)  = list(access_synth),
	num2text(COMM_FREQ)= list(access_heads),
	num2text(ENG_FREQ) = list(access_engine_equip, access_atmospherics),
	num2text(MED_FREQ) = list(access_medical_equip),
	num2text(NT_FREQ) = list(access_nt_disciple),
	num2text(MED_I_FREQ)=list(access_medical_equip),
	num2text(SEC_FREQ) = list(access_security),
	num2text(BLS_FREQ) = list(access_security),
	num2text(MAR_FREQ) = list(access_forensics_lockers),
	num2text(SEC_I_FREQ)=list(access_security),
	num2text(SCI_FREQ) = list(access_tox,access_robotics,access_xenobiology),
	num2text(SUP_FREQ) = list(access_cargo),
	num2text(SRV_FREQ) = list(access_janitor, access_hydroponics),
	num2text(PRO_FREQ) = list(access_prospector),
	num2text(PT_BT_FREQ) = list(access_security),
	num2text(PT_RT_FREQ) = list(access_security),
	num2text(PT_YT_FREQ) = list(access_security),
	num2text(PT_GT_FREQ) = list(access_security)
)

var/global/list/unique_internal_channels = list(
	num2text(DTH_FREQ) = list(access_cent_specops)
)

var/global/list/default_medbay_channels = list(
	num2text(PUB_FREQ) = list(),
	num2text(MED_FREQ) = list(access_medical_equip),
	num2text(MED_I_FREQ) = list(access_medical_equip)
)

/obj/item/device/radio
	icon = 'icons/obj/radio.dmi'
	name = "ham radio"
	suffix = "\[3\]"
	icon_state = "walkietalkie"
	item_state = "walkietalkie"

	var/on = 1 // 0 for off
	var/last_transmission
	var/frequency = PUB_FREQ //common chat
	var/contractor_frequency = 0 //tune to frequency to unlock contractor supplies
	var/canhear_range = 3 // the range which mobs can hear this radio from
	var/datum/wires/radio/wires = null
	var/b_stat = 0
	var/broadcasting = 0
	var/listening = 1
	var/list/channels = list() //see communications.dm for full list. First channel is a "default" for :h
	var/subspace_transmission = FALSE
	var/subspace_switchable = FALSE
	var/loudspeaker = FALSE
	var/loudspeaker_switchable = FALSE
	var/adhoc_fallback = FALSE
	var/syndie = 0//Holder to see if it's a syndicate encrypted radio
	var/list/transmit_levels  //List of z-levels it can transmit to without tcomms
	var/multi_z_capable = TRUE //Whether it's able to transmit up/down in multi-Z areas
	flags = CONDUCT
	slot_flags = SLOT_BELT
	throw_speed = 2
	throw_range = 9
	w_class = ITEM_SIZE_SMALL

	matter = list(MATERIAL_PLASTIC = 3, MATERIAL_GLASS = 1)
	var/const/FREQ_LISTENING = 1
	var/list/internal_channels
	var/datum/radio_frequency/radio_connection
	var/list/datum/radio_frequency/secure_radio_connections = new

/obj/item/device/radio/proc/set_frequency(new_frequency)
	SSradio.remove_object(src, frequency)
	frequency = new_frequency
	radio_connection = SSradio.add_object(src, frequency, RADIO_CHAT)

/obj/item/device/radio/New()
	..()
	wires = new(src)
	internal_channels = default_internal_channels.Copy()
	if(syndie)
		internal_channels += unique_internal_channels.Copy()
	add_hearing()

/obj/item/device/radio/Destroy()
	remove_hearing()
	QDEL_NULL(wires)
	SSradio.remove_object(src, frequency)
	for (var/ch_name in channels)
		SSradio.remove_object(src, radiochannels[ch_name])

	return ..()


/obj/item/device/radio/Initialize()
	. = ..()

	if(frequency < RADIO_LOW_FREQ || frequency > RADIO_HIGH_FREQ)
		frequency = sanitize_frequency(frequency, RADIO_LOW_FREQ, RADIO_HIGH_FREQ)
	set_frequency(frequency)

	for (var/ch_name in channels)
		secure_radio_connections[ch_name] = SSradio.add_object(src, radiochannels[ch_name],  RADIO_CHAT)

/obj/item/device/radio/attack_self(mob/user as mob)
	user.set_machine(src)
	interact(user)
	add_fingerprint(user) //Touching a radio adds are prints

/obj/item/device/radio/interact(mob/user)
	if(!user)
		return 0

	if(b_stat)
		wires.Interact(user)

	return ui_interact(user)

/obj/item/device/radio/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Radio", name)
		ui.open()

/obj/item/device/radio/ui_status(mob/user)
	if(!on)
		return UI_CLOSE
	return ..()

/obj/item/device/radio/ui_data(mob/user)
	var/list/data = list()

	data["rawfreq"] = frequency
	data["listening"] = listening
	data["broadcasting"] = broadcasting
	data["subspace"] = subspace_transmission
	data["subspaceSwitchable"] = subspace_switchable
	data["loudspeaker"] = loudspeaker
	data["loudspeakerSwitchable"] = loudspeaker_switchable

	data["mic_cut"] = (wires.IsIndexCut(WIRE_TRANSMIT) || wires.IsIndexCut(WIRE_SIGNAL))
	data["spk_cut"] = (wires.IsIndexCut(WIRE_RECEIVE) || wires.IsIndexCut(WIRE_SIGNAL))

	var/list/chanlist = list_channels(user)
	if(islist(chanlist) && chanlist.len)
		data["chan_list"] = chanlist
	else
		data["chan_list"] = null

	if(syndie)
		data["useSyndMode"] = TRUE
	else
		data["useSyndMode"] = FALSE

	data["minFrequency"] = PUBLIC_LOW_FREQ
	data["maxFrequency"] = PUBLIC_HIGH_FREQ

	return data

/obj/item/device/radio/ui_act(action, params)
	. = ..()
	if(.)
		return

	switch(action)
		if("setFrequency")
			var/new_frequency = (text2num(params["freq"]))
			if((new_frequency < PUBLIC_LOW_FREQ || new_frequency > PUBLIC_HIGH_FREQ))
				new_frequency = sanitize_frequency(new_frequency)
			set_frequency(new_frequency)
			if(hidden_uplink)
				if(hidden_uplink.check_trigger(usr, frequency))
					SStgui.close_uis(src)
			. = TRUE
		if("broadcast")
			ToggleBroadcast()
			. = TRUE
		if("listen")
			ToggleReception()
			. = TRUE
		if("channel")
			var/chan_name = params["channel"]
			if(channels[chan_name] & FREQ_LISTENING)
				channels[chan_name] &= ~FREQ_LISTENING
			else
				channels[chan_name] |= FREQ_LISTENING
			. = TRUE
		if("specFreq")
			var/freq = params["channel"]
			if(has_channel_access(usr, freq))
				set_frequency(text2num(freq))
			. = TRUE
		if("subspace")
			if(subspace_switchable)
				subspace_transmission = !subspace_transmission
				if(!subspace_transmission)
					channels = list()
					to_chat(usr, "<span class='notice'>Subspace Transmission is disabled</span>")
				else
					recalculateChannels()
					to_chat(usr, "<span class='notice'>Subspace Transmission is enabled</span>")
				. = TRUE
		if("toggleLoudspeaker")
			if(!loudspeaker_switchable)
				return
			loudspeaker = !loudspeaker

			if(loudspeaker)
				canhear_range = 3
				to_chat(usr, "<span class='notice'>Loadspeaker enabled.</span>")
			else
				canhear_range = 0
				to_chat(usr, "<span class='notice'>Loadspeaker disabled.</span>")
			. = TRUE

	if(. && !issilicon(usr))
		playsound(loc, 'sound/machines/machine_switch.ogg', 100, 1)

/obj/item/device/radio/proc/list_channels(var/mob/user)
	return list_internal_channels(user)

/obj/item/device/radio/proc/list_secure_channels(var/mob/user)
	var/dat[0]

	for(var/ch_name in channels)
		var/chan_stat = channels[ch_name]
		var/listening = !!(chan_stat & FREQ_LISTENING) != 0

		dat.Add(list(list("chan" = ch_name, "display_name" = ch_name, "secure_channel" = 1, "sec_channel_listen" = !listening, "freq" = radiochannels[ch_name])))

	return dat

/obj/item/device/radio/proc/list_internal_channels(var/mob/user)
	var/dat[0]
	for(var/internal_chan in internal_channels)
		if(has_channel_access(user, internal_chan))
			dat.Add(list(list("chan" = internal_chan, "display_name" = get_frequency_name(text2num(internal_chan)), "freq" = text2num(internal_chan))))

	return dat

/obj/item/device/radio/proc/has_channel_access(var/mob/user, var/freq)
	if(!user)
		return 0

	if(!(freq in internal_channels))
		return 0

	return user.has_internal_radio_channel_access(internal_channels[freq])

/mob/proc/has_internal_radio_channel_access(var/list/req_one_accesses)
	var/obj/item/card/id/I = GetIdCard()
	return has_access(list(), req_one_accesses, I ? I.GetAccess() : list())

/mob/observer/ghost/has_internal_radio_channel_access(var/list/req_one_accesses)
	return isAdminGhostAI(src)

/obj/item/device/radio/proc/update_transmit_levels() //Updating how far a radio can reach in multi-Z areas
	var/turf/position = get_turf(src)
	//Fetching own Z-level
	var/z_level = position.z
	transmit_levels = list(z_level)

	if(multi_z_capable) //If multi z capable, also allow transmitting up/down
		// UP
		while(HasAbove(z_level++))
			transmit_levels |= z_level

		// Down
		z_level = position.z
		while(HasBelow(z_level--))
			transmit_levels |= z_level
	return transmit_levels

/obj/item/device/radio/proc/text_sec_channel(var/chan_name, var/chan_stat)
	var/list = !!(chan_stat&FREQ_LISTENING)!=0
	return {"
			<B>[chan_name]</B><br>
			Speaker: <A href='byond://?src=\ref[src];ch_name=[chan_name];listen=[!list]'>[list ? "Engaged" : "Disengaged"]</A><BR>
			"}

/obj/item/device/radio/proc/ToggleBroadcast()
	broadcasting = !broadcasting && !(wires.IsIndexCut(WIRE_TRANSMIT) || wires.IsIndexCut(WIRE_SIGNAL))

/obj/item/device/radio/proc/ToggleReception()
	listening = !listening && !(wires.IsIndexCut(WIRE_RECEIVE) || wires.IsIndexCut(WIRE_SIGNAL))

/obj/item/device/radio/CanUseTopic()
	if(!on)
		return STATUS_CLOSE
	return ..()

/obj/item/device/radio/Topic(href, href_list)
	if(..())
		return 1

	usr.set_machine(src)
	if (href_list["track"])
		var/mob/target = locate(href_list["track"])
		var/mob/living/silicon/ai/A = locate(href_list["track2"])
		if(A && target)
			A.ai_actual_track(target)
		. = 1

	if(href_list["nowindow"]) // here for pAIs, maybe others will want it, idk
		return 1

	if(!issilicon(usr))
		playsound(loc, 'sound/machines/machine_switch.ogg', 100, 1)

/obj/item/device/radio/proc/autosay(var/message, var/from, var/channel) //BS12 EDIT
	var/datum/radio_frequency/connection = null
	if(channel && channels && channels.len > 0)
		if (channel == "department")
			channel = channels[1]
		connection = secure_radio_connections[channel]
	else
		connection = radio_connection
		channel = null
	if (!istype(connection))
		return
	if (!connection)
		return

	Broadcast_Message(connection, null,
						0, "*garbled automated announcement*", src,
						message, from, "Automated Announcement", from, "synthesized voice",
						4, 0, list(0), connection.frequency, "states")
	return

// Interprets the message mode when talking into a radio, possibly returning a connection datum
/obj/item/device/radio/proc/handle_message_mode(mob/living/M as mob, message, message_mode)
	// If a channel isn't specified, send to common.
	if(!message_mode || message_mode == "headset")
		return radio_connection

	// Otherwise, if a channel is specified, look for it.
	if(channels && channels.len > 0)
		if (message_mode == "department") // Department radio shortcut
			message_mode = channels[1]

		if (channels[message_mode]) // only broadcast if the channel is set on
			return secure_radio_connections[message_mode]

	// If we were to send to a channel we don't have, drop it.
	return null

/obj/item/device/radio/talk_into(mob/living/M as mob, message, channel, var/verb = "says", var/datum/language/speaking = null, var/speech_volume)
	if(!on) return 0 // the device has to be on
	//  Fix for permacell radios, but kinda eh about actually fixing them.
	if(!M || !message) return 0

	//  Uncommenting this. To the above comment:
	// 	The permacell radios aren't suppose to be able to transmit, this isn't a bug and this "fix" is just making radio wires useless. -Giacom
	if(wires.IsIndexCut(WIRE_TRANSMIT)) // The device has to have all its wires and shit intact
		return 0

	if(!radio_connection)
		set_frequency(frequency)

	/* Quick introduction:
		This new radio system uses a very robust FTL signaling technology unoriginally
		dubbed "subspace" which is somewhat similar to 'blue-space' but can't
		actually transmit large mass. Headsets are the only radio devices capable
		of sending subspace transmissions to the Communications Satellite.

		A headset sends a signal to a subspace listener/receiver elsewhere in space,
		the signal gets processed and logged, and an audible transmission gets sent
		to each individual headset.
	*/

	//#### Grab the connection datum ####//
	var/datum/radio_frequency/connection = handle_message_mode(M, message, channel)
	if (!istype(connection))
		return 0
	if (!connection)
		return 0

	var/turf/position = get_turf(src)

	//#### Tagging the signal with all appropriate identity values ####//

	// ||-- The mob's name identity --||
	var/displayname = M.name	// grab the display name (name you get when you hover over someone's icon)
	var/real_name = M.real_name // mob's real name
	var/mobkey = "none" // player key associated with mob
	var/voicemask = 0 // the speaker is wearing a voice mask
	if(M.client)
		mobkey = M.key // assign the mob's key


	var/jobname // the mob's "job"

	// --- Human: use their actual job ---
	if (ishuman(M))
		var/mob/living/carbon/human/H = M
		jobname = H.get_assignment()

	// --- Carbon Nonhuman ---
	else if (iscarbon(M)) // Nonhuman carbon mob
		jobname = "No id"

	// --- AI ---
	else if (isAI(M))
		jobname = "AI"

	// --- Cyborg ---
	else if (isrobot(M))
		jobname = "Robot"

	// --- Personal AI (pAI) ---
	else if (istype(M, /mob/living/silicon/pai))
		jobname = "Personal AI"

	// --- Unidentifiable mob ---
	else
		jobname = "Unknown"


	// --- Modifications to the mob's identity ---

	// The mob is disguising their identity:
	if (ishuman(M) && M.GetVoice() != real_name)
		displayname = M.GetVoice()
		jobname = "Unknown"
		voicemask = 1
	LEGACY_SEND_SIGNAL(src, COMSIG_MESSAGE_SENT)


  /* ###### Radio headsets can only broadcast through subspace ###### */

	if(subspace_transmission)
		// First, we want to generate a new radio signal
		var/datum/signal/signal = new
		signal.transmission_method = 2 // 2 would be a subspace transmission.
									   // transmission_method could probably be enumerated through #define. Would be neater.

		// --- Finally, tag the actual signal with the appropriate values ---
		signal.data = list(
		  // Identity-associated tags:
			"mob" = M, // store a reference to the mob
			"mobtype" = M.type, 	// the mob's type
			"realname" = real_name, // the mob's real name
			"name" = displayname,	// the mob's display name
			"job" = jobname,		// the mob's job
			"key" = mobkey,			// the mob's key
			"vmessage" = pick(M.speak_emote), // the message to display if the voice wasn't understood
			"vname" = M.voice_name, // the name to display if the voice wasn't understood
			"vmask" = voicemask,	// 1 if the mob is using a voice gas mask

			// We store things that would otherwise be kept in the actual mob
			// so that they can be logged even AFTER the mob is deleted or something

		  // Other tags:
			"compression" = rand(45,50), // compressed radio signal
			"message" = message, // the actual sent message
			"connection" = connection, // the radio connection to use
			"radio" = src, // stores the radio used for transmission
			"slow" = 0, // how much to sleep() before broadcasting - simulates net lag
			"traffic" = 0, // dictates the total traffic sum that the signal went through
			"type" = 0, // determines what type of radio input it is: normal broadcast
			"server" = null, // the last server to log this signal
			"reject" = 0,	// if nonzero, the signal will not be accepted by any broadcasting machinery
			"level" = position.z, // The source's z level
			"language" = speaking,
			"verb" = verb,
			"speech_volume" = speech_volume
		)
		signal.frequency = connection.frequency // Quick frequency set

	  //#### Sending the signal to all subspace receivers ####//

		for(var/obj/machinery/telecomms/receiver/R in telecomms_list)
			R.receive_signal(signal)

		// Allinone can act as receivers.
		for(var/obj/machinery/telecomms/allinone/R in telecomms_list)
			R.receive_signal(signal)

		// Receiving code can be located in Telecommunications.dm
		if(signal.data["done"] && (position.z in signal.data["level"]))
			return TRUE //Huzzah, sent via subspace


		else if(adhoc_fallback) //Fallback radio
			to_chat(loc,"<span class='warning'>\The [src] pings as it falls back to local radio transmission.</span>")
			subspace_transmission = FALSE

			update_transmit_levels()
			return Broadcast_Message(connection, M, voicemask, pick(M.speak_emote),
					  src, message, displayname, jobname, real_name, M.voice_name,
					  signal.transmission_method, signal.data["compression"], transmit_levels, connection.frequency,verb,speaking)

  /* ###### Intercoms and station-bounced radios ###### */

	var/filter_type = 2

	/* --- Intercoms can only broadcast to other intercoms, but bounced radios can broadcast to bounced radios and intercoms --- */
	if(istype(src, /obj/item/device/radio/intercom))
		filter_type = 1


	var/datum/signal/signal = new
	signal.transmission_method = 2


	/* --- Try to send a normal subspace broadcast first */

	signal.data = list(

		"mob" = M, // store a reference to the mob
		"mobtype" = M.type, 	// the mob's type
		"realname" = real_name, // the mob's real name
		"name" = displayname,	// the mob's display name
		"job" = jobname,		// the mob's job
		"key" = mobkey,			// the mob's key
		"vmessage" = pick(M.speak_emote), // the message to display if the voice wasn't understood
		"vname" = M.voice_name, // the name to display if the voice wasn't understood
		"vmask" = voicemask,	// 1 if the mob is using a voice gas mas

		"compression" = 0, // uncompressed radio signal
		"message" = message, // the actual sent message
		"connection" = connection, // the radio connection to use
		"radio" = src, // stores the radio used for transmission
		"slow" = 0,
		"traffic" = 0,
		"type" = 0,
		"server" = null,
		"reject" = 0,
		"level" = position.z,
		"language" = speaking,
		"verb" = verb,
		"speech_volume" = speech_volume
	)
	signal.frequency = connection.frequency // Quick frequency set

	for(var/obj/machinery/telecomms/receiver/R in telecomms_list)
		R.receive_signal(signal)

	sleep(rand(10,25)) // wait a little...

	if(signal.data["done"] && (position.z in signal.data["level"]))
		if(adhoc_fallback)
			to_chat(loc,"<span class='notice'>\The [src] pings as it reestablishes subspace communications.</span>")
			subspace_transmission = TRUE
		// we're done here.
		return 1

	// Oh my god; the comms are down or something because the signal hasn't been broadcasted yet in our level.
	// Send a mundane broadcast with limited targets:

	//THIS IS TEMPORARY. YEAH RIGHT. STATE OF SS13 DEVELOPMENT...
	if(!connection)	return 0	//~Carn

	update_transmit_levels()
	return Broadcast_Message(connection, M, voicemask, pick(M.speak_emote),
					  src, message, displayname, jobname, real_name, M.voice_name,
					  filter_type, signal.data["compression"], transmit_levels, connection.frequency,verb,speaking, speech_volume)


/obj/item/device/radio/hear_talk(mob/M as mob, msg, var/verb = "says", var/datum/language/speaking = null, speech_volume)

	if (broadcasting)
		if(get_dist(src, M) <= canhear_range)
			talk_into(M, msg,null,verb,speaking, speech_volume)


/*
/obj/item/device/radio/proc/accept_rad(obj/item/device/radio/R as obj, message)

	if ((R.frequency == frequency && message))
		return 1
	else if

	else
		return null
	return
*/


/obj/item/device/radio/proc/receive_range(freq, level)
	// check if this radio can receive on the given frequency, and if so,
	// what the range is in which mobs will hear the radio
	// returns: -1 if can't receive, range otherwise

	if (wires.IsIndexCut(WIRE_RECEIVE))
		return -1
	if(!listening)
		return -1
	if(!(0 in level))
		var/turf/position = get_turf(src)
		if(!position || !(position.z in level))
			return -1
	if(freq in ANTAG_FREQS)
		if(!(src.syndie))//Checks to see if it's allowed on that frequency, based on the encryption keys
			return -1
	if (!on)
		return -1
	if (!freq) //recieved on main frequency
		if (!listening)
			return -1
	else
		var/accept = (freq==frequency && listening)
		if (!accept)
			for (var/ch_name in channels)
				var/datum/radio_frequency/RF = secure_radio_connections[ch_name]
				if (RF && RF.frequency==freq && (channels[ch_name]&FREQ_LISTENING))
					accept = 1
					break
				#ifdef JANEDEBUG
				else if(!RF)
					log_debug("radio.receive_range(): Channel name found in channels no secure_radio_connection analog set.")
					log_debug("radio.receive_range(): ch_name: [ch_name]")
					log_debug("radio.receive_range(): freq: [freq]")
					log_debug("radio.receive_range(): level: [level]")
					log_debug("radio.receive_range(): Is ch_name listening?: [channels[ch_name]&FREQ_LISTENING]")
				#endif
		if (!accept)
			return -1
	return canhear_range

/obj/item/device/radio/proc/send_hear(freq, level)

	var/range = receive_range(freq, level)
	if(range > -1)
		return get_mobs_or_objects_in_view(canhear_range, src)


/obj/item/device/radio/examine(mob/user)
	. = ..()
	if ((in_range(src, user) || loc == user))
		if (b_stat)
			user.show_message(SPAN_NOTICE("\The [src] can be attached and modified!"))
		else
			user.show_message(SPAN_NOTICE("\The [src] can not be modified or attached!"))
	return

/obj/item/device/radio/attackby(obj/item/W as obj, mob/user as mob)
	..()
	user.set_machine(src)
	if(!(QUALITY_SCREW_DRIVING in W.tool_qualities))
		return
	b_stat = !( b_stat )
	if(!istype(src, /obj/item/device/radio/beacon))
		if (b_stat)
			user.show_message(SPAN_NOTICE("\The [src] can now be attached and modified!"))
		else
			user.show_message(SPAN_NOTICE("\The [src] can no longer be modified or attached!"))
		updateDialog()
			//Foreach goto(83)
		add_fingerprint(user)
		return
	else return

/obj/item/device/radio/emp_act(severity)
	broadcasting = 0
	listening = 0
	for (var/ch_name in channels)
		channels[ch_name] = 0
	..()

///////////////////////////////
//////////Borg Radios//////////
///////////////////////////////
//Giving borgs their own radio to have some more room to work with -Sieve

/obj/item/device/radio/borg
	var/mob/living/silicon/robot/myborg = null // Cyborg which owns this radio. Used for power checks
	var/obj/item/device/encryptionkey/keyslot = null//Borg radios can handle a single encryption key
	var/shut_up = 1
	icon = 'icons/obj/robot_component.dmi' // Cyborgs radio icons should look like the component.
	icon_state = "radio"
	canhear_range = 0
	subspace_transmission = 1
	subspace_switchable = TRUE
	loudspeaker_switchable = TRUE

/obj/item/device/radio/borg/Destroy()
	myborg = null
	return ..()

/obj/item/device/radio/borg/list_channels(var/mob/user)
	return list_secure_channels(user)

/obj/item/device/radio/borg/talk_into(mob/living/M, message, channel, var/verb = "says", var/datum/language/speaking = null, var/speech_volume)
	. = ..()
	if (isrobot(src.loc))
		var/mob/living/silicon/robot/R = src.loc
		var/datum/robot_component/C = R.components["radio"]
		R.cell_use_power(C.active_usage)

/obj/item/device/radio/borg/attackby(obj/item/W as obj, mob/user as mob)
//	..()
	user.set_machine(src)
	if (!( istype(W, /obj/item/tool/screwdriver) || (istype(W, /obj/item/device/encryptionkey/ ))))
		return

	if(istype(W, /obj/item/tool/screwdriver))
		if(keyslot)


			for(var/ch_name in channels)
				SSradio.remove_object(src, radiochannels[ch_name])
				secure_radio_connections[ch_name] = null


			if(keyslot)
				var/turf/T = get_turf(user)
				if(T)
					keyslot.loc = T
					keyslot = null

			to_chat(user, "You pop out the encryption key in the radio!")

		else
			to_chat(user, "This radio doesn't have any encryption keys!")

	if(istype(W, /obj/item/device/encryptionkey/))
		if(keyslot)
			to_chat(user, "The radio can't hold another key!")
			return

		if(!keyslot)
			user.drop_item()
			W.loc = src
			keyslot = W

	recalculateChannels()

	return

/obj/item/device/radio/proc/recalculateChannels()
	return

/obj/item/device/radio/borg/recalculateChannels()
	src.channels = list()
	src.syndie = 0

	var/mob/living/silicon/robot/D = src.loc
	if(D.module)
		for(var/ch_name in D.module.channels)
			if(ch_name in src.channels)
				continue
			src.channels += ch_name
			src.channels[ch_name] += D.module.channels[ch_name]
	if(keyslot)
		for(var/ch_name in keyslot.channels)
			if(ch_name in src.channels)
				continue
			src.channels += ch_name
			src.channels[ch_name] += keyslot.channels[ch_name]

		if(keyslot.syndie)
			src.syndie = 1

	for (var/ch_name in src.channels)
		secure_radio_connections[ch_name] = SSradio.add_object(src, radiochannels[ch_name],  RADIO_CHAT)

	return

/obj/item/device/radio/borg/interact(mob/user as mob)
	if(!on)
		return

	. = ..()

/obj/item/device/radio/proc/config(op)
	for (var/ch_name in channels)
		SSradio.remove_object(src, radiochannels[ch_name])
	secure_radio_connections = new
	channels = op
	for (var/ch_name in op)
		secure_radio_connections[ch_name] = SSradio.add_object(src, radiochannels[ch_name],  RADIO_CHAT)
	return

/obj/item/device/radio/off
	listening = 0

/obj/item/device/radio/phone
	broadcasting = 0
	icon = 'icons/obj/items.dmi'
	icon_state = "red_phone"
	listening = 1
	name = "phone"

/obj/item/device/radio/phone/medbay
	frequency = MED_I_FREQ

/obj/item/device/radio/phone/medbay/New()
	..()
	internal_channels = default_medbay_channels.Copy()

/obj/item/device/radio/random_radio
	name = "Random wave radio"
	desc = "A radio that has a small chance to pick up random messages on any frequency, even securely encrypted ones. Rumor has it that this odd machine sometimes spits out random useful information, \
	especially if its been repaired with the right equipment."
	icon = 'icons/obj/device.dmi'
	icon_state = "random_radio"
	item_state = "random_radio"
	slot_flags = FALSE
	canhear_range = 4
	var/random_hear = 20
	channels = list("Command" = 1, "Blackshield" = 1, "Marshal" = 1, "Engineering" = 1, "Church" = 1, "Science" = 1, "Medical" = 1, "Supply" = 1, "Service" = 1, "AI Private" = 1, "Prospector" = 1)
	price_tag = 20000
	origin_tech = list(TECH_DATA = 7, TECH_ENGINEERING = 7, TECH_ILLEGAL = 7)
	var/list/obj/item/oddity/used_oddity = list()
	var/last_produce = 0
	var/cooldown = 40 MINUTES
	var/max_cooldown = 40 MINUTES
	var/min_cooldown = 15 MINUTES
	w_class = ITEM_SIZE_BULKY

/obj/item/device/radio/random_radio/New()
	..()
	GLOB.all_faction_items[src] = GLOB.department_guild
	START_PROCESSING(SSobj, src)

/obj/item/device/radio/random_radio/Destroy()
	STOP_PROCESSING(SSobj, src)
	for(var/mob/living/carbon/human/H in viewers(get_turf(src)))
		LEGACY_SEND_SIGNAL(H, COMSIG_OBJ_FACTION_ITEM_DESTROY, src)
	GLOB.all_faction_items -= src
	GLOB.guild_faction_item_loss++
	. = ..()

/obj/item/device/radio/random_radio/receive_range(freq, level)

	if (wires.IsIndexCut(WIRE_RECEIVE))
		return -1
	if(!listening)
		return -1
	if(!(0 in level))
		var/turf/position = get_turf(src)
		if(!position || !(position.z in level))
			return -1
	if(freq in ANTAG_FREQS)
		if(!(src.syndie))//Checks to see if it's allowed on that frequency, based on the encryption keys
			return -1
	if (!on)
		return -1

	if(random_hear)
		if(prob(random_hear))
			return canhear_range

/obj/item/device/radio/random_radio/emag_act(mob/user)
	if(!syndie)
		syndie = TRUE
		channels |= list("Mercenary" = 1)
		playsound(loc, "sparks", 75, 1, -1)
		to_chat(user, SPAN_NOTICE("You use the cryptographic sequencer on the [name]."))
	else
		to_chat(user, SPAN_NOTICE("The [name] has already been emagged."))
		return NO_EMAG_ACT

/obj/item/device/radio/random_radio/attackby(obj/item/W, mob/user, params)
	if(nt_sword_attack(W, user))
		return FALSE
	user.set_machine(src)

	if(istype(W, /obj/item/oddity))
		var/obj/item/oddity/D = W
		if(D.oddity_stats)
			var/usefull = FALSE

			if(random_hear >= 100)
				to_chat(user, SPAN_WARNING("The [src] is in perfect condition."))
				return

			to_chat(user, SPAN_NOTICE("You begin repairing [src] using [D]."))

			if(!do_after(user, 20 SECONDS, src))
				to_chat(user, SPAN_WARNING("You've stopped repairing [src]."))
				return

			if(D in used_oddity)
				to_chat(user, SPAN_WARNING("You've already used [D] to repair [src]!"))
				return

			for(var/stat in D.oddity_stats)
				if(stat == STAT_MEC)
					var/increase = D.oddity_stats[stat] * 3
					random_hear += increase
					if(random_hear > 100)
						random_hear = 100
					cooldown -= (D.oddity_stats[stat]) MINUTES
					if(cooldown < min_cooldown)
						cooldown = min_cooldown
					to_chat(user, SPAN_NOTICE("You make use of [D], and repaired [src] by [increase]%."))
					usefull = TRUE
					used_oddity += D
					return


			if(!usefull)
				to_chat(user, SPAN_WARNING("You cannot find any use of [D], maybe you need something related to mechanics to repair this?"))
		else
			to_chat(user, SPAN_WARNING("The [D] is useless here. Try to find another one."))
