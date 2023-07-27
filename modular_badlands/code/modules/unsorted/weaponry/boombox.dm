/*
You might not call this a weapon.
You may not even imagine how it could cause harm.
Friend, let me tell you, music is the way to the hearts of your foe.
Kill them with tunes. Assblasting tunes.
*/
/obj/item/boombox
	name = "boombox"
	desc = "A dusty, gray, bulky, battery-powered, auto-looping stereo cassette player."
	icon = 'modular_badlands/code/modules/unsorted/icons/items.dmi'
	icon_state = "boombox_off"
	w_class = WEIGHT_CLASS_NORMAL
	force = 3
	var/baseiconstate = "boombox"
	var/boomingandboxing = FALSE
	var/list/availabletrackids

/obj/item/boombox/attack_self(mob/user)
	. = ..()
	if(boomingandboxing)
		SSjukeboxes.removejukebox(SSjukeboxes.findjukeboxindex(src))
		boomingandboxing = FALSE
		to_chat(user, "<span class='notice'>You flip a switch on [src], and the music immediately stops.")
		update_icon()
		return
	if(!availabletrackids || !availabletrackids.len)
		to_chat(user, "<span class='notice'>[src] flashes as you prod it senselessly. It doesn't have any songs stored on it.</span>")
		return
	if(!boomingandboxing)
		var/list/tracklist = list()
		for(var/datum/track/S in SSjukeboxes.songs)
			if(istype(S) && (S.song_associated_id in availabletrackids))
				tracklist[S.song_name] = S
		var/selected = input(user, "Play song", "Track:") as null|anything in tracklist
		if(QDELETED(src) || !selected || !istype(tracklist[selected], /datum/track))
			return
		var/jukeboxslottotake = SSjukeboxes.addjukebox(src, tracklist[selected])
		if(jukeboxslottotake)
			boomingandboxing = TRUE
			update_icon()

/obj/item/boombox/Destroy(mob/user)
	SSjukeboxes.removejukebox(SSjukeboxes.findjukeboxindex(src))
	. = ..()

/obj/item/boombox/update_icon_state()
	icon_state = "[baseiconstate]_[boomingandboxing ? "on" : "off"]"
	return
