/// @description Background switch using camera position

	var cx, cy, collide;
	cx = camera_get_view_x(view_camera[view_current])+global.window_width/2;
	cy = camera_get_view_y(view_camera[view_current])+global.window_height/2;
	collide = point_in_rectangle(cx,cy,bbox_left,bbox_top,bbox_right,bbox_bottom);
	
	if collide obj_aaz_bg.bg_mode = bg_mode;