
/datum/asset/simple/tgui
	keep_local_name = TRUE
	assets = list(
		"tgui.bundle.js" = file("tgui/public/tgui.bundle.js"),
		"tgui.bundle.css" = file("tgui/public/tgui.bundle.css"),
	)

/datum/asset/simple/tgui_panel
	keep_local_name = TRUE
	assets = list(
		"tgui-panel.bundle.js" = file("tgui/public/tgui-panel.bundle.js"),
		"tgui-panel.bundle.css" = file("tgui/public/tgui-panel.bundle.css"),
	)

/datum/asset/simple/statpanel_styles
	keep_local_name = TRUE
	assets = list(
		"tgui-statpanel-styles.bundle.css" = file("tgui/public/tgui-statpanel-styles.bundle.css"),
	)

/datum/asset/simple/namespaced/tgfont
	assets = list(
		"tgfont.eot" = file("tgui/packages/tgfont/static/tgfont.eot"),
		"tgfont.woff2" = file("tgui/packages/tgfont/static/tgfont.woff2"),
	)
	parents = list(
		"tgfont.css" = file("tgui/packages/tgfont/static/tgfont.css"),
	)

/datum/asset/simple/ntos
	assets = list(
		"alarm_green.gif" = 'nano/images/modular_computers/alarm_green.gif',
		"alarm_red.gif" = 'nano/images/modular_computers/alarm_red.gif',
		"batt_5.gif" = 'nano/images/modular_computers/batt_5.gif',
		"batt_20.gif" = 'nano/images/modular_computers/batt_20.gif',
		"batt_40.gif" = 'nano/images/modular_computers/batt_40.gif',
		"batt_60.gif" = 'nano/images/modular_computers/batt_60.gif',
		"batt_80.gif" = 'nano/images/modular_computers/batt_80.gif',
		"batt_100.gif" = 'nano/images/modular_computers/batt_100.gif',
		"charging.gif" = 'nano/images/modular_computers/charging.gif',
		"downloader_finished.gif" = 'nano/images/modular_computers/downloader_finished.gif',
		"downloader_paused.gif" = 'nano/images/modular_computers/downloader_paused.gif',
		"downloader_running.gif" = 'nano/images/modular_computers/downloader_running.gif',
		"ntnrc_idle.gif" = 'nano/images/modular_computers/ntnrc_idle.gif',
		"ntnrc_new.gif" = 'nano/images/modular_computers/ntnrc_new.gif',
		"power_norm.gif" = 'nano/images/modular_computers/power_norm.gif',
		"power_warn.gif" = 'nano/images/modular_computers/power_warn.gif',
		"satelite_on.gif" = 'nano/images/modular_computers/satelite_on.gif',
		"satelite_off.gif" = 'nano/images/modular_computers/satelite_off.gif',
		"shield.gif" = 'nano/images/modular_computers/shield.gif',
		"sig_high.gif" = 'nano/images/modular_computers/sig_high.gif',
		"sig_low.gif" = 'nano/images/modular_computers/sig_low.gif',
		"sig_lan.gif" = 'nano/images/modular_computers/sig_lan.gif',
		"sig_none.gif" = 'nano/images/modular_computers/sig_none.gif',
		"sig_warning.gif" = 'nano/images/modular_computers/sig_warning.gif',
		"smmon_0.gif" = 'nano/images/modular_computers/smmon_0.gif',
		"smmon_1.gif" = 'nano/images/modular_computers/smmon_1.gif',
		"smmon_2.gif" = 'nano/images/modular_computers/smmon_2.gif',
		"smmon_3.gif" = 'nano/images/modular_computers/smmon_3.gif',
		"smmon_4.gif" = 'nano/images/modular_computers/smmon_4.gif',
		"smmon_5.gif" = 'nano/images/modular_computers/smmon_5.gif',
		"smmon_6.gif" = 'nano/images/modular_computers/smmon_6.gif',
		// "borg_mon.gif" = 'nano/images/modular_computers/borg_mon.gif',
		// "robotact.gif" = 'nano/images/modular_computers/robotact.gif'
	)

/datum/asset/simple/namespaced/fontawesome
	assets = list(
		"fa-regular-400.eot"  = 'html/font-awesome/webfonts/fa-regular-400.eot',
		"fa-regular-400.woff" = 'html/font-awesome/webfonts/fa-regular-400.woff',
		"fa-solid-900.eot"    = 'html/font-awesome/webfonts/fa-solid-900.eot',
		"fa-solid-900.woff"   = 'html/font-awesome/webfonts/fa-solid-900.woff',
		"v4shim.css"          = 'html/font-awesome/css/v4-shims.min.css'
	)
	parents = list("font-awesome.css" = 'html/font-awesome/css/all.min.css')
