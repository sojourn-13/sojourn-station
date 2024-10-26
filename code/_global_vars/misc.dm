GLOBAL_LIST_EMPTY(all_observable_events)

//see proc/get_average_color()
GLOBAL_LIST_EMPTY(average_icon_color)

//see getFlatTypeIcon()
GLOBAL_LIST_EMPTY(initialTypeIcon)

GLOBAL_DATUM(lobbyScreen, /datum/lobbyscreen)

// WORLD TOPIC CACHING //
GLOBAL_VAR(topic_status_lastcache)
GLOBAL_LIST(topic_status_cache)

GLOBAL_LIST_INIT(custom_kits, list(
	"Example Grayson bag of holding" = list(
		/obj/item/storage/backpack/holding,
		/obj/item/clothing/under/os_jumpsuit,
		/obj/item/clothing/suit/greatcoat/os,
		/obj/item/clothing/head/os_cap,
		/obj/item/tank/onestar_regenerator,
		/obj/item/clothing/mask/gas,
		/obj/item/clothing/shoes/jackboots,
		/obj/item/clothing/glasses/powered/thermal/onestar,
		/obj/item/gun/projectile/automatic/scaffold,
		/obj/item/ammo_magazine/ammobox/light_rifle_257,
		/obj/item/ammo_magazine/ammobox/light_rifle_257,
		/obj/item/ammo_magazine/ammobox/light_rifle_257)))

GLOBAL_VAR(log_directory)
// LOGGING  MOVE ME //
GLOBAL_PROTECT(log_directory)

// TGUI MOVE ME //
GLOBAL_DATUM(changelog_tgui, /datum/changelog)

// TGS //
GLOBAL_REAL_VAR(client_count)

// Strings //
GLOBAL_VAR_INIT(TAB, "&nbsp;&nbsp;&nbsp;&nbsp;")
GLOBAL_LIST_INIT(symbols_unicode_keys, list(
	"�" = "&#x201A;",
	"�" = "&#x201E;",
	"�" = "&#x2026;",
	"�" = "&#x2020;",
	"�" = "&#x2021;",
	"�" = "&#x2030;",
	"�" = "&#x2039;",
	"�" = "&#x2018;",
	"�" = "&#x2019;",
	"�" = "&#x201C;",
	"�" = "&#x201D;",
	"�" = "&#x2022;",
	"�" = "&#x2013;",
	"�" = "&#x2014;",
	"�" = "&#x2122;"
))

//All characters forbidden by filenames: ", \, \n, \t, /, ?, %, *, :, |, <, >, ..
GLOBAL_DATUM_INIT(filename_forbidden_chars, /regex, regex(@{""|[\\\n\t/?%*:|<>]|\.\."}, "g"))
GLOBAL_PROTECT(filename_forbidden_chars)
// had to use the OR operator for quotes instead of putting them in the character class because it breaks the syntax highlighting otherwise.
