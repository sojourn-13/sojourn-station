//Weapon Stashes
//Weapons are quite varied that there are no base items for this stash type
/datum/stash/weapon
	base_type = /datum/stash/weapon
	loot_type = "Weapons"
	contents_list_base = list()
	contents_list_extra = list()
	contents_list_random = list()
	weight = 0.5
	nonmaint_reroll = 95


//Contains boomsticks, ie, shotguns
/datum/stash/weapon/mutiny_boomstick
	story_type = STORY_MUTINY
	directions = DIRECTION_COORDS | DIRECTION_LANDMARK
	contents_list_base = list(/obj/random/gun_shotgun = 2,
	/obj/random/ammo/shotgun = 2, /obj/random/ammo = 2)
	contents_list_random = list(/obj/random/ammo/shotgun = 60,
	/obj/random/ammo = 80,
	/obj/random/ammo = 80,
	/obj/random/ammo = 80,
	/obj/random/ammo = 80,
	/obj/random/ammo = 80,
	/obj/random/gun_cheap = 50,
	/obj/random/gun_cheap = 50,
	/obj/random/gun_shotgun = 50)
	lore = "MUTINY TOMORROW 0300 MEET AT %D <br><br>BRING YOUR OWN BOOMSTICK ONLY A FEW SPARES"

//because this one is styled like a telegram, lets capitalise the directions
/datum/stash/weapon/mutiny_boomstick/create_direction_string(var/data)
	.=..()
	direction_string = capitalize(direction_string)



//Some crewmembers stockpiled anti-synthetic weapons in preparation for overthrowing some mad intelligence
/datum/stash/weapon/mutiny_AI
	story_type = STORY_MALFUNCTION
	lore = "AI ACTING UP. GO HERE, %D BRING OTHERS. RADIO SILENCE."
	contents_list_base = list(/obj/item/gun/energy/ionrifle = 1,
	/obj/item/storage/box/emps = 1,
	/obj/item/clothing/gloves/insulated = 1,
	/obj/item/storage/toolbox/emergency = 1,
	/obj/random/powercell = 4)

	contents_list_random = list(/obj/item/storage/box/explosive = 40,
	/obj/item/tool/fireaxe = 70,
	/obj/item/clothing/gloves/insulated = 50,
	/obj/item/storage/box/emps = 30,
	/obj/item/gun/energy/ionrifle = 70,
	/obj/random/powercell = 70,
	/obj/item/storage/toolbox/emergency = 50,
	/obj/item/clothing/suit/armor/laserproof = 30,
	/obj/item/clothing/suit/armor/laserproof = 30,
	/obj/item/storage/belt/utility/full = 70,
	/obj/item/storage/belt/utility/full = 70)

//Variant of the above with slightly deeper story
/datum/stash/weapon/mutiny_AI/robots

	lore = "THE ROBOTS ARE USING THE INTERCOMM MICROPHONES<br>\
	 okay got it<br>\
 WE HAVE TO STOP THEM<br>\
 got any ideas?<br>\
 FUCK I DON'T KNOW, CUT POWER TO THE AI CORE?<br>\
 sounds good but the core has turrets<br>\
 I CAN PRINT SOME GUNS FOR US<br>\
 we better not be seen together much longer<br>\
 OKAY JUST MEET ME AT %D"




//Crew get mad and mutiny for various reasons. Stockpile a broad variety of weapons and ammo
//There are sooo many mutiny stories
/datum/stash/weapon/mutiny
	story_type = STORY_MUTINY
	contents_list_base = list(/obj/random/gun_cheap = 3,
	/obj/random/ammo = 8,
	/obj/random/cloth/armor = 1)
	contents_list_random = list(/obj/random/gun_normal = 70,
	/obj/random/gun_energy_cheap = 50,
	/obj/random/voidsuit = 70,
	/obj/random/knife = 70,
	/obj/random/knife = 50,
	/obj/random/knife = 60,
	/obj/random/cloth/armor = 60,
	/obj/random/cloth/armor = 60)
	lore = "Logbook:<br>\
	 Half-pay unless we want to be fired? What next, hard biscuit and weevils? I'll choose the lesser of two weevils, black bloody mutiny.<br>\
 To hell with this half-assed council and there lording over us because they were born wearing a powdered wig. A millennium late, you posers.<br>\
 Jellico slipped me this with a wink and a nod. The council wants to play by old rules, settle this with old rules.<br>\
 Meet at %D"


//Another mutiny, a crew enraged by atmospheric failures
/datum/stash/weapon/mutiny/overworked
	contents_list_extra = list(/obj/item/clothing/mask/gas = 3)
	lore = "Logbook:<br>\
	 Engineering has worked for six days in pressure suits with the rest of us packed in the upper colony.<br>\
 It's been far too much of a wait and I just want to get my fucking things and try for living in the wilds of the surface.<br>\
A few people are talking about striking out, just like Jeremiah did. I'm in and we're meeting at %D. Fuck this place. Once we find enough guns, that is."


/datum/stash/weapon/mutiny/warden
	contents_list_extra = list(/obj/random/gun_normal = 3, /obj/random/ammo = 6)
	directions = DIRECTION_IMAGE
	lore = "Commander,<br>\
 You and I both know this rubber buckshot bullshit is going to get us all killed when the convicts realize they outnumber us ten to one.<br>\
 Sarish tells me there's a stash of real heaters wherever the hell this is.<br>\
 Crazy bitch sends a picture instead of a fucking coordinate. %D"



/datum/stash/weapon/mutiny/starvation
 	//Make sure there's a shotgun with slugs in the stash, as described in the text.
 	//Also the wardens were hoarding food
 	contents_list_extra = list(/obj/random/gun_shotgun = 1, /obj/item/ammo_magazine/ammobox/shotgun = 1, /obj/random/rations = 6)
 	lore = "I'm getting really tired of putting up with the day to day shit.<br>\
 Plan B is to shoot troublemakers until the people we brig start acting nice.<br>\
 Just keep it semi-justifiable, don't leave any slugs in the walls, and stick the lethals back at %D when you're done.<br>\
 Can't have the marshals find out we're breaking those precious regulations."

