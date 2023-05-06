// Looping sound.
/datum/looping_sound/cryo
	mid_sounds = list('modular_badlands/code/modules/rp_fluff/sounds/cryostasis-cycle.ogg')
	mid_length = 30 SECONDS// Can we even have this?
	volume = 30

// Handle occupant spawning.
/obj/machinery/cryostasis/proc/set_occupant(var/mob/living/carbon/occupant)
	src.occupant = occupant
	if(!occupant)
		SetName(initial(name))
		return
	if(occupant.client)
		occupant.client.perspective = EYE_PERSPECTIVE
		occupant.client.eye = src
	occupant.forceMove(src)
	SetName("[name] ([occupant])")
	icon_state = initial(icon_state)

// Used up spawn structure.
/obj/structure/cryostasis
	name = "empty cryostasis chamber"
	desc = "An old pre war machine. Once something of importance, now no more than a memory. <br>\
	Coating the walls is some manner of disgusting film, almost like pond scum."
	icon = 'modular_badlands/code/modules/rp_fluff/icons/cryostasis.dmi'
	icon_state = "cryostasis-open"
	density = FALSE
	anchored = 1

// Actual spawn machine.
/obj/machinery/cryostasis
	name = "cryostasis chamber"
	desc = "An old pre war machine. Through the glass, you can faintly see a person of some sort."
	icon = 'modular_badlands/code/modules/rp_fluff/icons/cryostasis.dmi'
	icon_state = "cryostasis"
	layer = 3.3
	density = TRUE
	state_open = FALSE// Future stuff.
	var/datum/looping_sound/cryo/soundloop
	var/cycle_duration = 30 SECONDS
	var/cycling = FALSE// Is the player already waiting? If so, don't allow them to spam it.
	var/used_machine = /obj/structure/cryostasis

/obj/machinery/cryostasis/process()
	..()
	if(occupant && isliving(occupant))
		var/mob/living/L = occupant
		L.adjust_blurriness(1)// Biogel vs eyes.

/obj/machinery/cryostasis/Initialize()
	. = ..()
	occupant_typecache = GLOB.typecache_living
	soundloop = new(src, FALSE, TRUE)
	soundloop.volume = 5
	soundloop.start(src)
	update_icon()
	START_PROCESSING(SSobj, src)

/obj/machinery/cryostasis/Destroy()
	. = ..()
	soundloop.stop(src)
	STOP_PROCESSING(SSobj, src)

/obj/machinery/cryostasis/update_icon_state()
	if(state_open)
		icon_state = "[initial(icon_state)]-open"
	else
		icon_state = initial(icon_state)

/obj/machinery/cryostasis/container_resist(mob/living/user)
	if(!cycling)
		cycling = TRUE
		playsound(src.loc, 'modular_badlands/code/modules/rp_fluff/sounds/cryostasis-cycle.ogg', 50, 0)
		user.visible_message("<span class='warning'>[src] emits a beep!</span>", \
			"<span class='notice'>You struggle for air inside the [src], prompting the machine to begin its cycle. (this will take about [DisplayTimeText(cycle_duration)].)</span>", \
			"<span class='italics'>You can hear machinery inside the nearby [src].</span>")
		if(do_after(user,(cycle_duration), target = src, required_mobility_flags = MOBILITY_RESIST))
			open_machine()
	if(cycling)
		to_chat(user, "<span class='warning'>Try as you might, you have no clue how to work this thing.</span>")

/obj/machinery/cryostasis/Exited(atom/movable/user)
	if (!state_open && user == occupant)
		container_resist(user)

/obj/machinery/cryostasis/relaymove(mob/user)
	if (!state_open)
		container_resist(user)

/obj/machinery/cryostasis/open_machine()
	if(!state_open && !panel_open)
		cycle_out
		..()

/obj/machinery/cryostasis/attack_hand(mob/living/user)
			if(!HAS_TRAIT(user, TRAIT_ENCLAVE_CODES))
			to_chat(user, "<span class='warning'>Try as you might, you have no clue how to work this thing.</span>")
			return

/obj/machinery/cryostasis/proc/cycle_out()
	var/mob/living/mob_occupant = occupant
	if(mob_occupant)
		connected_message("Critical Error!")
		SPEAK(Gibberish("Critical error! Supply of biomedical gel depleted! <br>\
			Please ensure subject is restrained!")
		flash_color(mob_occupant, flash_color="#960000", flash_time=100)
		to_chat(mob_occupant, "<span class='warning'><b>Your consciousness cries out in agony as you're dropped to the floor.</b><br>\
		<i>Why can't you remember anything, other than your name and a set of directives?</i></span>")
		playsound(src.loc, 'modular_badlands/code/modules/rp_fluff/sounds/cryostasis-exit.ogg', 50, 0)
		SEND_SOUND(mob_occupant, sound('sound/hallucinations/veryfar_noise.ogg',0,1,50))
		for(var/I in used_machine)
			new I(get_turf(src))
		qdel(src)
