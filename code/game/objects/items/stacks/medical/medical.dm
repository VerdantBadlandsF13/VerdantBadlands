/obj/item/stack/medical
	name = "medical pack"
	singular_name = "medical pack"
	icon = 'icons/obj/stack_objects.dmi'
	amount = 12
	max_amount = 12
	w_class = WEIGHT_CLASS_TINY
	full_w_class = WEIGHT_CLASS_TINY
	throw_speed = 3
	throw_range = 7
	resistance_flags = FLAMMABLE
	max_integrity = 40
	novariants = FALSE
	item_flags = NOBLUDGEON
	merge_type = /obj/item/stack/medical
	var/self_delay = 50
	var/other_delay = 0
	var/repeating = FALSE

	/// How much brute we heal per application
	var/heal_brute
	/// How much burn we heal per application
	var/heal_burn
	/// How much we reduce bleeding per application on cut wounds
	var/stop_bleeding
	/// How much sanitization to apply to burns on application
	var/sanitization
	/// How much we add to flesh_healing for burn wounds on application
	var/flesh_regeneration

	/// How much pain do we apply to the user?
	/// Thresholds are (1-10|11-90|91-INFINITY)
	var/pain_amount = 10
	/// Is this a burning pain?
	var/pain_burn = FALSE

/obj/item/stack/medical/attack(mob/living/M, mob/user)
	. = ..()
	INVOKE_ASYNC(src, PROC_REF(try_heal), M, user)

/obj/item/stack/medical/proc/try_heal(mob/living/M, mob/user, silent = FALSE)
	if(!M.can_inject(user, TRUE))
		return
	if(M == user)
		if(!silent)
			user.visible_message("<span class='notice'>[user] starts to apply \the [src] on [user.p_them()]self...</span>", "<span class='notice'>You begin applying \the [src] on yourself...</span>")
		if(!do_mob(user, M, self_delay, extra_checks=CALLBACK(M, TYPE_PROC_REF(/mob/living, can_inject), user, TRUE)))
			return
	else if(other_delay)
		if(!silent)
			user.visible_message("<span class='notice'>[user] starts to apply \the [src] on [M].</span>", "<span class='notice'>You begin applying \the [src] on [M]...</span>")
		if(!do_mob(user, M, other_delay, extra_checks=CALLBACK(M, TYPE_PROC_REF(/mob/living, can_inject), user, TRUE)))
			return

	if(heal(M, user))
		log_combat(user, M, "healed", src.name)
		use(1)
		if(repeating && amount > 0)
			try_heal(M, user, TRUE)


/obj/item/stack/medical/proc/heal(mob/living/M, mob/user)
	return

/obj/item/stack/medical/proc/heal_carbon(mob/living/carbon/C, mob/user, brute, burn)
	var/obj/item/bodypart/affecting = C.get_bodypart(check_zone(user.zone_selected))
	if(!affecting) //Missing limb?
		to_chat(user, "<span class='warning'>[C] doesn't have \a [parse_zone(user.zone_selected)]!</span>")
		return
	if(affecting.status == BODYPART_ORGANIC) //Limb must be organic to be healed - RR
		if(affecting.brute_dam && brute || affecting.burn_dam && burn)
			user.visible_message("<span class='green'>[user] applies \the [src] on [C]'s [affecting.name].</span>", "<span class='green'>You apply \the [src] on [C]'s [affecting.name].</span>")
			if(affecting.heal_damage(brute, burn))
				C.pain(affecting, amount += pain_amount, 1, pain_burn)
				C.pain_shock_stage += pain_amount
				C.update_damage_overlays()
			return TRUE
		to_chat(user, "<span class='notice'>[C]'s [affecting.name] can not be healed with \the [src].</span>")
		return
	to_chat(user, "<span class='notice'>\The [src] won't work on a robotic limb!</span>")

/obj/item/stack/medical/get_belt_overlay()
	return mutable_appearance('icons/obj/clothing/belt_overlays.dmi', "pouch")

///Override this proc for special post heal effects.
/obj/item/stack/medical/proc/post_heal_effects(amount_healed, mob/living/carbon/healed_mob, mob/user)
	return

