//IN THIS DOCUMENT: Pistol template, Light pistols, Heavy pistols
///////////////////
//PISTOL TEMPLATE//
///////////////////

/obj/item/gun/ballistic/automatic/pistol
	slowdown = 0
	name = "pistol template"
	desc = "should not be here. Bugreport."
	icon = 'icons/obj/guns/gunfruits2022/pistols.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	item_state = "gun"
	w_class = WEIGHT_CLASS_NORMAL //How much space it takes in a bag
	weapon_weight = WEAPON_MEDIUM //can only dual wield small pistols
	slot_flags = ITEM_SLOT_BELT
	force = 12 //Pistol whip
	mag_type = /obj/item/ammo_box/magazine/m10mm_adv/simple
	spread = 2
	burst_size = 1
	fire_delay = 0
	select = FALSE
	automatic_burst_overlay = FALSE
	can_automatic = FALSE
	semi_auto = TRUE
	can_suppress = TRUE
	equipsound = 'sound/f13weapons/equipsounds/pistolequip.ogg'

/obj/item/gun/ballistic/automatic/pistol/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/pistol/update_icon_state()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"

/obj/item/gun/ballistic/automatic/pistol/suppressed/Initialize(mapload)
	. = ..()
	var/obj/item/suppressor/S = new(src)
	install_suppressor(S)



/////////////////
//LIGHT PISTOLS//
/////////////////

/obj/item/gun/ballistic/automatic/pistol/pistol22
	name = "\improper Ruger Mk. IV"
	desc = "A Ruger Mk. IV competition/hunting handgun chambered for the .22LR round."
	icon_state = "silenced22"
	mag_type = /obj/item/ammo_box/magazine/m22
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_TINY
	can_attachments = TRUE
	can_suppress = FALSE
	can_unsuppress = FALSE
	suppressed = 1
	fire_sound = 'sound/f13weapons/22pistol.ogg'
	extra_damage = 5

/obj/item/gun/ballistic/automatic/pistol/n99
	name = "Colt N99"
	desc = "The Colt N99, an easily maintained, large-framed, long-barreled combat pistol in use by the US Army before the war. <br>\
	Comes with an integrated laser sight module."
	icon_state = "n99"
	mag_type = /obj/item/ammo_box/magazine/m10mm_adv/simple
	fire_delay = 1
	recoil = 0.05
	can_attachments = TRUE
	can_automatic = TRUE
	suppressor_state = "n99_suppressor"
	suppressor_x_offset = 29
	suppressor_y_offset = 15
	fire_sound = 'sound/f13weapons/10mm_fire_02.ogg'
	extra_damage = 6

/obj/item/gun/ballistic/automatic/pistol/type17
	name = "\improper Type-17"
	desc = "A standard issue Chinese Type-17 combat pistol, hacked apart and turned into a magazine-fed 10mm self-loader."
	icon_state = "chinapistol"
	mag_type = /obj/item/ammo_box/magazine/m10mm_adv/simple
	fire_delay = 1
	recoil = 0.1
	spread = 3
	can_suppress = FALSE
	fire_sound = 'sound/f13weapons/10mm_fire_02.ogg'

/obj/item/gun/ballistic/automatic/pistol/ninemil
	name = "\improper Browning Hi-Power"
	desc = "The gold standard of nine-millimeter pistols, the Browning Hi-Power. \
	Manufactured by FN Herstal prior to the war, it's reliable, even today."
	icon_state = "ninemil"
	mag_type = /obj/item/ammo_box/magazine/m9mmds
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_SMALL
	can_attachments = TRUE
	suppressor_state = "pistol_suppressor"
	suppressor_x_offset = 30
	suppressor_y_offset = 19
	fire_sound = 'sound/f13weapons/ninemil.ogg'
	extra_damage = 5

//Hi-Power+						Keywords: 9mm, Semi-auto. Special modifiers: spread -1
/obj/item/gun/ballistic/automatic/pistol/beretta
	name = "\improper P-Sec Browning Hi-Power"
	desc = "A combat modification of the standard Browning Hi-Power, made for private security firms. It features a longer barrel and a heavier trigger pull."
	icon_state = "beretta"
	mag_type = /obj/item/ammo_box/magazine/m9mmds
	weapon_weight = WEAPON_LIGHT
	spread = 1
	can_attachments = TRUE
	can_suppress = "pistol_suppressor"
	suppressor_x_offset = 30
	suppressor_y_offset = 20
	fire_sound = 'sound/f13weapons/9mm.ogg'
	extra_damage = 8

/obj/item/gun/ballistic/automatic/pistol/beretta/automatic
	name = "\improper Beretta 93R"
	desc = "An automatic 9mm pistol, featuring a fix muzzle brake."
	icon_state = "m93r"
	fire_delay = 2
	burst_size = 2
	burst_shot_delay = 2.5
	spread = 9
	recoil = 0.2
	actions_types = list(/datum/action/item_action/toggle_firemode)
	automatic_burst_overlay = TRUE
	can_attachments = FALSE
	semi_auto = FALSE

/obj/item/gun/ballistic/automatic/pistol/beretta/automatic/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			burst_size = 2
			spread = 9
			recoil = 0.1
			weapon_weight = WEAPON_HEAVY
			to_chat(user, "<span class='notice'>You switch to automatic fire.</span>")
		if(1)
			select = 0
			burst_size = 1
			spread = 1
			recoil = 0
			weapon_weight = WEAPON_MEDIUM
			to_chat(user, "<span class='notice'>You switch to semi-auto.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return

/obj/item/gun/ballistic/automatic/pistol/m1911
	name = "\improper M1911"
	desc = "The expertly designed, reliable Colt M1911 pistol. \
	It pushed its might through two World Wars, and even into Vietnam - where it soon fell into irrelevancy. But as they say, they don't make a fourty-six."
	icon_state = "m1911"
	item_state = "pistolchrome"
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 2
	slowdown = 0.05
	mag_type = /obj/item/ammo_box/magazine/m45
	recoil = 0.15
	can_attachments = TRUE
	suppressor_state = "pistol_suppressor"
	suppressor_x_offset = 30
	suppressor_y_offset = 21
	fire_sound = 'sound/f13weapons/45revolver.ogg'
	extra_damage = 5

/obj/item/gun/ballistic/automatic/pistol/mk23
	name = "\improper Mk. 23 SOCOM"
	desc = "The Mk. 23 SOCOM, manufactured by Heckler & Koch. A pre-war wonder, and deserving of its rightful throne among .45 combat handguns."
	icon_state = "mk23"
	mag_type = /obj/item/ammo_box/magazine/m45exp
	fire_delay = 2
	slowdown = 0.07
	spread = 1
	can_flashlight = TRUE
	gunlight_state = "flight"
	flight_x_offset = 16
	flight_y_offset = 13
	suppressor_state = "pistol_suppressor"
	suppressor_x_offset = 28
	suppressor_y_offset = 20
	fire_sound = 'sound/f13weapons/45revolver.ogg'
	extra_damage = 3



/////////////////
//HEAVY PISTOLS//
/////////////////

/obj/item/gun/ballistic/automatic/pistol/deagle
	name = "\improper MK. XIX Desert Eagle"
	desc = "A MK. XIX Desert Eagle, manufactured by Magnum Research and chambered in .44 caliber. \
	It's expensive, too heavy, and almost entirely impractical. Unrestrained exhibition - terrifying potency."
	icon_state = "deagle"
	item_state = "deagle"
	mag_type = /obj/item/ammo_box/magazine/m44
	fire_delay = 3
	force = 15
	extra_speed = 300
	recoil = 3.5 //Debilitating
	spread = 6
	extra_damage = 12
	extra_penetration = 0.12
	can_suppress = FALSE
	automatic_burst_overlay = FALSE
	fire_sound = 'sound/f13weapons/44mag.ogg'

/obj/item/gun/ballistic/automatic/pistol/deagle/automag
	name = "AMT AutoMag V"
	desc = "An expertly made pre-war handgun. \
	Chambered for .50 AE, the AMT AutoMag V is not to be scoffed at."
	icon_state = "automag"
	mag_type = /obj/item/ammo_box/magazine/automag
	fire_delay = 4
	extra_speed = 600
	recoil = 0.2
	can_suppress = FALSE
	automatic_burst_overlay = FALSE

//14mm Pistol		Keywords: 14mm, Semi-auto, 7 rounds, Heavy
/obj/item/gun/ballistic/automatic/pistol/pistol14
	name = "\improper Sig-Sauer 14mm Auto Pistol"
	desc = "A Sig-Sauer 14mm Auto Pistol. Large, singleshot handgun. Excellent craftsmanship."
	icon_state = "pistol14"
	mag_type = /obj/item/ammo_box/magazine/m14mm
	force = 15
	fire_delay = 5
	extra_damage = 11
	recoil = 2.2
	can_suppress = FALSE
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'
