//Fallout 13 barrels directory

/obj/structure/reagent_dispensers/barrel
	name = "barrel"
	desc = "An ancient metal barrel. The material used to make it is starting to decay from time. Is this safe?"
	icon = 'icons/fallout/trash.dmi'
	icon_state = "single_dark"
	tank_volume = 500
	density = TRUE
	anchored = TRUE
	reagent_id = /datum/reagent/water/dwater

/obj/structure/reagent_dispensers/barrel/two
	name = "two old barrels"
	icon_state = "two_c"
	tank_volume = 1000

/obj/structure/reagent_dispensers/barrel/three
	name = "three old barrels"
	icon_state = "three_c"
	tank_volume = 1500

/obj/structure/reagent_dispensers/barrel/four
	name = "four old barrels"
	icon_state = "four_c"
	tank_volume = 2000

/obj/structure/reagent_dispensers/barrel/dangerous
	name = "waste barrel"
	icon_state = "single_dark_fev"
	tank_volume = 500
	reagent_id = /datum/reagent/toxin/FEV_solution/two
	light_color = LIGHT_COLOR_GREEN
	light_power = 3
	light_range = 2

/obj/structure/reagent_dispensers/barrel/dangerous/Initialize()
	. = ..()
	icon_state = "single_dark_fev[rand(0,1)]"
	START_PROCESSING(SSradiation,src)

/obj/structure/reagent_dispensers/barrel/dangerous/Destroy()
	STOP_PROCESSING(SSradiation,src)
	return ..()

//Bing bang boom done
/obj/structure/reagent_dispensers/barrel/dangerous/process()
	if(QDELETED(src))
		return PROCESS_KILL

	if(!z || !SSmobs.clients_by_zlevel[z].len) // we don't care about irradiating if no one is around to see it!
		return

	for(var/mob/living/carbon/human/victim in view(src,1))
		if(istype(victim) && victim.stat != DEAD)
			victim.rad_act(5)
	for(var/obj/item/geiger_counter/geiger in view(src,1))
		if(istype(geiger))
			geiger.rad_act(5)

/obj/structure/reagent_dispensers/barrel/boom()
	visible_message("<span class='danger'>\The [src] ruptures!</span>")
	chem_splash(loc, 0, list(reagents))
	qdel(src)

/obj/structure/reagent_dispensers/barrel/explosive
	name = "fuel barrel"
	icon_state = "single_dark_explosive"
	tank_volume = 500
	reagent_id = /datum/reagent/fuel
//	self_weight = 200

/obj/structure/reagent_dispensers/barrel/explosive/boom()
	explosion(get_turf(src), 0, 1, tank_volume/200, flame_range = tank_volume/200)
	qdel(src)

/obj/structure/reagent_dispensers/barrel/explosive/blob_act(obj/structure/blob/B)
	boom()

/obj/structure/reagent_dispensers/barrel/explosive/ex_act()
	boom()

/obj/structure/reagent_dispensers/barrel/explosive/fire_act(exposed_temperature, exposed_volume)
	boom()

/obj/structure/reagent_dispensers/barrel/explosive/bullet_act(obj/item/projectile/P)
	..()
	if(!QDELETED(src)) //wasn't deleted by the projectile's effects.
		if(!P.nodamage && ((P.damage_type == BURN) || (P.damage_type == BRUTE)))
			var/boom_message = "[ADMIN_LOOKUPFLW(P.firer)] triggered a fueltank explosion via projectile."
			GLOB.bombers += boom_message
			message_admins(boom_message)
			var/log_message = "triggered a fueltank explosion via projectile."
			P.firer.log_message(log_message, INDIVIDUAL_ATTACK_LOG)
			log_attack("[key_name(P.firer)] [log_message]")
			boom()

/obj/structure/reagent_dispensers/barrel/explosive/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/weldingtool))
		if(!reagents.has_reagent(/datum/reagent/fuel))
			to_chat(user, "<span class='warning'>[src] is out of fuel!</span>")
			return
		var/obj/item/weldingtool/W = I
		if(!W.welding)
			if(W.reagents.has_reagent(/datum/reagent/fuel, W.max_fuel))
				to_chat(user, "<span class='warning'>Your [W.name] is already full!</span>")
				return
			reagents.trans_to(W, W.max_fuel)
			user.visible_message("<span class='notice'>[user] refills [user.p_their()] [W.name].</span>", "<span class='notice'>You refill [W].</span>")
			playsound(src, 'sound/effects/refill.ogg', 50, 1)
			W.update_icon()
		else
			var/turf/T = get_turf(src)
			user.visible_message("<span class='warning'>[user] catastrophically fails at refilling [user.p_their()] [W.name]!</span>", "<span class='userdanger'>That was stupid of you.</span>")
			var/message_admins = "[ADMIN_LOOKUPFLW(user)] triggered a fuelbarrel explosion via welding tool at [ADMIN_VERBOSEJMP(T)]."
			GLOB.bombers += message_admins
			message_admins(message_admins)
			var/message_log = "triggered a fuelbarrel explosion via welding tool at [AREACOORD(T)]."
			user.log_message(message_log, INDIVIDUAL_ATTACK_LOG)
			log_game("[key_name(user)] [message_log]")
			log_attack("[key_name(user)] [message_log]")
			boom()
		return
	return ..()

/obj/structure/destructible/hobo_barrel
	name = "barrel"
	desc = "An ancient metal barrel, repurposed as a firepit."
	icon = 'icons/fallout/trash.dmi'
	icon_state = "single_rusted"
	density = TRUE
	anchored = TRUE
	light_color = LIGHT_COLOR_FIRE
	light_power = 1
	light_range = 0
	break_sound = 'modular_badlands/code/modules/rp_misc/sound/gore/nonorganic_impact/bash1.ogg'
	debris = list(/obj/item/stack/sheet/metal = 2)
	var/burning = FALSE
	var/flickering = FALSE
	var/flicker_chance = 1 // percent

/obj/structure/destructible/hobo_barrel/update_icon()
	icon_state = "single_rusted_[burning ? null : "un"]lit"

/obj/structure/destructible/hobo_barrel/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(burning)
		user.visible_message("<span class='notice'>[user] snuffs [src] out.</span>", "<span class='notice'>You snuff [src] out.</span>")
		burning = FALSE
		playsound(src, "modular_badlands/code/modules/rp_misc/sound/fire_related/fire0[rand(1,3)].ogg", 50, 1)
		update_icon()
		set_light(0)
		return
	if(!burning)
		return

/obj/structure/destructible/hobo_barrel/attackby(obj/item/W, mob/user, params)
	if(W.get_temperature())
		StartBurning()
		user.visible_message("<span class='notice'>[user] lights [src] with [W].</span>", "<span class='notice'>You light [src] with [W].</span>")
		return

/obj/structure/destructible/hobo_barrel/proc/StartBurning()
	if(!burning)
		burning = TRUE
		set_light(7)
		update_icon()
		return

/obj/structure/destructible/hobo_barrel/process()
	. = ..()
	if(!flickering && prob(flicker_chance))
		flicker(rand(1, 4)) // 0.1 to 0.4 seconds

/obj/structure/destructible/hobo_barrel/proc/flicker(duration)
	addtimer(CALLBACK(src, .proc/unflicker, light_range), duration)
	set_light(light_range - rand(1, 2))
	flickering = TRUE
	addtimer(CALLBACK(src, .proc/unflicker), duration)

/obj/structure/destructible/hobo_barrel/proc/unflicker(new_range)
	set_light(new_range)
	flickering = FALSE

/obj/structure/destructible/hobo_barrel/fire_act(exposed_temperature, exposed_volume)
	StartBurning()

/obj/structure/destructible/hobo_barrel/lit//Barrel for mapping. :)
	burning = TRUE
	icon_state = "single_rusted_lit"
	light_range = 7
