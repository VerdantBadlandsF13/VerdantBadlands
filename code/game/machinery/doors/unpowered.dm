/obj/machinery/door/unpowered
	var/bio_lock = FALSE
	var/registered_name = null

/obj/machinery/door/unpowered/attackby(obj/item/W, mob/user, params)
	var/obj/item/card/id/I = W.GetID()
	if(bio_lock == TRUE)
		if(istype(I))
			if(!I || !I.registered_name)
				return
			if(user.mind.assigned_role in GLOB.command_positions || !registered_name || (istype(I) && (registered_name == I.registered_name)))
				locked = !locked
				update_icon()
				to_chat(user, "<span class='danger'>The door is now [locked ? "locked" : "unlocked"].</span>")

				if(!registered_name)
					registered_name = I.registered_name
					to_chat(user, "<span class='danger'>The door flashes with your identification number.</span>")
			else
				to_chat(user, "<span class='danger'>Access Denied.</span>")
	else
		return ..()

/obj/machinery/door/unpowered/AltClick(mob/living/user)
	if(bio_lock == TRUE)
		if(isliving(user) && user.mind)
			var/popup_input
			popup_input = alert(user, "Choose Action", "Biometric Lock", "Nevermind", "Reset Biometric Lock")
			if(!user.canUseTopic(src, BE_CLOSE, FALSE))
				return
			if(popup_input == "Reset Biometric Lock")
				check_bio_reset()
	return ..()

/obj/machinery/door/unpowered/proc/reset_biolock()
	if(!registered_name)// How did you get here?
		to_chat(usr, "<span class='danger'>This door has no biometric identification attached to it.</span>")
		return
	else
		registered_name = null
		to_chat(usr, "<span class='danger'>This door now has no biometric lock.</span>")

/obj/machinery/door/unpowered/proc/check_bio_reset()
	if(!bio_lock)
		to_chat(usr, "<span class='danger'>This door has no biometric lock.</span>")
		return

	if(!(usr.mind.assigned_role in GLOB.command_positions))
		to_chat(usr, "<span class='danger'>Access Denied.</span>")
		return

	reset_biolock(usr)

/obj/machinery/door/unpowered/Bumped(atom/movable/AM)
	if(src.locked)
		to_chat(AM, "<span class='danger'>Access Denied.</span>")
		return
	..()
	return

/obj/machinery/door/unpowered/examine(mob/user)
	. = ..()
	if(bio_lock)
		. += "Biometric lock: [registered_name]"
		. += "- - - _ _ _ - - - _ _ _ - - -"
		. += "You can swipe your ID over this, if not already claimed."
		. += "Interacting with your hands (Alt+Click) will enable you to reset the lock, if you have access."

/*
/obj/machinery/door/unpowered/attackby(obj/item/I, mob/user, params)
	if(locked)
		return
	else
		return ..()
*/
