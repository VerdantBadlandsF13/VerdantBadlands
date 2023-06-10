// Shield walls for the LBJ. Able to be used elsewhere, but preferably not.
// Turnstiles but lethal, more-or-less.

/datum/looping_sound/shieldwall
	mid_sounds = list('modular_badlands/code/modules/techno_jacks/sounds/shield-loop.ogg')
	mid_length = 10
	volume = 15

/obj/structure/shieldwall
	name = "Parent of Parent Shields - DO NOT USE"
	desc = "An incredibly dangerous wall of light."
	icon = 'modular_badlands/code/modules/techno_jacks/icons/Fields32x32.dmi'
	icon_state = "ERROR"// DON'T USE THIS
	density = 1
	anchored = 1
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	req_one_access = list(ACCESS_VFE)
	var/datum/looping_sound/shieldwall/soundloop
	var/disabled = FALSE// Determines if it's scanning players or not. Sick players are always denied, regardless.
	var/lethal = TRUE// Will this remove someone from the round?
	// Our internal radio
	var/obj/item/radio/radio
	// The key our internal radio uses
	var/radio_key = /obj/item/encryptionkey/zax
	// The security team channel.
	var/security_channel = "Security"
	// The medical team channel.
	var/medical_channel = "Medical"
	// The common channel.
	var/common_channel = null

/obj/structure/shieldwall/Initialize(mapload)
	. = ..()
	radio = new(src)
	radio.keyslot = new radio_key
	radio.listening = 0
	radio.recalculateChannels()
	soundloop = new(src, TRUE)
	soundloop.start()

// Lazy examine addition from holosigns. >:(
/obj/structure/shieldwall/examine(mob/user)
	. = ..()
	. += "<span class='notice'>The biometric scanners are <b>[disabled ? "off" : "on"]</b>.</span>"

// Holosigns, again. Prevents the spread of disease, regardless of biometric scanner status.
/obj/structure/shieldwall/proc/check_sick(mob/living/carbon/human/sickboi)
	var/threat = sickboi.check_virus()
	if(get_disease_severity_value(threat) >= get_disease_severity_value(DISEASE_SEVERITY_MINOR))
		return FALSE
	return TRUE

/obj/structure/shieldwall/CanAtmosPass(turf/T)
	return FALSE// Shield wall. Do shield things.

/obj/structure/shieldwall/CanAllowThrough(atom/movable/AM, turf/target)
	. = ..()

	if(ishuman(AM))
		if(check_sick(AM) == FALSE)// No matter what, if someone is ill, they're denied. Can't even be pulled through.
			playsound(src,'sound/machines/deniedbeep.ogg',50,0,3)
			to_chat(AM, "<span class='his_grace'><b>Your consciousness cries out in agony as you're dropped to the floor.</b><br>\
				<i>What just happened? Where are you?</i></span>")

			var/mob/living/carbon/human/M = AM
			M.visible_message("<span class='danger'>[M] falls to the floor and starts having a seizure!</span>", COMBAT_MESSAGE_RANGE)
			SEND_SOUND(M, sound('modular_badlands/code/modules/rp_misc/sound/gore/contusion.ogg',0,1,0,250))
			M.Unconscious(100)
			M.Jitter(15)

			to_chat(src, Gibberish("Biometric signature rejected! <br>\
			Foreign bodies reported to containment team. Anti-contagion protocols enacted."), COMBAT_MESSAGE_RANGE)

			var/medical_alert = "Foreign bodies detected in denied biometric signature. Move to contain. Local contagion protocols enacted."
			radio.talk_into(src, medical_alert, medical_channel, language = get_selected_language())

			return FALSE

	var/allowed = allowed(AM)// Can pull people through it safely, to bypass restrictions.
	if(!allowed && AM.pulledby)
		allowed = allowed(AM.pulledby)

	if(istype(AM) && (AM.pass_flags & PASSGLASS))
		return TRUE

	if(!isliving(AM))
		return TRUE

	if(disabled)// Does it check for signatures?
		return TRUE// No? Good. They can pass.

	if(allowed)
		playsound(src, "modular_badlands/code/modules/rp_misc/sound/shields/shield_pass_[rand(1,7)].ogg" ,50,0,3)
		return TRUE

	if(!lethal)
		playsound(src,'sound/machines/deniedbeep.ogg',50,0,3)
		to_chat(AM, "<span class='his_grace'><b>Your consciousness cries out in agony as you're dropped to the floor.</b><br>\
		<i>What just happened? Where are you?</i></span>")

		var/mob/living/carbon/human/M = AM
		M.visible_message("<span class='danger'>[M] falls to the floor and starts having a seizure!</span>", COMBAT_MESSAGE_RANGE)
		SEND_SOUND(M, sound('modular_badlands/code/modules/rp_misc/sound/gore/contusion.ogg',0,1,0,250))
		M.Unconscious(100)
		M.Jitter(15)

		to_chat(src, Gibberish("Biometric signature not recognised! <br>\
		On-site security has been alerted and will arrive shortly."), COMBAT_MESSAGE_RANGE)

		var/security_alert = "An unknown biometric signature has attempted to bypass surface security. Move to intercept."
		radio.talk_into(src, security_alert, security_channel, language = get_selected_language())

		return FALSE

	else

		playsound(src,'sound/machines/deniedbeep.ogg',50,0,3)
		to_chat(AM, "<span class='his_grace'><b>Your consciousness cries out in agony as you're dropped to the floor.</b><br>\
		<i>This is how you die. Horrifically.</i></span>")

		var/mob/living/carbon/human/M = AM
		SEND_SOUND(M, sound('modular_badlands/code/modules/rp_misc/sound/gore/contusion.ogg',0,1,0,250))
		M.dust()

		to_chat(src, Gibberish("Biometric signature not recognised! <br>\
		On-site security has been alerted and will arrive shortly."))

		var/security_alert = "An unknown biometric signature has attempted to bypass surface security. Move to intercept."
		radio.talk_into(src, security_alert, security_channel, language = get_selected_language())

		return FALSE

/*
Below are all the shields. The above is the parent.
Keep that in mind when making edits. I beg you.
*/

// 32x32 base.
/obj/structure/shieldwall/standard
	name = "Standard Parent Shield - DO NOT USE"
	desc = "A field of light, preventing access and likely killing those not meant to cross."
	icon = 'modular_badlands/code/modules/techno_jacks/icons/Fields32x32.dmi'
	icon_state = "gate_off"

/obj/structure/shieldwall/standard/stun
	name = "shieldwall"
	desc = "A field of bright light, preventing access. This one is configured to be less-lethal, or has otherwise resorted to backup power."
	icon_state = "gate_yellow"
	light_range = 2
	light_color = "#e8e889"
	req_one_access = list(ACCESS_VFE)
	lethal = FALSE

/obj/structure/shieldwall/standard/lethal
	name = "shieldwall"
	icon_state = "gate_red"
	light_range = 3
	light_color = "#8a0303"
	req_one_access = list(ACCESS_VFE_SECURITY)

// 32x32 alternate base.
/obj/structure/shieldwall/standard_owb
	icon_state = "gate_OWB_off"

/obj/structure/shieldwall/standard_owb/active
	name = "shieldwall"
	icon_state = "gate_OWB_on"
	light_range = 2
	light_color = "#75fcfc"

// 52x32 base.
/obj/structure/shieldwall/full
	name = "Full Parent Shield - DO NOT USE"
	icon = 'modular_badlands/code/modules/techno_jacks/icons/Fields52x32.dmi'
	icon_state = "gate_full_off"
	pixel_x = -10
// Until we move into pixel movement, ignore the below bounds.
//	bound_width = 52
//	bound_height = 32

/obj/structure/shieldwall/full/active_stun
	name = "shieldwall"
	icon_state = "gate_full_yellow"
	lethal = FALSE
	light_range = 3
	light_color = "#e8e889"

/obj/structure/shieldwall/full/active_stun/left
	icon_state = "gate_left_yellow"

/obj/structure/shieldwall/full/active_stun/right
	icon_state = "gate_right_yellow"

/obj/structure/shieldwall/full/active_lethal
	name = "shieldwall"
	icon_state = "gate_full_red"
	light_range = 4
	light_color = "#8a0303"

/obj/structure/shieldwall/full/active_lethal/left
	icon_state = "gate_left_red"

/obj/structure/shieldwall/full/active_lethal/right
	icon_state = "gate_right_red"

// 64x32 base.
/obj/structure/shieldwall/large
	name = "Large Parent Shield - DO NOT USE"
	icon = 'modular_badlands/code/modules/techno_jacks/icons/Fields64x32.dmi'
	icon_state = "large_gate_off"
	bound_width = 64
	bound_height = 32

/obj/structure/shieldwall/large/active
	name = "shieldwall"
	icon_state = "large_gate_on"
	light_range = 6
	light_color = "#75fcfc"
	lethal = FALSE

/*
The projectors, for the shields that don't have them attached.
*/
/obj/structure/badlands_props/shieldwall_shield_projector
	name = "shield projector"
	desc = "The machine is on, but you aren't sure you know how to interact with this."
	light_range = 2
	icon = 'modular_badlands/code/modules/techno_jacks/icons/Fields32x32.dmi'
	icon_state = "ERROR"// DON'T USE THIS
	anchored = TRUE
	density = FALSE

/obj/structure/badlands_props/shieldwall_shield_projector/left
	icon_state = "gate_deco_left"

/obj/structure/badlands_props/shieldwall_shield_projector/right
	icon_state = "gate_deco_right"
