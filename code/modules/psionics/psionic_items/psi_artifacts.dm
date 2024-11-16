//////////////////////////////
//			Psionic Artifacts
//////////////////////////////
// These items are special items found, dug up, or randomly created that require psions to invoke. They should generally be thematic and interesting, but somewhat or outright useful too. -Kaz

/obj/item/clothing/mask/gas/bonedog
	name = "Mask of the Bone Dog"
	desc = "The ivory bleached skull of some kind of canine. Was this a trophy of a wolf slain in battle or a token of a lost pet taken and remembered by its master? Perhaps it is the skull of a kriosan, \
	the result of a rivalry remembered in blood. Oddly, this non-conductive bone mask is quite durable and protects from radiation, sickness, and harmful gases. Even to the untrained, this item \
	has obvious psionic potential."
	icon_state = "bonedog"
	siemens_coefficient = 1 // Non-conductive
	matter = list(MATERIAL_BONE = 5, MATERIAL_BIOMATTER = 2)
	armor_list = list(
		melee = 2,
		bullet = 5,
		energy = 1,
		bomb = 5,
		bio = 100,
		rad = 100
	) // Thematic with the lodge bone armor in terms of defense, has bio/rad because theme but without a suit it doesn't do much. Not that great compared to most helmets, you want it for the stats. -Kaz
	price_tag = 0
	var/mask_cooldown_time = 25 MINUTES
	var/last_invoke = -16000

// If you renew it every 25 minutes (in the 5 minute window before it ends), you effectively have +30 cog/+15 vig with some upkeep. Great for a psion and thematic with the kriosan skull. -Kaz
// Thematically, the dead must be remembered periodically, lest they and the things they offer be forgotten.
/obj/item/clothing/mask/gas/bonedog/verb/invoke_spirit()
	set name = "Invoke Mask"
	set desc = "Invoke the psionic potential left in this skull."
	set category = "Object"

	if(!usr.stats.getPerk(PERK_PSION))
		to_chat(usr, "<span class='notice'>You lack the psionic potential to invoke this.</span>")
		return

	if((last_invoke + mask_cooldown_time) >= world.time)
		to_chat(usr, "<span class='notice'>[name] needs more time to regenerate.</span>")
		return

	last_invoke = world.time

	playsound(src.loc, 'sound/hallucinations/ghosty_wind.ogg', 25, 1) // Faintly spooky wind
	to_chat(usr, "You invoke the hidden potential from this long forgotten mask, your mind becomes cunning, your eyes sharp, you hear the wind howling. The effect is temporary, but powerful.")
	usr.stats.addTempStat(STAT_COG, 30, 30 MINUTES, "bonedog_mask")
	usr.stats.addTempStat(STAT_VIG, 15, 30 MINUTES, "bonedog_mask")
