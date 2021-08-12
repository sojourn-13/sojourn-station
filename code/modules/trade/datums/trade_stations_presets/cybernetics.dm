/datum/trade_station/cybermoebus
	name_pool = list("FTS 'PentaOptium'" = "Free Trade Station 'PentaOptium'. \"Oh, you, I think I can sell you some cybernetics.\"")
	assortiment = list(
		"Soteria" = list(
			/obj/item/organ/external/robotic/moebius/l_arm = custom_good_name("\"Soteria\" Arm Left"),
			/obj/item/organ/external/robotic/moebius/r_arm = custom_good_name("\"Soteria\" Arm Right"),
			/obj/item/organ/external/robotic/moebius/l_leg = custom_good_name("\"Soteria\" Leg Left"),
			/obj/item/organ/external/robotic/moebius/r_leg = custom_good_name("\"Soteria\" Leg Right"),
			/obj/item/organ/external/robotic/moebius/groin = custom_good_name("\"Soteria\" Lower Body")
		),
		"Salvaged Greyson Tech" = list(
			/obj/item/organ/external/robotic/one_star/l_arm = custom_good_name("Greyson Arm Left"),
			/obj/item/organ/external/robotic/one_star/r_arm = custom_good_name("Greyson Arm Right"),
			/obj/item/organ/external/robotic/one_star/l_leg = custom_good_name("Greyson Leg Left"),
			/obj/item/organ/external/robotic/one_star/r_leg = custom_good_name("Greyson Leg Right")
		),
		"Artificer Guild" = list(
			/obj/item/organ/external/robotic/technomancer/l_arm = custom_good_name("Artificer Guild \"Homebrew\" Arm Left"),
			/obj/item/organ/external/robotic/technomancer/r_arm = custom_good_name("Artificer Guild \"Homebrew\" Arm Right"),
			/obj/item/organ/external/robotic/technomancer/l_leg = custom_good_name("Artificer Guild \"Homebrew\" Leg Left"),
			/obj/item/organ/external/robotic/technomancer/r_leg = custom_good_name("Artificer Guild \"Homebrew\" Leg Right")
		),
		"H&S" = list(
			/obj/item/organ/external/robotic/frozen_star/l_arm = custom_good_name("\"H&S Augments\" Arm Left"),
			/obj/item/organ/external/robotic/frozen_star/r_arm = custom_good_name("\"H&S Augments\" Arm Right"),
			/obj/item/organ/external/robotic/frozen_star/l_leg = custom_good_name("\"H&S Augments\" Leg Left"),
			/obj/item/organ/external/robotic/frozen_star/r_leg = custom_good_name("\"H&S Augments\" Leg Right")
		),
		"Voidwolf" = list(
			/obj/item/organ/external/robotic/serbian/l_arm = custom_good_name("\"Voidwolf Arms\" Arm Left"),
			/obj/item/organ/external/robotic/serbian/r_arm = custom_good_name("\"Voidwolf Arms\" Arm Right"),
			/obj/item/organ/external/robotic/serbian/l_leg = custom_good_name("\"Voidwolf Arms\" Leg Left"),
			/obj/item/organ/external/robotic/serbian/r_leg = custom_good_name("\"Voidwolf Arms\" Leg Right")
		),
		"Blackmarket Blackshield" = list(
			/obj/item/organ/external/robotic/blackshield/l_arm = custom_good_name("\"Blackshield\" Arm Left"),
			/obj/item/organ/external/robotic/blackshield/r_arm = custom_good_name("\"Blackshield\" Arm Right"),
			/obj/item/organ/external/robotic/blackshield/l_leg = custom_good_name("\"Blackshield\" Leg Left"),
			/obj/item/organ/external/robotic/blackshield/r_leg = custom_good_name("\"Blackshield\" Leg Right")
		),
	)

	offer_types = list(
		/obj/item/organ_module/active/simple/armblade,
		/obj/item/organ_module/active/simple/armsmg,
		//obj/item/organ_module/active/simple/armshield,
		/obj/item/organ_module/active/simple/engineer,
		/obj/item/organ_module/active/hud/med,
		/obj/item/organ_module/active/hud/sec,
		/obj/item/organ_module/active/hud/night,
		/obj/item/organ_module/active/hud/thermal,
		/obj/item/organ_module/active/hud/welder,
		/obj/item/organ_module/active/multitool,
		/obj/item/organ_module/active/simple/surgical
		//obj/item/organ_module/active/simple/taser
	)

