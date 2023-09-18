/// @description Player 1 Wins

global.player1_score+=1;
global.player_turn = 0;
audio_play_sound(snd_point_win,10,false);
alarm_set(1, 80);









