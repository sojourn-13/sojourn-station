/obj/item/voucher
	name = "\improper voucher"
	desc = "A token to redeem... something."
	icon = 'icons/obj/voucher.dmi'
	icon_state = "voucher"
	w_class = ITEM_SIZE_TINY

/obj/item/voucher/blackshield
	name = "blackshield voucher"
	desc = "A token to redeem blackshield equipment from a vendor."
	icon_state = "voucher"
	var/voucher_type // The type of equipment the voucher redeem

/obj/item/voucher/blackshield/primary
	name = "\improper blackshield primary weapon voucher"
	desc = "A token to redeem blackshield equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "Primary"

/obj/item/voucher/blackshield/secondary
	name = "\improper blackshield secondary weapon voucher"
	desc = "A token to redeem blackshield equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "Secondary"

/obj/item/voucher/blackshield/armor
	name = "\improper blackshield armor voucher"
	desc = "A token to redeem blackshield equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "Armor"

// Voucher Box.
/obj/item/storage/box/blackshield_voucher
	name = "\improper blackshield voucher box"
	desc = "A box full of vouchers."

	populate_contents()
		new /obj/item/voucher/blackshield/primary(src)
		new /obj/item/voucher/blackshield/secondary(src)
		new /obj/item/voucher/blackshield/armor(src)
