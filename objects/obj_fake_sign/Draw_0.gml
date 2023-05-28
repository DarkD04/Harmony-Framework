/// @description Draw the faker
	//Dont animate the shadows
	image_speed = 0;
	image_index = 0;
	
	//Draw main
	draw_self();
	
	//Draw front
	draw_sprite_ext(spr_signpost_char, 0, x, y - 31, 1, 1, 0, c_white, 1);