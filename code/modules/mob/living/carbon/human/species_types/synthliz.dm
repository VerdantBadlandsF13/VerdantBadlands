/datum/species/synthliz
	name = "Synthetic Lizardperson"
	id = "synthliz"
	say_mod = "beeps"
	default_color = "00FF00"
	species_traits = list(MUTCOLORS,NOTRANSSTING,EYECOLOR,LIPS,HAIR,ROBOTIC_LIMBS)

	inherent_traits = list(TRAIT_RADIMMUNE, TRAIT_VIRUSIMMUNE, TRAIT_NOBREATH, TRAIT_NOHARDCRIT,
	TRAIT_NOSOFTCRIT, TRAIT_EASYDISMEMBER, TRAIT_EASYLIMBDISABLE, TRAIT_LIMBATTACHMENT,
	TRAIT_FAKEDEATH, TRAIT_NOHUNGER, TRAIT_NOTHIRST, TRAIT_NOPAIN, TRAIT_RESISTLOWPRESSURE, TRAIT_NOBREATH, TRAIT_AUXILIARY_LUNGS)

	inherent_biotypes = MOB_ROBOTIC|MOB_HUMANOID|MOB_REPTILE|MOB_SYNTH
	mutant_bodyparts = list("ipc_antenna" = "Synthetic Lizard - Antennae","mam_tail" = "Synthetic Lizard", "mam_snouts" = "Synthetic Lizard - Snout", "legs" = "Digitigrade", "mam_body_markings" = "Synthetic Lizard - Plates", "taur" = "None")
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/ipc
	gib_types = list(/obj/effect/gibspawner/ipc, /obj/effect/gibspawner/ipc/bodypartless)

	coldmod = 0.5
	heatmod = 1.2
	cold_offset = -125

	//Just robo looking parts.
	mutant_heart = /obj/item/organ/heart/ipc
	mutantlungs = /obj/item/organ/lungs/ipc
	mutantliver = /obj/item/organ/liver/ipc
	mutantstomach = /obj/item/organ/stomach/ipc
	mutanteyes = /obj/item/organ/eyes/ipc
	mutantears = /obj/item/organ/ears/ipc
	mutanttongue = /obj/item/organ/tongue/robot/ipc
	mutant_brain = /obj/item/organ/brain/ipc

	//special cybernetic organ for getting power from apcs
	mutant_organs = list(/obj/item/organ/cyberimp/arm/power_cord)

	exotic_bloodtype = "S"
	exotic_blood_color = BLOOD_COLOR_OIL

	tail_type = "mam_tail"
	wagging_type = "mam_waggingtail"
	species_type = "robotic"

/datum/species/synthliz/handle_chemicals(datum/reagent/chem, mob/living/carbon/human/H)
	if(chem.type == /datum/reagent/medicine/synthflesh)
		chem.reaction_mob(H, TOUCH, 2 ,0) //heal a little
		H.reagents.remove_reagent(chem.type, REAGENTS_METABOLISM)
		return TRUE
