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
		addtimer(CALLBACK(src, .proc/regrow),timer) //Set up the timer properly
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

/obj/structure/flora/wasteplant/wild_broc
	name = "wild broc flower"
	icon_state = "wild_broc"
	desc = "A tall stalk bearing a vibrant, orange flower famed for its healing properties."
	produce = /obj/item/reagent_containers/food/snacks/grown/broc

/obj/structure/flora/wasteplant/wild_xander
	name = "wild xander roots"
	icon_state = "wild_xander"
	desc = "A hardy, onion-like root with mild healing properties."
	produce = /obj/item/reagent_containers/food/snacks/grown/xander

/obj/structure/flora/wasteplant/wild_buffalogourd
	name = "wild buffalo vines"
	icon_state = "wild_gourd"
	desc = "This large spreading perennial vine is a close relative of many cultivated gourd crops. The ripe fruit forms a small gourd, which was reportedly boiled and eaten by various tribes."
	produce = /obj/item/reagent_containers/food/snacks/grown/buffalogourd

/obj/structure/flora/wasteplant/wild_horsenettle
	name = "wild horsenettle"
	icon_state = "wild_horsenettle"
	desc = "The tribes use the berries of this toxic plant as a vegetable rennet."
	produce = /obj/item/reagent_containers/food/snacks/grown/horsenettle

/obj/structure/flora/wasteplant/wild_mesquite
	name = "wild mesquite"
	icon_state = "wild_mesquite"
	desc = "The honey mesquite pod grows on a short tree with willow-like branches. Trees with pickable pods will appear bushier in foliage and have strings of pods on them, resembling a fern pattern. Pods can be eaten or used in recipes"
	produce = /obj/item/reagent_containers/food/snacks/grown/mesquite

/obj/structure/flora/wasteplant/wild_pinyon
	name = "wild pinyon pine"
	icon_state = "wild_pinyon"
	desc = "The seeds of the pinyon pine, known as pine nuts, are an important food for settlers and tribes living in the mountains of the North American Southwest. All species of pine produce edible seeds, but in North America only the pinyon produces seeds large enough to be a major source of food."
	produce = /obj/item/reagent_containers/food/snacks/grown/pinyon

/obj/structure/flora/wasteplant/wild_prickly
	name = "wild prickly pear"
	icon_state = "wild_prickly"
	desc = "Distinguished by having cylindrical, rather than flattened, stem segments with large barbed spines. The stem joints are very brittle on young stems, readily breaking off when the barbed spines stick to clothing or animal fur."
	produce = /obj/item/reagent_containers/food/snacks/grown/pricklypear

/obj/structure/flora/wasteplant/wild_datura
	name = "wild datura"
	icon_state = "wild_datura"
	desc = "The sacred datura root, useful as an anesthetic for surgery and in healing salves, as well as for rites of passage rituals and ceremonies"
	produce = /obj/item/reagent_containers/food/snacks/grown/datura

/obj/structure/flora/wasteplant/wild_punga
	name = "wild punga"
	icon_state = "wild_punga"
	desc = "Punga fruit plants flower at a single point at the terminus of their stems, gradually developing into large, fleshy fruits with a yellow/brown, thick skin."
	produce = /obj/item/reagent_containers/food/snacks/grown/pungafruit

/obj/structure/flora/wasteplant/wild_coyote
	name = "wild coyote tobacco shrub"
	icon_state = "wild_coyote"
	desc = "This tobacco like plant is commonly used by tribals for a great variety of medicinal and ceremonial purposes."
	produce = /obj/item/reagent_containers/food/snacks/grown/coyotetobacco

/obj/structure/flora/wasteplant/wild_yucca
	name = "wild banana yucca"
	icon_state = "wild_yucca"
	desc = "The species gets its common name banana yucca from its banana-shaped fruit. The specific epithet baccata means 'with berries'"
	produce = /obj/item/reagent_containers/food/snacks/grown/yucca

/obj/structure/flora/wasteplant/wild_tato
	name = "wild tato"
	icon_state = "wild_tato"
	desc = "The outside looks like a tomato, but the inside is brown. Tastes as absolutely disgusting as it looks, but will keep you from starving."
	produce = /obj/item/reagent_containers/food/snacks/grown/tato

/obj/structure/flora/wasteplant/wild_feracactus
	name = "wild barrel cactus"
	icon_state = "wild_feracactus"
	desc = "A squat, spherical cactus blooming with a toxic fruit."
	produce = /obj/item/reagent_containers/food/snacks/grown/feracactus


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

/obj/structure/flora/wasteplant/wild_agave
	name = "wild agave"
	icon_state = "wild_agave"
	desc = "The juice of this fleshy plant soothes burns, but it also removes nutrients from the body."
	produce = /obj/item/reagent_containers/food/snacks/grown/agave


/////FALLOUT 13 TREES////
/obj/structure/flora/tree/joshua
	name = "joshua tree"
	desc = "A tree named by Msormons, who said its branches looked like the biblical Joshua with his hands raised in prayer."
	icon = 'icons/obj/flora/deadtrees.dmi'
	log_amount = 3
	icon_state = "joshua_1"

/obj/structure/flora/tree/joshua/Initialize()
	. = ..()
	icon_state = "joshua_[rand(1,4)]"
	AddComponent(/datum/component/largetransparency, y_offset = 1)

/obj/structure/flora/tree/cactus
	name = "cactus"
	desc = "It's a giant cowboy hat! It's waving hello! It wants you to hug it!"
	icon = 'icons/obj/flora/deadtrees.dmi'
	icon_state = "cactus"
	log_amount = 2

//////
// Reused jungle sprites, for Vermont.
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

/obj/structure/flora/vermontbush
	name = "bush"
	desc = "A wild plant, birthed from the Vermont wilderness."
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "busha"

/obj/structure/flora/vermontbush/Initialize()
	. = ..()
	icon_state = "[icon_state][rand(1, 3)]"

/obj/structure/flora/vermontbush/b
	icon_state = "bushb"

/obj/structure/flora/vermontbush/c
	icon_state = "bushc"

/obj/structure/flora/vermontbush/large
	icon_state = "bush"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	pixel_x = -16
	pixel_y = -12
	plane = MOB_PLANE
	layer = ABOVE_ALL_MOB_LAYER

/obj/structure/flora/vermontbush/large/Initialize()
	. = ..()
	AddComponent(/datum/component/largetransparency, 1, 1)

/obj/structure/flora/rock/pile/largevermont
	name = "rocks"
	icon_state = "rocks"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	density = FALSE
	pixel_x = -16
	pixel_y = -16

/obj/structure/flora/rock/pile/largevermont/Initialize()
	. = ..()
	icon_state = "[initial(icon_state)][rand(1,3)]"
