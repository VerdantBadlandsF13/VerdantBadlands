// Should probably be elsewhere, but it's important enough that I figure it should be here and not dropped in another file.
#define STASISMOB 'modular_badlands/code/modules/techno_jacks/icons/cryostasis_holder.dmi'

// Looping sound.
/datum/looping_sound/cryo
	mid_sounds = list('modular_badlands/code/modules/techno_jacks/sounds/cryostasis-cycle.ogg')
	mid_length = 2 SECONDS// Can we even have this? Far longer, supposed to be 30, but we don't have proactive updates on audio.
	volume = 75

// Handle occupant spawning.
/obj/machinery/cryostasis/proc/set_occupant(mob/living/carbon/occupant)
	src.occupant = occupant
	if(!occupant)
		name = (initial(name))
		return
	if(occupant.client)
		occupant.client.perspective = EYE_PERSPECTIVE
		occupant.client.eye = src
	occupant.forceMove(src)
	name = ("[name] ([occupant])")
	icon_state = initial(icon_state)
	update_icon()

// Used up spawn structure.
/obj/structure/cryostasis
	name = "empty cryostasis chamber"
	desc = "An old pre war machine. Once something of importance, now no more than a memory. <br>\
	Coating the walls is some manner of disgusting film, almost like pond scum."
	icon = 'modular_badlands/code/modules/techno_jacks/icons/cryostasis.dmi'
	icon_state = "cryostasis-open"
	density = FALSE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	anchored = 1

// Actual spawn machine.
/obj/machinery/cryostasis
	name = "cryostasis chamber"
	desc = "An old pre war machine. Through the glass, you can faintly see a person of some sort."
	icon = 'modular_badlands/code/modules/techno_jacks/icons/cryostasis.dmi'
	icon_state = "cryostasis"
	layer = 3.3
	density = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	state_open = FALSE// Future stuff.
	anchored = 1// I don't think this'd be needed. Probably. Just to be sure, however.
	var/datum/looping_sound/cryo/soundloop
	var/cycle_duration = 30 SECONDS
	var/message_cooldown = 5 SECONDS
	var/cycling = FALSE// Is the player already waiting? If so, don't allow them to spam it.
	var/used_machine = /obj/structure/cryostasis
	var/mob/living/mob_occupant

/obj/machinery/cryostasis/process()
	..()
	var/mob/living/mob_occupant = occupant
	if(occupant && isliving(occupant))
		// Shouldn't ever happen, but just in case.
		if(mob_occupant.stat == DEAD)
			qdel(occupant)
		// Same with this.
		if(!mob_occupant.client && mob_occupant.stat < 2) //Occupant is living and has no client.
			qdel(occupant)
		mob_occupant.adjust_blurriness(1)// Biogel vs eyes.

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

/obj/machinery/cryostasis/container_resist(mob/living/user)
	if(!cycling)
		cycling = TRUE
		playsound(src.loc, 'modular_badlands/code/modules/techno_jacks/sounds/cryostasis-cycle.ogg', 50, 0)
		user.visible_message("<span class='warning'>[src] emits a beep!</span>", \
			"<span class='notice'>You struggle for air inside the [src], prompting the machine to begin its cycle. (this will take about [DisplayTimeText(cycle_duration)].)</span>", \
			"<span class='italics'>You can hear machinery inside the nearby [src].</span>")
		if(do_after(user,(cycle_duration), target = src, required_mobility_flags = MOBILITY_RESIST))
			cycle_out()
	if(cycling)
		to_chat(user, "<span class='warning'>You're suffocating! Get this damn thing open!</span>")

/obj/machinery/cryostasis/Exited(atom/movable/user)
	if (!state_open && user == occupant)
		container_resist(user)

/obj/machinery/cryostasis/relaymove(atom/movable/user)
	if (!state_open && user == occupant)
		if(message_cooldown <= world.time)
			message_cooldown = world.time + 50
			to_chat(user, "<span class='warning'>[src]'s door won't budge!</span>")
		container_resist(user)
		return
	return FALSE

/obj/machinery/cryostasis/attack_hand(mob/living/user)
	if(!HAS_TRAIT(user, TRAIT_ENCLAVE_CODES))
		if(message_cooldown <= world.time)
			message_cooldown = world.time + 50
			to_chat(user, "<span class='warning'>Something stays your hand.</span>")

/obj/machinery/cryostasis/proc/cycle_out()
	var/mob/living/mob_occupant = occupant
	if(mob_occupant)

		to_chat(mob_occupant, "<span class='his_grace'><b>Your consciousness cries out in agony as you're dropped to the floor.</b><br>\
		<i>Why can't you remember anything, other than your name and a set of directives?</i></span>")

		to_chat(src, Gibberish("Critical error! Supply of biomedical gel depleted! <br>\
		Please ensure subject is restrained!"))

		playsound(src.loc, 'modular_badlands/code/modules/techno_jacks/sounds/cryostasis-exit.ogg', 50, 0)
		new /obj/effect/particle_effect/smoke(get_turf(src))
		new used_machine(get_turf(src))// Replace the machine with the static placeholder.
		qdel(src)


/obj/machinery/cryostasis/update_icon(mob/living/carbon/occupant)
	src.occupant = occupant
	cut_overlays()
	if(state_open)// Shouldn't ever be the case. For now.
		icon_state = "[initial(icon_state)]-open"
	if(occupant)
		var/image/occupant_overlay
		if(ishuman(occupant) || islarva(occupant) || (isanimal(occupant) && !ismegafauna(occupant))) // Mobs that are smaller than cryotube
			occupant_overlay = image(occupant.icon, occupant.icon_state)
			occupant_overlay.copy_overlays(occupant)
		else
			occupant_overlay = image(STASISMOB, "generic")
		occupant_overlay.dir = SOUTH
		occupant_overlay.pixel_y = 22
		add_overlay("[initial(icon_state)]-overlay")
		run_anim(TRUE, occupant_overlay)
	else// When no one has been selected to spawn inside, use generic.
		icon_state = "[initial(icon_state)]"
		add_overlay(STASISMOB, "generic")

/obj/machinery/cryostasis/proc/run_anim(anim_up, image/occupant_overlay)
	if(!occupant)
		return
	cut_overlays()
	if(occupant_overlay.pixel_y != 23) // Same effect as occupant_overlay.pixel_y == 22 || occupant_overlay.pixel_y == 24
		anim_up = occupant_overlay.pixel_y == 22 // Same effect as if(occupant_overlay.pixel_y == 22) anim_up = TRUE ; if(occupant_overlay.pixel_y == 24) anim_up = FALSE
	if(anim_up)
		occupant_overlay.pixel_y++
	else
		occupant_overlay.pixel_y--
	add_overlay(occupant_overlay)
	add_overlay("[initial(icon_state)]-overlay")
	addtimer(CALLBACK(src, .proc/run_anim, anim_up, occupant_overlay), 7, TIMER_UNIQUE)
