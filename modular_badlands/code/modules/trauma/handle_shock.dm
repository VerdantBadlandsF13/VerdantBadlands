//Refer to life.dm for caller

/mob/living/carbon/human/handle_shock()
	..()
	if(status_flags & GODMODE)
		return 0
	var/pain_goes_up = TRUE

	if(health < SOFT_CRIT) //Going under the crit threshold makes you immediately collapse
		pain_shock_stage = max(pain_shock_stage, 61)
	else if(pain_level >= BASE_CARBON_PAIN_RESIST)//Remaining over the pain threshold causes shock to increase over time
		pain_shock_stage += 1
	else
		pain_shock_stage = clamp(pain_shock_stage - 1, 0, 160)//While staying under will decrease it over time
		pain_goes_up = FALSE

	if (pain_goes_up)
		if(pain_shock_stage == 10)
			to_chat(src, "<span class='danger'>[pick("It hurts so much!", "You really need some painkillers.", "Dear god, the pain!")]</span>")

		if(pain_shock_stage >= 30)
			if(pain_shock_stage == 30)
				if(!UNCONSCIOUS)
					visible_message("<B>[src]</B> is having trouble keeping their eyes open.","You're having trouble keeping your eyes open.")
			eye_blurry = max(2, eye_blurry)
			stuttering = max(stuttering, 5)

		if(pain_shock_stage == 40)
			to_chat(src, "<span class='danger'>[pick("The pain is excruciating!", "Please, just end the pain!", "Your whole body is going numb!")]</span>")

		if(pain_shock_stage >= 60 && pain_shock_stage < 80)
			if(pain_shock_stage == 60)
				if(!UNCONSCIOUS)
					visible_message("<B>[src]</B>'s body becomes limp.","Your body becomes limp.")
			if(prob(2))
				to_chat(src, "<span class='danger'>[pick("The pain is excruciating!", "Please, just end the pain!", "Your whole body is going numb!")]</span>")
				Knockdown(10)

		if(pain_shock_stage >= 80 && pain_shock_stage < 150)
			if(prob(5))
				to_chat(src, "<span class='danger'>[pick("The pain is excruciating!", "Please, just end the pain!", "Your whole body is going numb!")]</span>")
				Knockdown(10)

		if(pain_shock_stage >= 120 && pain_shock_stage < 150)
			if(prob(2))
				to_chat(src, "<span class='danger'>[pick("You black out!", "You feel like you could die any moment now.", "You're about to lose consciousness.")]</span>")
				IsParalyzed(5)

		if(pain_shock_stage == 150)
			if(!UNCONSCIOUS)
				visible_message("<B>[src]</b> can no longer stand, collapsing!","You can no longer stand, you collapse!")
			Knockdown(10)

		if(pain_shock_stage >= 150)
			if(prob(80))
				Knockdown(4)

	else//pain goes down
		//treshold messages
		if(!UNCONSCIOUS)
			if(pain_shock_stage == 29)
				to_chat(src,"The pain becomes manageable.")
			if(pain_shock_stage == 49)//movement stops being slowed down
				to_chat(src,"The pain stops hindering your movement.")
			if(pain_shock_stage >= 50)
				if(prob(2))
					to_chat(src, "<span class='rose'>[pick("The pain slowly resorbs.", "You slowly begin to feel better.", "You begin to feel stuff other than pain again.")]</span>")
