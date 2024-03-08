//Used to manage radios. Mirrored from original author: https://github.com/printer16

//Global list of radios
GLOBAL_LIST_EMPTY(faction_radios)
GLOBAL_LIST_EMPTY(vlt_radios)
GLOBAL_LIST_EMPTY(gmb_radios)
GLOBAL_LIST_EMPTY(dfs_radios)
GLOBAL_LIST_EMPTY(twn_radios)

/obj/machinery/radioterminal
	name = "radio control"
	desc = "A terminal used to remotely disable radios that may have been lost."
	icon = 'icons/obj/computer.dmi'
	icon_state = "computer"
	density = TRUE
	var/open = FALSE // TRUE if open
	var/assigned_faction
	max_integrity = 750

/obj/machinery/radioterminal/power_change()
	..()
	update_icon()

/obj/machinery/radioterminal/update_icon_state()
	if(CHECK_BITFIELD(stat, NOPOWER))
		set_light(0)
	else
		set_light(1.4, 0.7, "#ffda37")

/obj/machinery/radioterminal/ui_interact(mob/user)
	. = ..()
	if(open)
		return
	var/dat = ""
	dat += "<head><style>body {padding: 0; margin: 15px; background-color: #062113; color: #4aed92; line-height: 170%;} a, button, a:link, a:visited, a:active, .linkOn, .linkOff {color: #4aed92; text-decoration: none; background: #062113; border: none; padding: 1px 4px 1px 4px; margin: 0 2px 0 0; cursor:default;} a:hover {color: #062113; background: #4aed92; border: 1px solid #4aed92} a.white, a.white:link, a.white:visited, a.white:active {color: #4aed92; text-decoration: none; background: #4aed92; border: 1px solid #161616; padding: 1px 4px 1px 4px; margin: 0 2px 0 0; cursor:default;} a.white:hover {color: #062113; background: #4aed92;} .linkOn, a.linkOn:link, a.linkOn:visited, a.linkOn:active, a.linkOn:hover {color: #4aed92; background: #062113; border-color: #062113;} .linkOff, a.linkOff:link, a.linkOff:visited, a.linkOff:active, a.linkOff:hover{color: #4aed92; background: #062113; border-color: #062113;}</style></head><font face='courier'>"
	dat += "<center><b>ROBCO INDUSTRIES UNIFIED OPERATING SYSTEM v.85</b><br>"
	dat += "<b>COPYRIGHT 2075-2077 ROBCO INDUSTRIES</b><br><br><br><br>"
	switch(assigned_faction)
		if(FACTION_VLT)
			for(var/obj/item/radio/radio in GLOB.vlt_radios)
				if(radio.linked_mob)
					dat += "<a href='?src=[REF(src)];terminate=[REF(radio)]'> [radio.name] linked to [radio.linked_mob]<br>"
		if(FACTION_GMB)
			for(var/obj/item/radio/radio in GLOB.gmb_radios)
				if(radio.linked_mob)
					dat += "<a href='?src=[REF(src)];terminate=[REF(radio)]'> [radio.name] linked to [radio.linked_mob]<br>"
		if(FACTION_DFS)
			for(var/obj/item/radio/radio in GLOB.dfs_radios)
				if(radio.linked_mob)
					dat += "<a href='?src=[REF(src)];terminate=[REF(radio)]'> [radio.name] linked to [radio.linked_mob]<br>"
		if(FACTION_TWN)
			for(var/obj/item/radio/radio in GLOB.twn_radios)
				if(radio.linked_mob)
					dat += "<a href='?src=[REF(src)];terminate=[REF(radio)]'> [radio.name] linked to [radio.linked_mob]<br>"
	var/datum/browser/popup = new(user, "radio_console", "Radio Terminal")
	popup.set_content(dat)
	popup.open()

/obj/machinery/radioterminal/Topic(href, href_list)
	if(..())
		return
	if(!allowed(usr))
		to_chat(usr, "<span class='warning'>Access denied.</span>")
		return
	usr.set_machine(src)
	add_fingerprint(usr)
	if(href_list["terminate"])
		var/obj/item/radio/terminate = locate(href_list["terminate"]) in GLOB.faction_radios
		if(terminate.factionized && terminate.linked_mob && terminate.linked_faction == assigned_faction)
			terminate.kill_switch()
			switch(assigned_faction)
				if(FACTION_VLT)
					LAZYREMOVE(GLOB.vlt_radios, terminate)
				if(FACTION_GMB)
					LAZYREMOVE(GLOB.gmb_radios, terminate)
				if(FACTION_DFS)
					LAZYREMOVE(GLOB.dfs_radios, terminate)
				if(FACTION_TWN)
					LAZYREMOVE(GLOB.twn_radios, terminate)
	updateUsrDialog()
	return

/obj/machinery/radioterminal/attackby(obj/item/O, mob/user, params)
	if(istype(O, /obj/item/wrench))
		if(anchored)
			to_chat(user, "<span class='notice'>You unsecure the terminal.</span>")
			anchored = FALSE
		else
			to_chat(user, "<span class='notice'>You secure the terminal.</span>")
			anchored = TRUE
		update_icon()
		return
	if(istype(O, /obj/item/crowbar))
		if(open)
			to_chat(user, "<span class='notice'>You close the maintenance panel.</span>")
			open = FALSE
		else
			to_chat(user, "<span class='notice'>You open the maintenance panel.</span>")
			open = TRUE
		update_icon()
		return
	if(istype(O, /obj/item/radio))
		var/obj/item/radio/new_radio = O
		if(new_radio.factionized && new_radio.linked_faction == assigned_faction && !new_radio.linked_mob)
			to_chat(user, "<span class='notice'>The radio has been linked!</span>")
			new_radio.linked_mob = user
			new_radio.kill_switched = FALSE
			new_radio.Factionize()
		return

/obj/machinery/radioterminal/vault
	name = "Vault radio control"
	assigned_faction = FACTION_VLT
	req_one_access = list(ACCESS_VFE)

/obj/machinery/radioterminal/gmb
	name = "local radio control"
	assigned_faction = FACTION_GMB
	req_one_access = list(ACCESS_GMB)

/obj/machinery/radioterminal/dfs
	name = "local radio control"
	assigned_faction = FACTION_DFS
	req_one_access = list(ACCESS_DFS)

/obj/machinery/radioterminal/twn
	name = "local radio control"
	assigned_faction = FACTION_TWN
	req_one_access = list(ACCESS_TWN_RESTRICT)
