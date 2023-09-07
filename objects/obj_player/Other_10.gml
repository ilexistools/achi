/// @description On Drop

// set rect size for collision
var _coll_width = sprite_width/2;
var _coll_height = sprite_height/2;

// set the point for testing collision
var _points = [];
_points[0] = obj_point1;
_points[1] = obj_point2;
_points[2] = obj_point3;
_points[3] = obj_point4;
_points[4] = obj_point5;
_points[5] = obj_point6;
_points[6] = obj_point7;
_points[7] = obj_point8;
_points[8] = obj_point9;

// set var for holding colliding instance
var _collision_instance = noone;

// loop to find a collision
for (var _i = 0; _i < array_length(_points); _i++)
{
    var _child_instance =_points[_i];
    
    if (collision_rectangle(x - _coll_width, y - _coll_height, x + _coll_width, y + _coll_height, _child_instance, false, true))
    {
        _collision_instance = _child_instance;
        break; // Exit the loop once a collision is found
    }
}

// change position if colliding
if (_collision_instance != noone)
{
	// colliding, got to new position
    x = _collision_instance.x;
    y = _collision_instance.y;
}
else
{
	// not colliding, back to previous position
    x = x_start;
    y = y_start;
}











