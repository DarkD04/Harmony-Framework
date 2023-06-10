/// @description Draw 3D Sign
	
	//Draw the main
	draw_sprite(spr_signpost_base, 0, floor(x), floor(y));
	
	//Draw fake 3d cube
	draw_sprite_ext(spr_signpost_eggman, 0, floor(x) + 4 * dsin(angle), floor(y) - 31, max(dcos(angle), 0), 1, 0, c_white, 1);
	draw_sprite_ext(spr_signpost_char, global.character, floor(x) + 4 * dsin(angle+180), floor(y) - 31, max(dcos(angle+180), 0), 1, 0, c_white, 1);
	draw_sprite_ext(spr_signpost_side, 0, floor(x) + 24 * dsin(angle + 90), floor(y) - 31, max(dcos(angle + 90), 0), 1, 0, c_white, 1);
	draw_sprite_ext(spr_signpost_side, 0, floor(x) + 24 * dsin(angle - 90), floor(y) - 31, max(dcos(angle - 90), 0), 1, 0, c_white, 1);