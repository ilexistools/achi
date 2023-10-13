/// @description Drag
// You can write your code in this editor

if (global.player_turn == 1) // Player 2 turn
{
	if (global.game_mode == 2) // Human playing
	{
		dragged = true;
		x = mouse_x;
		y = mouse_y;
		if (global.sound_enabled == true)
		{
			audio_play_sound(snd_drag, 10,false);
		}
	}
}