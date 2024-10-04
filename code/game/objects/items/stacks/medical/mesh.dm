
/obj/item/stack/medical/mesh
	name = "regenerative mesh"
	desc = "An advanced bacteriostatic mesh used to dress burns and sanitize burns. Also removes infection directly, unlike ointment. Best for severe burns. This is the kind of thing you would expect to see in a pre-war hospital."
	gender = PLURAL
	singular_name = "regenerative mesh"
	icon_state = "regen_mesh"
	self_delay = 30
	other_delay = 10
	amount = 15
	max_amount = 15
	heal_burn = 10
	pain_amount = 24
	pain_burn = TRUE
	repeating = TRUE
	sanitization = 2
	flesh_regeneration = 6
	var/is_open = TRUE ///This var determines if the sterile packaging of the mesh has been opened.
	grind_results = list(/datum/reagent/medicine/spaceacillin = 2)
	merge_type = /obj/item/stack/medical/mesh

/obj/item/stack/medical/mesh/one
	amount = 1

/obj/item/stack/medical/mesh/five
	amount = 5

/obj/item/stack/medical/mesh/advanced
	name = "advanced regenerative mesh"
	desc = "An advanced mesh made with aloe extracts and sterilizing chemicals, used for the most critical burns. Also removes infection directly, unlike ointment. This is the kind of thing you would expect to see in a pre-war hospital for rich people."
	gender = PLURAL
	singular_name = "advanced regenerative mesh"
	icon_state = "aloe_mesh"
	heal_burn = 15
	sanitization = 6
	flesh_regeneration = 12
	grind_results = list(/datum/reagent/consumable/aloejuice = 1)
	merge_type = /obj/item/stack/medical/mesh/advanced

/obj/item/stack/medical/mesh/advanced/one
	amount = 1

/obj/item/stack/medical/mesh/advanced/five
	amount = 5

/obj/item/stack/medical/mesh/Initialize()
	. = ..()
	if(amount == max_amount)	 //only seal full mesh packs
		is_open = FALSE
		update_icon()

/obj/item/stack/medical/mesh/advanced/update_icon_state()
	if(!is_open)
		icon_state = "aloe_mesh_closed"
	else
		return ..()

/obj/item/stack/medical/mesh/update_icon_state()
	if(!is_open)
		icon_state = "regen_mesh_closed"
	else
		return ..()

/obj/item/stack/medical/mesh/heal(mob/living/M, mob/user)
	. = ..()
	if(M.stat == DEAD)
		to_chat(user, "<span class='warning'>[M] is dead! You can not help [M.p_them()].</span>")
		return
	if(iscarbon(M))
		return heal_carbon(M, user, heal_brute, heal_burn)
	to_chat(user, "<span class='warning'>You can't heal [M] with \the [src]!</span>")


/obj/item/stack/medical/mesh/try_heal(mob/living/M, mob/user, silent = FALSE)
	if(!is_open)
		to_chat(user, "<span class='warning'>You need to open [src] first.</span>")
		return
	. = ..()

/obj/item/stack/medical/mesh/AltClick(mob/living/user)
	if(!is_open)
		to_chat(user, "<span class='warning'>You need to open [src] first.</span>")
		return
	. = ..()

/obj/item/stack/medical/mesh/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	if(!is_open && user.get_inactive_held_item() == src)
		to_chat(user, "<span class='warning'>You need to open [src] first.</span>")
		return
	. = ..()

/obj/item/stack/medical/mesh/attack_self(mob/user)
	if(!is_open)
		is_open = TRUE
		to_chat(user, "<span class='notice'>You open the sterile mesh package.</span>")
		update_icon()
		playsound(src, 'sound/items/poster_ripped.ogg', 20, TRUE)
		return
	. = ..()

/obj/item/stack/medical/mesh/aloe
	name = "aloe cream"
	desc = "A healing paste you can apply on wounds."

	icon_state = "aloe_paste"
	self_delay = 20
	other_delay = 10
	novariants = TRUE
	amount = 20
	max_amount = 20
	heal_burn = 4
	pain_amount = 4
	sanitization = 1
	flesh_regeneration = 4
	grind_results = list(/datum/reagent/consumable/aloejuice = 1)

/obj/item/stack/medical/mesh/aloe/five
	amount = 5

/obj/item/stack/medical/mesh/aloe/Initialize()
	. = ..()
	if(amount == max_amount)	 //aloe starts open lol
		is_open = TRUE
		update_icon()
