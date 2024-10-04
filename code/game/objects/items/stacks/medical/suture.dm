/obj/item/stack/medical/suture
	name = "suture"
	desc = "Basic sterile sutures used to seal up cuts and lacerations and stop bleeding."
	gender = PLURAL
	singular_name = "suture"
	icon_state = "suture"
	self_delay = 30
	other_delay = 10
	amount = 15
	max_amount = 15
	repeating = TRUE
	heal_brute = 10
	stop_bleeding = 2
	grind_results = list(/datum/reagent/medicine/spaceacillin = 2)
	merge_type = /obj/item/stack/medical/suture

	pain_amount = 32

/obj/item/stack/medical/suture/one
	amount = 1

/obj/item/stack/medical/suture/five
	amount = 5

/obj/item/stack/medical/suture/emergency
	name = "improvised suture"
	icon_state = "suture_imp"
	desc = "A set of improvised sutures consisting of clothing thread and a sewing needle, not very good at repairing damage, but still decent at stopping bleeding."
	heal_brute = 5
	amount = 5
	max_amount = 15
	stop_bleeding = 1
	merge_type = /obj/item/stack/medical/suture/emergency

/obj/item/stack/medical/suture/emergency/five
	amount = 5

/obj/item/stack/medical/suture/emergency/ten
	amount = 10

/obj/item/stack/medical/suture/emergency/fifteen
	amount = 15

/obj/item/stack/medical/suture/medicated
	name = "medicated suture"
	icon_state = "suture_purp"
	desc = "A suture infused with drugs that speed up wound healing of the treated laceration."
	heal_brute = 15
	stop_bleeding = 8
	grind_results = list(/datum/reagent/medicine/polypyr = 2)
	merge_type = /obj/item/stack/medical/suture/medicated

/obj/item/stack/medical/suture/medicated/five
	amount = 5

/obj/item/stack/medical/suture/medicated/ten
	amount = 10

/obj/item/stack/medical/suture/medicated/fifteen
	amount = 15

/obj/item/stack/medical/suture/heal(mob/living/M, mob/user)
	. = ..()
	if(M.stat == DEAD)
		to_chat(user, "<span class='warning'>[M] is dead! You can not help [M.p_them()].</span>")
		return
	if(iscarbon(M))
		return heal_carbon(M, user, heal_brute, 0)
	if(isanimal(M))
		var/mob/living/simple_animal/critter = M
		if (!(critter.healable))
			to_chat(user, "<span class='warning'>You cannot use \the [src] on [M]!</span>")
			return FALSE
		else if (critter.health == critter.maxHealth)
			to_chat(user, "<span class='notice'>[M] is at full health.</span>")
			return FALSE
		user.visible_message("<span class='green'>[user] applies \the [src] on [M].</span>", "<span class='green'>You apply \the [src] on [M].</span>")
		M.heal_bodypart_damage(heal_brute)
		return TRUE
	to_chat(user, "<span class='warning'>You can't heal [M] with \the [src]!</span>")
