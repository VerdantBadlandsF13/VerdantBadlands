// Contains items intended for eldritch themed locations.
// The initial item here is a D20, rethemed.
// As of current, it just kills the person using it and curses the rest.
// Not intended for actual gameplay, just like the eldritch locations.

/obj/item/eldritch_deal
	name = "\improper Crusader's Vow"
	desc = "Using this is not a good idea. At all."
	icon = 'modular_badlands/code/modules/unsorted/icons/items.dmi'
	icon_state = "rusty_medalion"
	var/deals = 20
	var/result = null
	var/reusable = 0
	var/used = 0
	var/comment = ""

/obj/item/eldritch_deal/attack_self(mob/user)
	deal_dealt(user)

/obj/item/eldritch_deal/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	deal_dealt(thrownby)
	. = ..()

/obj/item/eldritch_deal/proc/deal_dealt(mob/user)
	result = rand(deals)
	if(user != null)
		user.visible_message("[user] has used [src]. It briefly bursts into a ball of light. [comment]")
	else if(!src.throwing)
		visible_message("<span class='notice'>[src] briefly bursts into a ball of light. [comment]</span>")

/obj/item/eldritch_deal/deal_dealt(mob/user)
	..()
	if(!used)
		if(!ishuman(user))
			to_chat(user, "<span class='warning'>You feel the magic of a [src] is restricted to ordinary humans!</span>")
			return
		else
			flick(icon_state + "pierced_illusion", src)
			playsound(src.loc, 'modular_badlands/code/modules/unsorted/sound/vow_use.ogg', 50, 1)
			effect(user,result)
			soulbind()
			if(!reusable)
				qdel(src)

/obj/item/eldritch_deal/proc/soulbind()
	flash_lighting_fx(FLASH_LIGHT_RANGE, light_power, light_color)
	for (var/mob/living/L in viewers(src, null))
		L.apply_crusader_curse()
		L.soundbang_act(1, 200, 10, 15)

/obj/item/eldritch_deal/proc/effect(mob/living/carbon/human/user)
	switch(result)
		if(1)
			//Death
			comment = ""
			user.death()
		if(2)
			//Death
			comment = ""
			user.death()
		if(3)
			//Death
			comment = ""
			user.death()
		if(4)
			//Death
			comment = ""
			user.death()
		if(5)
			//Death
			comment = ""
			user.death()
		if(6)
			//Death
			comment = ""
			user.death()
		if(7)
			//Death
			comment = ""
			user.death()
		if(8)
			//Death
			comment = ""
			user.death()
		if(9)
			//Death
			comment = ""
			user.death()
		if(10)
			//Death
			comment = ""
			user.death()
		if(11)
			//Death
			comment = ""
			user.death()
		if(12)
			//Death
			comment = ""
			user.death()
		if(13)
			//Death
			comment = ""
			user.death()
		if(14)
			//Death
			comment = ""
			user.death()
		if(15)
			//Death
			comment = ""
			user.death()
		if(16)
			//Death
			comment = ""
			user.death()
		if(17)
			//Death
			comment = ""
			user.death()
		if(18)
			//Death
			comment = ""
			user.death()
		if(19)
			//Death
			comment = ""
			user.death()
		if(20)
			//Death
			comment = ""
			user.death()
