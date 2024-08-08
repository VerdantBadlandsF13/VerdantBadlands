/*
This file contains stuff. Things, even.
All related to viewing job specifics easier.
*/

/*
The actual information.
*/
/datum/job/proc/ShowJobStuff(mob/M)
	var/list/dat = list("")

	dat += "<h1>Special Information</h1>"

	dat += "\n<br><b>- - - - - -</b><br>"

	if(description)
		dat += "<b>[description]</b></font>"
	else
		dat += "<FONT color='blue'><b>Your job has no description. This is a bug. Tell Carl.</b></font>"

	dat += "\n<br><b>- - - - - -</b><br>"

	if(forbids)
		dat += "<FONT color='red'><b>[forbids]</b></font>"
	else
		dat += "<FONT color='blue'><b>Your job has no forbidden actions. This is a bug. Tell Carl.</b></font>"

	dat += "\n<br><br>"

	if(enforces)
		dat += "<FONT color='green'><b>[enforces]</b></font>"
	else
		dat += "<FONT color='blue'><b>Your job has no enforced actions. This is a bug. Tell Carl.</b></font>"

	dat += "\n<br><b>- - - - - -</b><br>"

	if(req_admin_notify)
		dat += "<FONT color='yellow'><b>You are playing a job that is important for Game Progression. \
		If you have to disconnect immediately, please notify the admins via adminhelp. \
		Otherwise put your locker gear back into the spawn location and head to a matrix.</b></font>"

		dat += "\n<br><b>- - - - - -</b><br>"

	if(roleplay_exclusive_notify)
		dat += "<FONT color='yellow'><b>You are playing a job that is important for roleplay. \
		In the event of an offensive raid, you are not permitted to participate in an attack. \
		Please refrain from running dungeons when possible.</b></font>"

		dat += "\n<br><b>- - - - - -</b><br>"

	var/datum/browser/popup = new(M, "mob_occupation", "Special Information", 640, 400) // Set up the popup browser window
	popup.set_content(dat.Join())
	popup.open()


//	to_chat(M, "[dat.Join()]")

/*
This is the proc used to display the above.
*/
/datum/job/proc/job_help_message(mob/M)
	to_chat(M, "<span class='boldannounce'>Your role in the wasteland has additional information attached to it. <a href=?src=[REF(src)];ShowJobStuff=1>(Click Here)</a></span>")

/datum/job/Topic(href, href_list)
	if(href_list["ShowJobStuff"])
		ShowJobStuff(usr)
