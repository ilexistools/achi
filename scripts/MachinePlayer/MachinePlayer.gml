function ai_choose_move()
{
	var _valid_move = undefined;
	var _blocking_point = ai_find_blocking_move();
	var _winning_points = ai_find_winning_move();
	
	// BLOCKING
	if (_blocking_point != undefined)
	{
		// get the pos to block
		var _pos = _blocking_point.pos;
		// list player 2 objects
		var _player_objects = noone;
		if (global.pieces == 4)
		{
			_player_objects = [obj_player2_a, obj_player2_b, obj_player2_c, obj_player2_d];
		}else{
			_player_objects = [obj_player2_a, obj_player2_b, obj_player2_c];
		}
		// check which object can block
		for (var _i = 0; _i < array_length(_player_objects); _i++)
		{
			if (ai_can_move(_player_objects[_i].pos, _pos))
			{
				return [_player_objects[_i], _pos];
			}
		}
	}
	
	// TRYING TO WIN
	if (array_length(_winning_points)!= 0)
	{
		// get winning points
		var _point_win = _winning_points[0];
		var _point_1 = _winning_points[1];
		var _point_2 = _winning_points[2];
		
		// list player 2 objects
		var _player_objects = noone;
		if (global.pieces == 4)
		{
			_player_objects = [obj_player2_a, obj_player2_b, obj_player2_c, obj_player2_d];
		}else{
			_player_objects = [obj_player2_a, obj_player2_b, obj_player2_c];
		}
		// check which object can take winning point
		for (var _i = 0; _i < array_length(_player_objects); _i++)
		{
			// check if it can move to take it
			if (ai_can_move(_player_objects[_i].pos, _point_win.pos))
			{
				//check if it is not from the other winning points taken
				if (_player_objects[_i].pos != _point_1 && _player_objects[_i].pos != _point_2 )
				{
					return [_player_objects[_i],  _point_win.pos];
				}
			}
		}
	}
	
	// PLAY RANDOM
	_valid_move = ai_choose_random_move();
	return _valid_move;
}





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
	var _player_objects = noone;
	if (global.pieces == 4)
	{
		_player_objects = [obj_player2_a, obj_player2_b, obj_player2_c, obj_player2_d];
	}else{
		_player_objects = [obj_player2_a, obj_player2_b, obj_player2_c];
	}
	
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


function ai_find_blocking_move() 
{
    // Array de todas as combinações vencedoras possíveis
    var _winning_combos = [
        [obj_point1, obj_point2, obj_point3],
        [obj_point4, obj_point5, obj_point6],
        [obj_point7, obj_point8, obj_point9],
        [obj_point1, obj_point4, obj_point7],
        [obj_point2, obj_point5, obj_point8],
        [obj_point3, obj_point6, obj_point9],
        [obj_point1, obj_point5, obj_point9],
        [obj_point3, obj_point5, obj_point7]
    ];

    // Verifica se o jogador 1 está prestes a vencer
    for (var _i = 0; _i < array_length(_winning_combos); _i++) {
        var _combo = _winning_combos[_i];
        var _player1count = 0;
        var _player2count = 0;

        for (var _j = 0; _j < array_length(_combo); _j++) {
            var _point = _combo[_j];
            if (_point.player == 1) {
                _player1count++;
            }
            else if (_point.player == 2) {
                _player2count++;
            }
        }

        if (_player1count == 2 && _player2count == 0) {
            // Jogador 1 está prestes a vencer, e o jogador 2 deve bloquear essa jogada
            for (var _k = 0; _k < array_length(_combo); _k++) {
                var _point = _combo[_k];
                if (_point.player != 1 && _point.player != 2) {
                    return _point;
                }
            }
        }
    }

    // Se não houver uma jogada iminente de vitória do jogador 1, retorne null
    return null;
}

function ai_find_winning_move() 
{
    // Array de todas as combinações vencedoras possíveis
    var _winning_combos = [
        [obj_point1, obj_point2, obj_point3],
        [obj_point4, obj_point5, obj_point6],
        [obj_point7, obj_point8, obj_point9],
        [obj_point1, obj_point4, obj_point7],
        [obj_point2, obj_point5, obj_point8],
        [obj_point3, obj_point6, obj_point9],
        [obj_point1, obj_point5, obj_point9],
        [obj_point3, obj_point5, obj_point7]
    ];

    // Verifica se o jogador 2 está prestes a vencer
    for (var _i = 0; _i < array_length(_winning_combos); _i++) {
        var _combo = _winning_combos[_i];
        var _player1count = 0;
        var _player2count = 0;

        for (var _j = 0; _j < array_length(_combo); _j++) {
            var _point = _combo[_j];
            if (_point.player == 1) {
                _player1count++;
            }
            else if (_point.player == 2) {
                _player2count++;
            }
        }

        if (_player2count == 2 && _player1count == 0) {
            // Jogador 2 está prestes a vencer, e deve fazer a jogada para vencer
            for (var _k = 0; _k < array_length(_combo); _k++) {
                var _point = _combo[_k];
                if (_point.player != 1 && _point.player != 2) {
                    // Retorna um array com a jogada para vencer (primeira posição)
                    // e as duas posições já tomadas para a vitória (últimas duas posições)
                    return [_point, _combo[0], _combo[1]];
                }
            }
        }
    }

    // Se não houver uma jogada iminente de vitória do jogador 2, retorne um array vazio
    return [];
}








