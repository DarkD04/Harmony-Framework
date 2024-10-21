function on_screen(RegionW = 16, RegionH = 16) {
	var c, cx, cy, sw, sh;
	c = view_camera[view_current]
	cx = camera_get_view_x(c)
	cy = camera_get_view_y(c)
	sw = global.window_width;
	sh = global.window_height;
 
	if(bbox_right > cx-RegionW && bbox_left < cx + sw +  RegionW && bbox_bottom > cy - RegionH && (bbox_top < cy + sh+RegionH)) 
	{
		return true;
	}
	else return false;
}


function origin_on_screen(origin_x = xstart, origin_y = ystart, RegionW = 16, RegionH = 16) {
	var c, cx, cy, sw, sh;
	c = view_camera[view_current]
	cx = camera_get_view_x(c)
	cy = camera_get_view_y(c)
	sw = global.window_width;
	sh = global.window_height;
 
	if(origin_x > cx-RegionW && origin_x < cx + sw +  RegionW && origin_y > cy - RegionH && (origin_y < cy + sh+RegionH)) 
	{
		return true;
	}
	else return false;
}