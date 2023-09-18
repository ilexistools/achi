/// @description Draw score



draw_self();
draw_set_color(c_black);
draw_set_font(fnt_score);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x-12,y+18, string(global.player2_score));