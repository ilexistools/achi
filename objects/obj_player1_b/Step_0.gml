/// @description On Step
// You can write your code in this editor
if (dragged==false)
{
	if (global.player_turn == 0)
	{
		if (sprite_index != spr_red_disc_star)
		{
			sprite_index = spr_red_disc_star;
		}
	}else{
		if (sprite_index != spr_red_disc_normal)
		{
			sprite_index = spr_red_disc_normal;
		}
	}
	
	depth = 0;
	exit;
}else{
	if (sprite_index != spr_red_disc_dragging)
	{
		sprite_index = spr_red_disc_dragging;
	}
	depth = -1;
	x = mouse_x; 
	y = mouse_y;
}
	
