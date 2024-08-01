// ---------------------------
// STIMPAK FLUID REAGENT

/datum/reagent/medicine/stimpak
	name = "Stimpak Fluid"
	description = "Rapidly heals damage when injected. Toxic if ingested or inhaled."
	reagent_state = LIQUID
	color = "#eb0000"
	taste_description = "grossness"
	metabolization_rate = 1 * REAGENTS_METABOLISM
	overdose_threshold = 11
	addiction_threshold = 11
	value = REAGENT_VALUE_RARE
	ghoulfriendly = TRUE
	pain_resistance = 5
	thirst_drain = -0.5

/datum/reagent/medicine/stimpak/reaction_mob(mob/living/M, method=TOUCH, reac_volume, show_message = 1)
	if(iscarbon(M) && M.stat != DEAD)
		if(method in list(INGEST, VAPOR, TOUCH))
			M.adjustToxLoss(3.75*reac_volume*REAGENTS_EFFECT_MULTIPLIER)
			if(show_message)
				to_chat(M, "<span class='warning'>You don't feel so good...</span>")
	..()

/datum/reagent/medicine/stimpak/on_mob_life(mob/living/carbon/M)
	if(M.health < 0)	//Functions as epinephrine.
		M.adjustToxLoss(-0.5*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
		M.adjustBruteLoss(-0.5*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
		M.adjustFireLoss(-0.5*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
	if(M.oxyloss > 35)
		M.setOxyLoss(35, 0)
	if(M.losebreath >= 4)
		M.losebreath -= 2
	if(M.losebreath < 0)
		M.losebreath = 0
	if(prob(50))
		M.AdjustAllImmobility(-20, 0)
		M.AdjustUnconscious(-20, 0)
		M.adjustBruteLoss(-6*REAGENTS_EFFECT_MULTIPLIER)
		M.adjustFireLoss(-2*REAGENTS_EFFECT_MULTIPLIER)
		M.AdjustStun(-2*REAGENTS_EFFECT_MULTIPLIER, 0)
		M.AdjustKnockdown(-2*REAGENTS_EFFECT_MULTIPLIER, 0)
		M.adjustStaminaLoss(-2*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
	else//Half of the time it's worse, but STILL does something.
		M.AdjustAllImmobility(-10, 0)
		M.AdjustUnconscious(-10, 0)
		M.adjustBruteLoss(-3*REAGENTS_EFFECT_MULTIPLIER)
		M.adjustFireLoss(-1*REAGENTS_EFFECT_MULTIPLIER)
		M.AdjustStun(-1*REAGENTS_EFFECT_MULTIPLIER, 0)
		M.AdjustKnockdown(-1*REAGENTS_EFFECT_MULTIPLIER, 0)
		M.adjustStaminaLoss(-1*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
	..()
	//Quickly purges a select number of chems.
	M.reagents.remove_reagent(/datum/reagent/drug/jet,6)
	M.reagents.remove_reagent(/datum/reagent/drug/turbo,6)
	M.reagents.remove_reagent(/datum/reagent/drug/psycho,6)
	M.reagents.remove_reagent(/datum/reagent/drug/buffout,6)
	return TRUE // update health at end of tick

/datum/reagent/medicine/stimpak/overdose_process(mob/living/M)
	M.adjustToxLoss(2*REAGENTS_EFFECT_MULTIPLIER)
	M.adjustOxyLoss(4*REAGENTS_EFFECT_MULTIPLIER)
	..()
	. = TRUE

// ---------------------------
// IMITATION STIMPAK FLUID REAGENT

/datum/reagent/medicine/stimpakimitation
	name = "Imitation Stimpak Fluid"
	description = "Rapidly heals damage when injected. A poor man's stimpak."
	reagent_state = LIQUID
	color = "#FFA500"
	ghoulfriendly = TRUE
	pain_resistance = -5

/datum/reagent/medicine/stimpakimitation/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-2*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
	M.adjustFireLoss(-1.5*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
	M.AdjustKnockdown(-2*REAGENTS_EFFECT_MULTIPLIER, FALSE)
	..()
	return TRUE // update health and mobility at end of tick

// ---------------------------
// SUPER STIMPAK FLUID REAGENT

/datum/reagent/medicine/super_stimpak
	name = "super stim chemicals"
	description = "Chemicals found in pre-war stimpaks."
	reagent_state = LIQUID
	color = "#e50d0d"
	metabolization_rate = 1.5 * REAGENTS_METABOLISM
	overdose_threshold = 11
	addiction_threshold = 11
	value = REAGENT_VALUE_VERY_RARE
	ghoulfriendly = TRUE
	pain_resistance = 15
	thirst_drain = -0.1

/datum/reagent/medicine/super_stimpak/reaction_mob(mob/living/M, method=TOUCH, reac_volume, show_message = 1)
	if(iscarbon(M) && M.stat != DEAD)
		if(method in list(INGEST, VAPOR, TOUCH))
			M.adjustToxLoss(7.5*reac_volume*REAGENTS_EFFECT_MULTIPLIER)
			if(show_message)
				to_chat(M, "<span class='warning'>You don't feel so good...</span>")
	..()

/datum/reagent/medicine/super_stimpak/on_mob_life(mob/living/M)
	if(M.health < 0)					//Functions as epinephrine.
		M.adjustToxLoss(-2*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
		M.adjustBruteLoss(-2*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
		M.adjustFireLoss(-2*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
	if(M.oxyloss > 15)
		M.setOxyLoss(15, 0)
	if(M.losebreath >= 4)
		M.losebreath -= 2
	if(M.losebreath < 0)
		M.losebreath = 0
	M.AdjustAllImmobility(-40, 0)
	M.AdjustUnconscious(-40, 0)
	M.adjustBruteLoss(-12*REAGENTS_EFFECT_MULTIPLIER)
	M.adjustFireLoss(-4*REAGENTS_EFFECT_MULTIPLIER)
	M.AdjustStun(-5*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.AdjustKnockdown(-5*REAGENTS_EFFECT_MULTIPLIER, 0)
	//Quickly purges a select number of chems. Including its weaker cousin.
	M.reagents.remove_reagent(/datum/reagent/medicine/stimpak,12)
	M.reagents.remove_reagent(/datum/reagent/drug/jet,12)
	M.reagents.remove_reagent(/datum/reagent/drug/turbo,12)
	M.reagents.remove_reagent(/datum/reagent/drug/psycho,12)
	M.reagents.remove_reagent(/datum/reagent/drug/buffout,12)
	..()
	return TRUE // update health at end of tick

/datum/reagent/medicine/super_stimpak/overdose_process(mob/living/M)
	M.adjustToxLoss(4*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
	M.adjustOxyLoss(8*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
	..()
	. = TRUE

// ---------------------------
// LONGPORK STEW REAGENT

/datum/reagent/medicine/longpork_stew
	name = "Longpork stew"
	description = "A dish sworn by some to have unusual healing properties. To most it just tastes disgusting. What even is longpork anyways?..."
	reagent_state = LIQUID
	color =  "#915818"
	taste_description = "oily water, with bits of raw-tasting tender meat."
	metabolization_rate = 0.15 * REAGENTS_METABOLISM //slow, weak heal that lasts a while. Metabolizies much faster if you are not hurt.
	overdose_threshold = 50 //If you eat too much you get poisoned from all the human flesh you're eating
	var/longpork_hurting = 0
	var/longpork_lover_healing = -2
	ghoulfriendly = TRUE

/datum/reagent/medicine/longpork_stew/on_mob_life(mob/living/carbon/M)
	var/is_longporklover = FALSE
	if(HAS_TRAIT(M, TRAIT_LONGPORKLOVER))
		is_longporklover = TRUE
	if(M.getBruteLoss() == 0 && M.getFireLoss() == 0)
		metabolization_rate = 3 * REAGENTS_METABOLISM //metabolizes much quicker if not injured
	var/longpork_heal_rate = (is_longporklover ? longpork_lover_healing : longpork_hurting) * REAGENTS_EFFECT_MULTIPLIER
	if(!M.reagents.has_reagent(/datum/reagent/medicine/stimpak))
		M.adjustFireLoss(longpork_heal_rate)
		M.adjustBruteLoss(longpork_heal_rate)
		M.adjustToxLoss(is_longporklover ? 0 : 3)
		. = TRUE
		..()

/datum/reagent/medicine/longpork_stew/overdose_process(mob/living/M)
	M.adjustToxLoss(2*REAGENTS_EFFECT_MULTIPLIER)
	..()
	. = TRUE

// ---------------------------
// RAD-X REAGENT

/datum/reagent/medicine/radx
	name = "Rad-X"
	description = "Allows the user to prolong exposure time to radiation with less adverse effects."
	reagent_state = LIQUID
	color = "#ff6100"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 21
	ghoulfriendly = TRUE
	thirst_drain = -1

/datum/reagent/medicine/radx/reaction_mob(mob/living/M, method=TOUCH, reac_volume, show_message = 1)
	if(iscarbon(M) && M.stat != DEAD)
		if(method in list(INJECT, VAPOR, TOUCH))
			M.adjustToxLoss(1.5*reac_volume*REAGENTS_EFFECT_MULTIPLIER)
			if(show_message)
				to_chat(M, "<span class='warning'>You don't feel so good...</span>")
	..()

/datum/reagent/medicine/radx/on_mob_life(mob/living/carbon/M)
	..()
	return TRUE // update health at end of tick

/datum/reagent/medicine/radx/overdose_process(mob/living/carbon/human/M)
	M.set_blurriness(15)
	M.set_disgust(6)
	..()

/datum/reagent/medicine/radx/on_mob_add(mob/living/carbon/human/M)
	..()
	if(isliving(M))
		to_chat(M, "<span class='notice'>With Rad-X, you can now soak up more radiation, while suffering less adverse effects.</span>")
		ADD_TRAIT(M, TRAIT_RADX, TRAIT_GENERIC)

/datum/reagent/medicine/radx/on_mob_delete(mob/living/carbon/human/M)
	if(isliving(M))
		to_chat(M, "<span class='notice'>That Rad-X dose has likely gone through your system by now. Time for more.</span>")
		REMOVE_TRAIT(M, TRAIT_RADX, TRAIT_GENERIC)
	..()

// ---------------------------
// RADAWAY REAGENT

/datum/reagent/medicine/radaway
	name = "Radaway"
	description = "A potent anti-radiation drug."
	reagent_state = LIQUID
	color = "#ff7200"
	metabolization_rate = 2 * REAGENTS_METABOLISM
	overdose_threshold = 21
	ghoulfriendly = TRUE
	thirst_drain = -2

/datum/reagent/medicine/radaway/reaction_mob(mob/living/M, method=TOUCH, reac_volume, show_message = 1)
	if(iscarbon(M) && M.stat != DEAD)
		if(method in list(INGEST, VAPOR, TOUCH))
			M.adjustToxLoss(3*reac_volume*REAGENTS_EFFECT_MULTIPLIER)
			if(show_message)
				to_chat(M, "<span class='warning'>You don't feel so good...</span>")
	..()

/datum/reagent/medicine/radaway/on_mob_life(mob/living/carbon/M)
	M.radiation -= min(M.radiation, 16)
	if(ishuman(M) && prob(7))
		var/mob/living/carbon/human/H = M
		H.confused = max(M.confused, 3)
	..()
	return TRUE // update health at end of tick

/datum/reagent/medicine/radaway/overdose_process(mob/living/carbon/human/M)
	M.set_blurriness(30)
	M.set_disgust(12)
	..()

// ---------------------------
// MED-X REAGENT

/datum/reagent/medicine/medx
	name = "Med-X"
	description = "Med-X is a potent painkiller, allowing users to withstand high amounts of pain and continue functioning. Addictive. Prolonged presence in the body can cause seizures and organ damage."
	reagent_state = LIQUID
	color = "#6D6374"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = 16
	addiction_threshold = 16
	pain_resistance = 80
	thirst_drain = -0.3

/datum/reagent/medicine/medx/on_mob_add(mob/living/carbon/human/M)
	..()
	if(isliving(M))
		to_chat(M, "<span class='notice'>You feel tougher, able to shrug off pain more easily.</span>")

/datum/reagent/medicine/medx/on_mob_life(mob/living/carbon/M)
	M.AdjustStun(-30*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.AdjustKnockdown(-30*REAGENTS_EFFECT_MULTIPLIER, 0)
	..()
	. = TRUE

/datum/reagent/medicine/medx/overdose_process(mob/living/carbon/human/M)
	M.set_blurriness(30)
	M.Unconscious(400)
	M.Jitter(1000)
	M.drop_all_held_items()
	M.Dizzy(2)
	M.visible_message("<span class='userdanger'>[M] suddenly passes out!</span>")
	if(prob(10))
		to_chat(M, "<span class='userdanger'>Too much med-x! </span>")
	..()

/datum/reagent/medicine/medx/addiction_act_stage1(mob/living/M)
	if(prob(33))
		M.confused += 10
		M.blur_eyes(20)
		M.adjustStaminaLoss(20*REAGENTS_EFFECT_MULTIPLIER)
		to_chat(M, "<span class='notice'>Your head is pounding. Med-X is hard on the body. </span>")
	..()

/datum/reagent/medicine/medx/addiction_act_stage2(mob/living/M)
	if(prob(33))
		M.confused +=20
		M.blur_eyes(30)
		M.losebreath += 8
		M.set_disgust(12)
		M.adjustStaminaLoss(40*REAGENTS_EFFECT_MULTIPLIER)
		to_chat(M, "<span class='danger'>Your stomach churns, your eyes cloud and you're pretty sure you just popped a lung.</span>")
	..()

/datum/reagent/medicine/medx/addiction_act_stage3(mob/living/M)
	if(prob(33))
		M.confused +=40
		M.blur_eyes(30)
		M.losebreath += 10
		M.set_disgust(25)
		M.adjustStaminaLoss(60*REAGENTS_EFFECT_MULTIPLIER)
		M.Jitter(35)
		M.playsound_local(M, 'sound/effects/singlebeat.ogg', 100, 0)
		M.visible_message("<span class='userdanger'>[M] goes stiff!</span>")
		to_chat(M, "<span class='userdanger'>You throw up everything you've eaten in the past week and some blood to boot. You're pretty sure your heart just stopped for a second, too.</span>")
	..()

/datum/reagent/medicine/medx/addiction_act_stage4(mob/living/M)
	if(prob(33))
		M.confused +=80
		M.blur_eyes(60)
		M.losebreath += 20
		M.set_disgust(50)
		M.Jitter(90)
		M.adjustStaminaLoss(80*REAGENTS_EFFECT_MULTIPLIER)
		M.playsound_local(M, 'sound/effects/singlebeat.ogg', 100, 0)
		M.visible_message("<span class='userdanger'>[M] clutches their stomach and vomits violently onto the ground, bloody froth covering their lips!</span>")
		to_chat(M, "<span class='danger'>Your vision briefly goes black.</span>")
	..()

// ---------------------------
// MENTAT REAGENT

/datum/reagent/medicine/mentat
	name = "Mentat Powder"
	description = "A powerful drug that heals and increases the perception and intelligence of the user."
	color = "#C8A5DC"
	reagent_state = SOLID
	overdose_threshold = 25
	addiction_threshold = 15
	ghoulfriendly = TRUE
	pain_resistance = -25

/datum/reagent/medicine/mentat/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-3*REAGENTS_EFFECT_MULTIPLIER)
	var/obj/item/organ/eyes/eyes = M.getorganslot(ORGAN_SLOT_EYES)
	if (!eyes)
		return
	if(M.getOrganLoss(ORGAN_SLOT_BRAIN) == 0)
		M.cure_all_traumas(TRAUMA_RESILIENCE_SURGERY)
	else if(M.eye_blind || M.eye_blurry)
		M.set_blindness(0)
		M.set_blurriness(0)
		to_chat(M, "<span class='warning'>Your vision slowly returns to normal...</span>")
	if (prob(5))
		to_chat(M, "<span class='notice'>You feel way more intelligent!</span>")
	..()
	. = TRUE

/datum/reagent/medicine/mentat/overdose_process(mob/living/M)
	if(prob(33))
		M.Dizzy(2)
		M.Jitter(2)
	..()

/datum/reagent/medicine/mentat/addiction_act_stage1(mob/living/M)
	if(prob(33))
		M.Jitter(2)
	..()

/datum/reagent/medicine/mentat/addiction_act_stage2(mob/living/M)
	if(prob(33))
		. = TRUE
		M.Dizzy(3)
		M.Jitter(3)
	..()

/datum/reagent/medicine/mentat/addiction_act_stage3(mob/living/M)
	if(prob(33))
		. = TRUE
		M.Dizzy(4)
		M.Jitter(4)
	..()

/datum/reagent/medicine/mentat/addiction_act_stage4(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.Dizzy(5)
		M.Jitter(5)
		. = TRUE
	..()

// ---------------------------
// FIXER REAGENT

/datum/reagent/medicine/fixer
	name = "Fixer Powder"
	description = "Treats addictions while also purging other chemicals from the body. Side effects include nausea."
	reagent_state = SOLID
	color = "#C8A5DC"
	ghoulfriendly = TRUE
	pain_resistance = -10

/datum/reagent/medicine/fixer/on_mob_life(mob/living/carbon/M)
	for(var/datum/reagent/R in M.reagents.addiction_list)
		M.reagents.addiction_list.Remove(R)
		to_chat(M, "<span class='notice'>You feel like you've gotten over your need for [R.name].</span>")
	M.confused = max(M.confused, 4)
	if(ishuman(M) && prob(50))
		var/mob/living/carbon/human/H = M
		H.vomit(10)
	..()
	. = TRUE
