//Please use mob or src (not usr) in these procs. This way they can be called in the same fashion as procs.
/client/verb/wiki()
	set name = "wiki"
	set desc = "Visit the wiki."
	set hidden = TRUE
	var/wikiurl = config.wikiurl
	if(wikiurl)
		src << link(wikiurl)
	else
		to_chat(src, SPAN_DANGER("The wiki URL is not set in the server configuration."))

/client/verb/discord()
	set name = "discord"
	set desc = "Visit the Discord Server."
	set hidden = TRUE
	var/discordurl = config.discordurl
	if(discordurl)
		src << link(discordurl)
	else
		to_chat(src, SPAN_WARNING("The Discord invite is not set in the server configuration."))

/client/verb/github()
	set name = "github"
	set desc = "Visit the Github."
	set hidden = TRUE
	var/githuburl = config.githuburl
	if(githuburl)
		src << link(githuburl)
	else
		to_chat(src, SPAN_WARNING("The Github is not set in the server configuration."))

/client/verb/tickets()
	set name = "tickets"
	set desc = "View open admin tickets"
	set hidden = TRUE
	openAdminUserUI()

#define RULES_FILE "config/rules.html"
/client/verb/rules()
	set name = "Rules"
	set desc = "Show Server Rules."
	set hidden = TRUE
	src << browse(file(RULES_FILE), "window=rules;size=480x320")
#undef RULES_FILE

/client/verb/changelog()
	set name = "Changelog"
	set desc = "See what's new"
	set hidden = TRUE

	if(!GLOB.changelog_tgui)
		GLOB.changelog_tgui = new /datum/changelog()

	GLOB.changelog_tgui.ui_interact(mob)
	if(prefs.lastchangelog != changelog_hash)
		prefs.lastchangelog = changelog_hash
		prefs.save_preferences()
		winset(src, "rpane.changelog", "background-color=none;font-style=;")

/client/verb/hotkeys_help()
	set name = "Hotkeys Help"
	set category = "OOC"

	var/static/admin = {"<font color='purple'>
	Admin:
	\tF5 = Aghost (admin-ghost)
	\tF6 = player-panel
	\tF7 = admin-pm
	\tF8 = Invisimin
	Admin Ghost:
	\tShift + Ctrl + Click = View Variables
	</font>"}

	var/static/default = {"<font color='blue'>
	Hotkey-Mode: (hotkey-mode must be on)
	\tTAB = change focus between the chat and the game
	\ta = left
	\ts = down
	\td = right
	\tw = up
	\tq = drop
	\te = equip
	\tf = block
	\tb = resist
	\tc = rest
	\tShift+e = belt-equip
	\tShift+q = suit-storage-equip
	\tShift+b = bag-equip
	\tr = throw
	\tt = say
	\t5 = emote
	\tx = swap-hand
	\tz = activate held object (or y)
	\tl = toogle flashlight
	\tj = toggle-aiming-mode
	\tf = cycle-intents-left
	\tg = cycle-intents-right
	\t1 = help-intent
	\t2 = disarm-intent
	\t3 = grab-intent
	\t4 = harm-intent
	\tCtrl = drag
	\tShift = examine
	\tF11 = toggle fullscreen
	</font>"}

	var/static/robot = {"<font color='purple'>
	\tTAB = change focus between the chat and the game
	\ta = left
	\ts = down
	\td = right
	\tw = up
	\tq = unequip active module
	\tt = say
	\tx = cycle active modules
	\tz = activate held object (or y)
	\tf = cycle-intents-left
	\tg = cycle-intents-right
	\t1 = activate module 1
	\t2 = activate module 2
	\t3 = activate module 3
	\t4 = toggle intents
	\t5 = emote
	\tCtrl = drag
	\tShift = examine
	\tF11 = toggle fullscreen
	</font>"}

	if(isrobot(mob))
		to_chat(src, robot)
	else
		to_chat(src, default)
	if(holder)
		to_chat(src, admin)
