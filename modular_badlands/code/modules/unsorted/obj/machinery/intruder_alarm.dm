#define INTRUDERALARM_COOLDOWN 60

/obj/item/electronics/intruder_alarm
	name = "intruder alarm electronics"
	custom_price = PRICE_CHEAP
	desc = "An intruder alarm circuit. Can handle heat levels up to 40 degrees celsius."

/obj/item/wallframe/intruder_alarm
	name = "intruder alarm frame"
	desc = "Used for building intruder alarms."
	icon = 'icons/obj/monitors.dmi'
	icon_state = "fire_bitem"
	result_path = /obj/machinery/intruder_alarm

/obj/machinery/intruder_alarm
	name = "intruder alarm"
	desc = "<i>\"Pull this in case of emergency\"</i>. Thus, keep pulling it forever."
	icon = 'icons/obj/monitors.dmi'
	icon_state = "fire0"
	plane = ABOVE_WALL_PLANE
	max_integrity = 250
	integrity_failure = 0.4
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 30)
	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 6
	power_channel = ENVIRON
	resistance_flags = FIRE_PROOF

	light_power = 0
	light_range = 7
	light_color = "#7f1c1c"

	var/detecting = 1
	var/buildstage = 2 // 2 = complete, 1 = no wires, 0 = circuit gone
	var/last_alarm = 0
	var/area/myarea = null

/obj/machinery/intruder_alarm/Initialize(mapload, dir, building)
	. = ..()
	if(dir)
		src.setDir(dir)
	if(building)
		buildstage = 0
		panel_open = TRUE
		pixel_x = (dir & 3)? 0 : (dir == 4 ? -24 : 24)
		pixel_y = (dir & 3)? (dir ==1 ? -24 : 24) : 0
	update_icon()
	myarea = get_base_area(src)
	LAZYADD(myarea.firealarms, src)

/obj/machinery/intruder_alarm/Destroy()
	LAZYREMOVE(myarea.firealarms, src)
	return ..()

/obj/machinery/intruder_alarm/power_change()
	..()
	update_icon()

/obj/machinery/intruder_alarm/update_icon_state()
	if(panel_open)
		icon_state = "fire_b[buildstage]"
		return

	if(stat & BROKEN)
		icon_state = "firex"
		return

	icon_state = "fire0"

	if(stat & NOPOWER)
		return

/obj/machinery/intruder_alarm/emp_act(severity)
	. = ..()

	if (. & EMP_PROTECT_SELF)
		return

	if(prob(severity/1.8))
		alarm()

/obj/machinery/intruder_alarm/proc/alarm(mob/user)
	if(!is_operational() || (last_alarm+INTRUDERALARM_COOLDOWN > world.time))
		return
	last_alarm = world.time
	var/area/A = get_base_area(src)
	A.intruder_alert(src)
	playsound(loc, 'modular_badlands/code/modules/rp_misc/sound/interior_alarm.ogg', 75)
	if(user)
		log_game("[user] triggered an intruder alarm at [COORD(src)]")

/obj/machinery/intruder_alarm/proc/reset(mob/user)
	if(!is_operational())
		return
	var/area/A = get_base_area(src)
	A.intruder_reset(src)
	if(user)
		log_game("[user] reset an intruder alarm at [COORD(src)]")

/obj/machinery/intruder_alarm/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	if(buildstage != 2)
		return ..()
	add_fingerprint(user)
	var/area/A = get_base_area(src)
	if(A.fire)
		reset(user)
	else
		alarm(user)

/obj/machinery/intruder_alarm/attack_ai(mob/user)
	return attack_hand(user)

/obj/machinery/intruder_alarm/attack_robot(mob/user)
	return attack_hand(user)

/obj/machinery/intruder_alarm/attackby(obj/item/W, mob/user, params)
	add_fingerprint(user)

	if(istype(W, /obj/item/screwdriver) && buildstage == 2)
		W.play_tool_sound(src)
		panel_open = !panel_open
		to_chat(user, "<span class='notice'>The wires have been [panel_open ? "exposed" : "unexposed"].</span>")
		update_icon()
		return

	if(panel_open)

		if(istype(W, /obj/item/weldingtool) && user.a_intent == INTENT_HELP)
			if(obj_integrity < max_integrity)
				if(!W.tool_start_check(user, amount=0))
					return

				to_chat(user, "<span class='notice'>You begin repairing [src]...</span>")
				if(W.use_tool(src, user, 40, volume=50))
					obj_integrity = max_integrity
					to_chat(user, "<span class='notice'>You repair [src].</span>")
			else
				to_chat(user, "<span class='warning'>[src] is already in good condition!</span>")
			return

		switch(buildstage)
			if(2)
				if(istype(W, /obj/item/multitool))
					detecting = !detecting
					if (src.detecting)
						user.visible_message("[user] has reconnected [src]'s detecting unit!", "<span class='notice'>You reconnect [src]'s detecting unit.</span>")
					else
						user.visible_message("[user] has disconnected [src]'s detecting unit!", "<span class='notice'>You disconnect [src]'s detecting unit.</span>")
					return

				else if (istype(W, /obj/item/wirecutters))
					buildstage = 1
					W.play_tool_sound(src)
					new /obj/item/stack/cable_coil(user.loc, 5)
					to_chat(user, "<span class='notice'>You cut the wires from \the [src].</span>")
					update_icon()
					return
				else if(W.force) //hit and turn it on
					..()
					var/area/A = get_base_area(src)
					if(!A.fire)
						alarm()
					return
			if(1)
				if(istype(W, /obj/item/stack/cable_coil))
					if(!W.use_tool(src, user, 0, 5))
						to_chat(user, "<span class='warning'>You need more cable for this!</span>")
					else
						buildstage = 2
						to_chat(user, "<span class='notice'>You wire \the [src].</span>")
						update_icon()
					return

				else if(istype(W, /obj/item/crowbar))
					user.visible_message("[user.name] removes the electronics from [src.name].", \
										"<span class='notice'>You start prying out the circuit...</span>")
					if(W.use_tool(src, user, 20, volume=50))
						if(buildstage == 1)
							if(stat & BROKEN)
								to_chat(user, "<span class='notice'>You remove the destroyed circuit.</span>")
								stat &= ~BROKEN
							else
								to_chat(user, "<span class='notice'>You pry out the circuit.</span>")
								new /obj/item/electronics/intruder_alarm(user.loc)
							buildstage = 0
							update_icon()
					return
			if(0)
				if(istype(W, /obj/item/electronics/intruder_alarm))
					to_chat(user, "<span class='notice'>You insert the circuit.</span>")
					qdel(W)
					buildstage = 1
					update_icon()
					return

				else if(istype(W, /obj/item/electroadaptive_pseudocircuit))
					var/obj/item/electroadaptive_pseudocircuit/P = W
					if(!P.adapt_circuit(user, 15))
						return
					user.visible_message("<span class='notice'>[user] fabricates a circuit and places it into [src].</span>", \
					"<span class='notice'>You adapt an intruder alarm circuit and slot it into the assembly.</span>")
					buildstage = 1
					update_icon()
					return

				else if(istype(W, /obj/item/wrench))
					user.visible_message("[user] removes the intruder alarm assembly from the wall.", \
										"<span class='notice'>You remove the intruder alarm assembly from the wall.</span>")
					var/obj/item/wallframe/intruder_alarm/frame = new /obj/item/wallframe/intruder_alarm()
					frame.forceMove(user.drop_location())
					W.play_tool_sound(src)
					qdel(src)
					return
	return ..()

/obj/machinery/intruder_alarm/rcd_vals(mob/user, obj/item/construction/rcd/the_rcd)
	if((buildstage == 0) && (the_rcd.upgrade & RCD_UPGRADE_SIMPLE_CIRCUITS))
		return list("mode" = RCD_UPGRADE_SIMPLE_CIRCUITS, "delay" = 20, "cost" = 1)
	return FALSE

/obj/machinery/intruder_alarm/rcd_act(mob/user, obj/item/construction/rcd/the_rcd, passed_mode)
	switch(passed_mode)
		if(RCD_UPGRADE_SIMPLE_CIRCUITS)
			user.visible_message("<span class='notice'>[user] fabricates a circuit and places it into [src].</span>", \
			"<span class='notice'>You adapt an intruder alarm circuit and slot it into the assembly.</span>")
			buildstage = 1
			update_icon()
			return TRUE
	return FALSE

/obj/machinery/intruder_alarm/take_damage(damage_amount, damage_type = BRUTE, damage_flag = 0, sound_effect = 1, attack_dir)
	. = ..()
	if(.) //damage received
		if(obj_integrity > 0 && !(stat & BROKEN) && buildstage != 0)
			if(prob(33))
				alarm()

/obj/machinery/intruder_alarm/obj_break(damage_flag)
	if(!(stat & BROKEN) && !(flags_1 & NODECONSTRUCT_1) && buildstage != 0) //can't break the electronics if there isn't any inside.
		LAZYREMOVE(myarea.firealarms, src)
		stat |= BROKEN
		update_icon()

/obj/machinery/intruder_alarm/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/metal(loc, 1)
		if(!(stat & BROKEN))
			var/obj/item/I = new /obj/item/electronics/intruder_alarm(loc)
			if(!disassembled)
				I.obj_integrity = I.max_integrity * 0.5
		new /obj/item/stack/cable_coil(loc, 3)
	qdel(src)

/obj/machinery/intruder_alarm/proc/update_intruder_light(alarm)
	if(alarm == !!light_power)
		return  // do nothing if we're already active
	if(alarm)
		set_light(l_power = 0.8)
	else
		set_light(l_power = 0)

/*
Procs below here.
*/
/area/proc/intruder_alert(obj/trigger)
	//Trigger alarm effect. In this case, we reuse fire alarm stuff.
	set_fire_alarm_effects(TRUE)

	//	Lockdown the location.
	for(var/obj/machinery/door/DOOR in get_sub_areas_contents(src))
		close_and_lock_door(DOOR)

	// Alert nearby security.
	for (var/i in GLOB.silicon_mobs)
		var/mob/living/silicon/SILICON = i
		if(SILICON.triggerAlarm("Intruder", src, cameras, trigger))
			//Cancel silicon alert after 1 minute
			addtimer(CALLBACK(SILICON, /mob/living/silicon.proc/cancelAlarm,"Intruder",src,trigger), 600)

	START_PROCESSING(SSobj, src)

/area/proc/intruder_reset(obj/source)
	set_fire_alarm_effects(FALSE)
	STOP_PROCESSING(SSobj, src)

/area/proc/unlock_doors(obj/machinery/door/DOOR)
	set waitfor = FALSE
	DOOR.close()
	if(DOOR.density)
		DOOR.lock()
