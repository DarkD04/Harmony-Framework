/// @description Insert description here
// You can write your code in this editor

	/// @description Draw dev menu
	//Hope this works
	gpu_set_blendenable(false);

	var c, cx, cy, sw, sh;
	c = view_camera[view_current];
	cx = camera_get_view_x(c);
	cy = camera_get_view_y(c);
	sw = global.window_width;
	sh = global.window_height;
	draw_sprite(backgroundimage, 0, cx, cy);
	
	//It does!
	gpu_set_blendenable(true);
	
	//Draw background
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(cx, cy, cx+sw, cy+sh, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	