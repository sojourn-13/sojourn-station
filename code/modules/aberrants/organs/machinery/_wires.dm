//#define CAT_NORMAL 1
//#define CAT_HIDDEN 2
//#define CAT_COIN   4

var/const/VENDING_INT_WIRE_THROW = 1
var/const/VENDING_INT_WIRE_ELECTRIFY = 2
var/const/VENDING_INT_WIRE_IDSCAN = 4
var/const/VENDING_INT_WIRE_SIGNAL = 8
var/const/VENDING_INT_WIRE_CONTRABAND = 16
var/const/VENDING_INT_WIRE_GROUND = 32
var/const/VENDING_INT_WIRE_POWER = 64

/*
	The Game (you just lost it):
		Turn the pink light blue and make the suspicious light blink. Both must be true in order to unlock the hidden items.

	Tip:
		The power wire makes sparks when cut, but not when pulsed.
		If you want to reset the hacking game, cut the ground and power, then mend them.

	Robust Tip:
		Cut wires starting from the top until you cut a wire that turns the pink light blue. That is your signal wire.
			If the pink light doesn't change, mend all wires and start from the bottom instead.

	Robuster Tip:
		Level Mec

	Solution:
		Cut power/ground
		Cut signal (pink light turns blue)
		Mend power/ground
		Pulse suspicious (suspicious light blinks)
		Mend signal
*/

/datum/wires/vending/intermediate
	wire_count = 7
	var/is_powered = TRUE
	var/is_signal_securely_cut = FALSE
	var/is_contraband_securely_pulsed = FALSE
	descriptions = list(
		new /datum/wire_description(VENDING_INT_WIRE_THROW, "Safety"),
		new /datum/wire_description(VENDING_INT_WIRE_ELECTRIFY, "Shock"),
		new /datum/wire_description(VENDING_INT_WIRE_IDSCAN, "Access"),
		new /datum/wire_description(VENDING_INT_WIRE_SIGNAL, "Signal"),
		new /datum/wire_description(VENDING_INT_WIRE_CONTRABAND, "Suspicious"),
		new /datum/wire_description(VENDING_INT_WIRE_GROUND, "Ground"),
		new /datum/wire_description(VENDING_INT_WIRE_POWER, "Power")
	)

/datum/wires/vending/intermediate/GetInteractWindow(mob/living/user)
	. += ..(user)
	. += "The [is_signal_securely_cut ? "blue" : "pink"] light is on.<BR>"
	. += "The suspicious light is [is_contraband_securely_pulsed ? "blinking" : "on"].<BR>"

/datum/wires/vending/intermediate/UpdatePulsed(var/index)
	if(is_powered)
		var/obj/machinery/vending/V = holder
		switch(index)
			if(VENDING_INT_WIRE_THROW)
				V.shoot_inventory = !V.shoot_inventory
			if(VENDING_INT_WIRE_ELECTRIFY)
				V.seconds_electrified = 30
			if(VENDING_INT_WIRE_IDSCAN)
				V.scan_id = !V.scan_id
			if(VENDING_INT_WIRE_CONTRABAND)
				if(is_signal_securely_cut)
					is_contraband_securely_pulsed = TRUE

		// Pulse the wrong wire and you'll have to properly cut the signal wire again
		if(!is_contraband_securely_pulsed)
			is_signal_securely_cut = FALSE

/datum/wires/vending/intermediate/UpdateCut(var/index, var/mended)
	var/obj/machinery/vending/V = holder
	switch(index)
		if(VENDING_INT_WIRE_THROW)
			if(is_powered)
				V.shoot_inventory = !mended
		if(VENDING_INT_WIRE_ELECTRIFY)
			if(is_powered)
				V.seconds_electrified = mended ? 0 : -1
		if(VENDING_INT_WIRE_IDSCAN)
			if(is_powered)
				V.scan_id = 1
		if(VENDING_INT_WIRE_SIGNAL)
			if(mended && is_powered && is_contraband_securely_pulsed)
				V.categories ^= CAT_HIDDEN
			else if(!mended)
				is_signal_securely_cut = is_powered ? FALSE : TRUE
		if(VENDING_INT_WIRE_CONTRABAND)
			if(is_contraband_securely_pulsed)
				is_contraband_securely_pulsed = FALSE
		if(VENDING_INT_WIRE_POWER)
			V.seconds_electrified = mended ? 0 : 30

	is_powered = IsIndexCut(VENDING_INT_WIRE_POWER | VENDING_INT_WIRE_GROUND) ? FALSE : TRUE
