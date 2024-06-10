/proc/get_game_time()
	var/global/time_offset = 0
	var/global/last_time = 0
	var/global/last_usage = 0

	var/wtime = world.time
	var/wusage = world.tick_usage * 0.01

	if(last_time < wtime && last_usage > 1)
		time_offset += last_usage - 1

	last_time = wtime
	last_usage = wusage

	return wtime + (time_offset + wusage) * world.tick_lag

var/roundstart_hour = servertime2nums(1) //The hour in GMT that the server started. This will be adjusted for timezone by all time2text procs
var/true_roundstart_hour = roundstart_hour + world.timezone //For use in any day/night calculations, this is the roundstart hour as it will actually appear
var/station_date = ""
var/next_station_date_change = 1 DAYS

#define station_adjusted_time(time) time2text(time + station_time_in_ticks, "hh:mm")
#define worldtime2stationtime(time) time2text(roundstart_hour HOURS + time - round_start_time, "hh:mm")
#define roundduration2text_in_ticks (round_start_time ? world.time - round_start_time : 0)
#define station_time_in_ticks (roundstart_hour HOURS + roundduration2text_in_ticks)

/proc/stationtime2text()
	return time2text(station_time_in_ticks, "hh:mm")

/proc/stationdate2text()
	var/update_time = FALSE
	if(station_time_in_ticks > next_station_date_change)
		next_station_date_change += 1 DAYS
		update_time = TRUE
	if(!station_date || update_time)
		var/extra_days = round(station_time_in_ticks / (1 DAYS)) DAYS
		var/timeofday = world.timeofday + extra_days
		station_date = num2text((text2num(time2text(timeofday, "YYYY")) + 629)) + "-" + time2text(timeofday, "MM-DD")
	return station_date

/proc/time_stamp()
	return time2text(world.timeofday, "hh:mm:ss")


//Returns the world time in english
/proc/worldtime2text(time = world.time, timeshift = 1)
	return timeshift ? time2text(time+(roundstart_hour HOURS), "hh:mm") : time2text(time, "hh:mm")

/proc/time2nums(T, precision = 2, floorit = FALSE) //T = time in deciseconds. Proc returns T in time form without a colon
	if(T > 864000) //Times greater than 1 day get reduced to a time less than 24 hours
		T %= 864000
	var/sec = round(T/10) //Gives us the time in seconds rather than deciseconds.
	var/midhours
	var/midminutes
	var/midseconds
	var/output
	switch(precision) //Precision is how many places we calculate. 1 returns hh, 2 returns hhmm, 3 returns hhmmss. Default is 2
		if(1)
			midhours = sec/3600 //Number of seconds in an hour
			if(floorit) //Do we always round down?
				output = round(midhours)
			else //Or do we round to nearest?
				output = round(midhours, 1)
		if(2)
			midhours = round(sec/3600) //Number of whole hours within our seconds
			midminutes = (sec%3600)/60 //Number of minutes in the remainder
			if(floorit)
				output = midhours*100+round(midminutes)
			else
				output = midhours*100+round(midminutes, 1)
		if(3)
			midhours = round(sec/3600) //Number of whole hours within our seconds
			midminutes = round((sec%3600)/60) //Number of whole minutes within our remaining seconds
			midseconds = (sec%60)
			output = midhours*1000+midminutes*100+midseconds //No need to option the rounding here, seconds are floored in line 1
		else //Someone specified a precision outside the bounds? That's a paddlin
			log_and_message_admins("time2nums was called by an idiot who gave it invalid precision. Yell at them in #code-dev.")
			output = 0
	return output

/proc/servertime2nums(precision = 2) //Should return the UTC time, precision as above
	return time2nums(world.timeofday, precision)

/proc/getroundstarthour()
	return true_roundstart_hour

/proc/worldtime2hours()
	if (!roundstart_hour)
		worldtime2text()
	. = text2num(time2text(world.time + (roundstart_hour HOURS), "hh"))

/proc/worlddate2text()
	return num2text(game_year) + "-" + time2text(world.timeofday, "MM-DD")


/* Returns 1 if it is the selected month and day */
proc/isDay(var/month, var/day)
	if(isnum(month) && isnum(day))
		var/MM = text2num(time2text(world.timeofday, "MM")) // get the current month
		var/DD = text2num(time2text(world.timeofday, "DD")) // get the current day
		if(month == MM && day == DD)
			return 1

		// Uncomment this out when debugging!
		//else
			//return 1

var/next_duration_update = 0
var/last_roundduration2text = 0
var/last_rounddurationcountdown2text = 0
var/last_rounddurationcountdown2text_update =0
var/endtime
var/round_start_time = 0

/hook/roundstart/proc/start_timer()
	round_start_time = world.time
	return 1

/proc/roundduration2text()
	if(!round_start_time)
		return "00:00"
	if(last_roundduration2text && world.time < next_duration_update)
		return last_roundduration2text

	var/mills = roundduration2text_in_ticks // 1/10 of a second, not real milliseconds but whatever
	//var/secs = ((mills % 36000) % 600) / 10 //Not really needed, but I'll leave it here for refrence.. or something
	var/mins = round((mills % 36000) / 600)
	var/hours = round(mills / 36000)

	mins = mins < 10 ? add_zero(mins, 1) : mins
	hours = hours < 10 ? add_zero(hours, 1) : hours

	last_roundduration2text = "[hours]:[mins]"
	next_duration_update = world.time + 1 MINUTES
	return last_roundduration2text

/proc/rounddurationcountdown2text(delay)
	if(!round_start_time)
		return "00:00"
	if(last_rounddurationcountdown2text && world.time < last_rounddurationcountdown2text_update)
		return last_rounddurationcountdown2text
	//var/secs = ((mills % 36000) % 600) / 10 //Not really needed, but I'll leave it here for refrence.. or something
	if(delay && !endtime)
		endtime = delay + 1 MINUTE
	if(!endtime)
		return "N/A"
	endtime = endtime - 1 MINUTE
	last_rounddurationcountdown2text = "[endtime/600] minutes left until round end!"
	last_rounddurationcountdown2text_update = world.time + 1 MINUTES
	return last_rounddurationcountdown2text

var/global/midnight_rollovers = 0
var/global/rollovercheck_last_timeofday = 0

/proc/update_midnight_rollover()
	if (world.timeofday < rollovercheck_last_timeofday) //TIME IS GOING BACKWARDS!
		return midnight_rollovers++
	return midnight_rollovers

/proc/ticks_to_text(var/ticks)
	if(ticks%1 != 0)
		return "ERROR"
	var/response = ""
	var/counter = 0
	while(ticks >= 1 DAYS)
		ticks -= 1 DAYS
		counter++
	if(counter)
		response += "[counter] Day[counter>1 ? "s" : ""][ticks ? ", " : ""]"
	counter=0
	while(ticks >= 1 HOURS)
		ticks -= 1 HOURS
		counter++
	if(counter)
		response += "[counter] Hour[counter>1 ? "s" : ""][ticks?", ":""]"
	counter=0
	while(ticks >= 1 MINUTES)
		ticks -= 1 MINUTES
		counter++
	if(counter)
		response += "[counter] Minute[counter>1 ? "s" : ""][ticks?", ":""]"
		counter=0
	while(ticks >= 1 SECONDS)
		ticks -= 1 SECONDS
		counter++
	if(counter)
		response += "[counter][ticks?".[ticks]" : ""] Second[counter>1 ? "s" : ""]"
	return response
