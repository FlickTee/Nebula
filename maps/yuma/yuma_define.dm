/datum/map/yuma
	name = "Yuma"
	full_name = "Yuma Arizona"
	path = "yuma"
	ground_noun = "ground"

	station_levels = list(2, 3, 4, 5, 6, 7)
	contact_levels = list(2, 3, 4, 5, 6, 7)
	player_levels = list(2, 3, 4, 5, 6, 7)
	admin_levels = list(1)
	station_name  = "Yuma, Arizona"
	station_short = "Yuma"

	dock_name     = "the Yuma Trainyard"

	lobby_screens = list('maps/yuma/lobby.png')
	welcome_sound = 'sound/effects/cowboysting.ogg'

	shuttle_docked_message = "The train has docked."
	shuttle_leaving_dock = "The train has departed from home dock."
	shuttle_called_message = "A scheduled transfer train has been sent."
	shuttle_recall_message = "The train has been recalled"
	emergency_shuttle_docked_message = "The emergency escape train has docked."
	emergency_shuttle_leaving_dock = "The emergency escape train has departed from %dock_name%."
	emergency_shuttle_called_message = "An emergency escape train has been sent."
	emergency_shuttle_recall_message = "The emergency train has been recalled"


/datum/map/yuma/get_map_info()
	return "You're in Yuma, Arizona, a hot, dusty southern town near the NCR-Legion border. \
	A multitude of different groups are interested in this area, from scavs to the Brotherhood. \
	Sandstorms are frequent."