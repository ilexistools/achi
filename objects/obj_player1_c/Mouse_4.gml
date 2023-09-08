/// @description Drag
// You can write your code in this editor

if (global.player_turn == 0)
{
	dragged = true;
	x = mouse_x;
	y = mouse_y;
	if (global.sound_enabled == true)
	{
		audio_play_sound(snd_drag, 10,false);
	}
}