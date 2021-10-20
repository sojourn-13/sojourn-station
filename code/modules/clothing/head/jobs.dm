//Bartender
/obj/item/clothing/head/rank/chef
	name = "chef's hat"
	desc = "It's a hat used by chefs to keep hair out of your food. Judging by the food in the mess, they don't work."
	icon_state = "chefhat"
	item_state = "chefhat"

//Captain

/obj/item/clothing/head/rank/captain
	name = "premier's hat"
	icon_state = "captain"
	desc = "It's good being the king."
	item_state_slots = list(
		slot_l_hand_str = "caphat",
		slot_r_hand_str = "caphat",
		)
	body_parts_covered = 0

/obj/item/clothing/head/rank/captain/cap
	name = "premier's cap"
	desc = "You fear to wear it for the negligence it brings."
	icon_state = "capcap"


/obj/item/clothing/head/rank/captain/formal
	name = "parade hat"
	desc = "No one in a commanding position should be without a perfect, white hat of ultimate authority."
	icon_state = "officercap"

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
	icon_state = "church_hat"

//Mime
/obj/item/clothing/head/beret
	name = "red beret"
	desc = "A formidable red beret."
	icon_state = "beret"
	body_parts_covered = 0

/obj/item/clothing/head/beret/artist
	name = "Feathered Beret"
	desc = "Fit for artists, frenchmen, and eccentric military officers across the cosmos."
	icon_state = "beret_artist"
	item_state = "beret_artist"

/obj/item/clothing/head/beret/custom
	name = "Customized beret"
	desc = "An easily colored, plain beret. Classy!"
	icon_state = "beret_whiterim"

//Security
/obj/item/clothing/head/rank/ironhammer
	name = "marshal beret"
	desc = "A navy blue marshal beret."
	icon_state = "policeberet"

/obj/item/clothing/head/rank/commander/beret
	name = "warrant officer beret"
	desc = "A grey warrant officer beret signifying a command position."
	icon_state = "beret_navy_hos"

/obj/item/clothing/head/rank/commander/cap
	name = "warrant officer cap"
	desc = "A marshal cap signifying a command position."
	icon_state = "ihc_cap"

/obj/item/clothing/head/rank/warden/beret
	name = "supply specialist beret"
	desc = "A red marshal beret signifying a supply specialist position."
	icon_state = "beret_navy_warden"

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
	icon_state = "beretblack"

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
	flags_inv = BLOCKHEADHAIR

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

/obj/item/clothing/head/rank/trooper/cap
	name = "blackshield cap"
	desc = "A faded black cap with the badge of the Blackshield."
	icon_state = "milsoft"

/obj/item/clothing/head/rank/trooper/radiohat
	name = "blackshield radio cap"
	desc = "A faded black cap with the badge of the Blackshield. Comes attached with a industrial radio headset for long-range communiction."
	icon_state = "radiohat"

/obj/item/clothing/head/rank/corpsman/cap
	name = "Corpsman cap"
	desc = "A faded black cap with the badge of a Medical Corpsman."
	icon_state = "milsoft"

/obj/item/clothing/head/rank/corpsman/beret
	name = "Corpsman beret"
	desc = "A faded black beret with the badge of a Medical Corpsman."
	icon_state = "beret_militia"

/obj/item/clothing/head/rank/armorer/cap
	name = "Sergeant's cap"
	desc = "A faded black cap with the badge of a Blackshield Sergeant."
	icon_state = "milsoft"

/obj/item/clothing/head/rank/armorer/beret
	name = "Sergeant's beret"
	desc = "A faded black beret with the badge of a Blackshield Sergeant."
	icon_state = "beret_militia"

/obj/item/clothing/head/rank/milcom/beret
	name = "blackshield commander's beret"
	desc = "A faded black beret with its old SolFed badge replaced with that of the Blackshield Commander."
	icon_state = "beret_militia"

/obj/item/clothing/head/rank/milcom
	name = "blackshield commander's cap"
	desc = "A crisp peaked cap signifying the distinguished martial position of the Commander of the Blackshield."
	icon_state = "commander_cap"

/obj/item/clothing/head/rank/instructor_hat
	name = "campaign cover"
	desc = "Mama, mama, can't you see what this Corps has done to me?"
	icon_state = "instructor"

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

/obj/item/clothing/head/rank/fatigue/grey
	name = "grey utility cover"
	desc = "A grey camo cover, fit for a soldier. The markings of a removed patch linger."
	icon_state = "greyutility"
	item_state = "greyutility"

/obj/item/clothing/head/rank/fatigue/navy
	name = "navy utility cover"
	desc = "A navy camo cover, fit for a soldier. The markings of a removed patch linger."
	icon_state = "navyutility"
	item_state = "navyutility"

/obj/item/clothing/head/rank/divisor
	name = "divisor cap"
	desc = "A styled black divisor cap for showing everyone you are so steadfast in the name of god you don't need a helmet."
	icon_state = "divisor_cap"
	item_state = "divisor_cap"