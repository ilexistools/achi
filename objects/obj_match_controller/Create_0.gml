/// @description Insert description here
// You can write your code in this editor

global.player_turn = 0;

// set turn randomly
global.player_turn = round(random_range(0,1));

if (global.player_turn == 1)
{
	// call machine ai 
	with (obj_match_controller)
	{
		event_user(3);
	}
}


audio_stop_all();

