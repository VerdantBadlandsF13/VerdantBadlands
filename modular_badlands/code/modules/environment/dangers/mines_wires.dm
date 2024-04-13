/datum/wires/explosive/f13_mine
	holder_type = /obj/item/grenade/f13/mine
	randomize = TRUE
	req_knowledge = JOB_SKILL_MASTER
	req_skill = JOB_SKILL_MASTER
	req_trait = TRAIT_WIREVISION //trait required to see all wires

/datum/wires/explosive/f13_mine/New(atom/holder)
	wires = list(
		WIRE_DISARM
	)
	add_duds(2) // Duds also explode here.
	..()

/datum/wires/explosive/f13_mine/interactable(mob/user)
	return TRUE

/datum/wires/explosive/f13_mine/explode()
	var/obj/item/grenade/f13/mine/M = holder
	M.arm()

/datum/wires/explosive/f13_mine/on_cut(wire, mend)
	var/obj/item/grenade/f13/mine/M = holder
	switch(wire)
		if(WIRE_DISARM)
			if(!mend)
				M.armed = FALSE
				M.anchored = FALSE
		else
			if(!mend)
				M.arm()

/datum/wires/explosive/f13_mine/on_pulse(wire)
	var/obj/item/grenade/f13/mine/M = holder
	switch(wire)
		if(WIRE_DISARM) // Pulse to toggle
			M.armed = FALSE
			M.anchored = FALSE
		else // Boom
			M.arm()
