//Bartender
/obj/item/clothing/head/rank/chef
	name = "chef's hat"
	desc = "It's a hat used by chefs to keep hair out of your food. Judging by the food in the mess, they don't work."
	icon_state = "chefhat"
	item_state = "chefhat"

//Cargo Tech
/obj/item/clothing/head/rank/cargosoft
	name = "lonestar cap"
	desc = "A grey cap with the Lonestar logo on it."
	icon_state = "cargosoft"

//Captain

/obj/item/clothing/head/rank/captain
	name = "premier's hat"
	icon_state = "captain"  //Sprites from Eris
	desc = "It's good being the king."
	item_state_slots = list(
		slot_l_hand_str = "caphat",
		slot_r_hand_str = "caphat",
		)
	body_parts_covered = 0

/obj/item/clothing/head/rank/captain/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Premier's Hat"] = "captain"
	options["Premier's old Hat"] = "captain-old"
	options["Premier's Cap"] = "capcap"
	options["Parade Hat"] = "officercap"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1


//HOP
/obj/item/clothing/head/rank/first_officer
	name = "steward's cap"
	desc = "A stylish field-cover that both protects you from enraged former-crewmembers and gives you a false sense of authority."
	icon_state = "hopcap"

//Chaplain
/obj/item/clothing/head/rank/chaplain
	name = "chaplain's hood"
	desc = "It's hood that covers the head. It keeps you warm during the space winters."
	icon_state = "chaplain_hood"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/head/preacher
	name = "preacher hat"
	desc = "Useful for hiding disdainful eyes from the godless masses."
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 100, rad = 0)
	icon_state = "church_hat"

/obj/item/clothing/head/preacher/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Primes hat"] = "church_hat"
	options["Primes visor"] = "nt_visor"
	options["Primes trihat"] = "nt_trihat" //credit to Près de l'oiseau on Eris for all of these!
	options["Primes visored trihat"] = "nt_trihat_visor"
	options["Primes mitre"] = "nt_papalhat"
	options["Primes visored mitre"] = "nt_papalhat_visor"
	options["Primes illuminant mitre"] = "nt_papalhat_illuminati"
	options["Primes visored habit"] = "nt_habithat_visor"
	options["Primes masked habit"] = "nt_habithat_mask"
	options["Primes hood"] = "nt_robe_hood"
	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//Mime
/obj/item/clothing/head/beret
	name = "red beret"
	desc = "A formidable red beret."
	icon_state = "beret"
	body_parts_covered = 0

obj/item/clothing/head/beret/syndicate
	name = "syndicate beret"
	desc = "A stylish and comfortable beret, popular amongst members of the Xanoranth syndicate and their many clients."
	icon_state = "syndberet"

obj/item/clothing/head/beret/syndicate/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Xanoranth Beret"] = "syndberet" //credits to Eris for the sprite
	options["Xanoranth Beret alt"] = "syndberet2" //credits to Eris for the sprite

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/beret/artist
	name = "Feathered Beret"
	desc = "Fit for artists, frenchmen, and eccentric military officers across the cosmos."
	icon_state = "beret_artist"
	item_state = "beret_artist"

/obj/item/clothing/head/beret/custom
	name = "Customized beret"
	desc = "An easily colored, plain beret. Classy!"
	icon_state = "beret_whiterim"

//Sprites by Michiyamenotehifunana and Occulist
/obj/item/clothing/head/beret/fashion
	name = "tan beret"
	desc = "A fashionable and colorful beret."
	icon_state = "beret-tan"

/obj/item/clothing/head/beret/fashion/grey
	name = "grey beret"
	icon_state = "beret-grey"

/obj/item/clothing/head/beret/fashion/pink
	name = "pink beret"
	icon_state = "beret-pink"

/obj/item/clothing/head/beret/fashion/red
	name = "red beret"
	icon_state = "beret-red"

/obj/item/clothing/head/beret/fashion/brown
	name = "brown beret"
	icon_state = "beret-brown"

/obj/item/clothing/head/beret/fashion/copper
	name = "copper beret"
	icon_state = "beret-copper"

/obj/item/clothing/head/beret/fashion/orange
	name = "orange beret"
	icon_state = "beret-orange"

/obj/item/clothing/head/beret/fashion/yellow
	name = "yellow beret"
	icon_state = "beret-yellow"

/obj/item/clothing/head/beret/fashion/lime
	name = "lime beret"
	icon_state = "beret-lime"

/obj/item/clothing/head/beret/fashion/cyan
	name = "cyan beret"
	icon_state = "beret-cyan"

/obj/item/clothing/head/beret/fashion/ice
	name = "ice beret"
	icon_state = "beret-ice"

/obj/item/clothing/head/beret/fashion/blue
	name = "blue beret"
	icon_state = "beret-blue"

/obj/item/clothing/head/beret/fashion/purple
	name = "purple beret"
	icon_state = "beret-purple"
//End of sprites by Michiyamenotehifunana and Occulist
//Security
/obj/item/clothing/head/rank/ironhammer
	name = "marshal beret"
	desc = "A stylish beret, this one has markings of the Marshals."
	icon_state = "policeberet"

/obj/item/clothing/head/rank/commander
	name = "warrant officer beret"
	desc = "A grey warrant officer beret signifying a command position."
	icon_state = "beret_navy_hos"

/obj/item/clothing/head/rank/commander/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["WO Beret"] = "beret_navy_hos"
	options["WO Cap"] = "ihc_cap"
	options["WO Default"] = "hoshat"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/rank/warden/beret
	name = "supply specialist beret"
	desc = "A red marshal beret signifying a supply specialist position."
	icon_state = "beret_navy_warden"

/obj/item/clothing/head/rank/janacap //fucking weaboos.
	name = "marshal officers cap"
	desc = "A stylish officers cap. Somewhere between a kepi and peaked officer cap, this style is popular amongst enforcement corps in some region of Solarian space."
	icon_state = "police_cap"

/obj/item/clothing/head/rank/janacap/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Police Cap"] = "police_cap"
	options["Police Cap, feminine"] = "police_cap_f"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1


//engineering
/obj/item/clothing/head/rank/engineering
	name = "adept beret"
	desc = "A yellow beret signifying a guild adept position."
	icon_state = "beret_engineering"

/obj/item/clothing/head/beret/purple
	name = "purple beret"
	desc = "A rather stylish purple beret."
	icon_state = "beret_purple"

/obj/item/clothing/head/beret/black
	name = "black beret"
	desc = "A dark and imposing black beret."
	icon_state = "beretblack"

/obj/item/clothing/head/beret/german
	name = "brown beret"
	desc = "A light brown beret."
	icon_state = "germanberet"

/obj/item/clothing/head/seccap
	name = "blue patrol cap"
	desc = "A blue patrol cap worn by security personnel."
	icon_state = "sec2soft"

/obj/item/clothing/head/seccorp
	name = "black patrol cap"
	desc = "A black patrol cap worn by security personnel."
	icon_state = "corpsoft"

//Medical
/obj/item/clothing/head/surgery
	name = "blue surgical cap"
	desc = "A sterile blue surgical cap for medical operations."
	icon_state = "surgcap_blue"
	flags_inv = BLOCKHEADHAIR|HIDEEARS

/obj/item/clothing/head/surgery/purple
	name = "purple surgical cap"
	desc = "A sterile purple surgical cap for medical operations."
	icon_state = "surgcap_purple"

/obj/item/clothing/head/surgery/green
	name = "green surgical cap"
	desc = "A sterile green surgical cap for medical operations."
	icon_state = "surgcap_green"

/obj/item/clothing/head/rank/trooper/beret //blackshield hats
	name = "blackshield beret"
	desc = "A faded black beret with its old SolFed badge replaced with that of the Blackshield."
	icon_state = "beret_militia"

/obj/item/clothing/head/rank/trooper/beret/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Blackshield Standard"] = "beret_militia"
	options["Olive drab"] = "beret_militia_drab"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your beret's style into [choice] color.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/rank/trooper/cap
	name = "blackshield cap"
	desc = "A faded black cap with the badge of the Blackshield."
	icon_state = "milsoft"

/obj/item/clothing/head/rank/trooper/cap/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Blackshield Colours"] = "milsoft"
	options["Woodlands Blackshield Colours"] = "milsoftgreen"
	options["Jungle Blackshield Colours"] = "milsoftjungle"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/rank/corpsman/cap
	name = "Corpsman cap"
	desc = "A faded black cap with the badge of a Medical Corpsman."
	icon_state = "milsoft"

/obj/item/clothing/head/rank/corpsman/beret
	name = "Corpsman beret"
	desc = "A faded black beret with the badge of a Medical Corpsman."
	icon_state = "corpsman" // New hat, new alt styles. - Seb

/obj/item/clothing/head/rank/corpsman/beret/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Blackshield Standard"] = "corpsman"
	options["Olive drab"] = "corpsman_drab"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your beret's style into [choice] colors.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/rank/armorer/cap
	name = "Sergeant's cap"
	desc = "A faded black cap with the badge of a Blackshield Sergeant."
	icon_state = "milsoft"

/obj/item/clothing/head/rank/armorer/beret
	name = "Sergeant's beret"
	desc = "A faded black beret with the badge of a Blackshield Sergeant."
	icon_state = "sarge_beret"

/obj/item/clothing/head/rank/armorer/beret/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Blackshield Standard"] = "sarge_beret"
	options["Olive drab"] = "sarge_beret_drab"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your beret's style into [choice] colors.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/rank/milcom
	name = "blackshield commander's cap"
	desc = "A crisp peaked cap signifying the distinguished martial position of the Commander of the Blackshield."
	icon_state = "commander_cap"

/obj/item/clothing/head/rank/milcom/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["BC Beret"] = "beret_militia"
	options["BC Cap"] = "commander_cap"
	options["BC Default"] = "hoshat"
	options["Campaign Cover"] = "instructor"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/rank/commanderdress
	name = "Blackshield command cover"
	desc = "A white wheel cover with gold trim, fit for a commander."
	icon_state = "commander_dress"
	item_state = "commander_dress"

/obj/item/clothing/head/rank/trooperdress
	name = "Blackshield cover"
	desc = "A white wheel cover, fit for a soldier."
	icon_state = "trooper_dress"
	item_state = "trooper_dress"

/obj/item/clothing/head/rank/fatigue/green
	name = "green utility cover"
	desc = "A green camo cover, fit for a soldier. The markings of a removed patch linger."
	icon_state = "greenutility"
	item_state = "greenutility"

/obj/item/clothing/head/rank/fatigue
	name = "grey utility cover"
	desc = "A grey camo cover, fit for a soldier. The markings of a removed patch linger."
	icon_state = "greyutility"
	item_state = "greyutility"

/obj/item/clothing/head/rank/fatigue/navy
	name = "navy utility cover"
	desc = "A navy camo cover, fit for a soldier. The markings of a removed patch linger."
	icon_state = "navyutility"
	item_state = "navyutility"

/obj/item/clothing/head/rank/fatigue/tan
	name = "tan utility cover"
	desc = "A tan camo cover, fit for a soldier. The markings of a removed patch linger."
	icon_state = "tanutility"
	item_state = "tanutility"

/obj/item/clothing/head/rank/divisor
	name = "divisor cap"
	desc = "A styled black divisor cap for showing everyone you are so steadfast in the name of god you don't need a helmet."
	icon_state = "divisor_cap"
	item_state = "divisor_cap"

//misc stuff.

/obj/item/clothing/head/rank/solfedmed
	name = "Solarian beret"
	desc = "an old grey-green beret bearing the markings of the Solar Federations fleet, you can almost make out a caduceus against a near worn-off badge."
	armor_list = list(melee = 2, bullet = 0, energy = 2, bomb = 0, bio = 0, rad = 0)
	icon_state = "beret-grey"
	item_state = "beret-grey"

/obj/item/clothing/head/rank/solfedrecon
	name = "green utility cover"
	desc = "A green camo cover, fit for a soldier. This one appears particularly worn down and bears an illegible patch of what seemed to be the Solar Federations armed forces."
	armor_list = list(melee = 2, bullet = 0, energy = 2, bomb = 0, bio = 0, rad = 0)
	icon_state = "greenutility"
	item_state = "greenutility"
