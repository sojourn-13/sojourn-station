/datum/trade_station/cybermoebus
	name_pool = list("FTS 'PentaOptium'" = "Free Trade Station 'PentaOptium'. \"Oh, you, I think I can sell you some cybernetics.\"")
	offer_amout_devider_of_wanted_goods = 5 //less items wanted, do to being implants
	assortiment = list(
		"Soteria" = list(
			/obj/item/organ/external/robotic/moebius/l_arm,
			/obj/item/organ/external/robotic/moebius/r_arm,
			/obj/item/organ/external/robotic/moebius/l_leg,
			/obj/item/organ/external/robotic/moebius/r_leg,
			/obj/item/organ/external/robotic/moebius/groin
		),
		"Salvaged Greyson Tech" = list(
			/obj/item/organ/external/robotic/one_star/l_arm,
			/obj/item/organ/external/robotic/one_star/r_arm,
			/obj/item/organ/external/robotic/one_star/l_leg,
			/obj/item/organ/external/robotic/one_star/r_leg
		),
		"Artificer Guild" = list(
			/obj/item/organ/external/robotic/technomancer/l_arm,
			/obj/item/organ/external/robotic/technomancer/r_arm,
			/obj/item/organ/external/robotic/technomancer/l_leg,
			/obj/item/organ/external/robotic/technomancer/r_leg
		),
		"H&S" = list(
			/obj/item/organ/external/robotic/frozen_star/l_arm,
			/obj/item/organ/external/robotic/frozen_star/r_arm,
			/obj/item/organ/external/robotic/frozen_star/l_leg,
			/obj/item/organ/external/robotic/frozen_star/r_leg
		),
		"Voidwolf" = list(
			/obj/item/organ/external/robotic/serbian/l_arm,
			/obj/item/organ/external/robotic/serbian/r_arm,
			/obj/item/organ/external/robotic/serbian/l_leg,
			/obj/item/organ/external/robotic/serbian/r_leg
		),
		"Blackmarket Blackshield" = list(
			/obj/item/organ/external/robotic/blackshield/l_arm,
			/obj/item/organ/external/robotic/blackshield/r_arm,
			/obj/item/organ/external/robotic/blackshield/l_leg,
			/obj/item/organ/external/robotic/blackshield/r_leg
		),
	)

	offer_types = list(
		/obj/item/organ_module/active/simple/armblade,
		/obj/item/organ_module/active/simple/armsmg,
		/obj/item/organ_module/active/simple/armshield,
		/obj/item/organ_module/active/simple/engineer,
		/obj/item/organ_module/active/hud/med,
		/obj/item/organ_module/active/hud/sec,
		/obj/item/organ_module/active/hud/night,
		/obj/item/organ_module/active/hud/thermal,
		/obj/item/organ_module/active/hud/welder,
		/obj/item/organ_module/active/multitool,
		/obj/item/organ_module/active/simple/surgical,
		/obj/item/organ_module/active/simple/taser
	)

/obj/item/organ/external/robotic/moebius
	price_tag = 450 //Has plasteel

/obj/item/organ/external/robotic/blackshield
	price_tag = 750 //Has blackmarket

/obj/item/organ/external/robotic/one_star
	price_tag = 1250 //Has legit the best in the game

/obj/item/organ/external/robotic/technomancer
	price_tag = 375 //basic

/obj/item/organ/external/robotic/serbian
	price_tag = 375 //basic

/obj/item/organ/external/robotic/frozen_star
	price_tag = 375 //basic
