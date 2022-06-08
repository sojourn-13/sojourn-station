#define SHIPPING_SCREEN "Shipping Log"
#define EXPORT_SCREEN "Export Log"
#define OFFER_SCREEN "Offer Log"
#define SALE_SCREEN "Sale Log"
#define SCREEN_LIST list(SHIPPING_SCREEN, EXPORT_SCREEN, OFFER_SCREEN, SALE_SCREEN)

/datum/computer_file/program/trade_logs
	filename = "trade_logs"
	filedesc = "LSS\'s Trade Beacon Logs"
	extended_desc = "Digital log showing all trade beacon transactions made by your account."
	program_icon_state = "generic"
	program_key_state = "generic_key"
	size = 2
	requires_ntnet = TRUE
	available_on_ntnet = TRUE
	nanomodule_path = /datum/nano_module/program/trade_logs
	usage_flags = PROGRAM_ALL

	var/screen = null
	var/datum/money_account/account


/datum/computer_file/program/trade_logs/Topic(href, href_list)
	. = ..()
	if(.)
		return

	if(href_list["PRG_goods_category"])

		return TRUE

	if(href_list["PRG_screen"])
		screen = input("Select log type", "Log Type", null) as null|anything in SCREEN_LIST
		return TRUE

	if(href_list["PRG_account"])
		var/acc_num = input("Enter account number", "Account linking", computer?.card_slot?.stored_card?.associated_account_number) as num|null
		if(!acc_num)
			return

		var/acc_pin = input("Enter PIN", "Account linking") as num|null
		if(!acc_pin)
			return

		var/card_check = computer?.card_slot?.stored_card?.associated_account_number == acc_num
		var/datum/money_account/A = attempt_account_access(acc_num, acc_pin, card_check ? 2 : 1, TRUE)
		if(!A)
			to_chat(usr, SPAN_WARNING("Unable to link account: access denied."))
			return

		account = A
		return TRUE


/datum/nano_module/program/trade_logs
	name = "Trade Beacon Logs"

/datum/nano_module/program/trade_logs/nano_ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = NANOUI_FOCUS, state = GLOB.default_state)
	var/list/data = ui_data(user)
	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "trade_logs.tmpl", name, 640, 700, state = state)
		ui.set_auto_update(TRUE)
		ui.set_initial_data(data)
		ui.open()

/datum/nano_module/program/trade_logs/ui_data()
	. = ..()
	var/datum/computer_file/program/trade_logs/PRG = program
	if(!istype(PRG))
		return

	.["screen"] = PRG.screen

	if(PRG.account)
		.["account"] = "[PRG.account.get_name()] #[PRG.account.account_number]"
		.["is_all_access"] = FALSE
		var/dept_id = PRG.account.department_id
		if(dept_id)
			.["is_all_access"] = ((dept_id in DEPARTMENT_LSS) || (dept_id in DEPARTMENT_SECURITY)) ? TRUE : FALSE

	.["current_log_data"] = null

	switch(PRG.screen)
		if(SHIPPING_SCREEN)
			.["current_log_data"] = SStrade.shipping_log
		if(EXPORT_SCREEN)
			.["current_log_data"] = SStrade.export_log
		if(OFFER_SCREEN)
			.["current_log_data"] = SStrade.offer_log
		if(SALE_SCREEN)
			.["current_log_data"] = SStrade.sale_log
		else
			.["current_log_data"] = null

#undef SHIPPING_SCREEN
#undef EXPORT_SCREEN
#undef OFFER_SCREEN
#undef SALE_SCREEN
#undef SCREEN_LIST