/datum/unit_test/merge_type/Run()
	var/list/blacklist = list(/obj/item/stack/sheet,
							  /obj/item/stack/sheet/mineral,
							  /obj/item/stack/ore,
							  /obj/item/stack/spacecash,
							  /obj/item/stack/spacecash/random,
							  /obj/item/stack/tile/mineral,
							  /obj/item/stack/tile,
							  /obj/item/stack/sheet/animalhide,
							  /obj/item/stack/crafting,
							  /obj/item/stack/prefabs,
							  /obj/item/stack/f13Cash/caps/fivezerozero,
							  /obj/item/stack/f13Cash/random/low,
							  /obj/item/stack/f13Cash/random/med,
							  /obj/item/stack/f13Cash/random/high,
							  /obj/item/stack/f13Cash/random/banker,
							  /obj/item/stack/f13Cash/random)

	var/list/paths = subtypesof(/obj/item/stack) - blacklist

	for(var/stackpath in paths)
		var/obj/item/stack/stack = stackpath
		if(!initial(stack.merge_type))
			Fail("([stack]) lacks set merge_type variable!")
