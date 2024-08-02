/obj/item/device/radio/intercom
	name = "colony intercom (General)"
	desc = "Talk through this, and everyone on the colony will hear you."
	icon_state = "intercom"
	anchored = TRUE
	spawn_tags = null
	slot_flags = null
	w_class = ITEM_SIZE_BULKY
	canhear_range = 2
	flags = CONDUCT | NOBLOODY
	var/number = 0
	var/area/linked_area

	var/global/list/channel_indicators = list(
		num2text(PUB_FREQ) = "intercom-channel-common",
		num2text(AI_FREQ) = "intercom-channel-ai",
		num2text(SEC_FREQ) = "intercom-channel-sec",
		num2text(SEC_I_FREQ) = "intercom-channel-sec-i",
		//num2text(BLS_FREQ) = "intercom-channel-sec-bs", //nope
		num2text(MED_FREQ) = "intercom-channel-med",
		num2text(MED_I_FREQ) = "intercom-channel-med-i",
		num2text(PT_BT_FREQ) = "intercom-channel-tag-b",
		num2text(PT_RT_FREQ) = "intercom-channel-tag-r",
		num2text(PT_YT_FREQ) = "intercom-channel-tag-y",
		num2text(PT_GT_FREQ) = "intercom-channel-tag-g",

		num2text(SYND_FREQ) = "intercom-channel-common"
	)

/obj/item/device/radio/intercom/custom
	name = "colony intercom (Custom)"
	broadcasting = 0
	listening = 0

/obj/item/device/radio/intercom/interrogation
	name = "colony intercom (Interrogation)"
	frequency  = 1449

/obj/item/device/radio/intercom/private
	name = "colony intercom (Private)"
	frequency = AI_FREQ

/obj/item/device/radio/intercom/department
	canhear_range = 5
	broadcasting = 0
	listening = 1

/obj/item/device/radio/intercom/department/medbay
	name = "colony intercom (Medbay)"
	frequency = MED_I_FREQ

/obj/item/device/radio/intercom/department/security
	name = "colony intercom (Security)"
	frequency = SEC_I_FREQ

/obj/item/device/radio/intercom/New()
	..()
	loop_area_check()

/obj/item/device/radio/intercom/Initialize()
	. = ..()
	update_icon()

/obj/item/device/radio/intercom/department/medbay/New()
	..()
	internal_channels = default_medbay_channels.Copy()

/obj/item/device/radio/intercom/department/security/New()
	..()
	internal_channels = list(
		num2text(PUB_FREQ) = list(),
		num2text(SEC_I_FREQ) = list(access_security)
	)


/obj/item/device/radio/intercom/syndicate
	name = "illicit intercom"
	desc = "Talk through this. Evilly"
	frequency = SYND_FREQ
	subspace_transmission = 1
	syndie = 1

/obj/item/device/radio/intercom/syndicate/New()
	..()
	internal_channels[num2text(SYND_FREQ)] = list(access_syndicate)

/obj/item/device/radio/intercom/attack_ai(mob/user as mob)
	src.add_fingerprint(user)
	spawn (0)
		attack_self(user)

/obj/item/device/radio/intercom/attack_hand(mob/user as mob)
	src.add_fingerprint(user)
	spawn (0)
		attack_self(user)

/obj/item/device/radio/intercom/receive_range(freq, level)
	if (!on)
		return -1
	if(!(0 in level))
		var/turf/position = get_turf(src)
		if(isnull(position) || !(position.z in level))
			return -1
	if (!src.listening)
		return -1
	if(freq in ANTAG_FREQS)
		if(!(src.syndie))
			return -1//Prevents broadcast of messages over devices lacking the encryption

	return canhear_range

/obj/item/device/radio/intercom/proc/change_status()
	on = linked_area.powered(STATIC_EQUIP)
	update_icon()

/obj/item/device/radio/intercom/proc/loop_area_check()
	var/area/target_area = get_area(src)
	if(!target_area?.apc)
		addtimer(CALLBACK(src, PROC_REF(loop_area_check)), 30 SECONDS, TIMER_STOPPABLE) // We don't proces if there is no APC , no point in doing so is there ?
		return FALSE
	linked_area = target_area
	RegisterSignal(target_area, COMSIG_AREA_APC_DELETED, PROC_REF(on_apc_removal))
	RegisterSignal(target_area, COMSIG_AREA_APC_POWER_CHANGE, PROC_REF(change_status))

/obj/item/device/radio/intercom/proc/on_apc_removal()
	UnregisterSignal(linked_area , COMSIG_AREA_APC_DELETED)
	UnregisterSignal(linked_area, COMSIG_AREA_APC_POWER_CHANGE)
	linked_area = null
	on = FALSE
	update_icon()
	addtimer(CALLBACK(src, PROC_REF(loop_area_check)), 30 SECONDS)

/obj/item/device/radio/intercom/update_icon()
	cut_overlays()
	if(!on) return
	var/tx_indicator = "intercom-stat-[(listening || frequency == SYND_FREQ)? "r" : ""][(broadcasting && frequency != SYND_FREQ) ? "t" : ""]x"
	var/channel_indicator = channel_indicators[num2text(frequency)] || "intercom-channel-default"
	add_overlay(tx_indicator)
	add_overlay(channel_indicator)

/obj/item/device/radio/intercom/set_frequency()
	. = ..()
	update_icon()

/obj/item/device/radio/intercom/ToggleBroadcast()
	. = ..()
	update_icon()

/obj/item/device/radio/intercom/ToggleReception()
	. = ..()
	update_icon()

/obj/item/device/radio/intercom/emp_act(severity)
	. = ..()
	update_icon()

/obj/item/device/radio/intercom/broadcasting
	broadcasting = 1

/obj/item/device/radio/intercom/locked
    var/locked_frequency

/obj/item/device/radio/intercom/locked/set_frequency(var/frequency)
	if(frequency == locked_frequency)
		..(locked_frequency)

/obj/item/device/radio/intercom/locked/list_channels()
	return ""

/obj/item/device/radio/intercom/locked/ai_private
	name = "\improper AI intercom"
	frequency = AI_FREQ
	broadcasting = 1
	listening = 1

/obj/item/device/radio/intercom/locked/confessional
	name = "confessional intercom"
	frequency = 1480
