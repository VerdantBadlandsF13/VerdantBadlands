//////////////////////////
// Salvaged Power Helms //
//////////////////////////

/obj/item/clothing/head/helmet/f13/salvaged_pa
	name = "salvaged power helmet"
	desc = "It's a salvaged power armor helmet of what..? YOU CAN'T SEE ME! STOP! REPORT TO CODERS!!"
	slowdown = 0.1

// T-45D
/obj/item/clothing/head/helmet/f13/salvaged_pa/t45d
	name = "salvaged T-45d helmet"
	desc = "It's a salvaged T-45d power armor helmet."
	icon_state = "t45dhelmet0"
	item_state = "t45dhelmet0"
	armor = list("tier" = 8, "melee" = 70, "bullet" = 70, "laser" = 60, "energy" = 15, "bomb" = 45, "bio" = 65, "rad" = 40, "fire" = 70, "acid" = 35, "wound" = 40)
	slowdown = 0.3
	flags_inv = HIDEFACIALHAIR|HIDEFACE|HIDEEYES|HIDEEARS|HIDEHAIR|HIDESNOUT

// T-51B
/obj/item/clothing/head/helmet/f13/salvaged_pa/t51b
	name = "salvaged T-51b power armor"
	desc = "It's a salvaged T-51b power armor helmet."
	icon_state = "t51bhelmet0"
	item_state = "t51bhelmet0"
	armor = list("tier" = 9, "melee" = 70, "bullet" = 70, "laser" = 60, "energy" = 20, "bomb" = 45, "bio" = 70, "rad" = 50, "fire" = 75, "acid" = 35, "wound" = 40)
	slowdown = 0.2
	flags_inv = HIDEFACIALHAIR|HIDEFACE|HIDEEYES|HIDEEARS|HIDEHAIR|HIDESNOUT

// T-60A
/obj/item/clothing/head/helmet/f13/salvaged_pa/t60
	name = "salvaged T-60a helmet"
	desc = "It's a salvaged T-60a power armor helmet."
	icon_state = "t60helmet0"
	item_state = "t60helmet0"
	armor = list("tier" = 10, "melee" = 75, "bullet" = 70, "laser" = 65, "energy" = 30, "bomb" = 55, "bio" = 70, "rad" = 60, "fire" = 80, "acid" = 35, "wound" = 45)
	slowdown = 0.1
	flags_inv = HIDEFACIALHAIR|HIDEFACE|HIDEEYES|HIDEEARS|HIDEHAIR|HIDESNOUT

//////////////////////////
// Salvaged Power Suits //
//////////////////////////

//GAMEPLAY: SALVAGED POWER ARMOR IS MEANT TO BE THE ABSOLUTE BEST SUIT OF ARMOR YOU CAN ACHIEVE AS A SIMPLE SILLY LITTLE MAN. THIS COMES AT THE PRICE OF SLOWDOWN.
//PREVIOUSLY, SALVAGED POWER ARMOR HAD /ABSOLUTELY MASSIVE/ MOVEMENT DRAWBACKS THAT MADE IT EFFECTIVELY NOT WORTH TO USE WHATSOEVER. YOU'D RATHER PICK THE MORE COMMON
//REINFORCED COMBAT ARMOR, OR BROKEN RIOT ARMOR - BECAUSE THEY HAD LITERALLY 85 LESS SLOWDOWN THAN SAID SPA IN QUESTION WHILE BEING 10 TO 15 POINTS WEAKER.
//NOW, SALVAGED POWER ARMOR SERVES ITS PURPOSE AS AN ACTUALLY VIABLE SET IN PROPER GAMEPLAY AND IS NO LONGER A GIMMICK.

/obj/item/clothing/suit/armored/f13/heavy/salvaged_pa
	name = "salvaged power armor"
	desc = "It's a set of early-model SS-13 power armor, except it isn't real. Stop looking at it, go ping coders or something. \
	It's literally not meant to be here, you are just wasting your time reading some text that someone wrote for you \
	because he thought it'd be funny, or expected someone to check GitHub for once, hello by the way. \
	If you still don't understand - it's a 'master' item, basically main type/parent object or something. \
	It isn't meant to be used, it just dictates procs and all that stuff to the subtypes, such as t45b and so on. \
	Now begone, report this to coders. NOW!"
	slowdown = 4

// T-45D
/obj/item/clothing/suit/armored/f13/heavy/salvaged_pa/t45d
	name = "salvaged T-45d power armor"
	desc = "T-45d power armor with servomotors and all valuable components stripped out of it."
	icon_state = "t45d_salvaged"
	item_state = "t45d_salvaged"
	armor = list("tier" = 8, "melee" = 70, "bullet" = 70, "laser" = 60, "energy" = 15, "bomb" = 45, "bio" = 65, "rad" = 40, "fire" = 70, "acid" = 25, "wound" = 50)
	slowdown = 2

// T-51B
/obj/item/clothing/suit/armored/f13/heavy/salvaged_pa/t51b
	name = "salvaged T-51b power armor"
	desc = "T-51b power armor with servomotors and all valuable components stripped out of it."
	icon_state = "t51b_salvaged"
	item_state = "t51b_salvaged"
	armor = list("tier" = 9, "melee" = 70, "bullet" = 70, "laser" = 60, "energy" = 20, "bomb" = 45, "bio" = 70, "rad" = 50, "fire" = 75, "acid" = 35, "wound" = 50)
	slowdown = 4

// T-60A
/obj/item/clothing/suit/armored/f13/heavy/salvaged_pa/t60
	name = "salvaged T-60a power armor"
	desc = "T-60a power armor with servomotors and all valuable components stripped out of it."
	icon_state = "t60_salvaged"
	item_state = "t60_salvaged"
	armor = list("tier" = 10, "melee" = 75, "bullet" = 70, "laser" = 65, "energy" = 30, "bomb" = 55, "bio" = 70, "rad" = 60, "fire" = 80, "acid" = 35, "wound" = 50)
	slowdown = 6
