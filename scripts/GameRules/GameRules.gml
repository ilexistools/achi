// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// Check rules if player can move
/// @param _current_pos is the current point position 
/// @param _target_pos is the target point position
/// @return Returns true if the player can move, false otherwise
function can_move(_current_pos, _target_pos)
{
	var _element =  string(_current_pos) + string(_target_pos);	
    var _numbers = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "12", "15", "14", "23", "25", "21", "36", "35", "32", "45", "47", "41", "51", "52", "53", "56", "59", "58", "57", "54", "63", "69", "65", "74", "75", "78", "87", "85", "89", "96", "95", "98"];
    var _array_length = array_length(_numbers);
    
    for (var _i = 0; _i < _array_length; _i++)
    {
        if (_numbers[_i] == _element)
        {
            return true; // Element found in the array
        }
    }
    
    return false; // Element not found in the array
}


function is_aligned(_parent, _obj1, _obj2, _obj3)
{
	var _res = 0;
	if (collision_point(obj1.x, obj1.y, _parent, false, true)!= noone)
	{
		_res += 1;
	}
	if (collision_point(obj2.x, obj2.y, _parent, false, true)!= noone)
	{
		_res += 1;
	}
	if (collision_point(obj3.x, obj3.y, _parent, false, true)!= noone)
	{
		_res += 1;
	}
	if (_res == 3)
	{
		return true;
	}else{
		return false;
	}
}

function check_player_win(_player_number)
{
	// ["123","456","789","147","258","369","159","357"];
	
	
	if (obj_point1.player == _player_number && obj_point2.player== _player_number  && obj_point3.player==_player_number)
	{
		return true;
	}
	if (obj_point4.player == _player_number && obj_point5.player== _player_number  && obj_point6.player==_player_number)
	{
		return true;
	}
	if (obj_point7.player == _player_number && obj_point8.player== _player_number  && obj_point9.player==_player_number)
	{
		return true;
	}
	if (obj_point1.player == _player_number && obj_point4.player== _player_number  && obj_point7.player==_player_number)
	{
		return true;
	}
	if (obj_point2.player == _player_number && obj_point5.player== _player_number  && obj_point8.player==_player_number)
	{
		return true;
	}
	if (obj_point3.player == _player_number && obj_point6.player== _player_number  && obj_point9.player==_player_number)
	{
		return true;
	}
	if (obj_point1.player == _player_number && obj_point5.player== _player_number  && obj_point9.player==_player_number)
	{
		return true;
	}
	if (obj_point3.player == _player_number && obj_point5.player== _player_number  && obj_point7.player==_player_number)
	{
		return true;
	}
	return false;
}