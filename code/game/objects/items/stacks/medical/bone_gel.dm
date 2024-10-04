/obj/item/stack/medical/bone_gel
	name = "bone gel"
	singular_name = "bone gel"
	desc = "A potent medical gel that, when applied to a damaged bone in a proper surgical setting, triggers an intense melding reaction to repair the wound. Can be directly applied alongside surgical sticky tape to a broken bone in dire circumstances, though this is very harmful to the patient and not recommended."

	icon = 'icons/obj/surgery.dmi'
	icon_state = "bone-gel"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'

	amount = 4
	self_delay = 20
	grind_results = list(/datum/reagent/medicine/bicaridine = 10)
	novariants = TRUE

	pain_amount = 91

/obj/item/stack/medical/bone_gel/attack(mob/living/M, mob/user)
	to_chat(user, "<span class='warning'>Bone gel can only be used on fractured limbs while aggressively holding someone!</span>")
	return

/obj/item/stack/medical/bone_gel/suicide_act(mob/user)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.visible_message("<span class='suicide'>[C] is squirting all of \the [src] into [C.p_their()] mouth! That's not proper procedure! It looks like [C.p_theyre()] trying to commit suicide!</span>")
		if(do_after(C, 2 SECONDS))
			C.emote("scream")
			for(var/i in C.bodyparts)
				var/obj/item/bodypart/bone = i
				var/datum/wound/blunt/severe/oof_ouch = new
				oof_ouch.apply_wound(bone)
				var/datum/wound/blunt/critical/oof_OUCH = new
				oof_OUCH.apply_wound(bone)

			for(var/i in C.bodyparts)
				var/obj/item/bodypart/bone = i
				bone.receive_damage(brute=60)
			use(1)
			return (BRUTELOSS)
		else
			C.visible_message("<span class='suicide'>[C] screws up like an idiot and still dies anyway!</span>")
			return (BRUTELOSS)

/obj/item/stack/medical/bone_gel/cyborg
	custom_materials = null
	is_cyborg = 1
	cost = 250
	merge_type = /obj/item/stack/medical/bone_gel/cyborg
