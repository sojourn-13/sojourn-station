/*
////////////////////////////
/  =--------------------=  /
/  == Tail Definitions ==  /
/  =--------------------=  /
////////////////////////////
*/
/datum/sprite_accessory/tail
	name = "Hide Tail"
	icon = 'icons/mob/sprite_accessory/tails.dmi'
	colored_layers = 0 //Set to 1 to enable coloration using the tail color.
	extra_overlay // Change the icon name when adding extra layers
	var/show_species_tail = 0 // If false, do not render species' tail.
	var/clothing_can_hide = 1 // If true, clothing with HIDETAIL hides it
	var/desc = "You should not see this..."
	var/ani_state // State when wagging/animated
	var/extra_overlay_w // Wagging state for extra overlay
	var/layers = 0

/datum/sprite_accessory/tail/akulahc
	name = "Akula Tail"
	desc = ""
	icon_state = "sharktail_hc_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/armalishc
	name = "Armalis Tail"
	desc = ""
	icon_state = "armalis_tail_humanoid_hc_s"
	colored_layers = 1

/datum/sprite_accessory/tail/aronai
	name = "Aronai Tail"
	desc = ""
	icon_state = "aronai"

/datum/sprite_accessory/tail/avianfantail
	name = "Avian Fantail"
	desc = ""
	icon_state = "fantail"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/wagtail
	name = "Avian Wagtail"
	desc = ""
	icon_state = "wagtail"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/bear_brown
	name = "Bear Tail"
	desc = ""
	icon_state = "bear-brown"

/datum/sprite_accessory/tail/bear
	name = "Bear Tail, colorable"
	desc = ""
	icon_state = "bear"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/beethorax
	name = "Bee Thorax"
	desc = ""
	icon_state = "beethorax"

/datum/sprite_accessory/tail/bunny
	name = "Bunny Tail"
	desc = ""
	icon_state = "bunny"
	colored_layers = 1

/datum/sprite_accessory/tail/cow
	name = "Cow Tail"
	desc = ""
	icon_state = "cow"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/crossfox
	name = "Cross Fox Tail"
	desc = ""
	icon_state = "crossfox"

/datum/sprite_accessory/tail/curltail
	name = "Curly Tail"
	desc = ""
	icon_state = "curltail"
	ani_state = "curltail_w"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/deathclaw
	name = "Deathclaw Tail"
	desc = ""
	icon_state = "molenar-deathclaw"

/datum/sprite_accessory/tail/deertail
	name = "Deer Tail"
	desc = ""
	icon_state = "deertail"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/dragon
	name = "Dragon Tail"
	desc = ""
	icon_state = "dragon"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/egnmech
	name = "EGN Mech Tail"
	desc = ""
	icon_state = "eboop"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/fennecsune
	name = "Fennecsune Tails"
	desc = ""
	icon_state = "runac"

/datum/sprite_accessory/tail/fennix
	name = "Fennix Tail"
	desc = ""
	icon_state = "ketraitail"
	ani_state = "ketraitail_w"

/datum/sprite_accessory/tail/fennechc
	name = "Flatland Zorren Tail"
	desc = ""
	icon_state = "fentail_hc_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/fluffdragon
	name = "Fluffdragon Tail"
	desc = ""
	icon_state = "miria-fluffdragontail"

/datum/sprite_accessory/tail/foxtailbeewings
	name = "Fox Tail And Beewings"
	desc = ""
	icon_state = "reika"

/datum/sprite_accessory/tail/greentaj
	name = "Green Taj Tail"
	desc = ""
	icon_state = "scree"

/datum/sprite_accessory/tail/satyr
	name = "Goat Legs"
	desc = ""
	icon_state = "satyr"
	blend = ICON_MULTIPLY
	colored_layers = 1

/datum/sprite_accessory/tail/foxhc
	name = "Highlander Zorren Tail"
	desc = ""
	icon_state = "foxtail_hc_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/horse
	name = "Horse Tail"
	desc = ""
	icon_state = "horse"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/ztail
	name = "Jagged Tail"
	desc = ""
	icon_state = "ztail"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/kitsune_double
	name = "Kitsune Tails, Double"
	desc = ""
	icon_state = "doublekitsune"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/kitsune_quintail
	name = "Kitsune Tails, Quintail"
	desc = ""
	icon_state = "molenar-kitsune"

/datum/sprite_accessory/tail/kitsune_miria
	name = "Kitsune Tails, Miria"
	desc = ""
	icon_state = "miria-kitsunetail"

/datum/sprite_accessory/tail/kitsune_tritail
	name = "Kitsune Tails, Tritail"
	desc = ""
	icon_state = "rosey_three"

/datum/sprite_accessory/tail/kitsune_pentatail
	name = "Kitsune Tails, Pentatail"
	desc = ""
	icon_state = "rosey_five"

/datum/sprite_accessory/tail/kitsune_tamamo
	name = "Kitsune Tails, Tamamo"
	desc = ""
	icon_state = "tamamo-kitsunetails"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/kitty
	name = "Kitty Tail, Downwards"
	desc = ""
	icon_state = "kittydown"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/kittyup
	name = "Kitty Tail, Upwards"
	desc = ""
	icon_state = "kittyup"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/lizard
	name = "Lizard Tail"
	desc = ""
	icon_state = "liztail"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/mouse_pink
	name = "Mouse Tail"
	desc = ""
	icon_state = "mouse-pink"

/datum/sprite_accessory/tail/mouse
	name = "Mouse Tail, Colorable"
	desc = ""
	icon_state = "mouse"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/monkeyhc
	name = "Monkey Tail"
	desc = ""
	icon_state = "chimptail_hc_s"
	colored_layers = 1

/datum/sprite_accessory/tail/nevreanhc
	name = "Nevrean Tail"
	desc = ""
	icon_state = "nevreantail_hc_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/otietail
	name = "Otie Tail"
	desc = ""
	icon_state = "otie"
	ani_state = "otie_w"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/redpanda
	name = "Red Panda Tail"
	desc = ""
	icon_state = "redpanda"

/datum/sprite_accessory/tail/ringtail
	name = "Ringtail"
	desc = ""
	icon_state = "ringtail"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/sergaltaildc
	name = "Sergal Tail"
	desc = ""
	icon_state = "sergal"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/sergalhc
	name = "Sergal Tail 2"
	desc = ""
	icon_state = "sergtail_hc_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/seromitailhc
	name = "Seromi Tail"
	desc = ""
	icon_state = "seromitail_hc_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/seromitailfeatheredhc
	name = "Seromi Tail With Feathers"
	desc = ""
	icon_state = "seromitail_feathers_hc_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/shorttail
	name = "Short Tail"
	desc = ""
	icon_state = "straighttail"
	ani_state = "straighttail_w"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/skunktail
	name = "Skunk Tail"
	desc = ""
	icon_state = "skunktail"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/snaketail
	name = "Snake Tail"
	desc = ""
	icon_state = "snaketail"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/spade_color
	name = "Spade Tail"
	desc = ""
	icon_state = "spadetail-black"
	colored_layers = 1

/datum/sprite_accessory/tail/squirrel
	name = "Squirrel Tail"
	desc = ""
	icon_state = "squirrel"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/squirrel_orange
	name = "Squirrel Tail, Orange"
	desc = ""
	icon_state = "squirrel-orange"

/datum/sprite_accessory/tail/squirrel_red
	name = "Squirrel Tail, Red"
	desc = ""
	icon_state = "squirrel-red"

/datum/sprite_accessory/tail/stripeytail_brown
	name = "Stripey Taj Tail"
	desc = ""
	icon_state = "stripeytail-brown"

/datum/sprite_accessory/tail/stripey
	name = "Stripey Taj Tail, Colorable"
	desc = ""
	icon_state = "stripeytail"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/tailmaw
	name = "Tailmaw"
	desc = ""
	icon_state = "tailmaw"
	blend = ICON_MULTIPLY
	colored_layers = 1

/datum/sprite_accessory/tail/newtailmaw
	name = "Tailmaw 2"
	desc = ""
	icon_state = "newtailmaw"
	ani_state = "newtailmaw_w"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/tajaranhc
	name = "Tajaran Tail"
	desc = ""
	icon_state = "tajtail_hc_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/teshari_fluffytail
	name = "Teshari Tail"
	desc = ""
	icon_state = "teshari_fluffytail"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/tiger_white
	name = "Tiger Tail"
	desc = ""
	icon_state = "tiger"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/tiger_new
	name = "Tiger Tail 2"
	desc = ""
	icon_state = "tigertail"
	ani_state = "tigertail_w"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/tigress
	name = "Tigress Tail"
	desc = ""
	icon_state = "tigresstail"

/datum/sprite_accessory/tail/vulp_new
	name = "Vulpkanin Tail"
	desc = ""
	icon_state = "vulptail"
	ani_state = "vulptail_w"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/vulpan_alt
	name = "Vulpkanin Tail 2"
	desc = ""
	icon_state = "vulptail_alt"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/vulpan
	name = "Vulpkanin Tail 3"
	desc = ""
	icon_state = "vulptail_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/wolf
	name = "Wolf Tail"
	desc = ""
	icon_state = "wolf"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/wolfblack
	name = "Wolf Tail, Black"
	desc = ""
	icon_state = "wolf"

/datum/sprite_accessory/tail/wolf_grey
	name = "Wolf Tail, Grey"
	desc = ""
	icon_state = "wolf-grey"

/datum/sprite_accessory/tail/wolf_green
	name = "Wolf Tail, Green"
	desc = ""
	icon_state = "wolf-green"

/datum/sprite_accessory/tail/wolfwise
	name = "Wolf Tail, Wise"
	desc = ""
	icon_state = "wolf-wise"

/datum/sprite_accessory/tail/unathihc
	name = "Unathi Tail"
	desc = ""
	icon_state = "sogtail_hc_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/xenotail1
	name = "Xenomorph Tail 1"
	desc = ""
	icon_state = "snag"

/datum/sprite_accessory/tail/xenotail2
	name = "Xenomorph Tail 2"
	desc = ""
	icon_state = "xenotail"

/datum/sprite_accessory/tail/xenotail3
	name = "Xenomorph Drone Tail"
	desc = ""
	icon_state = "xenos_drone_tail_s"

/datum/sprite_accessory/tail/xenotail4
	name = "Xenomorph Sentinel Tail"
	desc = ""
	icon_state = "xenos_sentinel_tail_s"

/datum/sprite_accessory/tail/xenotail5
	name = "Xenomorph Hunter Tail"
	desc = ""
	icon_state = "xenos_hunter_tail_s"

/datum/sprite_accessory/tail/xenotail6
	name = "Xenomorph Queen Tail"
	desc = ""
	icon_state = "xenos_queen_tail_s"

/datum/sprite_accessory/tail/zenghu_taj
	name = "Zeng-Hu Tajaran Synth Tail"
	desc = ""
	icon_state = "zenghu_taj"

/*//For all species tails. Includes haircolored tails.
/datum/sprite_accessory/tail/special
	name = "Blank tail. Do not select."
	icon = 'icons/effects/species_tails_vr.dmi'*/


//Buggo Abdomens!

/datum/sprite_accessory/tail/buggo
	name = "Bug Abdomen"
	desc = ""
	icon_state = "buggo_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggobee
	name = "Bug Abdomen, Bee Top"
	desc = ""
	icon_state = "buggo_s"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggobeefull
	name = "Bug Abdomen, Bee Full"
	desc = ""
	icon_state = "buggo_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggobeefull_markings"

/datum/sprite_accessory/tail/buggounder
	name = "Bug Abdomen, Underside"
	desc = ""
	icon_state = "buggo_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggounder_markings"

/datum/sprite_accessory/tail/buggofirefly
	name = "Bug Abdomen, Firefly"
	desc = ""
	icon_state = "buggo_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofirefly_markings"

/datum/sprite_accessory/tail/buggofat
	name = "Large Bug Abdomen"
	desc = ""
	icon_state = "buggofat_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggofatbee
	name = "Large Bug Abdomen, Bee Top"
	desc = ""
	icon_state = "buggofat_s"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggofatbeefull
	name = "Large Bug Abdomen, Bee Full"
	desc = ""
	icon_state = "buggofat_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofatbeefull_markings"

/datum/sprite_accessory/tail/buggofatunder
	name = "Large Bug Abdomen, Underside"
	desc = ""
	icon_state = "buggofat_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofatunder_markings"

/datum/sprite_accessory/tail/buggofatfirefly
	name = "Large Bug Abdomen, Firefly"
	desc = ""
	icon_state = "buggofat_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofatfirefly_markings"

/datum/sprite_accessory/tail/buggowag
	name = "Alternate Bug Abdomen"
	desc = ""
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggobeewag
	name = "Alternate Bug Abdomen, Bee Top"
	desc = ""
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggobee_markings"
	extra_overlay_w = "buggofatbee_markings"

/datum/sprite_accessory/tail/buggobeefullwag
	name = "Alternate Bug Abdomen, Bee Full"
	desc = ""
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggobeefull_markings"
	extra_overlay_w = "buggofatbeefull_markings"

/datum/sprite_accessory/tail/buggounderwag
	name = "Alternate Bug Abdomen, Underside"
	desc = ""
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggounder_markings"
	extra_overlay_w = "buggofatunder_markings"

/datum/sprite_accessory/tail/buggofireflywag
	name = "Alternate Bug Abdomen, Firefly"
	desc = ""
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofirefly_markings"
	extra_overlay_w = "buggofatfirefly_markings"

//Vass buggo variants!

/datum/sprite_accessory/tail/buggovass
	name = "Alternate Bug Abdomen 2"
	desc = ""
	icon_state = "buggo_vass_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggovassbee
	name = "Alternate Bug Abdomen 2, Bee Top"
	desc = ""
	icon_state = "buggo_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggovassbeefull
	name = "Alternate Bug Abdomen 2, Bee Full"
	desc = ""
	icon_state = "buggo_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggobeefull_vass_markings"

/datum/sprite_accessory/tail/buggovassunder
	name = "Alternate Bug Abdomen 2, Underside"
	desc = ""
	icon_state = "buggo_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggounder_vass_markings"

/datum/sprite_accessory/tail/buggovassfirefly
	name = "Alternate Bug Abdomen 2, Firefly"
	desc = ""
	icon_state = "buggo_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofirefly_vass_markings"

/datum/sprite_accessory/tail/buggovassfat
	name = "Alternate Large Bug Abdomen"
	desc = ""
	icon_state = "buggofat_vass_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggovassfatbee
	name = "Alternate Large Bug Abdomen, Bee Top"
	desc = ""
	icon_state = "buggofat_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggovassfatbeefull
	name = "Alternate Large Bug Abdomen, Bee Full"
	desc = ""
	icon_state = "buggofat_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofatbeefull_vass_markings"

/datum/sprite_accessory/tail/buggovassfatunder
	name = "Alternate Large Bug Abdomen, Underside"
	desc = ""
	icon_state = "buggofat_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofatunder_vass_markings"

/datum/sprite_accessory/tail/buggovassfatfirefly
	name = "Alternate Large Bug Abdomen, Firefly"
	desc = ""
	icon_state = "buggofat_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofatfirefly_vass_markings"

/datum/sprite_accessory/tail/buggovasswag
	name = "Alternate Bug Abdomen 3"
	desc = ""
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggovassbeewag
	name = "Alternate Bug Abdomen 3, Bee Top"
	desc = ""
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggobee_vass_markings"
	extra_overlay_w = "buggofatbee_vass_markings"

/datum/sprite_accessory/tail/buggovassbeefullwag
	name = "Alternate Bug Abdomen 3, Bee Full"
	desc = ""
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggobeefull_vass_markings"
	extra_overlay_w = "buggofatbeefull_vass_markings"

/datum/sprite_accessory/tail/buggovassunderwag
	name = "Alternate Bug Abdomen 3, Underside"
	desc = ""
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggounder_vass_markings"
	extra_overlay_w = "buggofatunder_vass_markings"

/datum/sprite_accessory/tail/buggovassfireflywag
	name = "Alternate Bug Abdomen 3, Firefly"
	desc = ""
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofirefly_vass_markings"
	extra_overlay_w = "buggofatfirefly_vass_markings"
