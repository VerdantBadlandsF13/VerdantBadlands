/obj/roof
	name = "wood roof"
	desc = "A wooden roof."
	icon = 'modular_badlands/code/modules/environment/icons/roof.dmi'
	icon_state = "wood_dm"
	var/overlay_state = "wood"
	anchored = TRUE
	opacity = FALSE
	density = FALSE
	layer = MASSIVE_OBJ_LAYER
	var/current_area_type = /area/f13
	var/image/roof_overlay
	var/health = 100

/obj/roof/attackby(obj/item/weapon/W as obj, mob/user as mob)
	user.DelayNextAction(CLICK_CD_MELEE)
	user.do_attack_animation(src)
	playsound(get_turf(src), 'sound/effects/wood_cutting.ogg', 100)
	if (istype(W, /obj/item/screwdriver))
		playsound(loc, 'sound/items/Screwdriver.ogg', 75, TRUE)
		to_chat(usr, "You start removing \the [src]...")
		if (do_after(user, 60, src) && src)
			to_chat(usr, "You removed \the [src].")
			qdel(src)
			return
	else
		switch(W.damtype)
			if ("fire")
				health -= W.force * TRUE
			if ("brute")
				health -= W.force * 0.20
		return
	..()

/obj/roof/wood
	name = "wood roof"
	icon_state = "wood_dm"
	overlay_state = "wood"

/obj/roof/concrete
	name = "concrete roof"
	desc = "A concrete roof."
	overlay_state = "cement"
	icon_state = "cement_dm"

/obj/roof/fort
	name = "concrete roof"
	desc = "A concrete roof."
	overlay_state = "fortressroof"
	icon_state = "fortress_roof_dm"

/obj/roof/proc/update_transparency(on = TRUE)
	roof_overlay.alpha = 255
	spawn(1)
		if (on)
			var/turf/T = get_turf(src)
			T.recalc_atom_opacity()
			if (T.has_opaque_atom)
				roof_overlay.alpha = 255
			else
				roof_overlay.alpha = 127
		else
			roof_overlay.alpha = 255

/obj/roof/proc/recalculate_borders(recalculate_others = FALSE)
	var/founddir = 0
	for (var/drr in list(NORTH,SOUTH,EAST,WEST))
		for (var/obj/roof/RF in get_step(src, drr))
			founddir+=drr
	roof_overlay.icon_state = "[overlay_state]_[founddir]"
	if (recalculate_others)
		for (var/obj/roof/R in range(1,src))
			R.recalculate_borders(FALSE)

/obj/roof/New()
	..()
	icon_state = "roof"
	roof_overlay = image(icon='modular_badlands/code/modules/environment/icons/roof.dmi', loc = src, icon_state=overlay_state,layer=MASSIVE_OBJ_LAYER)
	recalculate_borders(TRUE)

	for (var/atom/movable/lighting_object/LO in get_turf(src))
		LO.update()
	collapse_check()

	var/turf/T = loc
	T.recalc_atom_opacity()
	if (T.has_opaque_atom)
		update_transparency(0)
	else
		for(var/obj/structure/S in range(1,src))
			var/turf/TT = get_turf(S)
			TT.recalc_atom_opacity()
			if(TT.has_opaque_atom)
				update_transparency(0)
			else if(istype(S, /obj/structure/simple_door) || istype(S, /obj/structure/curtain))
				if (S.opacity)
					update_transparency(0)
				else
					update_transparency(1)
			else if(istype(S, /obj/structure/window))
				var/found = FALSE
				for(var/obj/structure/SS in S.loc)
					if(istype(SS, /obj/structure/simple_door) || istype(SS, /obj/structure/curtain))
						if(SS.opacity)
							update_transparency(0)
						else
							update_transparency(1)
						found = TRUE
				if(!found)
					update_transparency(1)


	GLOB.roofs_list += roof_overlay

/obj/roof/Destroy()
	new current_area_type(get_turf(src))
	for (var/atom/movable/lighting_object/LO in get_turf(src))
		LO.update()
	for (var/obj/roof/R in range(1,src))
		R.recalculate_borders(FALSE)
	GLOB.roofs_list -= roof_overlay
	..()

/obj/roof/proc/collapse_check()
	spawn(50)
		var/supportfound = FALSE
		for (var/obj/structure/roof_support/RS in range(6, src))
			supportfound = TRUE
		for (var/obj/structure/roof_support/concrete/RS in range(12, src))
			supportfound = TRUE
		for (var/obj/structure/mine_support/MS in range(2, src))
			supportfound = TRUE
		for (var/turf/closed/W in range(1, src))
			supportfound = TRUE
		for (var/obj/structure/simple_door/SD in loc)
			supportfound = TRUE
	//Without support, the roof collapses.
		if (!supportfound)
			playsound(src,'modular_badlands/code/modules/environment/sound/debris.ogg',100,0,6)
			for (var/mob/living/carbon/M in range(1, src))
				M.take_overall_damage(brute = rand(10,30), stamina = rand(45,60))
				to_chat(M, "The roof collapses!")
			Destroy()
			qdel(src)

/obj/item/roofbuilder
	name = "roof builder"
	desc = "Use this to build roofs."
	icon = 'modular_badlands/code/modules/environment/icons/roof.dmi'
	icon_state = "roof_builder"
	w_class = WEIGHT_CLASS_BULKY
	var/done = FALSE
	var/target_type = /obj/roof/wood

/datum/crafting_recipe/roof_building
	name = "Wooden Roofing Kit"
	result = /obj/item/roofbuilder
	reqs = list(/obj/item/stack/sheet/mineral/wood = 25)
	time = 120
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/obj/item/roofbuilder/concrete
	name = "concrete roofing"
	desc = "Use this to build roofs."
	icon_state = "concrete_roof_builder"
	target_type = /obj/roof/concrete

/datum/crafting_recipe/roof_building_concrete
	name = "Concrete Roofing Kit"
	result = /obj/item/roofbuilder/concrete
	reqs = list(/obj/item/stack/sheet/mineral/concrete = 15)
	time = 60
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/obj/item/roofbuilder/attack_self(mob/user)
	var/your_dir = "NORTH"

// This is dogwater.
// Whatever. Not my code originally, so I'm not too pressed to fix it. - Carl
	switch (user.dir)
		if (NORTH)
			your_dir = "NORTH"
		if (SOUTH)
			your_dir = "SOUTH"
		if (EAST)
			your_dir = "EAST"
		if (WEST)
			your_dir = "WEST"

	var/covers_time = 80

	for (var/obj/roof/RF in get_step(user, user.dir))
		to_chat(usr, "That area is already roofed!")
		return
	var/confirm = FALSE
	for(var/obj/structure/mine_support/MS in range(2, get_step(user, user.dir)))
		confirm = TRUE

	if (!confirm)
		to_chat(usr, "This area doesn't have a support for the roof! Build one first!")
		return

	var/choice = alert(user, "This will start building a roof [your_dir] of you.","Roof Construction", "Continue" , "Cancel")
	if (choice == "Cancel")
		return
	if (choice == "Continue")
		visible_message("<span class='danger'>[user] starts building the roof.</span>", "<span class='danger'>You start building the roof.</span>")
		if (do_after(user, covers_time, user.loc) && src && !done)
			for (var/obj/roof/RF in get_step(user, user.dir))
				to_chat(usr, "That area is already roofed!")
				return
			done = TRUE
			new target_type(get_step(user, user.dir), user)
			visible_message("<span class='danger'>[user] finishes building the roof.</span>")
			qdel(src)
		return

/obj/structure/mine_support
	name = "mine support"
	desc = "Wood beams set in place to support the tunnel. Prevents cave-ins. Hopefully. <br>\
	<span class='revenminor'>OOC: This will support tunnels up to two steps away.</span>"
	icon = 'modular_badlands/code/modules/environment/icons/roof.dmi'
	icon_state = "support_v"
	anchored = TRUE
	opacity = FALSE
	density = FALSE
	var/health = 100

/obj/structure/mine_support/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item))
		user.DelayNextAction(CLICK_CD_MELEE)
		switch(W.damtype)
			if ("fire")
				health -= W.force * TRUE
			if ("brute")
				health -= W.force * 0.20
		playsound(get_turf(src), 'sound/effects/wood_cutting.ogg', 100)
		user.do_attack_animation(src)
		try_destroy()
	..()

/obj/structure/mine_support/proc/try_destroy()
	if (health <= 0)
		visible_message("<span class='danger'>[src] is broken into pieces!</span>")
		Destroy()
		return

/datum/crafting_recipe/mineshaft_support
	name = "Support Beams"
	result = /obj/structure/mine_support
	reqs = list(/obj/item/stack/sheet/mineral/wood = 15)
	time = 120
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/obj/structure/roof_support
	name = "roof support"
	desc = "A thick wood beam, used to support roofs in large buildings. <br>\
	<span class='revenminor'>OOC: This will support roof tiles up to six steps away.</span>"
	icon = 'modular_badlands/code/modules/environment/icons/roof.dmi'
	icon_state = "support_h"
	var/health = 100

/datum/crafting_recipe/roof_support
	name = "Wooden Support Beams"
	result = /obj/structure/roof_support
	reqs = list(/obj/item/stack/sheet/mineral/wood = 25)
	time = 120
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/obj/structure/roof_support/concrete
	name = "roof support"
	desc = "A thick concrete beam, used to support roofs in large buildings. <br>\
	<span class='revenminor'>OOC: This will support roof tiles up to twelve steps away.</span>"
	icon_state = "concrete_pillar"
	anchored = TRUE
	opacity = FALSE
	density = FALSE

/datum/crafting_recipe/roof_support_concrete
	name = "Concrete Support Beams"
	result = /obj/structure/roof_support/concrete
	reqs = list(/obj/item/stack/sheet/mineral/concrete = 15)
	time = 60
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/obj/structure/roof_support/admin
	name = "roof support"
	desc = ""
	icon = 'modular_badlands/code/modules/environment/icons/roof.dmi'
	icon_state = "roof2"

/obj/structure/roof_support/admin/New()
	..()
	icon_state = "roof"

/obj/structure/roof_support/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item))
		user.DelayNextAction(CLICK_CD_MELEE)
		switch(W.damtype)
			if ("fire")
				health -= W.force * TRUE
			if ("brute")
				health -= W.force * 0.20
		playsound(get_turf(src), 'sound/effects/wood_cutting.ogg', 100)
		user.do_attack_animation(src)
		try_destroy()
	..()

/obj/structure/roof_support/proc/try_destroy()
	if (health <= 0)
		visible_message("<span class='danger'>[src] is broken into pieces!</span>")
		Destroy()
		return

/obj/structure/roof_support/Destroy()
	for(var/obj/roof/R in range(3,get_turf(src)))
		R.collapse_check()
	..()

/obj/structure/mine_support/Destroy()
	if (istype(get_turf(src), /turf/open))
		for(var/turf/open/T in range(3,get_turf(src)))
			T.collapse_check()
	..()
