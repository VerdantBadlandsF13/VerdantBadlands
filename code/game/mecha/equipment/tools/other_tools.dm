//////////////////////////// ARMOR BOOSTER MODULES //////////////////////////////////////////////////////////


/obj/item/mecha_parts/mecha_equipment/anticcw_armor_booster //what is that noise? A BAWWW from TK mutants.
	name = "armor booster module (Close Combat Weaponry)"
	desc = "Boosts exosuit armor against armed melee attacks. Requires energy to operate."
	icon_state = "mecha_abooster_ccw"
	equip_cooldown = 0
	energy_drain = 125
	range = 0
//	var/deflect_coeff = 1.15
	var/damage_coeff = 0.7
	selectable = 0

/obj/item/mecha_parts/mecha_equipment/anticcw_armor_booster/proc/attack_react()
	if(action_checks(src))
		start_cooldown()
		return 1



/obj/item/mecha_parts/mecha_equipment/antiproj_armor_booster
	name = "armor booster module (Ranged Weaponry)"
	desc = "Boosts exosuit armor against ranged attacks. Completely blocks taser shots. Requires energy to operate."
	icon_state = "mecha_abooster_proj"
	equip_cooldown = 0
	energy_drain = 125
	range = 0
//	var/deflect_coeff = 1.15
	var/damage_coeff = 0.75
	selectable = 0

/obj/item/mecha_parts/mecha_equipment/antiproj_armor_booster/proc/projectile_react()
	if(action_checks(src))
		start_cooldown()
		return 1


////////////////////////////////// REPAIR DROID //////////////////////////////////////////////////


/obj/item/mecha_parts/mecha_equipment/repair_droid
	name = "exosuit repair droid"
	desc = "An automated repair droid for exosuits. Scans for damage and repairs it. Can fix almost all types of external or internal damage."
	icon_state = "repair_droid"
	energy_drain = 150
	range = 0
	var/health_boost = 2
	var/icon/droid_overlay
	var/list/repairable_damage = list(MECHA_INT_TEMP_CONTROL,MECHA_INT_TANK_BREACH)
	selectable = 0

/obj/item/mecha_parts/mecha_equipment/repair_droid/Destroy()
	STOP_PROCESSING(SSobj, src)
	if(chassis)
		chassis.cut_overlay(droid_overlay)
	return ..()

/obj/item/mecha_parts/mecha_equipment/repair_droid/attach(obj/mecha/M as obj)
	..()
	droid_overlay = new(src.icon, icon_state = "repair_droid")
	M.add_overlay(droid_overlay)

/obj/item/mecha_parts/mecha_equipment/repair_droid/detach()
	chassis.cut_overlay(droid_overlay)
	STOP_PROCESSING(SSobj, src)
	..()

/obj/item/mecha_parts/mecha_equipment/repair_droid/get_equip_info()
	if(!chassis)
		return
	return "<span style=\"color:[equip_ready?"#0f0":"#f00"];\">*</span>&nbsp; [src.name] - <a href='?src=[REF(src)];toggle_repairs=1'>[equip_ready?"A":"Dea"]ctivate</a>"


/obj/item/mecha_parts/mecha_equipment/repair_droid/Topic(href, href_list)
	..()
	if(href_list["toggle_repairs"])
		chassis.cut_overlay(droid_overlay)
		if(equip_ready)
			START_PROCESSING(SSobj, src)
			droid_overlay = new(src.icon, icon_state = "repair_droid_a")
			mecha_log_message("Activated.")
			set_ready_state(0)
		else
			STOP_PROCESSING(SSobj, src)
			droid_overlay = new(src.icon, icon_state = "repair_droid")
			mecha_log_message("Deactivated.")
			set_ready_state(1)
		chassis.add_overlay(droid_overlay)
		send_byjax(chassis.occupant,"exosuit.browser","[REF(src)]",src.get_equip_info())


/obj/item/mecha_parts/mecha_equipment/repair_droid/process()
	if(!chassis)
		STOP_PROCESSING(SSobj, src)
		set_ready_state(1)
		return
	var/h_boost = health_boost
	var/repaired = 0
	if(chassis.internal_damage & MECHA_INT_SHORT_CIRCUIT)
		h_boost *= -2
	else if(chassis.internal_damage && prob(15))
		for(var/int_dam_flag in repairable_damage)
			if(chassis.internal_damage & int_dam_flag)
				chassis.clearInternalDamage(int_dam_flag)
				repaired = 1
				break
	if(health_boost<0 || chassis.obj_integrity < chassis.max_integrity)
		chassis.obj_integrity += min(health_boost, chassis.max_integrity-chassis.obj_integrity)
		repaired = 1
	if(repaired)
		if(!chassis.use_power(energy_drain))
			STOP_PROCESSING(SSobj, src)
			set_ready_state(1)
	else //no repair needed, we turn off
		STOP_PROCESSING(SSobj, src)
		set_ready_state(1)
		chassis.cut_overlay(droid_overlay)
		droid_overlay = new(src.icon, icon_state = "repair_droid")
		chassis.add_overlay(droid_overlay)




/////////////////////////////////// TESLA ENERGY RELAY ////////////////////////////////////////////////

/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay
	name = "exosuit energy relay"
	desc = "An exosuit module that wirelessly drains energy from any available power channel in area. The performance index is quite low."
	icon_state = "tesla"
	energy_drain = 0
	range = 0
	var/coeff = 100
	var/list/use_channels = list(EQUIP,ENVIRON,LIGHT)
	selectable = 0

/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay/detach()
	STOP_PROCESSING(SSobj, src)
	..()
	return

/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay/proc/get_charge()
	if(equip_ready) //disabled
		return
	var/area/A = get_area(chassis)
	var/pow_chan = get_MUTATION_POWER_channel(A)
	if(pow_chan)
		return 1000 //making magic


/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay/proc/get_MUTATION_POWER_channel(area/A)
	var/pow_chan
	if(A)
		for(var/c in use_channels)
			if(A.powered(c))
				pow_chan = c
				break
	return pow_chan

/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay/Topic(href, href_list)
	..()
	if(href_list["toggle_relay"])
		if(equip_ready) //inactive
			START_PROCESSING(SSobj, src)
			set_ready_state(0)
			mecha_log_message("Activated.")
		else
			STOP_PROCESSING(SSobj, src)
			set_ready_state(1)
			mecha_log_message("Deactivated.")

/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay/get_equip_info()
	if(!chassis)
		return
	return "<span style=\"color:[equip_ready?"#0f0":"#f00"];\">*</span>&nbsp; [src.name] - <a href='?src=[REF(src)];toggle_relay=1'>[equip_ready?"A":"Dea"]ctivate</a>"


/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay/process()
	if(!chassis || chassis.internal_damage & MECHA_INT_SHORT_CIRCUIT)
		STOP_PROCESSING(SSobj, src)
		set_ready_state(1)
		return
	var/cur_charge = chassis.get_charge()
	if(isnull(cur_charge) || !chassis.cell)
		STOP_PROCESSING(SSobj, src)
		set_ready_state(1)
		occupant_message("No powercell detected.")
		return
	if(cur_charge < chassis.cell.maxcharge)
		var/area/A = get_base_area(chassis)
		if(A)
			var/pow_chan
			for(var/c in list(EQUIP,ENVIRON,LIGHT))
				if(A.powered(c))
					pow_chan = c
					break
			if(pow_chan)
				var/delta = min(20, chassis.cell.maxcharge-cur_charge)
				chassis.give_power(delta)
				A.use_power(delta*coeff, pow_chan)




/////////////////////////////////////////// GENERATOR /////////////////////////////////////////////


/obj/item/mecha_parts/mecha_equipment/generator
	name = "exosuit plasma converter"
	desc = "An exosuit module that generates power using solid plasma as fuel. Pollutes the environment."
	icon_state = "tesla"
	range = MELEE
	var/coeff = 100
	var/obj/item/stack/sheet/fuel
	var/max_fuel = 150000
	var/fuel_per_cycle_idle = 25
	var/fuel_per_cycle_active = 200
	var/power_per_cycle = 50

/obj/item/mecha_parts/mecha_equipment/generator/Initialize()
	. = ..()
	generator_init()

/obj/item/mecha_parts/mecha_equipment/generator/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/mecha_parts/mecha_equipment/generator/proc/generator_init()
	fuel = new /obj/item/stack/sheet/mineral/plasma(src, 0)

/obj/item/mecha_parts/mecha_equipment/generator/detach()
	STOP_PROCESSING(SSobj, src)
	..()

/obj/item/mecha_parts/mecha_equipment/generator/Topic(href, href_list)
	..()
	if(href_list["toggle"])
		if(equip_ready) //inactive
			set_ready_state(0)
			START_PROCESSING(SSobj, src)
			mecha_log_message("Activated.")
		else
			set_ready_state(1)
			STOP_PROCESSING(SSobj, src)
			mecha_log_message("Deactivated.")

/obj/item/mecha_parts/mecha_equipment/generator/get_equip_info()
	var/output = ..()
	if(output)
		return "[output] \[[fuel]: [round(fuel.amount*MINERAL_MATERIAL_AMOUNT,0.1)] cm<sup>3</sup>\] - <a href='?src=[REF(src)];toggle=1'>[equip_ready?"A":"Dea"]ctivate</a>"

/obj/item/mecha_parts/mecha_equipment/generator/action(target)
	if(chassis)
		var/result = load_fuel(target)
		if(result)
			send_byjax(chassis.occupant,"exosuit.browser","[REF(src)]",src.get_equip_info())

/obj/item/mecha_parts/mecha_equipment/generator/proc/load_fuel(obj/item/stack/sheet/P)
	if(P.type == fuel.type && P.amount > 0)
		var/to_load = max(max_fuel - fuel.amount*MINERAL_MATERIAL_AMOUNT,0)
		if(to_load)
			var/units = min(max(round(to_load / MINERAL_MATERIAL_AMOUNT),1),P.amount)
			fuel.amount += units
			P.use(units)
			occupant_message("[units] unit\s of [fuel] successfully loaded.")
			return units
		else
			occupant_message("Unit is full.")
			return 0
	else
		occupant_message("<span class='warning'>[fuel] traces in target minimal! [P] cannot be used as fuel.</span>")
		return

/obj/item/mecha_parts/mecha_equipment/generator/attackby(weapon,mob/user, params)
	load_fuel(weapon)

/obj/item/mecha_parts/mecha_equipment/generator/critfail()
	..()
	var/turf/open/T = get_turf(src)
	if(!istype(T))
		return
	var/datum/gas_mixture/GM = new
	if(prob(10))
		GM.adjust_moles(GAS_PLASMA,100)
		GM.set_temperature(1500+T0C) //should be enough to start a fire
		T.visible_message("[src] suddenly disgorges a cloud of heated plasma.")
		qdel(src)
	else
		GM.adjust_moles(GAS_PLASMA,5)
		GM.set_temperature(istype(T) ? T.air.return_temperature() : T20C)
		T.visible_message("[src] suddenly disgorges a cloud of plasma.")
	T.assume_air(GM)
	return

/obj/item/mecha_parts/mecha_equipment/generator/process()
	if(!chassis)
		STOP_PROCESSING(SSobj, src)
		set_ready_state(1)
		return
	if(fuel.amount<=0)
		STOP_PROCESSING(SSobj, src)
		mecha_log_message("Deactivated - no fuel.")
		set_ready_state(1)
		return
	var/cur_charge = chassis.get_charge()
	if(isnull(cur_charge))
		set_ready_state(1)
		occupant_message("No powercell detected.")
		mecha_log_message("Deactivated.")
		STOP_PROCESSING(SSobj, src)
		return
	var/use_fuel = fuel_per_cycle_idle
	if(cur_charge < chassis.cell.maxcharge)
		use_fuel = fuel_per_cycle_active
		chassis.give_power(power_per_cycle)
	fuel.amount -= min(use_fuel/MINERAL_MATERIAL_AMOUNT,fuel.amount)
	update_equip_info()
	return 1


/obj/item/mecha_parts/mecha_equipment/generator/nuclear
	name = "exonuclear reactor"
	desc = "An exosuit module that generates power using uranium as fuel. Pollutes the environment."
	icon_state = "tesla"
	max_fuel = 50000
	fuel_per_cycle_idle = 10
	fuel_per_cycle_active = 30
	power_per_cycle = 100
	var/rad_per_cycle = 30

/obj/item/mecha_parts/mecha_equipment/generator/nuclear/generator_init()
	fuel = new /obj/item/stack/sheet/mineral/uranium(src, 0)

/obj/item/mecha_parts/mecha_equipment/generator/nuclear/critfail()
	return

/obj/item/mecha_parts/mecha_equipment/generator/nuclear/process()
	if(..())
		radiation_pulse(get_turf(src), rad_per_cycle)
