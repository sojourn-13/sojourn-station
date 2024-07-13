/obj/effect/mineral
	name = "mineral vein"
	icon = 'icons/obj/mining.dmi'
	desc = "Shiny."
	mouse_opacity = 0
	density = FALSE
	anchored = TRUE
	layer = FLASH_LAYER
	var/ore_key
	var/image/scanner_image

/obj/effect/mineral/New(loc, ore/M)
	. = ..(loc)
	name = "[M.display_name] deposit"
	ore_key = M.name
	icon_state = "rock_[ore_key]"
	var/turf/T = get_turf(src)
	var/mutable_appearance/app = mutable_appearance('icons/obj/mining.dmi', "rock_[ore_key]")
	app.dir = SOUTH
	T.add_overlay(app)
	if(T.color)
		color = T.color

/obj/effect/mineral/proc/get_scan_overlay()
	if(!scanner_image)
		var/ore/O = ore_data[ore_key]
		if(O)
			scanner_image = image(icon, loc = get_turf(src), icon_state = (O.scan_icon ? O.scan_icon : icon_state))
		else
			to_chat(world, "No ore data for [src]!")
	return scanner_image
