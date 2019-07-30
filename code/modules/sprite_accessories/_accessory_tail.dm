/*
////////////////////////////
/  =--------------------=  /
/  == Tail Definitions ==  /
/  =--------------------=  /
////////////////////////////
*/
/datum/sprite_accessory/tail
	name = "You should not see this..."
	icon = 'icons/mob/sprite_accessory/tails.dmi'
	colored_layers = 0 //Set to 1 to enable coloration using the tail color.
	extra_overlay // Change the icon name when adding extra layers
	var/show_species_tail = 0 // If false, do not render species' tail.
	var/clothing_can_hide = 1 // If true, clothing with HIDETAIL hides it
	var/desc = "You should not see this..."
	var/ani_state // State when wagging/animated
	var/extra_overlay_w // Wagging state for extra overlay
	var/layers = 0

/datum/sprite_accessory/tail/invisible
	name = "hide species-sprite tail"
	icon = null
	icon_state = null

/datum/sprite_accessory/tail/squirrel_orange
	name = "squirel, orange"
	desc = ""
	icon_state = "squirrel-orange"

/datum/sprite_accessory/tail/squirrel_red
	name = "squirrel, red"
	desc = ""
	icon_state = "squirrel-red"

/datum/sprite_accessory/tail/squirrel
	name = "squirrel, colorable"
	desc = ""
	icon_state = "squirrel"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/kitty
	name = "kitty, colorable, downwards"
	desc = ""
	icon_state = "kittydown"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/kittyup
	name = "kitty, colorable, upwards"
	desc = ""
	icon_state = "kittyup"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/tiger_white
	name = "tiger, colorable"
	desc = ""
	icon_state = "tiger"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/stripey
	name = "stripey taj, colorable"
	desc = ""
	icon_state = "stripeytail"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/stripeytail_brown
	name = "stripey taj, brown"
	desc = ""
	icon_state = "stripeytail-brown"

/datum/sprite_accessory/tail/bunny
	name = "bunny, colorable"
	desc = ""
	icon_state = "bunny"
	colored_layers = 1

/datum/sprite_accessory/tail/bear_brown
	name = "bear, brown"
	desc = ""
	icon_state = "bear-brown"

/datum/sprite_accessory/tail/bear
	name = "bear, colorable"
	desc = ""
	icon_state = "bear"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/dragon
	name = "dragon, colorable"
	desc = ""
	icon_state = "dragon"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/lizard
	name = "lizard, colorable"
	desc = ""
	icon_state = "liztail"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/wolf_grey
	name = "wolf, grey"
	desc = ""
	icon_state = "wolf-grey"

/datum/sprite_accessory/tail/wolf_green
	name = "wolf, green"
	desc = ""
	icon_state = "wolf-green"

/datum/sprite_accessory/tail/wisewolf
	name = "wolf, wise"
	desc = ""
	icon_state = "wolf-wise"

/datum/sprite_accessory/tail/blackwolf
	name = "wolf, black"
	desc = ""
	icon_state = "wolf"

/datum/sprite_accessory/tail/wolf
	name = "wolf, colorable"
	desc = ""
	icon_state = "wolf"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/mouse_pink
	name = "mouse, pink"
	desc = ""
	icon_state = "mouse-pink"

/datum/sprite_accessory/tail/mouse
	name = "mouse, colorable"
	desc = ""
	icon_state = "mouse"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/horse
	name = "horse tail, colorable"
	desc = ""
	icon_state = "horse"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/cow
	name = "cow tail, colorable"
	desc = ""
	icon_state = "cow"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/fantail
	name = "avian fantail, colorable"
	desc = ""
	icon_state = "fantail"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/wagtail
	name = "avian wagtail, colorable"
	desc = ""
	icon_state = "wagtail"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/crossfox
	name = "cross fox"
	desc = ""
	icon_state = "crossfox"

/datum/sprite_accessory/tail/beethorax
	name = "bee thorax"
	desc = ""
	icon_state = "beethorax"

/datum/sprite_accessory/tail/doublekitsune
	name = "double kitsune tail, colorable"
	desc = ""
	icon_state = "doublekitsune"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/spade_color
	name = "spade-tail (colorable)"
	desc = ""
	icon_state = "spadetail-black"
	colored_layers = 1

/datum/sprite_accessory/tail/snag
	name = "xenomorph tail 1"
	desc = ""
	icon_state = "snag"

/datum/sprite_accessory/tail/xenotail
	name = "xenomorph tail 2"
	desc = ""
	icon_state = "xenotail"

/datum/sprite_accessory/tail/eboop
	name = "EGN mech tail (dual color)"
	desc = ""
	icon_state = "eboop"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/molenar_kitsune
	name = "quintail kitsune tails (Molenar)"
	desc = ""
	icon_state = "molenar-kitsune"
	ckeys_allowed = list("molenar")

/datum/sprite_accessory/tail/miria_fluffdragon
	name = "fluffdragon tail (Miria Masters)"
	desc = ""
	icon_state = "miria-fluffdragontail"
	ckeys_allowed = list("miriamasters")

/datum/sprite_accessory/tail/miria_kitsune
	name = "Black kitsune tails (Miria Masters)"
	desc = ""
	icon_state = "miria-kitsunetail"
	ckeys_allowed = list("miriamasters")

/datum/sprite_accessory/tail/molenar_deathclaw
	name = "deathclaw bits (Molenar)"
	desc = ""
	icon_state = "molenar-deathclaw"
	ckeys_allowed = list("molenar","silvertalismen","jertheace")

/datum/sprite_accessory/tail/runac
	name = "fennecsune tails (Runac)"
	desc = ""
	icon_state = "runac"
	ckeys_allowed = list("rebcom1807")

/datum/sprite_accessory/tail/reika //Leaving this since it was too hard to split the wings from the tail.
	name = "fox tail (+ beewings) (Reika)"
	desc = ""
	icon_state = "reika"
	ckeys_allowed = list("rikaru19xjenkins")

/datum/sprite_accessory/tail/rosey
	name = "tritail kitsune tails (Rosey)"
	desc = ""
	icon_state = "rosey_three"
	ckeys_allowed = list("joey4298")

/datum/sprite_accessory/tail/rosey2
	name = "pentatail kitsune tails (Rosey)" //I predict seven tails next. ~CK
	desc = ""
	icon_state = "rosey_five"
	ckeys_allowed = list("joey4298")

/datum/sprite_accessory/tail/scree
	name = "green taj tail (Scree)"
	desc = ""
	icon_state = "scree"
	ckeys_allowed = list("scree")

/datum/sprite_accessory/tail/aronai
	name = "aronai tail (Aronai)"
	desc = ""
	icon_state = "aronai"
	ckeys_allowed = list("arokha")

/datum/sprite_accessory/tail/ketrai_wag
	name = "fennix tail (vwag)"
	desc = ""
	icon_state = "ketraitail"
	ani_state = "ketraitail_w"
	//ckeys_allowed = list("ketrai") //They requested it to be enabled for everyone.

/datum/sprite_accessory/tail/tamamo_kitsune
	name = "Tamamo Kitsune Tails" //Tamamo-no-Tiro, let it be known!
	desc = ""
	icon_state = "tamamo-kitsunetails"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/redpanda
	name = "red panda"
	desc = ""
	icon_state = "redpanda"

/datum/sprite_accessory/tail/ringtail
	name = "ringtail, colorable"
	desc = ""
	icon_state = "ringtail"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/holly
	name = "tigress tail (Holly)"
	desc = ""
	icon_state = "tigresstail"
	ckeys_allowed = list("hoodoo")

/datum/sprite_accessory/tail/satyr
	name = "goat legs, colorable"
	desc = ""
	icon_state = "satyr"
	blend = ICON_MULTIPLY
	colored_layers = 1

/datum/sprite_accessory/tail/tailmaw
	name = "tailmaw, colorable"
	desc = ""
	icon_state = "tailmaw"
	blend = ICON_MULTIPLY
	colored_layers = 1

/datum/sprite_accessory/tail/curltail
	name = "curltail (vwag)"
	desc = ""
	icon_state = "curltail"
	ani_state = "curltail_w"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/shorttail
	name = "shorttail (vwag)"
	desc = ""
	icon_state = "straighttail"
	ani_state = "straighttail_w"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/tiger_new
	name = "tiger tail (vwag)"
	desc = ""
	icon_state = "tigertail"
	ani_state = "tigertail_w"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/vulp_new
	name = "new vulp tail (vwag)"
	desc = ""
	icon_state = "vulptail"
	ani_state = "vulptail_w"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/otietail
	name = "otie tail (vwag)"
	desc = ""
	icon_state = "otie"
	ani_state = "otie_w"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/newtailmaw
	name = "new tailmaw (vwag)"
	desc = ""
	icon_state = "newtailmaw"
	ani_state = "newtailmaw_w"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/ztail
	name = "jagged flufftail"
	desc = ""
	icon_state = "ztail"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/snaketail
	name = "snake tail, colorable"
	desc = ""
	icon_state = "snaketail"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/vulpan_alt
	name = "vulpkanin alt style, colorable"
	desc = ""
	icon_state = "vulptail_alt"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/sergaltaildc
	name = "sergal, dual-color"
	desc = ""
	icon_state = "sergal"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/skunktail
	name = "skunk, dual-color"
	desc = ""
	icon_state = "skunktail"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/deertail
	name = "deer, dual-color"
	desc = ""
	icon_state = "deertail"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/teshari_fluffytail
	name = "Teshari alternative, colorable"
	desc = ""
	icon_state = "teshari_fluffytail"
	colored_layers = 2
	blend = ICON_MULTIPLY

/*//For all species tails. Includes haircolored tails.
/datum/sprite_accessory/tail/special
	name = "Blank tail. Do not select."
	icon = 'icons/effects/species_tails_vr.dmi'*/

/datum/sprite_accessory/tail/special/unathi
	name = "unathi tail"
	desc = ""
	icon_state = "sogtail_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/tajaran
	name = "tajaran tail"
	desc = ""
	icon_state = "tajtail_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/sergal
	name = "sergal tail"
	desc = ""
	icon_state = "sergtail_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/akula
	name = "akula tail"
	desc = ""
	icon_state = "sharktail_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/nevrean
	name = "nevrean tail"
	desc = ""
	icon_state = "nevreantail_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/armalis
	name = "armalis tail"
	desc = ""
	icon_state = "armalis_tail_humanoid_s"

/datum/sprite_accessory/tail/special/xenodrone
	name = "xenomorph drone tail"
	desc = ""
	icon_state = "xenos_drone_tail_s"

/datum/sprite_accessory/tail/special/xenosentinel
	name = "xenomorph sentinel tail"
	desc = ""
	icon_state = "xenos_sentinel_tail_s"

/datum/sprite_accessory/tail/special/xenohunter
	name = "xenomorph hunter tail"
	desc = ""
	icon_state = "xenos_hunter_tail_s"

/datum/sprite_accessory/tail/special/xenoqueen
	name = "xenomorph queen tail"
	desc = ""
	icon_state = "xenos_queen_tail_s"

/datum/sprite_accessory/tail/special/monkey
	name = "monkey tail"
	desc = ""
	icon_state = "chimptail_s"

/datum/sprite_accessory/tail/special/seromitail
	name = "seromi tail"
	desc = ""
	icon_state = "seromitail_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/seromitailfeathered
	name = "seromi tail w/ feathers (broken?)" // Broken?
	desc = ""
	icon_state = "seromitail_s"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/unathihc
	name = "unathi tail, colorable"
	desc = ""
	icon_state = "sogtail_hc_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/tajaranhc
	name = "tajaran tail, colorable"
	desc = ""
	icon_state = "tajtail_hc_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/sergalhc
	name = "sergal tail, colorable"
	desc = ""
	icon_state = "sergtail_hc_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/akulahc
	name = "akula tail, colorable"
	desc = ""
	icon_state = "sharktail_hc_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/nevreanhc
	name = "nevrean tail, colorable"
	desc = ""
	icon_state = "nevreantail_hc_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/foxhc
	name = "highlander zorren tail, colorable"
	desc = ""
	icon_state = "foxtail_hc_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/fennechc
	name = "flatland zorren tail, colorable"
	desc = ""
	icon_state = "fentail_hc_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/armalishc
	name = "armalis tail, colorable"
	desc = ""
	icon_state = "armalis_tail_humanoid_hc_s"
	colored_layers = 1

/datum/sprite_accessory/tail/special/xenodronehc
	name = "xenomorph drone tail, colorable"
	desc = ""
	icon_state = "xenos_drone_tail_hc_s"
	colored_layers = 1

/datum/sprite_accessory/tail/special/xenosentinelhc
	name = "xenomorph sentinel tail, colorable"
	desc = ""
	icon_state = "xenos_sentinel_tail_hc_s"
	colored_layers = 1

/datum/sprite_accessory/tail/special/xenohunterhc
	name = "xenomorph hunter tail, colorable"
	desc = ""
	icon_state = "xenos_hunter_tail_hc_s"
	colored_layers = 1

/datum/sprite_accessory/tail/special/xenoqueenhc
	name = "xenomorph queen tail, colorable"
	desc = ""
	icon_state = "xenos_queen_tail_hc_s"
	colored_layers = 1

/datum/sprite_accessory/tail/special/monkeyhc
	name = "monkey tail, colorable, colorable"
	desc = ""
	icon_state = "chimptail_hc_s"
	colored_layers = 1

/datum/sprite_accessory/tail/special/seromitailhc
	name = "seromi tail, colorable"
	desc = ""
	icon_state = "seromitail_hc_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/seromitailfeatheredhc
	name = "seromi tail w/ feathers, colorable"
	desc = ""
	icon_state = "seromitail_feathers_hc_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/vulpan
	name = "vulpkanin, colorable"
	desc = ""
	icon_state = "vulptail_s"
	colored_layers = 1
	blend = ICON_MULTIPLY


/datum/sprite_accessory/tail/zenghu_taj
	name = "Zeng-Hu Tajaran Synth tail"
	desc = ""
	icon_state = "zenghu_taj"

//Taurs moved to a separate file due to extra code around them

//Buggo Abdomens!

/datum/sprite_accessory/tail/buggo
	name = "Bug abdomen, colorable"
	desc = ""
	icon_state = "buggo_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggobee
	name = "Bug abdomen, bee top, dual-colorable"
	desc = ""
	icon_state = "buggo_s"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggobeefull
	name = "Bug abdomen, bee full, dual-colorable"
	desc = ""
	icon_state = "buggo_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggobeefull_markings"

/datum/sprite_accessory/tail/buggounder
	name = "Bug abdomen, underside, dual-colorable"
	desc = ""
	icon_state = "buggo_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggounder_markings"

/datum/sprite_accessory/tail/buggofirefly
	name = "Bug abdomen, firefly, dual-colorable"
	desc = ""
	icon_state = "buggo_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofirefly_markings"

/datum/sprite_accessory/tail/buggofat
	name = "Fat bug abdomen, colorable"
	desc = ""
	icon_state = "buggofat_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggofatbee
	name = "Fat bug abdomen, bee top, dual-colorable"
	desc = ""
	icon_state = "buggofat_s"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggofatbeefull
	name = "Fat bug abdomen, bee full, dual-colorable"
	desc = ""
	icon_state = "buggofat_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofatbeefull_markings"

/datum/sprite_accessory/tail/buggofatunder
	name = "Fat bug abdomen, underside, dual-colorable"
	desc = ""
	icon_state = "buggofat_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofatunder_markings"

/datum/sprite_accessory/tail/buggofatfirefly
	name = "Fat bug abdomen, firefly, dual-colorable"
	desc = ""
	icon_state = "buggofat_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofatfirefly_markings"

/datum/sprite_accessory/tail/buggowag
	name = "Bug abdomen, colorable, vwag change"
	desc = ""
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggobeewag
	name = "Bug abdomen, bee top, dual color, vwag"
	desc = ""
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggobee_markings"
	extra_overlay_w = "buggofatbee_markings"

/datum/sprite_accessory/tail/buggobeefullwag
	name = "Bug abdomen, bee full, dual color, vwag"
	desc = ""
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggobeefull_markings"
	extra_overlay_w = "buggofatbeefull_markings"

/datum/sprite_accessory/tail/buggounderwag
	name = "Bug abdomen, underside, dual color, vwag"
	desc = ""
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggounder_markings"
	extra_overlay_w = "buggofatunder_markings"

/datum/sprite_accessory/tail/buggofireflywag
	name = "Bug abdomen, firefly, dual color, vwag"
	desc = ""
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofirefly_markings"
	extra_overlay_w = "buggofatfirefly_markings"

//Vass buggo variants!

/datum/sprite_accessory/tail/buggovass
	name = "Bug abdomen, vass, colorable"
	desc = ""
	icon_state = "buggo_vass_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggovassbee
	name = "Bug abdomen, bee top, dc, vass"
	desc = ""
	icon_state = "buggo_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggovassbeefull
	name = "Bug abdomen, bee full, dc, vass"
	desc = ""
	icon_state = "buggo_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggobeefull_vass_markings"

/datum/sprite_accessory/tail/buggovassunder
	name = "Bug abdomen, underside, dc, vass"
	desc = ""
	icon_state = "buggo_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggounder_vass_markings"

/datum/sprite_accessory/tail/buggovassfirefly
	name = "Bug abdomen, firefly, dc, vass"
	desc = ""
	icon_state = "buggo_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofirefly_vass_markings"

/datum/sprite_accessory/tail/buggovassfat
	name = "Fat bug abdomen, vass, colorable"
	desc = ""
	icon_state = "buggofat_vass_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggovassfatbee
	name = "Fat bug abdomen, bee top, dc, vass"
	desc = ""
	icon_state = "buggofat_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggovassfatbeefull
	name = "Fat bug abdomen, bee full, dc, vass"
	desc = ""
	icon_state = "buggofat_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofatbeefull_vass_markings"

/datum/sprite_accessory/tail/buggovassfatunder
	name = "Fat bug abdomen, underside, dc, vass"
	desc = ""
	icon_state = "buggofat_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofatunder_vass_markings"

/datum/sprite_accessory/tail/buggovassfatfirefly
	name = "Fat bug abdomen, firefly, dc, vass"
	desc = ""
	icon_state = "buggofat_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofatfirefly_vass_markings"

/datum/sprite_accessory/tail/buggovasswag
	name = "Bug abdomen, vass, colorable, vwag change"
	desc = ""
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggovassbeewag
	name = "Bug abdomen, bee top, dc, vass, vwag"
	desc = ""
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggobee_vass_markings"
	extra_overlay_w = "buggofatbee_vass_markings"

/datum/sprite_accessory/tail/buggovassbeefullwag
	name = "Bug abdomen, bee full, dc, vass, vwag"
	desc = ""
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggobeefull_vass_markings"
	extra_overlay_w = "buggofatbeefull_vass_markings"

/datum/sprite_accessory/tail/buggovassunderwag
	name = "Bug abdomen, underside, dc, vass, vwag"
	desc = ""
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggounder_vass_markings"
	extra_overlay_w = "buggofatunder_vass_markings"

/datum/sprite_accessory/tail/buggovassfireflywag
	name = "Bug abdomen, firefly, dc, vass, vwag"
	desc = ""
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	colored_layers = 2
	blend = ICON_MULTIPLY
	extra_overlay = "buggofirefly_vass_markings"
	extra_overlay_w = "buggofatfirefly_vass_markings"
