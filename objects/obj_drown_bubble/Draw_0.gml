/// @description Draw and flicker
	if(image_index < image_number - 1 || image_index == image_number - 1 && global.object_timer mod 16 < 16/2)
	{
		draw_self();	
	}