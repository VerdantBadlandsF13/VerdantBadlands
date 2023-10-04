/*
Pulled from one of the old Russian servers.
Can't recall the name, but all credit to them.
All I've done is make small adjustments to fit our server, and to clean it up a bit. - Carl
*/
/obj/item/stock_parts/cell_pa
	name = "Fusion core"
	desc = "An old-world power cell, typically used in industrial settings."
	icon = 'modular_badlands/code/modules/power_armor/icons/cell.dmi'
	icon_state = "pa_cell"
	item_state = "cell"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	force = 5
	throwforce = 5
	throw_speed = 2
	throw_range = 5
	w_class = WEIGHT_CLASS_SMALL
	var/charge = 0	// note %age conveted to actual charge in New
	var/maxcharge = 1000
	var/rigged = 0		// true if rigged to explode
	var/chargerate = 1 //how much power is given every tick if self-charging
	var/bcell = null
	var/self_recharge = 0 //does it self recharge, or not?

/obj/item/stock_parts/cell_pa/New()
	. = ..()
	bcell = src
	START_PROCESSING(SSobj, src)
	charge = maxcharge
	update_cell_icon()

/obj/item/stock_parts/cell_pa/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/stock_parts/cell_pa/vv_edit_var(var_name, var_value)
	switch(var_name)
		if("self_recharge")
			if(var_value)
				START_PROCESSING(SSobj, src)
			else
				STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/stock_parts/cell_pa/process()
	if(self_recharge)
		give(chargerate * 0.25)
	else
		return PROCESS_KILL

/obj/item/stock_parts/cell_pa/proc/update_cell_icon()
	cut_overlays()
	if(charge < 0.01)
		return
	else if(charge/maxcharge >=0.995)
		add_overlay(image('icons/obj/power.dmi', "pa_cell-o2"))
	else
		add_overlay(image('icons/obj/power.dmi', "pa_cell-o1"))

/obj/item/stock_parts/cell_pa/proc/percent()		// return % charge of cell
	return 100*charge/maxcharge

// use power from a cell
/obj/item/stock_parts/cell_pa/proc/using(amount)
	if(rigged && amount > 0)
		explode()
		return 0
	if(charge < amount)
		return 0
	charge = (charge - amount)
	return 1

// recharge the cell
/obj/item/stock_parts/cell_pa/proc/give(amount)
	if(rigged && amount > 0)
		explode()
		return 0
	if(maxcharge < amount)
		amount = maxcharge
	var/power_used = min(maxcharge-charge,amount)
	charge += power_used
	return power_used

/obj/item/stock_parts/cell_pa/examine(mob/user)
	. = ..()
	. += "Indicator shows: [round(src.percent() )]%. <br>\
	This has a rating for an internal power level of [maxcharge]."
	if(rigged)
		. += "<span class='danger'>This power cell seems to be dripping some sort of fluid!</span>"

/obj/item/stock_parts/cell_pa/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is licking the electrodes of [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return (FIRELOSS)

/obj/item/stock_parts/cell_pa/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(istype(W, /obj/item/reagent_containers/syringe))
		var/obj/item/reagent_containers/syringe/S = W
		to_chat(user, "<span class='notice'>You inject the solution into the fusion core.</span>")
		if(S.reagents.has_reagent(/datum/reagent/fuel, 5))
			rigged = 1
		S.reagents.clear_reagents()


/obj/item/stock_parts/cell_pa/proc/explode()
	var/turf/T = get_turf(src.loc)
/*
 * 1000-cell	explosion(T, -1, 0, 1, 1)
 * 2500-cell	explosion(T, -1, 0, 1, 1)
 * 10000-cell	explosion(T, -1, 1, 3, 3)
 * 15000-cell	explosion(T, -1, 2, 4, 4)
 * */
	if (charge==0)
		return
	var/devastation_range = -1 //round(charge/11000)
	var/heavy_impact_range = round(sqrt(charge)/60)
	var/light_impact_range = round(sqrt(charge)/30)
	var/flash_range = light_impact_range
	if (light_impact_range==0)
		rigged = 0
		corrupt()
		return
	//explosion(T, 0, 1, 2, 2)
	explosion(T, devastation_range, heavy_impact_range, light_impact_range, flash_range)
	qdel(src)

/obj/item/stock_parts/cell_pa/proc/corrupt()
	charge /= 2
	maxcharge = max(maxcharge/2, chargerate)
	if (prob(10))
		rigged = 1 //broken batterys are dangerous

/obj/item/stock_parts/cell_pa/emp_act(severity)
	charge -= 1000 / severity
	if (charge < 0)
		charge = 0
	..()

/obj/item/stock_parts/cell_pa/ex_act(severity, target)
	. = ..()
	if(!QDELETED(src))
		switch(severity)
			if(2)
				if(prob(50))
					corrupt()
			if(3)
				if(prob(25))
					corrupt()


/obj/item/stock_parts/cell_pa/blob_act(obj/structure/blob/B)
	ex_act(1)

/obj/item/stock_parts/cell_pa/proc/get_electrocute_damage()
	if(charge >= 1000)
		return CLAMP(round(charge/10000), 10, 90) + rand(-5,5)
	else
		return 0

/obj/item/stock_parts/cell_pa/default
	name = "damaged fusion core"
	maxcharge = 3500
	rating = 2

/obj/item/stock_parts/cell_pa/default/empty/New()
	. = ..()
	charge = 0

/obj/item/stock_parts/cell_pa/high
	name = "fusion core"
	maxcharge = 4500
	rating = 3

/obj/item/stock_parts/cell_pa/high/empty/New()
	. = ..()
	charge = 0

/obj/item/stock_parts/cell_pa/admin/self_recharge
	name = "pristine fusion core"
	maxcharge = 350000
	self_recharge = 1
	rating = 4

/obj/item/stock_parts/cell_pa/admin
	name = "AHELP IF YOU SEE ME"
	maxcharge = 350000
	rating = 4
