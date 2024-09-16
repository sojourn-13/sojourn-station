//SUBCLASSES.  Spawn a bunch of items and disappear likewise
//Costume spawner landmarks
/obj/landmark/costume
	delete_me = TRUE

/obj/landmark/costume/chicken/New()
	new /obj/item/clothing/suit/costume/animal/chicken(src.loc)
	new /obj/item/clothing/head/costume/animal/chicken(src.loc)
	new /obj/item/reagent_containers/food/snacks/egg(src.loc)

/obj/landmark/costume/gladiator/New()
	new /obj/item/clothing/under/costume/history/gladiator(src.loc)
	new /obj/item/clothing/head/helmet/gladiator(src.loc)

/obj/landmark/costume/madscientist/New()
	//new /obj/item/clothing/under/gimmick/rank/captain/suit(src.loc)
	new /obj/item/clothing/head/flatcap(src.loc)
	new /obj/item/clothing/glasses/regular/gglasses(src.loc)

/obj/landmark/costume/elpresidente/New()
	//new /obj/item/clothing/under/gimmick/rank/captain/suit(src.loc)
	new /obj/item/clothing/head/flatcap(src.loc)
	new /obj/item/clothing/mask/smokable/cigarette/cigar/havana(src.loc)
	new /obj/item/clothing/shoes/jackboots(src.loc)

/obj/landmark/costume/nyangirl/New()
	new /obj/item/clothing/under/dress/properblue(src.loc)
	new /obj/item/clothing/head/costume/animal/kitty(src.loc)

/obj/landmark/costume/maid/New()
	var/CHOICE = pick( /obj/item/clothing/head/beret , /obj/item/clothing/head/costume/animal/rabbitears )
	new CHOICE(src.loc)
	new /obj/item/clothing/glasses/blindfold(src.loc)

/obj/landmark/costume/butler/New()
	new /obj/item/clothing/accessory/waistcoat(src.loc)
	new /obj/item/clothing/head/tophat(src.loc)

/obj/landmark/costume/highlander/New()
	new /obj/item/clothing/under/dress/kilt(src.loc)
	new /obj/item/clothing/head/beret(src.loc)

/obj/landmark/costume/prig/New()
	new /obj/item/clothing/accessory/waistcoat(src.loc)
	new /obj/item/clothing/glasses/monocle(src.loc)
	var/CHOICE= pick( /obj/item/clothing/head/bowler, /obj/item/clothing/head/tophat)
	new CHOICE(src.loc)
	new /obj/item/clothing/shoes/color/black(src.loc)
	new /obj/item/cane(src.loc)
	//new /obj/item/clothing/under/sl_suit(src.loc)
	new /obj/item/clothing/mask/costume/misc/fakemoustache(src.loc)

/obj/landmark/costume/plaguedoctor/New()
	new /obj/item/clothing/suit/costume/history/plaguedoctor(src.loc)
	new /obj/item/clothing/head/costume/history/plaguedoctor(src.loc)

/obj/landmark/costume/nightowl/New()
	new /obj/item/clothing/under/costume/animal/owl(src.loc)
	new /obj/item/clothing/mask/costume/animal/owl(src.loc)

/obj/landmark/costume/waiter/New()
	new /obj/item/clothing/under/costume/job/waiter(src.loc)
	var/CHOICE= pick( /obj/item/clothing/head/costume/animal/kitty, /obj/item/clothing/head/costume/animal/rabbitears)
	new CHOICE(src.loc)
	new /obj/item/clothing/suit/rank/botanist(src.loc)

/obj/landmark/costume/pirate/New()
	new /obj/item/clothing/under/costume/history/pirate(src.loc)
	new /obj/item/clothing/suit/costume/history/pirate(src.loc)
	var/CHOICE = pick( /obj/item/clothing/head/costume/history/pirate , /obj/item/clothing/head/bandana )
	new CHOICE(src.loc)
	new /obj/item/clothing/glasses/eyepatch(src.loc)

/obj/landmark/costume/commie/New()
	new /obj/item/clothing/under/costume/history/soviet(src.loc)
	new /obj/item/clothing/head/ushanka(src.loc)

/obj/landmark/costume/sexyclown/New()
	new /obj/item/clothing/mask/costume/kinky/sexy_clown(src.loc)
	new /obj/item/clothing/under/costume/kinky/sexy_clown(src.loc)
