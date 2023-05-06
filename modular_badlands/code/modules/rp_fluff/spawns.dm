// Material in this file is intended to provide flavor for new spawns.
// This starts with the cryostasis pod spawn. Adjust as needed.
/obj/machinery/cryostasis/JoinPlayerHere(mob/living/carbon/human/H)
	if(!istype(H))
		return
	var/area/A = get_area(H)
	for(var/obj/machinery/cryostasis/C in A)
		if(!C.occupant)
			C.set_occupant(H, 1)
			H.setCloneLoss(rand(5,25)//Not quite a complete success. :)
			H.Sleeping(rand(1,6))
			return
	..()
