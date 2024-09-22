// Hey, Carl here. Badlands edits for emotes and overrides should be placed in this folder.
// Please try to keep it consistent.
// Datum vars below for reference.
/*
/datum/emote
	var/key = "" //What calls the emote
	var/key_third_person = "" //This will also call the emote
	var/message = "" //Message displayed when emote is used
	var/message_alien = "" //Message displayed if the user is a grown alien
	var/message_larva = "" //Message displayed if the user is an alien larva
	var/message_robot = "" //Message displayed if the user is a robot
	var/message_AI = "" //Message displayed if the user is an AI
	var/message_monkey = "" //Message displayed if the user is a monkey
	var/message_simple = "" //Message to display if the user is a simple_animal
	var/message_param = "" //Message to display if a param was given
	var/emote_type = EMOTE_VISIBLE //Whether the emote is visible or audible
	var/restraint_check = FALSE //Checks if the mob is restrained before performing the emote
	var/muzzle_ignore = FALSE //Will only work if the emote is EMOTE_AUDIBLE
	var/list/mob_type_allowed_typecache = /mob //Types that are allowed to use that emote
	var/list/mob_type_blacklist_typecache //Types that are NOT allowed to use that emote
	var/list/mob_type_ignore_stat_typecache
	var/stat_allowed = CONSCIOUS
	var/static/list/emote_list = list()
	var/static/regex/stop_bad_mime = regex(@"says|exclaims|yells|asks")
	/// Sound to play when emote is called.
	var/sound
	/// Volume of the sound we play
	var/sound_volume = 50
	/// If the sound varies in pitch, set to true
	var/sound_vary = FALSE
	/// Can only play sound when forced
	var/only_forced_audio = FALSE
	/// The cooldown between the uses of the emote.
	var/cooldown = 0.8 SECONDS
	/// Does this message have a message that can be modified by the user?
	var/can_message_change = FALSE
	/// How long is the cooldown on the audio of the emote, if it has one?
	var/audio_cooldown = 2 SECONDS

/datum/emote/living/EXAMPLE NOISE/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human_user = user
	if(human_user.gender == FEMALE)
		return pick()
	else
		return pick()
*/
// Now, for the actual emotes. Most of these utilise sounds from elsewhere, but it's likely that a few have been duplicated.
// I tried my best to avoid duplication, but it's whatever. We'll go over it again at some point and correct whatever is doubled.

/datum/emote/living/choke
	key = "choke"
	key_third_person = "chokes"
	message = "chokes!"
	emote_type = EMOTE_AUDIBLE
	sound = 'sound/f13effects/sunsetsounds/choke.ogg'

/datum/emote/living/chuckle
	key = "chuckle"
	key_third_person = "chuckles"
	message = "chuckles."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/chuckle/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human_user = user
	if(human_user.gender == FEMALE)
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/female/female_giggle[rand(1,2)].ogg"
	else
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/male/male_laugh3.ogg"

/datum/emote/living/cough
	key = "cough"
	key_third_person = "coughs"
	message = "coughs!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cough/can_run_emote(mob/user, status_check = TRUE , intentional)
	. = ..()
	if(HAS_TRAIT(user, TRAIT_SOOTHED_THROAT))
		return FALSE

/datum/emote/living/cough/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human_user = user
	if(human_user.gender == FEMALE)
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/female/female_cough[rand(1,6)].ogg"
	else
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/male/male_cough[rand(1,4)].ogg"

/datum/emote/living/deathgasp_simple
	key = "deathgasp_simple"
	key_third_person = "deathgasps"
	message_simple =  "stops moving..."

/datum/emote/living/deathgasp_simple/run_emote(mob/user, params)
	var/mob/living/simple_animal/S = user
	if(istype(S) && S.deathmessage)
		message_simple = S.deathmessage
	. = ..()
	message_simple = initial(message_simple)

/datum/emote/living/deathgasp
	key = "deathgasp"
	key_third_person = "deathgasps"
/*	message = "seizes up and falls limp, their eyes dead and lifeless..."*/
	message_robot = "shudders violently for a moment before falling still, its eyes slowly darkening."
	message_AI = "lets out a flurry of sparks, its screen flickering as its systems slowly halt."
	message_alien = "lets out a waning guttural screech, green blood bubbling from its maw..."
	message_larva = "lets out a sickly hiss of air and falls limply to the floor..."
	message_monkey = "lets out a faint chimper as it collapses and stops moving..."
	stat_allowed = UNCONSCIOUS
	// We Ignore the mob's usual deathsound. Deathsound will be called elsewhere, reused for a better purpose.
	var/deathrattle = "modular_badlands/code/modules/rp_misc/sound/gore/deathrattle.ogg"

/datum/emote/living/deathgasp/run_emote(mob/user, params)
	var/mob/living/simple_animal/S = user
	if(istype(S) && S.deathmessage)
		message_simple = S.deathmessage
	. = ..()
	message_simple = initial(message_simple)
	if(. && deathrattle)
		if(isliving(user))
			var/mob/living/L = user
			if(!L.can_speak_vocal() || L.oxyloss >= 50)// TODO: Clean up this mess.
				return //stop the sound if oxyloss too high/cant speak
			playsound(user, deathrattle, 200, TRUE, TRUE)
	if(. && isalienadult(user))
		playsound(user.loc, 'sound/voice/hiss6.ogg', 80, 1, 1)

/datum/emote/living/gag
	key = "gag"
	key_third_person = "gags"
	message = "gags."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/gag/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human_user = user
	if(human_user.gender == FEMALE)// Same here. Sorry.
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/female/gasp_female[rand(1,7)].ogg"
	else
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/male/gasp_male[rand(1,7)].ogg"

/datum/emote/living/gasp
	key = "gasp"
	key_third_person = "gasps"
	message = "gasps!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS

/datum/emote/living/gasp/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human_user = user
	if(human_user.gender == FEMALE)
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/female/gasp_female[rand(1,7)].ogg"
	else
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/male/gasp_male[rand(1,7)].ogg"

/datum/emote/living/giggle
	key = "giggle"
	key_third_person = "giggles"
	message = "giggles."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/giggle/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human_user = user
	if(human_user.gender == FEMALE)// I know. Same sounds. We don't have better, I think.
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/female/female_giggle[rand(1,2)].ogg"
	else
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/male/male_laugh3.ogg"

/datum/emote/living/carbon/moan
	key = "moan"
	key_third_person = "moans"
	message = "moans!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = SOFT_CRIT

/datum/emote/living/moan/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human_user = user
	if(human_user.gender == FEMALE)
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/female/female_moan[rand(1,3)].ogg"
	else
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/male/male_moan[rand(1,3)].ogg"

/datum/emote/living/audible
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/audible/can_run_emote(mob/living/user, status_check = TRUE)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent && (!C.mind || !C.mind.miming)

/datum/emote/living/audible/laugh
	key = "laugh"
	key_third_person = "laughs"
	message = "laughs."

/datum/emote/living/audible/laugh/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human_user = user
	if(isrobotic(user))
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/other/robolaugh.ogg"
	if(human_user.gender == FEMALE)
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/female/female_laugh[rand(1,3)].ogg"
	else
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/male/male_laugh[rand(1,3)].ogg"

/datum/emote/living/scream
	key = "scream"
	key_third_person = "screams"
	message = "screams."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/scream/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human_user = user
	if(ismonkey(user))
		return 'modular_citadel/sound/voice/scream_monkey.ogg'
	if(istype(user, /mob/living/simple_animal/hostile/gorilla))
		return 'sound/creatures/gorilla.ogg'
	if(is_species(user, /datum/species/jelly))
		if(user.gender == FEMALE)
			return "modular_citadel/sound/voice/scream_jelly_f[rand(1,2)].ogg"
		else
			return "modular_citadel/sound/voice/scream_jelly_m[rand(1,2)].ogg"
	if(is_species(user, /datum/species/android) || is_species(user, /datum/species/synth) || is_species(user, /datum/species/ipc))
		return 'modular_citadel/sound/voice/scream_silicon.ogg'
	if(is_species(user, /datum/species/lizard))
		return 'modular_citadel/sound/voice/scream_lizard.ogg'
	if(is_species(user, /datum/species/skeleton))
		return 'modular_citadel/sound/voice/scream_skeleton.ogg'
	if (is_species(user, /datum/species/fly) || is_species(user, /datum/species/insect))
		return 'modular_citadel/sound/voice/scream_moth.ogg'
	if(human_user.gender == FEMALE)
		if(user.is_muzzled())
			return "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/female/gagscream[rand(1,3)].ogg"
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/female/female_scream[rand(1,3)].ogg"
	else
		if(user.is_muzzled())
			return "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/male/muffled[rand(1,2)].ogg"
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/male/male_scream[rand(1,3)].ogg"

/datum/emote/warcry
	key = "warcry"
	key_third_person = "warcrys"
	message = "<b>let out a warcry!!</b>"

/datum/emote/warcry/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human_user = user
	if(human_user.gender == FEMALE)
		return
	else
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/male/angryscream2.ogg"


/datum/emote/living/whimper
	key = "whimper"
	key_third_person = "whimpers"
	message = "whimpers."

/datum/emote/living/whimper/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human_user = user
	if(human_user.gender == FEMALE)
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/female/whimper_female[rand(1,3)].ogg"
	else
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/male/whimper_male[rand(1,3)].ogg"

/datum/emote/living/sigh
	key = "sigh"
	key_third_person = "sighs"
	message = "sighs."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sigh/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human_user = user
	if(human_user.gender == FEMALE)
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/female/sigh_female.ogg"
	else
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/male/sigh_male.ogg"

/datum/emote/living/sneeze
	key = "sneeze"
	key_third_person = "sneezes"
	message = "sneezes."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sneeze/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human_user = user
	if(human_user.gender == FEMALE)
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/female/fneezef[rand(1,2)].ogg"
	else
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/male/sneezem[rand(1,2)].ogg"

/datum/emote/living/sniff
	key = "sniff"
	key_third_person = "sniffs"
	message = "sniffs."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sniff/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	return  "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/sniff.ogg"

/datum/emote/living/surrender
	key = "surrender"
	key_third_person = "surrenders"
	message = "puts their hands on their head and falls to the ground, they surrender!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS
	restraint_check = FALSE
	sound_volume = 80
	sound_vary = FALSE

/datum/emote/living/surrender/get_sound(mob/living/user)
	return 'sound/f13effects/surrender1.ogg'

/datum/emote/living/surrender/run_emote(mob/user, params)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Knockdown(200)
		L.Paralyze(200)

/datum/emote/living/yawn
	key = "yawn"
	key_third_person = "yawns"
	message = "yawns."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/yawn/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human_user = user
	if(human_user.gender == FEMALE)
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/female/female_yawn[rand(1,3)].ogg"
	else
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/male/male_yawn[rand(1,2)].ogg"

/datum/emote/living/mumble
	key = "mumble"
	key_third_person = "mumbles"
	message = "mumbles!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/mumble/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human_user = user
	if(human_user.gender == FEMALE)
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/female/mumble_female.ogg"
	else
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/male/mumble_male.ogg"

/datum/emote/living/hum
	key = "hum"
	key_third_person = "hums"
	message = "hums!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/hum/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human_user = user
	if(human_user.gender == FEMALE)
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/female/femalehumming.ogg"
	else
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/forced_emotes/male/malehumming.ogg"

/datum/emote/living/hem
	key = "hem"
	key_third_person = "hems"
	message = "hems!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/hem/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human_user = user
	if(human_user.gender == FEMALE)
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/female/hem_female.ogg"
	else
		return "modular_badlands/code/modules/rp_misc/sound/character_fluff/emotes/male/hem_male.ogg"
