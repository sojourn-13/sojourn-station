//Verbs

ADMIN_VERB_ADD(/client/proc/openAdminTicketUI, R_ADMIN|R_MOD|R_MENTOR|R_DEBUG, FALSE)
/client/proc/openAdminTicketUI()
	set category = "Admin.Tickets"
	set name = "Open Admin Ticket Interface"

	if(!check_rights(R_ADMIN|R_MOD|R_MENTOR|R_DEBUG))
		return

	SStickets.showUI(usr)

ADMIN_VERB_ADD(/client/proc/resolveAllAdminTickets, R_ADMIN|R_MOD, FALSE)
/client/proc/resolveAllAdminTickets()
	set category = "Admin.Tickets"
	set name = "Resolve All Open Admin Tickets"

	if(!check_rights(R_ADMIN|R_MOD))
		return

	if(alert("Are you sure you want to resolve ALL open admin tickets?","Resolve all open admin tickets?","Yes","No") != "Yes")
		return

	SStickets.resolveAllOpenTickets()

//This shouldn't be permissions locked.
/client/verb/openAdminUserUI()
	set category = "Admin.Tickets"
	set name = "My Admin Tickets"
	SStickets.userDetailUI(usr)
