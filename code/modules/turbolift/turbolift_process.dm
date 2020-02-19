SUBSYSTEM_DEF(turbolift)
	name = "Turbolift controller"
	wait = 10
	runlevels = RUNLEVEL_LOBBY | RUNLEVEL_SETUP | RUNLEVEL_GAME



	var/list/moving_lifts = list()


/datum/controller/subsystem/turbolift/fire()
	for(var/liftref in moving_lifts)

		if(world.time < moving_lifts[liftref])
			continue
		var/datum/turbolift/lift = locate(liftref)
		if(lift.busy)
			continue
		spawn(0)
			lift.busy = 1
			var/floor_delay
			if(!(floor_delay = lift.do_move()))
				moving_lifts[liftref] = null
				moving_lifts -= liftref
				if(lift.target_stop)
					lift.target_stop.ext_panel.reset()
					lift.target_stop = null
			else
				lift_is_moving(lift,floor_delay)
			lift.busy = 0


/datum/controller/subsystem/turbolift/proc/lift_is_moving(var/datum/turbolift/lift,var/floor_delay)
	moving_lifts["\ref[lift]"] = world.time + floor_delay
