/*
Pulled from, as of a few months ago, something original to Foundation.
As far as I'm aware, anyhow. If that's not the case, let me know.
We've repurposed this for our use, with modifications where necessary.
 - Carl
- - -
Current icons:
small - small circle
default - full size circle
boom - Jagged circle

These can be found in 'defines\sound.dm', L88 onwards.

#define SFX_ICON_SMALL "small"
#define SFX_ICON_FULL "default"
#define SFX_ICON_JAGGED "boom"
*/

/proc/show_sound_effect(turf/T, mob/source, soundicon = SFX_ICON_FULL)
	var/list/clients_to_show = list()
	var/mob/living/M

	for(M in view(7, T))
		var/client/C = M.client
		if(HAS_TRAIT(M, TRAIT_DEAF) || !C)
			continue
		clients_to_show += C

	if(!length(clients_to_show))
		return

	if(source)
		clients_to_show -= source.client

	var/image/I = image('modular_badlands/code/modules/rp_misc/audio_pings/icons/effects.dmi', loc = T, icon_state = soundicon)
	I.plane = CHAT_PLANE
	I.layer = CHAT_LAYER

	var/distance = GET_DIST_EUCLIDEAN(T, M)// + 1
	if(distance >= 6)
		I.pixel_x = rand(0, 128)
		I.pixel_y = rand(0, 128)
	else if(distance >= 4)
		I.pixel_x = rand(0, 64)
		I.pixel_y = rand(0, 64)
	else if(distance >= 2)
		I.pixel_x = rand(0, 32)
		I.pixel_y = rand(0, 32)
	else
		I.pixel_x = rand(0, 12)
		I.pixel_y = rand(0, 12)

	flick_overlay(I, clients_to_show, 6)
