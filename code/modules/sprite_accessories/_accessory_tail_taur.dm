/*
////////////////////////////
/  =--------------------=  /
/  == Taur Definitions ==  /
/  =--------------------=  /
////////////////////////////


// Taur sprites are now a subtype of tail since they are mutually exclusive anyway.

/datum/sprite_accessory/tail/taur
	name = "Hide Taur Body"
	icon = 'icons/mob/sprite_accessory/taurs.dmi'
	colored_layers = 1 // Yes color, using tail color
	blend = ICON_MULTIPLY  // The sprites for taurs are designed for ICON_MULTIPLY

	var/icon/suit_sprites = null //File for suit sprites, if any.

	var/can_ride = 1			//whether we're real rideable taur or just in that category

	//Could do nested lists but it started becoming a nightmare. It'd be more fun for lookups of a_intent and m_intent, but then subtypes need to
	//duplicate all the messages, and it starts getting awkward. These are singletons, anyway!

/datum/sprite_accessory/tail/taur/alraune
	name = "Alraune (Taur)"
	icon_state = "alraune_s"
	ani_state = "alraune_closed_s"
	ckeys_allowed = list("natje")
	colored_layers = 0
	can_ride = 0

/datum/sprite_accessory/tail/taur/alraune/alraune_2c
	name = "Alraune Dual Color (Taur)"
	icon_state = "alraunecolor_s"
	ani_state = "alraunecolor_closed_s"
	ckeys_allowed = null
	colored_layers = 2
	extra_overlay_w = "alraunecolor_closed_markings"

/datum/sprite_accessory/tail/taur/centipede
	name = "Centipede (Taur)"
	icon_state = "ariana_s"
	colored_layers = 0

/datum/sprite_accessory/tail/taur/cow
	name = "Cow (Taur)"
	icon_state = "cow_s"
	suit_sprites = 'icons/mob/taursuit/cow.dmi'

/datum/sprite_accessory/tail/taur/wolf/serdy
	name = "CyberWolf (Taur)"
	icon_state = "serdy_s"

/datum/sprite_accessory/tail/taur/deer
	name = "Deer (Taur)"
	icon_state = "deer_s"
	colored_layers = 2

/datum/sprite_accessory/tail/taur/drake //Enabling on request, no suit compatibility but then again see 2 above.
	name = "Drake (Taur)"
	icon_state = "drake_s"
	colored_layers = 2

/datum/sprite_accessory/tail/taur/feline
	name = "Feline (Taur)"
	icon_state = "feline_s"

/datum/sprite_accessory/tail/taur/feline/feline_2c
	name = "Feline Dual Color (Taur)"
	icon_state = "feline_s"
	colored_layers = 2

/datum/sprite_accessory/tail/taur/feline/variant
	name = "Feline Spotted (Taur)"
	icon_state = "tempest_s"

/datum/sprite_accessory/tail/taur/frog
	name = "Frog (Taur)"
	icon_state = "frog_s"

/datum/sprite_accessory/tail/taur/goat
	name = "Goat Legs"
	icon_state = "satyr"
	blend = ICON_MULTIPLY
	colored_layers = 1

/datum/sprite_accessory/tail/taur/horse
	name = "Horse (Taur)"
	icon_state = "horse_s"
	suit_sprites = 'icons/mob/taursuit/horse.dmi'

/datum/sprite_accessory/tail/taur/lizard
	name = "Lizard (Taur)"
	icon_state = "lizard_s"
	suit_sprites = 'icons/mob/taursuit/lizard.dmi'

/datum/sprite_accessory/tail/taur/lizard/lizard_2c
	name = "Lizard Dual Color (Taur)"
	icon_state = "lizard_s"
	colored_layers = 2

/datum/sprite_accessory/tail/taur/roiz_long_lizard
	name = "Lizard Extra Long Tail "
	icon_state = "roiz_tail_s"
	colored_layers = 0
	ckeys_allowed = list("spoopylizz")

/datum/sprite_accessory/tail/taur/naga
	name = "Naga (Taur)"
	icon_state = "naga_s"
	suit_sprites = 'icons/mob/taursuit/naga.dmi'

/datum/sprite_accessory/tail/taur/naga/naga_2c
	name = "Naga Dual Color (Taur)"
	icon_state = "naga_s"
	colored_layers = 2

/datum/sprite_accessory/tail/taur/otie
	name = "Otie (Taur)"
	icon_state = "otie_s"
	colored_layers = 2

/datum/sprite_accessory/tail/taur/slug
	name = "Slug (Taur)"
	icon_state = "slug_s"

/datum/sprite_accessory/tail/taur/spider
	name = "Spider (Taur)"
	icon_state = "spider_s"

/datum/sprite_accessory/tail/taur/synthfeline
	name = "SynthFeline (Taur)"
	icon_state = "synthfeline_s"
	colored_layers = 2

/datum/sprite_accessory/tail/taur/synthhorse
	name = "SynthHorse (Taur)"
	icon_state = "synthhorse_s"
	colored_layers = 2

/datum/sprite_accessory/tail/taur/synthlizard
	name = "SynthLizard (Taur)"
	icon_state = "synthlizard_s"
	colored_layers = 2

/datum/sprite_accessory/tail/taur/synthwolf
	name = "SynthWolf (Taur)"
	icon_state = "synthwolf_s"
	colored_layers = 2

/datum/sprite_accessory/tail/taur/tents
	name = "Tentacles (Taur)"
	icon_state = "tent_s"
	can_ride = 0

/datum/sprite_accessory/tail/taur/wolf
	name = "Wolf (Taur)"
	icon_state = "wolf_s"
	suit_sprites = 'icons/mob/taursuit/wolf.dmi'

/datum/sprite_accessory/tail/taur/wolf/wolf_2c
	name = "Wolf Dual Color (Taur)"
	icon_state = "wolf_s"
	colored_layers = 2

/*