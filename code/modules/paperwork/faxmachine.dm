#define ERRORUNKNOWNDEPT "ERRORUNKNOWNDEPT"

var/ping = null

var/list/obj/machinery/photocopier/faxmachine/allfaxes = list()
var/list/alldepartments = list()
var/list/admin_departments = list()
var/list/adminfaxes = list()

/obj/machinery/photocopier/faxmachine
    name = "fax machine"
    icon = 'icons/obj/library.dmi'
    icon_state = "fax"
    insert_anim = "faxsend"
    req_one_access = null

    density = 0
    use_power = IDLE_POWER_USE
    idle_power_usage = 30
    active_power_usage = 200

    var/obj/item/card/id/scan = null
    var/authenticated = 0
    var/sendcooldown = 0
    var/department = "Unknown"
    var/destination = null
    var/canrecieve = TRUE

var/last_staff_request_time = 0

/obj/machinery/photocopier/faxmachine/New()
    ..()
    allfaxes += src
    if(!destination) destination = GLOB.faxable_factions_list[GLOB.faxable_factions_list.len]
    if( !(("[department]" in alldepartments) || ("[department]" in GLOB.admin_factions_list)) )
        alldepartments |= department

    // Populate admin_departments from GLOB.admin_factions_list
    for(var/faction_name in GLOB.admin_factions_list)
        admin_departments |= faction_name

/obj/machinery/photocopier/faxmachine/attack_hand(mob/user as mob)
    user.set_machine(src)
    var/dat = "Fax Machine<BR>"

    var/scan_name = scan ? scan.name : "--------"
    dat += "Confirm Identity: <a href='byond://?src=\ref[src];scan=1'>[scan_name]</a><br>"

    if(authenticated)
        dat += "<a href='byond://?src=\ref[src];logout=1'>{Log Out}</a>"
    else
        dat += "<a href='byond://?src=\ref[src];auth=1'>{Log In}</a>"

    dat += "<hr>"

    if(authenticated)
        dat += "<b>Logged in to:</b> Central Command Quantum Entanglement Network<br><br>"

        if(copyitem)
            dat += "<a href='byond://?src=\ref[src];remove=1'>Remove Item</a><br><br>"

            if(sendcooldown)
                dat += "<b>Transmitter arrays realigning. Please stand by.</b><br>"
            else
                dat += "<a href='byond://?src=\ref[src];send=1'>Send</a><br>"
                dat += "<b>Currently sending:</b> [copyitem.name]<br>"
                dat += "<b>Sending to:</b> <a href='byond://?src=\ref[src];dept=1'>[destination]</a><br>"
        else
            if(sendcooldown)
                dat += "Please insert paper to send via secure connection.<br><br>"
                dat += "<b>Transmitter arrays realigning. Please stand by.</b><br>"
            else
                dat += "Please insert paper to send via secure connection.<br><br>"

        dat += "<a href='byond://?src=\ref[src];staffrequest=1'>Send Automated Staff Request</a><br>"
    else
        dat += "Proper authentication is required to use this device.<br><br>"
        if(copyitem)
            dat += "<a href ='byond://?src=\ref[src];remove=1'>Remove Item</a><br>"

    user << browse(dat, "window=copier")
    onclose(user, "copier")
    return

/obj/machinery/photocopier/faxmachine/attackby(obj/item/I, mob/user)
    if(istype(I, /obj/item/card/id) && user.unEquip(I))
        insert_id(I)
        return
    . = ..()

/obj/machinery/photocopier/faxmachine/proc/insert_id(obj/item/card/id/id)
    if(istype(id, /obj/item/card/id))
        id.loc = src
        scan = id
        authenticated = 0

/obj/machinery/photocopier/faxmachine/Topic(href, href_list)
    if(href_list["send"])
        if(copyitem)
            // Check if destination is an admin faction
            if(destination in GLOB.admin_factions_list)
                send_admin_fax(usr, destination)
            else
                sendfax(destination)
            if(sendcooldown)
                spawn(sendcooldown)
                    sendcooldown = 0

    else if(href_list["remove"])
        if(copyitem)
            copyitem.loc = usr.loc
            usr.put_in_hands(copyitem)
            to_chat(usr, span_notice("You take \the [copyitem] out of \the [src]."))
            copyitem = null

    else if(href_list["scan"])
        if(scan)
            if(ishuman(usr))
                scan.loc = usr.loc
                if(!usr.get_active_hand())
                    usr.put_in_hands(scan)
                scan = null
            else
                scan.loc = src.loc
                scan = null
            authenticated = 0
        else
            var/obj/item/I = usr.get_active_hand()
            if(istype(I, /obj/item/card/id) && usr.unEquip(I))
                insert_id(I)

    else if(href_list["dept"])
        var/dest = input(usr, "Which department?", "Choose a department", "") as null|anything in (alldepartments + GLOB.faxable_factions_list)
        if(dest) destination = dest

    else if(href_list["auth"])
        if(!authenticated && scan)
            if(check_access(scan))
                authenticated = 1

    else if(href_list["logout"])
        authenticated = 0

    else if(href_list["staffrequest"])
        if(world.time - last_staff_request_time < 10 * 60 * 10)
            to_chat(usr, span_warning("You must wait before sending another staff request."))
            return
        var/list/dept_options = list(
            "Low Council",
            "Artificer's Guild",
            "Church",
            "Prospectors",
            "Security Roles",
            "SI Medical",
            "SI Research",
            "LSS Cargo",
            "LSS Service"
        )
        var/selected_dept = input(usr, "Select department to request staff from:", "Automated Staff Request") as null|anything in dept_options
        if(selected_dept)
            last_staff_request_time = world.time
            request_roles(selected_dept)
    updateUsrDialog()

/obj/machinery/photocopier/faxmachine/proc/request_roles(var/role_to_ping)
	// Optionally, you can prompt for reason/jobname here as well
	var/reason = input(usr, "Enter reason for request:", "Request Reason", "Unspecified") as text
	var/jobname = input(usr, "Enter job name (optional):", "Job Name", "") as text
	// Send the ping to the Discord relay (AphroditeBot.py expects TCP or webhook, here we use send2irc)
	var/ping_id = null
	switch(role_to_ping)
		if("Low Council") ping_id = "1342911886361890907"
		if("Artificer's Guild") ping_id = "1342911983673933936"
		if("Church") ping_id = "1342912183415083078"
		if("Prospectors") ping_id = "1342912254600806400"
		if("Security Roles") ping_id = "1342913722276118659"
		if("SI Medical") ping_id = "1342912277514420267"
		if("SI Research") ping_id = "1342912405176324269"
		if("LSS Cargo") ping_id = "1342912457156329595"
		if("LSS Service") ping_id = "1342912586802266193"
	if(ping_id)
		var/requester = (usr && usr.name) ? usr.name : "Unknown"
		// Add channel id for department pings
		var/msg = "ping:" + ping_id + " Job Request: " + jobname + " (" + reason + ") requested by " + requester + " channel:1345434730597843095"
		send2irc(msg)
	to_chat(usr, span_notice("Your request was transmitted."))

/obj/machinery/photocopier/faxmachine/proc/sendfax(var/destination)
    if(stat & (BROKEN|NOPOWER))
        return
    use_power(200)
    var/success = 0
    for(var/obj/machinery/photocopier/faxmachine/F in allfaxes)
        if(F.department == destination)
            success |= F.recievefax(copyitem)
    if(success)
        visible_message("[src] beeps, \"Message transmitted successfully.\"")
    else
        visible_message("[src] beeps, \"Error transmitting message.\"")

/obj/machinery/photocopier/faxmachine/proc/recievefax(var/obj/item/incoming)
    if(stat & (BROKEN|NOPOWER))
        return 0
    flick("faxreceive", src)
    playsound(loc, "sound/items/polaroid1.ogg", 50, 1)
    sleep(20)
    if(istype(incoming, /obj/item/paper))
        copy(incoming)
    else if(istype(incoming, /obj/item/photo))
        photocopy(incoming)
    else if(istype(incoming, /obj/item/paper_bundle))
        bundlecopy(incoming)
    else
        return 0
    return 1

/obj/machinery/photocopier/faxmachine/proc/send_admin_fax(var/mob/sender, var/destination)
    if(stat & (BROKEN|NOPOWER))
        return
    use_power(200)
    var/obj/item/rcvdcopy
    if(istype(copyitem, /obj/item/paper))
        rcvdcopy = copy(copyitem)
    else if(istype(copyitem, /obj/item/photo))
        rcvdcopy = photocopy(copyitem)
    else if(istype(copyitem, /obj/item/paper_bundle))
        rcvdcopy = bundlecopy(copyitem, 0)
    else
        visible_message("[src] beeps, \"Error transmitting message.\"")
        return
    rcvdcopy.loc = locate("Admin Fax"):loc
    adminfaxes += rcvdcopy
    var/datum/faction/dept = GLOB.admin_factions_list[destination]
    message_admins(sender, dept.fax_alert, rcvdcopy, destination, dept.darkcolor)
    sendcooldown = 1800
    visible_message("[src] beeps, \"Message transmitted successfully.\"")

/obj/machinery/photocopier/faxmachine/proc/message_admins(var/mob/sender, var/faxname, var/obj/item/sent, var/reply_faction, font_colour="#006100")
    var/msg = "\blue <b><font color='[font_colour]'>[faxname]: </font>[key_name(sender, 1)] (<A HREF='?_src_=holder;adminplayeropts=\ref[sender]'>PP</A>) (<A HREF='?_src_=vars;Vars=\ref[sender]'>VV</A>) (<A HREF='?_src_=holder;subtlemessage=\ref[sender]'>SM</A>) ([admin_jump_link(sender, src)]) (<A HREF='?_src_=holder;secretsadmin=check_antagonist'>CA</A>) (<a href='?_src_=holder;FaxReply=\ref[sender];originfax=\ref[src];faction=[reply_faction]'>REPLY</a>)</b>: Receiving '[sent.name]' via secure connection ... <a href='?_src_=holder;AdminFaxView=\ref[sent]'>view message</a>"

    for(var/client/C in admins)
        if((R_ADMIN & C.holder.rights) || (R_MOD & C.holder.rights))
            to_chat(C, "[create_text_tag("fax", "FAX:", C)] [msg]")
    var/faxid = export_fax(sent)
    message_chat_admins(sender, faxname, sent, faxid, font_colour)

/obj/machinery/photocopier/faxmachine/proc/export_fax(fax)
    var/date_string = time2text(world.realtime, "YYYY/MM-Month/DD-Day")
    var/export_dir = "data/logs/faxes/[date_string]"
    var faxid = "[num2text(world.realtime,12)]_[rand(10000)]"
    var/html_content = ""
    if (istype(fax, /obj/item/paper))
        var/obj/item/paper/P = fax
        html_content = "<HTML><HEAD><TITLE>[P.name]</TITLE></HEAD><BODY>[P.info][P.stamps]</BODY></HTML>"
        file("[export_dir]/fax_[faxid].html") << html_content
    else if (istype(fax, /obj/item/photo))
        var/obj/item/photo/H = fax
        fcopy(H.img, "[export_dir]/photo_[faxid].png")
        html_content = "<html><head><title>[H.name]</title></head>" \
            + "<body style='overflow:hidden;margin:0;text-align:center'>" \
            + "<img src='photo_[faxid].png'>" \
            + "[H.scribble ? "<br>Written on the back:<br><i>[H.scribble]</i>" : ""]"\
            + "</body></html>"
        file("[export_dir]/fax_[faxid].html") << html_content
    else if (istype(fax, /obj/item/paper_bundle))
        var/obj/item/paper_bundle/B = fax
        var/data = ""
        for (var/page = 1, page <= B.pages.len, page++)
            var/obj/pageobj = B.pages[page]
            var/page_faxid = export_fax(pageobj)
            data += "<a href='fax_[page_faxid].html'>Page [page] - [pageobj.name]</a><br>"
        html_content = "<html><head><title>[B.name]</title></head><body>[data]</body></html>"
        file("[export_dir]/fax_[faxid].html") << html_content
    return faxid

/obj/machinery/photocopier/faxmachine/proc/message_chat_admins(var/mob/sender, var/faxname, var/obj/item/sent, var/faxid, font_colour="#006100")
    var/sender_ckey = sender?.ckey ? sender.ckey : "Unknown"
    var/sender_char_name = sender?.real_name ? sender.real_name : "Unknown"
    var/auth_name = scan?.registered_name ? scan.registered_name : "No ID"

    if (istype(sent, /obj/item/paper))
        var/obj/item/paper/P = sent
        var/html_content = "<HTML><HEAD><TITLE>[P.name]</TITLE></HEAD><BODY>[P.info][P.stamps]</BODY></HTML>"
        var/msg = "FAX: [faxname] '[sent.name]' sent from [key_name(sender)] ([sender_ckey]) as [sender_char_name] (ID: [auth_name])\nHTML Render:\n[html_content]"
        send2irc(msg)
    else if (istype(sent, /obj/item/photo))
        var/obj/item/photo/H = sent
        var/html_content = "<html><head><title>[H.name]</title></head>" \
            + "<body style='overflow:hidden;margin:0;text-align:center'>" \
            + "<img src='photo_[faxid].png'>" \
            + "[H.scribble ? "<br>Written on the back:<br><i>[H.scribble]</i>" : ""]"\
            + "</body></html>"
        var/msg = "FAX: [faxname] '[sent.name]' sent from [key_name(sender)] ([sender_ckey]) as [sender_char_name] (ID: [auth_name])\nHTML Render:\n[html_content]"
        send2irc(msg)
    else if (istype(sent, /obj/item/paper_bundle))
        var/obj/item/paper_bundle/B = sent
        for (var/page = 1, page <= B.pages.len, page++)
            var/obj/pageobj = B.pages[page]
            var/page_html_content = ""
            if (istype(pageobj, /obj/item/paper))
                var/obj/item/paper/PP = pageobj
                page_html_content = "<HTML><HEAD><TITLE>[PP.name]</TITLE></HEAD><BODY>[PP.info][PP.stamps]</BODY></HTML>"
            else if (istype(pageobj, /obj/item/photo))
                var/obj/item/photo/HH = pageobj
                var/page_faxid = export_fax(pageobj)
                page_html_content = "<html><head><title>[HH.name]</title></head>" \
                    + "<body style='overflow:hidden;margin:0;text-align:center'>" \
                    + "<img src='photo_[page_faxid].png'>" \
                    + "[HH.scribble ? "<br>Written on the back:<br><i>[HH.scribble]</i>" : ""]"\
                    + "</body></html>"

            if (page == 1)
                var/page_msg = "FAX: [faxname] '[pageobj.name]' (Page [page] of [B.pages.len]) sent from [key_name(sender)] ([sender_ckey]) as [sender_char_name] (ID: [auth_name])\nHTML Render:\n[page_html_content]"
                send2irc(page_msg)
                // Add small delay between fax and first attachment
                sleep(0.1)
            else
                var/attachment_msg = "ATTACHMENT: [page_html_content]"
                send2irc(attachment_msg)
                // Add small delay between attachments
                sleep(0.1)
