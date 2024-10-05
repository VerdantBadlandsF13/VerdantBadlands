//predominantly positive traits
//this file is named weirdly so that positive traits are listed above negative ones

/datum/quirk/alcohol_tolerance
	name = "Alcohol Tolerance"
	desc = "You become drunk more slowly and suffer fewer drawbacks from alcohol."
	value = 1
	mob_trait = TRAIT_ALCOHOL_TOLERANCE
	gain_text = "<span class='notice'>You feel like you could drink a whole keg!</span>"
	lose_text = "<span class='danger'>You don't feel as resistant to alcohol anymore. Somehow.</span>"
	medical_record_text = "Patient demonstrates a high tolerance for alcohol."

/datum/quirk/horrifying_tastes
	name = "Horrifying Tastes"
	desc = "You enjoy a fine sort of meal not often appreciated by your peers. To serve man, in all it's forms is your life's work. Put bluntly - you are a cannibal. Consuming human flesh doesn't bother you, and dishes such as longpork stew will heal you."
	mob_trait = TRAIT_LONGPORKLOVER
	value = 2
	gain_text = "<span class='notice'>You have an insatiable hunger for the flesh of your fellow man.</span>"
	lose_text = "<span class='notice'>The terrible hunger fades - you feel peace at last.</span>"
	medical_record_text = "Patient refuses to comment on their dietary preferences."

/datum/quirk/horrifying_tastes/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food |= LONGPORK
	species.disliked_food &= ~LONGPORK

/datum/quirk/horrifying_tastes/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food &= ~LONGPORK
		species.disliked_food |= LONGPORK

/datum/quirk/tribal
	name = "Former Tribal"
	desc = "You used to be part of one of the tribes scattered throughout the wasteland. You retain some of your tribal knowledge but the ancient crafts are lost to you as you became more modern."
	value = 3
	gain_text = "<span class='notice'>You remember the old ways of your tribe..</span>"
	lose_text = "<span class='notice'>You've forgotten the ways of your ancestors..</span>"

/datum/quirk/tribal/add()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_MACHINE_SPIRITS, "Former Tribal")
	ADD_TRAIT(H, TRAIT_TRIBAL, "Former Tribal")
	ADD_TRAIT(H, TRAIT_TRAPPER, "Former Tribal")

/datum/quirk/tribal/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(!QDELETED(H))
		REMOVE_TRAIT(H, TRAIT_MACHINE_SPIRITS, "Former Tribal")
		REMOVE_TRAIT(H, TRAIT_TRAPPER, "Former Tribal")
		REMOVE_TRAIT(H, TRAIT_TRIBAL, "Former Tribal")

/datum/quirk/tribespeak
	name = "Tribal Language Comprehension"
	desc = "You're somehow capable of understanding and speaking the common tribal languages in the area."
	value = 1
	gain_text = "<span class='notice'>You remember the old ways of your tribe..</span>"
	lose_text = "<span class='notice'>You've forgotten the ways of your ancestors..</span>"

/datum/quirk/tribespeak/add()
	var/mob/living/carbon/human/H = quirk_holder
	H.grant_language(/datum/language/tribal)

/datum/quirk/tribespeak/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(!QDELETED(H))
		H.remove_language(/datum/language/tribal)

/datum/quirk/apathetic
	name = "Apathetic"
	desc = "You just don't care as much as other people. That's nice to have in a place like this, I guess."
	value = 1
	mood_quirk = TRUE
	medical_record_text = "Patient was administered the Apathy Evaluation Scale but did not bother to complete it."

/datum/quirk/apathetic/add()
	var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
	if(mood)
		mood.mood_modifier = 0.8

/datum/quirk/apathetic/remove()
	if(quirk_holder)
		var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
		if(mood)
			mood.mood_modifier = 1 //Change this once/if species get their own mood modifiers.

/datum/quirk/drunkhealing
	name = "Drunken Resilience"
	desc = "Nothing like a good drink to make you feel on top of the world. Whenever you're drunk, you slowly recover from injuries."
	value = 2
	mob_trait = TRAIT_DRUNK_HEALING
	gain_text = "<span class='notice'>You feel like a drink would do you good.</span>"
	lose_text = "<span class='danger'>You no longer feel like drinking would ease your pain.</span>"
	medical_record_text = "Patient has unusually efficient liver metabolism and can slowly regenerate wounds by drinking alcoholic beverages."

/datum/quirk/empath
	name = "Empath"
	desc = "Whether it's a sixth sense or careful study of body language, it only takes you a quick glance at someone to understand how they feel."
	value = 2
	mob_trait = TRAIT_EMPATH
	gain_text = "<span class='notice'>You feel in tune with those around you.</span>"
	lose_text = "<span class='danger'>You feel isolated from others.</span>"
	medical_record_text = "Patient is highly perceptive of and sensitive to social cues, or may possibly have ESP. Further testing needed."

/datum/quirk/freerunning
	name = "Freerunning"
	desc = "You're great at quick moves! You can climb tables more quickly."
	value = 2
	mob_trait = TRAIT_FREERUNNING
	gain_text = "<span class='notice'>You feel lithe on your feet!</span>"
	lose_text = "<span class='danger'>You feel clumsy again.</span>"
	medical_record_text = "Patient scored highly on cardio tests."

/datum/quirk/friendly
	name = "Friendly"
	desc = "You give the best hugs, especially when you're in the right mood."
	value = 1
	mob_trait = TRAIT_FRIENDLY
	gain_text = "<span class='notice'>You want to hug someone.</span>"
	lose_text = "<span class='danger'>You no longer feel compelled to hug others.</span>"
	mood_quirk = TRUE
	medical_record_text = "Patient demonstrates low-inhibitions for physical contact and well-developed arms. Requesting another doctor take over this case."

/datum/quirk/jolly
	name = "Jolly"
	desc = "You sometimes just feel happy, for no reason at all."
	value = 1
	mob_trait = TRAIT_JOLLY
	mood_quirk = TRUE
	medical_record_text = "Patient demonstrates constant euthymia irregular for environment. It's a bit much, to be honest."

/datum/quirk/jolly/on_process()
	if(prob(0.05))
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "jolly", /datum/mood_event/jolly)

/datum/quirk/light_step
	name = "Light Step"
	desc = "You walk with a gentle step; stepping on sharp objects is quieter, less painful and you won't leave footprints behind you."
	value = 1
	mob_trait = TRAIT_LIGHT_STEP
	gain_text = "<span class='notice'>You walk with a little more litheness.</span>"
	lose_text = "<span class='danger'>You start tromping around like a barbarian.</span>"
	medical_record_text = "Patient's dexterity belies a strong capacity for stealth."

/datum/quirk/quick_step
	name = "Quick Step"
	desc = "You walk with determined strides, and out-pace most people when walking."
	value = 2
	mob_trait = TRAIT_SPEEDY_STEP
	gain_text = "<span class='notice'>You feel determined. No time to lose.</span>"
	lose_text = "<span class='danger'>You feel less determined. What's the rush, man?</span>"
	medical_record_text = "Patient scored highly on racewalking tests."

/datum/quirk/musician
	name = "Musician"
	desc = "You can tune handheld musical instruments to play melodies that clear certain negative effects and soothe the soul."
	value = 1
	mob_trait = TRAIT_MUSICIAN
	gain_text = "<span class='notice'>You know everything about musical instruments.</span>"
	lose_text = "<span class='danger'>You forget how musical instruments work.</span>"
	medical_record_text = "Patient brain scans show a highly-developed auditory pathway."

/datum/quirk/musician/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/choice_beacon/music/B = new(get_turf(H))
	H.put_in_hands(B)
	H.equip_to_slot_if_possible(B, SLOT_IN_BACKPACK)
	var/obj/item/musicaltuner/musicaltuner = new(get_turf(H))
	H.put_in_hands(musicaltuner)
	H.equip_to_slot_if_possible(musicaltuner, SLOT_IN_BACKPACK)
	H.regenerate_icons()

/datum/quirk/photographer
	name = "Photographer"
	desc = "You know how to handle a camera, shortening the delay between each shot."
	value = 1
	mob_trait = TRAIT_PHOTOGRAPHER
	gain_text = "<span class='notice'>You know everything about photography.</span>"
	lose_text = "<span class='danger'>You forget how photo cameras work.</span>"
	medical_record_text = "Patient mentions photography as a stress-relieving hobby."

/datum/quirk/photographer/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/camera/camera = new(get_turf(H))
	H.put_in_hands(camera)
	H.equip_to_slot(camera, SLOT_NECK)
	H.regenerate_icons()

/datum/quirk/selfaware
	name = "Self-Aware"
	desc = "You know your body well, and can accurately assess the extent of your wounds."
	value = 2
	mob_trait = TRAIT_SELF_AWARE
	medical_record_text = "Patient demonstrates an uncanny knack for self-diagnosis."

/datum/quirk/skittish
	name = "Skittish"
	desc = "You can conceal yourself in danger. Ctrl-shift-click a closed locker to jump into it, as long as you have access."
	value = 2
	mob_trait = TRAIT_SKITTISH
	medical_record_text = "Patient demonstrates a high aversion to danger and has described hiding in containers out of fear."

/datum/quirk/spiritual
	name = "Spiritual"
	desc = "You're in tune with the gods, and your prayers may be more likely to be heard. Or not."
	value = 1
	mob_trait = TRAIT_SPIRITUAL
	gain_text = "<span class='notice'>You feel a little more faithful to the gods today.</span>"
	lose_text = "<span class='danger'>You feel less faithful in the gods.</span>"
	medical_record_text = "Patient reports a belief in a higher power."

/datum/quirk/tagger
	name = "Tagger"
	desc = "You're an experienced artist. While drawing graffiti, you can get twice as many uses out of drawing supplies."
	value = 1
	mob_trait = TRAIT_TAGGER
	gain_text = "<span class='notice'>You know how to tag walls efficiently.</span>"
	lose_text = "<span class='danger'>You forget how to tag walls properly.</span>"
	medical_record_text = "Patient was recently seen for possible paint huffing incident."

/datum/quirk/tagger/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/toy/crayon/spraycan/spraycan = new(get_turf(H))
	H.put_in_hands(spraycan)
	H.equip_to_slot(spraycan, SLOT_IN_BACKPACK)
	H.regenerate_icons()

/datum/quirk/voracious
	name = "Voracious"
	desc = "Nothing gets between you and your food. You eat twice as fast as everyone else!"
	value = 1
	mob_trait = TRAIT_VORACIOUS
	gain_text = "<span class='notice'>You feel HONGRY.</span>"
	lose_text = "<span class='danger'>You no longer feel HONGRY.</span>"
	medical_record_text = "Patient demonstrates a disturbing capacity for eating."

/datum/quirk/bloodpressure
	name = "Polycythemia vera"
	desc = "You've a treated form of Polycythemia vera that increases the total blood volume inside of you as well as the rate of replenishment!"
	value = 2 //I honeslty dunno if this is a good trait? I just means you use more of medbays blood and make janitors madder, but you also regen blood a lil faster.
	mob_trait = TRAIT_HIGH_BLOOD
	gain_text = "<span class='notice'>You feel full of blood!</span>"
	lose_text = "<span class='notice'>You feel like your blood pressure went down.</span>"
	medical_record_text = "Patient's blood tests report an abnormal concentration of red blood cells in their bloodstream."

/datum/quirk/bloodpressure/add()
	quirk_holder.blood_ratio = 1.2
	quirk_holder.blood_volume += 150

/datum/quirk/bloodpressure/remove()
	if(quirk_holder)
		quirk_holder.blood_ratio = 1

/datum/quirk/nukalover
	name = "Nuka Fiend"
	desc = "You are a fan of America's most popular pre-war soft drink. Your body simply loves the sugary drink so much, it rejects healthier alternatives."
	value = 2
	mob_trait = TRAIT_NUKA_LOVER
	gain_text = "<span class='notice'>You want to buy the whole world a nuka-cola!</span>"
	lose_text = "<span class='danger'>What's the big deal about nuka-cola?</span>"
	medical_record_text = "Patient has an addiction to the soft drink Nuka-Cola. Somehow, their metabolism has adapted to the sugars and artifical flavorings."

/datum/quirk/nukalover/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food |= NUKA
	species.disliked_food |= VEGETABLES

/datum/quirk/nukalover/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food = initial(species.liked_food)
		species.disliked_food = initial(species.disliked_food)

/////////////////
// Item Traits //
/////////////////
/datum/quirk/random_explosive
	name = "Scavenged Explosive"
	desc = "You've managed to procure explosives, via some means or another. Try not to blow yourself up."
	value = 2
	var/obj/item/trait_item
	var/where_to_give

/datum/quirk/random_explosive/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	trait_item = pick(
		/obj/item/grenade/f13/stinger,
		/obj/item/grenade/f13/frag,
		/obj/item/grenade/f13/he_grenade,
		/obj/item/grenade/f13/incendiary,
		/obj/item/grenade/f13/dynamite,
		/obj/item/grenade/plastic/c4,
		/obj/item/grenade/homemade/coffeepotbomb,
		/obj/item/grenade/homemade/firebomb,
		/obj/item/reagent_containers/food/drinks/bottle/molotov/filled,
		/obj/item/grenade/f13/plasma/remnant)//Fingers crossed they don't get this. :)
	trait_item = new trait_item(get_turf(quirk_holder))
	var/list/slots = list(
		"in your left pocket" = SLOT_L_STORE,
		"in your right pocket" = SLOT_R_STORE,
		"in your backpack" = SLOT_IN_BACKPACK

	)
	where_to_give = H.equip_in_one_of_slots(trait_item, slots, FALSE) || "at your feet"

/datum/quirk/random_chem
	name = "Scavenged Chems"
	desc = "You've managed to scrounge up some chems. Try not to take them all at once."
	value = 1
	var/obj/item/trait_item
	var/where_to_give

/datum/quirk/random_chem/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	trait_item = pick(
		/obj/item/reagent_containers/hypospray/medipen/stimpak,
		/obj/item/reagent_containers/hypospray/medipen/stimpak/imitation,
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super,
		/obj/item/reagent_containers/hypospray/medipen/medx,
		/obj/item/reagent_containers/hypospray/medipen/psycho,
		/obj/item/reagent_containers/hypospray/medipen/jet,
		/obj/item/reagent_containers/hypospray/medipen/turbo,
		/obj/item/storage/pill_bottle/chem_tin/mentats,
		/obj/item/storage/pill_bottle/chem_tin/fixer,
		/obj/item/storage/pill_bottle/chem_tin/radx,
		/obj/item/storage/pill_bottle/chem_tin/buffout)
	trait_item = new trait_item(get_turf(quirk_holder))
	var/list/slots = list(
		"in your left pocket" = SLOT_L_STORE,
		"in your right pocket" = SLOT_R_STORE,
		"in your backpack" = SLOT_IN_BACKPACK

	)
	where_to_give = H.equip_in_one_of_slots(trait_item, slots, FALSE) || "at your feet"

/datum/quirk/random_weapon
	name = "Scavenged Weapon"
	desc = "You've managed to pry this weapon from an old corpse's hands. Perhaps it's worth something? There's no guessing the condition it's in until you get a good look at it."
	value = 2
	var/obj/item/trait_item
	var/where_to_give

/datum/quirk/random_weapon/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	trait_item = pick(
		/obj/item/gun/ballistic/automatic/pistol/type17,
		/obj/item/gun/ballistic/automatic/pistol/ninemil,
		/obj/item/gun/ballistic/rifle/hunting,
		/obj/item/gun/ballistic/rifle/mosin,
		/obj/item/gun/ballistic/revolver/caravan_shotgun,
		/obj/item/gun/ballistic/revolver/widowmaker,
		/obj/item/gun/ballistic/automatic/autopipe,
		/obj/item/gun/ballistic/automatic/smg/american180)
	trait_item = new trait_item(get_turf(quirk_holder))
	var/list/slots = list(
		"in your left pocket" = SLOT_L_STORE,
		"in your right pocket" = SLOT_R_STORE,
		"in your backpack" = SLOT_IN_BACKPACK

	)
	where_to_give = H.equip_in_one_of_slots(trait_item, slots, FALSE) || "at your feet"

/datum/quirk/stims
	name = "Double Stims"
	desc = "You've saved two stims for a rainy day. Now, of all times, they might be needed."
	value = 2
	var/obj/item/trait_item
	var/where_to_give

/datum/quirk/stims/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	trait_item = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak,
		/obj/item/reagent_containers/hypospray/medipen/stimpak)
	trait_item = new trait_item(get_turf(quirk_holder))
	var/list/slots = list(
		"in your left pocket" = SLOT_L_STORE,
		"in your right pocket" = SLOT_R_STORE,
		"in your backpack" = SLOT_IN_BACKPACK

	)
	where_to_give = H.equip_in_one_of_slots(trait_item, slots, FALSE) || "at your feet"
