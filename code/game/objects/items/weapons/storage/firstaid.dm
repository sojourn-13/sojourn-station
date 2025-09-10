/* First aid storage
 * Contains:
 *		First Aid Kits
 * 		Pill Bottles
 *		Portable Freezer
 */

/*
 * First Aid Kits
 */
/obj/item/storage/firstaid
	name = "first-aid kit"
	desc = "It's an emergency medical kit for those serious boo-boos."
	icon_state = "firstaid"
	throw_speed = 2
	throw_range = 8
	matter = list(MATERIAL_PLASTIC = 5)
	max_storage_space = 10
	price_tag = 200
	var/empty = FALSE

/obj/item/storage/firstaid/regular
	icon_state = "firstaid"

/obj/item/storage/firstaid/regular/empty
	empty = TRUE

/obj/item/storage/firstaid/regular/populate_contents()
	if (empty) return
	new /obj/item/stack/medical/bruise_pack(src)
	new /obj/item/stack/medical/bruise_pack(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_containers/hypospray/autoinjector(src)
	new /obj/item/device/scanner/health(src)

/obj/item/storage/firstaid/regular/si
	name = "soteria branded first-aid kit"
	desc = "A soteria-branded emergency medical kit for those serious boo-boos. Contains more advanced and more expensive gauze and salves."
	icon_state = "purplefirstaid"
	item_state = "firstaid-purplefirstaid"

/obj/item/storage/firstaid/regular/si/empty
	empty = TRUE

/obj/item/storage/firstaid/regular/si/populate_contents()
	if (empty) return
	new /obj/item/stack/medical/bruise_pack/soteria(src)
	new /obj/item/stack/medical/bruise_pack/soteria(src)
	new /obj/item/stack/medical/ointment/soteria(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_containers/hypospray/autoinjector(src)
	new /obj/item/device/scanner/health(src)


/obj/item/storage/firstaid/fire
	name = "fire first-aid kit"
	desc = "It's an emergency medical kit for when the toxins lab <i>-spontaneously-</i> burns down."
	icon_state = "ointment"
	item_state = "firstaid-ointment"

/obj/item/storage/firstaid/fire/empty
	empty = TRUE

/obj/item/storage/firstaid/fire/populate_contents()
	icon_state = pick("ointment","firefirstaid")

	if (empty) return
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/reagent_containers/pill/kelotane(src)
	new /obj/item/reagent_containers/pill/kelotane(src)
	new /obj/item/reagent_containers/pill/kelotane(src) //Replaced ointment with these since they actually work --Errorage
	new /obj/item/reagent_containers/hypospray/autoinjector(src)
	new /obj/item/device/scanner/health(src)

/obj/item/storage/firstaid/outsider
	name = "scavenged kit"
	desc = "It's an medical kit made from plastic and put together with a few useful scavenged chemicals."
	icon_state = "outsider"

/obj/item/storage/firstaid/outsider/populate_contents()
	if (empty) return
	new /obj/item/stack/medical/bruise_pack(src)
	new /obj/item/stack/medical/bruise_pack(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/spaceacillin(src)
	new /obj/item/reagent_containers/hypospray/autoinjector(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/antitoxin(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/tricordrazine(src)

/obj/item/storage/firstaid/toxin
	name = "toxin first aid"
	desc = "Used to treat those nasty spider bites."
	icon_state = "antitoxin"
	item_state = "firstaid-toxin"

/obj/item/storage/firstaid/toxin/empty
	empty = TRUE

/obj/item/storage/firstaid/toxin/populate_contents()
	icon_state = pick("antitoxin","antitoxfirstaid2","antitoxfirstaid3")

	if (empty) return
	new /obj/item/reagent_containers/syringe/antitoxin(src)
	new /obj/item/reagent_containers/syringe/antitoxin(src)
	new /obj/item/reagent_containers/syringe/antitoxin(src)
	new /obj/item/reagent_containers/pill/antitox(src)
	new /obj/item/reagent_containers/pill/antitox(src)
	new /obj/item/reagent_containers/pill/antitox(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/antitoxin(src)
	new /obj/item/device/scanner/health(src)


/obj/item/storage/firstaid/o2
	name = "oxygen deprivation first aid"
	desc = "A box full of oxygen goodies."
	icon_state = "o2"
	item_state = "firstaid-o2"

/obj/item/storage/firstaid/o2/empty
	empty = TRUE

/obj/item/storage/firstaid/o2/populate_contents()
	if (empty) return
	new /obj/item/reagent_containers/pill/dexalin(src)
	new /obj/item/reagent_containers/pill/dexalin(src)
	new /obj/item/reagent_containers/pill/dexalin(src)
	new /obj/item/reagent_containers/pill/dexalin(src)
	new /obj/item/reagent_containers/hypospray/autoinjector(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/quickclot(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/sanguinum(src)
	new /obj/item/reagent_containers/syringe/inaprovaline(src)
	new /obj/item/device/scanner/health(src)


/obj/item/storage/firstaid/adv
	name = "advanced first-aid kit"
	desc = "Contains advanced medical treatments."
	icon_state = "advfirstaid"
	item_state = "firstaid-advanced"

/obj/item/storage/firstaid/adv/empty
	empty = TRUE

/obj/item/storage/firstaid/adv/populate_contents()
	if (empty) return
	new /obj/item/stack/medical/bruise_pack/advanced(src)
	new /obj/item/stack/medical/bruise_pack/advanced(src)
	new /obj/item/stack/medical/ointment/advanced(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_containers/syringe/inaprovaline(src)
	new /obj/item/device/scanner/health(src)

/obj/item/storage/firstaid/radiation
	name = "radiation first-aid kit"
	desc = "It's a basic first aid kit for handling radiation exposure."
	icon_state = "radfirstaid"

/obj/item/storage/firstaid/radiation/empty
	empty = TRUE

/obj/item/storage/firstaid/radiation/populate_contents()
	if (empty) return
	new /obj/item/reagent_containers/hypospray/autoinjector/antirad(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/antirad(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/antirad(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/device/scanner/health(src)

/obj/item/storage/firstaid/combat
	name = "combat medical kit"
	desc = "Contains advanced medical treatments."
	icon_state = "bezerk"
	item_state = "bezerk"

/obj/item/storage/firstaid/combat/populate_contents()
	if (empty) return
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/dermaline(src)
	new /obj/item/storage/pill_bottle/dexalin_plus(src)
	new /obj/item/storage/pill_bottle/carthatoline(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/spaceacillin(src)
	new /obj/item/storage/pill_bottle/bloodregen(src)
	new /obj/item/stack/medical/splint(src)

/obj/item/storage/firstaid/surgery
	name = "surgery kit"
	desc = "Contains tools for surgery. Has precise foam fitting for safe transport."
	icon_state = "surgeon"
	item_state = "firstaid-surgeon"
	max_storage_space = null // We have to null storage space so that it has the exact number of slots defined on storage_slots.
	storage_slots = 10 // Enough for the tools it holds, and not one more.
	max_w_class = ITEM_SIZE_NORMAL // Average size of the tools it can hold.
	matter = list(MATERIAL_PLASTIC = 10) //holds more
	can_hold = list(
		/obj/item/tool/bonesetter,
		/obj/item/tool/cautery,
		/obj/item/tool/saw/circular,
		/obj/item/tool/hemostat,
		/obj/item/tool/retractor,
		/obj/item/tool/scalpel,
		/obj/item/tool/tape_roll/bonegel,
		/obj/item/tool/surgicaldrill,
		/obj/item/device/scanner,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/reagent_containers/syringe,
		/obj/item/tool/medmultitool,
		/obj/item/tool/tape_roll
		)

// make_exact_fit() completely ruins the can_hold list,
// and makes it not accept any of the items it does not come pre-populated with.
// Please never use this proc on these containers.

/obj/item/storage/firstaid/surgery/populate_contents()
	if (empty) return
	new /obj/item/tool/bonesetter(src)
	new /obj/item/tool/cautery(src)
	new /obj/item/tool/saw/circular(src)
	new /obj/item/tool/hemostat(src)
	new /obj/item/tool/retractor(src)
	new /obj/item/tool/scalpel(src)
	new /obj/item/tool/tape_roll/bonegel(src)
	new /obj/item/tool/surgicaldrill(src)
	new /obj/item/stack/medical/bruise_pack/advanced(src)
	new /obj/item/tool/tape_roll/fiber/medical(src)

/obj/item/storage/firstaid/surgery/traitor
	name = "conspicuous surgery kit"
	icon_state = "surgeon_sus"
	item_state = "combat_surgery_kit"
	storage_slots = 13 // Fits all the tools it comes with
	matter = list(MATERIAL_PLASTIC = 12) // More slots

/obj/item/storage/firstaid/surgery/traitor/populate_contents()
	if (empty) return
	new /obj/item/tool/bonesetter(src)
	new /obj/item/tool/cautery(src)
	new /obj/item/tool/saw/circular/advanced(src)
	new /obj/item/tool/hemostat(src)
	new /obj/item/tool/retractor(src)
	new /obj/item/tool/scalpel/advanced(src)
	new /obj/item/tool/tape_roll/bonegel(src)
	new /obj/item/device/scanner/health(src)
	new /obj/item/tool/surgicaldrill/adv(src)
	new /obj/item/stack/medical/bruise_pack/advanced(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/tool/tape_roll/fiber/medical(src)
	new /obj/item/reagent_containers/syringe/stim/ultra_surgeon(src) // Antags don't come with the medical perk, this helps them make use of the ATK provided

/obj/item/storage/firstaid/surgery/combat
	name = "combat surgery kit"
	desc = "Contains tools for surgery. Has precise foam fitting for safe transport of highly advanced tools."
	icon = 'icons/obj/storage/deferred.dmi'
	icon_state = "combat_surgery_kit"
	item_state = "combat_surgery_kit"
	storage_slots = 11 // Enough for the tools it holds, 1 more slot than standard surgical kits, but less than Soteria made ones.
	max_w_class = ITEM_SIZE_NORMAL
	matter = list(MATERIAL_PLASTIC = 12) // More slots
	can_hold = list(
		/obj/item/tool/bonesetter,
		/obj/item/tool/saw/circular,
		/obj/item/tool/hemostat,
		/obj/item/tool/retractor,
		/obj/item/tool/scalpel,
		/obj/item/tool/surgicaldrill,
		/obj/item/tool/tape_roll/fiber/medical,
		/obj/item/tool/tape_roll/bonegel,
		/obj/item/reagent_containers/syringe,
		/obj/item/storage/pill_bottle,
		/obj/item/tool/medmultitool,
		/obj/item/stack/medical/bruise_pack/advanced
		)

/obj/item/storage/firstaid/surgery/combat/populate_contents()
	if (empty) return
	new /obj/item/tool/scalpel/laser(src)
	new /obj/item/tool/hemostat/adv(src)
	new /obj/item/tool/retractor/adv(src)
	new /obj/item/tool/bonesetter/adv(src)
	new /obj/item/tool/tape_roll/fiber/medical(src)
	new /obj/item/tool/tape_roll/bonegel(src)
	new /obj/item/tool/saw/circular/medical(src)
	new /obj/item/tool/surgicaldrill/adv(src)
	new /obj/item/reagent_containers/syringe/stim/ultra_surgeon(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/stack/medical/bruise_pack/advanced(src)

/obj/item/storage/firstaid/surgery/si
	name = "soteria advanced surgery kit"
	desc = "Contains tools for surgery. Has precise foam fitting for safe transport of highly advanced tools."
	icon_state = "surgery_box_SI"
	item_state = "combat_surgery_kit"
	icon = 'icons/obj/storage/deferred.dmi'
	storage_slots = 13 // All tools a full one would fit + pill bottle and syringe, in case they're needed.

/obj/item/storage/firstaid/surgery/si/empty
	empty = TRUE

/obj/item/storage/firstaid/surgery/si/populate_contents()
	if (empty) return
	new /obj/item/tool/scalpel/advanced/si(src)
	new /obj/item/tool/scalpel/laser/si(src)
	new /obj/item/tool/hemostat/adv/si(src)
	new /obj/item/tool/retractor/adv/si(src)
	new /obj/item/tool/bonesetter/adv/si(src)
	new /obj/item/tool/tape_roll/fiber/medical(src)
	new /obj/item/tool/cautery/adv/si(src)
	new /obj/item/tool/tape_roll/bonegel/si(src)
	new /obj/item/tool/saw/circular/medical/si(src)
	new /obj/item/tool/surgicaldrill/adv/si(src)
	new /obj/item/stack/medical/bruise_pack/advanced(src)

/obj/item/storage/firstaid/ifak
	name = "IFAK"
	desc = "Individual First Aid Kit"
	icon = 'icons/inventory/pockets/icon.dmi'
	icon_state = "medical_supply"
	item_state = "medical_supply"

	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_BELT
	storage_slots = 4
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_SMALL_STORAGE
	matter = list(MATERIAL_BIOMATTER = 12)
	attack_verb = list("pouched")

	can_hold = list(
		/obj/item/device/scanner/health,
		/obj/item/dnainjector,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/pill,
		/obj/item/reagent_containers/syringe,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/head/surgery,
		/obj/item/clothing/gloves/latex,
		/obj/item/reagent_containers/hypospray,
		/obj/item/clothing/glasses/hud/health,
		)

	var/sliding_behavior = FALSE

/obj/item/storage/firstaid/ifak/verb/toggle_slide()
	set name = "Toggle Slide"
	set desc = "Toggle the behavior of last item in [src] \"sliding\" into your hand."
	set category = "Object"

	sliding_behavior = !sliding_behavior
	to_chat(usr, SPAN_NOTICE("Items will now [sliding_behavior ? "" : "not"] slide out of [src]"))

/obj/item/storage/firstaid/ifak/attack_hand(mob/living/carbon/human/user)
	if(sliding_behavior && contents.len && (src in user))
		var/obj/item/I = contents[contents.len]
		if(istype(I))
			hide_from(usr)
			var/turf/T = get_turf(user)
			remove_from_storage(I, T)
			usr.put_in_hands(I)
			add_fingerprint(user)
	else
		..()
	can_hold = list(
		/obj/item/device/scanner/health,
		/obj/item/dnainjector,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/pill,
		/obj/item/reagent_containers/syringe,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/head/surgery,
		/obj/item/clothing/gloves/latex,
		/obj/item/reagent_containers/hypospray,
		/obj/item/clothing/glasses/hud/health,
		)
/obj/item/storage/firstaid/ifak/New()
	..()
	if (empty) return
	new /obj/item/reagent_containers/hypospray/autoinjector(src)
	new /obj/item/stack/medical/bruise_pack(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/stack/medical/splint(src)

	return

/obj/item/storage/firstaid/nt
	name = "absolutism medkit"
	desc = "A medkit filled with a set of high-end trauma kits and anti-toxins."
	icon_state = "nt_kit"
	item_state = "nt_kit"
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/storage/firstaid/nt/populate_contents()
	if (empty) return
	new /obj/item/stack/medical/bruise_pack/advanced/nt(src)
	new /obj/item/stack/medical/bruise_pack/advanced/nt(src)
	new /obj/item/stack/medical/ointment/advanced/nt(src)
	new /obj/item/stack/medical/ointment/advanced/nt(src)
	new /obj/item/reagent_containers/syringe/large/antitoxin(src)
	new /obj/item/reagent_containers/syringe/large/inaprovaline(src)

/obj/item/storage/firstaid/nt/update_icon()
	if(!contents.len)
		icon_state = "[initial(icon_state)]_empty"
		item_state = "[initial(item_state)]_empty"
	else
		icon_state = "[initial(icon_state)]"
		item_state = "[initial(item_state)]"
	..()

/obj/item/storage/firstaid/soteria
	name = "triage kit"
	desc = "A specialized triage kit, outfitted for Soteria personnel only. Contains everything a Doctor would ever need in a case of emergency, in a pinch."
	icon_state = "triagekit"
	item_state = "triagekit"
	storage_slots = 10
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_NORMAL_STORAGE

	can_hold = list(
		/obj/item/stack/medical,
		/obj/item/device/scanner/health,
		/obj/item/reagent_containers/syringe,
		/obj/item/storage/pill_bottle,
		/obj/item/reagent_containers/hypospray,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/reagent_containers/dropper,
		/obj/item/tool/medmultitool,
		/obj/item/clothing/gloves/latex,
		/obj/item/tool/medmultitool/medimplant,
		/obj/item/bodybag/cryobag
		)

/obj/item/storage/firstaid/soteria/populate_contents()
	if (empty) return
	new /obj/item/stack/medical/bruise_pack/soteria(src)
	new /obj/item/stack/medical/bruise_pack/soteria(src)
	new /obj/item/stack/medical/ointment/soteria(src)
	new /obj/item/stack/medical/ointment/soteria(src)
	new /obj/item/reagent_containers/glass/bottle/inaprovaline(src)
	new /obj/item/reagent_containers/glass/bottle/antitoxin(src)
	new /obj/item/reagent_containers/syringe/tricordrazine(src)
	new /obj/item/device/scanner/health(src)

/obj/item/storage/firstaid/soteria/large
	name = "reinforced triage kit"
	desc = "A reinforced, specialized triage kit outfitted for Soteria personnel only. This one is larger in capacity thanks to Soteria ingenuity, and should help Paramedics carry everything they need for any emergency."
	icon_state = "rtk"
	item_state = "rtk"
	storage_slots = 12
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_NORMAL_STORAGE
	can_hold = list(
		/obj/item/stack/medical,
		/obj/item/device/scanner/health,
		/obj/item/reagent_containers/syringe,
		/obj/item/storage/pill_bottle,
		/obj/item/reagent_containers/hypospray,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/reagent_containers/dropper,,
		/obj/item/clothing/gloves/latex,
		/obj/item/bodybag/cryobag
		)

/obj/item/storage/firstaid/soteria/large/populate_contents()
	if (empty) return
	new /obj/item/stack/medical/bruise_pack/soteria(src)
	new /obj/item/stack/medical/bruise_pack/soteria(src)
	new /obj/item/stack/medical/ointment/soteria(src)
	new /obj/item/stack/medical/ointment/soteria(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/reagent_containers/glass/bottle/inaprovaline(src)
	new /obj/item/reagent_containers/glass/bottle/antitoxin(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_containers/syringe/spaceacillin(src)
	new /obj/item/device/scanner/health(src)

/obj/item/storage/firstaid/blackshield
	name = "corpsman's bulk-treatment kit"
	desc = "A compact version of Soteria creation, this high-capacity CBT Kit allows a Corpsman to carry all the necessary tools for battlefield triage." //Yes, it's exactly what you're thinking.
	icon_state = "cbtk"
	item_state = "cbtk"
	storage_slots = 14 //Having to perform medicine in non-ideal situations, it's apt that they are able to carry more equipment around.
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_NORMAL_STORAGE
	can_hold = list(
		/obj/item/stack/medical,
		/obj/item/device/scanner/health,
		/obj/item/reagent_containers/syringe,
		/obj/item/storage/pill_bottle,
		/obj/item/reagent_containers/hypospray,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/reagent_containers/dropper,
		/obj/item/clothing/gloves/latex,
		/obj/item/bodybag/cryobag,
		/obj/item/tool/medmultitool //They get to perform field surgery so they deserve space inside their kits to store a med multitool.
		)

/obj/item/storage/firstaid/blackshield/populate_contents()
	if (empty) return
	new /obj/item/stack/medical/bruise_pack/blacshield(src)
	new /obj/item/stack/medical/bruise_pack/blacshield(src)
	new /obj/item/stack/medical/bruise_pack/blacshield(src)
	new /obj/item/stack/medical/ointment/blacshield(src)
	new /obj/item/stack/medical/ointment/blacshield(src)
	new /obj/item/stack/medical/ointment/blacshield(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/reagent_containers/glass/bottle/stoxin(src)
	new /obj/item/reagent_containers/glass/bottle/tricord(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_containers/syringe/spaceacillin(src)
	new /obj/item/device/scanner/health(src)

/obj/item/storage/firstaid/blackshield/large
	name = "blackshield's counter-siege treatment kit"
	desc = "The bigger brother to the corpsman bulk treatment kit, perfect for extended combat scenarios. Sadly not as compact as other similar designed kits." //Yes, it's exactly what you're thinking.
	icon_state = "cbtk_large"
	item_state = "cbtk_large"
	w_class = ITEM_SIZE_BULKY //Big boy meds
	storage_slots = 20 //Having to perform medicine in non-ideal situations, it's apt that they are able to carry more equipment around.

	can_hold = list(
		/obj/item/stack/medical,
		/obj/item/device/scanner/health,
		/obj/item/reagent_containers/syringe,
		/obj/item/storage/pill_bottle,
		/obj/item/reagent_containers/hypospray,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/reagent_containers/dropper,
		/obj/item/clothing/gloves/latex,
		/obj/item/bodybag/cryobag,
		/obj/item/tool/medmultitool //They get to perform field surgery so they deserve space inside their kits to store a med multitool.
		)

/obj/item/storage/firstaid/blackshield/large/populate_contents()
	if (empty) return
	new /obj/item/stack/medical/bruise_pack/blacshield(src)
	new /obj/item/stack/medical/bruise_pack/blacshield(src)
	new /obj/item/stack/medical/bruise_pack/blacshield(src)
	new /obj/item/stack/medical/bruise_pack/blacshield(src)
	new /obj/item/stack/medical/bruise_pack/blacshield(src)
	new /obj/item/stack/medical/bruise_pack/blacshield(src)
	new /obj/item/stack/medical/ointment/blacshield(src)
	new /obj/item/stack/medical/ointment/blacshield(src)
	new /obj/item/stack/medical/ointment/blacshield(src)
	new /obj/item/stack/medical/ointment/blacshield(src)
	new /obj/item/stack/medical/ointment/blacshield(src)
	new /obj/item/stack/medical/ointment/blacshield(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/dermaline(src)
	new /obj/item/storage/pill_bottle/spaceacillin(src)
	new /obj/item/storage/pill_bottle/carthatoline(src)
	new /obj/item/storage/pill_bottle/prosurgeon(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/device/scanner/health(src)

/*
 * Pill Bottles
 */
/obj/item/storage/pill_bottle
	name = "pill bottle"
	desc = "It's an airtight container for storing medication."
	icon_state = "pill_canister"
	icon = 'icons/obj/chemical.dmi'
	item_state = "contsolid"
	w_class = ITEM_SIZE_SMALL
	level = BELOW_PLATING_LEVEL //sneaky
	can_hold = list(/obj/item/reagent_containers/pill,
		/obj/item/dice,
		/obj/item/checker,
		/obj/item/paper
		)
	allow_quick_gather = TRUE
	use_to_pickup = TRUE
	use_sound = null
	matter = list(MATERIAL_PLASTIC = 1)
	max_storage_space = 32

/obj/item/storage/pill_bottle/antitox
	icon_state = "pill_green"
	name = "bottle of high-dose Dylovene pills"
	desc = "Contains pills used to counter higher concentrations of toxins."

/obj/item/storage/pill_bottle/antitox/populate_contents()
	new /obj/item/reagent_containers/pill/antitox(src)
	new /obj/item/reagent_containers/pill/antitox(src)
	new /obj/item/reagent_containers/pill/antitox(src)
	new /obj/item/reagent_containers/pill/antitox(src)
	new /obj/item/reagent_containers/pill/antitox(src)
	new /obj/item/reagent_containers/pill/antitox(src)
	new /obj/item/reagent_containers/pill/antitox(src)

/obj/item/storage/pill_bottle/bicaridine
	name = "bottle of Bicaridine pills"
	icon_state = "pill_red"
	desc = "Contains pills used to stabilize the severely injured."

/obj/item/storage/pill_bottle/bicaridine/populate_contents()
    new /obj/item/reagent_containers/pill/bicaridine(src)
    new /obj/item/reagent_containers/pill/bicaridine(src)
    new /obj/item/reagent_containers/pill/bicaridine(src)
    new /obj/item/reagent_containers/pill/bicaridine(src)
    new /obj/item/reagent_containers/pill/bicaridine(src)
    new /obj/item/reagent_containers/pill/bicaridine(src)
    new /obj/item/reagent_containers/pill/bicaridine(src)

/obj/item/storage/pill_bottle/dexalin_plus
	name = "bottle of Dexalin Plus pills"
	icon_state = "pill_blue"
	desc = "Contains pills used to treat extreme cases of oxygen deprivation."

/obj/item/storage/pill_bottle/dexalin_plus/populate_contents()
    new /obj/item/reagent_containers/pill/dexalin_plus(src)
    new /obj/item/reagent_containers/pill/dexalin_plus(src)
    new /obj/item/reagent_containers/pill/dexalin_plus(src)
    new /obj/item/reagent_containers/pill/dexalin_plus(src)
    new /obj/item/reagent_containers/pill/dexalin_plus(src)
    new /obj/item/reagent_containers/pill/dexalin_plus(src)
    new /obj/item/reagent_containers/pill/dexalin_plus(src)

/obj/item/storage/pill_bottle/dermaline
	name = "bottle of Dermaline pills"
	icon_state = "pill_orange"
	desc = "Contains pills used to treat burn wounds."

/obj/item/storage/pill_bottle/dermaline/populate_contents()
    new /obj/item/reagent_containers/pill/dermaline(src)
    new /obj/item/reagent_containers/pill/dermaline(src)
    new /obj/item/reagent_containers/pill/dermaline(src)
    new /obj/item/reagent_containers/pill/dermaline(src)
    new /obj/item/reagent_containers/pill/dermaline(src)
    new /obj/item/reagent_containers/pill/dermaline(src)
    new /obj/item/reagent_containers/pill/dermaline(src)

/obj/item/storage/pill_bottle/dylovene
	name = "bottle of Dylovene pills"
	icon_state = "pill_green"
	desc = "Contains pills used to counteract toxic substances in the blood."

/obj/item/storage/pill_bottle/dylovene/populate_contents()
    new /obj/item/reagent_containers/pill/dylovene(src)
    new /obj/item/reagent_containers/pill/dylovene(src)
    new /obj/item/reagent_containers/pill/dylovene(src)
    new /obj/item/reagent_containers/pill/dylovene(src)
    new /obj/item/reagent_containers/pill/dylovene(src)
    new /obj/item/reagent_containers/pill/dylovene(src)
    new /obj/item/reagent_containers/pill/dylovene(src)

/obj/item/storage/pill_bottle/carthatoline
	name = "bottle of Carthatoline pills"
	icon_state = "pill_green"
	desc = "Contains pills used to counteract severe poisoning and liver failure."

/obj/item/storage/pill_bottle/carthatoline/populate_contents()
	new /obj/item/reagent_containers/pill/carthatoline(src)
	new /obj/item/reagent_containers/pill/carthatoline(src)
	new /obj/item/reagent_containers/pill/carthatoline(src)
	new /obj/item/reagent_containers/pill/carthatoline(src)
	new /obj/item/reagent_containers/pill/carthatoline(src)
	new /obj/item/reagent_containers/pill/carthatoline(src)
	new /obj/item/reagent_containers/pill/carthatoline(src)

/obj/item/storage/pill_bottle/inaprovaline
	name = "bottle of Inaprovaline pills"
	icon_state = "pill_blue"
	desc = "Contains pills used to stabilize patients."

/obj/item/storage/pill_bottle/inaprovaline/populate_contents()
	new /obj/item/reagent_containers/pill/inaprovaline(src)
	new /obj/item/reagent_containers/pill/inaprovaline(src)
	new /obj/item/reagent_containers/pill/inaprovaline(src)
	new /obj/item/reagent_containers/pill/inaprovaline(src)
	new /obj/item/reagent_containers/pill/inaprovaline(src)
	new /obj/item/reagent_containers/pill/inaprovaline(src)
	new /obj/item/reagent_containers/pill/inaprovaline(src)

/obj/item/storage/pill_bottle/kelotane
	name = "bottle of Kelotane pills"
	icon_state = "pill_yellow"
	desc = "Contains pills used to treat burns."

/obj/item/storage/pill_bottle/kelotane/populate_contents()
	new /obj/item/reagent_containers/pill/kelotane(src)
	new /obj/item/reagent_containers/pill/kelotane(src)
	new /obj/item/reagent_containers/pill/kelotane(src)
	new /obj/item/reagent_containers/pill/kelotane(src)
	new /obj/item/reagent_containers/pill/kelotane(src)
	new /obj/item/reagent_containers/pill/kelotane(src)
	new /obj/item/reagent_containers/pill/kelotane(src)

/obj/item/storage/pill_bottle/spaceacillin
	name = "bottle of Spaceacillin pills"
	icon_state = "pill_white"
	desc = "A theta-lactam antibiotic. Effective against many diseases likely to be encountered in space."

/obj/item/storage/pill_bottle/spaceacillin/populate_contents()
    new /obj/item/reagent_containers/pill/spaceacillin(src)
    new /obj/item/reagent_containers/pill/spaceacillin(src)
    new /obj/item/reagent_containers/pill/spaceacillin(src)
    new /obj/item/reagent_containers/pill/spaceacillin(src)
    new /obj/item/reagent_containers/pill/spaceacillin(src)
    new /obj/item/reagent_containers/pill/spaceacillin(src)
    new /obj/item/reagent_containers/pill/spaceacillin(src)

/obj/item/storage/pill_bottle/tramadol
	name = "bottle of Tramadol pills"
	icon_state = "pill_pink"
	desc = "Contains pills used to relieve pain."

/obj/item/storage/pill_bottle/tramadol/populate_contents()
	new /obj/item/reagent_containers/pill/tramadol(src)
	new /obj/item/reagent_containers/pill/tramadol(src)
	new /obj/item/reagent_containers/pill/tramadol(src)
	new /obj/item/reagent_containers/pill/tramadol(src)
	new /obj/item/reagent_containers/pill/tramadol(src)
	new /obj/item/reagent_containers/pill/tramadol(src)
	new /obj/item/reagent_containers/pill/tramadol(src)

/obj/item/storage/pill_bottle/citalopram
	name = "bottle of Citalopram pills"
	icon_state = "pill_pink"
	desc = "Contains pills used to stabilize a patient's mood."

/obj/item/storage/pill_bottle/citalopram/populate_contents()
	new /obj/item/reagent_containers/pill/citalopram(src)
	new /obj/item/reagent_containers/pill/citalopram(src)
	new /obj/item/reagent_containers/pill/citalopram(src)
	new /obj/item/reagent_containers/pill/citalopram(src)
	new /obj/item/reagent_containers/pill/citalopram(src)
	new /obj/item/reagent_containers/pill/citalopram(src)
	new /obj/item/reagent_containers/pill/citalopram(src)

/obj/item/storage/pill_bottle/prosurgeon
	name = "bottle of ProSurgeon pills"
	icon_state = "pill_black"
	desc = "Contains pills used to reduce hand tremors."

/obj/item/storage/pill_bottle/prosurgeon/populate_contents()
	new /obj/item/reagent_containers/pill/prosurgeon(src)
	new /obj/item/reagent_containers/pill/prosurgeon(src)
	new /obj/item/reagent_containers/pill/prosurgeon(src)
	new /obj/item/reagent_containers/pill/prosurgeon(src)
	new /obj/item/reagent_containers/pill/prosurgeon(src)
	new /obj/item/reagent_containers/pill/prosurgeon(src)
	new /obj/item/reagent_containers/pill/prosurgeon(src)

/obj/item/storage/pill_bottle/bloodregen
	name = "bottle of Blood Deficiency supplements"
	icon_state = "pill_dred"
	desc = "Contains pills to help speed up natural blood generation."

/obj/item/storage/pill_bottle/bloodregen/populate_contents()
	new /obj/item/reagent_containers/pill/bloodregen(src)
	new /obj/item/reagent_containers/pill/bloodregen(src)
	new /obj/item/reagent_containers/pill/bloodregen(src)
	new /obj/item/reagent_containers/pill/bloodregen(src)
	new /obj/item/reagent_containers/pill/bloodregen(src)
	new /obj/item/reagent_containers/pill/bloodregen(src)
	new /obj/item/reagent_containers/pill/bloodregen(src)

/obj/item/storage/pill_bottle/opifex
	name = "bottle of mixed supplements"
	icon_state = "pill_rainbow"
	desc = "A mixed bottle of pills."


/obj/item/storage/pill_bottle/opifex/populate_contents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/bloodregen(src)
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/prosurgeon(src)
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/bicaridine(src)
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/tramadol(src)
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/dermaline(src)
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/dexalin_plus(src)
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/antitox(src)

/obj/item/storage/pill_bottle/njoy
	name = "bottle of mixed Njoy pills"
	desc = "Contains pills used help the mental states."
	icon_state = "bottle_njoy_mix"

/obj/item/storage/pill_bottle/njoy/populate_contents()
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/pill/suppressital(src)
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/pill/suppressital/green(src)
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/pill/suppressital/blue(src)


/obj/item/storage/pill_bottle/njoy/red
	name = "bottle of red Njoy pills"
	desc = "Contains pills used help the mental states."
	icon_state = "bottle_njoy_red"

/obj/item/storage/pill_bottle/njoy/red/populate_contents()
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/pill/suppressital(src)

/obj/item/storage/pill_bottle/njoy/green
	name = "bottle of green Njoy pills"
	desc = "Contains pills used to stop the mental states."
	icon_state = "bottle_njoy_green"

/obj/item/storage/pill_bottle/njoy/green/populate_contents()
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/pill/suppressital/green(src)

/obj/item/storage/pill_bottle/njoy/blue
	name = "bottle of blue Njoy pills"
	desc = "Contains pills used to stop the mental states."
	icon_state = "bottle_njoy_blue"

/obj/item/storage/pill_bottle/njoy/blue/populate_contents()
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/pill/suppressital/blue(src)

/*
 * Portable Freezers
 */
/obj/item/storage/freezer
	name = "portable freezer"
	desc = "This nifty shock-resistant device will keep your 'groceries' nice and non-spoiled."
	icon_state = "freezer"
	item_state = "medicalpack"
	max_w_class = ITEM_SIZE_NORMAL
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 2)
	can_hold = list(/obj/item/organ, /obj/item/modification/organ, /obj/item/reagent_containers, /obj/item/reagent_containers/glass)
	max_storage_space = DEFAULT_NORMAL_STORAGE
	use_to_pickup = TRUE

/obj/item/storage/freezer/medical
	name = "organ freezer"
	desc = "A red-colored, compact cryogenic box for holding organs for safe transportation preserving their integrity. This one has expanded capacity."
	icon_state = "freezer_red"
	item_state = "medicalpack"
	matter = list(MATERIAL_PLASTEEL = 1, MATERIAL_PLASTIC = 2)
	max_storage_space = DEFAULT_NORMAL_STORAGE * 1.25
