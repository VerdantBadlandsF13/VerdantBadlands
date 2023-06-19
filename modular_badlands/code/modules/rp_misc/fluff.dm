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

// The var. Something we can use elsewhere.
// For example, with effects relating to cycling status states. - Carl
/mob/var/last_breath = 0
// Audio for breathing, when stamina is low.
// TODO: Extend breathing audio to standard states, not just low stamina?
/mob/living/carbon/proc/handle_stamina_sounds(mob/living/M)
	if(world.time < last_breath)
		return
	if(getStaminaLoss() > STAMINA_NEAR_CRIT)
		handle_crit_stamina_sound()
		to_chat(src, span_warning("You're too tired to keep this up! Make sure you rest."))
		last_breath = world.time + 12 SECONDS
		return
	if(getStaminaLoss() > STAMINA_LOW)
		handle_low_stamina_sound()
		to_chat(src, span_danger("You're becoming winded. Take a break."))
		last_breath = world.time + 5 SECONDS
		return

/mob/living/carbon/proc/handle_low_stamina_sound(mob/living/M)
	var/lowstam_sound
	if(src.gender == FEMALE)
		lowstam_sound = "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/female/tired.ogg"
	else
		lowstam_sound = "modular_badlands/code/modules/rp_misc/sound/inhale.ogg"
	playsound(src, lowstam_sound, 50, 1)

/mob/living/carbon/proc/handle_crit_stamina_sound(mob/living/M)
	var/critstam_sound
	if(src.gender == FEMALE)
		critstam_sound = "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/female/tired.ogg"
	else
		critstam_sound = "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/male/fatigue[rand(1,3)].ogg"
	playsound(src, critstam_sound, 50, 1)

/*
Radio static below.
Pulled from MS ala ~2021, redone for our purposes. Cheers. - Carl
Determines how badly a broadcasting radio suffers from static.
The number refers to the odds that each character in a message is garbled.
*/
#define STATIC_NONE 0// Vault.
#define STATIC_LIGHT 12// GMB exclusive, for now.
#define STATIC_MEDIUM 16// For DFS.
#define STATIC_HEAVY 24// All other radio sets. Handheld or otherwise.

/obj/item/radio
	var/ranged_static = STATIC_HEAVY

/obj/item/radio/headset/headset_overseer
	ranged_static = STATIC_NONE

/obj/item/radio/headset/headset_vault
	ranged_static = STATIC_NONE

/obj/item/radio/headset/headset_vaultsec
	ranged_static = STATIC_NONE

/obj/item/radio/headset/headset_cent
	ranged_static = STATIC_NONE

/obj/item/radio/headset/headset_gmb
	ranged_static = STATIC_LIGHT

/obj/item/radio/headset/headset_dfs
	ranged_static = STATIC_MEDIUM
