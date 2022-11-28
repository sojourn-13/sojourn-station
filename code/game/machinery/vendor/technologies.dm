// The vendor that allow colonists to buy Build-a-Drones kits.

/obj/machinery/vending/build_a_drone
	name = "Build-a-Drone Kit Vendor"
	desc = "A vendor selling customized drones for a hefty price. All profits goes to the Soteria."
	icon_state = "wallresearch"
	density = FALSE
	products = list(/obj/item/build_a_drone_kit = 20)
	auto_price = TRUE
	vendor_department = DEPARTMENT_SCIENCE // Soteria get paid for the drones

/obj/item/build_a_drone_kit
	name = "build-a-drone kit"
	desc = "A self-assembling Build-A-Drone kit designed by Soteria's Robotic Division. No refunds."
	icon = 'icons/obj/storage/backpack.dmi'
	icon_state = "radiopack" // Look neat and unused by anything else.
	item_state = "electronic"
	w_class = ITEM_SIZE_BULKY
	price_tag = 800
	matter = list(MATERIAL_STEEL = 10) // Drones cost a lot of steel

/obj/item/build_a_drone_kit/attack_self(mob/user as mob)
	if(build_a_drone(user)) // If the user get their drone
		spawn(10) qdel(src) // Delete the kit

//This one's from bay12
/obj/machinery/vending/cart
	name = "PTech"
	desc = "PDAs and hardware."
	product_slogans = "PDAs for everyone!;You get a PDA! And you get a PDA!;You lost it again?;"
	icon_state = "cart"
	icon_deny = "cart-deny"
	products = list(/obj/item/modular_computer/pda = 10,
					/obj/item/computer_hardware/scanner/medical = 6,
					/obj/item/computer_hardware/scanner/reagent = 6,
					/obj/item/computer_hardware/scanner/atmos = 6,
					/obj/item/computer_hardware/scanner/paper = 10,
					/obj/item/computer_hardware/printer = 10,
					/obj/item/computer_hardware/card_slot = 3,
					/obj/item/computer_hardware/ai_slot = 4,
					/obj/item/computer_hardware/hard_drive/portable/advanced/coin = 10)
	auto_price = FALSE
	give_discounts = FALSE
	give_discount_points = FALSE