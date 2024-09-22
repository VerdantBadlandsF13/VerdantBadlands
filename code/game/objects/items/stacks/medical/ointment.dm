/obj/item/stack/medical/ointment
	name = "ointment"
	desc = "Basic burn ointment, rated effective for second degree burns with proper bandaging. Not very effective at treating infection, but better than nothing. USE WITH A BANDAGE."
	gender = PLURAL
	singular_name = "ointment"
	icon_state = "ointment"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	amount = 12
	max_amount = 12
	self_delay = 40
	other_delay = 20
	merge_type = /obj/item/stack/medical/ointment

	heal_burn = 5
	pain_amount = 24
	pain_burn = TRUE
	flesh_regeneration = 7
	sanitization = 2
	grind_results = list(/datum/reagent/medicine/kelotane = 10)

/obj/item/stack/medical/ointment/five
	amount = 5

/obj/item/stack/medical/ointment/twelve
	amount = 12

/obj/item/stack/medical/ointment/heal(mob/living/M, mob/user)
	if(M.stat == DEAD)
		to_chat(user, "<span class='warning'>[M] is dead! You can not help [M.p_them()].</span>")
		return
	if(iscarbon(M))
		return heal_carbon(M, user, heal_brute, heal_burn)
	to_chat(user, "<span class='warning'>You can't heal [M] with \the [src]!</span>")

/obj/item/stack/medical/ointment/suicide_act(mob/living/user)
	user.visible_message("<span class='suicide'>[user] is squeezing \the [src] into [user.p_their()] mouth! [user.p_do(TRUE)]n't [user.p_they()] know that stuff is toxic?</span>")
	return TOXLOSS
