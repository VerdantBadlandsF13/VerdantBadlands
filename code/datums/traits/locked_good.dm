/*
Intended for disabled quirks of the respective type.
Only here for sorting, until I rework the system entirely. - Carl
*/

/datum/quirk/tribal_tech
	name = "Primitive Tech"
	desc = "You're able to use primitive technology."
	value = 2
	mob_trait = TRAIT_MACHINE_SPIRITS
	gain_text = "<span class='notice'>You are now able to use primitive technology.</span>"
	lose_text = "<span class='danger'>You are no longer able to use primitive technology.</span>"
	locked = TRUE

/datum/quirk/night_vision
	name = "Night Vision"
	desc = "You can see slightly more clearly in full darkness than most people."
	value = 1
	mob_trait = TRAIT_NIGHT_VISION
	gain_text = "<span class='notice'>The shadows seem a little less dark.</span>"
	lose_text = "<span class='danger'>Everything seems a little darker.</span>"
	locked = TRUE

/datum/quirk/night_vision/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.update_sight()

/datum/quirk/trapper
	name = "Trapper"
	desc = "As an experienced hunter and trapper you know your way around butchering animals for their products, and are able to get twice the usable materials by eliminating waste."
	value = 2
	mob_trait = TRAIT_TRAPPER
	gain_text = "<span class='notice'>You learn the secrets of butchering!</span>"
	lose_text = "<span class='danger'>You forget how to slaughter animals.</span>"
	locked = TRUE

/datum/quirk/bigleagues
	name = "Big Leagues"
	desc = "Swing for the fences! You deal additional damage with melee weapons."
	value = 2
	mob_trait = TRAIT_BIG_LEAGUES
	gain_text = "<span class='notice'>You feel like swinging for the fences!</span>"
	lose_text = "<span class='danger'>You feel like bunting.</span>"
	locked = TRUE

/datum/quirk/chemwhiz
	name = "Chem Whiz"
	desc = "You've been playing around with chemicals all your life. You know how to use chemistry machinery."
	value = 2
	mob_trait = TRAIT_CHEMWHIZ
	gain_text = "<span class='notice'>The mysteries of chemistry are revealed to you.</span>"
	lose_text = "<span class='danger'>You forget how the periodic table works.</span>"
	locked = TRUE

/datum/quirk/pa_wear
	name = "PA Wear"
	desc = "You've been around the wastes and have learned the importance of defense."
	value = 3
	mob_trait = TRAIT_PA_WEAR
	gain_text = "<span class='notice'>You realize how to use Power Armor.</span>"
	lose_text = "<span class='danger'>You forget how Power Armor works.</span>"
	locked = TRUE

/datum/quirk/hard_yards
	name = "Hard Yards"
	desc = "You've put them in, now reap the rewards."
	value = 3
	mob_trait = TRAIT_HARD_YARDS
	gain_text = "<span class='notice'>Rain or shine, nothing slows you down.</span>"
	lose_text = "<span class='danger'>You walk with a less sure gait, the ground seeming less firm somehow.</span>"
	locked = TRUE

/datum/quirk/lifegiver
	name = "Lifegiver"
	desc = "You embody wellness! Instantly gain +10 maximum Health"
	value = 3
	mob_trait = TRAIT_LIFEGIVER
	gain_text = "<span class='notice'>You feel more healthy than usual.</span>"
	lose_text = "<span class='danger'>You feel less healthy than usual.</span>"
	locked = TRUE

/datum/quirk/lifegiver/on_spawn()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.maxHealth += 10
	mob_tar.health += 10

/datum/quirk/iron_fist
	name = "Iron Fist"
	desc = "You have fists of kung-fury! Increases unarmed damage."
	value = 2
	mob_trait = TRAIT_IRONFIST
	gain_text = "<span class='notice'>Your fists feel furious!</span>"
	lose_text = "<span class='danger'>Your fists feel calm again.</span>"
	locked = TRUE

/datum/quirk/surgerylow
	name = "Minor Surgery"
	desc = "You are a somewhat adequate medical practicioner, capable of performing minor surgery."
	value = 1
	mob_trait = TRAIT_SURGERY_LOW
	gain_text = "<span class='notice'>You feel yourself discovering the basics of the human body.</span>"
	lose_text = "<span class='danger'>You forget how to perform even the simplest surgery.</span>"
	locked = TRUE

/datum/quirk/surgerymid
	name = "Intermediate Surgery"
	desc = "You are a skilled medical practicioner, capable of performing most surgery."
	value = 1
	mob_trait = TRAIT_SURGERY_MID
	gain_text = "<span class='notice'>You feel yourself discovering most of the details of the human body.</span>"
	lose_text = "<span class='danger'>You forget how to perform surgery.</span>"
	locked = TRUE

/datum/quirk/surgeryhigh
	name = "Complex Surgery"
	desc = "You are an expert practicioner, capable of performing almost all surgery."
	value = 1
	mob_trait = TRAIT_SURGERY_HIGH
	gain_text = "<span class='notice'>You feel yourself discovering the most intricate secrets of the human body.</span>"
	lose_text = "<span class='danger'>You forget your advanced surgical knowledge.</span>"
	locked = TRUE

/datum/quirk/explosive_crafting
	name = "Explosives Crafting"
	desc = "You have strong feelings about the future of industrial society."
	value = 1
	mob_trait = TRAIT_EXPLOSIVE_CRAFTING
	gain_text = "<span class='notice'>You feel like you can make a bomb out of anything.</span>"
	lose_text = "<span class='danger'You feel okay with the advancement of technology.</span>"
	locked = TRUE

/datum/quirk/advanced_explosive_crafting
	name = "Advanced Explosive Crafting"
	desc = "Decades of engineering knowledge have taught you to make all kinds of horrible explosives."
	value = 1
	mob_trait = TRAIT_ADVANCED_EXPLOSIVE_CRAFTING
	gain_text = "<span class='notice'>You're on the no-fly list.'</span>"
	lose_text = "<span class='danger'You feel like you're allowed to fly on planes again.</span>"
	locked = TRUE
