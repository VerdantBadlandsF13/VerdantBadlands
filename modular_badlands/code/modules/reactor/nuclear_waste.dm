/obj/effect/decal/nuclear_waste
	name = "radioactive debris"
	desc = "A pile of heavily irradiated debris. You probably shouldn't step through this..."
	icon = 'modular_badlands/code/modules/reactor/icons/reactor.dmi'
	icon_state = "nuclearwaste"
	alpha = 150
	light_color = LIGHT_COLOR_CYAN
	color = "#ff9eff"

/obj/effect/decal/nuclear_waste/Initialize(mapload)
	. = ..()
	set_light(3)

	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_entered),
	)
	AddElement(/datum/element/connect_loc, loc_connections)

/obj/effect/decal/nuclear_waste/ex_act(severity, target)
	if(severity != EXPLODE_DEVASTATE)
		return
	qdel(src)

/obj/effect/decal/nuclear_waste/proc/on_entered(datum/source, atom/movable/AM)
	SIGNAL_HANDLER

	if(isliving(AM))
		var/mob/living/L = AM
		playsound(loc, 'sound/effects/gib_step.ogg', HAS_TRAIT(L, TRAIT_LIGHT_STEP) ? 20 : 50, 1)
	radiation_pulse(src, 500, 5)

/obj/effect/decal/nuclear_waste/attackby(obj/item/tool, mob/user)
	if(tool.tool_behaviour == TOOL_SHOVEL)
		radiation_pulse(src, 1000, 5)
		to_chat(user, "<span class='notice'>You start to clear [src]...</span>")
		if(tool.use_tool(src, user, 50, volume=100))
			to_chat(user, "<span class='notice'>You clear [src]. </span>")
			qdel(src)
			return
	. = ..()

/obj/effect/decal/nuclear_waste/epicenter
	name = "dense radioactive debris"

/obj/effect/decal/nuclear_waste/epicenter/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/radioactive, 1500, src, 0)
