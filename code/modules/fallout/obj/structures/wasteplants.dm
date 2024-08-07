//Fallout 13 general flora directory

/obj/structure/flora/grass/wasteland
	icon = 'icons/fallout/flora/flora.dmi'
	desc = "Some dry, virtually dead grass."
	icon_state = "tall_grass_1"

/obj/structure/flora/grass/wasteland/Initialize()
	. = ..()
	icon_state = "tall_grass_[rand(1,8)]"

/obj/structure/flora/grass/wasteland/attackby(obj/item/W, mob/user, params) //we dont use /weapon any more
	if(W.sharpness && W.force > 0 && !(NODECONSTRUCT_1 in flags_1))
		to_chat(user, "You begin to harvest [src]...")
		if(do_after(user, 100/W.force, target = user))
			to_chat(user, "<span class='notice'>You've collected [src]</span>")
			var/obj/item/stack/sheet/hay/H = user.get_inactive_held_item()
			if(istype(H))
				H.add(1)
			else
				new /obj/item/stack/sheet/hay/(get_turf(src))
			qdel(src)
			return 1
	else
		. = ..()

/obj/structure/flora/tree/wasteland
	name = "dead tree"
	desc = "It's a tree. Useful for combustion and/or construction."
	icon = 'icons/fallout/flora/trees.dmi'
	icon_state = "deadtree_1"
	log_amount = 4
	obj_integrity = 100
	max_integrity = 100

/obj/structure/flora/tree/wasteland/Initialize()
	. = ..()
	icon_state = "deadtree_[rand(1,6)]"
	AddComponent(/datum/component/largetransparency, y_offset = 1)

// Below are trees but not trees. You know how it is. :(

/obj/structure/flora/not_tree
	icon = 'icons/fallout/flora/flora.dmi'
	density = TRUE
	var/timber_amount = 2

/obj/structure/flora/not_tree/attackby(obj/item/W, mob/user, params)
	if(timber_amount && (!(flags_1 & NODECONSTRUCT_1)))
		if(W.sharpness && W.force > 0)
			if(W.hitsound)
				playsound(get_turf(src), 'sound/effects/wood_cutting.ogg', 100, 0, 0)
			user.visible_message("<span class='notice'>[user] begins to cut up [src] with [W].</span>","<span class='notice'>You begin to cut up [src] with [W].</span>", "You hear the sound of sawing.")
			if(do_after(user, 1000/W.force, target = src)) //5 seconds with 20 force, 8 seconds with a hatchet, 20 seconds with a shard.
				user.visible_message("<span class='notice'>[user] breaks apart [src] with the [W].</span>","<span class='notice'>You break apart [src] with the [W].</span>", "You hear the sound of sawing.")
				playsound(get_turf(src), 'sound/effects/wood_cutting.ogg', 100 , 0, 0)
				for(var/i=1 to timber_amount)
					new /obj/item/grown/log/tree(get_turf(src))

				qdel(src)

	else
		return ..()

/obj/structure/flora/not_tree/wasteland_fallen
	name = "log"
	desc = "It's a log. Useful for combustion and/or construction."
	icon_state = "timber"
	timber_amount = 2
	obj_integrity = 25
	max_integrity = 25

/obj/structure/flora/not_tree/brushwood
	name = "brushwood"
	desc = "Old brushwood. Useful for combustion and/or construction."
	var/chosen_icon
	icon_state = "branch"
	density = FALSE
	timber_amount = 1
	obj_integrity = 5
	max_integrity = 5

/obj/structure/flora/not_tree/brushwood/Initialize()
	. = ..()
	chosen_icon = pick(list("branch", "branch_broken", "brushwood", "brushwood_alt"))
	icon_state = chosen_icon
	update_icon()

// End of the trees that aren't trees.

/obj/structure/flora/wasteplant
	name = "wasteland plant"
	desc = "It's a wasteland plant."
	icon = 'icons/obj/flora/wastelandflora.dmi'
	anchored = 1
	density = 0
	var/has_plod = TRUE
	var/produce
	var/timer = 5000 //50 seconds

/obj/structure/flora/wasteplant/attack_hand(mob/user)
	if(!ispath(produce))
		return ..()

	if(has_plod)
		var/obj/item/product = new produce
		if(!istype(product))
			return //Something fucked up here or it's a weird product
		user.put_in_hands(product)
		to_chat(user, "<span class='notice'>You pluck [product] from [src].</span>")
		has_plod = FALSE
		update_icon() //Won't update due to proc otherwise
		timer = initial(timer) + rand(-100,100) //add some variability
		addtimer(CALLBACK(src, PROC_REF(regrow)),timer) //Set up the timer properly
	update_icon()

/obj/structure/flora/wasteplant/proc/regrow()
	if(!QDELETED(src))
		has_plod = TRUE
		update_icon()

/obj/structure/flora/wasteplant/update_icon()
	if(has_plod)
		icon_state = "[initial(icon_state)]"
	else
		icon_state = "[initial(icon_state)]_no"

/obj/structure/flora/wasteplant/wild_tato
	name = "wild tato"
	icon_state = "wild_tato"
	desc = "The outside looks like a tomato, but the inside is brown. Tastes as absolutely disgusting as it looks, but will keep you from starving."
	produce = /obj/item/reagent_containers/food/snacks/grown/tato

/obj/structure/flora/wasteplant/wild_mutfruit
	name = "wild mutfruit sapling"
	icon_state = "wild_mutfruit"
	desc = "This irradiated sapling offers a fruit that is highly nutritious and hydrating."
	produce = /obj/item/reagent_containers/food/snacks/grown/mutfruit

/obj/structure/flora/wasteplant/wild_fungus
	name = "cave fungi"
	icon_state = "wild_fungus"
	desc = "This edible strain of fungus grows in dark places and is said to have anti-toxic properties."
	produce = /obj/item/reagent_containers/food/snacks/grown/fungus

/obj/structure/flora/wasteplant/rad_fungus
	name = "glowing fungi"
	icon = 'icons/fallout/flora/flora.dmi'
	icon_state = "mushroom_1"
	desc = "This bio-luminescent fungus is a prime example of something that has thrived within the wasteland. \
	Beyond providing light, it has little use. For those with good intentions, that is."
	produce = /obj/item/reagent_containers/food/snacks/grown/glow
	light_color = LIGHT_COLOR_GREEN
	light_power = 1.25
	light_range = 1

/obj/structure/flora/wasteplant/rad_fungus/Initialize()
	. = ..()
	icon_state = "mushroom_[rand(1,4)]"
	START_PROCESSING(SSradiation,src)

/obj/structure/flora/wasteplant/rad_fungus/Destroy()
	STOP_PROCESSING(SSradiation,src)
	return ..()

/obj/structure/flora/wasteplant/rad_fungus/process()
	if(QDELETED(src))
		return PROCESS_KILL

	if(!z || !SSmobs.clients_by_zlevel[z].len)
		return

	for(var/mob/living/carbon/human/victim in view(src,0))// Only those standing on it.
		if(istype(victim) && victim.stat != DEAD)
			victim.rad_act(5)

	for(var/obj/item/geiger_counter/geiger in view(src,5))// Geigers will hate it, though, regardless.
		if(istype(geiger))
			geiger.rad_act(15)


/////FALLOUT 13 TREES////
//////
// Reused jungle sprites, for Vermont.
// Temp until we get a proper replacement.
// Pretty out of place and I feel gross using them.
//////

/obj/structure/flora/grass/vermont
	name = "thick grass"
	desc = "Thick flora, birthed from the Vermont wilderness."
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa"

/obj/structure/flora/grass/vermont/Initialize()
	. = ..()
	icon_state = "[icon_state][rand(1, 5)]"

/obj/structure/flora/grass/vermont/b
	icon_state = "grassb"

// Rocks

/obj/structure/flora/rock/vermont
	name = "pile of rocks"
	desc = "A pile of rocks."
	icon_state = "rock"
	icon = 'icons/obj/flora/jungleflora.dmi'
	density = FALSE

/obj/structure/flora/rock/vermont/Initialize()
	. = ..()
	icon_state = "[initial(icon_state)][rand(1,5)]"


// Bushes

/obj/structure/flora/grass/wasteland/vermontbush
	name = "bush"
	desc = "A wild plant, birthed from the Vermont wilderness."
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "busha"

/obj/structure/flora/grass/wasteland/vermontbush/Initialize()
	. = ..()
	icon_state = "[icon_state][rand(1, 3)]"

/obj/structure/flora/grass/wasteland/vermontbush/b
	icon_state = "bushb"

/obj/structure/flora/grass/wasteland/vermontbush/c
	icon_state = "bushc"

/obj/structure/flora/grass/wasteland/vermontbush/large
	icon_state = "bush"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	pixel_x = -16
	pixel_y = -12
	plane = MOB_PLANE
	layer = ABOVE_ALL_MOB_LAYER

/obj/structure/flora/grass/wasteland/vermontbush/large/Initialize()
	. = ..()
	AddComponent(/datum/component/largetransparency, 1, 1)
	icon_state = "[icon_state][rand(1, 3)]"

/obj/structure/flora/rock/pile/largevermont
	name = "rocks"
	icon_state = "rocks"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	density = FALSE
	pixel_x = -16
	pixel_y = -16
	obj_integrity = 100//So you can remove them, for building purposes.
	max_integrity = 100

/obj/structure/flora/rock/pile/largevermont/Initialize()
	. = ..()
	icon_state = "[initial(icon_state)][rand(1,3)]"
