 //Nanites
/datum/chemical_reaction/arad
	result = "arad nanites"
	required_reagents = list("nanites" = 1, "arithrazine" = 1)
	result_amount = 1

/datum/chemical_reaction/implant_medics
	result = "implant nanites"
	required_reagents = list("nanites" = 1, "aluminum" = 1)
	result_amount = 1

/datum/chemical_reaction/nantidotes
	result = "nantidotes"
	required_reagents = list("nanites" = 1, "haloperidol" = 1)
	result_amount = 1

/datum/chemical_reaction/nanosymbiotes
	result = "nanosymbiotes"
	required_reagents = list("nanites" = 1, "peridaxon" = 1)
	result_amount = 1

/datum/chemical_reaction/oxyrush
	result = "oxyrush"
	required_reagents = list("nanites" = 1, "dexalin" = 1)
	result_amount = 1

/datum/chemical_reaction/trauma_control_system
	result = "trauma_control_system"
	required_reagents = list("nanites" = 1, "bicaridine" = 1)
	result_amount = 1

/datum/chemical_reaction/nanopurgers
	result = "nanopurgers"
	required_reagents = list("nanites" = 1, "synaptizine" = 1)
	result_amount = 1

/datum/chemical_reaction/cbu
	result = "cbu"
	required_reagents = list("uncap nanites" = 1, "party drops" = 1)
	result_amount = 1

/datum/chemical_reaction/cbc
	result = "cbc"
	required_reagents = list("uncap nanites" = 1, "menace" = 1)
	result_amount = 1

/datum/chemical_reaction/nanohands
	result = "nanohands"
	required_reagents = list("uncap nanites" = 1, "nanohands" = 1)
	result_amount = 1

/datum/chemical_reaction/nanovoice
	result = "nanovoice"
	required_reagents = list("uncap nanites" = 1, "synaptizine" = 1)
	result_amount = 1

/* Paint */

/datum/chemical_reaction/red_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "crayon_dust_red" = 1)
	result_amount = 5

/datum/chemical_reaction/red_paint/send_data()
	return "#FE191A"

/datum/chemical_reaction/orange_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "crayon_dust_orange" = 1)
	result_amount = 5

/datum/chemical_reaction/orange_paint/send_data()
	return "#FFBE4F"

/datum/chemical_reaction/yellow_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "crayon_dust_yellow" = 1)
	result_amount = 5

/datum/chemical_reaction/yellow_paint/send_data()
	return "#FDFE7D"

/datum/chemical_reaction/green_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "crayon_dust_green" = 1)
	result_amount = 5

/datum/chemical_reaction/green_paint/send_data()
	return "#18A31A"

/datum/chemical_reaction/blue_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "crayon_dust_blue" = 1)
	result_amount = 5

/datum/chemical_reaction/blue_paint/send_data()
	return "#247CFF"

/datum/chemical_reaction/purple_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "crayon_dust_purple" = 1)
	result_amount = 5

/datum/chemical_reaction/purple_paint/send_data()
	return "#CC0099"

/datum/chemical_reaction/grey_paint //mime
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "crayon_dust_grey" = 1)
	result_amount = 5

/datum/chemical_reaction/grey_paint/send_data()
	return "#808080"

/datum/chemical_reaction/brown_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "crayon_dust_brown" = 1)
	result_amount = 5

/datum/chemical_reaction/brown_paint/send_data()
	return "#846F35"

/datum/chemical_reaction/blood_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "blood" = 2)
	result_amount = 5

/datum/chemical_reaction/blood_paint/send_data(var/datum/reagents/T)
	var/t = T.get_data("blood")
	if(t && t["blood_colour"])
		return t["blood_colour"]
	return "#FE191A" // Probably red

/datum/chemical_reaction/milk_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "milk" = 5)
	result_amount = 5

/datum/chemical_reaction/milk_paint/send_data()
	return "#F0F8FF"

/datum/chemical_reaction/orange_juice_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "orangejuice" = 5)
	result_amount = 5

/datum/chemical_reaction/orange_juice_paint/send_data()
	return "#E78108"

/datum/chemical_reaction/tomato_juice_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "tomatojuice" = 5)
	result_amount = 5

/datum/chemical_reaction/tomato_juice_paint/send_data()
	return "#731008"

/datum/chemical_reaction/lime_juice_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "limejuice" = 5)
	result_amount = 5

/datum/chemical_reaction/lime_juice_paint/send_data()
	return "#365E30"

/datum/chemical_reaction/carrot_juice_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "carrotjuice" = 5)
	result_amount = 5

/datum/chemical_reaction/carrot_juice_paint/send_data()
	return "#973800"

/datum/chemical_reaction/berry_juice_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "berryjuice" = 5)
	result_amount = 5

/datum/chemical_reaction/berry_juice_paint/send_data()
	return "#990066"

/datum/chemical_reaction/grape_juice_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "grapejuice" = 5)
	result_amount = 5

/datum/chemical_reaction/grape_juice_paint/send_data()
	return "#863333"

/datum/chemical_reaction/poisonberry_juice_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "poisonberryjuice" = 5)
	result_amount = 5

/datum/chemical_reaction/poisonberry_juice_paint/send_data()
	return "#863353"

/datum/chemical_reaction/watermelon_juice_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "watermelonjuice" = 5)
	result_amount = 5

/datum/chemical_reaction/watermelon_juice_paint/send_data()
	return "#B83333"

/datum/chemical_reaction/lemon_juice_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "lemonjuice" = 5)
	result_amount = 5

/datum/chemical_reaction/lemon_juice_paint/send_data()
	return "#AFAF00"

/datum/chemical_reaction/banana_juice_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "banana" = 5)
	result_amount = 5

/datum/chemical_reaction/banana_juice_paint/send_data()
	return "#C3AF00"

/datum/chemical_reaction/potato_juice_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "potato" = 5)
	result_amount = 5

/datum/chemical_reaction/potato_juice_paint/send_data()
	return "#302000"

/datum/chemical_reaction/carbon_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "carbon" = 1)
	result_amount = 5

/datum/chemical_reaction/carbon_paint/send_data()
	return "#333333"

/datum/chemical_reaction/aluminum_paint
	result = "paint"
	required_reagents = list("plasticide" = 1, "water" = 3, "aluminum" = 1)
	result_amount = 5

/datum/chemical_reaction/aluminum_paint/send_data()
	return "#F0F8FF"