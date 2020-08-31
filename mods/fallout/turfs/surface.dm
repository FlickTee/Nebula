//open/floor turfs

/turf/simulated/floor/wasteland
	icon = 'mods/fallout/icons/rebase/turfs/wasteland.dmi'

/turf/simulated/floor/wasteland/desert
	icon_state = "wasteland"

/turf/simulated/floor/wasteland/desert/on_update_icon()
	cut_overlays()
	if(prob(8))
		add_overlay(image('icons/turf/flooring/decals.dmi', "asteroid[rand(0,9)]"))
		return
	if (prob(5))
		add_overlay(image('mods/fallout/icons/flora/flora.dmi', "tall_grass_[rand(1,8)]"))
		return

	if (prob(3))
		add_overlay(image('icons/obj/flora/ausflora.dmi', "[pick("first","leafy","reed","pale","stalky","grassy")]bush_[rand(1,3)]"))
		return

	if(prob(25))
		icon_state = "wasteland[rand(1,33)]"

/turf/simulated/floor/wasteland/desert/Initialize()
	. = ..()
	update_icon()






/turf/simulated/floor/wasteland/dirt
	icon_state = "dirt"


/turf/simulated/floor/wasteland/grass
/turf/simulated/floor/wasteland/grass/dry

/turf/simulated/floor/wasteland/asphalt
/turf/simulated/floor/wasteland/asphalt/middle
/turf/simulated/floor/wasteland/asphalt/cracked

/turf/simulated/floor/wasteland/rubble


/turf/simulated/floor/wasteland/beach
/turf/simulated/floor/wasteland/river
/turf/simulated/floor/wasteland/river/shallow
/turf/simulated/floor/wasteland/river/deep



/turf/simulated/floor/wasteland/forest
/turf/simulated/floor/wasteland/snow


