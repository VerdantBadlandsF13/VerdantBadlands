/obj/item/clothing/under/costume/jabroni
	name = "Jabroni Outfit"
	desc = "The leather club is two blocks down."
	icon_state = "darkholme"
	item_state = "darkholme"
	can_adjust = FALSE

/obj/item/clothing/under/costume/schoolgirl
	name = "blue schoolgirl uniform"
	desc = "It's just like one of my Japanese animes!"
	icon_state = "schoolgirl"
	item_state = "schoolgirl"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/under/costume/schoolgirl/red
	name = "red schoolgirl uniform"
	icon_state = "schoolgirlred"
	item_state = "schoolgirlred"

/obj/item/clothing/under/costume/schoolgirl/green
	name = "green schoolgirl uniform"
	icon_state = "schoolgirlgreen"
	item_state = "schoolgirlgreen"

/obj/item/clothing/under/costume/schoolgirl/orange
	name = "orange schoolgirl uniform"
	icon_state = "schoolgirlorange"
	item_state = "schoolgirlorange"

/obj/item/clothing/under/costume/pirate
	name = "pirate outfit"
	desc = "Yarr."
	icon_state = "pirate"
	item_state = "pirate"
	can_adjust = FALSE

/obj/item/clothing/under/costume/soviet
	name = "soviet uniform"
	desc = "For the Motherland!"
	icon_state = "soviet"
	item_state = "soviet"
	can_adjust = FALSE

/obj/item/clothing/under/costume/redcoat
	name = "redcoat uniform"
	desc = "Looks old."
	icon_state = "redcoat"
	item_state = "redcoat"
	can_adjust = FALSE

/obj/item/clothing/under/costume/kilt
	name = "kilt"
	desc = "Includes shoes and plaid."
	icon_state = "kilt"
	item_state = "kilt"
	body_parts_covered = CHEST|GROIN|LEGS|FEET
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE

/obj/item/clothing/under/costume/kilt/highlander
	desc = "You're the only one worthy of this kilt."

/obj/item/clothing/under/costume/kilt/highlander/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, HIGHLANDER)

/obj/item/clothing/under/costume/kilt/polychromic
	name = "polychromic kilt"
	desc = "It's not a skirt!"
	icon_state = "polykilt"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/under/costume/kilt/polychromic/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, list("#FFFFFF", "#F08080"), 2)

/obj/item/clothing/under/costume/maid
	name = "maid costume"
	desc = "Maid in China."
	icon_state = "maid"
	item_state = "maid"
	body_parts_covered = CHEST|GROIN
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/under/costume/maid/Initialize()
	. = ..()
	var/obj/item/clothing/accessory/maidapron/A = new (src)
	attach_accessory(A)

/obj/item/clothing/under/costume/singer
	desc = "Just looking at this makes you want to sing."
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	body_parts_covered = CHEST|GROIN|ARMS
	alternate_worn_layer = ABOVE_SHOES_LAYER
	can_adjust = FALSE

/obj/item/clothing/under/costume/singer/yellow
	name = "yellow performer's outfit"
	icon_state = "ysing"
	item_state = "ysing"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = NO_FEMALE_UNIFORM
	can_adjust = FALSE

/obj/item/clothing/under/costume/singer/blue
	name = "blue performer's outfit"
	icon_state = "bsing"
	item_state = "bsing"
	alternate_worn_layer = ABOVE_SHOES_LAYER
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/under/costume/sailor
	name = "sailor suit"
	desc = "Skipper's in the wardroom drinkin gin'."
	icon_state = "sailor"
	item_state = "b_suit"
	can_adjust = FALSE

/obj/item/clothing/under/costume/russian_officer
	name = "\improper Russian officer's uniform"
	desc = "The latest in fashionable russian outfits."
	icon_state = "hostanclothes"
	item_state = "hostanclothes"

/obj/item/clothing/under/costume/mummy
	name = "mummy wrapping"
	desc = "Return the slab or suffer my stale references."
	icon_state = "mummy"
	item_state = "mummy"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	fitted = NO_FEMALE_UNIFORM
	can_adjust = FALSE
	resistance_flags = NONE
