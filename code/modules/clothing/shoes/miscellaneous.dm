/obj/item/clothing/shoes/proc/step_action() //this was made to rewrite clown shoes squeaking
	SEND_SIGNAL(src, COMSIG_SHOES_STEP_ACTION)

/obj/item/clothing/shoes/sandal
	desc = "A pair of rather plain wooden sandals."
	name = "sandals"
	icon_state = "wizard"
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 0.5)
	strip_delay = 50
	equip_delay_other = 50
	permeability_coefficient = 0.9
	can_be_tied = FALSE

/obj/item/clothing/shoes/sandal/magic
	name = "magical sandals"
	desc = "A pair of sandals imbued with magic."
	resistance_flags = FIRE_PROOF |  ACID_PROOF

/obj/item/clothing/shoes/galoshes
	desc = "A pair of yellow rubber boots, designed to prevent slipping on wet surfaces."
	name = "galoshes"
	icon_state = "galoshes"
	permeability_coefficient = 0.01
	clothing_flags = NOSLIP
	strip_delay = 50
	equip_delay_other = 50
	resistance_flags = NONE
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 40, "acid" = 75)
	custom_price = PRICE_ABOVE_EXPENSIVE
	can_be_tied = FALSE

/obj/item/clothing/shoes/galoshes/dry
	name = "absorbent galoshes"
	desc = "A pair of orange rubber boots, designed to prevent slipping on wet surfaces while also drying them."
	icon_state = "galoshes_dry"

/obj/item/clothing/shoes/galoshes/dry/step_action()
	var/turf/open/t_loc = get_turf(src)
	SEND_SIGNAL(t_loc, COMSIG_TURF_MAKE_DRY, TURF_WET_WATER, TRUE, INFINITY)

/obj/item/clothing/shoes/winterboots
	name = "winter boots"
	desc = "Boots lined with 'synthetic' animal fur."
	icon_state = "winterboots"
	permeability_coefficient = 0.15
	cold_protection = FEET|LEGS
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	heat_protection = FEET|LEGS
	max_heat_protection_temperature = SHOES_MAX_TEMP_PROTECT
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes
	lace_time = 8 SECONDS

/obj/item/clothing/shoes/winterboots/ice_boots
	name = "ice hiking boots"
	desc = "A pair of winter boots with special grips on the bottom, designed to prevent slipping on frozen surfaces."
	icon_state = "iceboots"
	item_state = "iceboots"
	clothing_flags = NOSLIP_ICE

/obj/item/clothing/shoes/cult
	name = "\improper Nar'Sien invoker boots"
	desc = "A pair of boots worn by the followers of Nar'Sie."
	icon_state = "cult"
	cold_protection = FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	heat_protection = FEET
	max_heat_protection_temperature = SHOES_MAX_TEMP_PROTECT
	lace_time = 10 SECONDS

/obj/item/clothing/shoes/cult/alt
	name = "cultist boots"
	icon_state = "cultalt"

/obj/item/clothing/shoes/cult/alt/ghost
	item_flags = DROPDEL

/obj/item/clothing/shoes/cult/alt/ghost/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CULT_TRAIT)

// kevin is into feet
/obj/item/clothing/shoes/wraps
	name = "gilded leg wraps"
	desc = "Ankle coverings. These ones have a golden design."
	icon_state = "gildedcuffs"
	can_be_tied = FALSE
	strip_delay = 50
	equip_delay_other = 50
	resistance_flags = NONE
	permeability_coefficient = 0.05 //Thick soles, and covers the ankle
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes
	lace_time = 12 SECONDS

/obj/item/clothing/shoes/wraps/silver
	name = "silver leg wraps"
	desc = "Ankle coverings. Not made of real silver."
	icon_state = "silvergildedcuffs"
	can_be_tied = FALSE
	strip_delay = 50
	equip_delay_other = 50
	resistance_flags = NONE
	permeability_coefficient = 0.05 //Thick soles, and covers the ankle
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes
	lace_time = 12 SECONDS

/obj/item/clothing/shoes/wraps/red
	name = "red leg wraps"
	desc = "Ankle coverings. Show off your style with these shiny red ones!"
	icon_state = "redcuffs"
	can_be_tied = FALSE
	strip_delay = 50
	equip_delay_other = 50
	resistance_flags = NONE
	permeability_coefficient = 0.05 //Thick soles, and covers the ankle
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes
	lace_time = 12 SECONDS

/obj/item/clothing/shoes/wraps/blue
	name = "blue leg wraps"
	desc = "Ankle coverings. Hang ten, brother."
	icon_state = "bluecuffs"
	can_be_tied = FALSE
	strip_delay = 50
	equip_delay_other = 50
	resistance_flags = NONE
	permeability_coefficient = 0.05 //Thick soles, and covers the ankle
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes
	lace_time = 12 SECONDS

/obj/item/clothing/shoes/wallwalkers
	name = "wall walking boots"
	desc = "Contrary to popular belief, these do not allow you to walk on walls. Through bluespace magic stolen from an organisation that hoards technology, they simply allow you to slip through the atoms that make up anything, but only while walking, for safety reasons. As well as this, they unfortunately cause minor breath loss as the majority of atoms in your lungs are sucked out into any solid object you walk through. Make sure not to overuse them."
	icon_state = "walkboots"
	var/walkcool = 0
	var/wallcharges = 4
	var/newlocobject = null

/obj/item/clothing/shoes/wallwalkers/equipped(mob/user,slot)
	. = ..()
	if(slot == SLOT_SHOES)
		RegisterSignal(user, COMSIG_MOB_CLIENT_PRE_MOVE,PROC_REF(intercept_user_move))

/obj/item/clothing/shoes/wallwalkers/dropped(mob/user)
	. = ..()
	UnregisterSignal(user, COMSIG_MOB_CLIENT_PRE_MOVE)

/obj/item/clothing/shoes/wallwalkers/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(!istype(W, /obj/item/bluespacerecharge))
		return
	var/obj/item/bluespacerecharge/ER = W
	if(ER.uses)
		wallcharges += ER.uses
		to_chat(user, "<span class='notice'>You charged the bluespace crystal in the [src]. It now has [wallcharges] charges left.</span>")
		ER.uses = 0
		ER.icon_state = "[initial(ER.icon_state)]0"
	else
		to_chat(user, "<span class='warning'>[ER] has no crystal on it.</span>")

/obj/item/clothing/shoes/wallwalkers/examine(mob/user)
	. = ..()
	. += "<span class='warning'>It has [wallcharges] charges left.</span>"

/obj/item/clothing/shoes/wallwalkers/proc/intercept_user_move(mob/living/m, client/client, dir, newloc, oldloc)
	if (walkcool >= world.time || m.m_intent != MOVE_INTENT_WALK || wallcharges <= 0)
		return
	walkcool = world.time + m.movement_delay()
	var/issolid = FALSE
	var/turf/K = newloc
	if (istype(K))
		if (K.density)
			issolid = TRUE
	if (!issolid)
		for (var/atom/T in newloc) //stuff on the new turf
			if (!T.CanPass(m, dir) && T != m)
				issolid = TRUE
				newlocobject = T
				break
		if (!issolid)
			for (var/atom/T in oldloc) //directional shit on the old turf
				if (!T.CanPass(m, dir) && T != m && T != newlocobject)
					issolid = TRUE
					break
			newlocobject = null //stopping structures from using two charges because of how shitty the canpass code is
	m.forceMove(newloc)
	if (!issolid)
		return
	m.adjustOxyLoss(rand(5,13))
	if (prob(15))
		m.adjustBruteLoss(rand(4,7))
		to_chat(m,"<span class='warning'>You feel as if travelling through the solid object left something behind and it hurts!</span>")
	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	s.set_up(5, 1, oldloc)
	s.start()
	flash_lighting_fx(3, 3, LIGHT_COLOR_ORANGE)
	wallcharges--

/obj/item/bluespacerecharge
	name = "bluespace crystal recharging device"
	desc = "A small cell with two prongs lazily jabbed into it. It looks like it's made for replacing the crystals in bluespace devices."
	icon = 'icons/obj/module.dmi'
	icon_state = "bluespace_charge"
	item_flags = NOBLUDGEON
	w_class = WEIGHT_CLASS_TINY
	var/uses = 6

/obj/item/bluespacerecharge/examine(mob/user)
	. = ..()
	if(uses)
		. += "<span class='notice'>It can add up to [uses] charges to compatible devices.</span>"
	else
		. += "<span class='warning'>The crystal is gone.</span>"

/obj/item/bluespacerecharge/attackby(obj/item/I, mob/user, params)
	..()
	if(!istype(I, /obj/item/stack/ore/bluespace_crystal) || uses)
		return
	var/obj/item/stack/ore/bluespace_crystal/B = I
	if (B.amount < 10)
		return
	uses += 3
	to_chat(user, "<span class='notice'>You insert [I] into [src].</span>")
	B.use(10)
	icon_state = initial(icon_state)
