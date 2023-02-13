//Please use mob or src (not usr) in these procs. This way they can be called in the same fashion as procs.
/client/verb/wikiurl()
	set name = "wikiurl"
	set desc = "Visit the wiki."
	set hidden = 1
	if( config.wikiurl )
		if(alert("This will open the wiki in your browser. Are you sure?",,"Yes","No")=="No")
			return
		src << link(config.wikiurl)
	else
		to_chat(src, SPAN_WARNING("The wiki URL is not set in the server configuration."))
	return

/client/verb/discordurl()
	set name = "discordurl"
	set desc = "Visit the Discord Server."
	set hidden = 1
	if( config.discordurl )
		if(alert("This will open the Discord invite in your browser. Are you sure?",,"Yes","No")=="No")
			return
		src << link(config.discordurl)
	else
		to_chat(src, SPAN_WARNING("The Discord invite is not set in the server configuration."))
	return

/client/verb/githuburl()
	set name = "githuburl"
	set desc = "Visit the Github."
	set hidden = 1
	if( config.githuburl )
		if(alert("This will open the Github page in your browser. Are you sure?",,"Yes","No")=="No")
			return
		src << link(config.githuburl)
	else
		to_chat(src, SPAN_WARNING("The Github is not set in the server configuration."))
	return


#define RULES_FILE "config/rules.html"
/client/verb/rules()
	set name = "Rules"
	set desc = "Show Server Rules."
	set hidden = 1
	src << browse(file(RULES_FILE), "window=rules;size=480x320")
#undef RULES_FILE

/client/verb/hotkeys_help()
	set name = "hotkeys-help"
	set category = "OOC"

	var/admin = {"<font color='purple'>
	Admin:
	\tF5 = Aghost (admin-ghost)
	\tF6 = player-panel
	\tF7 = admin-pm
	\tF8 = Invisimin
	Admin Ghost:
	\tShift + Ctrl + Click = View Variables
</font>"}

	var/hotkey_mode = {"<font color='purple'>
Режим горячих клавиш (горячие клавиши должны быть включены)
\tTAB = включить режим горячих клавиш
\ta = влево
\ts = вниз
\td = вправо
\tw = вверх
\tq = положить
\te = экипировать
\tr = бросить
\tt = говорить
\t5 = описывать действия персонажа
\tx = переключить активную руку
\tz = активировать предмет в активной руке (или y)
\tj = переключить режим прицеливания
\tf = переключить намерения влево
\tg = переключить намеренья вправо
\t1 = намеренье помощи
\t2 = намеренье разоружения
\t3 = намеренье захвата
\t4 = намеренье вреда
\tCtrl = тащить
\tShift = осмотреть
</font>"}

	var/other = {"<font color='purple'>
Любой-режим: (Включённый режим горячих клавиш не требуется)
\tCtrl+a = влево
\tCtrl+s = вниз
\tCtrl+d = вправо
\tCtrl+w = вверх
\tCtrl+q = положить
\tCtrl+e = экипировать
\tCtrl+r = бросить
\tCtrl+x = переключить активную руку
\tCtrl+z =активировать предмет в активной руке (или Ctrl+y)
\tCtrl+f = переключать намеренья влево
\tCtrl+g = переключать намеренья вправо
\tCtrl+1 = намеренье помощи
\tCtrl+2 = намеренье разоружения
\tCtrl+3 = намеренье захвата
\tCtrl+4 = намеренье вреда
\tF1 = помощь администрации
\tF2 = внеигровой чат
\tF3 = говорить
\tF4 = описывать действия персонажа
\tDEL = тащить
\tINS = переключать намеренья вправо
\tHOME = положить
\tPGUP = переключить активную руку
\tPGDN = активировать предмет в активной руке
\tEND = бросить
</font>"}

	var/robot_hotkey_mode = {"<font color='purple'>
Режим горячих клавиш: (режим горячих клавиш должен быть включён)
\tTAB = включить режим горячих клавиш
\ta = влево
\ts = вниз
\td = вправо
\tw = вверх
\tq = убрать активный модуль
\tt = говорить
\tx = переключать активные модули
\tz = активировать предмет в руке (или y)
\tf = переключать намеренья влево
\tg = переключать намеренья вправо
\t1 = активировать модуль 1
\t2 = активировать модуль 2
\t3 = активировать модуль 3
\t4 = переключить намеренья
\t5 = описывать действия персонажа
\tCtrl = тащить
\tShift = осмотреть
</font>"}

	var/robot_other = {"<font color='purple'>
Любой-режим: (Включённый режим горячих клавиш не требуется)
\tCtrl+a = влево
\tCtrl+s = вниз
\tCtrl+d = вправо
\tCtrl+w = вверх
\tCtrl+q = снять активный модуль
\tCtrl+x = переключать активные модули
\tCtrl+z = активировать объект в руке (или Ctrl+y)
\tCtrl+f = переключать-намеренья-влево
\tCtrl+g = переключать-намеренья-вправо
\tCtrl+1 = активация модуля 1
\tCtrl+2 = активация модуля 2
\tCtrl+3 = активация модуля 3
\tCtrl+4 = переключить намеренья
\tF1 = помощь администрации
\tF2 = внеигровой чат
\tF3 = говорить
\tF4 = описывать действия персонажа
\tDEL = тащить
\tINS = переключить взаимодействия
\tPGUP = переключать активные модули
\tPGDN = активировать объект в руке
</font>"}

	if(isrobot(src.mob))
		to_chat(src, robot_hotkey_mode)
		to_chat(src, robot_other)
	else
		to_chat(src, hotkey_mode)
		to_chat(src, other)
	if(holder)
		to_chat(src, admin)

/client/verb/changelog()
	set name = "Changelog"
	set category = "OOC"
	if(!GLOB.changelog_tgui)
		GLOB.changelog_tgui = new /datum/changelog()

	GLOB.changelog_tgui.ui_interact(mob)
	if(prefs.lastchangelog != changelog_hash)
		prefs.lastchangelog = changelog_hash
		prefs.save_preferences()
		winset(src, "rpane.changelog", "background-color=none;font-style=;")
