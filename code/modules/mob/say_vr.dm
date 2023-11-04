//////////////////////////////////////////////////////
////////////////////SUBTLE COMMAND////////////////////
//////////////////////////////////////////////////////
/mob
	var/flavor_text = ""
	var/special_s = 5
	var/special_p = 5
	var/special_e = 5
	var/special_c = 5
	var/special_i = 5
	var/special_a = 5
	var/special_l = 5

/mob/proc/get_top_level_mob()
	if(istype(src.loc,/mob)&&src.loc!=src)
		var/mob/M=src.loc
		return M.get_top_level_mob()
	return src

/proc/get_top_level_mob(mob/S)
	if(istype(S.loc,/mob)&&S.loc!=S)
		var/mob/M=S.loc
		return M.get_top_level_mob()
	return S

///////////////// EMOTE CODE
// Maybe making this as an emote is less messy?
// It was - ktccd
/datum/emote/living/subtle
	key = "subtle"
	key_third_person = "subtle"
	message = null
	mob_type_blacklist_typecache = list(/mob/living/brain)
	var/subtler = FALSE

/datum/emote/living/subtle/subtler
	key = "subtler"
	key_third_person = "subtler"
	subtler = TRUE

/datum/emote/living/subtle/proc/check_invalid(mob/user, input)
	if(stop_bad_mime.Find(input, 1, 1))
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
		return TRUE
	return FALSE

/datum/emote/living/subtle/run_emote(mob/user, params, type_override = null)
	if(jobban_isbanned(user, "emote"))
		to_chat(user, "You cannot send subtle emotes (banned).")
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, "You cannot send IC messages (muted).")
		return FALSE
	else if(!params)
		var/subtle_emote = stripped_multiline_input_or_reflect(user, "Choose an emote to display.", "[subtler ? "Subtler" : "Subtle"]", null, MAX_MESSAGE_LEN)
		if(subtle_emote && !check_invalid(user, subtle_emote))
			message = subtle_emote
		else
			return FALSE
	else
		message = params
		if(type_override)
			emote_type = type_override
	. = TRUE
	if(!can_run_emote(user))
		return FALSE

	user.log_message(message, LOG_EMOTE)
	message = span_subtle("<b>[user]</b> " + "<i>[user.say_emphasis(message)]</i>")

	var/list/ghosties = list()
	// Exclude ghosts from the initial message if its a subtler, lets be *discrete*
	if(subtler)
		for(var/mob/ghost in GLOB.dead_mob_list)
			if(ghost.client && !check_rights_for(ghost.client, R_ADMIN))
				continue
			ghosties |= ghost

	// Everyone in range can see it
	user.visible_message(
		message = message,
		blind_message = message,
		self_message = message,
		vision_distance = 1,
		ignored_mobs = ghosties)

	//broadcast to ghosts, if they have a client, are dead, arent in the lobby, allow ghostsight,
	user.emote_for_ghost_sight(message, subtler)


///////////////// VERB CODE
/mob/living/proc/subtle_keybind()
	var/message = input(src, "", "subtle") as text|null
	if(!length(message))
		return
	return subtle(message)

/mob/living/verb/subtle()
	set name = "Subtle"
	set category = "IC"
	if(GLOB.say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		return
	usr.emote("subtle")

///////////////// VERB CODE 2
/mob/living/verb/subtler()
	set name = "Subtler Anti-Ghost"
	set category = "IC"
	if(GLOB.say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		return
	usr.emote("subtler")


/mob/proc/print_special()
	var/msg = "S:[special_s],P:[special_p],E:[special_e],C:[special_c],I:[special_i],A:[special_a],L:[special_l]<br>"

	if (special_s <= 3)
		msg += "<br>Looks weak, I can barely see any muscle."
	if (special_p <= 3)
		msg += "<br>Not the most perceptive. I don't think they even noticed me walk by."
	if (special_e <= 3)
		msg += "<br>Was that bruise there just a minute ago? Not very sturdy, are they?"
	if (special_c <= 3)
		msg += "<br>One could hold a better conversation with a psycho addict."
	if (special_i <= 3)
		msg += "<br>Looks like he's struggling to comprehend everything he sees."
	if (special_a <= 3)
		msg += "<br>Clumsy, it wasn't tough to hear this one coming."
	if (special_l <= 3)
		msg += "<br>Down on their luck? It looks more like luck is down on him."

	if (special_s >= 7)
		msg += "<br>I can tell this one's worked out quite a bit."
	if (special_p >= 7)
		msg += "<br>This one is definitely quite aware of their surroundings."
	if (special_e >= 7)
		msg += "<br>Stiff and rigid, it'd take more than a few swings to bring this one down."
	if (special_c >= 7)
		msg += "<br>That charming smile, it's hard to resist smiling back."
	if (special_i >= 7)
		msg += "<br>I'm impressed by this one's ability to absorb information about them."
	if (special_a >= 7)
		msg += "<br>I don't think I even heard this one approach, wow."
	if (special_l >= 7)
		msg += "<br>Someone on a lucky winning streak tends to have a look about them, and this one's got it."
	msg += "<br> *---------**---------*"
	return msg

///////////////// SUBTLE 2: NO GHOST BOOGALOO

/* /datum/emote/living/subtler
	key = "subtler"
	key_third_person = "subtler"
	message = null
	mob_type_blacklist_typecache = list(/mob/living/brain)


/datum/emote/living/subtler/proc/check_invalid(mob/user, input)
	if(stop_bad_mime.Find(input, 1, 1))
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
		return TRUE
	return FALSE

/datum/emote/living/subtler/run_emote(mob/user, params, type_override = null)
	if(jobban_isbanned(user, "emote"))
		to_chat(user, "You cannot send subtle emotes (banned).")
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, "You cannot send IC messages (muted).")
		return FALSE
	else if(!params)
		var/subtle_emote = stripped_multiline_input_or_reflect(user, "Choose an emote to display.", "Subtler" , null, MAX_MESSAGE_LEN)
		if(subtle_emote && !check_invalid(user, subtle_emote))
			var/type = input("Is this a visible or hearable emote?") as null|anything in list("Visible", "Hearable")
			switch(type)
				if("Visible")
					emote_type = EMOTE_VISIBLE
				if("Hearable")
					emote_type = EMOTE_AUDIBLE
				else
					alert("Unable to use this emote, must be either hearable or visible.")
					return
			message = subtle_emote
		else
			return FALSE
	else
		message = params
		if(type_override)
			emote_type = type_override
	. = TRUE
	if(!can_run_emote(user))
		return FALSE

	user.log_message(message, LOG_SUBTLER)
	message = "<b>[user]</b> " + "<i>[user.say_emphasis(message)]</i>"

	if(emote_type == EMOTE_AUDIBLE)
		user.audible_message(message=message,hearing_distance=1, ignored_mobs = GLOB.dead_mob_list)
	else
		user.visible_message(message=message,self_message=message,vision_distance=1, ignored_mobs = GLOB.dead_mob_list)
 */
