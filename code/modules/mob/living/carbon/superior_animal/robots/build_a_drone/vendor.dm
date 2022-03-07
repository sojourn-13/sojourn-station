// The vendor that allow colonists to buy Build-a-Drones kits.

/obj/machinery/vending/build_a_drone
	name = "Build-a-Drone Kit Vendor"
	desc = "A vendor selling customized drones for a hefty price. All profits goes to the Soteria."
	icon_state = "trashvend"
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
	price_tag = 2000
	matter = list(MATERIAL_STEEL = 10) // Drones cost a lot of steel

/obj/item/build_a_drone_kit/attack_self(mob/user as mob)
	if(build_a_drone(user)) // If the user get their drone
		spawn(10) qdel(src) // Delete the kit
