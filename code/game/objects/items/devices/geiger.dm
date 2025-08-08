//Rewritten version of TG's geiger counter
//I opted to show exact radiation levels
// Sound obtained then edited from here : https://freesound.org/people/leonelmail/sounds/328381/ -- Under creative commons 0

#define SOUND_ID "geiger_sound"

/obj/item/device/geiger
	name = "geiger counter"
	desc = "A handheld device used for detecting and measuring radiation in an area."
	icon = 'icons/obj/geiger.dmi'
	icon_state = "geiger_off"
	item_state = "multitool"
	w_class = ITEM_SIZE_SMALL
	var/rad_level = 0
	action_button_name = "Toggle geiger counter"
	var/scanning = 0
	var/radiation_count = 0
	var/datum/sound_token/sound_token
	var/geiger_volume = -1
	var/new_volume = 0

/obj/item/device/geiger/proc/update_sound(var/playing, new_volume, geiger_volume)
	if(playing && !sound_token)
		sound_token = GLOB.sound_player.play_looping(src, SOUND_ID, "sound/items/geiger.ogg", new_volume, range = 3, falloff = 1, prefer_mute = TRUE)
	else if(new_volume != geiger_volume && sound_token)
		sound_token.set_volume(new_volume)
	else if(!playing && sound_token)
		sound_token.stop()
		QDEL_NULL(sound_token)

/obj/item/device/geiger/Destroy()
	. = ..()
	STOP_PROCESSING(SSobj, src)
	QDEL_NULL(sound_token)

/obj/item/device/geiger/Initialize()
	..()
	AddRadDetector(src)

/obj/item/device/geiger/Process()
	if(!scanning)
		return
	// Use the existing rad_level which gets updated by the radiation subsystem
	// Reset geiger_volume to ensure sound updates correctly
	geiger_volume = -1
	update_icon()

/obj/item/device/geiger/examine(mob/user)
	..()
	to_chat(user, SPAN_NOTICE("[src] [rad_level > 0 ? "detect [rad_level] rads" : "doesn't detect any rads"]!"))

/obj/item/device/geiger/attack_self(mob/user)
	scanning = !scanning
	if(scanning)
		to_chat(user, SPAN_NOTICE("You turn on \the [src]."))
		START_PROCESSING(SSobj, src)
	else
		to_chat(user, SPAN_NOTICE("You turn off \the [src]."))
		STOP_PROCESSING(SSobj, src)
	update_icon()
	add_fingerprint(user)

/obj/item/device/geiger/proc/reset_rads()
	rad_level = 0
	update_icon()

/obj/item/device/geiger/proc/add_rads(var/amount)
	rad_level += amount
	update_icon()

// TODO : Have the counter emit a noise & change icon when irradiated.
/obj/item/device/geiger/update_icon()
	..()
	if(!scanning)
		icon_state = "geiger_off"
		update_sound(FALSE, 0, geiger_volume)
		return

	// Determine radiation level and appropriate sound volume
	switch(rad_level)
		if(0 to 10)
			icon_state = "geiger_on_1"
			new_volume = 0
		if(11 to 25)
			icon_state = "geiger_on_2"
			new_volume = 16
		if(26 to 50)
			icon_state = "geiger_on_3"
			new_volume = 32
		if(51 to 75)
			icon_state = "geiger_on_4"
			new_volume = 64
		if(76 to INFINITY)
			icon_state = "geiger_on_5"
			new_volume = 100

	// Update sound based on volume changes
	update_sound(scanning, new_volume, geiger_volume)
	geiger_volume = new_volume
