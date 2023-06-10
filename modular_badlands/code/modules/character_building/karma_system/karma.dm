/mob/living/carbon/human/proc/karmaGet()
	if(!karma)
		karma = karmaPull()

	return karma

/mob/living/carbon/human/proc/karmaPull()/*
	var/db_query/query = dbcon.NewQuery("SELECT `karma` FROM `player` WHERE ckey = '[ckey]'")
	query.Execute()
	if(query.ErrorMsg() != "")
		world.log << "SQL Error: [query.ErrorMsg()]"
	else
		if(!query.NextRow())
			return 0
		return text2num(query.item[1])
*/
	return 0

/mob/living/carbon/human/proc/karmaPush()/*
	var/db_query/query = dbcon.NewQuery("UPDATE `player` SET `karma` = [karma] WHERE ckey = '[ckey]'")
	query.Execute()
*/
/mob/living/carbon/human/proc/karmaAdd(value, sound = TRUE)
	if(!karma)
		karmaGet()

	karma += value
	karmaPush()

	if(sound)
		if(value > 0)
			playsound(src, "sound/f13effects/karma_up.ogg", 100)
		else
			playsound(src, "sound/f13effects/karma_down.ogg", 100)

/mob/living/carbon/human/proc/karmaText()
	var/list/text = list (
		"<font color='#ff0000'>Karma minimum. Fiend.</font>",
		"<font color='#bf0000'>Karma step. Grifter.</font>",
		"<font color='#676767'>Karma step. Drifter.</font>",
		"<font color='#009200'>Karma step. Samaritan.</font>",
		"<font color='#486d00'>Karma maximum. Paragon.</font>"
	)

	karmaGet()

	var/from = -900
	var/step = 300
	var/result = 1

	for(var/I = 2 to 5)
		if(karma >= (I * step + from))
			result = I

	return "[text[result]]<br>"
