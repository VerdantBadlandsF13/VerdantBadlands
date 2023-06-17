/obj/machinery/workbench
	name = "workbench"
	icon = 'icons/obj/machines/reloadingbench.dmi'
	icon_state = "standard_bench"
	desc = "A basic workbench for simple to intermediate projects."
	resistance_flags = INDESTRUCTIBLE
	density = TRUE
	layer = BELOW_OBJ_LAYER
	anchored = TRUE
	machine_tool_behaviour = TOOL_WORKBENCH
	var/wrenchable = 1


/obj/machinery/workbench/can_be_unfasten_wrench(mob/user, silent)
	if (!wrenchable)  // case also covered by NODECONSTRUCT checks in default_unfasten_wrench
		return CANT_UNFASTEN

	return ..()

/obj/machinery/workbench/wrench_act(mob/living/user, obj/item/I)
	default_unfasten_wrench(user, I, 10)
	return TRUE

/obj/machinery/workbench/attackby(obj/item/W, mob/user, params)
	if (istype(W, /obj/item/wrench) && !(flags_1&NODECONSTRUCT_1))
		W.play_tool_sound(src)
		deconstruct(TRUE)
		return
	if(user.a_intent == INTENT_HARM)
		return ..()
	if(istype(W,/obj/item/salvage))
		var/obj/item/salvage/S = W
		if(do_after(user,1,target = src))
			if(HAS_TRAIT(user, TRAIT_TECHNOPHREAK))
				var/obj/I = pick(S.Loot)
				new I (src.loc)
			var/obj/I = pick(S.Loot)
			new I (src.loc)
			if(prob(50))
				var/obj/J = pick(S.Loot)
				new J (src.loc)
				if(prob(30))
					var/obj/K = pick(S.Loot)
					new K (src.loc)
			stoplag(1)
			qdel(W)

	if(istype(W,/obj/item/storage))
		var/obj/item/storage/baggy = W
		var/obj/item/salvage/checkitem
		if(!baggy.in_use)
			baggy.in_use = TRUE
			for(var/thingy in baggy.contents)
				if(!istype(thingy, /obj/item/salvage))//how did we get here
					baggy.in_use = FALSE
					break
				checkitem = thingy
				if(!user.transferItemToLoc(checkitem, drop_location()))
					break
				if(do_after(user,5,target = src))
					if(HAS_TRAIT(user, TRAIT_TECHNOPHREAK))
						var/obj/I = pick(checkitem.Loot)
						new I (src.loc)
					var/obj/I = pick(checkitem.Loot)
					new I (src.loc)
					if(prob(50))
						var/obj/J = pick(checkitem.Loot)
						new J (src.loc)
					if(prob(25))
						var/obj/K = pick(checkitem.Loot)
						new K (src.loc)
					stoplag(1)
					qdel(checkitem)
			baggy.in_use = FALSE
	if(user.transferItemToLoc(W, drop_location()))
		return 1

/obj/machinery/workbench/advanced
	name = "advanced workbench"
	icon_state = "advanced_bench"
	desc = "A large and advanced pre-war workbench to tackle any project!"
	machine_tool_behaviour = list(TOOL_AWORKBENCH, TOOL_WORKBENCH)
	wrenchable = FALSE

/obj/machinery/workbench/bottler
	name = "bottle press"
	icon_state = "bottler"
	desc = "A self-crafted all-in-one bottle making and pressing machine."
	machine_tool_behaviour = TOOL_BOTTLER
	wrenchable = FALSE

/obj/machinery/workbench/forge
	name = "metalworking bench"
	desc = "A workbench with a drill press, a makeshift blowtorch setup, and various tools for making crude weapons and tools."
	icon = 'icons/fallout/machines/64x32.dmi'
	icon_state = "bench_metal"
	bound_width = 64
	machine_tool_behaviour = TOOL_FORGE
	wrenchable = FALSE

/obj/machinery/workbench/forge/primal
	name = "makeshift forge"
	desc = "An incredibly primitive forge. Something you'd expect to see hundreds of years in the past, not within the modern day wasteland."
	icon_state = "forge"

/obj/machinery/ammobench
	name = "pre-war reloading press"
	desc = "A high quality reloading press from before the war. Capable of cheap, mass production of ammunition."
	icon = 'icons/obj/machines/pre-war_press.dmi'
	icon_state = "pre-war_press"
	bound_width = 64
	resistance_flags = INDESTRUCTIBLE
	density = TRUE
	layer = BELOW_OBJ_LAYER
	anchored = TRUE
	machine_tool_behaviour = TOOL_RELOADER
