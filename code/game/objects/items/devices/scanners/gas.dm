
/obj/item/device/scanner/gas
	name = "analyzer"
	desc = "A hand-held environmental scanner which reports current gas levels."
	icon_state = "atmos"
	item_state = "analyzer"

	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1)
	preloaded_reagents = list("mercury" = 15, "lithium" = 5, "plasticide" = 9)
	origin_tech = list(TECH_MAGNET = 1, TECH_ENGINEERING = 1)

	charge_per_use = 5

/obj/item/device/scanner/gas/is_valid_scan_target(atom/O)
	if(!usr.stat_check(STAT_MEC, STAT_LEVEL_BASIC))
		to_chat(usr, SPAN_WARNING("Your understanding of the mechanical isn't enough to operate this!"))
		return

	return istype(O)

/obj/item/device/scanner/gas/scan(atom/A, mob/user)
	var/air_contents = A.return_air()
	flick("atmos2", src)
	if(!air_contents)
		to_chat(user, SPAN_WARNING("Your [src] flashes a red light as it fails to analyze \the [A]."))
		return
	scan_data = analyze_gases(A, user)
	scan_data = jointext(scan_data, "<br>")
	user.show_message(SPAN_NOTICE(scan_data))
