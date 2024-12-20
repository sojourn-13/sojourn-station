/obj/machinery/psionic_harvester
	name = "psionic harvester"
	desc = "A Soteria built processing machine capable of breaking down an artifact and compacting it's anomalous psionic energies."
	icon = 'icons/obj/xenoarchaeology.dmi'
	icon_state = "psionic_harvester"
	anchored = 1
	density = 1
	idle_power_usage = 20
	active_power_usage = 300
	use_power = IDLE_POWER_USE
	var/obj/machinery/artifact/current_artifact
	var/obj/machinery/artifact_scanpad/owned_scanner = null
	var/processing = FALSE
	var/progress = 0

/obj/machinery/psionic_harvester/attack_hand(var/mob/user as mob)
	current_artifact = check_artifacts()
	if(current_artifact && !processing)
		current_artifact.forceMove(src) // Move the artifact into the machine. the '?.' prevent runtimes
		ping("Artifact detected. Processing...")
		processing = TRUE
		progress = initial(progress) // Reset the progress on the artifact

// Check around the machine for viable artifacts and return the first viable one.
/obj/machinery/psionic_harvester/proc/check_artifacts()
	if(current_artifact) // Do we already have an artifact inside?
		return current_artifact

	for(var/obj/machinery/artifact/A in orange(1, src)) // Check the 8 tiles around us.
		if(A.psi_power) // Does the artifact hold a psionic power?
			return A

	// If we are here, no viable artifact was found.
	ping("No viable artifact found.")

/obj/machinery/psionic_harvester/Process()
	if(processing)
		progress += rand(1, 5)
		if(!current_artifact) // If we are processing without an artifact.
			processing = FALSE
			ping("No Artifact Detected")

	if(progress >= 100 && current_artifact) // We are finished processing the artifact
		ping("Artifact Processing finished.")
		processing = FALSE
		new current_artifact.psi_power(get_turf(src)) // Create the catalyst
		qdel(current_artifact) // Delete the artifact
		current_artifact = null // Just in case the delete went wrong
		progress = initial(progress)

	update_icon()

/obj/machinery/psionic_harvester/update_icon()
	icon_state = "[initial(icon_state)][processing ? "_on" : ""]"
