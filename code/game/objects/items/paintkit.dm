/obj/item/device/kit
	icon_state = "modkit"
	icon = 'icons/obj/device.dmi'
	var/new_name = "mech"    //What is the variant called?
	var/new_desc = "A mech." //How is the new mech described?
	var/new_icon = "ripley"  //What base icon will the new mech use?
	var/new_icon_file
	var/uses = 1        // Uses before the kit deletes itself.

/obj/item/device/kit/examine()
	..()
	to_chat(usr, "It has [uses] [uses>1?"uses":"use"] left.")

/obj/item/device/kit/proc/use(var/amt, var/mob/user)
	uses -= amt
	playsound(get_turf(user), 'sound/items/Screwdriver.ogg', 50, 1)
	if(uses<1)
		user.drop_item()
		qdel(src)

// Root hardsuit kit defines.
// Icons for modified hardsuits need to be in the proper .dmis because suit cyclers may cock them up.
/obj/item/device/kit/suit
	name = "voidsuit modification kit"
	desc = "A kit for modifying a voidsuit."
	uses = 2
	var/new_light_overlay
	var/new_mob_icon_file

/obj/item/clothing/head/helmet/space/void/attackby(var/obj/item/O, var/mob/user)
	if(istype(O,/obj/item/device/kit/suit))
		var/obj/item/device/kit/suit/kit = O
		name = "[kit.new_name] suit helmet"
		desc = kit.new_desc
		icon_state = "[kit.new_icon]_helmet"
		item_state = "[kit.new_icon]_helmet"
		if(kit.new_icon_file)
			icon = kit.new_icon_file
		if(kit.new_mob_icon_file)
			icon_override = kit.new_mob_icon_file
		if(kit.new_light_overlay)
			light_overlay = kit.new_light_overlay
		to_chat(user, "You set about modifying the helmet into [src].")
		var/mob/living/carbon/human/H = user
		if(istype(H))
			species_restricted = list(H.species.get_bodytype())
		kit.use(1,user)
		return 1
	return ..()

/obj/item/clothing/suit/space/void/attackby(var/obj/item/O, var/mob/user)
	if(istype(O,/obj/item/device/kit/suit))
		var/obj/item/device/kit/suit/kit = O
		name = "[kit.new_name] voidsuit"
		desc = kit.new_desc
		icon_state = "[kit.new_icon]_suit"
		item_state = "[kit.new_icon]_suit"
		if(kit.new_icon_file)
			icon = kit.new_icon_file
		if(kit.new_mob_icon_file)
			icon_override = kit.new_mob_icon_file
		to_chat(user, "You set about modifying the suit into [src].")
		var/mob/living/carbon/human/H = user
		if(istype(H))
			species_restricted = list(H.species.get_bodytype())
		kit.use(1,user)
		return 1
	return ..()

/obj/item/device/kit/paint
	name = "mecha customization kit"
	desc = "A kit containing all the needed tools and parts to repaint a mech."
	var/removable = null
	var/list/allowed_types = list()

/obj/item/device/kit/paint/examine()
	..()
	to_chat(usr, "This kit will convert an exosuit into: [new_name].")
	to_chat(usr, "This kit can be used on the following exosuit models:")
	for(var/exotype in allowed_types)
		to_chat(usr, "- [capitalize(exotype)]")

/obj/mecha/attackby(var/obj/item/W, var/mob/user)
	if(istype(W, /obj/item/device/kit/paint))
		if(occupant)
			to_chat(user, "You can't customize a mech while someone is piloting it - that would be unsafe!")
			return

		var/obj/item/device/kit/paint/P = W
		var/found = null

		for(var/type in P.allowed_types)
			if(type==src.initial_icon)
				found = 1
				break

		if(!found)
			to_chat(user, "That kit isn't meant for use on this class of exosuit.")
			return

		user.visible_message("[user] opens [P] and spends some quality time customising [src].")
		src.name = P.new_name
		src.desc = P.new_desc
		src.initial_icon = P.new_icon
		if(P.new_icon_file)
			src.icon = P.new_icon_file
		update_icon()
		P.use(1, user)
		return 1
	else
		return ..()

//Ripley APLU kits.
/obj/item/device/kit/paint/ripley
	name = "\"Classic\" APLU customization kit"
	new_name = "APLU \"Classic\""
	new_desc = "A very retro APLU unit; didn't they retire these back in 2543?"
	new_icon = "ripley-old"
	allowed_types = list("ripley","firefighter")

/obj/item/device/kit/paint/ripley/death
	name = "\"Reaper\" APLU customization kit"
	new_name = "APLU \"Reaper\""
	new_desc = "A terrifying, grim power loader. Why do those clamps have spikes?"
	new_icon = "deathripley"

/obj/item/device/kit/paint/ripley/flames_red
	name = "\"Firestarter\" APLU customization kit"
	new_name = "APLU \"Firestarter\""
	new_desc = "A standard APLU exosuit with stylish orange flame decals."
	new_icon = "ripley_flames_red"

/obj/item/device/kit/paint/ripley/flames_blue
	name = "\"Burning Chrome\" APLU customization kit"
	new_name = "APLU \"Burning Chrome\""
	new_desc = "A standard APLU exosuit with stylish blue flame decals."
	new_icon = "ripley_flames_blue"

/obj/item/device/kit/paint/ripley/syndieripley
	name = "\"Syndie\" APLU customization kit"
	new_name = "Syndicate APLU"
	new_desc = "An APLU exosuit painted in Syndicate red."
	new_icon = "syndieripley"

/obj/item/device/kit/paint/ripley/titan
	name = "\"Titan\" APLU customization kit"
	new_name = "\"Titan\" APLU"
	new_desc = "A standard APLU exosuit decorated with skull decal and power arm."
	new_icon = "titan"

/obj/item/device/kit/paint/ripley/glass
	name = "\"Glass Tank\" APLU customization kit"
	new_name = "\"Glass Tank\" APLU"
	new_desc = "A standard APLU exosuit with an opaque reinforced glass panel replacing the usual front."
	new_icon = "ripley_glass"

/obj/item/device/kit/paint/ripley/orange_box
	name = "\"Orange Box\" APLU customization kit"
	new_name = "\"Orange Box\" APLU"
	new_desc = "A standard APLU exosuit with an orange coat of paint and blue visor."
	new_icon = "hivisripley"

/obj/item/device/kit/paint/ripley/orange_box
	name = "\"War Boy\" APLU customization kit"
	new_name = "\"War Boy\" APLU"
	new_desc = "A standard APLU exosuit painted entirely chrome. To Valhalla!"
	new_icon = "aluminizer"

/obj/item/device/kit/paint/ripley/ripley_zairjah
	name = "\"Zairjah\" APLU customization kit"
	new_name = "\"Zairjah\" APLU"
	new_desc = "A standard APLU exosuit painted gray, with a drill arm and opaque glass cockpit cover. The best of the best model for mining."
	new_icon = "ripley_zairjah"

/obj/item/device/kit/paint/ripley/combatripley
	name = "\"Zarudo\" APLU customization kit"
	new_name = "\"Zarudo\" APLU"
	new_desc = "A fancy APLU exosuit paint job consisting of blue chrome and glowing red lights, perfect for pretending to be a combat mech."
	new_icon = "combatripley"

/obj/item/device/kit/paint/ripley/flathead
	name = "\"Flathead\" APLU customization kit"
	new_name = "\"Flathead\" APLU"
	new_desc = "A fancy APLU exosuit paint job which adds a fancier head to any Ripley."
	new_icon_file = 'icons/mecha/mecha40.dmi'
	new_icon = "flathead"

//Clark models
/obj/item/device/kit/paint/ripley/clark
	name = "\"Clark\" APLU customization kit"
	new_name = "\"Clark\" APLU"
	new_desc = "A highly modified APLU exosuit featuring tread based movement and a more robotic appearence."
	new_icon = "clarke"

/obj/item/device/kit/paint/ripley/clark_orange
	name = "\"Clarkstruction\" APLU customization kit"
	new_name = "\"Clarkstruction\" APLU"
	new_desc = "A highly modified APLU exosuit featuring tread based movement and a more robotic appearence. This one has an orange construction paint job."
	new_icon = "orangey"

/obj/item/device/kit/paint/ripley/clark_veteran
	name = "\"Veteran\" APLU customization kit"
	new_name = "\"Veteran\" APLU"
	new_desc = "A highly modified APLU exosuit featuring tread based movement and a more robotic appearence. A fake metal spider head and aged paint job gives this one the look of a veteran spider crusher."
	new_icon = "veteranclarke"

/obj/item/device/kit/paint/ripley/clark_spider
	name = "\"Spider\" APLU customization kit"
	new_name = "\"Spider\" APLU"
	new_desc = "A highly modified APLU exosuit featuring tread based movement and a more robotic appearence. Someones idea of a good joke, but the metal spider head barely resembles a real giant spider."
	new_icon = "spiderclarke"

//Ivan kits.
/obj/item/device/kit/paint/rust_ivan
	name = "\"Rust\" Ivan customization kit"
	new_name = "Ivan \"Rust\""
	new_desc = "An old Ivan exosuit, rusted after spending Absolute-knows how long in a pile of trash."
	new_icon = "ivan-rust"
	allowed_types = list("ivan")

/obj/item/device/kit/paint/utility_ivan
	name = "\"Utility\" Ivan customization kit"
	new_name = "APLU \"Ivan\" Utility Vehicle"
	new_desc = "The Ivan, while worse in almost every way when compared to the much more used Ripley, has at least the advantage of being simple and cheap to make. This one seems to be painted in high-visibility paint."
	new_icon = "ivan-utility"
	allowed_types = list("ivan")

//Odysseus kits.
/obj/item/device/kit/paint/odysseus
	name = "\"Medgax\" Odysseus customization kit"
	new_name = "Odysseus \"Medgax\""
	new_desc = "An Odysseus mech outfitted to look like a gygax. For when you outfit your medical mech with guns, healing and slaughter are not exclusive after all."
	new_icon = "medgax"
	allowed_types = list("odysseus")

/obj/item/device/kit/paint/odysseus/blue_racer
	name = "\"Blue Speedracer\" Odysseus customization kit"
	new_name = "Odysseus \"Blue Speedracer\""
	new_desc = "An Odysseus mech painted blue with red racing stripes. Mech go vroom vroom!"
	new_icon = "paramed"

/obj/item/device/kit/paint/odysseus/yellow_racer
	name = "\"Yellow Speedracer\" Odysseus customization kit"
	new_name = "Odysseus \"Yellow Speedracer\""
	new_desc = "An Odysseus mech painted yellow with red racing stripes. Mech go vroom vroom!"
	new_icon = "urinetrouble"

/obj/item/device/kit/paint/odysseus/murderody
	name = "\"Malpractice\" Odysseus customization kit"
	new_name = "Odysseus \"Malpractice\""
	new_desc = "An Odysseus mech given a foreboding black and red paint job with spikes that menace."
	new_icon = "murdysseus"

/obj/item/device/kit/paint/odysseus/hermes
	name = "\"Hermes\" Odysseus customization kit"
	new_name = "Odysseus \"Hermes\""
	new_desc = "An Odysseus mech from an ancient design, clunky and age-worn in appearance, but still a classic in some places."
	new_icon = "hermes"

/obj/item/device/kit/paint/odysseus/mime
	name = "\"Mask Golem\" Odysseus customization kit"
	new_name = "Odysseus \"Mask Golem\""
	new_desc = "An Odysseus mech modeled after the silent thespians of old, sadly not as quiet as said thespians."
	new_icon = "mime"

// Durand kits.
/obj/item/device/kit/paint/durand
	name = "\"Classic\" Durand customization kit"
	new_name = "Durand \"Classic\""
	new_desc = "An older model of Durand combat exosuit. This model was retired for rotating a pilot's torso 180 degrees."
	new_icon = "old_durand"
	allowed_types = list("durand")

/obj/item/device/kit/paint/durand/seraph
	name = "\"Cherubim\" Durand customization kit"
	new_name = "Durand \"Cherubim\""
	new_desc = "A Durand combat exosuit modeled after ancient Earth entertainment. Your heart goes doki-doki just looking at it."
	new_icon = "seraph"

/obj/item/device/kit/paint/durand/phazon
	name = "\"Sypher\" Durand customization kit"
	new_name = "Durand \"Sypher\""
	new_desc = "A Durand combat exosuit with some very stylish neons and decals. Seems to blur slightly at the edges; probably an optical illusion."
	new_icon = "phazon"

/obj/item/device/kit/paint/durand/gator
	name = "\"Gator\" Durand customization kit"
	new_name = "Durand \"Gator\""
	new_desc = "A Durand combat exosuit with an ugly green paint job. Who thought this looked good?"
	new_icon = "gator"

/obj/item/device/kit/paint/durand/dollhouse
	name = "\"Dollhouse\" Durand customization kit"
	new_name = "Durand \"Dollhouse\""
	new_desc = "A Durand combat exosuit that appears to be a top heavy armored tank. Glory to the motherland."
	new_icon = "dollhouse"

// Gygax kits.
/obj/item/device/kit/paint/gygax
	name = "\"Jester\" Gygax customization kit"
	new_name = "Gygax \"Jester\""
	new_desc = "A Gygax exosuit modeled after the infamous combat-troubadours of Earth's distant past. Terrifying to behold."
	new_icon = "honker"
	allowed_types = list("gygax")

/obj/item/device/kit/paint/gygax/darkgygax
	name = "\"Silhouette\" Gygax customization kit"
	new_name = "Gygax \"Silhouette\""
	new_desc = "An ominous Gygax exosuit modeled after the fictional corporate 'death squads' that were popular in pulp action-thrillers back in 2554."
	new_icon = "darkgygax"

/obj/item/device/kit/paint/gygax/darkgygax_old
	name = "\"Shade\" Gygax customization kit"
	new_name = "Gygax \"Shade\""
	new_desc = "An ominous classic Gygax exosuit modeled after the fictional corporate 'death squads' that were popular in pulp action-thrillers back in 2554."
	new_icon = "darkgygax_old"

/obj/item/device/kit/paint/gygax/recitence
	name = "\"Gaoler\" Gygax customization kit"
	new_name = "Gygax \"Gaoler\""
	new_desc = "A bulky silver Gygax exosuit. The extra armor appears to be painted on, but it's very shiny."
	new_icon = "reticence"

/obj/item/device/kit/paint/gygax/classic
	name = "\"Classic\" Gygax customization kit"
	new_name = "Gygax \"Classic\""
	new_desc = "Can't beat a classic Gygax. Wasn't this model discontinued in 2543?"
	new_icon = "gygax_old"

/obj/item/device/kit/paint/gygax/pobeda
	name = "\"Pobeda\" Gygax customization kit"
	new_name = "Gygax \"Pobeda\""
	new_desc = "A long since decommissioned model of Gygax known as the Pobeda, featuring an old military design."
	new_icon = "pobeda"

//Phazon kits.
/obj/item/device/kit/paint/phazon
	name = "\"Ghost\" Phazon customization kit"
	new_name = "Phazon \"Ghost\""
	new_desc = "A Phazon exosuit painted silver to appear more ghost-like."
	new_icon = "phazon_blanco"
	allowed_types = list("phazon")

/obj/item/device/kit/paint/phazon/plazmus
	name = "\"Plazmus\" Phazon customization kit"
	new_name = "Phazon \"Plazmus\""
	new_desc = "A Phazon exosuit painted dark purple with a neon green trim. Ability to curl into a ball not included."
	new_icon = "plazmus"

/obj/item/device/kit/paint/phazon/imperion
	name = "\"Imperion\" Phazon customization kit"
	new_name = "Phazon \"Imperion\""
	new_desc = "A Phazon exosuit painted black with a pink neon trim. RGB keyboard included on the inside."
	new_icon = "imperion"

/obj/item/device/kit/paint/phazon/janus
	name = "\"Janus\" Phazon customization kit"
	new_name = "Phazon \"Janus\""
	new_desc = "A Phazon exosuit painted with a gray gradient and multiple neon colored lighting. Is this cyberpunk enough?"
	new_icon = "janus"

// ADMINSPAWN ONLY
/obj/item/device/kit/paint/phazon/skullmech
	name = "\"Bone 'Ead\" Phazon customization kit"
	new_name = "Phazon \"Bone 'Ead\""
	new_desc = "A Phazon exosuit outfitted with bones to appear more menacing. Why would anyone do this?"
	new_icon = "skullmech"
