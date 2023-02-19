/obj/item/voucher
	name = "\improper voucher"
	desc = "A token to redeem... something."
	icon = 'icons/obj/voucher.dmi'
	icon_state = "voucher"
	w_class = ITEM_SIZE_TINY
	var/stamped = FALSE //used by the voucher vender to be an anti-cheat

// Blackshield
/obj/item/voucher/blackshield
	name = "blackshield voucher"
	desc = "A token to redeem Blackshield equipment from a vendor."
	icon_state = "voucher"
	var/voucher_type // The type of equipment the voucher redeem

/obj/item/voucher/blackshield/primary
	name = "\improper blackshield primary weapon voucher"
	desc = "A token to redeem Blackshield equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "Primary"

/obj/item/voucher/blackshield/sargprimary
	name = "\improper sergeant weapon voucher"
	desc = "A token to redeem sergeant equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "SargPrimary"

/obj/item/voucher/blackshield/corpsprimary
	name = "\improper corpsperson weapon voucher"
	desc = "A token to redeem corpsperson equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "CorpsPrimary"

/obj/item/voucher/blackshield/secondary
	name = "\improper blackshield secondary weapon voucher"
	desc = "A token to redeem Blackshield equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "Secondary"

/obj/item/voucher/blackshield/COsecondary
	name = "\improper Blackshield Commander secondary weapon voucher"
	desc = "A token to redeem Blackshield equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "COSecondary"

/obj/item/voucher/blackshield/armor
	name = "\improper blackshield armor voucher"
	desc = "A token to redeem Blackshield equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "Armor"

/obj/item/voucher/blackshield/armorcorpsman
	name = "\improper corpsman armor voucher"
	desc = "A token to redeem corpsman equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "CorpsmanArmor"

// Marshal
/obj/item/voucher/marshal
	name = "marshal voucher"
	desc = "A token to redeem marshal equipment from a vendor."
	icon_state = "voucher"
	var/voucher_type // The type of equipment the voucher redeem

/obj/item/voucher/marshal/primary
	name = "\improper marshal primary weapon voucher"
	desc = "A token to redeem marshal equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "Primary"

/obj/item/voucher/marshal/specprimary
	name = "\improper Specialist primary weapon voucher"
	desc = "A token to redeem marshal equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "SpecPrimary"

/obj/item/voucher/marshal/rangerprimary
	name = "Ranger primary weapon voucher"
	desc = "A token to redeem marshal equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "RangerPrimary"

/obj/item/voucher/marshal/secondary
	name = "\improper marshal secondary weapon voucher"
	desc = "A token to redeem marshal equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "Secondary"

/obj/item/voucher/marshal/rangersecondary
	name = "Ranger secondary weapon voucher"
	desc = "A token to redeem marshal equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "RangerSecondary"

/obj/item/voucher/marshal/wosecondary
	name = "Warrant Officer secondary weapon voucher"
	desc = "A token to redeem marshal equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "WOSecondary"

/obj/item/voucher/marshal/armor
	name = "\improper marshal armor voucher"
	desc = "A token to redeem marshal equipment from a vendor."
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

/obj/item/storage/box/blackshield_voucher_corps
	name = "\improper blackshield voucher box"
	desc = "A box full of vouchers."

	populate_contents()
		new /obj/item/voucher/blackshield/primary(src)
		new /obj/item/voucher/blackshield/secondary(src)
		new /obj/item/voucher/blackshield/armorcorpsman(src)

/obj/item/storage/box/blackshield_voucher_sarg
	name = "\improper blackshield voucher box"
	desc = "A box full of vouchers."

	populate_contents()
		new /obj/item/voucher/blackshield/sargprimary(src)
		new /obj/item/voucher/blackshield/secondary(src)
		new /obj/item/voucher/blackshield/armor(src)

/obj/item/storage/box/marshal_voucher
	name = "\improper marshal voucher box"
	desc = "A box full of vouchers."

	populate_contents()
		new /obj/item/voucher/marshal/primary(src)
		new /obj/item/voucher/marshal/secondary(src)
		new /obj/item/voucher/marshal/armor(src)
