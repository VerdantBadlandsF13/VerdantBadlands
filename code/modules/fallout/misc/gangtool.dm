#define CASH_CAP_GANG 1

/* exchange rates X * CAP*/
#define CASH_VLT_GANG 100 /* 100 caps to 1 AUR */

//Gangtool device
/obj/item/device/gangtool
	name = "support radio"
	desc = "A handheld radio that allows you to contact underground suppliers. Suppliers are only willing to talk to the distributors directly."
	icon = 'icons/obj/radio.dmi'
	icon_state = "walkietalkie"
	item_state = "radio"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 3
	throw_range = 7
	flags_1 = CONDUCT_1
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/datum/gang/gang //Which gang uses this device?

/obj/item/device/gangtool/attack_self(mob/user)
	var/datum/gang/GA = user.gang
	if(!GA || GA.leader != user || GA != gang)
		to_chat(user, "<span class='warning'>Underground suppliers refuse to talk with you!</span>")
		return

	var/dat
	dat += "Title: <B>[gang.name]</B><br>"
	dat += "Your Influence: <B>[gang.influence]</B><br>"
	dat += "You can gain influence by doing various tasks, or by bribing underground suppliers by using valid currency.<br>"
	dat += "<hr>"

	dat += "<br>"
	dat +="<div class='statusDisplay'>"
	dat += "<b>Currency conversion rates:</b><br>"
	dat += "1 Bottle cap = [CASH_CAP_GANG] influence <br>"
	dat += "1 Commissary token = [CASH_VLT_GANG] influence <br>"
	dat += "</div>"
	dat += "<br>"

	gang.boss_item_list = list()
	for(var/V in gang.boss_items)
		var/datum/gang_item/G = new V()
		gang.boss_item_list[G.id] = G
		var/cost = G.get_cost_display(user, gang, src)
		if(cost)
			dat += cost + " "

		var/toAdd = G.get_name_display(user, gang, src)
		if(G.can_buy(user, gang, src))
			toAdd = "<a href='?src=\ref[src];purchase=[G.id]'>[toAdd]</a>"
		dat += toAdd
		var/extra = G.get_extra_info(user, gang, src)
		if(extra)
			dat += "<br><i>[extra]</i>"
		dat += "<br>"
	dat += "<br>"

	dat += "<a href='?src=\ref[src];choice=refresh'>Refresh</a><br>"

	var/datum/browser/popup = new(user, "supply_radio", "Welcome to the Network", 350, 625)
	popup.set_content(dat)
	popup.open()

/obj/item/device/gangtool/Topic(href, href_list)
	var/datum/gang/GA = usr.gang
	if(!GA || GA.leader != usr)
		to_chat(usr, "<span class='warning'>Underground suppliers refuse to talk with you!</span>")
		return

	add_fingerprint(usr)

	if(href_list["purchase"])
		var/datum/gang_item/G = gang.boss_item_list[href_list["purchase"]]
		if(G && G.can_buy(usr, gang, src))
			G.purchase(usr, gang, src, FALSE)

	attack_self(usr)

/obj/item/device/gangtool/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/stack/f13Cash))
		add_caps(I)
	else
		attack_hand(user)

/* Converting currency to the gang influence */
/obj/item/device/gangtool/proc/add_caps(obj/item/I)
	if(istype(I, /obj/item/stack/f13Cash))
		var/obj/item/stack/f13Cash/currency = I
		var/inserted_value = currency.amount * CASH_CAP_GANG
		gang.influence += inserted_value
		I.use(currency.amount)
		playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
		to_chat(usr, "You gain [inserted_value] influence by bribing underground suppliers.")
		attack_self(usr)
	else
		to_chat(usr, "Invalid currency! Do not try our patience!")
		return
