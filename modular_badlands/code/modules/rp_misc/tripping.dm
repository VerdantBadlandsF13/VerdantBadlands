// Pulled near 1:1 from IS12. - Carl
// Basic requirements below. Probably doesn't work.
/turf/proc/is_plating()
	return FALSE
/*
/turf/open/indestructible/is_plating()
	return TRUE// If it becomes an issue, set to false.

/turf/open/floor/is_plating()
	return TRUE// If it becomes an issue, set to false.
*/
/turf/open/is_plating()
	return TRUE// If it becomes an issue, set to false.

// Actual tripping related stuff.
/obj
	var/trip_chance = 90

/obj/Crossed(mob/living/carbon/human/H as mob)
	. = ..()
	if(trip_chance && prob(trip_chance) && trip_check(H))
		H.trip_act(src)

/obj/proc/trip_check(mob/user as mob)
	if(!ishuman(user) || user.resting || !user.m_intent == MOVE_INTENT_WALK)
		return FALSE
	return TRUE

// Probably not a good idea to have this here. Comment out if it's not good, which I suspect will be the case.
/obj/trip_check(mob/user as mob)
	var/turf/T = src.loc
	if(!T.is_plating())
		return FALSE
	. = ..()

/mob/living/carbon/human/proc/trip_act(obj/O)
	apply_damage(5, BRUTE)
	src.DefaultCombatKnockdown(5)
	visible_message(\
		"<span class='warning'[src] trips over \the [O]!</span>",\
		"<span class='danger'You trip over \the [O]!</span>")

// Pipes
/obj/machinery/atmospherics/pipe/trip_check(mob/user as mob)
	var/turf/T = src.loc
	if(!T.is_plating())
		return FALSE
	if(initialize_directions & user.dir)
		return FALSE
	. = ..()

// Cables
/obj/structure/cable/trip_check(mob/user as mob)
	var/turf/T = src.loc
	if(!T.is_plating())
		return FALSE
	if((user.dir == d1 || user.dir == d2))
		return FALSE
	. = ..()

// Disposals
/obj/structure/disposalpipe/trip_check(mob/user as mob)
	var/turf/T = src.loc
	if(!T.is_plating())
		return FALSE
	if(dpdir & user.dir)
		return FALSE
	. = ..()
