// Most sprites here can be attributed to scar#1579 who provided either the sprite itself or the base sprite.
/obj/item/animal_part
	name = "animal part"
	desc = "A chunk of an animal taken from the body during the butchering process. How the fuck did you find this?"
	icon = 'icons/obj/animal_parts.dmi'
	icon_state = "pigrat_snout"
	item_state = "pigrat_snout"
	w_class = ITEM_SIZE_SMALL
	price_tag = 100

/obj/item/animal_part/tatonka_tongue
	name = "tatonka tongue"
	desc = "A tatanka tongue, harvested from a creature of the same name. Useful in medicine and prized for its various purposes."
	icon_state = "brahmin_tongue"
	item_state = "brahmin_tongue"

/obj/item/animal_part/tatonka_horn
	name = "tatonka horn"
	desc = "A tatanka horn, harvested from a creature of the same name. Useful in medicine and prized for its various purposes."
	icon_state = "brahmin_horn"
	item_state = "brahmin_horn"

/obj/item/animal_part/tangu_horn
	name = "tangu horn"
	desc = "A tangu horn, harvested from a creature of the same name. One of the most valuable parts produced by this particular breed of animal, capable of creating a quite potent medicine."
	icon_state = "brahmiluff_horn"
	item_state = "brahmiluff_horn"

/obj/item/animal_part/clucker_feather
	name = "clucker feather"
	desc = "A clucker feather, while not that appetizing it can be ground into a low quality painkiller."
	icon_state = "clucker_feather"
	item_state = "clucker_feather"

/obj/item/animal_part/slepnir_hoof
	name = "slepnir hoof"
	desc = "The hoof of a slepnir, capable of being turned into a combat stimulant or if you need to repair your tools quality tape."
	icon_state = "slepnir_hoof"
	item_state = "slepnir_hoof"
	price_tag = 2000 //standardization with the other tengolo evolution drops.

/obj/item/animal_part/cerberus_snout
	name = "cerberus snout"
	desc = "The snout of a cerberus, the loyal animals bred by the hunting lodge as companions and hunting aids. Surely the animal this belonged to died in glorious battle, you didn't heartlessly butcher it did you?"
	icon_state = "pigrat_snout"
	item_state = "pigrat_snout"

/obj/item/animal_part/helldiver_tooth
	name = "hell diver tooth"
	desc = "A tooth from a fallen feral hell diver. While not particularly useful it does sell for quite a bit as a collector's item to kriosan jaegers who desire them for artwork involving scrimshaw."
	icon_state = "molerat_tooth"
	item_state = "molerat_tooth"
	price_tag = 1000

/obj/item/animal_part/chimera_fang
	name = "chimera fang"
	desc = "The fang of a chimera, a valuable item for both its potential sale value to various collectors and for its use as an innate oddity, if treated right by someone capable of scrimshaw and a sharp blade."
	icon_state = "nightstalker_tooth"
	item_state = "nightstalker_tooth"
	price_tag = 3000

/obj/item/animal_part/render_claw
	name = "render claw"
	desc = "A hand of a primal render, severed and sickly green without blood flowing through it. Its deadly sharp claws could be useful, if you know how to weaponize it."
	icon_state = "gecko_claw"
	item_state = "gecko_claw"

/obj/item/animal_part/tahca_antler
	name = "tahca antler"
	desc = "The antler of a tahca, valued for its decorative appearance and for creating a universal anti-viral to prevent or even cure infections."
	icon_state = "radstag_antler"
	item_state = "radstag_antler"
	price_tag = 1000

/obj/item/animal_part/wolf_tooth
	name = "pristine animal fang"
	desc = "A rather generic animal fang from something predatory. While not that useful its small size and value in the kriosan market make it worthwhile to collect and export."
	icon_state = "wolf_tooth"
	item_state = "wolf_tooth"
	price_tag = 300
	w_class = ITEM_SIZE_TINY

// End of scar#1579's sprites.

/obj/item/animal_part/stalker_chitin //todo sprite
	name = "chitinous femur"
	desc = "A chitinous bone-like length of exoskeleton cut from a nightmare stalker. Chameleonic properties appear to be inert with the stalker's death, however, it might still be useful for making flexible and bendy things."
	icon_state = "nightstalker_tooth"
	item_state = "nightstalker_tooth"
	price_tag = 600

/obj/item/animal_part/stalker_spur
	name = "chitinous spur"
	desc = "A long sharp spur typically found at the end of a nightmare stalkers 'leg'. Incredibly durable, it could likely be fashioned into any number of weapons. "
	icon_state = "nightstalker_spur" //holy coder-sprite batman. This needs replacing eventually.
	item_state = "nightstalker_spur"
	price_tag = 600

/obj/item/animal_part/carp_fang
	name = "mephitic fang"
	desc = "The venom gland and fang from a particularly large carp. Some claim that such highly concentrated venom can be processed into a tincture used to treat internal injury albeit at the cost of ingesting carpotoxin."
	icon_state = "carp_tooth"
	item_state = "carp_tooth"
	price_tag = 300

/obj/item/animal_part/sarg_horn
	name = "sargoyle horn"
	desc = "A small, hollow horn attached to the head of a sargoyle. Decently sturdy, these normally ugly things can be polished to a gorgeous glossy finish making them well prized as decoration for weaponry."
	icon_state = "sarg_horn" //more fugly coder sprites. These at least have some credit to the creator of the Brahmiluf horns since i modified those to create this icon.
	item_state = "sarg_horn"
	price_tag = 200

//start of the dok hunter arc
/obj/item/animal_part/croaker_tongue
	name = "croaker lord tongue"
	desc = "A hulking tongue of a venerable Croaker Lord. A tool used by the Lord to hunt the various pest that encroached its domain. Even now trying to pull your hand away too fast from it causes it to grip to you like a vise."
	icon_state = "croaker_tongue"
	item_state = "croaker_tongue"
	price_tag = 2000 //i kinda just eyeballed this cause its def rarer than a tahca antler but maybe not chimera fangs? idk

/obj/item/animal_part/emperor_silk_gland
	name = "imperial silk gland"
	desc = "The abdomen carefully extracted from a fallen Emperor spider leaving its silk gland intact. The silk from an Emperor spider is regarded as some of the strongest and finest ever seen but only very little can be extracted from each emperor.."
	icon_state = "emperor_silk"
	item_state = "emperor_silk"
	price_tag = 1000

/obj/item/animal_part/kingly_pheromone_gland
	name = "kingly silk gland"
	desc = "The pheromone control center of the kaiser roaches, engorged from the sheer gigantism that created such a leviathan. If only you could fashion it in some way you could probably managed to pass by roaches even call them to your aid."
	icon_state = "kingly_pheromone"
	item_state = "kingly_pheromone"
	price_tag = 2000 //theres only like 2 of them guarenteed to spawn on the map and ones balls deep in colony maint so with how rare they are its not likely to get more than one turned in by hunters.

/obj/item/animal_part/hell_hide
	name= "Hell Hide"
	desc = "The Skinned hide from a berserk Hell Pig. Just holding it causes your blood to boil; if you were to treat it, it could make some incredible armor."
	icon_state = "hell_hide"
	item_state = "hell_hide"
	price_tag = 2000 //as far as i know there are no guarenteed spawns of any of the tengolo evolutions so i feel the rarity merits the price.

/obj/item/animal_part/cannibal_tooth
	name = "cannibal tooth"
	desc = "The tooth ripped from the maw of a slain Wendigo, its malformed ferocity chills your bones even now."
	icon_state = "cannibal_tooth"
	item_state = "cannibal_tooth"
	price_tag = 2000
