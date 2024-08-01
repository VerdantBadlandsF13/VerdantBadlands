/mob/proc/flash_pain()
	overlay_fullscreen("pain", /obj/screen/fullscreen/pain, 2)
	spawn(50)
		clear_fullscreen("pain")

/obj/screen/fullscreen/pain
	icon_state = "painoverlay2"
	layer = UI_DAMAGE_LAYER
	plane = FULLSCREEN_PLANE

/mob/proc/flash_weak_pain()
	overlay_fullscreen("pain", /obj/screen/fullscreen/pain/weak, 2)
	spawn(50)
		clear_fullscreen("pain")

/obj/screen/fullscreen/pain/weak
	icon_state = "painoverlay1"
	layer = UI_DAMAGE_LAYER
	plane = FULLSCREEN_PLANE

/mob/proc/flash_agony()
	overlay_fullscreen("pain", /obj/screen/fullscreen/pain/agony, 2)
	spawn(50)
		clear_fullscreen("pain")

/obj/screen/fullscreen/pain/agony
	icon_state = "bloodlust"
	layer = UI_DAMAGE_LAYER
	plane = FULLSCREEN_PLANE

/mob/var/list/pain_stored = list()
/mob/var/last_pain_message = ""
/mob/var/next_pain_time = 0

// partname is the name of a body part
// amount is a num from 1 to 100
/mob/living/carbon/proc/pain(partname, amount, force, burning = 0)
	if(stat >= 2 || IsSleeping())
		return
	if(!feels_pain() || has_painkillers())
		return
	if(world.time < next_pain_time && !force)
		return
	if(amount > 50 && prob(amount / 5) && get_active_hand())
		flash_agony()
		handle_lowpain()
		to_chat(src, "<span class='danger'>The pain in your [partname] causes you to wince and drop [get_active_hand()]!</span>")
		src.dropItemToGround(force=TRUE)
	var/msg
	if(burning)
		switch(amount)
			if(1 to 10)
				flash_weak_pain()
				msg = "<span class='danger'>Your [partname] burns.</span>"
			if(11 to 90)
				flash_pain()
				handle_lowpain()
				msg = "<span class='danger'><font size=2>Your [partname] burns badly!</font></span>"
			if(91 to 10000)
				flash_agony()
				handle_highpain()
				msg = "<span class='danger'><font size=3>OH GOD! Your [partname] is on fire!</font></span>"
	else
		switch(amount)
			if(1 to 10)
				flash_weak_pain()
				msg = "<b>Your [partname] hurts.</b>"
			if(11 to 90)
				flash_pain()
				handle_lowpain()
				msg = "<b><font size=2>Your [partname] hurts badly.</font></b>"
			if(91 to INFINITY)
				flash_agony()
				handle_highpain()
				msg = "<b><font size=3>OH GOD! Your [partname] is hurting terribly!</font></b>"
	if(msg && (msg != last_pain_message || prob(10)))
		last_pain_message = msg
		to_chat(src, msg)
	next_pain_time = world.time + (100 - amount)

/mob/living/carbon/human/proc/handle_pain()
	if(IsSleeping() || stat == DEAD)
		return
	if(!feels_pain() || has_painkillers())
		return

	var/max_damage = 0
	var/obj/item/bodypart/damaged_bodypart = null

	for(var/obj/item/bodypart/BP in bodyparts)
		// Is your limb disabled or suffering paralysis? Continue.
		if(BP.disabled >= BODYPART_DISABLED_DAMAGE)
			continue
		// Robotic limb? Continue.
		if(!BP.status == BODYPART_ORGANIC)
			continue

		var/damage = BP.get_damage()
		// make the choice of the organ depend on damage,
		// but also sometimes use one of the less damaged ones
		if(damage > max_damage && (max_damage == 0 || prob(70)) )
			damaged_bodypart = BP
			max_damage = damage

	if(damaged_bodypart)
		pain(damaged_bodypart, max_damage, 0)

	// Damage to internal organs hurts a lot.
	for(var/obj/item/organ/I in internal_organs)
		if(I.damage > 2)
			if(prob(2))
				custom_pain("You feel a sharp pain in your [I]", 1)

	var/toxDamageMessage = null
	var/toxMessageProb = 1
	switch(getToxLoss())
		if(1 to 5)
			toxMessageProb = 1
			toxDamageMessage = "Your body stings slightly."
		if(6 to 10)
			toxMessageProb = 2
			toxDamageMessage = "Your whole body hurts a little."
		if(11 to 15)
			toxMessageProb = 2
			toxDamageMessage = "Your whole body hurts."
		if(15 to 25)
			toxMessageProb = 3
			toxDamageMessage = "Your whole body hurts badly."
		if(26 to INFINITY)
			toxMessageProb = 5
			toxDamageMessage = "Your body aches all over, it's driving you mad."

	if(toxDamageMessage && prob(toxMessageProb))
		src.custom_pain(toxDamageMessage, getToxLoss() >= 15)


// message is the custom message to be displayed
// flash_strength is 0 for weak pain flash, 1 for strong pain flash
/mob/living/carbon/human/proc/custom_pain(message, flash_strength)
	if(stat >= 1)
		return

	if(!feels_pain() || has_painkillers())
		return

	var/msg = "<span class='danger'>[message]</span>"
	if(flash_strength >= 1)
		msg = "<span class='danger'><font size=3>[message]</font></span>"

	// Anti message spam checks
	if(msg && ((msg != last_pain_message) || (world.time >= next_pain_time)))
		last_pain_message = msg
		to_chat(src, msg)
	next_pain_time = world.time + 100
