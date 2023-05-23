// A variety of things, such as sounds and so on, to make the world feel more alive. A lot of this is pulled directly, almost 1:1, from Interbay.
// Gasmask fluff from IB.
/mob/living/carbon/human/proc/handle_gas_mask_sound()
	if(istype(wear_mask, /obj/item/clothing/mask/gas))
		var/mask_sound = "modular_badlands/code/modules/rp_misc/sound/mask/gasmask[rand(1,10)].ogg"
		playsound(src, mask_sound, 50, 1)

// Audio for bleeding.
/mob/living/carbon/proc/handle_blood_drip_sound()
	var/drip_sound = "modular_badlands/code/modules/rp_misc/sound/gore/blood[rand(1,6)].ogg"
	playsound(src, drip_sound, 50, 1)

// General radio audio. Perhaps extend to other things.
// Radio fluff. Audio from IB. Initial code without modification from SR(I think???).
/obj/item/radio/talk_into(atom/movable/M, message, channel, list/spans, datum/language/language)
	var/radiosound = "modular_badlands/code/modules/rp_misc/sound/radio/transmit/radio[rand(1,4)].ogg"
	if(radiosound && listening)
		playsound(M, radiosound, rand(20, 30))
	. = ..()

// Tuning the channel provides feedback.
// Hooked into tuning, rather than a piece of it like 'talk_into'.
/obj/item/radio/proc/play_change_freq()
	var/radtune_sound = "modular_badlands/code/modules/rp_misc/sound/radio/radiohiss.ogg"
	playsound(src, radtune_sound, rand(20, 30))

// Receiving a message provides feedback.
// Not used as of current in its intended form.
/obj/item/radio/proc/play_receive_transmission()
	var/radrec_sound = "modular_badlands/code/modules/rp_misc/sound/radio/receive/radio[rand(1,4)].ogg"
	playsound(src, radrec_sound, rand(20, 30))

/*
This is a huge block for stamina garbage.
Ignore it, if possible.
*/

// The define. Not going to undefine it afterwards, as we can use it elsewhere.
// For example, with effects relating to cycling status states. - Carl
#define BREATH_COOLDOWN 300 // By default, thirty seconds.
// Audio for breathing, when stamina is low.
// TODO: Extend breathing audio to standard states, not just low stamina?
/mob/living/carbon/proc/handle_stamina_sounds(mob/living/M)
	var/last_breath = 0
	if(last_breath+BREATH_COOLDOWN > world.time)
		return
	if(getStaminaLoss() > STAMINA_NEAR_CRIT)
		handle_crit_stamina_sound()
		to_chat(src, span_warning("You're too tired to keep this up! Make sure you rest."))
		last_breath = world.time + 300
		return
	if(getStaminaLoss() > STAMINA_LOW)
		handle_low_stamina_sound()
		to_chat(src, span_warning("You're becoming winded. Take a break."))
		last_breath = world.time + 600
		return

/mob/living/carbon/proc/handle_low_stamina_sound(mob/living/M)
	var/lowstam_sound = "modular_badlands/code/modules/rp_misc/sound/inhale.ogg"
	playsound(src, lowstam_sound, 50, 1)

/mob/living/carbon/proc/handle_crit_stamina_sound(mob/living/M)
	var/critstam_sound
	if(src.gender == FEMALE)
		critstam_sound = "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/female/tired.ogg"
	else
		critstam_sound = "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/male/fatigue[rand(1,3)].ogg"
	playsound(src, critstam_sound, 50, 1)
