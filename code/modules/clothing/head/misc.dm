/*Flower Pins*/

/obj/item/clothing/head/hairflower
	name = "red flower pin"
	icon_state = "hairflower"
	desc = "A hair flower pin. It smells nice."
	slot_flags = SLOT_HEAD | SLOT_EARS
	body_parts_covered = 0

/obj/item/clothing/head/hairflower/blue
	icon_state = "hairflower_blue"
	name = "blue flower pin"

/obj/item/clothing/head/hairflower/pink
	icon_state = "hairflower_pink"
	name = "pink flower pin"

/obj/item/clothing/head/hairflower/yellow
	icon_state = "hairflower_yellow"
	name = "yellow flower pin"

/obj/item/clothing/head/hairflower/violet
	icon_state = "hairflower_violet"
	name = "violet flower pin"

/obj/item/clothing/head/hairflower/orange
	icon_state = "hairflower_orange"
	name = "orange flower pin"

/obj/item/clothing/head/hairflower/white
	icon_state = "hairflower_white"
	name = "white flower pin"

/*Top Hats*/

/obj/item/clothing/head/tophat
	name = "black top hat"
	desc = "A standard top hat in a classic black design."
	icon_state = "tophat"
	item_state = "tophat"
	siemens_coefficient = 0.9
	body_parts_covered = 0

/obj/item/clothing/head/tophat/purple
	name = "mulberry top hat"
	desc = "An elegant top hat in a distinctive purple color."
	icon_state = "ptophat"
	item_state = "ptophat"

/obj/item/clothing/head/tophat/beaverhat
	name = "beaver top hat"
	icon_state = "beaver_hat"
	item_state = "beaver_hat"
	desc = "A blue top hat made out of comfortable beaver pelt."

/*Bandanas*/

/obj/item/clothing/head/bandana/green
	name = "green bandana"
	desc = "A green bandana fashioned from a piece of cloth."
	icon_state = "greenbandana"
	item_state = "greenbandana"
	flags_inv = 0
	body_parts_covered = 0

/obj/item/clothing/head/bandana/orange //themij: Taryn Kifer
	name = "orange bandana"
	desc = "An orange bandana fashioned from a piece of cloth."
	icon_state = "orange_bandana"
	body_parts_covered = 0

/obj/item/clothing/head/bandana
	name = "red bandana"
	desc = "A red bandana fashioned from a piece of cloth."
	icon_state = "bandana"
	flags_inv = BLOCKHEADHAIR

/*Bowler Hats*/

/obj/item/clothing/head/bowler/bowlerclassic
	name = "classic bowler hat"
	desc = "A black felt hat with a rounded crown."
	icon_state = "bowler"
	body_parts_covered = 0

/obj/item/clothing/head/bowler/bowlerbasil
	name = "basil bowler hat"
	desc = "A black felt hat with a rounded crown and green stripe."
	icon_state = "bowlergreen"
	body_parts_covered = 0

/obj/item/clothing/head/bowler
	name = "banded bowler hat"
	icon_state = "bowler_hat"
	desc = "A black felt hat with a rounded crown and white stripe."
	body_parts_covered = 0

/*Cowboy Hats*/

/obj/item/clothing/head/cowboy
	name = "rancher cowboy hat"
	icon_state = "cowboyrancher"
	desc = "A straw cowboy hat with a high tipped brim."

/obj/item/clothing/head/cowboy/desperado
	name = "desperado cowboy hat"
	icon_state = "cowboydesperado"
	desc = "A black leather cowboy hat with a tipped brim."

/obj/item/clothing/head/cowboy/journeyman
	name = "journeyman cowboy hat"
	icon_state = "cowboygambler"
	desc = "A brown straw cowboy hat with a weathered shape."

/obj/item/clothing/head/cowboy/marshal
	name = "marshal cowboy hat"
	icon_state = "cowboymarshal"
	desc = "A brown felt cowboy hat with a long flat brim."

/obj/item/clothing/head/cowboy/shootist
	name = "shootist cowboy hat"
	icon_state = "cowboyshootist"
	desc = "A black leather cowboy hat with a long flat brim."

/obj/item/clothing/head/cowboy/wrangler
	name = "wrangler cowboy hat"
	desc = "A tan felt cowboy hat with a high tipped brim."
	icon_state = "cowboyhat"
	body_parts_covered = 0

/obj/item/clothing/head/cowboy/bandit
	name = "bandit cowboy hat"
	desc = "A black leather cowboy hat with a long tipped brim."
	icon_state = "cowboy_black"

/obj/item/clothing/head/cowboy/longhorn
	name = "longhorn cowboy hat"
	desc = "A brown felt cowboy hat with a very long brim."
	icon_state = "cowboy_wide"

/obj/item/clothing/head/cowboy/greenhorn
	name = "greenhorn cowboy hat"
	desc = "A small brown felt cowboy hat for tiny gunslingers."
	icon_state = "cowboy_small"

/obj/item/clothing/head/cowboy/frontiersman
	name = "frontiersman cowboy hat"
	desc = "A rugged dark felt hat worn with a green leather hood."
	icon_state = "stormchaser"

/*Fedoras*/

/obj/item/clothing/head/fedora
	name = "black fedora"
	icon_state = "fedora"
	desc = "A black felt fedora with a sharp brim."

/obj/item/clothing/head/fedora/brown
	name = "brown fedora"
	icon_state = "detectiveold"
	desc = "A soft brown felt fedora."

/obj/item/clothing/head/fedora/grey
	name = "grey fedora"
	icon_state = "detective2"
	desc = "A soft grey felt fedora."

/obj/item/clothing/head/fedora/feathered
	name = "feather fedora"
	icon_state = "feather_trilby"
	desc = "A dark blue felt fedora with a classy white feather."

/*Misc*/

/obj/item/clothing/head/rank/centcomm
	name = "\improper CentComm. hat"
	icon_state = "centcom"
	item_state_slots = list(
		slot_l_hand_str = "centhat",
		slot_r_hand_str = "centhat",
		)
	desc = "It's good to be emperor."
	siemens_coefficient = 0.9
	body_parts_covered = 0

/obj/item/clothing/head/sombrero
	name = "sombrero"
	desc = "You can practically taste the fiesta."
	icon_state = "sombrero"
	item_state = "sombrero"
	flags_inv = BLOCKHAIR

/obj/item/clothing/head/fez
	name = "fez"
	icon_state = "fez"
	desc = "A conical red hat in prime oriental fashion."

/obj/item/clothing/head/boaterhat
	name = "boater hat"
	icon_state = "boater_hat"
	desc = "A formal beige summer hat."

/obj/item/clothing/head/flatcap
	name = "flat cap"
	desc = "A rugged and reliable working cap."
	icon_state = "flat_cap"
	item_state_slots = list(
		slot_l_hand_str = "det_hat",
		slot_r_hand_str = "det_hat",
		)
	siemens_coefficient = 0.9

/obj/item/clothing/head/bearpelt
	name = "bear pelt hat"
	desc = "Fuzzy."
	icon_state = "bearpelt"
	flags_inv = BLOCKHEADHAIR
	siemens_coefficient = 0.7

/obj/item/clothing/head/turban
	name = "turban"
	desc = "A cloth designed to be worn around the head."
	icon_state = "turban"
	body_parts_covered = 0
	flags_inv = BLOCKHAIR

/obj/item/clothing/head/rice_hat
	name = "rice hat"
	desc = "A hat made out of straw, designed to keep the sun from hurting your face."
	icon_state = "rice_hat"