//This stuff was originally intended to be integrated into the ban-system I was working on
//but it's safe to say that'll never be finished. So I've merged it into the current player panel.
//enjoy				~Carn

#define NOTESFILE "data/player_notes.sav"	//where the player notes are saved

datum/admins/proc/notes_show(var/ckey)
	usr << browse("<head><title>Player Notes</title></head><body>[notes_gethtml(ckey)]</body>","window=player_notes;size=700x400")


datum/admins/proc/notes_gethtml(var/ckey)
	var/savefile/notesfile = new(NOTESFILE)
	if(!notesfile)
		return "<font color='red'>Error: Cannot access [NOTESFILE]</font>"

	if(ckey)
		. = "<b>Notes for <a href='?src=\ref[src];notes=show'>[ckey]</a>:</b> <a href='?src=\ref[src];notes=add;ckey=[ckey]'>\[+\]</a> <a href='?src=\ref[src];notes=remove;ckey=[ckey]'>\[-\]</a><br>"
		notesfile.cd = "/[ckey]"
		var/index = 1
		while( !notesfile.eof )
			var/note
			notesfile >> note
			. += "[note] <a href='?src=\ref[src];notes=remove;ckey=[ckey];from=[index]'>\[-\]</a><br>"
			index++
	else
		. = "<b>All Notes:</b> <a href='?src=\ref[src];notes=add'>\[+\]</a> <a href='?src=\ref[src];notes=remove'>\[-\]</a><br>"
		notesfile.cd = "/"
		for(var/dir in notesfile.dir)
			. += "<a href='?src=\ref[src];notes=show;ckey=[dir]'>[dir]</a><br>"
	return


//handles adding notes to the end of a ckey's buffer
//originally had seperate entries such as var/by to record who left the note and when
//but the current bansystem is a heap of dung.
/proc/notes_add(var/ckey, var/note)
	if(!ckey)
		ckey = ckey(input(usr,"Who would you like to add notes for?","Enter a ckey",null) as text|null)
		if(!ckey)	return

	if(!note)
		note = html_encode(input(usr,"Enter your note:","Enter some text",null) as message|null)
		if(!note)
			return

	var/savefile/notesfile = new(NOTESFILE)
	if(!notesfile)
		return
	notesfile.cd = "/[ckey]"
	notesfile.eof = 1		//move to the end of the buffer
	var message = "[time2text(world.realtime,"DD-MMM-YYYY")] | [note][(usr && usr.ckey)?" ~[usr.ckey]":""]"
	notesfile << message
	return

//handles removing entries from the buffer, or removing the entire directory if no start_index is given
/proc/notes_remove(var/ckey, var/start_index, var/end_index)
	var/savefile/notesfile = new(NOTESFILE)
	if(!notesfile)	return

	if(!ckey)
		notesfile.cd = "/"
		ckey = ckey(input(usr,"Who would you like to remove notes for?","Enter a ckey",null) as null|anything in notesfile.dir)
		if(!ckey)	return

	if(start_index)
		notesfile.cd = "/[ckey]"
		var/list/noteslist = list()
		if(!end_index)	end_index = start_index
		var/index = 0
		while( !notesfile.eof )
			index++
			var/temp
			notesfile >> temp
			if( (start_index <= index) && (index <= end_index) )
				continue
			noteslist += temp

		notesfile.eof = -2		//Move to the start of the buffer and then erase.

		for( var/note in noteslist )
			notesfile << note
	else
		notesfile.cd = "/"
		if(alert(usr,"Are you sure you want to remove all their notes?","Confirmation","No","Yes - Remove all notes") == "Yes - Remove all notes")
			notesfile.dir.Remove(ckey)
	return

#undef NOTESFILE



// AdminPM Logging stuff.

datum/admins/proc/adminpmhistory_show(var/ckey)
	usr << browse("<head><title>Player Admin-PM History</title></head><body>[adminpmhistory_gethtml(ckey)]</body>","window=adminpmhistory;size=700x400")

datum/admins/proc/adminpmhistory_gethtml(var/ckey)

	if(!ckey)
		return

	var/filePath = "data/player_saves/[copytext(ckey,1,2)]/[ckey]/adminPMHistory.sav"
	var/savefile/file = new(filePath)
	if(!file)
		return "<font color='red'>Error: Cannot access [filePath]</font>"

	. = "<b>AdmimPMHistory for [ckey]</b><br>"

	while( !file.eof )
		var/note
		file >> note
		. += "[note]<br>"

	return

/proc/log_adminPMHistory(var/ckeyTo, var/ckeyFrom, var/message)

	if(!ckeyTo)
		return

	if(!message)
		return

	var logMessage = "[time2text(world.realtime,"DD-MMM-YYYY")] - [time_stamp()] | [ckeyFrom]->[ckeyTo] | [message]"


	var/ckeyToFile = "data/player_saves/[copytext(ckeyTo,1,2)]/[ckeyTo]/adminPMHistory.sav"
	var/savefile/ckeyToSavefile = new(ckeyToFile)
	if(!ckeyToSavefile)
		return "<font color='red'>Error: Cannot access [ckeyToFile]</font>"

	ckeyToSavefile.eof = 1		//move to the end of the buffer
	ckeyToSavefile << logMessage

	if(ckeyTo != ckeyFrom)
		var/ckeyFromFile = "data/player_saves/[copytext(ckeyFrom,1,2)]/[ckeyFrom]/adminPMHistory.sav"
		var/savefile/ckeyFromSavefile = new(ckeyFromFile)
		if(!ckeyFromSavefile)
			return "<font color='red'>Error: Cannot access [ckeyFromFile]</font>"

		ckeyFromSavefile.eof = 1		//move to the end of the buffer
		ckeyFromSavefile << logMessage





	return