//Items labled as 'trash' for the trash bag.
//TODO: Make this an item var or something...

/obj/item/trash
	name = "trash"
	desc = "This is rubbish."
	icon = 'icons/obj/trash.dmi'
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_PLASTIC = 1)

/obj/item/trash/attack(mob/M, mob/living/user)
	return

/obj/item/trash/raisins
	name = "\improper 4No raisins"
	desc = "An empty packet of raisins. Trash."
	icon_state= "4no_raisins"

/obj/item/trash/candy
	name = "candy bar"
	desc = "An empty candy bar wrapper. Trash."
	icon_state= "candy"

/obj/item/trash/candy/proteinbar
	name = "protein bar"
	desc = "An empty protein bar wrapper. Trash."
	icon_state = "proteinbar"

/obj/item/trash/cheesie
	name = "Cheesie Honkers"
	desc = "An empty packet of chips. Trash."
	icon_state = "cheesie_honkers"

/obj/item/trash/chips
	name = "chips packet"
	desc = "An empty packet of chips. Trash."
	icon_state = "chips"

/obj/item/trash/chips_green
	name = "chips packet"
	desc = "An empty packet of chips. Trash."
	icon_state = "lays_green"

/obj/item/trash/chips
	name = "chips packet"
	desc = "An empty packet of chips. Trash."
	icon_state = "lays"

/obj/item/trash/gamerchips
	name = "boritos crips packet"
	desc = "An empty packet of boritos crips. Trash."
	icon_state = "boritos"

/obj/item/trash/popcorn
	name = "popcorn"
	desc = "An empty packet of popcorn. Trash."
	icon_state = "popcorn"

/obj/item/trash/sosjerky
	name = "Scaredy's Beef Jerky"
	desc = "An empty packet of jerky. Trash."
	icon_state = "sosjerky"

/obj/item/trash/syndi_cakes
	name = "syndi cakes"
	desc = "An empty box of syndi cakes.Trash."
	icon_state = "syndi_cakes"

/obj/item/trash/waffles
	name = "dirty tray"
	desc = "An empty, dirty tray. Trash."
	icon_state = "waffles"

/obj/item/trash/grease
	name = "greasy tray"
	desc = "An empty tray, with stains of something greasy on it. Trash."
	icon_state = "grease"

/obj/item/trash/pistachios
	name = "pistachios pack"
	desc = "An empty packet of pistachios. Trash."
	icon_state = "pistachios_pack"

/obj/item/trash/semki
	name = "semki pack"
	desc = "An empty packet of semki. Trash."
	icon_state = "semki_pack"

/obj/item/trash/plate
	name = "plate"
	desc = "An empty plate."
	icon_state = "plate"
	matter = list(MATERIAL_GLASS = 1)

/obj/item/trash/snack_bowl
	name = "snack bowl"
	desc = "An empty snack bowl."
	icon_state	= "snack_bowl"
	matter = list(MATERIAL_GLASS = 1)

/obj/item/trash/tray
	name = "tray"
	desc = "An empty tray."
	icon_state = "tray"
	matter = list(MATERIAL_STEEL = 1)

/obj/item/trash/candle
	name = "candle"
	desc = "The burnt out remnants of a candle. Trash."
	icon = 'icons/obj/candle.dmi'
	icon_state = "candle4"

/obj/item/trash/liquidfood
	name = "\improper \"LiquidFood\" ration"
	desc = "An empty ration packet. Trash."
	icon_state = "liquidfood"

/obj/item/trash/tastybread
	name = "bread tube"
	desc = "An empty bread tube. Trash."
	icon_state = "tastybread"

/obj/item/trash/mre
	name = "mre"
	icon_state = "mre_trash"

/obj/item/trash/mre/alt
	name = "mre"
	icon_state = "wok"

/obj/item/trash/mre_paste
	name = "nutrient paste"
	icon_state = "paste_trash"

/obj/item/trash/mre_candy
	name = "candy"
	icon_state = "mre_candy_trash"

/obj/item/trash/mre_shokoladka
	name = "shokoladka candy"
	icon_state = "shokoladka"

/obj/item/trash/mre_dalococh
	name = "dalococh candy"
	icon_state = "dalococh"

/obj/item/trash/mre_can
	name = "ration can"
	icon_state = "ration_can_trash"

/obj/item/trash/energybar
	name = "energy candy"
	desc = "An empty packet of energy candy. Trash."
	icon_state= "energybar"

/obj/item/trash/peachcan
	name = "peach can"
	desc = "An empty can of peaches. Trash."
	icon_state= "peachcan"

/obj/item/trash/icecreambowl
	name = "icecream bowl"
	desc = "This used to hold icecream on it, it has even been licked clean!"
	icon_state = "icecreambowl"
	matter = list(MATERIAL_GLASS = 1) // It is, after all, made of glass