/*
PP Station 13 - Judaism Content
Coded with love by woross
Sprites hand drawn by KBB
CONTENTS:
-Judaism items
-Rabbi Job
*/

/area/chapel/synagogue
	name = "Synagogue"

/obj/item/clothing/head/pp/kippah
	name = "kippah"
	desc = "A small Jewish hat."
	icon_state = "kippah"
	dynamic_hair_suffix = ""

/obj/structure/sign/poster/contraband/israel
	name = "Our Greatest Ally"
	desc = "A poster with the flag of Nanotrasen's greatest ally. It looks quite damaged."
	icon_state = "poster_israel"

/obj/item/clothing/neck/necklace/dope/rabbi
	desc = "Feels good to be rich."

/obj/item/clothing/suit/toggle/lawyer/black/rabbi
	name = "rabbi suit"
	desc = "A formal suit."

/obj/item/clothing/under/lawyer/black/rabbi
	name = "formal clothes"
	desc = "A formal shirt and pants."

/obj/item/clothing/head/pp/jhat
	name = "Jew hat"
	desc = "A robust Jewish top hat."
	icon_state = "jhat"


/obj/effect/landmark/start/rabbi
	name = "Rabbi"
	icon = 'ppstation/icons/jew.dmi'
	icon_state = "jewspawn"

/datum/job/rabbi
	title = "Rabbi"
	flag = RABBI
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "G-d"
	selection_color = "#dddddd"
	access = list(ACCESS_SYNAGOGUE, ACCESS_MAINT_TUNNELS)
	minimal_access = list(ACCESS_SYNAGOGUE, ACCESS_MAINT_TUNNELS)
	outfit = /datum/outfit/job/rabbi
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_CIV

/datum/job/rabbi/after_spawn(mob/living/carbon/human/H, mob/M)

	var/lastname = pick(GLOB.last_names)
	var/jewname = "Rabbi [lastname]stein"
	H.fully_replace_character_name(H.real_name, jewname)
	var/obj/item/organ/foreskin/F = H.getorgan(/obj/item/organ/foreskin)
	if(F)
		qdel(F)
	if(H.gender == FEMALE)
		H.gender = MALE
		H.regenerate_icons()
	var/datum/martial_art/S = H.mind.has_martialart("Catfighting")
	if(S)
		S.remove(H)


/datum/outfit/job/rabbi
	name = "Rabbi"
	jobtype = /datum/job/rabbi
	uniform =  /obj/item/clothing/under/lawyer/black/rabbi
	shoes = /obj/item/clothing/shoes/laceup
	suit = /obj/item/clothing/suit/toggle/lawyer/black/rabbi
	head = /obj/item/clothing/head/pp/jhat
	neck = /obj/item/clothing/neck/necklace/dope/rabbi

/obj/item/book/manual/talmud
	name = "The Talmud"
	icon_state ="book1"
	author = "Satan"
	title = "The Talmud"
	dat = {"<html>
	The Sages taught in a baraita: Rahab aroused impure thoughts by her name, i.e.,<br>
	the mere mention of her name would inspire lust for her; Yael, by her voice; Abigail, by remembering her;<br>
	Michal, the daughter of Saul, by her appearance. Similarly, Rabbi Yitzhak said: Anyone who says Rahab,<br>
	Rahab, immediately experiences a seminal emission due to the arousal of desire caused by Rahab’s great beauty.<br>
	Rav Nahman said to him: I say: Rahab, Rahab, and it does not affect me. Rabbi Yitzchak said to Rav Nahman:<br>
	When I said this, I was specifically referring to one who knows her personally and recognizes her beauty.<br>
	Only for one who has met Rahab in person is the mere mention of her name capable of arousing lust.<br<br>
	The Gemara relates that Rabba and Rabbi Zeira prepared a Purim feast with each other,<br>
	and they became intoxicated to the point that Rabba arose and slaughtered Rabbi Zeira.<br>
	The next day, when he became sober and realized what he had done, Rabba asked God for mercy, and revived him.<br>
	The next year, Rabba said to Rabbi Zeira: Let the Master come and let us prepare the Purim feast with each other.<br>
	He said to him: Miracles do not happen each and every hour, and I do not want to undergo that experience again.<br></html>"}