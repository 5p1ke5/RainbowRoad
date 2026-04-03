// @description Displays text on how to display the game.
draw_set_halign(fa_center);
draw_set_font(fnt_default);
draw_text_transformed_color(window_get_width()/2, window_get_height()/16, "Warning: A save file exists. Starting a new game will overwrite this file.\nStart a new game anyhow?\nSave file located at:\n" + filename_dir(SAVEFILE), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

menu_draw_transformed(window_get_width()/2, window_get_height()/2, options, c_white, c_gray, window_get_height()/16, optionSelected, 2, 2, 0);