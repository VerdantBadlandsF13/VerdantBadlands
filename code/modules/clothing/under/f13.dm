/obj/item/clothing/under/f13
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0) //Base type has no armor as well
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	fitted = FEMALE_UNIFORM_FULL
	can_adjust = FALSE
	resistance_flags = NONE
	mutantrace_variation = NONE // Temporal fix until digitigrade-adapted sprites are done
	has_sensor = NO_SENSORS //kek

//Vault

/obj/item/clothing/under/f13/housewifedress50s
	name = "50s style dress"
	desc = "Fancy checkered yellow dress with small shoulder puffs."
	icon_state = "dress50s"
	item_state = "dress50s"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE

/obj/item/clothing/under/f13/picnicdress50s
	name = "50s style dress"
	desc = "Cheery polkadot casual dress."
	icon_state = "dresspicnic50s"
	item_state = "dresspicnic50s"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE

/obj/item/clothing/under/f13/vault
	name = "vault jumpsuit"
	desc = "A blue jumpsuit with a yellow vault pattern printed on it."
	icon_state = "vault"
	item_state = "vault"
	item_color = "vault"
	can_adjust = TRUE
	has_sensor = LOCKED_SENSORS
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 20, "acid" = 50)

//Settlers

/obj/item/clothing/under/f13/caravan
	name = "caravan pants"
	desc = "Brown thick caravaneer pants."
	icon_state = "caravan"
	item_state = "caravan"
	item_color = "caravan"

/obj/item/clothing/under/f13/settler
	name = "settler outfit"
	desc = "A crudely made cloth robe with a belt worn over grey pants."
	icon_state = "settler"
	item_state = "settler"
	item_color = "settler"

/obj/item/clothing/under/f13/rustic
	name = "rustic outfit"
	desc = "Simple rustic clothes for your day to day life in the wastes."
	icon_state = "vetranger"
	item_state = "rustictown"
	item_color = "rustictown"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 20, "acid" = 50)

//Brotherhood of Steel

/obj/item/clothing/under/f13/recon
	name = "recon armor"
	desc = "Intended to serve as the under-armor of the T-45d power armor, the recon armor is a vacuum-sealed asbestos jumpsuit covering the entire body. <br>\
	Attached to it is the interface and mounts for the power armor. <br>\
	Its purpose is twofold - it allows the user to actually operate the armor and protect soft tissue from moving parts inside the suit and heat."
	icon_state = "recon"
	item_state = "rig_suit"
	item_color = "recon"
	flags_inv = HIDEHAIR
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 30, "acid" = 40)
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HEAD
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HEAD

// Generic

/obj/item/clothing/under/f13/chaplain
	name = "Chaplain outfit"
	desc = "Apparel of a religious priest, or minister of sorts."
	icon_state = "chapblack"
	item_state = "chapblack"
	item_color = "chapblack"

/obj/item/clothing/under/f13/machinist
	name = "machinist bodysuit"
	desc = "Apparel of an old-time machinist."
	icon_state = "machinist"
	item_state = "machinist"
	item_color = "machinist"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 20, "acid" = 50)

/obj/item/clothing/under/f13/lumberjack
	name = "lumberjack outfit"
	desc = "Apparel of an old-time lumberjack."
	icon_state = "lumberjack"
	item_state = "lumberjack"
	item_color = "lumberjack"

/obj/item/clothing/under/f13/shiny
	name = "shiny outfit"
	desc = "Perfect outfit for a brave and reckless cowboy. Shiny!"
	icon_state = "shiny"
	item_state = "shiny"
	item_color = "shiny"

/obj/item/clothing/under/f13/merca
	name = "merc outfit"
	desc = "A mercenary ragtag outfit."
	icon_state = "merca"
	item_state = "merca"
	item_color = "merca"

/obj/item/clothing/under/f13/mercc
	name = "merc outfit"
	desc = "A mercenary ragtag outfit."
	icon_state = "mercc"
	item_state = "mercc"
	item_color = "mercc"

/obj/item/clothing/under/f13/cowboyb
	name = "brown cowboy outfit"
	desc = "A dirt brown cowboy outfit. Specially useful for herding brahmins."
	icon_state = "cowboyb"
	item_state = "cowboyb"
	item_color = "cowboyb"

/obj/item/clothing/under/f13/cowboyg
	name = "grey cowboy outfit"
	desc = "A dirt grey cowboy outfit. Specially useful for herding brahmins."
	icon_state = "cowboyg"
	item_state = "cowboyg"
	item_color = "cowboyg"

/obj/item/clothing/under/f13/combat_shirt
	name = "combat uniform"
	desc = "An old combat uniform, out of use around the time of the war."
	icon_state = "combat_shirt"
	item_state = "combat_shirt"
	item_color = "combat_shirt"

/obj/item/clothing/under/f13/Retro_Biker_Vest
	name = "future vest"
	desc = "A Pink Vest with Black Pants. Quite futuristic looking."
	icon_state = "Biker"
	item_state = "Biker"

/obj/item/clothing/under/f13/chinasuitcosmetic
	name = "dysfunctional chinese stealth suit"
	desc = "A matte grey set of ultralight composite above a carefully padded noise-absorbant suit. This unit, used by Chinese special forces during the great war, looks to have had it's fusion matrix removed, and is all but a fashion statement now."
	icon_state = "stealthsuit"
	item_state = "stealthsuit"

/obj/item/clothing/under/f13/erpdress
	name = "bandage dress"
	desc = "Made by the famous pre-war fashion designer Marie Calluna, this dress was made to hug your every curve and show off some deep cleavage."
	icon_state = "bandagedress"
	item_state = "bandagedress"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE

/obj/item/clothing/under/f13/classdress
	name = "classy dress"
	desc = "A dress that shows off all of your assets in the best ways, while remaining quite formal and tasteful."
	icon_state = "societydress"
	item_state = "societydress"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE

/obj/item/clothing/under/f13/bluedress
	name = "blue dress"
	desc = "A cute, but plain, common pre-war dress."
	icon_state = "blue_dress"
	item_state = "blue_dress"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE

/obj/item/clothing/under/f13/pinkdress
	name = "pink dress"
	desc = "A cute, but plain, common pre-war dress."
	icon_state = "pink_dress"
	item_state = "pink_dress"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE

/obj/item/clothing/under/f13/greendress
	name = "green dress"
	desc = "A cute, but plain, common pre-war dress."
	icon_state = "green_dress"
	item_state = "green_dress"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE

/obj/item/clothing/under/f13/blackdress
	name = "black dress"
	desc = "A dark and revealing dress that mixes formality and seduction."
	icon_state = "blackdress"
	item_state = "blackdress"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE

/obj/item/clothing/under/f13/roving
	name = "roving trader outfit "
	desc = "It's an outfit commonly worn by the roving traders."
	icon_state = "roving"
	item_state = "roving"
	item_color = "roving"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 20, "fire" = 20, "acid" = 40)

/obj/item/clothing/under/f13/raider_leather
	name = "raider leathers"
	desc = "Scraps of material thrown together and typically worn by raiders."
	icon_state = "raider_leather"
	item_state = "raider_leather"
	item_color = "raider_leather"

/obj/item/clothing/under/f13/raiderrags
	name = "raider rags"
	desc = "Fragments of clothing crudely stitched together, often worn by raiders."
	icon_state = "raiderrags"
	item_state = "raiderrags"
	item_color = "raiderrags"

//OUTLAW DESERTERS
/obj/item/clothing/under/f13/exile
	name = "disheveled Dweller jumpsuit"
	desc = "A disheveled and torn uniform resembling a Vault-Tech standard Jumpsuit."
	icon_state = "vault_exile"
	item_state = "vault_exile"
	item_color = "vault_exile"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 20, "acid" = 50)

//Prom Dress

/obj/item/clothing/under/f13/prom_dress
	name = "purple prom dress"
	desc = "This purple dress has miraculously survived the war, and seems mostly undamaged, except for a few loose ends from wear and tear. The dress is made from a soft fabric, likely a marbled velvet."
	icon_state = "promdress"
	item_state = "promdress"
	item_color = "promdress"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE

//Old World Militaries
//US Army

/obj/item/clothing/under/f13/army
	name = "US Army combat uniform"
	desc = "Standard issue combat uniform for the Army, worn by enlisted and NCOs."
	icon = 'icons/fallout/clothing/uniforms.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/uniform.dmi'
	icon_state = "army_uniform"
	item_state = "army_uniform"

/obj/item/clothing/under/f13/army/officer
	name = "US Army officer's combat uniform"
	desc = "Standard issue combat uniform for the Army, worn by officers."
	icon = 'icons/fallout/clothing/uniforms.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/uniform.dmi'
	icon_state = "army_officer"
	item_state = "army_officer"

/obj/item/clothing/under/f13/army/general
	name = "US Army officer's combat uniform"
	desc = "Standard issue combat uniform for the Army, worn by general rank officers."
	icon = 'icons/fallout/clothing/uniforms.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/uniform.dmi'
	icon_state = "army_general"
	item_state = "army_general"

//stuff ported from WW2
/obj/item/clothing/under/f13/prewar_formal_uniform
	name = "pre-war uniform"
	desc = "An old pre-war uniform repurposed for the NCR armed forces"
	icon_state = "us_uniform"
	item_state = "us_uniform"
	item_color = "us_uniform"

/obj/item/clothing/under/f13/prewar_camo
	name = "pre-war camo"
	desc = "Old pre-war camo repurposed for the NCR armed forces"
	icon_state = "nato_uniform"
	item_state = "nato_uniform"
	item_color = "nato_uniform"

/obj/item/clothing/under/f13/bdu //WalterJe military standarts.
	name = "battle dress uniform"
	desc = "A standard military Battle Dress Uniform."
	icon_state = "bdu"
	item_state = "xenos_suit"
	item_color = "bdu"
	can_adjust = TRUE

/obj/item/clothing/under/f13/dbdu
	name = "desert battle dress uniform"
	desc = "A military Desert Battle Dress Uniform."
	icon_state = "dbdu"
	item_state = "brownjsuit"
	item_color = "dbdu"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 20, "fire" = 20, "acid" = 40)
	can_adjust = TRUE

//US Navy

/obj/item/clothing/under/f13/navy
	name = "US Navy jumpsuit"
	desc = "Pre-War standard naval uniform."
	icon_state = "navy"
	item_state = "bl_suit"
	item_color = "navy"

/obj/item/clothing/under/f13/navy/officer
	name = "US Navy officer's jumpsuit"
	desc = "Pre-War standard naval uniform for ranked officers."
	icon_state = "navyofficer"
	item_state = "bl_suit"
	item_color = "navyofficer"

//People's Liberation Army

/obj/item/clothing/under/f13/chinese
	name = "PLA uniform"
	desc = "An pre-war People's Liberation Army uniform, worn by enlisted and NCOs."
	icon = 'icons/fallout/clothing/uniforms.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/uniform.dmi'
	icon_state = "chinese_soldier"
	item_state = "chinese_soldier"

/obj/item/clothing/under/f13/chinese/officer
	name = "PLA officer's uniform"
	desc = "An pre-war People's Liberation Army uniform, worn by officers."
	icon = 'icons/fallout/clothing/uniforms.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/uniform.dmi'
	icon_state = "chinese_officer"
	item_state = "chinese_officer"

//Old World Law Enforcement
//Police and State Police

/obj/item/clothing/under/f13/police
	name = "police uniform"
	desc = "You have the right to remain violent."
	icon_state = "retro_police"
	item_state = "b_suit"
	item_color = "retro_police"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 10, "fire" = 10, "acid" = 40)

/obj/item/clothing/under/f13/police/officer
	name = "police officer's uniform"
	desc = "A classic law enforcement uniform, composed of a dark navy long sleeve shirt, dark navy pants, and a black tie."
	icon = 'icons/fallout/clothing/uniforms.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/uniform.dmi'
	icon_state = "police_officer"
	item_state = "police_officer"

/obj/item/clothing/under/f13/police/lieutenant
	name = "police lieutenant's uniform"
	desc = "A classic law enforcement uniform, composed of a dark navy long sleeve shirt, dark navy pants, and a black tie."
	icon = 'icons/fallout/clothing/uniforms.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/uniform.dmi'
	icon_state = "police_lieutenant"
	item_state = "police_lieutenant"

/obj/item/clothing/under/f13/police/chief
	name = "police chief's uniform"
	desc = "A classic law enforcement uniform, composed of a dark navy long sleeve shirt, dark navy pants, and a black tie."
	icon = 'icons/fallout/clothing/uniforms.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/uniform.dmi'
	icon_state = "police_chief"
	item_state = "police_chief"

/obj/item/clothing/under/f13/police/formal
	name = "police formal uniform"
	desc = "A formal police uniform."
	icon = 'icons/fallout/clothing/uniforms.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/uniform.dmi'
	icon_state = "police_formal"
	item_state = "police_formal"

/obj/item/clothing/under/f13/police/trooper
	name = "state police uniform"
	desc = "The uniform of the State Police force, composed of a a gray long sleeve shirt, gray pants, and a black tie."
	icon = 'icons/fallout/clothing/uniforms.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/uniform.dmi'
	icon_state = "state_trooper"
	item_state = "state_trooper"

/obj/item/clothing/under/f13/police/swat
	name = "SWAT officer uniform"
	desc = "A US Army combat uniform, modified for SWAT team personnel."
	icon = 'icons/fallout/clothing/uniforms.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/uniform.dmi'
	icon_state = "army_uniform"
	item_state = "army_uniform"

// MISC OTHER STUFF

/obj/item/clothing/under/f13/batter //I guess we're going OFF limits.
	name = "worn baseball uniform"
	desc = "<b>Purification in progress...</b>"
	icon_state = "batter"
	item_state = "w_suit"
	item_color = "batter"

/obj/item/clothing/under/f13/fancy
	name = "fancy suit"
	desc = "A black and white buffalo plaid suit. Fancy!"
	icon_state = "benny"
	item_state = "white_suit"
	item_color = "benny"

/obj/item/clothing/under/f13/relaxedwear
	name = "pre-war male relaxedwear"
	desc = "A dirty long-sleeve blue shirt with a greenish brown sweater-vest and slacks."
	icon_state = "relaxedwear_m"
	item_state = "g_suit"
	item_color = "relaxedwear_m"

/obj/item/clothing/under/f13/spring
	name = "pre-war male spring outfit"
	desc = "A dirty long-sleeve beige shirt with a red sweater-vest and brown trousers."
	icon_state = "spring_m"
	item_state = "brownjsuit"
	item_color = "spring_m"

/obj/item/clothing/under/f13/formal
	name = "pre-war male formal wear"
	desc = "A black jacket with an old white shirt and dirty dark purple trousers.<br>Traditionally worn by the richest of the post-War world."
	icon_state = "formal_m"
	item_state = "judge"
	item_color = "formal_m"

/obj/item/clothing/under/f13/bodyguard
	name = "bodyguard outfit"
	desc = "A grimy pair of pre-War slacks, tie, and a dress shirt with some makeshift pauldrons made of scrap metal attached with leather straps."
	icon_state = "bodyguard"
	item_state = "sl_suit"
	item_color = "bodyguard"

/obj/item/clothing/under/f13/westender
	name = "classic tender outfit"
	desc = "A refined bartenders suit, adorned with a classic frontiersmen western tie."
	icon_state = "westender"
	item_state = "sl_suit"
	item_color = "westender"

/obj/item/clothing/under/f13/settler
	name = "settler outfit"
	desc = "A more or less a crudely made tan robe with a makeshift belt made from cloth.<br>Paired with worn grey pants."
	icon_state = "settler"
	item_state = "brownjsuit"
	item_color = "settler"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 20, "fire" = 20, "acid" = 40)

/obj/item/clothing/under/f13/mechanic
	name = "worn blue jumpsuit"
	desc = "A worn jumpsuit, made of soft-blue colored cloth, with old machine oil stains on it.<br>Long time ago it could have belonged to a repair mechanic."
	icon_state = "mechanic"
	item_state = "syndicate-blue"
	item_color = "mechanic"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 20, "fire" = 20, "acid" = 40)

/obj/item/clothing/under/f13/petrochico
	name = "worn green jumpsuit"
	desc = "A dark green colored jumpsuit, with white lines on its sleeves and a Petro-Chico patch sewn on the right breast."
	icon_state = "petrochico"
	item_state = "centcom"
	item_color = "petrochico"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 20, "fire" = 20, "acid" = 40)

/obj/item/clothing/under/f13/caravaneer
	name = "caravaneer outift"
	desc = "A striped brown shirt, with a pair of dark blue pants on suspenders.<br>That type of outfit is commonly worn by caravaneers and travelers."
	icon_state = "caravaneer"
	item_state = "syndicate-blue"
	item_color = "caravaneer"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 10, "fire" = 10, "acid" = 40)

/obj/item/clothing/under/f13/merchant
	name = "merchant outfit "
	desc = "An outfit commonly worn by various wastelanders - mostly wandering traders and merchants on the market.<br>So what do you say if I buy it from you with 10% discount?"
	icon_state = "merchant"
	item_state = "brownjsuit"
	item_color = "merchant"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 20, "fire" = 20, "acid" = 40)

/obj/item/clothing/under/f13/gentlesuit
	name = "gentlemans suit"
	desc = "A silk black shirt with a white tie and a matching gray vest and slacks. Feels proper."
	icon_state = "gentlesuit"
	item_state = "gy_suit"
	item_color = "gentlesuit"

/obj/item/clothing/under/f13/roboticistalt
	name = "roboticist's jumpsuit"
	desc = "A slimming black with bright reinforced orange seams; great for industrial work."
	icon_state = "roboticsalt"
	item_state = "jensensuit"
	item_color = "roboticsalt"
	can_adjust = TRUE

/obj/item/clothing/under/f13/bartenderalt
	name = "fancy bartender's uniform"
	desc = "A rather fancy uniform for a real professional."
	icon_state = "barmanalt"
	item_state = "bl_suit"
	item_color = "barmanalt"

/obj/item/clothing/under/f13/raiderharness
	name = "raider harness"
	desc = "A leather harness that barely covered the essentials."
	icon_state = "raiderharness"
	item_state = "raiderharness"
	item_color = "raiderharness"

/obj/item/clothing/under/f13/khan_groupie
	name = "biker getup"
	desc = "The apparel of a potentially psychotic biker. What's this even supposed to be?"
	icon_state = "marlowduds"
	item_state = "marlowduds"
	item_color = "marlowduds"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS

// GMB
/obj/item/clothing/under/f13/gmb
	name = "militia outfit"
	desc = "A neatly put together uniform, intended for the militia of the GMB. It has been fitted with the militia's patch."
	icon = 'icons/fallout/clothing/bl_mountain.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/bl_mountain.dmi'
	icon_state = "gmuniform"
	item_state = "gmuniform"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 20, "acid" = 50)

/obj/item/clothing/under/f13/gmb/officer
	name = "militia officer outfit"
	desc = "A clean cut vest, intended for higher ranking individuals within the GMB's camp. It has been fitted with the militia's patch."
	icon_state = "gmuniformvest"
	item_state = "gmuniformvest"

/obj/item/clothing/under/f13/gmb/farmhand
	name = "militia farmhand outfit"
	desc = "A pair of overalls, normally meant for civilians within the GMB's ranks. It has been fitted with the militia's patch."
	icon_state = "farmhand"
	item_state = "farmhand"

// DFS
/obj/item/clothing/under/f13/dfs
	name = "security team outfit"
	desc = "A neatly put together uniform, intended for the average grunt of the DFS. It has been fitted with the company's patch."
	icon = 'icons/fallout/clothing/bl_dfs.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/bl_dfs.dmi'
	icon_state = "dfs_uniform_grunt"
	item_state = "dfs_uniform_grunt"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 20, "acid" = 50)

/obj/item/clothing/under/f13/dfs/fire
	desc = "A neatly put together uniform, intended for the average grunt of the DFS. It has been fitted with the company's patch and a sewn in firefighter's emblem."
	icon_state = "dfs_uniform_firefighter"
	item_state = "dfs_uniform_firefighter"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 60, "acid" = 50)

// LBJ - WHY ARE THERE TWO COPIES OF ONE OBJECT ABOVE FOR LUMBERJACKS?
/obj/item/clothing/under/f13/lumberjack/lbj
	name = "lumberjack outfit"
	desc = "The apparel of a potentially psychotic lumberjack. The lights in the sky aren't real."
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 20, "acid" = 50)
