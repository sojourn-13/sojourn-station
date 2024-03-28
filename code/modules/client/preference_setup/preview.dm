datum/preferences
	var/icon/preview_icon  = null
	var/icon/preview_south = null
	var/icon/preview_north = null
	var/icon/preview_east  = null
	var/icon/preview_west  = null
	var/preview_dir = SOUTH	//for augmentation
	var/mob/living/carbon/human/dummy/mannequin/mannequin = null
	var/generating_preview = FALSE

datum/preferences/proc/update_preview_icon(var/naked = FALSE)
	if (generating_preview)
		return
	generating_preview = TRUE

	mannequin = get_mannequin(client_ckey)
	mannequin.delete_inventory(TRUE)
	preview_icon = icon('icons/effects/96x64.dmi', bgstate)

	if(SSticker.current_state > GAME_STATE_STARTUP)
		dress_preview_mob(mannequin, naked)

	/*
	mannequin.dir = EAST
	preview_east = getFlatIcon(mannequin, EAST)
	*/
	preview_east = null

	mannequin.dir = WEST
	var/icon/stamp = getFlatIcon(mannequin, WEST)
	CHECK_TICK
	preview_icon.Blend(stamp, ICON_OVERLAY, (preview_icon.Width()/6*1) - (stamp.Width()/2) + 2, preview_icon.Height()/4*1 + 1)
	preview_west = stamp

	mannequin.dir = NORTH
	stamp = getFlatIcon(mannequin, NORTH)
	CHECK_TICK
	preview_icon.Blend(stamp, ICON_OVERLAY, (preview_icon.Width()/6*3) - (stamp.Width()/2) + 2, preview_icon.Height()/4*2 + 1)
	preview_north = stamp

	mannequin.dir = SOUTH
	stamp = getFlatIcon(mannequin, SOUTH)
	CHECK_TICK
	preview_icon.Blend(stamp, ICON_OVERLAY, (preview_icon.Width()/6*5) - (stamp.Width()/2) + 2, preview_icon.Height()/4*0 + 1)
	preview_south = stamp

	// Scaling here to prevent blurring in the browser.
	//preview_east.Scale(preview_east.Width() * 2, preview_east.Height() * 2)
	preview_west.Scale(preview_west.Width() * 2, preview_west.Height() * 2)
	preview_north.Scale(preview_north.Width() * 2, preview_north.Height() * 2)
	preview_south.Scale(preview_south.Width() * 2, preview_south.Height() * 2)
	preview_icon.Scale(preview_icon.Width() * 2, preview_icon.Height() * 2)

	generating_preview = FALSE

	return mannequin.icon
