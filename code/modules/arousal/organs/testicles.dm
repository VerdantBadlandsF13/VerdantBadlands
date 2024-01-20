/obj/item/organ/genital/testicles
	name = "testicles"
	desc = "A male reproductive organ."
	icon_state = "testicles"
	icon = 'icons/obj/genitals/testicles.dmi'
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_TESTICLES
	size = BALLS_SIZE_MIN
	arousal_verb = "Your balls ache a little"
	unarousal_verb = "Your balls finally stop aching, again"
	linked_organ_slot = ORGAN_SLOT_PENIS
	genital_flags = CAN_MASTURBATE_WITH|MASTURBATE_LINKED_ORGAN|GENITAL_FLUID_PRODUCTION|UPDATE_OWNER_APPEARANCE|GENITAL_UNDIES_HIDDEN
	var/size_name = "average"
	shape = DEF_BALLS_SHAPE
	fluid_id = /datum/reagent/consumable/semen
	masturbation_verb = "massage"
	layer_index = TESTICLES_LAYER_INDEX

/obj/item/organ/genital/testicles/generate_fluid()
	if(!linked_organ && !update_link())
		return FALSE
	return ..()
	// in memoriam "Your balls finally feel full, again." ??-2020


/obj/item/organ/genital/testicles/upon_link()
//	size = linked_organ.size
	update_size()
	update_appearance()


/obj/item/organ/genital/testicles/update_size(modified = FALSE)
	var/new_size
	switch(size)
		if(BALLS_SIZE_MIN)
			size_name = "average"
			new_size = 1
		if(BALLS_SIZE_DEF)
			size_name = "enlarged"
			new_size = 2
		if(BALLS_SIZE_THD)//lol
			size_name = "enlarged"
			new_size = 3
		if(BALLS_SIZE_MAX)
			size_name = "engorged"
			new_size = 4
		else
			size_name = "nonexistant"
	size = new_size

/obj/item/organ/genital/testicles/update_appearance()
	. = ..()
	var/datum/sprite_accessory/S = GLOB.balls_shapes_list[shape]
	var/icon_shape = S ? S.icon_state : "single"
	icon_state = "testicles_[icon_shape]_[size]"
	if(owner)
		if(owner.dna.species.use_skintones && owner.dna.features["genitals_use_skintone"])
			if(ishuman(owner)) // Check before recasting type, although someone fucked up if you're not human AND have use_skintones somehow...
				var/mob/living/carbon/human/H = owner // only human mobs have skin_tone, which we need.
				color = SKINTONE2HEX(H.skin_tone)
				if(!H.dna.skin_tone_override)
					icon_state += "_s"
		else
			color = "#[owner.dna.features["balls_color"]]"

/obj/item/organ/genital/testicles/genital_examine(mob/user)
	. = list()
	. |= "<span class='notice'>You see an [size_name] pair of testicles.</span>"

/obj/item/organ/genital/testicles/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.species.use_skintones && D.features["genitals_use_skintone"])
		color = SKINTONE2HEX(H.skin_tone)
	else
		color = "#[D.features["balls_color"]]"
	shape = D.features["balls_shape"]
	size = D.features["balls_size"]
	fluid_rate = D.features["balls_cum_rate"]
	fluid_mult = D.features["balls_cum_mult"]
	fluid_efficiency = D.features["balls_efficiency"]

	var/datum/reagent/fluid = find_reagent_object_from_type(D.features["balls_fluid"])
	if(istype(fluid, /datum/reagent/blood))
		fluid_id = H.get_blood_id()
	else if(fluid && (fluid in GLOB.genital_fluids_list))
		fluid_id = D.features["balls_fluid"]

	toggle_visibility(D.features["balls_visibility"], FALSE)
