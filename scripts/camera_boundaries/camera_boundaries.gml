function camera_boundaries(){
	//Screen values
	var c, cx, cy, sw, sh;
	c = view_camera[view_current]
	cx = camera_get_view_x(c)
	cy = camera_get_view_y(c)
	sw = global.window_width;
	sh = global.window_height;
		
	//Limit bottom
	if(limit_bottom > target_bottom)
	{
		limit_bottom = camera_y + center_y;
		limit_bottom -= 2;
		limit_bottom = max(target_bottom, limit_bottom);
	}
	
	if(limit_bottom < target_bottom)
	{
		limit_bottom += 2;
		limit_bottom = min(target_bottom, limit_bottom);
	}
	
	if(limit_bottom > cy + sh + 16) limit_bottom = target_bottom;
	
	//Limit top
	if(limit_top < target_top)
	{
		limit_top = camera_y - center_y;
		limit_top += 2;
		limit_top = min(target_top, limit_top);
	}
	
	if(limit_top > target_top)
	{
		limit_top -= 2;
		limit_top = max(target_top, limit_top);
	}
	
	if(limit_top < cy - 16) limit_top = target_top;
	
	//Limit left
	if(limit_left < target_left)
	{
		limit_left = camera_x - center_x;
		limit_left += 2;
		limit_left = min(target_left, limit_left);
	}
	
	if(limit_left > target_left)
	{
		limit_left -= 2;
		limit_left = max(target_left, limit_left);
	}
	
	if(limit_left < cx - 16) limit_left = target_left;
	
	//Limit right
	if(limit_right > target_right)
	{
		limit_right = camera_x + center_x;
		limit_right -= 2;
		limit_right = max(target_right, limit_right);
	}
	
	if(limit_right < target_right)
	{
		limit_right += 2;
		limit_right = min(target_right, limit_right);
	}
	
	if(limit_right > cx + sw + 16) limit_right = target_right;
}