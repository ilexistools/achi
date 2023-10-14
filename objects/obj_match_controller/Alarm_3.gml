/// @description Machine plays


if (global.player_turn == 1)
{
	var _valid_moves = ai_choose_move();
	var _object = _valid_moves[0];
	var _move =  _valid_moves[1];
	var _point = ai_get_point_by_pos(_move);
	var _previous_point = ai_get_point_by_pos(_object.pos);
	
	if (_previous_point != noone)
	{
		_previous_point.player = 0;
	}
	
	_object.x = _point.x;
	_object.y = _point.y;
	_object.pos =_point.pos;
	_object.x_start = _object.x;
	_object.y_start = _object.y;
	_point.player = 2;
	
	// play drog sound
	if (global.sound_enabled==true)
	{
		audio_play_sound(snd_drop, 10,false);
	}
	
	// change turn 
	global.player_turn = 0;
	
	// check win
	if (check_player_win(2)==true)
	{
		event_user(2);
	}

}


