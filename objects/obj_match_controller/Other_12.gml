/// @description Player 2 Wins

global.player2_score+=1;
global.player_turn = 1;
audio_play_sound(snd_point_win,10,false);
alarm_set(2, 180);