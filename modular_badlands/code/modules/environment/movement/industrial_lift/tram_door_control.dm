//how long it spends on each floor when moving somewhere, so it'd take 4 seconds to reach you if it had to travel up 2 floors
#define FLOOR_TRAVEL_TIME 2 SECONDS
/obj/item/assembly/control/elevator
	name = "elevator controller"
	desc = "A small device used to call elevators to the current floor."

/obj/item/assembly/control/elevator/activate()
	if(cooldown)
		return
	cooldown = TRUE
	var/obj/structure/industrial_lift/lift
	for(var/l in GLOB.lifts)
		var/obj/structure/industrial_lift/possible_lift = l
		if(possible_lift.id != id || possible_lift.z == z || possible_lift.controls_locked)
			continue
		lift = possible_lift
		break
	if(!lift)
		addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 2 SECONDS)
		return
	lift.visible_message("<span class='notice'>[src] clinks and whirrs into automated motion, locking controls.</span")
	lift.lift_master_datum.set_controls(LOCKED)
	///The z level to which the elevator should travel
	var/targetZ = (abs(loc.z)) //The target Z (where the elevator should move to) is not our z level (we are just some assembly in nullspace) but actually the Z level of whatever we are contained in (e.g. elevator button)
	///The amount of z levels between the our and targetZ
	var/difference = abs(targetZ - lift.z)
	///Direction (up/down) needed to go to reach targetZ
	var/direction = lift.z < targetZ ? UP : DOWN
	///How long it will/should take us to reach the target Z level
	var/travel_duration = FLOOR_TRAVEL_TIME * difference //100 / 2 floors up = 50 seconds on every floor, will always reach destination in the same time
	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), travel_duration)
	for(var/i in 1 to difference)
		sleep(FLOOR_TRAVEL_TIME)//hey this should be alright... right?
		if(QDELETED(lift) || QDELETED(src))//elevator control or button gone = don't go up anymore
			return
		lift.lift_master_datum.MoveLift(direction, null)
	lift.visible_message("<span class='notice'>[src] clicks, ready to be manually operated again.</span")
	lift.lift_master_datum.set_controls(UNLOCKED)

#undef FLOOR_TRAVEL_TIME

/obj/item/assembly/control/tram
	name = "tram call button"
	desc = "A small device used to bring trams to you."
	///for finding the landmark initially - should be the exact same as the landmark's destination id.
	var/initial_id
	///this is our destination's landmark, so we only have to find it the first time.
	var/obj/effect/landmark/tram/to_where

/obj/item/assembly/control/tram/activate()
	if(cooldown)
		return
	cooldown = TRUE
	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 2 SECONDS)
	var/obj/structure/industrial_lift/tram/tram_part

	var/obj/machinery/computer/tram_controls/computer = locate(/obj/machinery/computer/tram_controls) in GLOB.machines
	tram_part = computer?.tram_part
	if(!tram_part)
		say("The tram is not responding to call signals. Please send a technician to repair the internals of the tram.")
		return
	if(!tram_part.from_where) //edge case where the tram has not moved yet and set up it's landmarks but has been called
		for(var/obj/effect/landmark/tram/tram_landmark in GLOB.landmarks_list)
			if(tram_landmark.destination_id == tram_part.initial_id)
				tram_part.from_where = tram_landmark
				break
	//find where the tram is going to/is
	var/obj/effect/landmark/tram/from_where = tram_part.from_where
	if(tram_part.travelling) //in use
		say("The tram is already travelling to [from_where].")
		return
	if(!to_where)
		//find where the tram needs to go to (our destination). only needs to happen the first time
		for(var/obj/effect/landmark/tram/our_destination in GLOB.landmarks_list)
			if(our_destination.destination_id == initial_id)
				to_where = our_destination
				break
	if(from_where == to_where) //already here
		say("The tram is already here. Please board the tram and select a destination.")
		return

	say("The tram has been called to [to_where]. Please wait for its arrival.")
	tram_part.tram_travel(from_where, to_where)
