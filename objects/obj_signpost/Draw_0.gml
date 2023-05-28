/// @description Draw 3D Sign
	
	//Draw the main
	draw_self();
	
	//Draw fake 3d cube
	draw_sprite_ext(spr_signpost_eggman, 0, x + 4 * dsin(angle), y - 31, max(dcos(angle), 0), 1, 0, c_white, 1);
	draw_sprite_ext(spr_signpost_char, 0, x + 4 * dsin(angle+180), y - 31, max(dcos(angle+180), 0), 1, 0, c_white, 1);
	draw_sprite_ext(spr_signpost_side, 0, x + 24 * dsin(angle + 90), y - 31, max(dcos(angle + 90), 0), 1, 0, c_white, 1);
	draw_sprite_ext(spr_signpost_side, 0, x + 24 * dsin(angle - 90), y - 31, max(dcos(angle - 90), 0), 1, 0, c_white, 1);