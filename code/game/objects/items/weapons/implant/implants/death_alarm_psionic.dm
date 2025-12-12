/obj/item/implant/death_alarm/psionic
	name = "psionic death alarm implant"
	desc = "An alarm which monitors host vital signs and transmits a radio message upon death. This variant is crafted from non-metallic components, making it compatible with psionic users."
	icon_state = "implant_psideathalarm"
	is_metal = FALSE // This makes it not auto-eject from psions

	overlay_icon = "psideathalarm" // Using tracking overlay instead

/obj/item/implant/death_alarm/psionic/get_data()
	var/data = {"
		<b>Implant Specifications:</b><BR>
		<b>Name:</b> Vesalius-Andra \"Mind Link\" Class Psionic Lifesign Sensor<BR>
		<b>Life:</b> Activates upon death.<BR>
		<b>Important Notes:</b> Alerts crew to crewmember death. Psion-compatible design.<BR>
		<HR>
		<b>Implant Details:</b><BR>
		<b>Function:</b> Contains a compact radio signaler that triggers when the host's lifesigns cease.<BR>
		<b>Special Features:</b> Crafted from bio-compatible materials that don't interfere with psionic organs.<BR>
		<b>Integrity:</b> Implant will occasionally be degraded by the body's immune system and thus will occasionally malfunction."}
	return data

/obj/item/implantcase/death_alarm/psionic
	name = "glass case - 'psionic death alarm'"
	desc = "A case containing a psionic-compatible death alarm implant."
	implant = /obj/item/implant/death_alarm/psionic

/obj/item/implanter/death_alarm/psionic
	name = "implanter (psionic death alarm)"
	implant = /obj/item/implant/death_alarm/psionic
