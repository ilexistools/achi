/// @description On Drop


var _coll_width = sprite_width/2;
var _coll_height = sprite_height/2;



if (collision_rectangle(x-_coll_width,y-_coll_width, x+_coll_width, y+_coll_height, obj_point, false, true))
{
	x = obj_point.x;
	y = obj_point.y;
}else{
	x = x_start;
	y = y_start;

}








