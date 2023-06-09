/* Gifts and wrapping paper
 * Contains:
 *		Gifts
 *		Wrapping Paper
 */

/*
 * Gifts
 */

GLOBAL_LIST_EMPTY(possible_gifts)

/obj/item/a_gift
	name = "gift"
	desc = "PRESENTS!!!! eek!"
	icon = 'icons/obj/storage.dmi'
	icon_state = "giftdeliverypackage3"
	item_state = "gift"
	resistance_flags = FLAMMABLE

/obj/item/a_gift/New()
	..()
	pixel_x = rand(-10,10)
	pixel_y = rand(-10,10)
	icon_state = "giftdeliverypackage[rand(1,5)]"

/obj/item/a_gift/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] peeks inside [src] and cries [user.p_them()]self to death! It looks like [user.p_they()] [user.p_were()] on the naughty list...</span>")
	return (BRUTELOSS)

/obj/item/a_gift/attack_self(mob/M)
	if(M && M.mind && M.mind.special_role == "Santa")
		to_chat(M, "<span class='warning'>You're supposed to be spreading gifts, not opening them yourself!</span>")
		return

	var/gift_type = get_gift_type()

	qdel(src)
	var/obj/item/I = new gift_type(M)
	M.put_in_hands(I)
	I.add_fingerprint(M)

/obj/item/a_gift/proc/get_gift_type()
	var/gift_type_list = list(/obj/item/stack/sheet/mineral/coal)

	gift_type_list += subtypesof(/obj/item/clothing/head/collectable)
	gift_type_list += subtypesof(/obj/item/toy) - (((typesof(/obj/item/toy/cards) - /obj/item/toy/cards/deck) + /obj/item/toy/figure + /obj/item/toy/ammo)) //All toys, except for abstract types and syndicate cards.

	var/gift_type = pick(gift_type_list)

	return gift_type


/obj/item/a_gift/anything
	name = "christmas gift"
	desc = "It could be anything!"

/obj/item/a_gift/anything/get_gift_type()
	if(!GLOB.possible_gifts.len)
		var/list/gift_types_list = subtypesof(/obj/item)
		for(var/V in gift_types_list)
			var/obj/item/I = V
			if((!initial(I.icon_state)) || (!initial(I.item_state)) || (initial(I.item_flags) & ABSTRACT))
				gift_types_list -= V
		GLOB.possible_gifts = gift_types_list
	var/gift_type = pick(GLOB.possible_gifts)

	return gift_type
