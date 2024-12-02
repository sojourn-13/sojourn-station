//Temporarily disabled, due to computer stuff

/var/global/account_hack_attempted = 0

/datum/event/money_hacker
	var/datum/money_account/affected_account
	endWhen = 100
	var/end_time

/datum/event/money_hacker/setup()
	end_time = world.time + 6000
	if(all_money_accounts.len)
		affected_account = pick(all_money_accounts)

		account_hack_attempted = 1
	else
		kill()

/datum/event/money_hacker/announce()
	var/message = "Обнаружен взлом методом грубой силы. ( целью атаки является [stationtime2text()]).Целью атаки является: Финансовый счет #[affected_account.account_number], \
	Без вмешательства эта атака завершится примерно через 10 минут. Требуемое вмешательство: временная приостановка работы затронутых учетных записей до прекращения атаки. \
	Уведомления будут рассылаться по мере обновления.<br>"
	var/my_department = "[station_name()] firewall subroutines"

	for(var/obj/machinery/message_server/MS in world)
		if(!MS.active) continue
		MS.send_rc_message("First Officer's Desk", my_department, message, "", "", 2)


/datum/event/money_hacker/tick()
	if(world.time >= end_time)
		endWhen = activeFor
	else
		endWhen = activeFor + 10

/datum/event/money_hacker/end()
	var/message
	if(affected_account && !affected_account)
		//hacker wins
		message = "Попытка взлома удалась."

		//subtract the money
		var/lost = affected_account.money * 0.8 + (rand(2,4) - 2) / 10
		affected_account.money -= lost

		//create a taunting log entry
		var/datum/transaction/T = new
		T.target_name = pick("","йо братан из анота мота","el Presidente","chieF smackDowN")
		T.purpose = pick("Ne$ ---ount fu%ds init*&lisat@*n","ВЕРНИСЬ К МАМЕ","Funds withdrawal","pWnAgE","l33t hax","liberationez")
		T.amount = pick("","([rand(0,99999)])","alla money","9001$","HOLLA HOLLA GET DOLLA","([lost])")
		var/date1 = "31 December, 1999"
		var/date2 = "[num2text(rand(1,31))] [pick("January","February","March","April","May","June","July","August","September","October","November","December")], [rand(1000,3000)]"
		T.date = pick("", current_date_string, date1, date2)
		var/time1 = rand(0, 99999999)
		var/time2 = "[round(time1 / 36000)+12]:[(time1 / 600 % 60) < 10 ? add_zero(time1 / 600 % 60, 1) : time1 / 600 % 60]"
		T.time = pick("", stationtime2text(), time2)
		T.source_terminal = pick("","[pick("Biesel","New Gibson")] GalaxyNet Terminal #[rand(111,999)]","место твоей мамы","Надерпжда высокий комманД")

		T.apply_to(affected_account)

	else
		//crew wins
		message = "Атака прекратилась, пострадавшие аккаунты теперь можно вывести в сеть."

	var/my_department = "[station_name()] firewall subroutines"

	for(var/obj/machinery/message_server/MS in world)
		if(!MS.active) continue
		MS.send_rc_message("First Officer's Desk", my_department, message, "", "", 2)
