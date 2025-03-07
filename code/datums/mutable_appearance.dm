// Mutable appearances are an inbuilt byond datastructure. Read the documentation on them by hitting F1 in DM.
// Basically use them instead of images for over-lays/underlays and when changing an object's appearance if you're doing so with any regularity.
// Unless you need the overlay/underlay to have a different direction than the base object. Then you have to use an image due to a bug.

// Mutable appearances are children of images, just so you know.

/mutable_appearance/New()
	..()
	plane = FLOAT_PLANE // No clue why this is 0 by default yet images are on FLOAT_PLANE
						// And yes this does have to be in the constructor, BYOND ignores it if you set it as a normal var

// Helper similar to image()
/proc/mutable_appearance(icon, icon_state = "", layer = FLOAT_LAYER, plane = FLOAT_PLANE, alpha = 255, appearance_flags = NONE)
	var/mutable_appearance/MA = new()
	MA.icon = icon
	MA.icon_state = icon_state
	MA.layer = layer
	MA.plane = plane
	MA.alpha = alpha
	MA.appearance_flags |= appearance_flags
	return MA

/mutable_appearance/clean
/mutable_appearance/clean/New()
	. = ..()
	alpha = 255
	opacity = 1
	transform = null

//half-hearted port of TG's emissive thing. It is NOT the same thing, TG has a system of masks to colorize and block out emissives where they would be blocked. This just makes mutable_appearances render above the lighting plane in a convenient way.
/proc/emissive_appearance_copy(mutable_appearance/to_use, atom/offset_spokesman, appearance_flags = (RESET_COLOR|KEEP_APART))
	var/mutable_appearance/appearance = mutable_appearance(to_use.icon, to_use.icon_state, to_use.layer, ABOVE_LIGHTING_PLANE)
	appearance.color = to_use.color		//This would originally have been glob.emissive color, to turn it pure white and 100% alpha for... whatever TG uses it for. But meh.
	appearance.pixel_x = to_use.pixel_x
	appearance.pixel_y = to_use.pixel_y
	return appearance
