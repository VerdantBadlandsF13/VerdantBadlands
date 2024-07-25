/obj/item/clothing/head/powdered_wig
	name = "powdered wig"
	desc = "A powdered wig."
	icon_state = "pwig"
	item_state = "pwig"

/obj/item/clothing/head/redcoat
	name = "redcoat's hat"
	icon_state = "redcoat"
	desc = "<i>'I guess it's a redhead.'</i>"

/obj/item/clothing/head/nursehat
	name = "nurse's hat"
	desc = "It allows quick identification of trained medical personnel."
	icon_state = "nursehat"
	dynamic_hair_suffix = ""

	dog_fashion = /datum/dog_fashion/head/nurse

/obj/item/clothing/head/justice
	name = "justice hat"
	desc = "Fight for what's righteous!"
	icon_state = "justicered"
	item_state = "justicered"
	flags_inv = HIDEHAIR|HIDEEARS|HIDEEYES|HIDEFACE|HIDEFACIALHAIR|HIDESNOUT
	flags_cover = HEADCOVERSEYES

/obj/item/clothing/head/rabbitears
	name = "rabbit ears"
	desc = "Wearing these makes you look useless, and only good for your sex appeal."
	icon_state = "bunny"
	dynamic_hair_suffix = ""
	dog_fashion = /datum/dog_fashion/head/rabbit

/obj/item/clothing/head/flatcap
	name = "flat cap"
	desc = "A working man's cap."
	icon_state = "flat_cap"
	item_state = "detective"

/obj/item/clothing/head/pirate
	name = "pirate hat"
	desc = "Yarr."
	icon_state = "pirate"
	item_state = "pirate"

	dog_fashion = /datum/dog_fashion/head/pirate
	beepsky_fashion = /datum/beepsky_fashion/pirate

/obj/item/clothing/head/pirate/captain
	name = "pirate captain hat"
	icon_state = "hgpiratecap"
	item_state = "hgpiratecap"

/obj/item/clothing/head/bandana
	name = "pirate bandana"
	desc = "Yarr."
	icon_state = "bandana"
	item_state = "bandana"
	dynamic_hair_suffix = ""

/obj/item/clothing/head/bowler
	name = "bowler-hat"
	desc = "Gentleman, elite aboard!"
	icon_state = "bowler"
	item_state = "bowler"
	dynamic_hair_suffix = ""

/obj/item/clothing/head/fedora
	name = "fedora"
	icon_state = "fedora"
	item_state = "fedora"
	desc = "A really cool hat if you're a mobster. A really lame hat if you're not."
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/small

	beepsky_fashion = /datum/beepsky_fashion/fedora

/obj/item/clothing/head/fedora/suicide_act(mob/user)
	if(user.gender == FEMALE)
		return 0
	var/mob/living/carbon/human/H = user
	user.visible_message("<span class='suicide'>[user] is donning [src]! It looks like [user.p_theyre()] trying to be nice to girls.</span>")
	user.say("M'lady.", forced = "fedora suicide")
	sleep(10)
	H.facial_hair_style = "Neckbeard"
	return(BRUTELOSS)

/obj/item/clothing/head/cone
	desc = "You can leave your friends behind."
	name = "safety cone"
	icon = 'icons/obj/janitor.dmi'
	icon_state = "cone"
	item_state = "cone"
	force = 1
	throwforce = 3
	throw_speed = 2
	throw_range = 5
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("warned", "cautioned", "smashed")
	resistance_flags = NONE
	dynamic_hair_suffix = ""

/obj/item/clothing/head/papersack
	name = "paper sack hat"
	desc = "A paper sack with crude holes cut out for eyes. Useful for hiding one's identity or ugliness."
	icon_state = "papersack"
	flags_inv = HIDEHAIR|HIDEFACE|HIDEEARS|HIDESNOUT

/obj/item/clothing/head/papersack/smiley
	desc = "A paper sack with crude holes cut out for eyes and a sketchy smile drawn on the front. Not creepy at all."
	icon_state = "papersack_smile"

/obj/item/clothing/head/cowboyhat
	name = "cowboy hat"
	desc = "A brown cowboy hat, yeehaw."
	icon_state = "cowboyhat"
	item_state = "cowboyhat"

	beepsky_fashion = /datum/beepsky_fashion/cowboy

/obj/item/clothing/head/hunter
	name = "bounty hunting hat"
	desc = "Ain't nobody gonna cheat the hangman in my town."
	icon_state = "hunter"
	item_state = "hunter"
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/head/maid
	name = "maid headband"
	desc = "Maid in the USA!"
	icon_state = "maid"
	item_state = "maid"
	dynamic_hair_suffix = ""

/obj/item/clothing/head/fluff/bandit
	name = "bandit hat"
	desc = "A black cowboy hat with a large brim, curved to the sides, and a silver eagle pinned to the front."
	icon_state = "bandit"
	item_state = "fedora"

/obj/item/clothing/head/fluff/gambler
	name = "gambler hat"
	desc = "Perfect for a ramblin' gamblin' man." //But I got to ramble (ramblin' man) //Oh I got to gamble (gamblin' man) //Got to got to ramble (ramblin' man) //I was born a ramblin' gamblin' man
	icon_state = "gambler"
	item_state = "dethat"

/obj/item/clothing/head/rainbowbunchcrown
	name = "rainbow flower crown"
	desc = "A flower crown made out of the flowers of the rainbow bunch plant."
	dynamic_hair_suffix = ""
	attack_verb = list("crowned")

/obj/item/clothing/head/rainbowbunchcrown/Initialize()
	. = ..()
	var/crown_type = rand(1,4)
	switch(crown_type)
		if(1)
			desc += " This one has red, yellow and white flowers."
			icon_state = "rainbow_bunch_crown_1"
		if(2)
			desc += " This one has blue, yellow, green and white flowers."
			icon_state = "rainbow_bunch_crown_2"
		if(3)
			desc += " This one has red, blue, purple and pink flowers."
			icon_state = "rainbow_bunch_crown_3"
		if(4)
			desc += " This one has yellow, green and white flowers."
			icon_state = "rainbow_bunch_crown_4"

//
// CROWNS
//

/obj/item/clothing/head/crown
	name = "crown"
	desc = "A crown fit for a king, a petty king maybe."
	icon_state = "crown"
	resistance_flags = FIRE_PROOF
	dynamic_hair_suffix = ""
	beepsky_fashion = /datum/beepsky_fashion/king

/obj/item/clothing/head/crown/fancy
	name = "magnificent crown"
	desc = "A crown worn by only the highest emperors of the <s>land</s> space."
	icon_state = "fancycrown"

/obj/item/clothing/head/sunflowercrown
	name = "sunflower crown"
	desc = "A bright flower crown made out sunflowers that is sure to brighten up anyone's day!"
	icon_state = "sunflower_crown"
	dynamic_hair_suffix = ""
	attack_verb = list("crowned")

/obj/item/clothing/head/poppycrown
	name = "poppy crown"
	desc = "A flower crown made out of a string of bright red poppies."
	icon_state = "poppy_crown"
	dynamic_hair_suffix = ""
	attack_verb = list("crowned")

/obj/item/clothing/head/lilycrown
	name = "lily crown"
	desc = "A leafy flower crown with a cluster of large white lilies at at the front."
	icon_state = "lily_crown"
	dynamic_hair_suffix = ""
	attack_verb = list("crowned")

/*
 * BELOW THIS POINT:
 *		Welding mask
 *		Kitty ears
 *		Tinfoil hat
 */

/*
 * Welding mask
 */
/obj/item/clothing/head/welding
	name = "welding helmet"
	desc = "A head-mounted face cover designed to protect the wearer completely from arc eye."
	icon_state = "welding"
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	item_state = "welding"
	custom_materials = list(/datum/material/iron=1750, /datum/material/glass=400)
	flash_protect = 2
	tint = 2
	armor = list("tier" = 1, "energy" = 5, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	actions_types = list(/datum/action/item_action/toggle)
	visor_flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	visor_flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	resistance_flags = FIRE_PROOF
	mutantrace_variation = STYLE_MUZZLE

/obj/item/clothing/head/welding/attack_self(mob/user)
	weldingvisortoggle(user)

/*
 * Kitty ears
 */
/obj/item/clothing/head/kitty
	name = "kitty ears"
	desc = "A pair of kitty ears. Meow!"
	icon_state = "kitty"
	color = "#999999"
	dynamic_hair_suffix = ""

	dog_fashion = /datum/dog_fashion/head/kitty
	beepsky_fashion = /datum/beepsky_fashion/cat

/obj/item/clothing/head/kitty/equipped(mob/living/carbon/human/user, slot)
	if(ishuman(user) && slot == SLOT_HEAD)
		update_icon(user)
		user.update_inv_head() //Color might have been changed by update_icon.
	..()

/obj/item/clothing/head/kitty/update_icon(mob/living/carbon/human/user)
	if(ishuman(user))
		add_atom_colour("#[user.hair_color]", FIXED_COLOUR_PRIORITY)

/obj/item/clothing/head/kitty/genuine
	desc = "A pair of kitty ears. A tag on the inside says \"Hand made from real cats.\""

/obj/item/clothing/head/foilhat
	name = "tinfoil hat"
	desc = "Thought control rays, psychotronic scanning. Don't mind that, I'm protected cause I made this hat."
	icon_state = "foilhat"
	item_state = "foilhat"
	equip_delay_other = 140
	var/datum/brain_trauma/mild/phobia/conspiracies/paranoia
	var/warped = FALSE
	clothing_flags = IGNORE_HAT_TOSS

/obj/item/clothing/head/foilhat/Initialize(mapload)
	. = ..()
	if(!warped)
		AddComponent(/datum/component/anti_magic, FALSE, FALSE, TRUE, ITEM_SLOT_HEAD, 6, TRUE, null, CALLBACK(src, PROC_REF(warp_up)))
	else
		warp_up()

/obj/item/clothing/head/foilhat/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot != SLOT_HEAD || warped)
		return
	if(paranoia)
		QDEL_NULL(paranoia)
	paranoia = new()
	paranoia.clonable = FALSE
	user.gain_trauma(paranoia, TRAUMA_RESILIENCE_MAGIC)
	to_chat(user, "<span class='warning'>As you don the foiled hat, an entire world of conspiracy theories and seemingly insane ideas suddenly rush into your mind. What you once thought unbelievable suddenly seems.. undeniable. Everything is connected and nothing happens just by accident. You know too much and now they're out to get you. </span>")

/obj/item/clothing/head/foilhat/MouseDrop(atom/over_object)
	//God Im sorry
	if(!warped && iscarbon(usr))
		var/mob/living/carbon/C = usr
		if(src == C.head)
			to_chat(C, "<span class='userdanger'>Why would you want to take this off? Do you want them to get into your mind?!</span>")
			return
	return ..()

/obj/item/clothing/head/foilhat/dropped(mob/user)
	. = ..()
	if(paranoia)
		QDEL_NULL(paranoia)

/obj/item/clothing/head/foilhat/proc/warp_up()
	name = "scorched tinfoil hat"
	desc = "A badly warped up hat. Quite unprobable this will still work against any of fictional and contemporary dangers it used to."
	warped = TRUE
	if(!isliving(loc) || !paranoia)
		return
	var/mob/living/target = loc
	if(target.get_item_by_slot(SLOT_HEAD) != src)
		return
	QDEL_NULL(paranoia)
	if(!target.IsUnconscious())
		to_chat(target, "<span class='warning'>Your zealous conspirationism rapidly dissipates as the donned hat warps up into a ruined mess. All those theories starting to sound like nothing but a ridicolous fanfare.</span>")

/obj/item/clothing/head/foilhat/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	if(!warped && iscarbon(user))
		var/mob/living/carbon/C = user
		if(src == C.head)
			to_chat(user, "<span class='userdanger'>Why would you want to take this off? Do you want them to get into your mind?!</span>")
			return
	return ..()

/obj/item/clothing/head/foilhat/microwave_act(obj/machinery/microwave/M)
	. = ..()
	if(!warped)
		warp_up()
