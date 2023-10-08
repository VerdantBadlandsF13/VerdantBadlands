/turf/open/proc/collapse_check()
	return

/turf/open
	var/busy = FALSE

// We only want interiors to have a collapse chance...
// Jesus, guys. What is this? My code is meant to be bad. Not yours.
// TODO: Scrap this and create an entirely new system. :(
// For now, I'll put a fix together and keep this up.
// - Carl
/turf/open/indestructible/ground/inside/collapse_check()
	spawn(50)
		var/area/A = get_area(src)
		if(!A.outdoors)
			//check for supports
			var/supportfound = FALSE
			var/supportcount = 0

			for (var/obj/structure/mine_support/RS in range(2))
				supportfound = TRUE

			for (var/turf/closed/W in range(1))
				supportfound = TRUE

			for (var/turf/TT in range(1))
				if(A.outdoors)
					supportfound = TRUE

			for (var/turf/open/indestructible/ground/inside/mountain/U in get_turf(locate(x-1,y,z)))
				supportcount++
			for (var/turf/open/indestructible/ground/inside/mountain/U in get_turf(locate(x+1,y,z)))
				supportcount++
			for (var/turf/open/indestructible/ground/inside/mountain/U in get_turf(locate(x,y+1,z)))
				supportcount++
			for (var/turf/open/indestructible/ground/inside/mountain/U in get_turf(locate(x,y-1,z)))
				supportcount++
			if (supportcount >= 3 && !supportfound)
				supportfound = TRUE

			//Without support, dangerous situations abound.
			if (!supportfound)
				if (prob(80))
					visible_message("The walls are unstable! Some rocks get loose and fall around!")
					playsound(src,'modular_badlands/code/modules/environment/sound/debris.ogg',75,0,2)
					for (var/mob/living/carbon/M in range(1, src))
						M.take_overall_damage(brute = rand(10,30), stamina = rand(45,60))
						M.adjust_blurriness(25)
					var/turf/open/indestructible/ground/inside/mountain/DT = get_turf(src)
					if (!istype(DT, /turf/open/indestructible/ground/inside/mountain))
						DT.ChangeTurf(/turf/closed/mineral/random/low_chance)
				else
					visible_message("The tunnel starts to cave in!")
					playsound(src,'modular_badlands/code/modules/environment/sound/debris.ogg',100,0,6)
					for (var/mob/living/carbon/M in range(2, src))
						M.take_overall_damage(brute = rand(31,60), stamina = rand(61,120))
						M.adjust_blurriness(25)
					for (var/turf/open/UT in range (1))
						if (!istype(UT, /turf/open/indestructible/ground/inside/mountain))
							UT.ChangeTurf(/turf/closed/mineral/random/low_chance)
					new /obj/effect/particle_effect/smoke/teargas/mine(src)
