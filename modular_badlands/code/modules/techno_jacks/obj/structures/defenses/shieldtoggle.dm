/*
Toggles shields in an area.
Lightswitch 2.0
*/
/obj/machinery/shield_switch
	name = "shield terminal"
	desc = "An interface intended to switch shieldwall bioscanners on or off."
	icon = 'modular_badlands/code/modules/techno_jacks/icons/shieldtoggle.dmi'
	icon_state = "shieldtoggle_on"
	plane = ABOVE_WALL_PLANE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	req_one_access = list(ACCESS_VFE_SECURITY)
	var/area/area = null

/obj/machinery/shield_switch/Initialize()
	. = ..()
	area = get_area(src)
	name = "shield terminal ([area.name])"
	update_icon()

/obj/machinery/shield_switch/interact(mob/user)
	. = ..()
	var/mob/living/carbon/human/M
	var/allowed = allowed(M)
	if(allowed)
		for(/obj/structure/shieldwall in area)
			if(shieldwall.disabled == FALSE)
				shieldwall.disabled = TRUE
				icon_state = "shieldtoggle_off"
				to_chat(user, "<span class='warning'>The panel indicates that bioscanners have been disabled!</span>")
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/access_accepted.ogg" ,50,0,3)
			else
				shieldwall.disabled = FALSE
				icon_state = "shieldtoggle_on"
				to_chat(user, "<span class='danger'>The panel indicates that bioscanners have been enabled!</span>")
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/access_rejected.ogg" ,50,0,3)
	else
		to_chat(user, "<span class='warning'>The panel rejects your authorization codes!</span>")
		playsound(src, "modular_badlands/code/modules/rp_misc/sound/access_rejected.ogg" ,50,0,3)

/obj/machinery/shield_switch/emp_act(severity)
	return
