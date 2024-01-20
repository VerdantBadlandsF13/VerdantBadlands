/*
Intended for disabled quirks of the respective type.
Only here for sorting, until I rework the system entirely. - Carl
*/
/datum/quirk/paraplegic
	name = "Paraplegic"
	desc = "Your legs do not function. Nothing will ever fix this. Luckily you found a wheelchair."
	value = -3
	mob_trait = TRAIT_PARA
	human_only = TRUE
	gain_text = null // Handled by trauma.
	lose_text = null
	medical_record_text = "Patient has an untreatable impairment in motor function in the lower extremities."
	locked = TRUE

/datum/quirk/paraplegic/add()
	var/datum/brain_trauma/severe/paralysis/paraplegic/T = new()
	var/mob/living/carbon/human/H = quirk_holder
	H.gain_trauma(T, TRAUMA_RESILIENCE_ABSOLUTE)

/datum/quirk/paraplegic/on_spawn()
	if(quirk_holder.client)
		var/modified_limbs = quirk_holder.client.prefs.modified_limbs
		if(!(modified_limbs[BODY_ZONE_L_LEG] == LOADOUT_LIMB_AMPUTATED && modified_limbs[BODY_ZONE_R_LEG] == LOADOUT_LIMB_AMPUTATED && !isjellyperson(quirk_holder)))
			if(quirk_holder.buckled) // Handle late joins being buckled to arrival shuttle chairs.
				quirk_holder.buckled.unbuckle_mob(quirk_holder)

			var/turf/T = get_turf(quirk_holder)
			var/obj/structure/chair/spawn_chair = locate() in T

			var/obj/vehicle/ridden/wheelchair/wheels = new(T)
			if(spawn_chair) // Makes spawning on the arrivals shuttle more consistent looking
				wheels.setDir(spawn_chair.dir)

			wheels.buckle_mob(quirk_holder)

			// During the spawning process, they may have dropped what they were holding, due to the paralysis
			// So put the things back in their hands.

			for(var/obj/item/I in T)
				if(I.fingerprintslast == quirk_holder.ckey)
					quirk_holder.put_in_hands(I)

/datum/quirk/poor_aim
	name = "Poor Aim"
	desc = "You're terrible with guns and can't line up a straight shot to save your life. Dual-wielding is right out."
	value = -1
	mob_trait = TRAIT_POOR_AIM
	medical_record_text = "Patient possesses a strong tremor in both hands."
	locked = TRUE

/datum/quirk/no_smell
	name = "Anosmia"
	desc = "You can't smell anything! You won't be able to detect certain colorless gases."
	value = -1
	mob_trait = TRAIT_ANOSMIA
	gain_text = "<span class='notice'>You can't smell anything!</span>"
	lose_text = "<span class='notice'>You can smell again!</span>"
	medical_record_text = "Patient suffers from anosmia and is incapable of smelling gases or particulates."
	locked = TRUE

/datum/quirk/cursed
	name = "Cursed"
	desc = "You've been cursed, to put it bluntly. Your time in this world is running short, with nothing you can do to change that."
	value = -6
	gain_text = "<span class='danger'>What a waste of a life.</span>"
	lose_text = "<span class='notice'>You feel as if the gods have granted you a second chance. Use it.</span>"
	medical_record_text = "Patient displays signs of distress when they feel no one is looking."
	locked = TRUE

/datum/quirk/cursed/post_add()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	H.apply_necropolis_curse_quirk()
