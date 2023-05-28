/// @description Draw debug
	draw_set_alpha(0.75);
	var sprite = object_get_sprite(object_list[object_select]);
	draw_sprite(sprite, 0, mouse_x, mouse_y);
	draw_set_alpha(1);