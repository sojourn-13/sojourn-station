
//Kinda gross, and not at all modular.
/obj/structure/storage
	name = "Storage Unit"
	desc = "A small locker that has a shelf."
	icon = 'icons/obj/storage.dmi'
	icon_state = "small_locker"
	var/obj/item/storage/internal/structure/loot	//the visible loot
	var/loot_storage_space = 40
	var/loot_size_max_for_storage_space = ITEM_SIZE_HUGE
	var/obj/item/storage/internal/structure/loot_two
	var/loot_slot_space = 7
	var/loot_size_max_for_slot_space = ITEM_SIZE_SMALL
	var/loaded = FALSE
	density = FALSE
	anchored = TRUE
	layer = TABLE_LAYER

/obj/item/storage/internal/structure
	var/obj/structure/storage/OSS

/obj/item/storage/internal/structure/Destroy()
	OSS = null
	. = ..()

/obj/item/storage/internal/structure/New(obj/item/MI)
	..()
	if(master_item)
		OSS = master_item

/obj/structure/storage/New()

	if(!loaded)
		loot = new(src)
		loot.max_storage_space = loot_storage_space
		loot.max_w_class = loot_size_max_for_storage_space
		loot.change_relativePositionY = 22
		loot.allow_mulitable_storage = TRUE


		loot_two = new(src)
		loot_two.storage_slots = loot_slot_space
		loot_two.max_w_class = loot_size_max_for_slot_space
		loot_two.allow_mulitable_storage = 2
		loot_two.change_relativePositionY = 56
		loaded = TRUE


/obj/structure/storage/attack_hand(mob/user)

	if(loaded)
		if(user.s_active)
			if(user.s_active != loot && user.s_active != loot_two)
				user.s_active.close(user)

		loot.open(user)
		loot_two.open(user)
	..()

/obj/structure/storage/attackby(obj/item/W as obj, mob/user as mob)
	..()
	attack_hand(user)

/obj/structure/storage/proc/relay(mob/user)
	loot.close(user, looped = TRUE)
	loot_two.close(user, looped = TRUE)
	//and so on


/obj/item/storage/internal/structure/close(mob/user, looped = FALSE)
	..()
	if(OSS && !looped)
		OSS.relay(user)
