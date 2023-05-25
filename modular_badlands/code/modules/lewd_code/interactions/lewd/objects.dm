//Dildo changes.
/obj/item/dildo
	var/hole = CUM_TARGET_VAGINA

/obj/item/dildo/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	var/message = ""
	if(istype(M, /mob/living/carbon/human) && user.zone_selected == BODY_ZONE_PRECISE_GROIN && M.is_bottomless())
		if(M.client && M.client.prefs)
			if(M.client.prefs.toggles & VERB_CONSENT)
				if(hole == CUM_TARGET_VAGINA && M.has_vagina())
					message = (user == M) ? pick("fucks their own pussy with \the [src]","shoves the [src] into their pussy", "jams the [src] into their pussy") : pick("fucks [M] right in the pussy with \the [src]", "jams \the [src] right into [M]'s pussy")
				else if(hole == CUM_TARGET_ANUS && M.has_anus())
					message = (user == M) ? pick("fucks their own ass with \the [src]","shoves the [src] into their ass", "jams the [src] into their ass") : pick("fucks [M]'s asshole with \the [src]", "jams \the [src] into [M]'s ass")
	if(message)
		user.visible_message("<font color=purple>[user] [message].</font>")
		M.handle_post_sex(5, null, user)
		playsound(loc, pick('modular_badlands/code/modules/lewd_code/interactions/sound/bang4.ogg',
							'modular_badlands/code/modules/lewd_code/interactions/sound/bang5.ogg',
							'modular_badlands/code/modules/lewd_code/interactions/sound/bang6.ogg'), 70, 1, -1)
	else if(user.a_intent == INTENT_HARM)
		return ..()

/obj/item/dildo/attack_self(mob/living/carbon/human/user as mob)
	if(hole == CUM_TARGET_VAGINA)
		hole = CUM_TARGET_ANUS
	else
		hole = CUM_TARGET_VAGINA
	to_chat(user, "<span class='warning'>Hmmm. Maybe we should put it in \a [hole]?</span>")

/obj/item/dildo/cyborg
	name = "F.I.S.T.R. Machine"
	desc = "Fully Integrated Sexual Tension Relief Machine"

/obj/item/dildo/cyborg/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	var/message = ""
	if(istype(M, /mob/living/carbon/human) && M.is_bottomless())
		if(M.client && M.client.prefs)
			if(M.client.prefs.toggles & VERB_CONSENT)
				if(hole == CUM_TARGET_VAGINA && M.has_vagina())
					message = (user == M) ? pick("fucks their own pussy with \the [src]","shoves the [src] into their pussy", "jams the [src] into their pussy") : pick("fucks [M] right in the pussy with \the [src]", "jams \the [src] right into [M]'s pussy")
				else if(hole == CUM_TARGET_ANUS && M.has_anus())
					message = (user == M) ? pick("fucks their own ass with \the [src]","shoves the [src] into their ass", "jams the [src] into their ass") : pick("fucks [M]'s asshole with \the [src]", "jams \the [src] into [M]'s ass")
	if(message)
		user.visible_message("<font color=purple>[user] [message].</font>")
		M.handle_post_sex(5, null, user)
		playsound(loc, pick('modular_badlands/code/modules/lewd_code/interactions/sound/bang4.ogg',
							'modular_badlands/code/modules/lewd_code/interactions/sound/bang5.ogg',
							'modular_badlands/code/modules/lewd_code/interactions/sound/bang6.ogg'), 70, 1, -1)
	else if(user.a_intent == INTENT_HARM)
		return ..()
