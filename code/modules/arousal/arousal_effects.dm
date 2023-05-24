// Effects relating to large bits. Stupidly large bits.
#define STATUS_EFFECT_BREASTS_ENLARGEMENT /datum/status_effect/chem/breast_enlarger //Applied slowdown due to the ominous bulk.

#define STATUS_EFFECT_PENIS_ENLARGEMENT /datum/status_effect/chem/penis_enlarger //More applied slowdown, just like the above.

/datum/status_effect/chem/breast_enlarger
	id = "breast_enlarger"
	alert_type = null
	var/moveCalc = 1
	var/cachedmoveCalc = 1
	var/last_checked_size //used to prevent potential cpu waste from happening every tick.

/datum/status_effect/chem/breast_enlarger/on_apply()
	log_game("FERMICHEM: [owner]'s breasts has reached comical sizes. ID: [owner.key]")
	return ..()

/datum/status_effect/chem/breast_enlarger/tick()//If you try to wear clothes, you fail. Slows you down if you're comically huge
	var/mob/living/carbon/human/H = owner
	var/obj/item/organ/genital/breasts/B = H.getorganslot(ORGAN_SLOT_BREASTS)
	if(!B)
		H.remove_status_effect(src)
		return
	moveCalc = 1+((round(B.cached_size) - 9)/3) //Afffects how fast you move, and how often you can click.

	if(last_checked_size != B.cached_size)
		H.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/status_effect/breast_hypertrophy, multiplicative_slowdown = moveCalc)
		sizeMoveMod(moveCalc)

	if(B.cached_size > 11)
		var/message = FALSE
		if(H.w_uniform)
			H.dropItemToGround(H.w_uniform, TRUE)
			message = TRUE
		if(H.wear_suit)
			H.dropItemToGround(H.wear_suit, TRUE)
			message = TRUE
		if(message)
			playsound(H.loc, 'sound/items/poster_ripped.ogg', 50, 1)
			to_chat(H, "<span class='warning'>Your enormous breasts are way too large to fit anything over them!</b></span>")

	if (B.size == "huge")
		if(prob(1))
			to_chat(owner, "<span class='notice'>Your back feels painfully sore.</span>")
			var/target = H.get_bodypart(BODY_ZONE_CHEST)
			H.apply_damage(0.1, BRUTE, target)
	else
		if(prob(1))
			to_chat(H, "<span class='notice'>Your back feels very sore.</span>")
	last_checked_size = B.cached_size
	..()
/datum/status_effect/chem/breast_enlarger/on_remove()
	log_reagent("FERMICHEM: [owner]'s breasts has reduced to an acceptable size. ID: [owner.key]")
	to_chat(owner, "<span class='notice'>Your expansive chest has become a more managable size, liberating your movements.</b></span>")
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/status_effect/breast_hypertrophy)
	sizeMoveMod(1)
	return ..()

/datum/status_effect/chem/breast_enlarger/proc/sizeMoveMod(value)
	if(cachedmoveCalc == value)
		return
	owner.action_cooldown_mod /= cachedmoveCalc
	owner.action_cooldown_mod *= value
	cachedmoveCalc = value

/datum/status_effect/chem/penis_enlarger
	id = "penis_enlarger"
	alert_type = null
	var/bloodCalc
	var/moveCalc
	var/last_checked_size //used to prevent potential cpu waste, just like the above.

/datum/status_effect/chem/penis_enlarger/on_apply()//Removes clothes, they're too small to contain you. You belong to space now.
	log_reagent("FERMICHEM: [owner]'s dick has reached comical sizes. ID: [owner.key]")
	return ..()


/datum/status_effect/chem/penis_enlarger/tick()
	var/mob/living/carbon/human/H = owner
	var/obj/item/organ/genital/penis/P = H.getorganslot(ORGAN_SLOT_PENIS)
	if(!P)
		owner.remove_status_effect(src)
		return
	moveCalc = 1+((round(P.length) - 21)/3) //effects how fast you can move
	bloodCalc = 1+((round(P.length) - 21)/15) //effects how much blood you need (I didn' bother adding an arousal check because I'm spending too much time on this organ already.)
	if(P.length < 22 && H.has_movespeed_modifier(/datum/movespeed_modifier/status_effect/penis_hypertrophy))
		to_chat(owner, "<span class='notice'>Your rascally willy has become a more managable size, liberating your movements.</b></span>")
		H.remove_movespeed_modifier(/datum/movespeed_modifier/status_effect/penis_hypertrophy)
	else if(P.length >= 22 && !H.has_movespeed_modifier(/datum/movespeed_modifier/status_effect/penis_hypertrophy))
		to_chat(H, "<span class='warning'>Your indulgent johnson is so substantial, it's taking all your blood and affecting your movements!</b></span>")
		H.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/status_effect/penis_hypertrophy, multiplicative_slowdown = moveCalc)
	H.AdjustBloodVol(bloodCalc)
	..()

/datum/status_effect/chem/penis_enlarger/on_remove()
	log_reagent("FERMICHEM: [owner]'s dick has reduced to an acceptable size. ID: [owner.key]")
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/status_effect/penis_hypertrophy)
	owner.ResetBloodVol()
	return ..()
