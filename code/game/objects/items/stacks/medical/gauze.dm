/obj/item/stack/medical/gauze
	name = "medical gauze"
	desc = "A roll of elastic cloth. Use it to staunch and heal bleeding and burns, and treat infection."
	gender = PLURAL
	singular_name = "medical gauze"
	icon_state = "gauze"
	heal_brute = 5
	self_delay = 50
	other_delay = 20
	amount = 10
	max_amount = 10
	absorption_rate = 0.45
	absorption_capacity = 10
	splint_factor = 0.35
	custom_price = PRICE_REALLY_CHEAP
	grind_results = list(/datum/reagent/cellulose = 2)
	merge_type = /obj/item/stack/medical/gauze

// gauze is only relevant for wounds, which are handled in the wounds themselves
/obj/item/stack/medical/gauze/try_heal(mob/living/M, mob/user, silent)
	var/obj/item/bodypart/limb = M.get_bodypart(check_zone(user.zone_selected))
	if(!limb)
		to_chat(user, "<span class='notice'>There's nothing there to bandage!</span>")
		return
	if(!LAZYLEN(limb.wounds))
		to_chat(user, "<span class='notice'>There's no wounds that require bandaging on [user==M ? "your" : "[M]'s"] [limb.name]!</span>") // good problem to have imo
		return

	var/gauzeable_wound = FALSE
	for(var/i in limb.wounds)
		var/datum/wound/woundies = i
		if(woundies.wound_flags & ACCEPTS_GAUZE)
			gauzeable_wound = TRUE
			break
	if(!gauzeable_wound)
		to_chat(user, "<span class='notice'>There's no wounds that require bandaging on [user==M ? "your" : "[M]'s"] [limb.name]!</span>") // good problem to have imo
		return

	if(limb.current_gauze && (limb.current_gauze.absorption_capacity * 0.8 > absorption_capacity)) // ignore if our new wrap is < 20% better than the current one, so someone doesn't bandage it 5 times in a row
		to_chat(user, "<span class='warning'>The bandage currently on [user==M ? "your" : "[M]'s"] [limb.name] is still in good condition!</span>")
		return

	user.visible_message("<span class='warning'>[user] begins wrapping the wounds on [M]'s [limb.name] with [src]...</span>", "<span class='warning'>You begin wrapping the wounds on [user == M ? "your" : "[M]'s"] [limb.name] with [src]...</span>")

	if(!do_after(user, (user == M ? self_delay : other_delay), target=M))
		return

	user.visible_message("<span class='green'>[user] applies [src] to [M]'s [limb.name].</span>", "<span class='green'>You bandage the wounds on [user == M ? "yourself" : "[M]'s"] [limb.name].</span>")
	limb.apply_gauze(src)

/obj/item/stack/medical/gauze/attackby(obj/item/I, mob/user, params)
	if(I.tool_behaviour == TOOL_WIRECUTTER || I.get_sharpness())
		if(get_amount() < 2)
			to_chat(user, "<span class='warning'>You need at least two gauzes to do this!</span>")
			return
		new /obj/item/stack/sheet/cloth(user.drop_location())
		user.visible_message("[user] cuts [src] into pieces of cloth with [I].", \
					"<span class='notice'>You cut [src] into pieces of cloth with [I].</span>", \
					"<span class='italics'>You hear cutting.</span>")
		use(2)
	else if(I.is_drainable() && I.reagents.has_reagent(/datum/reagent/abraxo_cleaner/sterilizine))
		if(!I.reagents.has_reagent(/datum/reagent/abraxo_cleaner/sterilizine, 10))
			to_chat(user, "<span class='warning'>There's not enough sterilizine in [I] to sterilize [src]!</span>")
			return
		user.visible_message("<span class='notice'>[user] pours the contents of [I] onto [src], sterilizing it.</span>", "<span class='notice'>You pour the contents of [I] onto [src], sterilizing it.</span>")
		I.reagents.remove_reagent(/datum/reagent/abraxo_cleaner/sterilizine, 10)
		new /obj/item/stack/medical/gauze/adv/one(user.drop_location())
		use(1)
	else
		return ..()

/obj/item/stack/medical/gauze/suicide_act(mob/living/user)
	user.visible_message("<span class='suicide'>[user] begins tightening \the [src] around [user.p_their()] neck! It looks like [user.p_they()] forgot how to use medical supplies!</span>")
	return OXYLOSS

/obj/item/stack/medical/gauze/improvised
	name = "improvised gauze"
	singular_name = "improvised gauze"
	heal_brute = 0
	desc = "A roll of cloth. Useful for staunching bleeding."
	self_delay = 60
	other_delay = 30
	absorption_rate = 0.15
	absorption_capacity = 4
	merge_type = /obj/item/stack/medical/gauze/improvised

/obj/item/stack/medical/gauze/improvised/five
	amount = 5

/obj/item/stack/medical/gauze/improvised/microwave_act(obj/machinery/microwave/MW)
	..()
	new /obj/item/stack/medical/gauze(drop_location(), amount)
	qdel(src)

/obj/item/stack/medical/gauze/adv
	name = "sterilized medical gauze"
	singular_name = "sterilized medical gauze"
	desc = "A roll of elastic sterilized cloth that is extremely effective at stopping bleeding and covering burns. "
	heal_brute = 6
	self_delay = 45
	other_delay = 15
	absorption_rate = 0.4
	absorption_capacity = 15
	merge_type = /obj/item/stack/medical/gauze/adv

/obj/item/stack/medical/gauze/adv/one
	amount = 1

/obj/item/stack/medical/gauze/cyborg
	custom_materials = null
	is_cyborg = 1
	cost = 250
	merge_type = /obj/item/stack/medical/gauze/cyborg
