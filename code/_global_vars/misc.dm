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
