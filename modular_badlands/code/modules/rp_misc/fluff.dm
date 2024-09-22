// A variety of things, such as sounds and so on, to make the world feel more alive.
// Gasmask fluff from IB.
/mob/living/carbon/human/proc/handle_gas_mask_sound()
	if(istype(wear_mask, /obj/item/clothing/mask/gas))
		var/mask_sound = "modular_badlands/code/modules/rp_misc/sound/mask/gasmask[rand(1,10)].ogg"
		playsound(src, mask_sound, 50, 1)

/mob/living/carbon/human/proc/handle_deathdoor_sound()
	if(isrobotic(src))
		return
	var/deathdoor_sound = "modular_badlands/code/modules/rp_misc/sound/gore/death/deadgasp[rand(1,5)].ogg"
	playsound(src, deathdoor_sound, 50, 1)

// Audio for bleeding.
/mob/living/carbon/proc/handle_blood_drip_sound()
	var/drip_sound = "modular_badlands/code/modules/rp_misc/sound/gore/blood[rand(1,6)].ogg"
	playsound(src, drip_sound, 50, 1)
/*
// UNUSED START
// General radio audio. Perhaps extend to other things.
// Radio fluff. Audio from IB. Initial code without modification from SR(I think???).
/obj/item/radio/proc/radio_vacant()
	var/radiosound = "modular_badlands/code/modules/rp_misc/sound/radio/transmit/radio[rand(1,4)].ogg"
	if(radiosound && listening)
		playsound(src, radiosound, rand(20, 30))
	. = ..()

// Receiving a message provides feedback.
// Hooked into receiving, rather than a piece of it like 'talk_into'.
/obj/item/radio/proc/play_receive_transmission()
	var/radrec_sound = "modular_badlands/code/modules/rp_misc/sound/radio/receive/radio[rand(1,4)].ogg"
	playsound(src, radrec_sound, rand(20, 30))
// UNUSED END
*/
// Tuning the channel provides feedback.
// Hooked into tuning, rather than a piece of it like 'talk_into'.
/obj/item/radio/proc/play_change_freq()
	var/radtune_sound = "modular_badlands/code/modules/rp_misc/sound/radio/radiohiss.ogg"
	playsound(src, radtune_sound, rand(20, 30))

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
	if(isrobotic(src))
		return
	if(world.time < last_breath)
		return
	if(getStaminaLoss() > STAMINA_NEAR_CRIT)
		handle_crit_stamina_sound()
		to_chat(src, span_warning("You're too tired to keep this up! Make sure you rest."))
		last_breath = world.time + 48 SECONDS
		return
	if(getStaminaLoss() > STAMINA_LOW)
		handle_low_stamina_sound()
		to_chat(src, span_danger("You're becoming winded. Take a break."))
		last_breath = world.time + 24 SECONDS
		return

/mob/living/carbon/proc/handle_low_stamina_sound(mob/living/M)
	var/lowstam_sound
	if(src.gender == FEMALE)
		lowstam_sound = "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/female/tired.ogg"
	else
		lowstam_sound = "modular_badlands/code/modules/rp_misc/sound/inhale.ogg"
	playsound(src, lowstam_sound, 50, 0)

/mob/living/carbon/proc/handle_crit_stamina_sound(mob/living/M)
	var/critstam_sound
	if(src.gender == FEMALE)
		critstam_sound = "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/female/tired.ogg"
	else
		critstam_sound = "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/male/fatigue[rand(1,3)].ogg"
	playsound(src, critstam_sound, 50, 0)

/*
Mob audio for catching fire.
Easier to have it here.
*/

/mob/living/carbon/proc/handle_incineration(mob/living/M)
	if(isrobotic(src))
		return
	var/incineration_sound
	if(src.gender == FEMALE)
		incineration_sound = "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/female/woman_pain[rand(1,4)].ogg"
	else
		incineration_sound = "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/male/male_onfire[rand(1,3)].ogg"
	playsound(src, incineration_sound, 50, 0)

/*
Mob audio for pain.
Light, followed by extreme.
*/

/mob/living/carbon/proc/handle_lowpain(mob/living/M)
	if(isrobotic(src))//Checked here and in 'feels_pain' Why do we need it twice? I 'unno.
		return
	if(world.time < last_breath)
		return
	var/lowpain_sound
	if(src.gender == FEMALE)
		lowpain_sound = "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/female/female_moan[rand(1,3)].ogg"
	else
		lowpain_sound = "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/male/male_moan[rand(1,3)].ogg"
	playsound(src, lowpain_sound, 50, 0)
	last_breath = world.time + 2 MINUTES

/mob/living/carbon/proc/handle_highpain(mob/living/M)
	if(isrobotic(src))//Checked here and in 'feels_pain' Why do we need it twice? I 'unno.
		return
	if(world.time < last_breath)
		return
	var/highpain_sound
	if(src.gender == FEMALE)
		highpain_sound = "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/female/woman_pain[rand(1,4)].ogg"
	else
		highpain_sound = "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/male/man_pain[rand(1,3)].ogg"
	playsound(src, highpain_sound, 50, 0)
	last_breath = world.time + 2 MINUTES

/mob/living/carbon/proc/handle_extremepain(mob/living/M)
	if(isrobotic(src))//Checked here and in 'feels_pain' Why do we need it twice? I 'unno.
		return
	if(world.time < last_breath)
		return
	var/highpain_sound
	if(src.gender == FEMALE)
		highpain_sound = "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/female/woman_pain[rand(1,4)].ogg"
	else
		highpain_sound = "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/male/man_pain[rand(1,3)].ogg"
	playsound(src, highpain_sound, 50, 0)
	last_breath = world.time + 2 MINUTES

/*
Radio static below.
Determines how badly a broadcasting radio suffers from dead air.
The number refers to the odds that each character in a message is potentially dead air.
*/
#define RADSTATIC_NONE 0// Vault.
#define RADSTATIC_LIGHT 12// GMB and Town.
#define RADSTATIC_MEDIUM 18// For DFS.
#define RADSTATIC_HEAVY 24// All other radio sets. Handheld or otherwise.
#define RADSTATIC_STORM 95// Used for global overrides, on storm conditions.

GLOBAL_LIST_EMPTY(radio_sets)

/datum/weather/rad_storm/start()
	for(var/R in GLOB.radio_sets)
		var/obj/item/radio/S = R
		if(!S.ranged_static == RADSTATIC_NONE)
			S.ranged_static = RADSTATIC_STORM
	. = ..()

/datum/weather/rad_storm/end()
	for(var/R in GLOB.radio_sets)
		var/obj/item/radio/S = R
		if(!S.ranged_static == RADSTATIC_NONE)
			S.ranged_static = (initial(S.ranged_static))
	. = ..()

/obj/item/radio/New()
	. = ..()
	GLOB.radio_sets += src

/obj/item/radio/Destroy()
	GLOB.radio_sets -= src
	. = ..()

/obj/item/radio
	var/ranged_static = RADSTATIC_HEAVY

/obj/item/radio/headset/headset_overseer
	ranged_static = RADSTATIC_NONE

/obj/item/radio/headset/headset_vault
	ranged_static = RADSTATIC_NONE

/obj/item/radio/headset/headset_vaultsec
	ranged_static = RADSTATIC_NONE

/obj/item/radio/headset/headset_cent
	ranged_static = RADSTATIC_NONE

/obj/item/radio/headset/headset_gmb
	ranged_static = RADSTATIC_LIGHT

/obj/item/radio/headset/headset_town
	ranged_static = RADSTATIC_LIGHT

/obj/item/radio/headset/headset_dfs
	ranged_static = RADSTATIC_MEDIUM


/*
General audio for grabbing and dropping items.
*/

// Defines for items in regards to what they should sound like.
// Bottlecaps, ammo, etc.
// 0 = no audio.
// Drop defines.
#define DROP_CLASS			0
#define DROP_CLASS_CAPS		1
#define DROP_CLASS_KEYS		2
#define DROP_CLASS_CLOTH	3
#define DROP_CLASS_METAL	4
#define DROP_CLASS_LGUNS	5
#define DROP_CLASS_SGUNS	6
#define DROP_CLASS_NADES	7
#define DROP_CLASS_SHARP	8
#define DROP_CLASS_MMETAL	9

// GRAB defines.
#define GRAB_CLASS			0
#define GRAB_CLASS_CAPS		1
#define GRAB_CLASS_KEYS		2
#define GRAB_CLASS_CLOTH	3
#define GRAB_CLASS_METAL	4
#define GRAB_CLASS_LGUNS	5
#define GRAB_CLASS_SGUNS	6
#define GRAB_CLASS_NADES	7
#define GRAB_CLASS_SHARP	8
#define GRAB_CLASS_MMETAL	9

/obj/item
	var/drop_class = null
	var/grab_class = null

// Currency - Caps
/obj/item/stack/f13Cash
	drop_class = 1
	grab_class = 1

// Keys / Key Items
/obj/item/card/id
	drop_class = 2
	grab_class = 2

// Clothing - Cloth
/obj/item/clothing
	drop_class = 3
	grab_class = 3

/obj/item/clothing/suit/armored/f13/light
	drop_class = 3
	grab_class = 3

// Clothing - Other / No PA, since it's not used as of current.
/obj/item/clothing/suit/armored/f13/medium
	drop_class = 4
	grab_class = 4

/obj/item/clothing/suit/armored/f13/heavy
	drop_class = 4
	grab_class = 4

// Firearms - Long Guns
/obj/item/gun/ballistic
	drop_class = 5
	grab_class = 5

/obj/item/gun/energy
	drop_class = 5
	grab_class = 5

// Firearms - Sidearms
/obj/item/gun/ballistic/automatic/pistol
	drop_class = 6
	grab_class = 6

// Explosives
/obj/item/grenade
	drop_class = 7
	grab_class = 7
/*
// General Melee
/obj/item/New()
	. = ..()
// Am I already set? Return.
	if(drop_class || grab_class)
		return ..()
// Shouldn't need it twice, but just in case.
	if(sharpness == SHARP_EDGED || sharpness == SHARP_POINTY)
		drop_class = 8
		grab_class = 8
	if(sharpness == SHARP_NONE)
		drop_class = 9
		grab_class = 9
// Do I still not have a class? Set to silent.
	if(!drop_class || !grab_class)
		drop_class = 0
		grab_class = 0

/obj/item/gun/on_found(mob/finder)
	. = ..()
	play_equip_sound(finder)

/obj/item/grenade/on_found(mob/finder)
	. = ..()
	play_grenade_equip_sound(finder)

/obj/item/gun/proc/play_equip_sound(src, volume=50)
	if(src && equipsound && volume)
		var/played_sound = equipsound

		if(islist(equipsound))
			played_sound = pick(equipsound)

		playsound(src, played_sound, volume, 1)

/obj/item/grenade/proc/play_grenade_equip_sound(src, volume=50)
	if(src && equipsound && volume)
		var/played_sound = equipsound

		if(islist(equipsound))
			played_sound = pick(equipsound)

		playsound(src, played_sound, volume, 1)
*/
// Dropping.
/obj/item/dropped()
	. = ..()
	if(drop_class == 0)
		return ..()
	else
		switch(drop_class)
			if(1)
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/pickdown/capslose[rand(1,2)].ogg", 95, 0)
			if(2)
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/pickdown/keydrop.ogg", 95, 0)
			if(3)
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/pickdown/clothdrop[rand(1,3)].ogg", 95, 0)
			if(4)
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/pickdown/metalarmordrop.ogg", 95, 0)
			if(5)
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/pickdown/rifledrop[rand(1,2)].ogg", 95, 0)
			if(6)
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/pickdown/pistoldrop[rand(1,3)].ogg", 95, 0)
			if(7)
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/pickdown/nadedrop.ogg", 95, 0)
			if(8)
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/pickdown/knifedrop.ogg", 95, 0)
			if(9)
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/pickdown/metaldrop.ogg", 95, 0)
	show_sound_effect(src, soundicon = SFX_ICON_SMALL)

// Grabbing.
/obj/item/pickup()
	. = ..()
	if(grab_class == 0)
		return ..()
	else
		switch(grab_class)
			if(1)
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/pickdown/capspickup[rand(1,4)].ogg", 95, 0)
			if(2)
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/pickdown/keypickup.ogg", 95, 0)
			if(3)
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/pickdown/clothpickup[rand(1,3)].ogg", 95, 0)
			if(4)
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/pickdown/metalarmorpickup.ogg", 95, 0)
			if(5)
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/pickdown/riflepickup.ogg", 95, 0)
			if(6)
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/pickdown/pistolpickup.ogg", 95, 0)
			if(7)
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/pickdown/nadepickup.ogg", 95, 0)
			if(8)
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/pickdown/knifepickup.ogg", 95, 0)
			if(9)
				playsound(src, "modular_badlands/code/modules/rp_misc/sound/pickdown/metalpickup.ogg", 95, 0)
	show_sound_effect(src, soundicon = SFX_ICON_SMALL)

/obj/item/reagent_containers/food/drinks/pickup()
	. = ..()
	playsound(src, "modular_badlands/code/modules/rp_misc/sound/food/bottlefullgrab[rand(1,2)].ogg", 95, 0)
