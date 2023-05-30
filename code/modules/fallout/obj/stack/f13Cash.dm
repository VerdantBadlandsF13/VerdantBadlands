#define maxCoinIcon 6
#define CASH_CAP 1

/* exchange rates X * CAP*/
#define CASH_VLT 100 /* 100 caps to 1 VLT */

// A low value cash spawn is on average worth 25
#define LOW_MIN 8
#define LOW_MAX 50

// A medium value cash spawn is on average worth 60ish
#define MED_MIN 40
#define MED_MAX 80

// A high value cash spawn is on average worth 280
#define HIGH_MIN 120
#define HIGH_MAX 440

/obj/item/stack/f13Cash //DO NOT USE THIS
	name = "bottle cap"
	singular_name = "cap"
	icon = 'icons/obj/economy.dmi'
	icon_state = "bottle_cap"
	amount = 1
	max_amount = 15000
	throwforce = 0
	throw_speed = 2
	throw_range = 2
	w_class = WEIGHT_CLASS_TINY
	full_w_class = WEIGHT_CLASS_TINY
	resistance_flags = FLAMMABLE
	var/flavor_desc =	"A standard Nuka-Cola bottle cap featuring 21 crimps and ridges. <br>\
	It's a staple of trade, used as common currency nearly everywhere in post-war America."
	var/value = CASH_CAP
	var/flippable = TRUE
	var/cooldown = 0
	var/coinflip
	var/list/sideslist = list("heads","tails")
	merge_type = /obj/item/stack/f13Cash

/obj/item/stack/f13Cash/attack_self(mob/user)
	if (flippable)
		if(cooldown < world.time)
			coinflip = pick(sideslist)
			cooldown = world.time + 15
			playsound(user.loc, 'sound/items/coinflip.ogg', 50, 1)
			var/oldloc = loc
			sleep(15)
			if(loc == oldloc && user && !user.incapacitated())
				user.visible_message("[user] has flipped [src]. It lands on [coinflip].", \
									"<span class='notice'>You flip [src]. It lands on [coinflip].</span>", \
									"<span class='italics'>You hear the clattering of loose change.</span>")
		return TRUE

/obj/item/stack/f13Cash/caps
	merge_type = /obj/item/stack/f13Cash/caps

/obj/item/stack/f13Cash/caps/fivezero
	amount = 50
	merge_type = /obj/item/stack/f13Cash/caps

/obj/item/stack/f13Cash/caps/onezerozero
	amount = 100
	merge_type = /obj/item/stack/f13Cash/caps

/obj/item/stack/f13Cash/caps/fivezerozero
	amount = 500
	merge_type = /obj/item/stack/f13Cash/caps

/obj/item/stack/f13Cash/caps/threefivezero
	amount = 350
	merge_type = /obj/item/stack/f13Cash/caps


/obj/item/stack/f13Cash/caps/onezerozerozero
	amount = 1000
	merge_type = /obj/item/stack/f13Cash/caps

/obj/item/stack/f13Cash/Initialize()
	. = ..()
	update_desc()
	update_icon()

/obj/item/stack/f13Cash/proc/update_desc()
	var/total_worth = get_item_credit_value()
	desc = "It's worth [total_worth] [singular_name][(( amount > 1 ) ? "s each" : "")].\n[flavor_desc]"

/obj/item/stack/f13Cash/get_item_credit_value()
	return (amount*value)

/obj/item/stack/f13Cash/merge(obj/item/stack/S)
	. = ..()
	update_desc()
	update_icon()

/obj/item/stack/f13Cash/use(used, transfer = FALSE, check = TRUE)
	. = ..()
	update_desc()
	update_icon()

/obj/item/stack/f13Cash/random
	var/money_type = /obj/item/stack/f13Cash/caps
	var/min_qty = LOW_MIN
	var/max_qty = LOW_MAX

/obj/item/stack/f13Cash/random/Initialize()
	..()
	spawn_money()
	return INITIALIZE_HINT_QDEL

/obj/item/stack/f13Cash/random/proc/spawn_money()
	var/obj/item/stack/f13Cash/stack = new money_type
	stack.loc = loc
	stack.amount = round(rand(min_qty, max_qty))
	stack.update_icon()

/* we have 6 icons, so we will use our own, instead of stack's   */
/obj/item/stack/f13Cash/update_icon()
	switch(amount)
		if(1)
			icon_state = "[initial(icon_state)]"
		if(2 to 5)
			icon_state = "[initial(icon_state)]2"
		if(6 to 50)
			icon_state = "[initial(icon_state)]3"
		if(51 to 100)
			icon_state = "[initial(icon_state)]4"
		if(101 to 500)
			icon_state = "[initial(icon_state)]5"
		if(501 to 15000)
			icon_state = "[initial(icon_state)]6"

/obj/item/stack/f13Cash/random/low
	min_qty = LOW_MIN / CASH_CAP
	max_qty = LOW_MAX / CASH_CAP

/obj/item/stack/f13Cash/random/med
	min_qty = MED_MIN / CASH_CAP
	max_qty = MED_MAX / CASH_CAP

/obj/item/stack/f13Cash/random/high
	min_qty = HIGH_MIN / CASH_CAP
	max_qty = HIGH_MAX / CASH_CAP

/obj/item/stack/f13Cash/vault
	name = "commissary token"
	singular_name = "token"
	icon_state = "spacecash"
	flavor_desc = "An incredibly valuable token, printed within the Vault's confines. <br>\
	If you're holding this, you're either one of their trade partners, or about to be shot."
	value = CASH_VLT * CASH_CAP
	merge_type = /obj/item/stack/f13Cash/vault

/obj/item/stack/f13Cash/random/vault
	money_type = /obj/item/stack/f13Cash/vault

#undef maxCoinIcon
#undef CASH_CAP
#undef CASH_VLT
#undef LOW_MIN
#undef LOW_MAX
#undef MED_MIN
#undef MED_MAX
#undef HIGH_MIN
#undef HIGH_MAX
