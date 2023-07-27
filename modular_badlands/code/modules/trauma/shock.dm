/mob/living/var/pain_shock_stage = 0
/mob/living/var/pain_level = 0 //Gets overwritten every tick! If you want to add pain "resistance" or constain pain, see update_pain_level()
/mob/living/var/pain_numb = 0 // When this is set, the mob isn't affected by shock or pain, but can't see their health.

// proc to find out in how much pain the mob is at the moment
/mob/living/carbon/proc/update_pain_level()
	if(pain_numb)
		pain_level = 0
		return

	pain_level = 					\
	1	* src.getOxyLoss() + 		\
	0.7	* src.getToxLoss() + 		\
	1.5	* src.getFireLoss(TRUE) + 		\
	1.2	* src.getBruteLoss(TRUE) + 		\
	1.7	* src.getCloneLoss()
//	0.1	* src.getStaminaLoss()

	for(var/datum/reagent/R in reagents.reagent_list)
		pain_level -= R.pain_resistance

	if(src.slurring) //We're drunk, dulls the pain a bit
		pain_level -= 20

	if(pain_level < 0)
		pain_level = 0

	return pain_level

/mob/living/carbon/proc/handle_shock() //Currently only used for humans
	update_pain_level()

/mob/living/carbon/proc/has_painkillers()
	if(reagents.has_reagent(/datum/reagent/medicine/medx))
		return TRUE
	return FALSE
