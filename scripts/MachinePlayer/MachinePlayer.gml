/// Check rules if player can move
/// @param _current_pos is the current point position 
/// @param _target_pos is the target point position
/// @return Returns true if the player can move, false otherwise
function ai_can_move(_current_pos, _target_pos)
{
	var _element =  string(_current_pos) + string(_target_pos);	
    var _numbers = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "12", "15", "14", "23", "25", "21", "36", "35", "32", "45", "47", "41", "51", "52", "53", "56", "59", "58", "57", "54", "63", "69", "65", "74", "75", "78", "87", "85", "89", "96", "95", "98"];
    var _array_length = array_length(_numbers);
	var _target_free = ai_is_point_free(_target_pos);
	
	if (_target_free == true)
	{
	    for (var _i = 0; _i < _array_length; _i++)
	    {
	        if (_numbers[_i] == _element)
	        {
	            return true; // Element found in the array
	        }
	    }
	}
    
    return false; // Element not found in the array
}

/// Função para obter todas as posições válidas para um objeto do jogador máquina
/// @param _player_object é o objeto do jogador máquina
/// @return Retorna um array de posições válidas
function ai_get_valid_moves(_player_object)
{
    var _valid_moves = []; // Cria um array para armazenar as posições válidas
    var _current_pos = _player_object.pos; // Obtém a posição atual do objeto
    // Loop através das posições de destino possíveis (de 1 a 9)
    for (var _target_pos = 1; _target_pos <= 9; _target_pos++)
    {
        // Verifica se a jogada é válida usando a função can_move
        if (ai_can_move(_current_pos, string(_target_pos)))
        {
            // Adicione a posição válida ao array de posições válidas
            array_push(_valid_moves, _target_pos);
        }
    }
    return _valid_moves; // Retorna o array de posições válidas
}

/// Função para a IA escolher uma jogada aleatória
/// @return Retorna um array com [objeto, posição]
function ai_choose_random_move()
{
    // Lista de objetos do jogador máquina
	var _player_objects = [obj_player2_a, obj_player2_b, obj_player2_c, obj_player2_d];
	
	// Filtra movimentos válidos 
	var _objects_with_valid_moves = [];
	for (var _i = 0; _i < array_length(_player_objects); _i++)
    {
        var _player_object = _player_objects[_i];
        var _valid_moves = ai_get_valid_moves(_player_object);
        
        if (array_length(_valid_moves) > 0)
        {
			var _random_move_index = undefined
			 _random_move_index = irandom(array_length(_valid_moves) - 1);
			 array_push(_objects_with_valid_moves, [_player_object, _valid_moves[_random_move_index]]);
        }
    }
	
	// Retorna jogador e movimento
	var _random_index = irandom(array_length(_objects_with_valid_moves)-1);
	return _objects_with_valid_moves[_random_index];
}



function ai_is_point_free(_point_pos)
{
	var _is_free = false;
	var _point = undefined;
	switch (_point_pos)
	{
		case 1:
		_point = obj_point1;
		break;
		case 2:
		_point = obj_point2;
		break;
		case 3:
		_point = obj_point3;
		break;
		case 4:
		_point = obj_point4;
		break;
		case 5:
		_point = obj_point5;
		break;
		case 6:
		_point = obj_point6;
		break;
		case 7:
		_point = obj_point7;
		break;
		case 8:
		_point = obj_point8;
		break;
		case 9:
		_point = obj_point9;
		break;
	}
	
	if (_point.player == 0)
	{
		_is_free = true;
	}
	
	return _is_free;
}

function ai_get_point_position(_point_pos)
{
    var _position = undefined; // Inicializa a variável _position como undefined

    switch (_point_pos)
    {
        case 1:
            _position = [obj_point1.x, obj_point1.y];
            break;
        case 2:
            _position = [obj_point2.x, obj_point2.y];
            break;
        case 3:
            _position = [obj_point3.x, obj_point3.y];
            break;
        case 4:
            _position = [obj_point4.x, obj_point4.y];
            break;
        case 5:
            _position = [obj_point5.x, obj_point5.y];
            break;
        case 6:
            _position = [obj_point6.x, obj_point6.y];
            break;
        case 7:
            _position = [obj_point7.x, obj_point7.y];
            break;
        case 8:
            _position = [obj_point8.x, obj_point8.y];
            break;
        case 9:
            _position = [obj_point9.x, obj_point9.y];
            break;
    }

    return _position;
}

function ai_get_point_by_pos(_point_pos)
{
	
	var _point = undefined;
	switch (_point_pos)
	{
		case 0:
		_point = noone;
		break;
		case 1:
		_point = obj_point1;
		break;
		case 2:
		_point = obj_point2;
		break;
		case 3:
		_point = obj_point3;
		break;
		case 4:
		_point = obj_point4;
		break;
		case 5:
		_point = obj_point5;
		break;
		case 6:
		_point = obj_point6;
		break;
		case 7:
		_point = obj_point7;
		break;
		case 8:
		_point = obj_point8;
		break;
		case 9:
		_point = obj_point9;
		break;
		
	}
	return _point;
}








