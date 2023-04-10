/obj/item/tool/crowbar
	name = "crowbar"
	desc = "Used to remove floors and to pry open doors."
	icon_state = "crowbar"
	item_state = "crowbar"
	flags = CONDUCT
	force = WEAPON_FORCE_PAINFUL
	worksound = WORKSOUND_EASY_CROWBAR
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_ENGINEERING = 1)
	matter = list(MATERIAL_STEEL = 4)
	attack_verb = list("attacked", "bashed", "battered", "bludgeoned", "whacked")
	hitsound = 'sound/weapons/smash.ogg'
	tool_qualities = list(QUALITY_PRYING = 35, QUALITY_DIGGING = 10, QUALITY_HAMMERING = 10)
	price_tag = 15

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("crushes", "bashes", "wacks", "bludgeones")
	alt_mode_toggle = "flips the bend of the bar"
	alt_mode_lossrate = 1.3

/obj/item/tool/crowbar/bs
	name = "bluespace crowbar"
	icon_state = "bs_crowbar"
	item_state = "bs_crowbar"
	tool_qualities = list(QUALITY_PRYING = 100, QUALITY_DIGGING = 100)

/obj/item/tool/crowbar/improvised
	name = "rebar"
	desc = "A pair of metal rods laboriously twisted into a useful prying and digging tool. Has more space for tool mods because it's hand-made."
	icon_state = "impro_crowbar"
	item_state = "impro_crowbar"
	tool_qualities = list(QUALITY_PRYING = 15, QUALITY_DIGGING = 10, QUALITY_HAMMERING = 10)
	degradation = 5 //This one breaks REALLY fast
	max_upgrades = 5 //all makeshift tools get more mods to make them actually viable for mid-late game
	price_tag = 5

/obj/item/tool/crowbar/onestar
	name = "Greyson Positronic crowbar"
	desc = "Looks like a classic one, but more durable."
	icon_state = "one_star_crowbar"
	item_state = "onestar_crowbar"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLATINUM = 1)
	tool_qualities = list(QUALITY_PRYING = 60, QUALITY_DIGGING = 20, QUALITY_HAMMERING = 20)
	origin_tech = list(TECH_ENGINEERING = 1, TECH_MATERIAL = 2)
	degradation = 2
	workspeed = 1.2
	price_tag = 180 // Fancy but still just a crowbar.
	allow_greyson_mods = TRUE

	alt_mode_toggle = "flips the bend of the bar, unlocking its true potential"
	alt_mode_lossrate = 1.5

/obj/item/tool/crowbar/pneumatic
	name = "pneumatic crowbar"
	desc = "When you really need to crack open something."
	icon_state = "pneumo_crowbar"
	item_state = "pneumo_crowbar"
	matter = list(MATERIAL_STEEL = 6, MATERIAL_PLASTEEL = 1, MATERIAL_PLASTIC = 2)
	tool_qualities = list(QUALITY_PRYING = 45, QUALITY_DIGGING = 35)
	degradation = 0.7
	use_power_cost = 0.8
	max_upgrades = 4
	suitable_cell = /obj/item/cell/medium
	price_tag = 300
