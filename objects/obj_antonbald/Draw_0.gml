/// @description Insert description here
// You can write your code in this editor
	angle = (angle+2)mod 90
	var rgb1 = make_color_rgb(255*dcos(angle), 255*dcos(angle), 255*dcos(angle))
	draw_sprite_ext(sprite_index, 0, x + 32* dsin(angle), y, dcos(angle), 1, 0, rgb1, 1)
	rgb1 = make_color_rgb(255*dcos(angle-90), 255*dcos(angle-90), 255*dcos(angle-90))
	draw_sprite_ext(sprite_index, 0, x + 32* dsin(angle-90), y, dcos(angle-90), 1, 0, rgb1, 1)