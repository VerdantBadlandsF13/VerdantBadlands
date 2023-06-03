/obj/effect/spawner/bundle
	name = "bundle spawner"
	icon = 'icons/mob/screen_gen.dmi'
	icon_state = "x2"
	color = "#00FF00"

	var/list/items

/obj/effect/spawner/bundle/Initialize(mapload)
	. = ..()
	if(items?.len)
		var/turf/T = get_turf(src)
		for(var/path in items)
			new path(T)
	return INITIALIZE_HINT_QDEL

/obj/effect/spawner/bundle/costume/gladiator
	name = "gladiator costume spawner"
	items = list(
		/obj/item/clothing/under/f13/raiderharness)

/obj/effect/spawner/bundle/costume/elpresidente
	name = "el presidente costume spawner"
	items = list(
		/obj/item/clothing/under/rank/captain/suit,
		/obj/item/clothing/head/flatcap,
		/obj/item/clothing/mask/cigarette/cigar/havana,
		/obj/item/clothing/shoes/f13/military)

/obj/effect/spawner/bundle/costume/nyangirl
	name = "nyangirl costume spawner"
	items = list(
		/obj/item/clothing/under/costume/schoolgirl,
		/obj/item/clothing/head/kitty,
		/obj/item/clothing/glasses/sunglasses/blindfold)

/obj/effect/spawner/bundle/costume/butler
	name = "butler costume spawner"
	items = list(
		/obj/item/clothing/accessory/waistcoat,
		/obj/item/clothing/under/suit/black)

/obj/effect/spawner/bundle/costume/highlander
	name = "highlander costume spawner"
	items = list(
		/obj/item/clothing/under/costume/kilt)

/obj/effect/spawner/bundle/costume/pirate
	name = "pirate costume spawner"
	items = list(
		/obj/item/clothing/under/costume/pirate,
		/obj/item/clothing/suit/pirate,
		/obj/effect/spawner/lootdrop/minor/pirate_or_bandana,
		/obj/item/clothing/glasses/eyepatch)

/obj/effect/spawner/bundle/costume/marisawizard
	name = "marisa wizard costume spawner"
	items = list(
		/obj/item/clothing/shoes/sandal,
		/obj/item/clothing/head/wizard/marisa/fake,
		/obj/item/clothing/suit/wizrobe/marisa/fake)

/obj/effect/spawner/bundle/costume/wizard
	name = "wizard costume spawner"
	items = list(
		/obj/item/clothing/shoes/sandal,
		/obj/item/clothing/suit/wizrobe/fake,
		/obj/item/clothing/head/wizard/fake,
		/obj/item/staff)

/obj/effect/spawner/bundle/crate/Initialize(mapload)
	SHOULD_CALL_PARENT(FALSE)
	if(flags_1 & INITIALIZED_1)
		stack_trace("Warning: [src]([type]) initialized multiple times!")
	flags_1 |= INITIALIZED_1
	if(items && items.len)
		var/turf/T = get_turf(src)
		var/obj/structure/closet/LC = locate(/obj/structure/closet) in T
		if(LC)
			for(var/path in items)
				new path(LC)
	return INITIALIZE_HINT_QDEL

/obj/effect/spawner/bundle/crate/mosin
	name = "Mosin-Nagant spawner"
	items = list(
		/obj/item/gun/ballistic/rifle/mosin,
		/obj/item/ammo_box/a762
	)

/obj/effect/spawner/bundle/crate/surplusrifle
	name = "surplus rifle spawner"
	items = list(
		/obj/item/ammo_box/magazine/m10mm/rifle
	)
