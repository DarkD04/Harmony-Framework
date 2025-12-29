/// @description Culling
	//Screen values
	var c, cx, cy, sw, sh;
	c = view_camera[view_current]
	cx = camera_get_view_x(c)
	cy = camera_get_view_y(c)
	sw = global.window_width;
	sh = global.window_height;

	instance_activate_region(obj_player.x - 64, obj_player.y - 64, 128, 128, true);
	instance_activate_region(cx - 64, cy- 64, sw+64, sh+64, true);