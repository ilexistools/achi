/// @description On Step
// You can write your code in this editor
if (dragged==false)
{
	sprite_index = spr_red_disc_normal;
	exit;
}else{
	sprite_index = spr_red_disc_dragging;
	x = mouse_x; 
	y = mouse_y;
}
	

