function draw_background_sprite(sprite, factor_x, factor_y, subimg, offset_x, offset_y, vertical_tile = false){

  	var Width, Height, Left, Right, Bottom;
 
	Width = sprite_get_width(sprite);
	Height = sprite_get_height(sprite);
	Left  = -1;
	Right = camera_get_view_x(view_camera[view_current])/Width+global.window_width/Width+2;
	Bottom = camera_get_view_y(view_camera[view_current])/Height+global.window_height/Height+2;
	
	for(var i = Left; i <= Right; i++)
	{
		
	}
	//Draw horizontal background only
	/*if(!vertical_tile)
	{
		for(var i = Left; i <= Right; i++)
		{
		    draw_sprite(sprite, subimg, ((camera_get_view_x(view_camera[view_current])*factor_x)+offset_x) mod Width+Width*i, ((camera_get_view_y(view_camera[view_current])+(room_height-global.window_height)*(1-factor_y))*factor_y));
		}
	}else
		{
		//Draw horizontal background only
		for(var i = Left; i <= Right; i++)
		{
			for(var j = -1; j <= Bottom; j++)
			{
				draw_sprite(sprite, subimg, ((camera_get_view_x(view_camera[view_current])*factor_x)+offset_x) mod Width+Width*i, ((camera_get_view_y(view_camera[view_current])*factor_y)+offset_y) mod Height+Height*j);
			}
		}
	}*/
}