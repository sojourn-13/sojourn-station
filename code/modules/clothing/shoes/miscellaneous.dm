//No-slip module for shoes
/obj/item/noslipmodule
	name = "no slip sole"
	desc = "Attach it to your shoe."
	icon = 'icons/inventory/feet/icon.dmi'
	icon_state = "no_slip_sole"

/obj/item/clothing/shoes/syndigaloshes
	desc = "A pair of brown shoes. They seem to have extra grip."
	name = "brown shoes"
	icon_state = "brown"
	item_state = "brown"
	permeability_coefficient = 0.05
	item_flags = NOSLIP | SILENT
	origin_tech = list(TECH_ILLEGAL = 3)
	siemens_coefficient = 0 // DAMN BOI

/obj/item/clothing/shoes/ablative
	name = "ablative jackboots"
	desc = "A thick pair of boots that excels in protecting the wearer against energy projectiles."
	armor_list = list(melee = 2, bullet = 2, energy = 13, bomb = 10, bio = 10, rad = 0)
	icon_state = "swat"
	force = WEAPON_FORCE_WEAK
	siemens_coefficient = 0.6
	can_hold_knife = TRUE
	matter = list(MATERIAL_STEEL = 5, MATERIAL_PLASTIC = 15, MATERIAL_PLATINUM = 2)

/obj/item/clothing/shoes/ablative/iron_lock_security
	name = "outdated jackboots"
	desc = "An \"Iron Lock Security\" ablative boots with plates designed to absorb energy projectiles, even after all this time no one has been able to improve its design by Greyson Positronic."

/obj/item/clothing/shoes/swat
	name = "\improper SWAT shoes"
	desc = "When you want to turn up the heat."
	icon_state = "swat"
	force = WEAPON_FORCE_WEAK
	armor_list = list(melee = 5, bullet = 2, energy = 6, bomb = 10, bio = 10, rad = 0)
	item_flags = NOSLIP
	siemens_coefficient = 0.6

/obj/item/clothing/shoes/combat //Basically SWAT shoes combined with galoshes.
	name = "combat boots"
	desc = "When you REALLY want to turn up the heat."
	icon_state = "swat"
	force = WEAPON_FORCE_WEAK
	armor_list = list(melee = 5, bullet = 2, energy = 6, bomb = 10, bio = 10, rad = 0)
	item_flags = NOSLIP
	siemens_coefficient = 0.4
	can_hold_knife = 1

/obj/item/clothing/shoes/sandal
	desc = "A pair of rather plain, wooden sandals."
	name = "sandals"
	icon_state = "wizard"
	species_restricted = null
	body_parts_covered = 0
	siemens_coefficient = 0

/obj/item/clothing/shoes/sandal/marisa
	desc = "A pair of magic, black shoes."
	name = "magic shoes"
	icon_state = "black"
	body_parts_covered = LEGS
	siemens_coefficient = 0

/obj/item/clothing/shoes/cult
	name = "boots"
	desc = "A pair of boots worn by the followers of ... something."
	icon_state = "cult"
	item_state = "cult"
	force = WEAPON_FORCE_WEAK
	siemens_coefficient = 0.7

	cold_protection = LEGS
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = LEGS
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE
	species_restricted = null

/obj/item/clothing/shoes/cyborg
	name = "cyborg boots"
	desc = "Shoes for a cyborg costume"
	icon_state = "boots"

/obj/item/clothing/shoes/slippers
	name = "bunny slippers"
	desc = "Fluffy!"
	icon_state = "slippers"
	item_state = "slippers"
	force = 0
	species_restricted = null
	w_class = ITEM_SIZE_SMALL

/obj/item/clothing/shoes/slippers/worn
	name = "worn bunny slippers"
	desc = "Fluffy..."
	icon_state = "slippers_worn"
	item_state = "slippers_worn"
	force = 0
	w_class = ITEM_SIZE_SMALL

/obj/item/clothing/shoes/swimmingfins
	desc = "Help you swim good."
	name = "swimming fins"
	icon_state = "flippers"
	item_flags = NOSLIP
	slowdown = SHOES_SLOWDOWN+1
	species_restricted = null

/obj/item/clothing/shoes/leather
	name = "leather shoes"
	desc = "A sturdy pair of leather shoes."
	icon_state = "leather"

/obj/item/clothing/shoes/leather/regal
	name = "Regal leather shoes"
	desc = "A pair of leather shoes worn by a magistrate of sorts."
	icon_state = "detective"
	price_tag = 50

/obj/item/clothing/shoes/jackboots/redboot
	name = "red boots"
	desc = "A pair of stylish red boots."
	icon_state = "redboots"
	item_state = "redboots"
	can_hold_knife = TRUE
	price_tag = 30

/obj/item/clothing/shoes/jackboots/longboot
	name = "long boots"
	desc = "A pair of stylish vertically long boots."
	icon_state = "longboots"
	item_state = "longboots"
	can_hold_knife = TRUE
	price_tag = 40

/obj/item/clothing/shoes/laceup
	name = "black dress shoes"
	desc = "A pair of sleek black polished shoes."
	icon_state = "laceups"

/obj/item/clothing/shoes/laceup/white
	name = "white dress shoes"
	desc = "A pair of sleek white polished shoes."
	icon_state = "whitedress"

/obj/item/clothing/shoes/customlaceup
	name = "dress shoes"
	desc = "A pair of customized dress shoes in a tailored color."
	icon_state = "whitedress"

/obj/item/clothing/shoes/aerostatic_boots
	name = "aerostatic boots"
	desc = "A pair of running shoes that are designed with speed in mind, though they don't really make you run faster, they just look quite nice."
	icon_state = "aerostatic_boots"
	can_hold_knife = TRUE

/obj/item/clothing/shoes/render //Armored a bit do to the hide
	name = "lizardskin shoes"
	desc = "A green pair of shoes made of lizardskin, likely a young render..."
	icon_state = "lizardskin_shoes"
	armor_list = list(melee = 5, bullet = 3, energy = 2, bomb = 10, bio = 10, rad = 0)

/obj/item/clothing/shoes/church_blacksilk_boots
	name = "blacksilk boots"
	desc = "A pair of silk boots that is common to see in more faithful places."
	icon_state = "church_blacksilk_boots"
	can_hold_knife = TRUE

/obj/item/clothing/shoes/track_shoes
	name = "running shoes"
	desc = "A pair of light, stripped running shoes. Good for squatting."
	icon_state = "trackshoes_black"

/*High Heels*/

/obj/item/clothing/shoes/highheels
	name = "white high heels"
	desc = "A pair of 'sterile' high heels."
	icon_state = "heels"

/obj/item/clothing/shoes/highheels/red
	name = "red high heels"
	desc = "A pair of vain high heels."
	icon_state = "redheels"

/obj/item/clothing/shoes/highheels/black
	name = "black high heels"
	desc = "A pair of edgy high heels, you suddenly want Kimchi."
	icon_state = "blackheels"

/obj/item/clothing/shoes/highheels/purple
	name = "purple high heels"
	desc = "A pair of luxurious high heels."
	icon_state = "purpleheels"

/obj/item/clothing/shoes/highheels/blue
	name = "blue high heels"
	desc = "Une paire de talons hauts appropriés."
	icon_state = "blueheels"

/*Flats*/

/obj/item/clothing/shoes/flats
	name = "black flats"
	desc = "A pair of sleek black flats."
	icon_state = "flatsblack"
	item_state_slots = list(slot_r_hand_str = "black", slot_l_hand_str = "black")

/obj/item/clothing/shoes/flats/white
	name = "white flats"
	desc = "A pair of shiny white flats."
	icon_state = "flatswhite"
	item_state_slots = list(slot_r_hand_str = "white", slot_l_hand_str = "white")

/obj/item/clothing/shoes/flats/red
	name = "red flats"
	desc = "A pair of ruby red flats."
	icon_state = "flatsred"
	item_state_slots = list(slot_r_hand_str = "red", slot_l_hand_str = "red")

/obj/item/clothing/shoes/flats/purple
	name = "purple flats"
	desc = "A pair of royal purple flats."
	icon_state = "flatspurple"
	item_state_slots = list(slot_r_hand_str = "purple", slot_l_hand_str = "purple")

/obj/item/clothing/shoes/flats/blue
	name = "blue flats"
	desc = "A pair of calming blue flats."
	icon_state = "flatsblue"
	item_state_slots = list(slot_r_hand_str = "blue", slot_l_hand_str = "blue")

/obj/item/clothing/shoes/flats/brown
	name = "brown flats"
	desc = "A pair of sturdy brown flats."
	icon_state = "flatsbrown"
	item_state_slots = list(slot_r_hand_str = "brown", slot_l_hand_str = "brown")

/obj/item/clothing/shoes/flats/orange
	name = "orange flats"
	desc = "A pair of radiant orange flats."
	icon_state = "flatsorange"
	item_state_slots = list(slot_r_hand_str = "orange", slot_l_hand_str = "orange")

/obj/item/clothing/shoes/customflats
	name = "flats"
	desc = "A pair of customized flats in a tailored color."
	icon_state = "flatswhite"
	item_state_slots = list(slot_r_hand_str = "white", slot_l_hand_str = "white")

/*Hitops*/

/obj/item/clothing/shoes/hitops
	name = "white high-tops"
	desc = "A pair of white shoes that extends past the ankle."
	icon_state = "whitehi"

/obj/item/clothing/shoes/hitops/red
	name = "red high-tops"
	desc = "A pair of red shoes that extends past the ankle."
	icon_state = "redhi"

/obj/item/clothing/shoes/hitops/brown
	name = "brown high-tops"
	desc = "A pair of brown shoes that extends past the ankle."
	icon_state = "brownhi"

/obj/item/clothing/shoes/hitops/black
	name = "black high-tops"
	desc = "A pair of black shoes that extends past the ankle."
	icon_state = "blackhi"

/obj/item/clothing/shoes/hitops/orange
	name = "orange high-tops"
	desc = "A pair of orange shoes that extends past the ankle."
	icon_state = "orangehi"

/obj/item/clothing/shoes/hitops/blue
	name = "blue high-tops"
	desc = "A pair of blue shoes that extends past the ankle."
	icon_state = "bluehi"

/obj/item/clothing/shoes/hitops/green
	name = "green high-tops"
	desc = "A pair of green shoes that extends past the ankle."
	icon_state = "greenhi"

/obj/item/clothing/shoes/hitops/purple
	name = "purple high-tops"
	desc = "A pair of purple shoes that extends past the ankle."
	icon_state = "purplehi"

/obj/item/clothing/shoes/hitops/yellow
	name = "yellow high-tops"
	desc = "A pair of yellow shoes that extends past the ankle."
	icon_state = "yellowhi"

/obj/item/clothing/shoes/hitops/pink
	name = "pink high-tops"
	desc = "A pair of pink shoes that extends past the ankle."
	icon_state = "pinkhi"
/obj/item/clothing/shoes/customhitops
	name = "high-tops"
	desc = "A pair of customized high-tops in a tailored color."
	icon_state = "whitehi"
	item_state_slots = list(slot_r_hand_str = "white", slot_l_hand_str = "white")

// These were always identical to hi-tops, these sprites are all now in line with hi tops
// and thus no longer necessary unless someone sprites a different enough sprite to justify them

/*Sneakers
/obj/item/clothing/shoes/sneakers
	name = "purple sneakers"
	desc = "A pair of purple sneaker-style shoes. Drippy!"
	icon_state = "sneakerspurple"

/obj/item/clothing/shoes/sneakers/blue
	name = "blue sneakers"
	desc = "A pair of blue sneaker-style shoes. Drippy!"
	icon_state = "sneakersblue"

/obj/item/clothing/shoes/sneakers/red
	name = "red sneakers"
	desc = "A pair of red sneaker-style shoes. Drippy!"
	icon_state = "sneakersblue"
*/

/*Cowboy*/

/obj/item/clothing/shoes/cowboy
	name = "horseman cowboy boots"
	desc = "A standard pair of cowboy boots."
	icon_state = "cowboy"
	can_hold_knife = TRUE

/obj/item/clothing/shoes/cowboy/classic
	name = "trail cowboy boots"
	desc = "A classic looking pair of durable cowboy boots."
	icon_state = "cowboy_classic"
	can_hold_knife = TRUE

/obj/item/clothing/shoes/cowboy/snakeskin
	name = "snakeskin cowboy boots"
	desc = "A pair of cowboy boots made from python skin."
	icon_state = "cowboy_snakeskin"
	can_hold_knife = TRUE

/*Footwrap*/

/obj/item/clothing/shoes/footwraps
	name = "cloth footwraps"
	desc = "A roll of treated canvas used for wrapping claws or paws."
	icon_state = "clothwrap"

/obj/item/clothing/shoes/footwraps1
	name = "blue footwraps"
	desc = "A roll of treated canvas used for wrapping claws or paws."
	icon_state = "leg-wrap"

/obj/item/clothing/shoes/footwraps2
	name = "red footwraps"
	desc = "A roll of treated canvas used for wrapping claws or paws."
	icon_state = "leg-wrap2"

/obj/item/clothing/shoes/bugsocks
    name = "insect socks"
    desc = "An extra durable set of extremely small and grippy socks. Usually used by the cht'mant to protect their oddly shaped nubs. Much more preferable to standard shoes if not very protective."
    icon_state = "chtman_grippys"

/*Winter Boots*/

/obj/item/clothing/shoes/winter
	name = "winter boots"
	desc = "A pair of furred boots perfect for cold environments."
	icon_state = "winterboots"
	can_hold_knife = TRUE
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/winter/security
	name = "security winter boots"
	desc = "A pair of reinforced winter boots with a security design."
	icon_state = "winterboots_sec"
	can_hold_knife = TRUE
	armor_list = list(melee = 2, bullet = 0, energy = 3, bomb = 20, bio = 0, rad = 0) //Laser?

/obj/item/clothing/shoes/winter/science
	name = "science winter boots"
	desc = "A pair of winter boots with a science design."
	icon_state = "winterboots_sci"
	can_hold_knife = TRUE

/obj/item/clothing/shoes/winter/command
	name = "command winter boots"
	desc = "A pair of winter boots with a command design."
	icon_state = "winterboots_cap"
	can_hold_knife = TRUE

/obj/item/clothing/shoes/winter/engineering
	name = "technomancer winter boots"
	desc = "A pair of winter boots with a technomancer design."
	icon_state = "winterboots_eng"
	can_hold_knife = TRUE

/obj/item/clothing/shoes/winter/atmos
	name = "atmospherics winter boots"
	desc = "A pair of winter boots with a atmospherics design."
	icon_state = "winterboots_atmos"
	can_hold_knife = TRUE

/obj/item/clothing/shoes/winter/medical
	name = "medical winter boots"
	desc = "A pair of winter boots with a medical design."
	icon_state = "winterboots_med"
	can_hold_knife = TRUE

/obj/item/clothing/shoes/winter/mining
	name = "mining winter boots"
	desc = "A pair of winter boots with a mining design."
	icon_state = "winterboots_mining"
	can_hold_knife = TRUE

/obj/item/clothing/shoes/winter/supply
	name = "guild winter boots"
	desc = "A pair of winter boots with a guild design."
	icon_state = "winterboots_sup"
	can_hold_knife = TRUE

/obj/item/clothing/shoes/winter/botany
	name = "botany winter boots"
	desc = "A pair of winter boots with a botany design."
	icon_state = "winterboots_hydro"
	can_hold_knife = TRUE

/obj/item/clothing/shoes/winter/explorer
	name = "explorer boots"
	desc = "A pair of rugged boots designed for hazardous environment exploration."
	icon_state = "explorer"
	can_hold_knife = TRUE
	armor_list = list(melee = 2, bullet = 0, energy = 3, bomb = 20, bio = 0, rad = 0)
