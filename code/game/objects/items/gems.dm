// Sprites are a courtesy of ma9ici4n. https://ma9ici4n.itch.io/gems
/obj/item/gem
	name = "giant gem"
	desc = "As pretty as it is expensive, a great way to flaunt your wealth."
	icon = 'icons/obj/gems.dmi'
	var/color_list = list("cyan", "purple", "green", "dark", "amber", "blue", "red")
	var/gem_color
	price_tag = 1000000 // It is costly
	density = 1 // It is big
	w_class = ITEM_SIZE_COLOSSAL // it is *big*

/obj/item/gem/New()
	..()
	gem_color = pick(color_list)
	icon_state = "[gem_color]"
	name = "[color] [initial(name)]"
