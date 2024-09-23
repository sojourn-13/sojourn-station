/// Helper macro for creating a matrix at the given offsets.
/// Works at compile time.
#define TRANSLATE_MATRIX(offset_x, offset_y) matrix(1, 0, (offset_x), 0, 1, (offset_y))
/// The color matrix of an image which colors haven't been altered. Does nothing.
#define COLOR_MATRIX_IDENTITY list(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1, 0,0,0,0)
/// Color inversion
#define COLOR_MATRIX_INVERT list(-1,0,0,0, 0,-1,0,0, 0,0,-1,0, 0,0,0,1, 1,1,1,0)
///Sepiatone
#define COLOR_MATRIX_SEPIATONE list(0.393,0.349,0.272,0, 0.769,0.686,0.534,0, 0.189,0.168,0.131,0, 0,0,0,1, 0,0,0,0)
///Grayscale
#define COLOR_MATRIX_GRAYSCALE list(0.33,0.33,0.33,0, 0.59,0.59,0.59,0, 0.11,0.11,0.11,0, 0,0,0,1, 0,0,0,0)
///Polaroid colors
#define COLOR_MATRIX_POLAROID list(1.438,-0.062,-0.062,0, -0.122,1.378,-0.122,0, -0.016,-0.016,1.483,0, 0,0,0,1, 0,0,0,0)
/// Converts reds to blue, green to red and blue to green.
#define COLOR_MATRIX_BRG list(0,0,1,0, 0,1,0,0, 1,0,0,0, 0,0,0,1, 0,0,0,0)
/// Black & White
#define COLOR_MATRIX_BLACK_WHITE list(1.5,1.5,1.5,0, 1.5,1.5,1.5,0, 1.5,1.5,1.5,0, 0,0,0,1, -1,-1,-1,0)
/**
 * Adds/subtracts overall lightness
 * 0 is identity, 1 makes everything white, -1 makes everything black
 */
#define COLOR_MATRIX_LIGHTNESS(power) list(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1, power,power,power,0)
/**
 * Changes distance colors have from rgb(127,127,127) grey
 * 1 is identity. 0 makes everything grey >1 blows out colors and greys
 */
#define COLOR_MATRIX_CONTRAST(val) list(val,0,0,0, 0,val,0,0, 0,0,val,0, 0,0,0,1, (1-val)*0.5,(1-val)*0.5,(1-val)*0.5,0)

/client/proc/edit_client_colour_directly(txt)
	color = txt

/client/proc/client_colour_datum_shunt(datum/client_colour/CC)
	if(istype(CC, /datum/client_colour))
		color = CC.colour
	else
		return "ERROR not a marked client colour datum, use /obj/item/datum_holder_for_client_colours and market the datum you want to use."

/client/verb/change_filter()
	set name = "Set Client Filter"
	set category = "OOC"
	set desc = "Change your view filter from a set of pre-defined types"

	var/list/options = list()
	options["RESET/CLEAR"] = null
	options["Hallow Helmet"] = list(0.75,0.13,0.13,0, 0.13,0.7,0.13,0, 0.13,0.13,0.75,0, -0.06,-0.09,-0.08,1, 0,0,0,0)
	options["Monochrome"] = COLOR_MATRIX_GRAYSCALE
	options["Sepiatone"] = COLOR_MATRIX_SEPIATONE
	options["Dark Sepiatone"] = list(0.393,0.349,0.272,0, 0.769,0.686,0.534,0, 0.189,0.168,0.131,0, -0.06,-0.09,-0.08,1, 0,0,0,0)
	options["BRG"] = COLOR_MATRIX_BRG
	options["Cyan"] = "#00FFFF"
	options["Light Gray"] = "#cccccc"
	options["Green"] = "#aaffaa"
	options["Light Green"] = "##ccffcc"
	options["Blue"] = "#aaaaff"
	options["Light Blue"] = "#ccccff"
	options["Yellow"] = "#ffff66"
	options["Light Yellow"] = "#ffffaa"
	options["Red"] = "#ffaaaa"
	options["Light Red"] = "#ffcccc"
	options["Dark Red"] = "#bb5555"
	options["Orange"] = "#ffbb99"
	options["Light Orange"] = "#ffddaa"
	options["Purple"] = "#ff99ff"
	options["Light Purple"] = "#ffccff"
	var/choice = input(usr,"Pick what filter you want","Filter Picker") as null|anything in options

	if(src && choice)
		color = options[choice]
		return 1


//Stuff for admin events or debugging
/obj/item/datum_holder_for_client_colours
	var/list/client_colour_filters = list()

/obj/item/datum_holder_for_client_colours/New()
	..()
	for(var/filter in typesof(/datum/client_colour))
		var/datum/client_colour/F = new filter
		client_colour_filters[F.name] = F

/datum/client_colour
	var/name = "Colour Filter base"
	var/colour = ""

/datum/client_colour/custom
	name = "Colour Filter Custom (for admin/debug use)"

/datum/client_colour/custom_two
	name = "Colour Filter Custom 2 (for admin/debug use)"

///A client colour that makes the screen look a bit more grungy, halloweenesque even.
/datum/client_colour/halloween_helmet
	name = "Halloween Helmet"
	colour = list(0.75,0.13,0.13,0, 0.13,0.7,0.13,0, 0.13,0.13,0.75,0, -0.06,-0.09,-0.08,1, 0,0,0,0)

/datum/client_colour/flash_hood
	name = "Flash Hood"
	colour = COLOR_MATRIX_POLAROID

/datum/client_colour/glass_colour/nightmare
	name = "Nightmare"
	colour = list(255,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,1, -130,0,0,0) //every color is either red or black

/datum/client_colour/malfunction
	name = "Malfunction"
	colour = list(/*R*/ 0,0,0,0, /*G*/ 0,175,0,0, /*B*/ 0,0,0,0, /*A*/ 0,0,0,1, /*C*/0,-130,0,0) // Matrix colors

/datum/client_colour/monochrome
	name = "Monochrome"
	colour = COLOR_MATRIX_GRAYSCALE

/datum/client_colour/bloodlust
	name = "Bloodlust"
	colour = list(0,0,0,0,0,0,0,0,0,1,0,0) //pure red.

/datum/client_colour/psyker
	name = "Psyker"
	colour = list(0.8,0,0,0, 0,0,0,0, 0,0,1,0, 0,0,0,1, 0,0,0,0)

/datum/client_colour/manual_heart_blood
	name = "Manual Heart Blood"
	colour = COLOR_RED

/datum/client_colour/identity
	name = "Identity"
	colour = COLOR_MATRIX_IDENTITY

/datum/client_colour/inverted
	name = "inverted"
	colour = COLOR_MATRIX_INVERT

/datum/client_colour/sepiatone
	name = "Sepiatone"
	colour = COLOR_MATRIX_SEPIATONE

/datum/client_colour/polaroid
	name = "Polaroid"
	colour = COLOR_MATRIX_POLAROID

/datum/client_colour/brg
	name = "BRG"
	colour = COLOR_MATRIX_BRG

/datum/client_colour/chess
	name = "Chess"
	colour = COLOR_MATRIX_BLACK_WHITE
